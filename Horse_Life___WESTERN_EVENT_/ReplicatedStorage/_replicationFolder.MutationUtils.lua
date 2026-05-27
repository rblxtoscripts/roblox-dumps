-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("Constants")
local v2 = Sonar("DataUtils")
local v3 = Sonar("WeightedProbability")
local v4 = Sonar("ItemDataService")
local ReplicatedObjectModels = game.ReplicatedStorage.Storage.Assets.ReplicatedObjectModels
local t = {}
local t2 = {}
for v5, v6 in {
	v1.Mutations,
	v1.Wings,
	v1.Glow,
	v1.EventMutations
} do
	for v7, v8 in v6 do
		v8.Description = v1.MutationDescriptions[v8.Type] or v8.Description
		v8.Image = v8.Image or v1.MutationImages[v8.Type]
		t2[v7] = v8
		t[v7] = v8
	end
end
v1.Mutations = t2
local t3 = {
	Mutations = t2,
	AllObtainableMutations = t,
	GetEmptyMutationSlot = function(p1) --[[ Line: 35 ]]
		for v1, v2 in p1.Mutations:GetChildren() do
			if #v2.Value <= 0 or v2.Value == "Nothing" then
				return v2
			end
		end
	end,
	GetPotentialRandomMutationOfType = function(p1, p2) --[[ Line: 43 | Upvalues: t2 (copy) ]]
		local t = {}
		for k, v in pairs(t2) do
			if v.Type == p1 and not v.ExcludeFromDrops then
				t[k] = v
			end
		end
		if p2 then
			for v1, v2 in p2.Mutations:GetChildren() do
				if v2.Value and (v2.Value ~= "" and v2.Value ~= "Nothing") then
					t[v2.Value] = nil
				end
			end
		end
		return t
	end,
	GetRandomMutationOfType = function(p1, p2) --[[ Line: 63 | Upvalues: t2 (copy), v3 (copy) ]]
		local t = {}
		for k, v in pairs(t2) do
			if v.Type == p1 and not v.ExcludeFromDrops then
				t[k] = v
			end
		end
		if p2 then
			for v1, v2 in p2.Mutations:GetChildren() do
				if v2.Value and (v2.Value ~= "" and v2.Value ~= "Nothing") then
					t[v2.Value] = nil
				end
			end
		end
		return v3.getRandomWeightedItem(t)
	end
}
function t3.GetRandomMutation(p1, p2, p3) --[[ Line: 80 | Upvalues: t (copy), v4 (copy), t3 (copy), v3 (copy) ]]
	local v2 = p3 or {}
	local v32 = v2.MutationChances or {}
	local v42 = table.clone(t)
	if v2.MutationChancesWhitelist then
		for v5, v6 in v42 do
			local v7 = v32[v5] or v32[v6.Type]
			if not v7 or v7 == 0 then
				v42[v5] = nil
			end
		end
	end
	local v8 = v4.GetByName(p1.Species.Value)
	if v8 and (not v2.IgnoreWingWhitelist and v8.WildWingWhitelist) then
		for v9, v10 in v42 do
			if (not v2.MutationNameToRoll or v9 ~= v2.MutationNameToRoll) and (v10.Type == "Wings" and not v8.WildWingWhitelist[v9]) then
				v42[v9] = nil
			end
		end
	end
	local t2 = {}
	local v11 = false
	for v12, v13 in p1.Mutations:GetChildren() do
		if v13.Value and (v13.Value ~= "" and v13.Value ~= "Nothing") then
			t2[v13.Value] = true
			local v14 = t3.GetMutation(v13.Value)
			if v14 and v14.Type == "Wings" then
				v11 = true
			end
		end
	end
	for v15, v16 in v42 do
		if v16.SpeciesWhitelist and not v16.SpeciesWhitelist[p1.Species.Value] then
			v42[v15] = nil
		end
	end
	local count = 0
	local v17 = nil
	local function pick() --[[ pick | Line: 160 | Upvalues: count (ref), v17 (ref), v3 (ref), v42 (copy), p2 (copy), t3 (ref), v2 (ref), p1 (copy), v32 (copy), v11 (ref), t2 (copy) ]]
		count = count + 1
		v17 = v3.getRandomWeightedItem(v42, p2, function(p12_2, p2_2) --[[ Line: 162 | Upvalues: t3 (ref), v2 (ref), p1 (ref), v32 (ref), v11 (ref), t2 (ref) ]]
			local v1 = t3.GetMutation(p12_2.Name)
			if v2.MutationNameToRoll then
				if v1.Name == v2.MutationNameToRoll then
					return 100
				else
					return 0, true
				end
			else
				if v1.ExcludeFromDrops == true then
					if not v1.SpeciesWhitelist then
						return 0, true
					end
					if not v1.SpeciesWhitelist[p1.Species.Value] then
						return 0, true
					end
				end
				if type(v1.ExcludeFromDrops) == "string" and p1.Species.Value ~= v1.ExcludeFromDrops then
					return 0, true
				end
				if v2.MutationTypeToRoll and v1.Type ~= v2.MutationTypeToRoll then
					return 0, true
				end
				local v22 = v32[v1.Name] or v32[v1.Type]
				if v22 and v22 == 0 then
					return 0, true
				end
				if not v22 and v22 == 0 then
					return 0, true
				end
				if v1.Type == "Wings" and v11 then
					return 0, true
				end
				if t2[v1.Name] then
					return 0, true
				end
				return if v22 then v22 else v32.Default or 0
			end
		end)
		return true
	end
	repeat
		count = count + 1
		v17 = v3.getRandomWeightedItem(v42, p2, function(p12_2, p2_2) --[[ Line: 162 | Upvalues: t3 (ref), v2 (ref), p1 (copy), v32 (copy), v11 (ref), t2 (copy) ]]
			local v1 = t3.GetMutation(p12_2.Name)
			if v2.MutationNameToRoll then
				if v1.Name == v2.MutationNameToRoll then
					return 100
				else
					return 0, true
				end
			else
				if v1.ExcludeFromDrops == true then
					if not v1.SpeciesWhitelist then
						return 0, true
					end
					if not v1.SpeciesWhitelist[p1.Species.Value] then
						return 0, true
					end
				end
				if type(v1.ExcludeFromDrops) == "string" and p1.Species.Value ~= v1.ExcludeFromDrops then
					return 0, true
				end
				if v2.MutationTypeToRoll and v1.Type ~= v2.MutationTypeToRoll then
					return 0, true
				end
				local v22 = v32[v1.Name] or v32[v1.Type]
				if v22 and v22 == 0 then
					return 0, true
				end
				if not v22 and v22 == 0 then
					return 0, true
				end
				if v1.Type == "Wings" and v11 then
					return 0, true
				end
				if t2[v1.Name] then
					return 0, true
				end
				return if v22 then v22 else v32.Default or 0
			end
		end)
		local v18 = true
		if not v18 then
			v17 = nil
		end
	until v18 or count >= 10
	if not v17 then
		warn("No mutation choice can be found, setting to Nothing")
	end
	if not v17 then
		v17 = "Nothing"
	end
	return v17
