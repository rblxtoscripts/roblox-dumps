-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("TimeSeedClass")
local v5 = Sonar("TimeWindowSeedClass")
local v6 = Sonar("MarketplaceUtils")
local v7 = Sonar("AnimalDataService")
local v8 = Sonar("WeightedProbability")
local v9 = Sonar("NotificationsService")
local v10 = v1 and Sonar("ChatService")
local v11 = Sonar("BreedUtils")
local v12 = Sonar("Constants")
local v13 = Sonar("PlaceTypeService")
local v14 = v1 and Sonar("AnalyticsService")
local v17 = Sonar(v13.IsMarketWorld() and ReplicatedStorage.Storage.Shop.MarketHorseShopSlots or ReplicatedStorage.Storage.Shop.HorseShopSlots)
local v18 = v12.EventName and ReplicatedStorage.Storage.Events[v12.EventName]:FindFirstChild("EventHorseShopSlots")
if v18 then
	v18 = Sonar(v18)
end
local v20 = v12.EventName and ReplicatedStorage.Storage.Events[v12.EventName]:FindFirstChild("EventExclusiveHorseShopSlots")
if v20 then
	Sonar(v20)
end
local t2 = {
	Default = v17,
	Event = v18
}
local tbl = {
	Default = 3600,
	Event = t2.Event and 9000,
	ExclusiveEvent = {
		{
			Start = 21600,
			End = 36000
		},
		{
			Start = 64800,
			End = 79200
		}
	}
}
local t3 = { "DoNotLog" }
for k, v in pairs(tbl) do
	if type(v) == "table" then
		tbl[k] = v5.new({
			Duration = 86400,
			Start = 1735098780,
			OpenTimes = v
		})
		continue
	end
	if v == false then
		v = 3600
	end
	tbl[k] = v4.new({
		Duration = v
	})
end
local function addItemAnalytics(p1, p2, p3, p4, p5, p6) --[[ addItemAnalytics | Line: 79 | Upvalues: t3 (copy), v14 (copy) ]]
	if not table.find(t3, p5) then
		v14.ReportResourceEvent(p1, p2, p3, p4, p5, p6)
	end
end
function t.GetPurchasedSlotValue(p1, p2, p3) --[[ GetPurchasedSlotValue | Line: 87 ]]
	if p2 == "Event" then
		return p1.EventData.HorseShop.Slots[tostring(p3)]
	end
	if p2 == "ExclusiveEvent" then
		return p1.EventData.ExclusiveHorseShop.Slots[tostring(p3)]
	else
		return p1.PlayerData.HorseShop.Slots[tostring(p3)]
	end
end
function t.GetSlotSeed(p1, p2, p3) --[[ GetSlotSeed | Line: 96 | Upvalues: t (copy), v13 (copy) ]]
	local v1 = t.GetPurchasedSlotValue(p1, p2, p3)
	local v2 = p2 == "Event" and p1.EventData.HorseShop.LastSeed.Value or (p2 == "ExclusiveEvent" and p1.EventData.ExclusiveHorseShop.LastSeed.Value or p1.PlayerData.HorseShop.LastSeed.Value)
	local v3 = if v13.IsMarketWorld() then 1000 else 0
	if v1.Value > 0 then
		return v1.Value + p1.Player.UserId + v2 + tonumber(p3) * 1000 + v3
	else
		return v1.Value + v2 + tonumber(p3) * 1000 + v3
	end
