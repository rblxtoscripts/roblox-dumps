-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("ItemDataService")
Sonar("AnimalRiggerService")
local v5 = Sonar("AnimalDataService")
local v6 = Sonar("MathUtils")
local v7 = Sonar("Color3")
local v8 = Sonar("LevelUtils")
local v9 = Sonar("FormatNumber")
local v10 = v1 and Sonar("AnalyticsService")
local v11 = Sonar("StorageUtils")
local v12 = Sonar("Constants")
local EquipmentBodyPartTypes = v12.EquipmentBodyPartTypes
local sum = 0
for k, v in pairs(Sonar(v11.Get("UpgradeStats"))) do
	sum = sum + v.MaxLevel
end
function t.GetLevelRequireToEdit() --[[ GetLevelRequireToEdit | Line: 34 ]]
	return 0
end
function t.IsEquipped(p1, p2, p3, p4) --[[ IsEquipped | Line: 38 ]]
	if p4 then
		return p4, p4.EquippedEquipment:FindFirstChild(p3)
	end
	for k, v in pairs(p2:GetItemFolder("Animals"):GetChildren()) do
		local v1 = v.EquippedEquipment:FindFirstChild(p3)
		if v1 then
			return v, v1
		end
	end
end
function t.GetAllEquippedOnBodyPart(p1, p2, p3) --[[ GetAllEquippedOnBodyPart | Line: 51 | Upvalues: v4 (copy) ]]
	local EquippedEquipment = p2:FindFirstChild("EquippedEquipment")
	local t = {}
	if EquippedEquipment then
		for k, v in pairs(EquippedEquipment:GetChildren()) do
			local v1 = v4.GetByName(v.Value)
			if v1 and v1.BodyPart == p3 then
				table.insert(t, v)
			end
		end
	end
	return t
end
function t.CanEquipItem(p1, p2, p3, p4) --[[ CanEquipItem | Line: 70 | Upvalues: v4 (copy), v5 (copy), t (copy) ]]
	local v1 = p2:GetIndexedItemValue(p4, "Equipment") or p2:GetIndexedItemValue(p4, "Flairs")
	if not v1 then
		return
	end
	local v2 = v4.GetByName(v1.Value)
	if not v2 then
		return
	end
	if v2.Species and p3.Species.Value ~= v2.Species then
		return "CannotEquipOnSpecies"
	end
	local v3 = v5.GetByName(p3.Species.Value)
	if v2.ToyEvent and not (if v3 then v3.ToyHorse else v3) then
		return "ToyAccessoryNonToyHorse"
	end
	if p3.Age.Value < 66 then
		return "NotAdult"
	end
	local v52, v6 = t:IsEquipped(p2, p4)
	if v52 == p3 then
		return "AlreadyEquippedItem"
	else
		return true, v1, v2, v6
	end
end
function t.RemoveItemFromData(p1, p2, p3) --[[ RemoveItemFromData | Line: 107 ]]
	for k, v in pairs(p2:GetItemFolder("Animals"):GetChildren()) do
		local v1 = v.EquippedEquipment:FindFirstChild(p3)
		if v1 then
			v1:Destroy()
		end
	end
	local v2 = p2:GetIndexedItemValue(p3, "Equipment") or p2:GetIndexedItemValue(p3, "Flairs")
	if v2 then
		v2:Destroy()
	else
		warn("No item data found")
	end
end
function t.GetThemeFromValue(p1) --[[ GetThemeFromValue | Line: 126 | Upvalues: v4 (copy) ]]
	local Theme = p1:FindFirstChild("Theme")
	if not Theme then
		return
	end
	return if Theme.Value == "Nothing" then false else v4.GetByName(Theme.Value)
