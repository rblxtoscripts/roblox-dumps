-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("MessagesClient")
local v2 = Sonar("EquipmentService")
local v3 = Sonar("AnimalDataService")
local v4 = Sonar("Maid")
local v5 = Sonar("DisplayAnimalClient")
local v6 = Sonar("PromptClient")
local v7 = Sonar("PlayerWrapper").GetClient()
local t2 = {}
local function animalAdded(p1, p2) --[[ animalAdded | Line: 21 | Upvalues: v4 (copy), t2 (copy), v2 (copy), v1 (copy), v3 (copy), ReplicatedStorage (copy) ]]
	if not p2 then
		task.wait()
	end
	local v12 = v4.new()
	t2[p1] = v12
	local v22 = v2.HasSlotUnlockedEquipment(p1)
	for k, v in pairs(p1:WaitForChild("Upgrades"):GetChildren()) do
		v12:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 32 | Upvalues: v22 (ref), v2 (ref), p1 (copy), v1 (ref), v3 (ref), ReplicatedStorage (ref) ]]
			if v22 or not v2.HasSlotUnlockedEquipment(p1) then
				return
			end
			v22 = true
			v1:AddNotification({
				Type = "CustomiseUnlock",
				DoNotSkip = true,
				Duration = 3.5,
				Text = v3.GetCustomName(p1),
				Sound = { ReplicatedStorage.Storage.SFX.OpenInventory, ReplicatedStorage.Storage.SFX.EquipmentMessage }
			})
		end))
	end
	local v32 = v3.HasUnlockedFertility(p1)
	for k, v in pairs(p1:WaitForChild("Upgrades"):GetChildren()) do
		v12:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 53 | Upvalues: v32 (ref), v3 (ref), p1 (copy), v1 (ref), ReplicatedStorage (ref) ]]
			if v32 or not v3.HasUnlockedFertility(p1) then
				return
			end
			v32 = true
			v1:AddNotification({
				Type = "FertilityUnlock",
				Text = "Fertility",
				DoNotSkip = true,
				Duration = 3.5,
				SubText = v3.GetCustomName(p1),
				Sound = { ReplicatedStorage.Storage.SFX.EquipmentMessage }
			})
		end))
	end
end
local function animalRemoved(p1) --[[ animalRemoved | Line: 72 | Upvalues: t2 (copy) ]]
	if t2[p1] then
		t2[p1]:Destroy()
		t2[p1] = nil
	end
end
local function yieldForNoScreens(p1) --[[ yieldForNoScreens | Line: 78 | Upvalues: v5 (copy), v6 (copy) ]]
	if v5.YieldForNoDisplay() then
		task.wait(1)
	end
	if v6.YieldForNoPrompt() then
		task.wait(1)
	end
	if not p1 then
		return
	end
	task.wait(p1)
