-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("ItemDataService")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("HotbarService")
local v6 = Sonar("MarketplaceUtils")
local v7 = Sonar("WeightedProbability")
local v8 = Sonar("DynamicNPCService")
local v9 = Sonar("EquipmentService")
local v10 = Sonar("AnimalDataService")
local v11 = Sonar("FormatNumber")
local v12 = Sonar("StorageUtils")
local v13 = Sonar("State")
local v14 = Sonar("PlaceTypeService")
local v15 = v1 and Sonar("AnalyticsService")
local v16 = v1 and Sonar("WebhookManager")
local v17 = Sonar("Constants")
local v18 = v14.IsTestGame()
local v19 = v12.GetConfig("Events")()
local v20 = Sonar(v12.Get("ShopItems"))
local v21 = Sonar(v12.Get("EquipmentShopItems"))
local v22 = Sonar(v12.Get("Bonding"))
local v23 = Sonar(v12.Get("Sticks"))
local v24 = Sonar(v12.Get("Seeds"))
local v25 = Sonar(v12.Get("JoustingRods"))
local v26 = Sonar(v12.Get("BuildingShopItems"))
local v27 = Sonar(v12.Get("ClubShopItems"))
local v28 = Sonar(v12.Get("CompHubShopItems"))
local v29 = v19.Event
local v30 = v19.EventsData[v29]
local v31 = v30 and v30.ShopItems or nil
local t2 = { "DoNotLog" }
local v32 = v30 and v30.Data.DropSets or {}
local t3 = {}
local function getSpawnPadData(p1) --[[ getSpawnPadData | Line: 63 | Upvalues: v23 (copy), v22 (copy), v24 (copy), v25 (copy), v20 (copy) ]]
	local t = {}
	for v1, v2 in { v23, v22, v24, v25, v20 } do
		if v2[p1] then
			local v3 = v2[p1]
			if typeof(v3) == "number" then
				t.Name = p1
				t.Cost = v3
			else
				t.Name = v3.Name
				t.Cost = v3.Cost
			end
			return t
		end
	end
	return t
end
local function resolveDropSetItems(p1) --[[ resolveDropSetItems | Line: 85 | Upvalues: v32 (copy) ]]
	local t = {}
	local t2 = {}
	for v1, v2 in p1 do
		local v3 = v32[v2]
		if v3 then
			for v4, v5 in v3 do
				if not t[v5] then
					t[v5] = true
					table.insert(t2, v5)
				end
			end
		end
	end
	table.sort(t2)
	return t2