end
function t.GetEditedColorGradient(p1) --[[ GetEditedColorGradient | Line: 134 | Upvalues: v7 (copy), v6 (copy) ]]
	local list = {}
	for k, v in pairs(p1:GetChildren()) do
		if tonumber(v.Name) and not (#v.Value <= 0) then
			table.insert(list, v7.fromHex(v.Value))
		end
	end
	if #list <= 0 then
		return
	end
	if #list <= 1 then
		return ColorSequence.new(list[1])
	end
	local t = {}
	for i, v in ipairs(list) do
		t[#t + 1] = ColorSequenceKeypoint.new(v6.map(i, 1, #list, 0, 1), v)
	end
	return ColorSequence.new(t)
end
function t.CanItemBeEdited(p1, p2, p3) --[[ CanItemBeEdited | Line: 159 | Upvalues: v4 (copy), t (copy) ]]
	local v1 = if p3 then p3 else v4.GetByName(p2.Value)
	if t.GetThemeFromValue(p2) then
		return "CannotEditTheme"
	end
	if v1.CannotColor then
		return "CannotColor"
	end
	if not v1.Editable then
		return "NotColorEditable"
	end
	local v2 = p1:HasEnoughOfItem(1, "ColorDye")
	if v2 then
		return true, v2
	else
		return "NoColorDye"
	end
end
function t.HasSlotUnlockedEquipment(p1) --[[ HasSlotUnlockedEquipment | Line: 182 | Upvalues: v8 (copy) ]]
	return v8.GetTotalSkillLevels(p1) >= 0
end
function t.HasAllEquipmentSlotsFull(p1) --[[ HasAllEquipmentSlotsFull | Line: 187 | Upvalues: EquipmentBodyPartTypes (copy), t (copy) ]]
	for k, v in pairs(EquipmentBodyPartTypes) do
		if not next(t:GetAllEquippedOnBodyPart(p1, v)) then
			return
		end
	end
	return true
end
function t.Init(p1) --[[ Init | Line: 196 | Upvalues: v4 (copy), ReplicatedStorage (copy), v6 (copy), EquipmentBodyPartTypes (copy), v12 (copy), v1 (copy), v2 (copy), v3 (copy), t (copy), v10 (copy), v9 (copy) ]]
	for k, v in pairs(v4.GetType("EquipmentThemes")) do
		v.RegionsByTag = {}
		for k2, v5 in pairs(v.Regions) do
			v.RegionsByTag[v5.Tag] = v5
			if v5.Particle then
				if ReplicatedStorage.Storage.Assets.Particles.ThemeParticles:FindFirstChild(v5.Particle) then
					v5.Particle = ReplicatedStorage.Storage.Assets.Particles.ThemeParticles[v5.Particle]
					continue
				end
				warn("PARTICLE NOT FOUND ", v5.Particle)
			end
		end
		for k2, v5 in pairs(v.Regions) do
			if v5.Texture then
				v.Texture = v5.Texture
				break
			end
		end
		if not v.Texture then
			local list = {}
			for k2, v5 in pairs(v.Regions) do
				if v5.Color and typeof(v5.Color) == "Color3" then
					list[#list + 1] = v5.Color
				end
			end
			local t2 = {}
			for i, v5 in ipairs(list) do
				t2[#t2 + 1] = ColorSequenceKeypoint.new(v6.map(i, 1, #list, 0, 1), v5)
			end
			v.ColorSequence = ColorSequence.new(t2)
		end
	end
	for k, v in pairs(v4.GetType("Equipment")) do
		if v.Editable == nil then
			v.Editable = true
		end
		if not (v.ColorableRegions and next(v.ColorableRegions)) then
			v.Editable = false
		end
		if not (v.BodyPart and table.find(EquipmentBodyPartTypes, v.BodyPart)) then
			warn("No valid body part can be found for", k)
		end
	end
	for k, v in pairs(v4.GetType("Flairs")) do
		v.Editable = false
		v.DisplayBodyPart = v.BodyPart
		v.BodyPart = "Flair"
	end
	for k, v in pairs(v4.GetType("EquipmentPalettes")) do
		for k2, v5 in pairs(v.Colors) do
			local v22 = v12.Colors.MappedColorsByName[v5]
			v.Colors[k2] = {
				Name = v5,
				HexColor = v22.Color,
				Color = v22.ColorRGB
			}
		end
		local list = {}
		for k2, v5 in pairs(v.Colors) do
			if v5.Color then
				list[#list + 1] = v5.Color
			end
		end
		local t2 = {}
		for i, v5 in ipairs(list) do
			t2[#t2 + 1] = ColorSequenceKeypoint.new(v6.map(i, 1, #list, 0, 1), v5)
		end
		v.ColorSequence = ColorSequence.new(t2)
	end
	if not v1 then
		return
	end
	v2.GetRemoteFunction("SetCustomiseModeRemote").OnServerInvoke = function(p1, p2) --[[ Line: 280 | Upvalues: v3 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if v1 then
			return v1:SetActionState("CustomiseMode", p2)
		end
	end
	v2.GetRemoteFunction("EquipEquipmentRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 286 | Upvalues: v3 (ref), t (ref), v10 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v1:GetAnimalSlot(p2)
		if not v2 then
			return
		end
		local v32, v4, v5, v6 = t:CanEquipItem(v1, v2, p3)
		if v32 ~= true then
			return
		end
		if v6 then
			v6:Destroy()
		end
		local v7 = v2
		for k, v in pairs(t:GetAllEquippedOnBodyPart(v2, v5.BodyPart)) do
			v:Destroy()
		end
		local v8 = v4:Clone()
		v8.Parent = v7.EquippedEquipment
		v10.ReportDesignEvent(p1, "CosmeticEquipped", {
			{
				Key = "ItemName",
				Value = v5.Name
			},
			{
				Key = "BodyPart",
				Value = v5.BodyPart
			},
			{
				Key = "Species",
				Value = v7.Species.Value
			}
		}, 1)
		v1:IncrementMission({
			Type = "EquipEquipment",
			Amount = 1,
			Data = { v7.Species.Value, v5.Name, v5.ToyEvent }
		})
		if not t.HasAllEquipmentSlotsFull(v7) then
			return v8.Name
		end
		v1:IncrementMission({
			Type = "FullyEquipEquipment",
			Amount = 1,
			Data = { v7.Species.Value }
		})
		return v8.Name
	end
	v2.GetRemoteFunction("UnequipEquipmentRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 329 | Upvalues: v3 (ref), t (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v1:GetAnimalSlot(p2)
		if not v2 then
			return
		end
		local _, v32 = t:IsEquipped(v1, p3, v2)
		if v32 then
			v32:Destroy()
			return true
		end
	end
	v2.GetRemoteFunction("DeleteEquipmentRemote").OnServerInvoke = function(p1, p2) --[[ Line: 342 | Upvalues: v3 (ref), t (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if v1 then
			return t:RemoveItemFromData(v1, p2)
		end
	end
	v2.GetRemoteFunction("MassDelete").OnServerInvoke = function(p1, p2) --[[ Line: 349 | Upvalues: v3 (ref), t (ref), v10 (ref), v9 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		for v2, v32 in p2 do
			local ItemData = v32.ItemData
			if ItemData.ItemType == "Equipment" or ItemData.ItemType == "Flairs" then
				t:RemoveItemFromData(v1, v32.DataValue.Name)
				continue
			end
			if ItemData.ItemType == "Chests" or ItemData.ItemType == "Seeds" then
				local v4 = v1:GetItemValue(v32.DataValue.Name, ItemData.ItemType)
				if v4 then
					v4:Destroy()
					v10.ReportResourceEvent(p1, "Sink", "Equipment", v2, "DeleteInventoryItem", 1)
				end
				continue
			end
			local v5 = v9.SanitiseInput(v32.DeleteAmount)
			if tonumber(v5) and not (v5 < 0) then
				local v6 = v3.getWrapperFromPlayer(p1):GetItemValue(v2)
				if v6 then
					local v8 = math.clamp(v5, 0, v6.Value)
					v6.Value = math.max(v6.Value - v8, 0)
					v10.ReportResourceEvent(p1, "Sink", "Equipment", v2, "DeleteInventoryItem", v8)
				end
			end
		end
	end
	v2.GetRemoteFunction("ColorEquipmentRemote").OnServerInvoke = function(p1, p2) --[[ Line: 384 | Upvalues: v3 (ref), t (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v1:GetAnimalSlot(p2.Slot)
		if not v2 then
			return
		end
		local v32 = v1:GetIndexedItemValue(p2.Item, "Equipment")
		if not v32 then
			return
		end
		local v4 = v2.EquippedEquipment:FindFirstChild(p2.Item)
		if not v4 then
			return
		end
		local v5, v6 = t.CanItemBeEdited(v1, v4, p2.Region)
		if v5 ~= true then
			return
		end
		for k, v in pairs(p2.Regions) do
			if v32:FindFirstChild(k) then
				v32[k].Value = v
				v4[k].Value = v
			end
		end
		v6.Value = v6.Value - 1
		v1:IncrementMission({
			Type = "DyeEquipment",
			Amount = 1,
			Data = {}
		})
		return true
	end
	v2.GetRemoteFunction("ApplyEquipmentPositionsRemote").OnServerInvoke = function(p1, p2) --[[ Line: 415 | Upvalues: v3 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v1:GetAnimalSlot(p2.Slot)
		if not v2 then
			return
		end
		local v32 = v1:GetIndexedItemValue(p2.Item, "Equipment")
		if not v32 then
			return
		end
		local v4 = v2.EquippedEquipment:FindFirstChild(p2.Item)
		if not v4 then
			return
		end
		local Positions = p2.Positions
		if not Positions then
			return
		end
		local function writeAxisPayload(p1, p2, p3) --[[ writeAxisPayload | Line: 431 ]]
			for k, v in pairs(p3) do
				if k == "Rotation" or k == "Position" then
					local v1 = p1:FindFirstChild(k)
					local v2 = p2:FindFirstChild(k)
					if v1 then
						v1.Value = v
					end
					if v2 then
						v2.Value = v
					end
				end
			end
		end
		if Positions.AllAxes == nil then
			local Axis = Positions.Axis
			if not Axis then
				return
			end
			local v5 = v4:FindFirstChild(Axis)
			local v6 = v32:FindFirstChild(Axis)
			if not (v5 and v6) then
				return
			end
			for k, v in pairs(Positions) do
				if k ~= "Axis" then
					local v7 = v5:FindFirstChild(k)
					local v8 = v6:FindFirstChild(k)
					if v7 then
						v7.Value = v
					end
					if v8 then
						v8.Value = v
					end
				end
			end
		else
			for k, v in pairs(Positions.AllAxes) do
				if typeof(v) == "table" and not (v4:FindFirstChild(k) and v32:FindFirstChild(k)) then
					return false
				end
			end
			for k, v in pairs(Positions.AllAxes) do
				if typeof(v) == "table" then
					writeAxisPayload(v4:FindFirstChild(k), v32:FindFirstChild(k), v)
				end
			end
		end
		return true
	end
end
t:Init()
return t