-- https://lua.expert/
local RunService = game:GetService("RunService")
local t = {}
t.__index = t
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("Signal")
local v2 = Sonar("Maid")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("MutationUtils")
local v5 = Sonar("OriginBuffUtils")
local v6 = Sonar("StorageUtils")
local v7 = Sonar(v6.Get("AilmentData"))
local v8 = Sonar(v6.Get("ModifierData"))
local v9 = RunService:IsClient()
local v10 = Sonar("Constants")
local CompressedAnimalData = v10.CompressedAnimalData
local DoNotRoundAnimalData = v10.DoNotRoundAnimalData
local LocalPlayer = game:GetService("Players").LocalPlayer
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
for k, v in pairs(CompressedAnimalData) do
	if t2[v] then
		warn(k, "has compression for", v, "and is not unique")
	end
	t2[v] = true
end
local t6 = {}
for k, v in pairs(CompressedAnimalData) do
	t6[v] = k
end
function t._decompress(p1, p2) --[[ _decompress | Line: 47 | Upvalues: t6 (copy) ]]
	return t6[p2] or p2
end
function t._compress(p1, p2) --[[ _compress | Line: 51 | Upvalues: CompressedAnimalData (copy) ]]
	return CompressedAnimalData[p2] or p2
end
function t.SetCachedData(p1, p2, p3, p4) --[[ SetCachedData | Line: 55 | Upvalues: t5 (copy) ]]
	if not t5[p2] then
		t5[p2] = {}
	end
	t5[p2][p3] = p4
	if not p1.Data then
		return
	end
	if typeof(p4) == "Instance" then
		p4 = true
	end
	p1.Data:SetAttribute(p3, p4)
end
function t.GetCachedData(p1, p2, p3) --[[ GetCachedData | Line: 68 | Upvalues: t5 (copy) ]]
	return t5[p2][p3]
end
function t.GetAllCachedData(p1, p2) --[[ GetAllCachedData | Line: 72 | Upvalues: t5 (copy) ]]
	return t5[p2]
end
function t.GetDataFromModel(p1, p2, p3) --[[ GetDataFromModel | Line: 76 ]]
	return p2:WaitForChild("Data"):GetAttribute(p1:_compress(p3))
end
function t.GetDataClassFromModel(p1, p2) --[[ GetDataClassFromModel | Line: 80 | Upvalues: t3 (copy) ]]
	for k, v in pairs(t3) do
		if v.Model == p2 then
			return v
		end
	end
end
function t.GetOrCreateAnimalData(p1, ...) --[[ GetOrCreateAnimalData | Line: 88 | Upvalues: t (copy), t4 (copy) ]]
	local v1 = t:GetDataClassFromModel(p1)
	if v1 then
		return v1
	end
	if t4[p1] then
		return t.YieldForAnimalData(p1)
	else
		return t.new(p1, ...)
	end
end
function t.YieldForAnimalData(p1) --[[ YieldForAnimalData | Line: 101 | Upvalues: t (copy), RunService (copy) ]]
	local v1
	repeat
		print("Waiting for Animal data", p1:GetFullName())
		v1 = t:GetDataClassFromModel(p1)
		RunService.Heartbeat:Wait()
	until v1
	return v1
