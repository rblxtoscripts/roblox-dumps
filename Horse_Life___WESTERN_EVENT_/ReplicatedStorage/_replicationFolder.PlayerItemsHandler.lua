-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("DailyLoginService")
local v3 = Sonar("FormatNumber")
local v4 = Sonar("Signal")
local v5 = Sonar("Table")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("ItemDataService")
local v9 = Sonar("DataUtils")
local v10 = Sonar("NotificationsService")
local v11 = Sonar("WeightedProbability")
local v12 = Sonar("MissionsService")
local v13 = v1 and Sonar("AnalyticsService")
local v14 = v1 and Sonar("ExploitTracker")
local v15 = Sonar("StorageUtils")
local v16 = Sonar("PlaceTypeService")
local v17 = Sonar("Constants")
local EquipmentPaletteLimit = v17.EquipmentPaletteLimit
local PotionLimit = v17.PotionLimit
local v18 = Sonar(v15.Get("StorageSlots"))
local v19 = Sonar(v15.Get("AnimalStorageSlots"))
local v20 = Sonar(v15.Get("EquipSlots"))
local v21 = Sonar(v15.Get("InventorySlots"))
local v22 = Sonar(v15.Get("BuildingStorageSlots"))
local v23 = v12.GetType("Achivements")
local t2 = {
	RandomFlair = "Flairs",
	RandomEquipment = "Equipment",
	RandomPalette = "EquipmentPalettes"
}
local t3 = { "DoNotLog" }
local v24 = v6.GetRemoteEvent("SendDropsRemote")
local v25 = v6.GetRemoteEvent("ItemStreamRemote")
local function addItemAnalytics(p1, p2, p3, p4, p5, p6, ...) --[[ addItemAnalytics | Line: 56 | Upvalues: t3 (copy), v13 (copy) ]]
	if not table.find(t3, p5) then
		v13.ReportResourceEvent(p1, p2, p3, p4, p5, p6, ...)
	end