end
function t.CreateOrGetSlotInfo(p1, p2, p3, p4) --[[ CreateOrGetSlotInfo | Line: 111 | Upvalues: t (copy), v8 (copy), v11 (copy), v12 (copy), v7 (copy) ]]
	if p4 then
		t.ClearSlotCache(p1, p2, p3)
	end
	if p1.CachedHorseShopSlots[p2][p3] then
		return p1.CachedHorseShopSlots[p2][p3]
	end
	local t2 = {}
	local v1 = t.GetSlotFromIndex(p2, p3)
	local v2 = t.GetSlotSeed(p1, p2, p3)
	local v4 = v1.Choices[v8.getRandomWeightedItem(v1.Choices, v2)]
	local v5 = Random.new(v2)
	local v6 = v1.BreedingPair and (if v5:NextNumber(0, 1) <= v1.BreedingPair.Chance then true else false)
	local v72 = if v6 then v4.BreedingPresetPairs and v4.BreedingPresetPairs[v5:NextInteger(1, #v4.BreedingPresetPairs)] else v6
	for i = 1, if v6 then 2 else 1 do
		local v10, v112
		local v122 = Random.new(v2)
		local Species = v4.Species
		local v13 = if typeof(Species) == "table" then Species[v122:NextInteger(1, #Species)] else Species
		local v14 = if v72 then v72[i][v122:NextInteger(1, #v72[i])] else v4.Preset[v122:NextInteger(1, #v4.Preset)]
		local v15 = v4.MaxEyeRarity or 100
		local Eye = v12.WildSpawnPresets.Presets[v14].Eye
		local t3 = {}
		for v16, v17 in v11.EyesByIndex do
			if (not Eye or table.find(Eye, v17.Name)) and not (v15 < v17.P) then
				table.insert(t3, v17)
			end
		end
		local v18 = nil
		if next(t3) then
			v18 = t3[v8.getRandomWeightedItem(t3, v122)].Name
		else
			warn("There was no eye with a low enough rarity for a horse shop slot. Make sure the MaxEyeRarity is obtainable. Falling back to a normal eye!")
		end
		local t4 = {
			Origin = "Bought",
			DoNotParent = true,
			DoNotIncrementCount = true,
			Age = 66,
			Species = v13 or "Horse",
			Preset = v14 or nil,
			Seed = v2,
			MaxCosmetics = v4.MaxCosmetics
		}
		if v6 and i == 1 then
			v10 = "Male"
			v112 = p1
		elseif v6 and i == 2 then
			v10 = "Female"
			v112 = p1
		elseif v122:NextNumber(0, 1) <= 0.6 then
			v10 = "Male"
			v112 = p1
		else
			v10 = "Female"
			v112 = p1
		end
		t4.Gender = v10
		t4.Eye = v18
		t4.Infertile = v4.Infertile or false
		t4.SkillLevels = v4.SkillLevels
		t4.MutationSlotChances = v4.MutationSlotChances
		t4.MutationChances = v4.MutationChances
		t2[i] = v7.CreateSlot(v112, t4)
	end
	p1.CachedHorseShopSlots[p2][p3] = t2
	return t2
end
function t.ClearSlotCache(p1, p2, p3) --[[ ClearSlotCache | Line: 200 ]]
	if not p1.CachedHorseShopSlots[p2][p3] then
		return
	end
	for k, v in pairs(p1.CachedHorseShopSlots[p2][p3]) do
		v:Destroy()
	end
	p1.CachedHorseShopSlots[p2][p3] = nil
end
function t.GetSlotFromIndex(p1, p2) --[[ GetSlotFromIndex | Line: 209 | Upvalues: t2 (copy) ]]
	return t2[p1][tonumber(p2)]
end
function t.GetPriceForSlot(p1, p2, p3) --[[ GetPriceForSlot | Line: 213 | Upvalues: t (copy), v7 (copy) ]]
	local sum = 0
	for k, v in pairs((t.CreateOrGetSlotInfo(p1, p2, p3))) do
		sum = sum + math.ceil(v7.GetPriceForSlot(v) * t.GetSlotFromIndex(p2, p3).PriceMultiplier)
	end
	return sum
end
function t.CanPurchaseSlot(p1, p2, p3) --[[ CanPurchaseSlot | Line: 222 | Upvalues: tbl (copy), t (copy) ]]
	local v1 = tonumber(p3)
	if not (game:GetService("RunService"):IsStudio() or p1:CanGiveItem("Animals")) then
		return "AtAnimalLimit"
	end
	if p2 == "ExclusiveEvent" and not tbl[p2]:IsActive() then
		return "NotOpen"
	end
	local v2 = t.GetSlotFromIndex(p2, v1)
	if not v2 then
		return
	end
	if v2.ProductId then
		return true
	end
	if not p1:HasUnlockedSpecies(t.CreateOrGetSlotInfo(p1, p2, v1)[1].Species.Value) then
		return "LockedSpecies"
	end
	local v3 = t.GetPriceForSlot(p1, p2, v1)
	local v4 = p1:CanAfford(v3, v2.Currency or "Coins")
	if v4 then
		return true, v3, v4
	else
		return "CannotAfford"
	end
end
function t.PurchaseSlot(p1, ...) --[[ PurchaseSlot | Line: 257 | Upvalues: v2 (copy) ]]
	return v2.GetRemoteFunction("PurchaseHorseSlotRemote"):InvokeServer(...)
end
function t.CreateAndGivePurchasedSlot(p1, p2, p3) --[[ CreateAndGivePurchasedSlot | Line: 261 | Upvalues: t (copy), v7 (copy), v14 (copy) ]]
	local t2 = {}
	local t3 = {}
	for k, v in pairs((t.CreateOrGetSlotInfo(p1, p2, p3))) do
		local v2 = v7.CreateSlot(p1, {
			DoNotParent = true,
			IncrementSerial = true
		}, v)
		v2.Parent = p1:GetItemFolder("Animals")
		local v3 = p1:GetItemFolder("Animals")
		local Species = v2.Species.Value
		local count = 0
		for v4, v5 in v3:GetChildren() do
			if v5.Species.Value == Species then
				count = count + 1
			end
		end
		v14.ReportResourceEvent(p1.Player, "Source", "HorseSlot", Species, "HorseSlotShop", 1, {
			{
				Key = "Total",
				Value = count
			}
		})
		t2[k] = v2
		t3[k] = v2.Name
	end
	t.ClearSlotCache(p1, p2, p3)
	return t3, t2
end
function t.Init(p1) --[[ Init | Line: 297 | Upvalues: t (copy), tbl (copy), v3 (copy), t2 (copy), v1 (copy), v6 (copy), v10 (copy), v2 (copy), t3 (copy), v14 (copy), v9 (copy) ]]
	t.RefreshTimer = tbl.Default
	t.RefreshTimers = tbl
	v3.bindToPlayers(function(p1) --[[ Line: 301 | Upvalues: v3 (ref), t2 (ref), v1 (ref), tbl (ref), t (ref) ]]
		local v12 = v3.getWrapperFromPlayer(p1)
		v12.CachedHorseShopSlots = {}
		for k, v in pairs(t2) do
			v12.CachedHorseShopSlots[k] = {}
		end
		if not v1 then
			return
		end
		for k, v in pairs(t2) do
			local v2 = k == "Event" and v12.EventData.HorseShop or (k == "ExclusiveEvent" and v12.EventData.ExclusiveHorseShop or v12.PlayerData.HorseShop)
			local v32 = tbl[k]
			local function resetPurchased() --[[ resetPurchased | Line: 316 | Upvalues: v2 (copy), v32 (copy), v12 (copy), k (copy), t (ref) ]]
				if v2.LastSeed.Value == v32.CurrentSeed then
					return
				end
				v2.LastSeed.Value = v32.CurrentSeed
				for k2, v in pairs(v2.Slots:GetChildren()) do
					v.Value = 0
				end
				for k2, v in pairs(v12.CachedHorseShopSlots[k]) do
					t.ClearSlotCache(v12, k, k2)
				end
			end
			v12.Maid:GiveTask(v32.SeedChanged:Connect(resetPurchased))
			resetPurchased()
		end
	end)
	if not v1 then
		return
	end
	for k, v in pairs(t2) do
		for k2, v4 in pairs(v) do
			if v4.BreedingPair then
				v4.BreedingPair.Index = k2
				v4.BreedingPair.ProductType = "HorseShopSlot"
				v6.AddDeveloperProducts({ v4.BreedingPair })
			end
		end
		v6.AddDeveloperProducts(v)
	end
	tbl.Default.SeedChanged:Connect(function() --[[ Line: 345 | Upvalues: v10 (ref) ]]
		v10:BroadcastMessage({
			Type = "HorseShop",
			Message = "New Horses for sale in the Stables!"
		})
	end)
	if tbl.Event then
		tbl.Event.SeedChanged:Connect(function() --[[ Line: 353 ]] end)
	end
	v2.GetRemoteFunction("PurchaseHorseSlotRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 363 | Upvalues: v3 (ref), t (ref), t3 (ref), v14 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v32, v4 = t.CanPurchaseSlot(v1, p2, p3)
		if v2 ~= true or not v32 then
			return
		end
		if not v1.LastHorseSlotPurchase then
			v1.LastHorseSlotPurchase = 0
		end
		if tick() - v1.LastHorseSlotPurchase <= 2 then
			return
		end
		v1.LastHorseSlotPurchase = tick()
		local v5, v6 = t.CreateAndGivePurchasedSlot(v1, p2, p3)
		v4.Value = v4.Value - v32
		local v7 = t.GetPurchasedSlotValue(v1, p2, p3)
		v7.Value = v7.Value + 1
		for k, v in pairs(v6) do
			local Species = v.Species.Value
			if not table.find(t3, "HorseSlotShop") then
				v14.ReportResourceEvent(p1, "Source", "HorseSlotResource", Species, "HorseSlotShop", 1)
			end
		end
		local v8 = v4.Name
		if not table.find(t3, "HorseSlotShop") then
			v14.ReportResourceEvent(p1, "Sink", "HorseSlotCurrency", v8, "HorseSlotShop", v32)
		end
		for v9, v10 in v6 do
			v1:IncrementMission({
				Type = "GetHorseFromStable",
				Amount = 1,
				Data = { v10.Species.Value }
			})
		end
		v1:IncrementMission({
			Type = "BuyStable",
			Amount = 1,
			Data = { p2 }
		})
		return v5[1]
	end
	v6.AddProductHandler("HorseShopSlot", function(p1, p2) --[[ Line: 406 | Upvalues: t (ref), v9 (ref) ]]
		local v1 = p2.SlotType or "Default"
		local v2, v3 = t.CreateAndGivePurchasedSlot(p1, v1, p2.Index)
		local v4 = t.GetPurchasedSlotValue(p1, v1, p2.Index)
		v4.Value = v4.Value + 1
		for v5, v6 in v3 do
			p1:IncrementMission({
				Type = "GetHorseFromStable",
				Amount = 1,
				Data = { v6.Species.Value }
			})
		end
		v9.NotifyPlayer(p1.Player, "PurchasedHorseShopSlot", { v2, v1 })
		p1:IncrementMission({
			Type = "BuyStable",
			Amount = 1,
			Data = { v1 }
		})
		return {
			ItemType = "HorseShopSlot",
			ItemId = p2.Index
		}
	end)
end
t:Init()
return t