end
function t.new(p1, p2, p3) --[[ new | Line: 112 | Upvalues: t4 (copy), t (copy), v2 (copy), LocalPlayer (copy), v3 (copy), v9 (copy), v10 (copy), v1 (copy), v5 (copy), v4 (copy), t3 (copy) ]]
	t4[p1] = true
	local v22 = setmetatable({}, t)
	v22.Species = v22:GetDataFromModel(p1, "Species")
	v22.Model = p1
	v22.Data = p1:WaitForChild("Data")
	v22.Ailments = p1:WaitForChild("Ailments")
	v22.Maid = v2.new()
	v22.IsLocalPlayer = if p2 == LocalPlayer then true else false
	v22.PlayerWrapper = if p2 then v3.getWrapperFromPlayer(p2) else p2
	v22.Player = p2
	v22.SlotValue = p3
	v22.OverwriteStats = {}
	v22:SetCachedData(v22.Species, "ScaleMultiplier", 1)
	if not v9 then
		for k, v in pairs(v22:GetAllCachedData(v22.Species)) do
			if not v10.ExcludedAnimalDataFromReplication[k] then
				local v52 = v22:_compress(k)
				if not v22.Data:GetAttribute(v52) then
					v22.Data:SetAttribute(v52, v)
				end
			end
		end
	end
	v22.DataCache = {}
	v22.AttributeCache = {}
	v22.AilmentAddedSignal = v1.new()
	v22.Maid:GiveTask(v22.AilmentAddedSignal)
	v22.AilmentRemovedSignal = v1.new()
	v22.Maid:GiveTask(v22.AilmentRemovedSignal)
	local function updateAilments(p1) --[[ updateAilments | Line: 157 | Upvalues: v22 (copy) ]]
		local v1 = v22.Ailments:GetAttribute(p1)
		if v1 then
			v22.AttributeCache[p1] = v1
			v22.AilmentAddedSignal:Fire(p1, v1)
			return
		end
		if v1 then
			return
		end
		v22.AttributeCache[p1] = nil
		v22.AilmentRemovedSignal:Fire(p1)
	end
	v22.Maid:GiveTask(v22.Model:WaitForChild("Ailments").AttributeChanged:Connect(updateAilments))
	for k, v in pairs(v22.Ailments:GetAttributes()) do
		local v6 = v22.Ailments:GetAttribute(k)
		if v6 then
			v22.AttributeCache[k] = v6
			v22.AilmentAddedSignal:Fire(k, v6)
			continue
		end
		if not v6 then
			v22.AttributeCache[k] = nil
			v22.AilmentRemovedSignal:Fire(k)
		end
	end
	local function updateData(p1) --[[ updateData | Line: 172 | Upvalues: v22 (copy) ]]
		local v1 = v22.Data:GetAttribute(p1)
		if v1 then
			v22.DataCache[p1] = v1
			return
		end
		if v1 then
			return
		end
		v22.DataCache[p1] = nil
	end
	v22.Maid:GiveTask(v22.Data.AttributeChanged:Connect(updateData))
	for k, v in pairs(v22.Data:GetAttributes()) do
		local v7 = v22.Data:GetAttribute(k)
		if v7 then
			v22.DataCache[k] = v7
			continue
		end
		if not v7 then
			v22.DataCache[k] = nil
		end
	end
	v22.Modifiers = {}
	if v22.SlotValue then
		local function updateModifier(p1) --[[ updateModifier | Line: 187 | Upvalues: v22 (copy) ]]
			if not v22.Modifiers[p1.Name] then
				v22.Modifiers[p1.Name] = true
				v22.Maid:GiveTask(p1.Destroying:Once(function() --[[ Line: 192 | Upvalues: v22 (ref), p1 (copy) ]]
					v22.Modifiers[p1.Name] = nil
				end))
			end
		end
		v22.Maid:GiveTask(v22.SlotValue:WaitForChild("ActiveBoosts").ChildAdded:Connect(updateModifier))
		for v8, v92 in v22.SlotValue.ActiveBoosts:GetChildren() do
			if not v22.Modifiers[v92.Name] then
				v22.Modifiers[v92.Name] = true
				v22.Maid:GiveTask(v92.Destroying:Once(function() --[[ Line: 192 | Upvalues: v22 (copy), v92 (copy) ]]
					v22.Modifiers[v92.Name] = nil
				end))
			end
		end
		local v102 = nil
		local function updateOriginModifier() --[[ updateOriginModifier | Line: 202 | Upvalues: v102 (ref), v22 (copy), v5 (ref) ]]
			if v102 then
				v22.Modifiers[v102] = nil
			end
			local v1 = v5.GetType(v22.SlotValue.OriginBuff.Value)
			if not v1 then
				return
			end
			if v1.Modifier and not v22.Modifiers[v1.Modifier] then
				v102 = v1.Modifier
				v22.Modifiers[v1.Modifier] = true
			end
		end
		v22.Maid:GiveTask(v22.SlotValue:WaitForChild("OriginBuff"):GetPropertyChangedSignal("Value"):Connect(updateOriginModifier))
		if v102 then
			v22.Modifiers[v102] = nil
		end
		local v11 = v5.GetType(v22.SlotValue.OriginBuff.Value)
		if v11 and (v11.Modifier and not v22.Modifiers[v11.Modifier]) then
			v102 = v11.Modifier
			v22.Modifiers[v11.Modifier] = true
		end
		local function UpdateElderModifier() --[[ UpdateElderModifier | Line: 220 | Upvalues: v22 (copy) ]]
			if v22.SlotValue.Eldering.Completed.Value then
				if not v22.Modifiers.ElderModifier then
					v22.Modifiers.ElderModifier = true
				end
			elseif v22.Modifiers.ElderModifier then
				v22.Modifiers.ElderModifier = false
			end
		end
		if v22.SlotValue:WaitForChild("Eldering"):FindFirstChild("Completed") then
			v22.Maid:GiveTask(v22.SlotValue:WaitForChild("Eldering").Completed:GetPropertyChangedSignal("Value"):Connect(UpdateElderModifier))
			if v22.SlotValue.Eldering.Completed.Value then
				if not v22.Modifiers.ElderModifier then
					v22.Modifiers.ElderModifier = true
				end
			elseif v22.Modifiers.ElderModifier then
				v22.Modifiers.ElderModifier = false
			end
		end
		local function updateMutationModifier(p1) --[[ updateMutationModifier | Line: 234 | Upvalues: v4 (ref), v22 (copy) ]]
			local v1 = nil
			local function removeModifier() --[[ removeModifier | Line: 236 | Upvalues: v1 (ref), v4 (ref), v22 (ref) ]]
				if not v1 then
					return
				end
				local Modifier = v4.GetMutation(v1).Modifier
				if Modifier and v22.Modifiers[Modifier] then
					v22.Modifiers[Modifier] = nil
				end
			end
			local function update() --[[ update | Line: 249 | Upvalues: v1 (ref), v4 (ref), v22 (ref), p1 (copy) ]]
				if v1 then
					local Modifier = v4.GetMutation(v1).Modifier
					if Modifier and v22.Modifiers[Modifier] then
						v22.Modifiers[Modifier] = nil
					end
				end
				local v12 = v4.GetMutation(p1.Value)
				if not v12 then
					return
				end
				v1 = p1.Value
				local Modifier = v12.Modifier
				if Modifier and not v22.Modifiers[Modifier] then
					v22.Modifiers[Modifier] = true
				end
			end
			v22.Maid:GiveTask(p1:GetPropertyChangedSignal("Value"):Connect(update))
			if v1 then
				local Modifier = v4.GetMutation(v1).Modifier
				if Modifier and v22.Modifiers[Modifier] then
					v22.Modifiers[Modifier] = nil
				end
			end
			local v2 = v4.GetMutation(p1.Value)
			if v2 then
				v1 = p1.Value
				local Modifier = v2.Modifier
				if Modifier and not v22.Modifiers[Modifier] then
					v22.Modifiers[Modifier] = true
				end
			end
			v22.Maid:GiveTask(p1.Destroying:Once(function() --[[ Line: 273 | Upvalues: v1 (ref), v4 (ref), v22 (ref) ]]
				if not v1 then
					return
				end
				local Modifier = v4.GetMutation(v1).Modifier
				if not Modifier then
					return
				end
				if not v22.Modifiers[Modifier] then
					return
				end
				v22.Modifiers[Modifier] = nil
			end))
		end
		v22.Maid:GiveTask(v22.SlotValue.Mutations.ChildAdded:Connect(updateMutationModifier))
		for v122, v13 in v22.SlotValue.Mutations:GetChildren() do
			updateMutationModifier(v13)
		end
	end
	t3[v22] = v22
	t4[p1] = nil
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 290 | Upvalues: t3 (copy) ]]
	p1.Maid:Destroy()
	t3[p1] = nil
	setmetatable(p1, nil)