end
local t4 = {
	Currency = function(p1, p2, p3) --[[ Currency | Line: 65 | Upvalues: addItemAnalytics (copy) ]]
		local v1 = p1:GetCurrencyValue(p2.Name)
		if not v1 then
			return
		end
		if p2.ApplyModifiers then
			p2.Amount = p2.Amount * p1.PlayerWrapper:GetWithModifiers({
				Default = 1,
				Name = p2.Name .. "Multiplier"
			})
		end
		v1.Value = v1.Value + p2.Amount
		if p3 ~= "DoNotLog" and not p2.DoNotIncrementMission then
			p1.PlayerWrapper:IncrementMission({
				Type = "GetItem",
				Data = { p2.Name, p3 },
				Amount = p2.Amount
			})
		end
		addItemAnalytics(p1.Player, "Source", "Currency", p2.Name, p3, p2.Amount, {
			{
				Key = "Total",
				Value = v1.Value
			}
		})
		return p2.Amount
	end,
	Buildings = function(p1, p2, p3) --[[ Buildings | Line: 93 | Upvalues: v9 (copy), addItemAnalytics (copy) ]]
		if p2.Unlock then
			local v1 = p1.PlayerWrapper.PlayerData.UnlockedFurniture:FindFirstChild(p2.Name)
			if v1 and not v1.Value then
				v1.Value = true
				return
			end
		end
		local t = {}
		for i = 1, p2.Amount do
			t[i] = v9.CreateIndexedDataValue(p1:GetItemFolder("Buildings"), {
				DataValueName = "Buildings",
				Equipped = false,
				Value = p2.Name
			}, true)
		end
		addItemAnalytics(p1.Player, "Source", "Buildings", p2.Name, p3, p2.Amount)
		return #t == 1 and t[1] or t
	end,
	Flairs = function(p1, p2, p3) --[[ Flairs | Line: 115 | Upvalues: v17 (copy), v11 (copy), v9 (copy), addItemAnalytics (copy) ]]
		local t = {}
		for i = 1, p2.Amount do
			local v2 = v17.RandomDrops[p2.Name] and v11.getRandomWeightedItem(v17.RandomDrops[p2.Name]) or p2.Name
			t[i] = v9.CreateIndexedDataValue(p1:GetItemFolder("Equipment"), {
				DataValueName = "Flairs",
				Value = v2
			}, true)
			addItemAnalytics(p1.Player, "Source", "Flairs", v2, p3, 1)
		end
		return #t == 1 and t[1] or t
	end,
	Equipment = function(p1, p2, p3) --[[ Equipment | Line: 132 | Upvalues: v17 (copy), v11 (copy), v8 (copy), v9 (copy), addItemAnalytics (copy) ]]
		local t = {}
		for i = 1, p2.Amount do
			local v2 = v17.RandomDrops[p2.Name] and v11.getRandomWeightedItem(v17.RandomDrops[p2.Name]) or p2.Name
			local v3 = v8.GetByName(v2)
			local Theme = p2.Theme
			if type(Theme) == "table" then
				Theme = v11.getRandomWeightedItem(Theme)
			elseif Theme == "Random" then
				local v5 = math.random()
				if v5 <= (p2.ThemeChance or v17.RandomEquipmentDropThemeChance) then
					Theme = v11.getRandomWeightedItem(v17.RandomEquipmentDropThemes)
				end
			end
			if not Theme then
				Theme = ""
			end
			local v82 = p1:GetItemFolder("Equipment")
			local t2 = {
				DataValueName = "Equipment",
				Equipped = false,
				Value = v2
			}
			t2.Theme = if Theme == "Nothing" then "" else Theme
			local v10 = v9.CreateIndexedDataValue(v82, t2)
			if v3.ColorableRegions then
				for k, v in pairs(v3.ColorableRegions) do
					local v112 = Instance.new("StringValue")
					v112.Name = k
					v112.Parent = v10
				end
			end
			v10.Parent = p1:GetItemFolder("Equipment")
			t[i] = v10
			addItemAnalytics(p1.Player, "Source", "Equipment", v2, p3, 1)
		end
		return #t == 1 and t[1] or t
	end,
	EquipmentPalettes = function(p1, p2, p3) --[[ EquipmentPalettes | Line: 174 | Upvalues: v17 (copy), v11 (copy), EquipmentPaletteLimit (copy), addItemAnalytics (copy) ]]
		local t = {}
		for i = 1, p2.Amount do
			local v3 = p1:GetItemValue(v17.RandomDrops[p2.Name] and v11.getRandomWeightedItem(v17.RandomDrops[p2.Name]) or p2.Name, "EquipmentPalettes")
			if v3 then
				v3.Value = math.clamp(v3.Value + 1, 0, EquipmentPaletteLimit)
				addItemAnalytics(p1.Player, "Source", p2.ItemType, p2.Name, p3, 1)
			end
		end
		return #t == 1 and t[1] or t
	end,
	Potions = function(p1, p2, p3) --[[ Potions | Line: 190 | Upvalues: PotionLimit (copy), addItemAnalytics (copy) ]]
		local v1 = p1:GetItemValue(p2.Name, "Potions")
		if not v1 then
			return
		end
		if PotionLimit < v1.Value then
			return false
		else
			v1.Value = v1.Value + p2.Amount
			addItemAnalytics(p1.Player, "Source", p2.ItemType, p2.Name, p3, p2.Amount)
			return true
		end
	end,
	Chests = function(p1, p2, p3) --[[ Chests | Line: 206 | Upvalues: v9 (copy), addItemAnalytics (copy) ]]
		local t = {}
		for i = 1, p2.Amount do
			local v1 = v9.CreateIndexedDataValue(p1:GetItemFolder("Chests"), {
				DataValueName = "Chests",
				Value = p2.Name
			})
			v1.LuckPower.Value = math.clamp(p2.LuckPower or 1, 0, 100)
			v1.Parent = p1:GetItemFolder("Chests")
			t[i] = v1
			addItemAnalytics(p1.Player, "Source", "Chests", p2.Name, p3, 1)
		end
		return #t == 1 and t[1] or t
	end,
	Seeds = function(p1, p2, p3) --[[ Seeds | Line: 222 | Upvalues: v8 (copy), v9 (copy), addItemAnalytics (copy) ]]
		local v1 = v8.GetByName(p2.Name)
		local t = {}
		for i = 1, p2.Amount do
			local v2 = v9.CreateIndexedDataValue(p1:GetItemFolder("Seeds"), {
				DataValueName = "Seeds",
				Value = p2.Name
			})
			for k, v in pairs(v2:GetChildren()) do
				if v1[v.Name] then
					local v3 = v1[v.Name]
					if type(v3) == "table" then
						v3 = math.random(v3.Min, v3.Max)
					end
					v.Value = v3
				end
			end
			v2.Parent = p1:GetItemFolder("Seeds")
			t[i] = v2
			addItemAnalytics(p1.Player, "Source", "Seeds", p2.Name, p3, 1)
		end
		return #t == 1 and t[1] or t
	end,
	Default = function(p1, p2, p3) --[[ Default | Line: 251 | Upvalues: addItemAnalytics (copy) ]]
		local v1 = p1:GetItemValue(p2.Name, p2.ItemType)
		if v1 then
			v1.Value = v1.Value + p2.Amount
			addItemAnalytics(p1.Player, "Source", p2.ItemType, p2.Name, p3, p2.Amount)
			return true
		end
	end,
	Capsules = function(p1, p2, p3) --[[ Capsules | Line: 262 | Upvalues: addItemAnalytics (copy) ]]
		local v1 = p1:GetItemValue(p2.Name, p2.ItemType)
		if v1 then
			v1.Value = v1.Value + p2.Amount
			addItemAnalytics(p1.Player, "Source", p2.ItemType, p2.Name, p3, p2.Amount)
			return true
		end
	end,
	ItemCapsules = function(p1, p2, p3) --[[ ItemCapsules | Line: 273 | Upvalues: addItemAnalytics (copy) ]]
		local v1 = p1:GetItemValue(p2.Name, p2.ItemType)
		if v1 then
			v1.Value = v1.Value + p2.Amount
			addItemAnalytics(p1.Player, "Source", p2.ItemType, p2.Name, p3, p2.Amount)
			return true
		end
	end
}
function t.new(p1) --[[ new | Line: 285 | Upvalues: t (copy), v17 (copy), v4 (copy), v18 (copy), v2 (copy), v23 (copy), v19 (copy), v22 (copy), v21 (copy), v8 (copy) ]]
	local v24 = setmetatable({}, t)
	v24.Maid = p1.Maid
	v24.PlayerData = p1.PlayerData
	v24.Player = p1.Player
	v24.PlayerWrapper = p1
	v24.Drops = {}
	if v24.PlayerData then
		if v17.EventName then
			v24.PlayerData = p1.PlayerData
			v24.EventData = p1.PlayerData.Events:FindFirstChild(v17.EventName)
			p1.EventData = v24.EventData
		end
		v24.GamepassData = p1.GamepassFolder
		v24.LastLimitNotify = {}
		v24.CurrencyValues = {
			Coins = v24.PlayerData.Currency:WaitForChild("Coins"),
			ClubTokens = v24.PlayerData.Currency:WaitForChild("ClubTokens"),
			GoldCoins = v24.PlayerData.Currency:WaitForChild("GoldCoins"),
			GoldEggs = v24.PlayerData.Currency:WaitForChild("GoldEggs")
		}
		if v17.EventCurrencyName then
			v24.CurrencyValues[v17.EventCurrencyName] = p1.EventData:FindFirstChild(v17.EventCurrencyName)
		end
		v24.HotbarChangedSignals = {}
		p1.HotbarData = v24.PlayerData.Hotbar
		p1.HotbarChangedSignal = v4.new()
		v24.Maid:GiveTask(p1.HotbarChangedSignal)
		for k, v in pairs(p1.HotbarData:GetChildren()) do
			local v3 = v.Value
			v24.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 326 | Upvalues: p1 (copy), v (copy), v3 (ref), v24 (copy) ]]
				task.wait()
				p1.HotbarChangedSignal:Fire((tonumber(v.Name)))
				if #v3 > 0 then
					v24:GetHotbarChangedSignal(v3):Fire()
				end
				v3 = v.Value
				if not (#v3 > 0) then
					return
				end
				v24:GetHotbarChangedSignal(v3):Fire()
			end))
		end
		p1.TutorialData = v24.PlayerData.Tutorial
		v24.ItemFolders = {
			Animals = v24.PlayerData.Animals,
			Food = v24.PlayerData.Food,
			Tools = v24.PlayerData.Tools,
			Children = v24.PlayerData.Children,
			Miscellaneous = v24.PlayerData.Miscellaneous,
			Potions = v24.PlayerData.Potions,
			Buildings = v24.PlayerData.Buildings,
			Resources = v24.PlayerData.Resources,
			Equipment = v24.PlayerData.Equipment,
			EquipmentPalettes = v24.PlayerData.EquipmentPalettes,
			StackableChests = v24.PlayerData.StackableChests,
			Chests = v24.PlayerData.Chests,
			Seeds = v24.PlayerData.Seeds,
			Capsules = v24.PlayerData.Capsules,
			ItemCapsules = v24.PlayerData.ItemCapsules
		}
		v24.PlotSavesData = p1.PlayerData:WaitForChild("PlotSaves")
		p1.PlotSavesData = v24.PlotSavesData
		v24.TrackedIndexedAmounts = {}
		for k, v in pairs({ "Buildings", "Equipment", "Chests", "Seeds" }) do
			v24:TrackIndexedItems(v)
		end
		p1.CurrencyValues = v24.CurrencyValues
		local v42 = v4.new()
		v24.Maid:GiveTask(v42)
		for v5, v6 in v24.PlayerData.Missions.Achivements:GetChildren() do
			v24.Maid:GiveTask(v6:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 382 | Upvalues: v42 (copy) ]]
				v42:Fire()
			end))
		end
		v24.StorageTiersPurchasedValue = v24.PlayerData.StorageTiersPurchased
		v24.AnimalStorageTiersPurchasedValue = v24.PlayerData.AnimalStorageTiersPurchased
		local v7 = v4.new()
		v24.Maid:GiveTask(v7)
		for k, v in pairs({
			v24.StorageTiersPurchasedValue:GetPropertyChangedSignal("Value"),
			v24.AnimalStorageTiersPurchasedValue:GetPropertyChangedSignal("Value"),
			v24.StorageTiersPurchasedValue.RobuxTiersPurchased:GetPropertyChangedSignal("Value"),
			v24.AnimalStorageTiersPurchasedValue.RobuxTiersPurchased:GetPropertyChangedSignal("Value"),
			p1.LoyaltyChangedSignal,
			p1.CommunityActiveChangedSignal,
			v42
		}) do
			v24.Maid:GiveTask(v:Connect(function() --[[ Line: 396 | Upvalues: v7 (copy) ]]
				v7:Fire()
			end))
		end
		p1.MaxSlotsChangedSignal = v7
		v24.EquipTiersPurchasedValue = v24.PlayerData.EquipTiersPurchased
		local v82 = v4.new()
		v24.Maid:GiveTask(v82)
		for k, v in pairs({ v24.EquipTiersPurchasedValue:GetPropertyChangedSignal("Value"), v24.EquipTiersPurchasedValue.RobuxTiersPurchased:GetPropertyChangedSignal("Value") }) do
			v24.Maid:GiveTask(v:Connect(function() --[[ Line: 407 | Upvalues: v82 (copy) ]]
				v82:Fire()
			end))
		end
		p1.MaxEquipChangedSignal = v82
		v24.InventoryTiersPurchasedValue = v24.PlayerData.InventoryTiersPurchased
		local v9 = v4.new()
		v24.Maid:GiveTask(v9)
		local v10 = v4.new()
		v24.Maid:GiveTask(v10)
		for k, v in pairs({
			v24.InventoryTiersPurchasedValue:GetPropertyChangedSignal("Value"),
			v24.InventoryTiersPurchasedValue.RobuxTiersPurchased:GetPropertyChangedSignal("Value"),
			p1.LoyaltyChangedSignal,
			p1.CommunityActiveChangedSignal
		}) do
			v24.Maid:GiveTask(v:Connect(function() --[[ Line: 421 | Upvalues: v9 (copy) ]]
				v9:Fire()
			end))
		end
		p1.MaxInventoryChangedSignal = v9
		for k, v in pairs(v24.ItemFolders) do
			for k2, v3 in pairs(v:GetChildren()) do
				if not v3:IsA("IntValue") then
					break
				end
				v24.Maid:GiveTask(v3:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 429 | Upvalues: v10 (copy) ]]
					v10:Fire()
				end))
			end
		end
		v24.Maid:GiveTask(v24:GetTrackedTotalValue("Equipment"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 434 | Upvalues: v10 (copy) ]]
			v10:Fire()
		end))
		p1.InventoryItemsChangedSignal = v10
		v24.BuildingStorageTiersPurchasedValue = v24.PlotSavesData.BuildingStorageTiersPurchased
		local v11 = v4.new()
		v24.Maid:GiveTask(v11)
		for k, v in pairs({ v24.BuildingStorageTiersPurchasedValue:GetPropertyChangedSignal("Value") }) do
			v24.Maid:GiveTask(v:Connect(function() --[[ Line: 444 | Upvalues: v11 (copy) ]]
				v11:Fire()
			end))
		end
		p1.MaxBuildingStorageChangedSignal = v11
		v24.ItemLimits = {
			Currency = {
				Get = function() --[[ Get | Line: 452 ]]
					return 0
				end,
				GetLimit = function() --[[ GetLimit | Line: 455 ]]
					return 9000000000
				end
			},
			Animals = {
				Get = function() --[[ Get | Line: 462 | Upvalues: v24 (copy) ]]
					local count = 0
					for k, v in pairs(v24:GetItemFolder("Animals"):GetChildren()) do
						local InStorage = v:WaitForChild("InStorage", 1)
						if not (InStorage and InStorage.Value) then
							count = count + 1
						end
					end
					return count
				end,
				GetLimit = function() --[[ GetLimit | Line: 471 | Upvalues: v17 (ref), v18 (ref), v24 (copy), v2 (ref), v23 (ref) ]]
					local Animals = v17.ItemLimits.Animals
					for k, v in pairs(v18.Free) do
						if not (k <= v24.StorageTiersPurchasedValue.Value) then
							break
						end
						Animals = Animals + v.Amount
					end
					for k, v in pairs(v18.Robux) do
						if not (k <= v24.StorageTiersPurchasedValue.RobuxTiersPurchased.Value) then
							break
						end
						Animals = Animals + v.Amount
					end
					local sum = Animals + v24.PlayerData.ExtraStorageSlots.Value + v2:GetSubscriberAnimalSlots(v24.PlayerWrapper)
					if v24.PlayerWrapper.LoyaltyHandler.LoyaltyActive then
						sum = sum + v17.LoyaltyRewards.SignUp.StableStorage
						if v24.PlayerWrapper.LoyaltyHandler.CommunityActive then
							sum = sum + v17.LoyaltyRewards.SignUp.StableStorage
						end
					end
					for v1, v22 in v23 do
						if v24.PlayerData.Missions.Achivements[tostring(v1)].Value and v22.UnlockedRewards and typeof(v22.UnlockedRewards.StableStorage) == "number" then
							sum = sum + v22.UnlockedRewards.StableStorage
						end
					end
					return sum
				end
			},
			AnimalStorage = {
				Get = function() --[[ Get | Line: 528 | Upvalues: v24 (copy) ]]
					local count = 0
					for k, v in pairs(v24:GetItemFolder("Animals"):GetChildren()) do
						local InStorage = v:WaitForChild("InStorage", 1)
						if not InStorage or InStorage.Value then
							count = count + 1
						end
					end
					return count
				end,
				GetLimit = function() --[[ GetLimit | Line: 537 | Upvalues: v17 (ref), v19 (ref), v24 (copy) ]]
					local AnimalStorage = v17.ItemLimits.AnimalStorage
					for k, v in pairs(v19.Free) do
						if not (k <= v24.AnimalStorageTiersPurchasedValue.Value) then
							break
						end
						AnimalStorage = AnimalStorage + v.Amount
					end
					for k, v in pairs(v19.Robux) do
						if not (k <= v24.AnimalStorageTiersPurchasedValue.RobuxTiersPurchased.Value) then
							break
						end
						AnimalStorage = AnimalStorage + v.Amount
					end
					return AnimalStorage
				end
			},
			Buildings = {
				Changed = { v11, v24:GetTrackedTotalValue("Buildings"):GetPropertyChangedSignal("Value") },
				Get = function() --[[ Get | Line: 566 | Upvalues: v24 (copy) ]]
					return #v24:GetItemFolder("Buildings"):GetChildren()
				end,
				GetLimit = function() --[[ GetLimit | Line: 569 | Upvalues: v17 (ref), v22 (ref), v24 (copy) ]]
					local Buildings = v17.ItemLimits.Buildings
					for k, v in pairs(v22) do
						if not (k <= v24.BuildingStorageTiersPurchasedValue.Value) then
							break
						end
						Buildings = Buildings + v.Amount
					end
					return Buildings
				end
			},
			Inventory = {
				Changed = { v9, v10 },
				Get = function() --[[ Get | Line: 591 | Upvalues: v24 (copy) ]]
					local sum = 0
					for k, v in pairs(v24.ItemFolders) do
						for k2, v2 in pairs(v:GetChildren()) do
							if not v2:IsA("IntValue") then
								break
							end
							sum = sum + v2.Value
						end
					end
					return sum + v24:GetTrackedTotalValue("Equipment").Value + v24:GetTrackedTotalValue("Chests").Value + v24:GetTrackedTotalValue("Seeds").Value
				end,
				GetLimit = function() --[[ GetLimit | Line: 610 | Upvalues: v17 (ref), v21 (ref), v24 (copy), v2 (ref) ]]
					local Inventory = v17.ItemLimits.Inventory
					for k, v in pairs(v21.Free) do
						if not (k <= v24.InventoryTiersPurchasedValue.Value) then
							break
						end
						Inventory = Inventory + v.Amount
					end
					for k, v in pairs(v21.Robux) do
						if not (k <= v24.InventoryTiersPurchasedValue.RobuxTiersPurchased.Value) then
							break
						end
						Inventory = Inventory + v.Amount
					end
					local sum = Inventory + v2:GetSubscriberInventorySlots(v24.PlayerWrapper)
					if v24.PlayerWrapper.LoyaltyHandler.LoyaltyActive and v24.PlayerWrapper.LoyaltyHandler.CommunityActive then
						sum = sum + v17.LoyaltyRewards.SignUp.CommunityInventoryStorage
					end
					return sum
				end
			}
		}
		p1.BreedingPermissionsChangedSignal = v4.new()
		v24.Maid:GiveTask(p1.BreedingPermissionsChangedSignal)
		for k, v in pairs(v8.GetType("Animals")) do
			if v.RequiresBreedPermission then
				v24.Maid:GiveTask(v24:GetItemValue(v.RequiresBreedPermission):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 657 | Upvalues: p1 (copy) ]]
					p1.BreedingPermissionsChangedSignal:Fire()
				end))
			end
		end
	end
	for k, v in pairs(t) do
		if type(v) == "function" and not p1[k] then
			p1[k] = function(p1, ...) --[[ Line: 669 | Upvalues: v (copy), v24 (copy) ]]
				return v(v24, ...)
			end
		end
	end
	v24.Maid:GiveTask(function() --[[ Line: 674 | Upvalues: v24 (copy) ]]
		table.clear(v24)
	end)
	return v24
