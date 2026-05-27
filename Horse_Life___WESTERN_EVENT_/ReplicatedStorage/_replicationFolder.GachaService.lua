-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("ItemDataService")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("WeightedProbability")
local v6 = Sonar("TimeSeedClass")
local v7 = Sonar("Table")
local v8 = v1 and Sonar("AnalyticsService")
local v9 = Sonar("StorageUtils")
local v10 = Sonar("Constants")
local v11 = v9.GetConfig("Events")()
local v13 = v11.EventsData[v11.Event]
local t = {}
if v13 and v13.ShopItems then
	for v14, v15 in v13.ShopItems do
		t[v15.Name] = v15.Price
	end
end
local t2 = { "DoNotLog" }
local t3 = {
	GachaRefreshTimer = v6.new({
		Duration = 21600
	}),
	EventGachaRefreshTimer = v6.new({
		Duration = 10800
	})
}
local function addItemAnalytics(p1, p2, p3, p4, p5, p6) --[[ addItemAnalytics | Line: 47 | Upvalues: t2 (copy), v8 (copy) ]]
	if not table.find(t2, p5) then
		v8.ReportResourceEvent(p1, p2, p3, p4, p5, p6)
	end
end
function t3.GetShopItems(p1) --[[ GetShopItems | Line: 55 | Upvalues: v10 (copy), v7 (copy), t3 (copy), v5 (copy), t (copy) ]]
	local GachaPlushies = v10.GachaPlushies
	if p1 == "Event" then
		GachaPlushies = v10[v10.EventGachas]
	end
	if not GachaPlushies then
		return {}
	end
	local v1 = v7.DeepCopy(GachaPlushies)
	local t2 = {}
	local t4 = {}
	for v2, v3 in v10.RandomEquipmentDropThemes do
		v3.Name = v2
		table.insert(t2, v3)
	end
	table.sort(t2, function(p1, p2) --[[ Line: 77 ]]
		return p1.Name < p2.Name
	end)
	for i = 1, 9 do
		local CurrentSeed = t3.GachaRefreshTimer.CurrentSeed
		if p1 == "Event" then
			CurrentSeed = t3.EventGachaRefreshTimer.CurrentSeed
		end
		local v4 = CurrentSeed + i * 1000
		local v52 = v5.getRandomWeightedItem(v1, v4)
		local v6 = v1[v52]
		if v6 then
			local v72 = Random.new(v4 + i * 5000):NextInteger(1, 100)
			if v6.Cost == "EventShopItems" then
				v6.Cost = t[v6.Name]
			end
			if v6.Cost then
				if v72 > 75 or v6.AlwaysTheme then
					v6.Theme = t2[v5.getRandomWeightedItem(t2, v72)].Name
					if v6.AlwaysTheme then
						if p1 == "Event" then
							v6.Cost = v6.Cost * 1.25
						else
							v6.Cost = v6.Cost * 1.5
						end
					else
						v6.Cost = v6.Cost + 1
					end
				else
					v6.Theme = nil
				end
				table.remove(v1, v52)
				table.insert(t4, v6)
				continue
			end
			warn("No item data found for " .. v6.Name)
		end
	end
	table.sort(t4, function(p1, p2) --[[ Line: 122 ]]
		return p1.Cost < p2.Cost
	end)
	return t4
end
function t3.CanPurchase(p1, p2) --[[ CanPurchase | Line: 129 | Upvalues: v4 (copy), t3 (copy) ]]
	local v1 = v4.getWrapperFromPlayer(p1)
	if not v1 then
		return
	end
	local v2 = if p2 == "Event" then v1.PlayerData.Gacha.EventSeed.Value else v1.PlayerData.Gacha.LastSeed.Value
	local CurrentSeed = t3.GachaRefreshTimer.CurrentSeed
	if p2 == "Event" then
		CurrentSeed = t3.EventGachaRefreshTimer.CurrentSeed
	end
	if v2 == CurrentSeed then
		return false
	end
	if p2 ~= "Event" or not (v1.PlayerData.Gacha.Purchases.Value >= 2) then
		return true
	end
	v1.PlayerData.Gacha.Purchases.Value = 0
	return true
end
if v1 then
	function t3.Init() --[[ Init | Line: 157 | Upvalues: v3 (copy), v4 (copy), t3 (copy), v2 (copy), v10 (copy), t2 (copy), v8 (copy) ]]
		v3.GetRemoteFunction("PurchasePlushie").OnServerInvoke = function(p1, p2, p3) --[[ Line: 158 | Upvalues: v4 (ref), t3 (ref), v2 (ref), v10 (ref), t2 (ref), v8 (ref) ]]
			local v1 = v4.getWrapperFromPlayer(p1)
			local v22 = if p3 == "Event" then t3.GetShopItems(p3) else t3.GetShopItems()
			local v5 = nil
			if not t3.CanPurchase(p1, p3) then
				return "CantPurchaseRightNow"
			end
			for v6, v7 in v22 do
				if v7.Name == p2 then
					v5 = v7
					break
				end
			end
			if not v5 then
				warn("NO ITEM FOUND")
				return
			end
			local v82 = v2.GetByName(v5.Name)
			local v9
			if p3 == "Event" then
				local v102 = v1:GetCurrencyValue(v10.EventCurrencyName)
				if v102.Value < v5.Cost then
					return "CannotAfford"
				end
				v9 = v102
			else
				local v11 = v1:GetItemValue("PlushCoin")
				if not v11 then
					return
				end
				if v11.Value < v5.Cost then
					return "CannotAfford"
				end
				v9 = v11
			end
			local t = {
				Amount = 1,
				ItemType = v82.ItemType,
				Name = v82.Name,
				Theme = v5.Theme
			}
			t.Source = if p3 == "Event" then "EventGachaMachine" else "GachaMachine"
			if not v1:GiveItem(t) then
				return "MaxInventory"
			end
			v9.Value = v9.Value - v5.Cost
			if p3 == "Event" then
				v1:IncrementMission({
					Type = "BuyItem",
					Amount = 1,
					Data = { "EventGachaMachine" }
				})
				local isValue = t3.EventGachaRefreshTimer.CurrentSeed == v1.PlayerData.Gacha.EventSeed.Value
				local Purchases = v1.PlayerData.Gacha.Purchases
				Purchases.Value = Purchases.Value + 1
				if math.round(v1:GetWithModifiers({
					Default = 0,
					Name = v10.EventCurrencyName .. "Multiplier"
				}) * 100) >= 10 then
					if v1.PlayerData.Gacha.Purchases.Value >= 2 then
						v1.PlayerData.Gacha.EventSeed.Value = t3.EventGachaRefreshTimer.CurrentSeed
						v1.PlayerData.Gacha.Purchases.Value = 0
					end
				else
					v1.PlayerData.Gacha.Purchases.Value = 0
					v1.PlayerData.Gacha.EventSeed.Value = t3.EventGachaRefreshTimer.CurrentSeed
				end
			else
				v1.PlayerData.Gacha.LastSeed.Value = t3.GachaRefreshTimer.CurrentSeed
				v1:IncrementMission({
					Type = "BuyItem",
					Amount = 1,
					Data = { "GachaMachine" }
				})
			end
			local v14 = if p3 == "Event" then "EventGachaMachine" else "GachaMachine"
			if table.find(t2, v14) then
				return true
			end
			v8.ReportResourceEvent(v1.Player, "Sink", "Currency", v9.Name, v14, v5.Cost)
			return true
		end
	end
	t3.Init()
end
return t3