end
function t.Get(p1, p2) --[[ Get | Line: 297 | Upvalues: DoNotRoundAnimalData (copy) ]]
	if not p1.Data then
		error("You tried to call AnimalData::Get without constructing it first. \n Try using GetCachedData instead.")
	end
	if p1.OverwriteStats[p2] then
		return p1.OverwriteStats[p2]
	end
	local v2 = p1.DataCache[p1:_compress(p2)]
	if tonumber(v2) and not DoNotRoundAnimalData[p2] then
		v2 = math.round(v2)
	end
	return v2
end
function t.GetCached(p1, p2) --[[ GetCached | Line: 316 ]]
	local v1 = p1:GetCachedData(p1.Species, p2)
	if v1 == nil then
		local v2 = p1:Get(p2)
		if v2 then
			p1:SetCachedData(p1.Species, p2, v2)
		end
		v1 = v2
	end
	return v1
end
function t.SetReplicatedData(p1, ...) --[[ SetReplicatedData | Line: 328 | Upvalues: v9 (copy) ]]
	if v9 and not p1.IsLocalPlayer then
		return
	end
	p1.PlayerWrapper:SetReplicatedData(...)
	return p1:GetReplicatedData(...)
end
function t.GetReplicatedData(p1, ...) --[[ GetReplicatedData | Line: 335 | Upvalues: v9 (copy) ]]
	if v9 and not p1.IsLocalPlayer then
		return
	end
	return p1.PlayerWrapper:GetReplicatedData(...)