end
function t.GetHotbarChangedSignal(p1, p2) --[[ GetHotbarChangedSignal | Line: 682 | Upvalues: v4 (copy) ]]
	if p1.HotbarChangedSignals[p2] then
		return p1.HotbarChangedSignals[p2]
	else
		local v1 = v4.new()
		p1.Maid:GiveTask(v1)
		p1.HotbarChangedSignals[p2] = v1
		return v1
	end
end
function t.TrackIndexedItems(p1, p2) --[[ TrackIndexedItems | Line: 695 | Upvalues: v8 (copy) ]]
	local t = {
		Items = {},
		TotalOwnedValue = Instance.new("IntValue")
	}
	p1.TrackedIndexedAmounts[p2] = t
	for k, v in pairs(v8.GetType(p2)) do
		t.Items[v.Name] = {
			Values = {},
			TotalOwnedValue = Instance.new("IntValue")
		}
		if p2 == "Equipment" then
			for k2, v2 in pairs(v8.GetType("Flairs")) do
				t.Items[v2.Name] = {
					Values = {},
					TotalOwnedValue = Instance.new("IntValue")
				}
			end
		end
	end
	local function removeItem(p1, p2) --[[ removeItem | Line: 718 | Upvalues: t (copy) ]]
		local v2 = t.Items[if p2 then p2 else p1.Value]
		if not v2 then
			return
		end
		if v2.Values[p1] then
			local TotalOwnedValue = v2.TotalOwnedValue
			TotalOwnedValue.Value = TotalOwnedValue.Value - 1
			local TotalOwnedValue_2 = t.TotalOwnedValue
			TotalOwnedValue_2.Value = TotalOwnedValue_2.Value - 1
		end
		v2.Values[p1] = nil
	end
	local function addItem(p1, p2) --[[ addItem | Line: 728 | Upvalues: t (copy) ]]
		local v1 = t.Items[p1.Value]
		if not v1 then
			return
		end
		if not v1.Values[p1] then
			local TotalOwnedValue = v1.TotalOwnedValue
			TotalOwnedValue.Value = TotalOwnedValue.Value + 1
			local TotalOwnedValue_2 = t.TotalOwnedValue
			TotalOwnedValue_2.Value = TotalOwnedValue_2.Value + 1
		end
		v1.Values[p1] = true
	end
	local function trackItem(p12, p2) --[[ trackItem | Line: 738 | Upvalues: p1 (copy), t (copy) ]]
		if not p2 then
			task.wait()
		end
		p1.Maid:GiveTask(p12.AncestryChanged:Connect(function() --[[ Line: 740 | Upvalues: p12 (copy), p1 (ref), t (ref) ]]
			if p12.Parent then
				return
			end
			if not p1.Player then
				return
			end
			if not p1.Player.Parent then
				return
			end
			local v1 = p12
			local v2 = t.Items[v1.Value]
			if not v2 then
				return
			end
			if v2.Values[v1] then
				local TotalOwnedValue = v2.TotalOwnedValue
				TotalOwnedValue.Value = TotalOwnedValue.Value - 1
				local TotalOwnedValue_2 = t.TotalOwnedValue
				TotalOwnedValue_2.Value = TotalOwnedValue_2.Value - 1
			end
			v2.Values[v1] = nil
		end))
		local v1 = t.Items[p12.Value]
		if not v1 then
			return
		end
		if not v1.Values[p12] then
			local TotalOwnedValue = v1.TotalOwnedValue
			TotalOwnedValue.Value = TotalOwnedValue.Value + 1
			local TotalOwnedValue_2 = t.TotalOwnedValue
			TotalOwnedValue_2.Value = TotalOwnedValue_2.Value + 1
		end
		v1.Values[p12] = true
	end
	p1.Maid:GiveTask(p1:GetItemFolder(p2).ChildAdded:Connect(trackItem))
	for k, v in pairs(p1:GetItemFolder(p2):GetChildren()) do
		p1.Maid:GiveTask(v.AncestryChanged:Connect(function() --[[ Line: 740 | Upvalues: v (copy), p1 (copy), t (copy) ]]
			if v.Parent then
				return
			end
			if not p1.Player then
				return
			end
			if not p1.Player.Parent then
				return
			end
			local v1 = v
			local v2 = t.Items[v1.Value]
			if not v2 then
				return
			end
			if v2.Values[v1] then
				local TotalOwnedValue = v2.TotalOwnedValue
				TotalOwnedValue.Value = TotalOwnedValue.Value - 1
				local TotalOwnedValue_2 = t.TotalOwnedValue
				TotalOwnedValue_2.Value = TotalOwnedValue_2.Value - 1
			end
			v2.Values[v1] = nil
		end))
		local v1 = t.Items[v.Value]
		if v1 then
			if not v1.Values[v] then
				local TotalOwnedValue = v1.TotalOwnedValue
				TotalOwnedValue.Value = TotalOwnedValue.Value + 1
				local TotalOwnedValue_2 = t.TotalOwnedValue
				TotalOwnedValue_2.Value = TotalOwnedValue_2.Value + 1
			end
			v1.Values[v] = true
		end
	end
