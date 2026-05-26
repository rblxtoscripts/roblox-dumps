-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("MarketplaceService")
local v2 = Sonar("LootboxService")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("TimeSeed")
local v5 = Sonar("FormatString")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("ItemDataService")
local v8 = Sonar("Constants")
local t = {}
t.__index = t
function t.new(p1, p2, p3) --[[ new | Line: 21 | Upvalues: t (copy), v4 (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.BundleName = p1
	v22.BundleData = p2
	v22.Category = p3
	v22.TimeSeed = p2.TimeSeed and v4.new(p2.TimeSeed) or p3.TimeSeed
	v22.Lootbox = v2.GetLootboxFromTable(p2.Lootbox, (("Bundle_%*"):format(p1)))
	v22.P = p2.P or 1
	if not (v22:GetPrice() or v22:GetProductId()) then
		warn("\226\154\160\239\184\143 Bundle: No price or productId defined for bundle:", p1)
	end
	return v22
end
function t.GetBundleData(p1) --[[ GetBundleData | Line: 42 ]]
	return p1.BundleData
end
function t.GetItemFromBundleData(p1, p2) --[[ GetItemFromBundleData | Line: 46 ]]
	local Items = p1.BundleData.Items
	if not Items then
		return nil
	end
	local v1 = Items[p2]
	if v1 then
		return v1
	else
		return nil
	end
end
function t.GetDisplayOrder(p1, p2) --[[ GetDisplayOrder | Line: 58 ]]
	if p1.BundleData.DisplayOrder then
		return p1.BundleData.DisplayOrder
	end
	local Items = p1.BundleData.Items
	if not Items then
		return nil
	end
	local v1 = Items[p2]
	if v1 then
		return v1.Amount
	else
		return nil
	end
end
function t.GetProductIdsByRarity(p1) --[[ GetProductIdsByRarity | Line: 74 ]]
	return p1.BundleData.ProductIdsByRarity or p1.Category:GetProductIdsByRarity()
end
function t.GetProductIdFromItemRarity(p1, p2) --[[ GetProductIdFromItemRarity | Line: 78 ]]
	local v1 = p1:GetProductIdsByRarity()
	if not v1 then
		return nil
	end
	local v2 = if p2 then p2 else p1:GetFirstItem().Rarity.Name
	return v1[v2] or v1.Default, v2
end
function t.GetProductId(p1, ...) --[[ GetProductId | Line: 89 ]]
	local v1, v2 = p1:GetProductIdFromItemRarity(...)
	if v1 then
		return v1
	end
	return p1.BundleData.ProductId or p1.Category:GetProductId(v2)
end
function t.GetGiftProductId(p1, p2) --[[ GetGiftProductId | Line: 99 ]]
	local v1 = select(2, p1:GetProductIdFromItemRarity(p2))
	local v2, v3
	if p1.BundleData.Giftable then
		v2 = p1:GetProductId(v1)
		if not v2 then
			v3 = v1
			v2 = p1.BundleData.GiftProductId or p1.Category:GetGiftProductId(v1)
		end
	else
		v3 = v1
		v2 = p1.BundleData.GiftProductId or p1.Category:GetGiftProductId(v1)
	end
	return v2
end
function t.GetDisplayName(p1, ...) --[[ GetDisplayName | Line: 108 | Upvalues: v5 (copy) ]]
	return v5.GetDisplayName(p1.BundleData, p1.BundleName, p1, ...)
end
function t.GetPrice(p1, ...) --[[ GetPrice | Line: 113 ]]
	return p1:_getConfigValue(p1.BundleData.Price, { ... }) or p1.Category:GetPrice(...)
end
function t.GetPriceInRobux(p1) --[[ GetPriceInRobux | Line: 119 | Upvalues: v1 (copy) ]]
	local v12 = p1:GetProductId()
	if v12 then
		return v1.GetPriceInRobux(v12)
	else
		return nil
	end
end
function t.IsActive(p1) --[[ IsActive | Line: 129 ]]
	return p1.Category:GetCurrentBundles()[p1.BundleName] ~= nil
end
function t.CanPurchase(p1, p2, p3) --[[ CanPurchase | Line: 137 ]]
	local v1 = if p3 then p3 else p1:_getDefaultPurchaseOptions()
	if not p1:IsActive() then
		return false
	end
	if v1.Robux then
		if not p1:GetProductId() then
			return false
		end
	else
		local v2 = p1:GetPrice()
		if not v2 then
			return false
		end
		for v3, v4 in v2 do
			if not p2:HasRequiredItemAmount(v3, v4) then
				return false
			end
		end
	end
	return true
end
function t.Purchase(p1, p2, p3) --[[ Purchase | Line: 167 | Upvalues: v8 (copy), v3 (copy), v6 (copy), v1 (copy) ]]
	local v12 = if p2 then p2 else v8.IS_CLIENT and v3.GetClient()
	local v2 = if p3 then p3 else p1:_getDefaultPurchaseOptions()
	if not p1:CanPurchase(v12, v2) then
		return false
	end
	if v8.IS_CLIENT then
		return v6.GetRemoteFunction("PurchaseBundleRemote"):InvokeServer(p1.BundleName, v2)
	end
	if v2.Robux then
		v1.PromptPurchase(v12.Player, p1:GetProductId(), "DeveloperProduct", p1:GetPurchaseDetails())
		return true
	end
	local v32 = p1:GetPrice()
	if v32 then
		for v5, v62 in v32 do
			p1.PlayerWrapper:RemoveItem({
				Name = v5,
				Amount = v62,
				AnalyticsSource = p1.BundleName
			})
		end
	end
	return p1:GiveItems(v12)
end
function t.GetPurchaseDetails(p1) --[[ GetPurchaseDetails | Line: 200 ]]
	return {
		Bundle = p1.BundleName,
		Seed = p1:GetSeed()
	}
end
function t.GiveItems(p1, p2, p3) --[[ GiveItems | Line: 210 ]]
	p2:GiveItems({
		IfOverLimit = "SendToInbox",
		Items = p3 and p1:_getItemsForSeed(p3) or p1:GetCurrentItems(),
		Actions = {
			Preset = "NewItem"
		},
		AnalyticsSource = p1.BundleName
	})
end
function t.GetCurrentItems(p1) --[[ GetCurrentItems | Line: 223 ]]
	local v1 = p1:GetSeed()
	if p1._currentItems and p1._seed == v1 then
		return p1._currentItems
	end
	p1._currentItems = p1:_getItemsForSeed(v1)
	p1._seed = v1
	return p1._currentItems
end
function t.GetFirstItem(p1, p2) --[[ GetFirstItem | Line: 235 | Upvalues: v7 (copy) ]]
	local v2, v3 = next(p2 and p1:_getItemsForSeed(p2) or p1:GetCurrentItems())
	if type(v2) == "string" then
		return v7.GetByName(v2)
	end
	if type(v3) == "table" then
		return v7.GetByName(v3.Name)
	else
		return nil
	end
end
function t._getItemsForSeed(p1, p2) --[[ _getItemsForSeed | Line: 248 ]]
	local v1 = Random.new(p2)
	local v2 = p1.BundleData.Items and table.clone(p1.BundleData.Items) or {}
	if p1.Lootbox then
		for v3, v4 in p1.Lootbox:Roll({
			Seed = v1
		}) do
			table.insert(v2, v4)
		end
	end
	return v2
end
function t.GetSeedChangedSignal(p1) --[[ GetSeedChangedSignal | Line: 266 ]]
	return p1.TimeSeed and p1.TimeSeed.SeedChanged
end
function t.GetSeed(p1) --[[ GetSeed | Line: 271 ]]
	return p1.TimeSeed and p1.TimeSeed:GetSeed()
end
function t.GetRefreshTime(p1) --[[ GetRefreshTime | Line: 276 ]]
	return p1.TimeSeed and p1.TimeSeed:GetEndTime()
end
function t._getDefaultPurchaseOptions(p1) --[[ _getDefaultPurchaseOptions | Line: 281 ]]
	local t = {}
	t.Robux = p1:GetPrice() == nil
	return t
end
function t._getConfigValue(p1, p2, p3) --[[ _getConfigValue | Line: 290 ]]
	if typeof(p2) ~= "function" then
		return p2
	end
	return p2(p1, unpack(if p3 then p3 else {}))
end
return t