end
function t3.GetMutation(p1) --[[ Line: 237 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t3.GetRandomMutationSlots(p1, p2, p3, p4) --[[ Line: 241 | Upvalues: v4 (copy), v1 (copy), v3 (copy), v2 (copy) ]]
	local v12 = v4.GetByType(p1.Species.Value, "Animals")
	if v12 and v12.ToyHorse then
		return {}
	end
	local v22 = if p1.Species.Value == "Peryton" then 1 else 0
	local t = {}
	local v42 = table.clone(if p3 then p3 else v1.WildMutationSlotChances)
	if typeof(p4) ~= "number" then
		local v5 = if #v42 == 1 then 1 else nil
		local v6, v7
		if v5 then
			v6 = v5
			v7 = v42
		else
			v6 = v3.getRandomWeightedItem(v42, p2)
			v7 = v42
		end
		p4 = v7[v6].Amount
	end
	for i = 1, math.clamp(p4 or 0, v22, 3) do
		local v8 = p1.Mutations:FindFirstChild(i) or v2.CreateDataValueFromType("Mutations")
		v8.Level.Value = 1
		v8.Name = i
		v8.Value = ""
		v8.Parent = p1.Mutations
		table.insert(t, v8)
	end
	return t
end
function t3.GetMutationOfType(p1, p2) --[[ Line: 278 | Upvalues: t2 (copy) ]]
	for k, v in pairs(p1:WaitForChild("Mutations"):GetChildren()) do
		local v1 = t2[v.Value]
		if v1 and v1.Type == p2 then
			return v1, v
		end
	end
end
function t3.GetAllMutationsFromSlot(p1) --[[ Line: 288 | Upvalues: t2 (copy) ]]
	local t = {}
	for k, v in pairs(p1:WaitForChild("Mutations"):GetChildren()) do
		local v1 = t2[v.Value]
		if v1 then
			t[v1.Name] = v1
		end
	end
	return t
end
function t3.HasMutation(p1, p2) --[[ Line: 299 | Upvalues: t2 (copy) ]]
	for k, v in pairs(p1:WaitForChild("Mutations"):GetChildren()) do
		local v1 = t2[v.Value]
		if v1 and v1.Name == p2 then
			return true
		end
	end
	return false
end
function t3.GetAllWings() --[[ Line: 311 | Upvalues: t2 (copy) ]]
	local t = {}
	for v1, v2 in t2 do
		if v2.Type == "Wings" then
			t[v1] = v2
		end
	end
	return t
end
function t3.GetMutationOfName(p1, p2) --[[ Line: 321 | Upvalues: t2 (copy) ]]
	for k, v in pairs(p1:WaitForChild("Mutations"):GetChildren()) do
		local v1 = t2[v.Value]
		if v1 and v1.Name == p2 then
			return v1, v
		end
	end
end
function t3.GetAllMutations() --[[ Line: 331 | Upvalues: t2 (copy) ]]
	return t2
end
function t3.Init(p1) --[[ Init | Line: 335 | Upvalues: t2 (copy), ReplicatedObjectModels (copy) ]]
	for k, v in pairs(t2) do
		if v.Type then
			local v1 = ReplicatedObjectModels:FindFirstChild(v.Type)
			if v1 then
				v.Model = v1:FindFirstChild(k)
			end
		end
	end
end
t3:Init()
return t3