end
function t.GetTrackedTotalValue(p1, p2) --[[ GetTrackedTotalValue | Line: 754 ]]
	local v1 = p1.TrackedIndexedAmounts[p2]
	if v1 then
		return v1.TotalOwnedValue
	end
end
function t.GetTrackedItemValue(p1, p2, p3) --[[ GetTrackedItemValue | Line: 761 | Upvalues: v8 (copy) ]]
	local v1 = if p3 then p3 else v8.GetItemType(p2)
	if not v1 then
		return
	end
	local v2 = p1.TrackedIndexedAmounts[v1]
	if v2 then
		return v2.Items[p2].TotalOwnedValue
	end
end
function t.GiveItem(p1, p2) --[[ GiveItem | Line: 771 | Upvalues: t2 (copy), v8 (copy), v10 (copy), t4 (copy), v25 (copy), v1 (copy), v14 (copy) ]]
	p2.ItemType = p2.ItemType or (t2[p2.Name] or v8.GetItemType(p2.Name))
	if not p2.IgnoreLimit then
		local v2, v3 = p1:CanGiveItem(p2.ItemType, p2)
		if not v2 then
			if p1.LastLimitNotify[v3] and tick() - p1.LastLimitNotify[v3] < 3 then
				return
			end
			warn("Can\'t give item", p2.Name, p2.ItemType, v3)
			p1.LastLimitNotify[v3] = tick()
			v10.NotifyPlayer(p1.Player, "Max" .. v3)
			return
		end
	end
	local v5 = (t4[p2.Name] or (t4[p2.ItemType] or t4.Default))(p1, p2, p2.Source)
	if v5 then
		if p2.ItemStream then
			v25:FireClient(p1.Player, {
				Name = p2.Name,
				Amount = p2.Amount
			})
		end
		if v1 and v14 then
			local v6 = v14.GetTracker(p1.Player)
			if v6 then
				v6:CheckPotionExploit()
			end
		end
		local v7 = string.match(p2.Name, "(.+)BreedingLicense$")
		if v7 then
			local v82 = p1.PlayerData.ExtraSpeciesUnlocks:FindFirstChild(v7)
			if v82 then
				v82.Value = true
			end
		end
	end
	return v5