end
function t.Init(p1) --[[ Init | Line: 91 | Upvalues: v7 (copy), animalAdded (copy), animalRemoved (copy), yieldForNoScreens (copy), v1 (copy), ReplicatedStorage (copy), v5 (copy), v6 (copy) ]]
	v7:GetItemFolder("Animals").ChildAdded:Connect(animalAdded)
	v7:GetItemFolder("Animals").ChildRemoved:Connect(animalRemoved)
	for k, v in pairs(v7:GetItemFolder("Animals"):GetChildren()) do
		animalAdded(v, true)
	end
	for k, v in pairs(v7.PlayerData.Missions.SpeciesUnlocks:GetChildren()) do
		if v.Name ~= "Horse" then
			local Completed = v.Completed.Value
			v.Completed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 102 | Upvalues: Completed (copy), v (copy), yieldForNoScreens (ref), v1 (ref), ReplicatedStorage (ref) ]]
				if Completed or not v.Completed.Value then
					return
				end
				task.delay(1, function() --[[ Line: 104 | Upvalues: yieldForNoScreens (ref), v1 (ref), v (ref), ReplicatedStorage (ref) ]]
					yieldForNoScreens()
					local t = {
						Type = "TamingUnlock",
						DoNotSkip = true,
						Duration = 3.5,
						Text = v.Name .. " Breeding"
					}
					t.SubText = if v.Name == "Horse" then "You have completed" else "You have unlocked"
					t.Sound = { ReplicatedStorage.Storage.SFX.EquipmentMessage, ReplicatedStorage.Storage.SFX.QuestComplete2 }
					v1:AddNotification(t)
				end)
			end)
		end
	end
	for k, v in pairs(v7.PlayerData.ExtraSpeciesUnlocks:GetChildren()) do
		local v12 = v.Value
		v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 123 | Upvalues: v12 (copy), v (copy), yieldForNoScreens (ref), v1 (ref), ReplicatedStorage (ref) ]]
			if v12 or not v.Value then
				return
			end
			task.delay(1, function() --[[ Line: 125 | Upvalues: yieldForNoScreens (ref), v1 (ref), v (ref), ReplicatedStorage (ref) ]]
				yieldForNoScreens()
				local t = {
					Type = "TamingUnlock",
					DoNotSkip = true,
					Duration = 3.5,
					Text = v.Name .. " Breeding"
				}
				t.SubText = if v.Name == "Horse" then "You have completed" else "You have unlocked"
				t.Sound = { ReplicatedStorage.Storage.SFX.EquipmentMessage, ReplicatedStorage.Storage.SFX.QuestComplete2 }
				v1:AddNotification(t)
			end)
		end)
	end
	local Bisorse = v7.PlayerData.Missions.SpeciesUnlocks.Bisorse
	local Completed = Bisorse.Completed.Value
	Bisorse.Completed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 146 | Upvalues: Completed (copy), Bisorse (copy), v5 (ref), v6 (ref), v1 (ref), ReplicatedStorage (ref) ]]
		if Completed or not Bisorse.Completed.Value then
			return
		end
		task.delay(1.25, function() --[[ Line: 148 | Upvalues: v5 (ref), v6 (ref), v1 (ref), ReplicatedStorage (ref) ]]
			if v5.YieldForNoDisplay() then
				task.wait(1)
			end
			if not v6.YieldForNoPrompt() then
				task.wait(1.25)
				v1:AddNotification({
					Type = "TradeWorldUnlock",
					DoNotSkip = true,
					Duration = 3.5,
					Sound = { ReplicatedStorage.Storage.SFX.EquipmentMessage, ReplicatedStorage.Storage.SFX.QuestComplete2 }
				})
				return
			end
			task.wait(1)
			task.wait(1.25)
			v1:AddNotification({
				Type = "TradeWorldUnlock",
				DoNotSkip = true,
				Duration = 3.5,
				Sound = { ReplicatedStorage.Storage.SFX.EquipmentMessage, ReplicatedStorage.Storage.SFX.QuestComplete2 }
			})
		end)
	end)
	local ExtraHotbarSlots = v7.PlayerData.ExtraHotbarSlots.Value
	v7.PlayerData.ExtraHotbarSlots:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 164 | Upvalues: v7 (ref), ExtraHotbarSlots (ref), v5 (ref), v6 (ref), v1 (ref), ReplicatedStorage (ref) ]]
		local v12 = ExtraHotbarSlots < v7.PlayerData.ExtraHotbarSlots.Value
		ExtraHotbarSlots = v7.PlayerData.ExtraHotbarSlots.Value
		if not v12 then
			return
		end
		task.delay(1, function() --[[ Line: 168 | Upvalues: v5 (ref), v6 (ref), v1 (ref), ReplicatedStorage (ref) ]]
			if v5.YieldForNoDisplay() then
				task.wait(1)
			end
			if v6.YieldForNoPrompt() then
				task.wait(1)
			end
			task.wait(0.5)
			v1:AddNotification({
				Type = "HotbarSlotUnlock",
				DoNotSkip = true,
				Duration = 3.5,
				Sound = { ReplicatedStorage.Storage.SFX.EquipmentMessage, ReplicatedStorage.Storage.SFX.QuestComplete2 }
			})
		end)
	end)
end
t:Init()
return t