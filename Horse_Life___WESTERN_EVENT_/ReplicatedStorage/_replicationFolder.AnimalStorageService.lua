-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = v1 and Sonar("AnimalManager")
local v5 = Sonar("Constants").IsTradeWorld and Sonar("AuctionService")
local v6 = Sonar("MarketplaceUtils")
local v7 = v1 and Sonar("AnalyticsService")
local v8 = Sonar("StorageUtils")
local v9 = Sonar("Constants")
local v10 = Sonar(v8.Get("AnimalStorageSlots"))
function t.CanStoreSlot(p1, p2, p3, p4) --[[ CanStoreSlot | Line: 24 | Upvalues: v5 (copy), v1 (copy), t (copy) ]]
	if p4 then
		if p3.InStorage.Value then
			return
		end
		if v5 and v5.IsItemInAuction(p3) then
			return "SlotInAuction"
		end
		if p2:GetItemLimit("Animals").Get() <= 1 then
			return "LastAnimal"
		end
		if not p2:CanGiveItem("AnimalStorage") then
			return "MaxAnimalStorage"
		end
	else
		if not p3.InStorage.Value then
			return
		end
		if not p2:CanGiveItem("Animals") then
			return "MaxAnimals"
		end
		if v1 and not t:HasUnlockedStorage(p2) then
			return
		end
	end
	return true
end
function t.GetAnimalStorageSlotPurchase(p1, p2) --[[ GetAnimalStorageSlotPurchase | Line: 54 | Upvalues: v10 (copy) ]]
	local v1 = p2 or "Free"
	local AnimalStorageTiersPurchased = p1.PlayerData.AnimalStorageTiersPurchased
	if v1 == "Robux" then
		AnimalStorageTiersPurchased = AnimalStorageTiersPurchased.RobuxTiersPurchased
	end
	for k, v in pairs(v10[v1]) do
		if AnimalStorageTiersPurchased.Value < k then
			return v
		end
	end
end
function t.HasUnlockedStorage(p1, p2) --[[ HasUnlockedStorage | Line: 72 | Upvalues: v9 (copy) ]]
	local count = 0
	local count_2 = 0
	for v1, v2 in p2.PlayerData.Missions.SpeciesUnlocks:GetChildren() do
		count = count + 1
		if v2.Completed.Value then
			count_2 = count_2 + 1
		end
	end
	return v9.SpeciesNeededForStorage <= count_2
end
function t.Init(p1) --[[ Init | Line: 87 | Upvalues: v1 (copy), v2 (copy), v3 (copy), t (copy), v4 (copy), v6 (copy), v7 (copy), v10 (copy) ]]
	if v1 then
		v2.GetRemoteEvent("StoreAnimalRemote").OnServerEvent:Connect(function(p1, p2, p3) --[[ Line: 89 | Upvalues: v3 (ref), t (ref), v4 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			local v2 = v1:GetAnimalSlot(p2)
			if not v2 then
				return
			end
			if t:CanStoreSlot(v1, v2, p3) ~= true then
				return
			end
			if p3 then
				v2.InStorage.Value = true
				v4:UnequipAnimal(p1, v2.Name)
				v2.Equipped.Value = false
				v2.EquippedInTradeWorld.Value = false
			else
				v2.InStorage.Value = false
			end
		end)
		v2.GetRemoteFunction("PurchaseAnimalStorageSlotsRemote").OnServerInvoke = function(p1, p2) --[[ Line: 110 | Upvalues: v3 (ref), t (ref), v6 (ref), v7 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v2 = t.GetAnimalStorageSlotPurchase(v1, p2 or "Free")
			if not v2 then
				return
			end
			if v2.ProductId then
				v6.PromptPurchase(p1, v2.ProductId)
			else
				local v32 = v1:CanAfford(v2.Price, v2.Currency)
				if not v32 then
					return
				end
				for k, v in pairs(v2.Stats) do
					if v1:GetStatValue(k).Value < v then
						return
					end
				end
				v32.Value = v32.Value - v2.Price
				local AnimalStorageTiersPurchased = v1.PlayerData.AnimalStorageTiersPurchased
				AnimalStorageTiersPurchased.Value = AnimalStorageTiersPurchased.Value + 1
				v7.ReportResourceEvent(p1, "Sink", "Currency", v32.Name, "UpgradeAnimalStorageSlots", v2.Price)
			end
			return true
		end
		v6.AddProductHandler("AnimalStorageSlots", function(p1, p2) --[[ Line: 139 ]]
			local RobuxTiersPurchased = p1.PlayerData.AnimalStorageTiersPurchased.RobuxTiersPurchased
			RobuxTiersPurchased.Value = RobuxTiersPurchased.Value + 1
			local t = {
				ItemType = "AnimalStorageSlots"
			}
			t.ItemId = tostring(p2.Index)
			return t
		end)
	end
	for k, v in pairs({ v10 }) do
		for k2, v5 in pairs(v) do
			v6.AddDeveloperProducts(v5)
		end
	end
end
t:Init()
return t