end
function t.CanAfford(p1, p2, p3) --[[ CanAfford | Line: 822 ]]
	local v1 = p1:GetCurrencyValue(p3)
	assert(v1, "Currency Value doesn\'t exist.")
	return if p2 <= v1.Value then v1 else false
end
function t.HasEnoughOfItem(p1, p2, p3, p4) --[[ HasEnoughOfItem | Line: 828 | Upvalues: v8 (copy) ]]
	local v1 = if p4 then p4 else v8.GetItemType(p3)
	if v1 == "Seeds" then
		local count = 0
		local v2 = nil
		for v3, v4 in p1:GetItemFolder("Seeds"):GetChildren() do
			if v4.Value == p3 then
				count = count + 1
				if not v2 then
					v2 = v4
				end
				if p2 <= count then
					return v2
				end
			end
		end
		return false
	else
		local v5 = p1:GetItemValue(p3, v1)
		assert(v5, "Item Value doesn\'t exist.")
		return if p2 <= v5.Value then v5 else false
	end
end
function t.CanGiveItem(p1, p2, ...) --[[ CanGiveItem | Line: 854 ]]
	local v1, v2 = p1:GetItemLimit(p2, ...)
	if not v1 then
		return true
	end
	return v1.Get(...) < v1.GetLimit(...), v2
