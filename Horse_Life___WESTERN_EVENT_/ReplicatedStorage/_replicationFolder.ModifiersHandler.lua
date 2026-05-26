-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("StorageUtils")
local v3 = Sonar("AnimalData")
local v4 = Sonar("TimeUtils")
local v5 = Sonar("Signal")
local v6 = Sonar(v2.Get("ModifierData"))
local v7 = game:GetService("RunService"):IsServer()
local t2 = {}
local function getTargetStatFromModifier(p1, p2) --[[ getTargetStatFromModifier | Line: 22 ]]
	for k, v in pairs(p1.TargetStats) do
		if v == p2 then
			return v
		end
	end
end
function t.new(p1) --[[ new | Line: 30 | Upvalues: t (copy), v7 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = p1.Maid
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	v2.Modifiers = {}
	if v7 then
		v2.ModifiersFolder = Instance.new("Folder")
		v2.ModifiersFolder.Name = "Modifiers"
		v2.ModifiersFolder.Parent = v2.Player
		v2.Maid:GiveTask(v2.ModifiersFolder)
	else
		v2.ModifiersFolder = v2.Player:WaitForChild("Modifiers")
	end
	v2.Maid:GiveTask(v4.AttachToTime(function() --[[ Line: 48 | Upvalues: v2 (copy) ]]
		v2:RemoveInactiveModifiers()
	end))
	v2:ListenForModifiers()
	if v7 then
		v2.BoostModifiers = {}
		table.insert(p1.OnRemoved, function() --[[ Line: 57 ]] end)
	end
	v2.SlotData = {}
	v2.ActiveBoostedSlots = {}
	if p1.PlayerData then
		v2.Maid:GiveTask(p1.PlayerData.Animals.ChildRemoved:Connect(function(p1) --[[ Line: 66 | Upvalues: v2 (copy) ]]
			v2:SlotRemoved(p1)
		end))
		v2.Maid:GiveTask(p1.PlayerData.Animals.ChildAdded:Connect(function(p1) --[[ Line: 69 | Upvalues: v2 (copy) ]]
			task.wait()
			v2:SlotAdded(p1)
		end))
		for k, v in pairs(p1.PlayerData.Animals:GetChildren()) do
			v2:SlotAdded(v, true)
		end
	end
	if v7 then
		v2.Maid:GiveTask(v4.AttachToTime(function() --[[ Line: 79 | Upvalues: v2 (copy) ]]
			v2:TickSlotBoosts()
		end))
	end
	for k, v in pairs(t) do
		if type(v) == "function" and not p1[k] then
			p1[k] = function(p1, ...) --[[ Line: 89 | Upvalues: v (copy), v2 (copy) ]]
				return v(v2, ...)
			end
		end
	end
	return v2
end
function t.ListenForModifiers(p1) --[[ ListenForModifiers | Line: 98 | Upvalues: v5 (copy) ]]
	p1.AddedModifiers = {}
	for k, v in pairs({ "ModifierAdded", "ModifierRemoved" }) do
		p1[v] = v5.new()
		p1.Maid:GiveTask(p1[v])
		p1.PlayerWrapper[v] = p1[v]
	end
	p1.Maid:GiveTask(p1.ModifiersFolder.AttributeChanged:Connect(function(p12) --[[ Line: 108 | Upvalues: p1 (copy) ]]
		if not p1.AddedModifiers[p12] then
			p1.AddedModifiers[p12] = true
			p1.ModifierAdded:Fire(p12, p1.ModifiersFolder:GetAttribute(p12))
			return
		end
		if p1.ModifiersFolder:GetAttribute(p12) then
			return
		end
		p1.AddedModifiers[p12] = nil
		p1.ModifierRemoved:Fire(p12)
	end))
	for k, v in pairs(p1.ModifiersFolder:GetAttributes()) do
		p1.AddedModifiers[k] = true
	end
end
function t.GetStat(p1, p2) --[[ GetStat | Line: 123 | Upvalues: t2 (copy) ]]
	local v1 = t2[p2]
	if not v1 then
		return
	end
	return if type(v1) == "number" and v1 then v1 else v1(p1)
end
function t.TickSlotBoosts(p1) --[[ TickSlotBoosts | Line: 131 | Upvalues: v4 (copy) ]]
	for k, v in pairs(p1.ActiveBoostedSlots) do
		for k2, v2 in pairs(k.ActiveBoosts:GetChildren()) do
			if v4.Get() >= v2.Value then
				v2:Destroy()
			end
		end
	end
end
function t.SlotAdded(p1, p2, p3) --[[ SlotAdded | Line: 143 | Upvalues: v1 (copy), v7 (copy), v3 (copy) ]]
	if p1.SlotData[p2] then
		return
	end
	if not p3 then
		task.wait()
		p2:WaitForChild("ActiveBoosts")
	end
	local v12 = v1.new()
	local Model = Instance.new("Model")
	v12:GiveTask(Model)
	local v2
	if Model then
		local Data = Instance.new("Folder")
		Data.Name = "Data"
		Data.Parent = Model
		v2 = Data
	else
		v2 = nil
	end
	if Model then
		local Ailments = v2:Clone()
		Ailments.Name = "Ailments"
		Ailments.Parent = Model
	end
	if v2 then
		v2:SetAttribute("Species", p2.Species.Value)
	end
	if v7 then
		local function updateActiveBoosts() --[[ updateActiveBoosts | Line: 168 | Upvalues: p2 (copy), p1 (copy) ]]
			if not p2:FindFirstChild("ActiveBoosts") then
				return
			end
			if next(p2.ActiveBoosts:GetChildren()) then
				p1.ActiveBoostedSlots[p2] = true
			else
				p1.ActiveBoostedSlots[p2] = nil
			end
		end
		p1.Maid:GiveTask(p2:WaitForChild("ActiveBoosts").ChildAdded:Connect(updateActiveBoosts))
		p1.Maid:GiveTask(p2.ActiveBoosts.ChildRemoved:Connect(updateActiveBoosts))
		if p2:FindFirstChild("ActiveBoosts") then
			if next(p2.ActiveBoosts:GetChildren()) then
				p1.ActiveBoostedSlots[p2] = true
			else
				p1.ActiveBoostedSlots[p2] = nil
			end
		end
	end
	local v32 = v3.GetOrCreateAnimalData(Model, p1.Player, p2)
	v12:GiveTask(v32)
	p1.SlotData[p2] = {
		Maid = v12,
		Data = v32
	}
end
function t.SlotRemoved(p1, p2) --[[ SlotRemoved | Line: 189 ]]
	p1.ActiveBoostedSlots[p2] = nil
	if p1.SlotData[p2] then
		p1.SlotData[p2].Maid:Destroy()
		p1.SlotData[p2] = nil
	end
end
function t.GetWithModifiers(p1, p2) --[[ GetWithModifiers | Line: 196 | Upvalues: v6 (copy) ]]
	local v1 = p2.Slot and p1.SlotData[p2.Slot]
	if p2.Slot then
		if not v1 then
			return p2.Default
		end
		return v1.Data:GetWithModifiers(p2.Name) or p2.Default
	else
		local v3 = p1:GetStat(p2.Name) or (p2.Default or 1)
		for k, v in pairs(p1:GetModifiers()) do
			if v ~= 0 then
				local v4 = v6[k]
				local v5 = p2.Name
				local v62 = nil
				for k2, v2 in pairs(v4.TargetStats) do
					if v2 == v5 then
						v62 = v2
						break
					end
				end
				if v62 then
					v3 = v4.OnGet(v62, v3, v)
				end
			end
		end
		return v3
	end
end
function t.GetModifiers(p1) --[[ GetModifiers | Line: 224 ]]
	return p1.ModifiersFolder:GetAttributes()
end
function t.GetModifier(p1, p2) --[[ GetModifier | Line: 228 ]]
	return p1.ModifiersFolder:GetAttribute(p2)
end
function t.GetModifierChangedSignal(p1, p2) --[[ GetModifierChangedSignal | Line: 232 ]]
	return p1.ModifiersFolder:GetAttributeChangedSignal(p2)
end
function t.AddModifier(p1, p2) --[[ AddModifier | Line: 236 | Upvalues: v6 (copy) ]]
	local v1 = p1.Modifiers[p2.Type]
	if not v1 then
		p1.Modifiers[p2.Type] = p2
		v1 = p2
	end
	local v2 = v6[p2.Type]
	if v2.HasBoostDataValue then
		if not v1.End or v1.End < workspace:GetServerTimeNow() then
			v1.Start = workspace:GetServerTimeNow()
		end
		v1.End = v1.Start + p2.Duration
		p1.ModifiersFolder:SetAttribute(v1.Type, v1.End)
	else
		if p2.Duration and not v2.AttributeIsValue then
			local End = v1.End
			if not End then
				End = math.floor((workspace:GetServerTimeNow()))
			end
			v1.End = End + p2.Duration
		end
		p1.ModifiersFolder:SetAttribute(v1.Type, p2.Value or v1.End or true)
	end
end
function t.RemoveModifier(p1, p2) --[[ RemoveModifier | Line: 265 | Upvalues: v7 (copy) ]]
	p1.Modifiers[p2] = nil
	p1.ModifiersFolder:SetAttribute(p2, nil)
	if not v7 then
		return
	end
	local v1 = p1.BoostModifiers[p2]
	if not v1 then
		return
	end
	v1.Value = 0
end
function t.RemoveInactiveModifiers(p1) --[[ RemoveInactiveModifiers | Line: 277 ]]
	for k, v in pairs(p1.Modifiers) do
		if v.End and workspace:GetServerTimeNow() >= v.End then
			p1:RemoveModifier(k)
		end
	end
end
return t