end
function t.GetReplicatedDataChangedSignal(p1, ...) --[[ GetReplicatedDataChangedSignal | Line: 341 | Upvalues: v9 (copy) ]]
	if v9 and not p1.IsLocalPlayer then
		return
	end
	return p1.PlayerWrapper:GetReplicatedDataChangedSignal(...)
end
function t.GetAilments(p1) --[[ GetAilments | Line: 346 ]]
	return p1.AttributeCache
end
function t.GetModifiers(p1) --[[ GetModifiers | Line: 350 ]]
	return p1.Modifiers
end
function t.GetAilmentAddedSignal(p1) --[[ GetAilmentAddedSignal | Line: 354 ]]
	return p1.AilmentAddedSignal
end
function t.GetAilmentRemovedSignal(p1) --[[ GetAilmentRemovedSignal | Line: 358 ]]
	return p1.AilmentRemovedSignal
end
function t.GetAttribute(p1, p2) --[[ GetAttribute | Line: 362 ]]
	return p1.Model.Ailments:GetAttribute(p2)
end
function t.GetAilmentChangedSignal(p1, p2) --[[ GetAilmentChangedSignal | Line: 366 ]]
	return p1.Model.Ailments:GetAttributeChangedSignal(p2)
end
function t.GetWithModifiers(p1, p2) --[[ GetWithModifiers | Line: 370 | Upvalues: v7 (copy), v8 (copy), DoNotRoundAnimalData (copy) ]]
	local v1 = p1:Get(p2) or p1:GetCached(p2)
	local v2 = tonumber(v1)
	if v1 ~= nil then
		for k, v in pairs(p1:GetAilments()) do
			local v3 = nil
			for k2, v4 in pairs(v7[k].AilmentTargets) do
				if v4 == p2 then
					v3 = v4
					break
				end
			end
			if v3 then
				local OnGet = v7[k].OnGet
				if OnGet then
					local v4 = OnGet(v3, v1, v, p1)
					if v4 then
						v1 = v4
					end
				end
			end
		end
		for k, v in pairs(p1:GetModifiers()) do
			local v5 = nil
			for k2, v3 in pairs(v8[k].ModifierTargets) do
				if v3 == p2 then
					v5 = v3
					break
				end
			end
			if v5 then
				local OnGet = v8[k].OnGet
				if OnGet then
					local v6 = OnGet(v5, v1, nil, p1)
					if v6 then
						v1 = v6
					end
				end
			end
		end
	end
	if v2 and not DoNotRoundAnimalData[p2] then
		v1 = math.round(v1)
	end
	return v1
end
function t.GetStatChangedSignal(p1, p2) --[[ GetStatChangedSignal | Line: 431 | Upvalues: v1 (copy) ]]
	local v12 = p1:_compress(p2)
	local v2 = v1.new()
	p1.Maid:GiveTask(v2)
	p1.Maid:GiveTask(p1.Data:GetAttributeChangedSignal(v12):Connect(function() --[[ Line: 436 | Upvalues: v2 (copy), p1 (copy), v12 (ref) ]]
		v2:Fire(p1:Get(v12))
	end))
	return v2
end
function t.SetOverwriteStat(p1, p2, p3) --[[ SetOverwriteStat | Line: 442 ]]
	p1.OverwriteStats[p2] = p3
end
function t.Set(p1, p2, p3) --[[ Set | Line: 446 ]]
	p1.Data:SetAttribute(p1:_compress(p2), p3)
end
function t.Decrement(p1, p2, p3) --[[ Decrement | Line: 452 ]]
	if not (p3 < 0) then
		p1.Data:SetAttribute(p2, (math.ceil((math.max(p1.Data:GetAttribute(p2) - p3, 0)))))
	end
end
function t.HasAilment(p1, p2) --[[ HasAilment | Line: 459 ]]
	return p1.Model.Ailments:GetAttribute(p2)
end
function t.GetAilment(p1, p2) --[[ GetAilment | Line: 465 ]]
	return p2.GetAilmentFromPlayer(p1.Player, p2)
end
function t.GetAllStats(p1) --[[ GetAllStats | Line: 469 ]]
	local v1 = p1.Data:GetAttributes()
	for k, v in pairs(v1) do
		local v2 = p1:_decompress(k)
		v1[v2] = v
		if v2 ~= k then
			v1[k] = nil
		end
	end
	return v1
end
return t