end
function t.CanGiveItems(p1, p2) --[[ CanGiveItems | Line: 865 ]]
	local v1 = nil
	for v2, v3 in p2 do
		local v4 = p1:CanGiveItem(v3.ItemType, v3)
		v1 = v4
		if not v4 then
			break
		end
	end
	return v1
end
function t.GetItemLimit(p1, p2, ...) --[[ GetItemLimit | Line: 879 ]]
	local v1 = if p1.ItemLimits[p2] and p2 then p2 else "Inventory"
	return p1.ItemLimits[v1], v1
end
function t.GetAmountToUse(p1, p2, p3) --[[ GetAmountToUse | Line: 884 | Upvalues: v3 (copy) ]]
	if not p2 then
		return 0
	end
	if p2.Value <= 0 then
		return 0
	else
		local v1 = v3.SanitiseInput(p3)
		return math.min(p2.Value, v1)
	end
end
function t.ConsumeItem(p1, p2, p3, p4) --[[ ConsumeItem | Line: 896 ]]
	local v1 = p1:GetItemValue(p2, p4)
	if not v1 then
		return false
	end
	local v2 = p1:GetAmountToUse(v1, p3 or 1)
	if v2 <= 0 then
		return false
	else
		v1.Value = math.max(v1.Value - v2, 0)
		return true, v2
	end