end
local function rollTheme(p1, p2) --[[ rollTheme | Line: 111 | Upvalues: v2 (copy), v29 (copy), v30 (copy) ]]
	if not p2 or p2 <= 0 then
		return nil
	end
	if p2 < p1:NextNumber() then
		return nil
	end
	local t = {}
	local t2 = {}
	for v1, v22 in v2.GetAllThemes() do
		if v22.P and v22.P ~= 0 then
			local Rarity = v22.Rarity
			if Rarity == v29 or v30 and Rarity == v30.EventThemeRarity then
				table.insert(t, v1)
				continue
			end
			table.insert(t2, v1)
		end
	end
	table.sort(t)
	table.sort(t2)
	local v3 = p1:NextInteger(1, #t + 1)
	if v3 <= #t then
		return t[v3]
	end
	if #t2 > 0 then
		return t2[p1:NextInteger(1, #t2)]
	end
	if #t > 0 then
		return t[p1:NextInteger(1, #t)]
	else
		return nil
	end
end
local function IsWheelAvailable() --[[ IsWheelAvailable | Line: 157 ]]
	return false
end
function t.GetProductSeed(p1, p2, p3) --[[ GetProductSeed | Line: 166 ]]
	local v1 = p1.ProductPurchases:FindFirstChild(p2)
	local v2 = p1.ProductPurchases:FindFirstChild(p2) and v1.Value or 0
	if v2 == 0 then
		v2 = Random.new(p3 * 31 + #p2):NextInteger(100000000000000, 900000000000000)
	end
	return v2
end
function t.ResolveEventBundleRewards(p1, p2) --[[ ResolveEventBundleRewards | Line: 176 | Upvalues: resolveDropSetItems (copy), rollTheme (copy) ]]
	local v1 = Random.new(p2)
	local t = {}
	local t2 = {}
	for v2, v3 in p1.Rewards do
		if v3.Name == "Random" then
			if v3.GrantAllItemsFromChosenDropSets then
				local Rewards = v3.Rewards
				if Rewards and #Rewards ~= 0 then
					local t3 = {}
					for v4, v5 in Rewards do
						if not t[v5] then
							table.insert(t3, v5)
						end
					end
					for i = 1, math.min(v3.Amount or 1, #t3) do
						if #t3 == 0 then
							break
						end
						local v7 = v1:NextInteger(1, #t3)
						local v8 = t3[v7]
						table.remove(t3, v7)
						if v3.UniqueWithinPurchase then
							t[v8] = true
						end
						for v9, v10 in resolveDropSetItems({ v8 }) do
							table.insert(t2, {
								Amount = 1,
								Name = v10,
								Theme = rollTheme(v1, v3.ThemeChance)
							})
						end
					end
				end
				continue
			end
			local Rewards = v3.Rewards
			if Rewards then
				for v11, v12 in Rewards do
					if v12.IncludesDropSets then
						local v13 = resolveDropSetItems(v12.IncludesDropSets)
						if #v13 ~= 0 then
							if v12.UniqueWithinPurchase then
								local t3 = {}
								for v14, v15 in v13 do
									if not t[v15] then
										table.insert(t3, v15)
									end
								end
								if #t3 > 0 then
									v13 = t3
								end
							end
							local v16 = v13[v1:NextInteger(1, #v13)]
							if v12.UniqueWithinPurchase then
								t[v16] = true
							end
							table.insert(t2, {
								Name = v16,
								Amount = v12.Amount or 1,
								Theme = rollTheme(v1, v12.ThemeChance)
							})
						end
					end
				end
			end
			continue
		end
		table.insert(t2, {
			Name = v3.Name,
			Amount = v3.Amount or 1
		})
	end
	return t2
end
local function addItemAnalytics(p1, p2, p3, p4, p5, p6) --[[ addItemAnalytics | Line: 272 | Upvalues: t2 (copy), v15 (copy) ]]
	if not table.find(t2, p5) then
		v15.ReportResourceEvent(p1, p2, p3, p4, p5, p6)
	end
end
function t.GetItems(p1) --[[ GetItems | Line: 280 | Upvalues: v21 (copy), v31 (copy), v26 (copy), v27 (copy), v28 (copy), v20 (copy) ]]
	if p1 == "Equipment" then
		return v21
	end
	if p1 == "Event" then
		return v31
	end
	if p1 == "Building" then
		return v26
	end
	if p1 == "ClubShop" then
		return v27
	end
	if p1 == "CompHub" then
		return v28
	end
	v20.Wheel = nil
	return v20
end
function t.GetPriceForItem(p1, p2) --[[ GetPriceForItem | Line: 306 | Upvalues: v21 (copy), v31 (copy), v26 (copy), v27 (copy), v28 (copy), v20 (copy) ]]
	if p2 == "Equipment" then
		return v21[p1]
	end
	if p2 == "Event" then
		local v1 = v31
		local v2 = if v1 then v1 else {}
		local v3 = v2[p1]
		if not v3 then
			for v4, v5 in v2 do
				if typeof(v5) == "table" and v5.Name == p1 then
					return v5.Price
				end
			end
		end
		return v3
	else
		if p2 == "Building" then
			return v26[p1]
		end
		if p2 == "ClubShop" then
			return v27[p1]
		end
		if p2 == "CompHub" then
			return v28[p1]
		end
		if p1 == "Wheel" then
			return nil
		else
			return v20[p1]
		end
	end
end
function t.CanPurchaseItem(p1, p2, p3, p4) --[[ CanPurchaseItem | Line: 358 | Upvalues: t (copy), v1 (copy), v16 (copy), v2 (copy) ]]
	local v12 = t.GetPriceForItem(p2, p3)
	local v22 = p4 or 1
	if not v12 then
		return
	end
	local v3
	if typeof(v12) == "table" then
		if v1 and (v12.ProductType or v12.ProductId) then
			if not v16 then
				return "Honeypot"
			end
			v16:Push(string.format("**[HONEYPOT] Tried to buy Robux item with coins:** %s (x%d)", p2, v22), "Exploit", p1)
			return "Honeypot"
		end
		if v12.ProductType == "ItemBundle" then
			return true, v12
		end
		v3 = v12
	else
		v3 = v12 * (v22 or 1)
	end
	local v4
	if type(v3) == "number" then
		local v5 = p1:CanAfford(v3, "Coins")
		if not v5 then
			return "CannotAfford"
		end
		v4 = v5
	else
		v4 = nil
	end
	local v6, v7 = p1:GetItemLimit(v2.GetByName(p2).ItemType)
	if v6.Get() + v22 > v6.GetLimit() then
		return "Max" .. v7
	else
		return true, v3, v4
	end
end
function t.CanPuchaseNpcItem(p1, p2, p3) --[[ CanPuchaseNpcItem | Line: 406 | Upvalues: t (copy), v2 (copy) ]]
	local v1 = t.GetShopItems(p3)[p2]
	local Cost = v1.Cost
	local v22
	if type(Cost) == "number" then
		local v3 = p1:CanAfford(Cost, "Coins")
		if not v3 then
			return "CannotAfford"
		end
		v22 = v3
	else
		v22 = nil
	end
	local v4 = v2.GetByName(v1.Name)
	local v5, v6 = p1:CanGiveItem(v4.ItemType)
	if v5 then
		return true, Cost, v22, v1, v4
	else
		return "Max" .. v6
	end
end
function t.CanPurchaseWorldItem(p1, p2, p3, p4) --[[ CanPurchaseWorldItem | Line: 430 | Upvalues: getSpawnPadData (copy), v2 (copy) ]]
	local v1 = getSpawnPadData(p2)
	local v22 = v1.Cost * (p4 or 1)
	local v3
	if type(v22) == "number" then
		local v4 = p1:CanAfford(v22, "Coins")
		if not v4 then
			return "CannotAfford"
		end
		v3 = v4
	else
		v3 = nil
	end
	local v5 = v2.GetByName(v1.Name)
	if p1:CanGiveItem(v5.ItemType) then
		return true, v22, v3, v1, v5
	else
		return "MaxInventory"
	end
end
function t.CanPurchaseEventItem(p1, p2) --[[ CanPurchaseEventItem | Line: 454 | Upvalues: v17 (copy), v29 (copy), t (copy), v30 (copy), v2 (copy) ]]
	if not v17.EventName then
		return
	end
	if not v29 then
		return
	end
	local v1 = t.GetPriceForItem(p2, "Event")
	if not v1 then
		return
	end
	local v22
	if type(v1) == "number" then
		local v3 = p1:CanAfford(v1, v30.Data.EventCurrencyName)
		if not v3 then
			return "CannotAfford"
		end
		v22 = v3
	else
		v22 = nil
	end
	local v4, v5 = p1:CanGiveItem(v2.GetByName(p2).ItemType)
	if v4 then
		return true, v1, v22
	else
		return "Max" .. v5
	end
end
function t.CanPurchaseClubShopItem(p1, p2) --[[ CanPurchaseClubShopItem | Line: 481 | Upvalues: t (copy), v2 (copy) ]]
	local v1 = t.GetPriceForItem(p2, "ClubShop")
	if not v1 then
		return
	end
	local v22 = p1:CanAfford(v1, "ClubTokens")
	if not v22 then
		return "CannotAfford"
	end
	local v3 = v2.GetByName(p2)
	if not v3 then
		return
	end
	local v4, v5 = p1:GetItemLimit(v3.ItemType)
	if v4.Get() + 1 >= v4.GetLimit() then
		return "Max" .. v5
	else
		return true, v1, v22
	end
end
function t.CanPurchaseCompHubItem(p1, p2, p3) --[[ CanPurchaseCompHubItem | Line: 505 | Upvalues: t (copy), v2 (copy) ]]
	local v1 = p3 or 1
	local v22 = t.GetPriceForItem(p2, "CompHub")
	if not v22 then
		return
	end
	local v3 = v22 * v1
	local v4 = p1:CanAfford(v3, "Coins")
	if not v4 then
		return "CannotAfford"
	end
	local v5 = v2.GetByName(p2)
	if not v5 then
		return
	end
	local v6, v7 = p1:GetItemLimit(v5.ItemType)
	if v6.Get() + v1 > v6.GetLimit() then
		return "Max" .. v7
	else
		return true, v3, v4
	end
end
function t.PurchaseItem(p1, ...) --[[ PurchaseItem | Line: 533 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("PurchaseItemRemote"):InvokeServer(...)
end
function t.PurchaseBuildingItem(p1, ...) --[[ PurchaseBuildingItem | Line: 537 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("PurchaseBuildingItemRemote"):InvokeServer(...)
end
function t.PurchaseEquipment(p1, ...) --[[ PurchaseEquipment | Line: 542 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("PurchaseEquipmentRemote"):InvokeServer(...)
end
function t.PurchaseNpcItem(p1, ...) --[[ PurchaseNpcItem | Line: 546 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("PurchaseNpcItemRemote"):InvokeServer(...)
end
function t.PurchaseNpcEquipment(p1, ...) --[[ PurchaseNpcEquipment | Line: 550 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("PurchaseNpcEquipmentRemote"):InvokeServer(...)
end
function t.PurchaseWorldItem(p1, ...) --[[ PurchaseWorldItem | Line: 554 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("PurchaseWorldItemRemote"):InvokeServer(...)
end
function t.PurchaseEventItem(p1, ...) --[[ PurchaseEventItem | Line: 558 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("PurchaseEventItemRemote"):InvokeServer(...)
end
function t.PurchaseClubShopItem(p1, ...) --[[ PurchaseClubShopItem | Line: 562 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("PurchaseClubShopItemRemote"):InvokeServer(...)
end
function t.PurchaseCompHubItem(p1, ...) --[[ PurchaseCompHubItem | Line: 566 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("PurchaseCompHubItemRemote"):InvokeServer(...)
end
function t.SellNpcStockItem(p1, ...) --[[ SellNpcStockItem | Line: 570 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("SellNpcStockRemote"):InvokeServer(...)
end
function t.EquipToolAfterPurchase(p1, p2, p3) --[[ EquipToolAfterPurchase | Line: 574 | Upvalues: v5 (copy) ]]
	if v5:IsItemOnHotbar(p2, p3.Name) then
	else
		return v5:EquipToolIntoEmptySlot(p2, p3.Name)
	end
end
function t.GetTamesToUnlock() --[[ GetTamesToUnlock | Line: 579 ]]
	return 0
end
function t.HasUnlockedShop(p1) --[[ HasUnlockedShop | Line: 583 ]]
	return true
end
function t.HasUnlockedEquipmentShop(p1) --[[ HasUnlockedEquipmentShop | Line: 587 ]]
	return true
end
function t.GetAmountToUnlock(p1) --[[ GetAmountToUnlock | Line: 591 ]]
	if p1 == "Equipment" then
		return 0
	end
end
local t4 = {
	Equipment = true,
	Seeds = true,
	Chests = true,
	Buildings = true
}
local function npcSellThemesMatch(p1, p2) --[[ npcSellThemesMatch | Line: 604 ]]
	if p1 == nil and p2 == nil then
		return true
	end
	return p1 ~= nil and (p2 ~= nil and p1 == p2)
end
local function findNpcSellStockEntry(p1, p2, p3) --[[ findNpcSellStockEntry | Line: 614 | Upvalues: v17 (copy) ]]
	local v1 = v17[("%*SellStock"):format(p1)]
	if type(v1) ~= "table" then
		return nil
	end
	for v3, v4 in v1 do
		local v2
		if v4.Name == p2 then
			local Theme = v4.Theme
			v2 = if Theme == nil and p3 == nil then true else Theme ~= nil and (p3 ~= nil and Theme == p3)
			if v2 then
				return v4
			end
		end
	end
	return nil
end
local function getNpcSellAmountOwned(p1, p2, p3, p4) --[[ getNpcSellAmountOwned | Line: 632 | Upvalues: t4 (copy) ]]
	local ItemType = p2.ItemType
	if ItemType == "EquipmentThemes" then
		local v1 = p1:GetItemFolder("Equipment")
		if not v1 then
			return 0
		end
		local count = 0
		for v2, v3 in v1:GetChildren() do
			local Theme = v3:FindFirstChild("Theme")
			if Theme and Theme.Value == p3 then
				count = count + 1
			end
		end
		return count
	elseif ItemType == "Animals" then
		local v4 = p1:GetItemFolder("Animals")
		if not v4 then
			return 0
		end
		local count = 0
		for v5, v6 in v4:GetChildren() do
			local Species = v6:FindFirstChild("Species")
			if Species and Species.Value == p3 then
				count = count + 1
			end
		end
		return count
	elseif ItemType == "Flairs" then
		local v7 = p1:GetItemFolder("Equipment")
		if not v7 then
			return 0
		end
		local count = 0
		for v8, v9 in v7:GetChildren() do
			if v9.Value == p3 then
				count = count + 1
			end
		end
		return count
	elseif ItemType == "Equipment" then
		local v10 = p1:GetItemFolder("Equipment")
		if not v10 then
			return 0
		end
		local v11 = if p4 then p4.Theme else p4
		local count = 0
		for v12, v13 in v10:GetChildren() do
			if v13.Value == p3 then
				if v11 then
					local Theme = v13:FindFirstChild("Theme")
					if Theme and Theme.Value == v11 then
						count = count + 1
					end
				else
					count = count + 1
				end
			end
		end
		return count
	elseif t4[ItemType] then
		local v14 = p1:GetTrackedItemValue(p3, ItemType)
		if not v14 then
			return 0
		end
		local v15 = v14.Value
		if type(v15) == "number" then
			return v15
		else
			return 0
		end
	else
		local v16 = p1:GetItemValue(p3, ItemType)
		if not v16 then
			return 0
		end
		local v17 = v16.Value
		if type(v17) == "number" then
			return v17
		else
			return 0
		end
	end
end
local function tryRemoveNpcSellItems(p1, p2, p3, p4, p5) --[[ tryRemoveNpcSellItems | Line: 733 | Upvalues: v9 (copy), v10 (copy) ]]
	local ItemType = p2.ItemType
	if p5 <= 0 then
		return false
	end
	if ItemType == "EquipmentThemes" then
		local v1 = p1:GetItemFolder("Equipment")
		if not v1 then
			return false
		end
		local count = 0
		for v2, v3 in v1:GetChildren() do
			if p5 <= count then
				break
			end
			local Theme = v3:FindFirstChild("Theme")
			if Theme and Theme.Value == p3 then
				v9:RemoveItemFromData(p1, v3.Name)
				count = count + 1
			end
		end
		return count == p5
	elseif ItemType == "Animals" then
		local v5 = p1:GetItemFolder("Animals")
		if not v5 then
			return false
		end
		local count = 0
		for v6, v7 in v5:GetChildren() do
			if p5 <= count then
				break
			end
			local Species = v7:FindFirstChild("Species")
			if Species and Species.Value == p3 then
				if v10.CanSellSlot(p1, v7) ~= true then
					return false
				end
				v7:Destroy()
				count = count + 1
			end
		end
		return count == p5
	elseif ItemType == "Flairs" then
		local v92 = p1:GetItemFolder("Equipment")
		if not v92 then
			return false
		end
		local count = 0
		for v102, v11 in v92:GetChildren() do
			if p5 <= count then
				break
			end
			if v11.Value == p3 then
				v9:RemoveItemFromData(p1, v11.Name)
				count = count + 1
			end
		end
		return count == p5
	elseif ItemType == "Equipment" then
		local v13 = p1:GetItemFolder("Equipment")
		if not v13 then
			return false
		end
		local count = 0
		local v14 = if p4 then p4.Theme else p4
		for v15, v16 in v13:GetChildren() do
			if p5 <= count then
				break
			end
			if v16.Value == p3 then
				if v14 then
					local Theme = v16:FindFirstChild("Theme")
					if Theme and Theme.Value == v14 then
						v9:RemoveItemFromData(p1, v16.Name)
						count = count + 1
					end
				else
					v9:RemoveItemFromData(p1, v16.Name)
					count = count + 1
				end
			end
		end
		return count == p5
	elseif ItemType == "Seeds" then
		local v18 = p1:GetItemFolder("Seeds")
		if not v18 then
			return false
		end
		local count = 0
		for v19, v20 in v18:GetChildren() do
			if p5 <= count then
				break
			end
			if v20.Value == p3 then
				v20:Destroy()
				count = count + 1
			end
		end
		return count == p5
	elseif ItemType == "Chests" or ItemType == "Buildings" then
		local v22 = p1:GetItemFolder(ItemType)
		if not v22 then
			return false
		end
		local count = 0
		for v23, v24 in v22:GetChildren() do
			if p5 <= count then
				break
			end
			if v24.Value == p3 then
				v24:Destroy()
				count = count + 1
			end
		end
		return count == p5
	else
		local sum = p5
		while sum > 0 do
			local v26, v27 = p1:ConsumeItem(p3, sum, ItemType)
			if not v26 or (not v27 or v27 <= 0) then
				return false
			end
			sum = sum - v27
		end
		return true
	end
end
local t5 = {
	Item = function(p1, p2, p3, p4) --[[ Item | Line: 896 | Upvalues: v11 (copy), t (copy), v2 (copy), t2 (copy), v15 (copy) ]]
		local v1 = v11.SanitiseInput(p4)
		local v22, v3, v4 = t.CanPurchaseItem(p1, p3, p2, v1)
		if v22 == "Honeypot" then
			return true
		end
		if v22 ~= true then
			return
		end
		local v5 = v2.GetByName(p3)
		if not p1:GiveItem({
			Unlock = true,
			ItemType = v5.ItemType,
			Name = v5.Name,
			Amount = v1,
			Source = p2 or "Shop"
		}) then
			return
		end
		v4.Value = v4.Value - v3
		p1:IncrementMission({
			Type = "MoneySpent",
			Amount = v3
		})
		p1:IncrementMission({
			Type = "BuyItem",
			Amount = v1,
			Data = { v5.ToolType or nil }
		})
		if table.find(t2, "ItemShop") then
			return
		end
		v15.ReportResourceEvent(p1.Player, "Sink", "Currency", v4.Name, "ItemShop", v3)
	end,
	Event = function(p1, p2, p3) --[[ Event | Line: 933 | Upvalues: t (copy), v2 (copy), t2 (copy), v15 (copy) ]]
		local v1, v22, v3 = t.CanPurchaseEventItem(p1, p3)
		if v1 ~= true then
			return
		end
		local v4 = v2.GetByName(p3)
		local t3 = {
			Amount = 1,
			Source = "EventItemShop",
			ItemType = v4.ItemType,
			Name = v4.Name
		}
		t3.ItemStream = v4.ItemType == "Buildings"
		if not p1:GiveItem(t3) then
			return
		end
		v3.Value = v3.Value - v22
		p1:IncrementMission({
			Type = "BuyItem",
			Amount = 1,
			Data = { "EventShop" }
		})
		p1:IncrementMission({
			Type = "MoneySpent",
			Amount = v22
		})
		if table.find(t2, "EventItemShop") then
			return
		end
		v15.ReportResourceEvent(p1.Player, "Sink", "Currency", v3.Name, "EventItemShop", v22)
	end,
	Equipment = function(p1, p2, p3, p4) --[[ Equipment | Line: 964 | Upvalues: t (copy), v2 (copy), t2 (copy), v15 (copy) ]]
		local v1, v22, v3 = t.CanPurchaseItem(p1, p3, p2)
		if v1 ~= true then
			return
		end
		local v4 = v2.GetByName(p3)
		if not p1:GiveItem({
			Amount = 1,
			Source = "Shop",
			ItemType = v4.ItemType,
			Name = v4.Name,
			Theme = p4
		}) then
			return
		end
		v3.Value = v3.Value - v22
		p1:IncrementMission({
			Type = "BuyAccessory",
			Amount = 1,
			Data = {}
		})
		p1:IncrementMission({
			Type = "MoneySpent",
			Amount = v22
		})
		if table.find(t2, "EquipmentShop") then
			return
		end
		v15.ReportResourceEvent(p1.Player, "Sink", "Currency", v3.Name, "EquipmentShop", v22)
	end,
	ClubShop = function(p1, p2, p3) --[[ ClubShop | Line: 995 | Upvalues: v1 (copy), t (copy), v2 (copy), t2 (copy), v15 (copy) ]]
		if not v1 then
			return
		end
		local v12, v22, v3 = t.CanPurchaseClubShopItem(p1, p3)
		if v12 ~= true then
			return
		end
		local v4 = v2.GetByName(p3)
		if not v4 then
			return
		end
		if not p1:GiveItem({
			Amount = 1,
			Source = "ClubShop",
			Unlock = true,
			ItemType = v4.ItemType,
			Name = v4.Name
		}) then
			return
		end
		v3.Value = v3.Value - v22
		p1:IncrementMission({
			Type = "BuyItem",
			Amount = 1
		})
		if table.find(t2, "ClubShop") then
			return
		end
		v15.ReportResourceEvent(p1.Player, "Sink", "Currency", "ClubTokens", "ClubShop", v22)
	end,
	CompHub = function(p1, p2, p3, p4) --[[ CompHub | Line: 1025 | Upvalues: v1 (copy), v11 (copy), t (copy), v2 (copy), t2 (copy), v15 (copy) ]]
		if not v1 then
			return
		end
		local v12 = v11.SanitiseInput(p4 or 1)
		local v22, v3, v4 = t.CanPurchaseCompHubItem(p1, p3, v12)
		if v22 ~= true then
			return
		end
		local v5 = v2.GetByName(p3)
		if not v5 then
			return
		end
		if not p1:GiveItem({
			Source = "CompHubShop",
			Unlock = true,
			ItemType = v5.ItemType,
			Name = v5.Name,
			Amount = v12
		}) then
			return
		end
		v4.Value = v4.Value - v3
		p1:IncrementMission({
			Type = "MoneySpent",
			Amount = v3
		})
		p1:IncrementMission({
			Type = "BuyItem",
			Amount = v12,
			Data = { v5.ToolType or nil }
		})
		if table.find(t2, "CompHubShop") then
			return
		end
		v15.ReportResourceEvent(p1.Player, "Sink", "Currency", "Coins", "CompHubShop", v3)
	end,
	ItemNpc = function(p1, p2, p3) --[[ ItemNpc | Line: 1063 | Upvalues: t (copy), t2 (copy), v15 (copy) ]]
		local v1, v2, v3, _, v4 = t.CanPuchaseNpcItem(p1, p2, p3)
		if v1 ~= true then
			return
		end
		if not p1:GiveItem({
			Amount = 1,
			Source = "Shop",
			Unlock = true,
			ItemType = v4.ItemType,
			Name = v4.Name
		}) then
			return
		end
		v3.Value = v3.Value - v2
		if v4.ToolType then
			t:EquipToolAfterPurchase(p1, v4)
		end
		p1:IncrementMission({
			Type = "MoneySpent",
			Amount = v2
		})
		local v6 = ("%*ShopItem"):format(p3)
		if table.find(t2, v6) then
			return
		end
		v15.ReportResourceEvent(p1.Player, "Sink", "Currency", v3.Name, v6, v2)
	end,
	EquipmentNpc = function(p1, p2, p3) --[[ EquipmentNpc | Line: 1090 | Upvalues: t (copy), t2 (copy), v15 (copy) ]]
		local v1, v2, v3, v4, v5 = t.CanPuchaseNpcItem(p1, p2, p3)
		if v1 ~= true then
			return
		end
		if not p1:GiveItem({
			Amount = 1,
			Source = "Shop",
			ItemType = v5.ItemType,
			Name = v5.Name,
			Theme = v4.Theme
		}) then
			return
		end
		v3.Value = v3.Value - v2
		p1:IncrementMission({
			Type = "MoneySpent",
			Amount = v2
		})
		local v7 = ("%*ShopEquipment"):format(p3)
		if table.find(t2, v7) then
			return
		end
		v15.ReportResourceEvent(p1.Player, "Sink", "Currency", v3.Name, v7, v2)
	end,
	WorldItem = function(p1, p2, p3) --[[ WorldItem | Line: 1113 | Upvalues: v11 (copy), t (copy), t2 (copy), v15 (copy) ]]
		local v1 = v11.SanitiseInput(p3 or 1)
		local v2, v3, v4, v5, v6 = t.CanPurchaseWorldItem(p1, p2, nil, v1)
		if v2 ~= true then
			return v2
		end
		if not p1:GiveItem({
			Source = "Shop",
			ItemType = v6.ItemType,
			Name = v6.Name,
			Amount = v1,
			Theme = v5.Theme
		}) then
			return true
		end
		v4.Value = v4.Value - v3
		p1:IncrementMission({
			Type = "MoneySpent",
			Amount = v3
		})
		if table.find(t2, "WorldShopItem") then
			return true
		end
		v15.ReportResourceEvent(p1.Player, "Sink", "Currency", v4.Name, "WorldShopItem", v3)
		return true
	end
}
function stringToNumbers(p1) --[[ stringToNumbers | Line: 1142 ]]
	local v1 = ""
	for i = 1, #p1 do
		v1 = v1 .. tostring((string.byte(p1, i)))
	end
	return v1
end
function t.GetShopItems(p1) --[[ GetShopItems | Line: 1151 | Upvalues: v8 (copy), v17 (copy), Sonar (copy), v7 (copy), t3 (copy), v2 (copy) ]]
	local CurrentSeed = v8.RefreshTimer.CurrentSeed
	local v22 = Sonar("Table").DeepCopy(v17[p1 .. "Shop"])
	local t = {}
	for i = 1, math.min(#v22, 12) do
		local v3 = CurrentSeed + tonumber(i) + 1120
		local v4 = v3 + stringToNumbers(p1) % 100
		local v5 = v7.getRandomWeightedItem(v22, v3)
		local v6 = v22[v5]
		local t2 = {}
		for v72, v82 in v17.RandomEquipmentDropThemes do
			v82.Name = v72
			table.insert(t2, v82)
		end
		table.sort(t2, function(p1, p2) --[[ Line: 1173 ]]
			return p1.Name < p2.Name
		end)
		if v6.Name == "RandomEquipment" then
			v6.Name = t3[Random.new(v4):NextInteger(1, #t3)].Name
			v2.GetByName(v6.Name)
		elseif v2.GetByName(v6.Name).ItemType == "Equipment" then
			local v9 = Random.new(v3 + i * 5000):NextInteger(1, 100)
			if v9 > 75 then
				v6.Theme = t2[v7.getRandomWeightedItem(t2, v9)].Name
			else
				v6.Theme = nil
			end
		else
			v6.Theme = nil
		end
		table.remove(v22, v5)
		table.insert(t, v6)
	end
	table.sort(t, function(p1, p2) --[[ Line: 1202 ]]
		return p1.Cost < p2.Cost
	end)
	return t
end
function t.Init(p1) --[[ Init | Line: 1209 | Upvalues: v17 (copy), t3 (copy), RunService (copy), v18 (copy), v20 (copy), v30 (copy), v6 (copy), v1 (copy), v2 (copy), v21 (copy), t (copy), Sonar (copy), v12 (copy), v29 (copy), v3 (copy), v4 (copy), t5 (copy), v8 (copy), v11 (copy), findNpcSellStockEntry (copy), getNpcSellAmountOwned (copy), tryRemoveNpcSellItems (copy), t2 (copy), v15 (copy), v19 (copy), v13 (copy) ]]
	for v14, v22 in v17.RandomDrops.RandomEquipment do
		table.insert(t3, v22)
	end
	table.sort(t3, function(p1, p2) --[[ Line: 1214 ]]
		return p1.Name < p2.Name
	end)
	if RunService:IsStudio() or v18 then
		v20.Wheel = 100
	end
	if v30 then
		for v42, v5 in v30.Products do
			if typeof(v5) == "table" and typeof(v5.ProductId) == "number" then
				v6.AddDeveloperProduct(v5.ProductId, v5)
			end
		end
	end
	if not v1 then
		return
	end
	local function addToTableThing(p1) --[[ addToTableThing | Line: 1233 | Upvalues: v2 (ref), v21 (ref), v20 (ref) ]]
		local v1 = v2.GetByName(p1.Name)
		if not v1 then
			return
		end
		if v1.ItemType == "Equipment" then
			v21[p1.Name] = p1.Cost
		else
			v20[p1.Name] = p1.Cost
		end
	end
	for v62, v7 in v17.AlexShop do
		local v82 = v2.GetByName(v7.Name)
		if v82 then
			if v82.ItemType == "Equipment" then
				v21[v7.Name] = v7.Cost
				continue
			end
			v20[v7.Name] = v7.Cost
		end
	end
	for v9, v10 in v17.LyricShop do
		local v112 = v2.GetByName(v10.Name)
		if v112 then
			if v112.ItemType == "Equipment" then
				v21[v10.Name] = v10.Cost
				continue
			end
			v20[v10.Name] = v10.Cost
		end
	end
	for v122, v132 in v17.AureliaShop do
		local v14 = v2.GetByName(v132.Name)
		if v14 then
			if v14.ItemType == "Equipment" then
				v21[v132.Name] = v132.Cost
				continue
			end
			v20[v132.Name] = v132.Cost
		end
	end
	for k, v in pairs(t.GetItems()) do
		if not v2.GetByName(k) then
			warn("No item data can be found for", k)
		end
	end
	for k, v in pairs(t.GetItems("Equipment")) do
		if not v2.GetByName(k) then
			warn("No item data can be found for", k)
		end
	end
	for k, v in pairs(t.GetItems("CompHub")) do
		if not v2.GetByName(k) then
			warn("No item data can be found for", k)
		end
	end
	v6.AddDeveloperProducts(t.GetItems())
	v6.AddDeveloperProducts(t.GetItems("Building"))
	v6.AddDeveloperProducts(Sonar(v12.Get("OneTimeBundles")))
	v6.AddProductHandler("Currency", function(p1, p2) --[[ Line: 1276 ]]
		local t = {
			ItemType = "Currency",
			Source = "RobuxPurchase",
			DoNotIncrementMission = true,
			Name = p2.Currency,
			Amount = p2.Amount
		}
		t.ItemStream = if p2.Currency == "Coins" then true else false
		p1:GiveItem(t)
		return {
			ItemType = p2.Currency,
			ItemId = p2.Amount
		}
	end)
	v6.AddProductHandler("CurrencyBoost", function(p1, p2) --[[ Line: 1288 | Upvalues: v29 (ref) ]]
		local v1 = p1.PlayerData.Events[v29][p2.ProductType][p2.Name]
		v1.Value = v1.Value + 1
		return {
			ItemType = "CurrencyBoost",
			ItemId = p2.Name
		}
	end)
	v6.AddProductHandler("EventBundle", function(p1, p2) --[[ Line: 1294 | Upvalues: t (ref), v2 (ref) ]]
		for v3, v4 in t.ResolveEventBundleRewards(p2, (t.GetProductSeed(p1.PlayerData, p2.Name, p1.Player.UserId))) do
			local v5 = v2.GetByName(v4.Name)
			local t2 = {
				Source = "RobuxPurchase",
				IgnoreLimit = true,
				Name = v4.Name,
				Amount = v4.Amount or 1
			}
			t2.ItemStream = if v5.ItemType == "Buildings" then true else false
			if v4.Theme then
				t2.Theme = v4.Theme
			end
			p1:GiveItem(t2)
		end
		p1.PlayerData.ProductPurchases[p2.Name].Value = Random.new():NextInteger(100000000000000, 900000000000000)
		return {
			ItemType = "EventBundle",
			ItemId = p2.Name
		}
	end)
	v6.AddProductHandler("EventCurrency", function(p1, p2) --[[ Line: 1322 ]]
		for v1, v2 in p2.Rewards do
			p1:GiveItem({
				ItemType = "Currency",
				Source = "RobuxPurchase",
				Amount = v2.Amount,
				Name = v2.Name
			})
		end
		return {
			ItemType = "EventCurrency",
			ItemId = p2.Name
		}
	end)
	v6.AddProductHandler("Items", function(p1, p2) --[[ Line: 1336 | Upvalues: v2 (ref) ]]
		local v1 = v2.GetByName(p2.Name)
		p1:GiveItem({
			Source = "RobuxPurchase",
			IgnoreLimit = true,
			ItemType = v1.ItemType,
			Name = v1.Name,
			Amount = p2.Amount or 1
		})
		return {
			ItemType = v1.Name,
			ItemId = p2.Amount or 1
		}
	end)
	v6.AddProductHandler("ItemBundle", function(p1, p2) --[[ Line: 1349 | Upvalues: t (ref), v2 (ref) ]]
		local v1 = t.GetPriceForItem(p2.Name)
		if v1 then
			p1:GiveItem({
				Source = "BundlePurchase",
				IgnoreLimit = true,
				ItemType = v2.GetByName(v1.ItemName).ItemType,
				Name = v1.ItemName,
				Amount = v1.Amount
			})
			return {
				ItemType = v1.ItemName,
				ItemId = v1.Amount
			}
		end
	end)
	v6.AddProductHandler("MerchBundle", function(p1, p2) --[[ Line: 1370 | Upvalues: v18 (ref) ]]
		if v18 and p2.Items then
			for v1, v2 in p2.Items do
				p1:GiveItem({
					IgnoreLimit = true,
					Source = "MerchProduct",
					Name = v2.Name,
					Amount = v2.Amount
				})
			end
		end
		return {
			ItemType = "MerchBundle",
			ItemId = p2.Name
		}
	end)
	v6.AddProductHandler("MerchProduct", function(p1, p2) --[[ Line: 1387 | Upvalues: v2 (ref) ]]
		if v2.GetByName(p2.Name) then
			p1:GiveItem({
				Amount = 1,
				IgnoreLimit = true,
				Source = "MerchProduct",
				Name = p2.Name
			})
		end
		return {
			ItemType = "MerchProduct",
			ItemId = p2.Name
		}
	end)
	v6.AddProductHandler("OneTimeBundles", function(p1, p2) --[[ Line: 1403 ]]
		local OneTimeBundles = p1.PlayerData.OneTimeBundles
		local v2 = OneTimeBundles:FindFirstChild(p2.Name)
		if v2 and not v2:IsA("IntValue") then
			v2:Destroy()
			local v3 = Instance.new("IntValue")
			v3.Value = if v2.Value == true then 1 else 0
			v2 = v3
		elseif not v2 then
			v2 = Instance.new("IntValue")
		end
		v2.Name = p2.Name
		v2.Parent = OneTimeBundles
		if (p2.PurchaseLimit or 1) <= v2.Value then
			return
		end
		v2.Value = v2.Value + 1
		if p2.Items then
			for v6, v7 in p2.Items do
				p1:GiveItem({
					IgnoreLimit = true,
					Name = v6,
					Amount = v7.Amount,
					Source = p2.Name
				})
			end
		end
		return {
			ItemType = p2.Name,
			ItemId = p2.Name
		}
	end)
	v3.GetRemoteFunction("PurchaseItemRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 1440 | Upvalues: v4 (ref), t5 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if v1 then
			return t5.Item(v1, "Item", p2, p3 or 1)
		end
	end
	v3.GetRemoteFunction("PurchaseBuildingItemRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 1449 | Upvalues: v4 (ref), t5 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if v1 then
			return t5.Item(v1, "Building", p2, p3 or 1)
		end
	end
	v3.GetRemoteFunction("PurchaseEquipmentRemote").OnServerInvoke = function(p1, p2) --[[ Line: 1458 | Upvalues: v4 (ref), t5 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if v1 then
			return t5.Equipment(v1, "Equipment", p2)
		end
	end
	if v17.EventName then
		v3.GetRemoteFunction("PurchaseEventItemRemote").OnServerInvoke = function(p1, p2) --[[ Line: 1466 | Upvalues: v4 (ref), t5 (ref) ]]
			local v1 = v4.getWrapperFromPlayer(p1)
			if v1 then
				return t5.Event(v1, "Event", p2)
			end
		end
	end
	v3.GetRemoteFunction("PurchaseClubShopItemRemote").OnServerInvoke = function(p1, p2) --[[ Line: 1474 | Upvalues: v4 (ref), t5 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if v1 then
			return t5.ClubShop(v1, "ClubShop", p2)
		end
	end
	v3.GetRemoteFunction("PurchaseCompHubItemRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 1481 | Upvalues: v4 (ref), t5 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if v1 then
			return t5.CompHub(v1, "CompHub", p2, p3 or 1)
		end
	end
	v3.GetRemoteFunction("PurchaseNpcItemRemote").OnServerInvoke = function(p1, ...) --[[ Line: 1488 | Upvalues: v4 (ref), t (ref), v8 (ref), v17 (ref), t5 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		if not select(2, ...) then
			return
		end
		local v2 = t.GetShopItems(select(2, ...))
		local v3 = v8.GetBondPercentage(v1, select(2, ...))
		local Streak = v1.PlayerData.DynamicNPCs[select(2, ...)].Streak.Value
		for v42, v5 in v2 do
			if v5.Name == select(1, ...) and (v17.BondsNeeded[v42].BondNeeded <= v3 and v17.BondsNeeded[v42].StreakNeeded <= Streak) then
				return t5.ItemNpc(v1, v42, select(2, ...))
			end
		end
	end
	v3.GetRemoteFunction("PurchaseNpcEquipmentRemote").OnServerInvoke = function(p1, ...) --[[ Line: 1509 | Upvalues: v4 (ref), t (ref), v8 (ref), v17 (ref), t5 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		if not select(2, ...) then
			return
		end
		local v2 = t.GetShopItems(select(2, ...))
		local v3 = v8.GetBondPercentage(v1, select(2, ...))
		local Streak = v1.PlayerData.DynamicNPCs[select(2, ...)].Streak.Value
		for v42, v5 in v2 do
			if v5.Name == select(1, ...) and (v17.BondsNeeded[v42].BondNeeded <= v3 and v17.BondsNeeded[v42].StreakNeeded <= Streak) then
				return t5.EquipmentNpc(v1, v42, select(2, ...))
			end
		end
	end
	v3.GetRemoteFunction("SellNpcStockRemote").OnServerInvoke = function(p1, p2, p3, p4, p5) --[[ Line: 1531 | Upvalues: v4 (ref), v11 (ref), v2 (ref), findNpcSellStockEntry (ref), v8 (ref), getNpcSellAmountOwned (ref), tryRemoveNpcSellItems (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return false, "NpcSellInvalid"
		end
		if type(p2) ~= "string" or type(p3) ~= "string" then
			return false, "NpcSellInvalid"
		end
		if p5 ~= nil and type(p5) ~= "string" then
			return false, "NpcSellInvalid"
		end
		local v42 = math.floor(tonumber((v11.SanitiseInput(tonumber(p4) or 0))) or 0)
		if v42 <= 0 then
			return false, "NpcSellInvalidAmount"
		end
		local v5 = v2.GetByName(p3)
		if not v5 then
			return false, "NpcSellInvalid"
		end
		local v6 = findNpcSellStockEntry(p2, p3, p5)
		if not v6 then
			return false, "NpcSellNotOffered"
		end
		local Bond = v6.Bond
		if typeof(Bond) == "number" and v8.GetBondPercentage(v1, p2) < Bond then
			return false, "NpcSellBondTooLow"
		end
		local v7 = v6.Value or (v6.SellPrice or v6.Price)
		if type(v7) ~= "number" then
			return false, "NpcSellInvalid"
		end
		if getNpcSellAmountOwned(v1, v5, p3, v6) < v42 then
			return false, "NoOwnAnymore"
		end
		if tryRemoveNpcSellItems(v1, v5, p3, v6, v42) then
			v1:GiveItem({
				ItemType = "Currency",
				Name = "Coins",
				Source = "NpcSell",
				ItemStream = true,
				Amount = v42 * v7
			})
			return true
		else
			return false, "NpcSellFailed"
		end
	end
	v3.GetRemoteFunction("PurchaseWorldItemRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 1594 | Upvalues: v4 (ref), t5 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if v1 then
			return t5.WorldItem(v1, p2, p3 or 1)
		end
	end
	v3.GetRemoteFunction("PredictColor").OnServerInvoke = function(p1, p2) --[[ Line: 1603 | Upvalues: v4 (ref), v17 (ref), t2 (ref), v15 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1):CanAfford(v17.PredictColorPrice, "Coins")
		if not v1 then
			return false
		end
		v1.Value = v1.Value - v17.PredictColorPrice
		if table.find(t2, "PredictColor") then
			return true
		end
		v15.ReportResourceEvent(p1, "Sink", "Currency", "Coins", "PredictColor", v17.PredictColorPrice)
		return true
	end
	v4.bindToPlayers(function(p1) --[[ Line: 1618 | Upvalues: v4 (ref), v19 (ref), v29 (ref), v13 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		local Events = v1.PlayerData.Events
		for v2, v3 in v19.EventsData do
			if v3.Name == v29 then
				local EventCurrencyName = v3.Data.EventCurrencyName
				local v42 = Events:FindFirstChild(v3.Name)
				if v42 then
					for v5, v6 in v3.Products do
						if v6.Stats and v6.ProductType == "CurrencyBoost" then
							local v7 = v42:FindFirstChild(v6.ProductType)
							local v8 = if v7 then v7:FindFirstChild(v6.Name) else v7
							local v9 = ("%*Modifier"):format(v6.Name)
							if v8 then
								v1.Maid:GiveTask(v1.Maid:GiveTask(v13.fromProperty(v8, "Value")):subscribe(function(p1) --[[ Line: 1651 | Upvalues: v1 (copy), v9 (copy) ]]
									if p1 <= 0 then
										v1:RemoveModifier(v9)
									else
										v1:AddModifier({
											Type = v9,
											Value = math.min(p1, 2)
										})
									end
								end))
							end
						end
					end
				end
			end
		end
	end)
end
t:Init()
return t