end
function t.GetCurrencyValue(p1, p2) --[[ GetCurrencyValue | Line: 914 ]]
	return p1.CurrencyValues[p2 or "Coins"]
end
function t.GetItemValue(p1, p2, p3) --[[ GetItemValue | Line: 920 | Upvalues: v8 (copy), RunService (copy) ]]
	local v1 = if p3 then p3 else v8.GetItemType(p2)
	if not v1 then
		warn("NO ITEM TYPE", p2)
		return
	end
	local v2 = p1:GetItemFolder(v1)
	if v2 then
		return v2:FindFirstChild(p2)
	end
	if not RunService:IsStudio() then
		return nil
	end
	warn("NO ITEM FOLDER", v1)
	return nil
end
function t.GetItemValueAny(p1, p2, p3) --[[ GetItemValueAny | Line: 936 | Upvalues: v8 (copy) ]]
	local v1 = if p3 then p3 else v8.GetItemType(p2)
	if not v1 then
		warn("NO ITEM TYPE", p2)
		return
	end
	if v1 ~= "Seeds" then
		return p1:GetItemValue(p2, v1)
	end
	for v2, v3 in p1:GetItemFolder("Seeds"):GetChildren() do
		if v3.Value == p2 then
			return v3
		end
	end
	return nil
end
function t.GetIndexedItemValue(p1, p2, p3) --[[ GetIndexedItemValue | Line: 953 ]]
	return p1:GetItemValue(p2, p3)
end
function t.GetGamepassValue(p1, p2) --[[ GetGamepassValue | Line: 957 ]]
	return p1.GamepassData:FindFirstChild(p2)
end
function t.DoesPlayerOwnGamepass(p1, p2) --[[ DoesPlayerOwnGamepass | Line: 961 ]]
	return p1:GetGamepassValue(p2).Value
end
function t.GetItemFolder(p1, p2) --[[ GetItemFolder | Line: 965 | Upvalues: RunService (copy) ]]
	if p1.ItemFolders then
		return p1.ItemFolders[p2]
	end
	if not RunService:IsStudio() then
		return nil
	end
	warn("No item folders found" .. p2)
	return nil
end
function t.GetAnimalSlot(p1, p2) --[[ GetAnimalSlot | Line: 976 ]]
	return p1:GetIndexedItemValue(p2, "Animals")
end
function t.GetMaxEquipSlots(p1) --[[ GetMaxEquipSlots | Line: 980 | Upvalues: v16 (copy), v17 (copy), v20 (copy) ]]
	if v16.IsMarketWorld() then
		return 1
	end
	local EquippedAnimals = v17.ItemLimits.EquippedAnimals
	for k, v in pairs(v20.Free) do
		if not (k <= p1.EquipTiersPurchasedValue.Value) then
			break
		end
		EquippedAnimals = EquippedAnimals + v.Amount
	end
	for k, v in pairs(v20.Robux) do
		if not (k <= p1.EquipTiersPurchasedValue.RobuxTiersPurchased.Value) then
			break
		end
		EquippedAnimals = EquippedAnimals + v.Amount
	end
	return EquippedAnimals
end
function t.GetTotalEquippedAnimals(p1) --[[ GetTotalEquippedAnimals | Line: 1007 ]]
	return p1.PlayerWrapper.EquippedAnimalCount or 0
end
function t.AddItemCallback(p1, p2) --[[ AddItemCallback | Line: 1012 | Upvalues: t4 (copy) ]]
	t4[p1] = p2
end
function t.CanDrop(p1, p2) --[[ CanDrop | Line: 1016 | Upvalues: v17 (copy) ]]
	return table.find(v17.IndexedItemDrops, p2.Name) or table.find(v17.IndexedItemDrops, p2.ItemType)
end
function t._dropPickedUp(p1, p2) --[[ _dropPickedUp | Line: 1021 ]]
	if p2.OnPickUp then
		task.spawn(p2.OnPickUp, p1.Player, p2)
	else
		p1:GiveItem(p2)
	end
end
function t.GiveOrDropItem(p1, p2, p3) --[[ GiveOrDropItem | Line: 1029 | Upvalues: t2 (copy), v8 (copy) ]]
	local v1 = if p3 then p3 else {}
	p2.ItemType = p2.ItemType or (t2[p2.Name] or v8.GetItemType(p2.Name))
	if not p1:CanDrop(p2) then
		return p1:GiveItem(p2)
	end
	local v3 = v1
	for k, v in pairs(v1) do
		p2[k] = p2[k] ~= nil and p2[k] or v3[k]
	end
	p1:GiveDrop(p2)
end
function t.GiveDrop(p1, p2) --[[ GiveDrop | Line: 1043 | Upvalues: t2 (copy), v8 (copy), v17 (copy), addItemAnalytics (copy), v5 (copy), v24 (copy) ]]
	local Amount = p2.Amount
	local TotalDrops = p2.TotalDrops
	local v1 = p2.Name
	local v2 = p2.ItemType or t2[v1] or v8.GetItemType(v1)
	local v3 = table.find(v17.IndexedItemDrops, v1) or table.find(v17.IndexedItemDrops, v2)
	if p2.ApplyModifiers then
		Amount = Amount * p1.PlayerWrapper:GetWithModifiers({
			Default = 1,
			Name = v1 .. "Multiplier"
		})
	end
	local v52 = math.min(math.floor(Amount / TotalDrops), Amount)
	local isSource = p2.Source == "DoNotLog"
	addItemAnalytics(p1.Player, "Source", v2, p2.Name, p2.Source, Amount)
	local sum = 0
	local t = {}
	for i = 1, TotalDrops do
		local v6
		local v7 = Amount - sum
		v6 = if i == TotalDrops and v7 then v7 else math.min(v7, v52)
		if not (v6 <= 0) then
			local t3 = {
				Source = "DoNotLog",
				Amount = v6,
				Name = v1,
				ItemType = v2
			}
			sum = sum + v6
			for k, v in pairs(p2) do
				t3[k] = t3[k] or v
			end
			if v5.Count(p1.Drops) >= 127 then
				p1:_dropPickedUp(t3)
				continue
			end
			for j = 1, 127 do
				if not p1.Drops[j] then
					t[#t + 1] = string.pack("<i1", j)
					p1.Drops[j] = t3
					break
				end
			end
		end
	end
	if next(t) then
		v24:FireClient(p1.Player, {
			v3,
			t,
			p2.Position,
			v1
		})
	end
	return t
end
function t.GetDrop(p1, p2) --[[ GetDrop | Line: 1119 ]]
	local v1 = string.unpack("<i1", p2)
	local v2 = p1.Drops[tonumber(v1)]
	if v2 then
		p1:_dropPickedUp(v2)
		p1.Drops[v1] = nil
	end
end
function t.HasUnlockedSpecies(p1, p2, p3) --[[ HasUnlockedSpecies | Line: 1130 | Upvalues: v12 (copy), v8 (copy) ]]
	if not p3 then
		return true
	end
	if p2 == "Horse" then
		return true
	end
	local v1 = v12.GetType("SpeciesUnlocks").Missions[p2]
	if v1 and v1 == 1 then
		return true
	end
	if p2 == "Wolper" then
		local v2 = v8.GetByType("Wolper", "Animals")
		if p1:HasEnoughOfItem(1, if v2 then v2.RequiresBreedPermission or "WolperBreedingLicense" else "WolperBreedingLicense") ~= false then
			return true
		end
	end
	local v4 = p1.PlayerData.Missions.SpeciesUnlocks:FindFirstChild(p2)
	if v4 then
		return v4.Completed.Value
	end
	local v5 = p1.PlayerData.ExtraSpeciesUnlocks:FindFirstChild(p2)
	if v5 then
		return v5.Value
	end
end
function t.CanTradeSpecies(p1, p2) --[[ CanTradeSpecies | Line: 1163 | Upvalues: v8 (copy) ]]
	if p1:HasUnlockedSpecies(p2) then
		return true
	else
		return v8.GetByType(p2, "Animals").Event
	end
end
function t.CanBreedSpecies(p1, p2) --[[ CanBreedSpecies | Line: 1172 | Upvalues: v8 (copy) ]]
	local v1 = v8.GetByType(p2, "Animals")
	if v1.RequiresBreedPermission then
		return p1:HasEnoughOfItem(1, v1.RequiresBreedPermission)
	else
		return true
	end
end
function t.Init(p1) --[[ Init | Line: 1183 | Upvalues: v1 (copy), v24 (copy), v7 (copy) ]]
	if not v1 then
		return
	end
	v24.OnServerEvent:Connect(function(p1, p2) --[[ Line: 1185 | Upvalues: v7 (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if v1 then
			v1:GetDrop(p2)
		end
	end)
end
t:Init()
return t