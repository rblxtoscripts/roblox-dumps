-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("TimeSeed")
local v2 = Sonar("ItemDataService")
local v3 = Sonar("Maid")
local v4 = Sonar("safeDestroy")
local v5 = Sonar("InstanceUtils")
local v6 = Sonar("WeightedProbability")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("Signal")
local v9 = Sonar("FormatNumber")
local v10 = Sonar("EventUtils")
local v11 = Sonar("DataUtils")
local v12 = Sonar("TableUtils")
local v13 = Sonar("FormatTime")
local v14 = Sonar("MarketplaceService")
local v15 = Sonar("ShopService", {
	Deferred = true
})
local v16 = game:GetService("RunService"):IsServer()
local v17 = v5.Create("Configuration", {
	Name = "ShopReplication",
	Parent = ReplicatedStorage
}, true)
local t2 = {}
function t._validateCurrency(p1, p2) --[[ _validateCurrency | Line: 49 | Upvalues: v2 (copy) ]]
	for v1, v22 in p2 do
		if not v2.GetByName(v1) then
			warn("\226\154\160\239\184\143 Shop, Invalid currency", v1, "not found", p1.Name)
			return
		end
		p2[v1] = math.ceil(v22)
	end
	return p2
end
function t._validatePrice(p1, p2, p3, p4, ...) --[[ _validatePrice | Line: 63 ]]
	local v1 = nil
	if type(p3) == "number" then
		v1 = {
			[p1.Currency] = p3
		}
	elseif p1:_getValueOrFunction(p3, "Price") then
		v1 = p1:_getValueOrFunction(p3, "Price", p2, p3, ...)
	end
	if not v1 then
		v1 = p1:_getValueOrFunction(p2, "Price", p2, p3, ...)
	end
	local v4 = p1:_getValueOrFunction(p1.Config, "Price", p2, v1, ...) or v1
	local t = {}
	if v4 then
		for v5, v6 in v4 do
			t[v5] = p1:_validateNumber(v6, p4, ...)
		end
		t = p1:_validateCurrency(t)
	end
	if t and next(t) then
		return t
	end
end
function t._validateStock(p1, p2, p3, p4, ...) --[[ _validateStock | Line: 102 ]]
	local v1 = p1:_getValueOrFunction(p3, "Stock", p2, p3, p4, ...)
	local v2 = if v1 or not p4 then v1 else p1:_getValueOrFunction(p4, "Stock", p2, p3, p4, ...)
	if not v2 and p1.Config.Stock then
		local v4 = p1:_getValueOrFunction(p1.Config.Stock, "GetStock", p2, p3, p4, ...)
		v2 = if v4 then v4 else 1
	end
	return p1:_validateNumber(v2, p4, ...)
end
function t._validateAmount(p1, p2, p3, p4, ...) --[[ _validateAmount | Line: 126 ]]
	local v1 = p1:_getValueOrFunction(p3, "Amount", p2, p3, p4, ...)
	local v2 = if v1 or not p4 then v1 else p1:_getValueOrFunction(p4, "Amount", p2, p3, p4, ...)
	return p1:_validateNumber(p1:_getValueOrFunction(p1.Config, "Amount", p2, v2, p4, ...) or v2 or 1, p4, ...)
end
function t._validateNumber(p1, p2, p3, p4) --[[ _validateNumber | Line: 148 ]]
	if typeof(p2) == "NumberRange" then
		p2 = Random.new(p1:_getSeed(p3, p4)):NextNumber(p2.Min, p2.Max)
	end
	return p2
end
function t._validateItemModifiers(p1, p2, p3, p4, ...) --[[ _validateItemModifiers | Line: 157 ]]
	local t = {}
	local Modifiers = p1.Config.Modifiers
	if Modifiers then
		for v1, v2 in Modifiers do
			local v3 = p1:_getValueOrFunction(p3, v1, p2, p3, p4, ...)
			if not v3 then
				v3 = p1:_getValueOrFunction(p4, v1, p2, p3, p4, ...)
			end
			if not v3 and type(v2) == "function" then
				v2(p2, p3, p4, ...)
			end
			local v5 = p1:_validateNumber(v3, p4, ...) or v3
			if v5 then
				t[v1] = v5
			end
		end
	end
	for v6, v7 in { p4, p1.Config } do
		local v8 = p1:_getValueOrFunction(v7, "ItemData", p2, p3, p4, ...)
		if v8 then
			for v9, v10 in v8 do
				t[v9] = v10
			end
		end
	end
	return if next(t) and t then t else nil
end
function t._validateItem(p1, p2, p3, p4, ...) --[[ _validateItem | Line: 194 ]]
	local v1 = p1:_validatePrice(p2, p3, p4, ...)
	local v2 = p1:_getValueOrFunction(p3, "ProductId") or p1:_getValueOrFunction(p2, "ProductId") or p1:_getValueOrFunction(p1.Config, "ProductId", p2, p3, ...)
	if not (v1 or v2) then
		return
	end
	local v3 = p1:_validateItemModifiers(p2, p3, p4, ...)
	local t = {
		Price = v1
	}
	t.ProductId = if v2 then tonumber(v2) or nil else nil
	t.P = type(p3) == "table" and p3.P or nil
	t.Amount = p1:_validateAmount(p2, p3, p4, ...)
	t.Stock = p1:_validateStock(p2, p3, p4, ...)
	t.Modifiers = v3
	return t
end
function t._validateItems(p1, p2, p3) --[[ _validateItems | Line: 222 | Upvalues: v2 (copy), v12 (copy) ]]
	local v1 = if p3 then p3 else {}
	local v22, v3
	if p2 == "All" then
		v22, v3 = v2.GetAll(), v1
	elseif typeof(p2) == "string" then
		v22, v3 = v2.GetItemsByType(p2) or (v2.GetItemsByCategory(p2) or (v2.GetItemsBySubType(p2) or {})), v1
	elseif type(p2) == "function" then
		v22, v3 = p1:_getValueOrFunction(p1.Config, "Items", p2, v1.Slot, v1.Player), v1
	else
		v22 = p2
		v3 = v1
	end
	local t = {}
	for v7, v8 in v22 do
		local v9 = type(v8) == "string" and v2.GetByName(v8) or v2.GetByName(v7)
		if v9 then
			local v10, v11, v122, v13, v14, v15
			if p1.Type == "Sell" then
				local v16 = v9.Disabled and v9.Disabled.SellShop
				if v16 == nil and v9.Disabled then
					v16 = v9.Disabled.Shops
				elseif v9.Disabled and (v9.Disabled.Shops and v16 == false) then
					v16 = false
				end
				if not v16 and ((not p1.Config.ItemTypes or v2.IsItemOfType(v9.Name, p1.Config.ItemTypes)) and (not p1.Config.CanAddItem or p1:_getValueOrFunction(p1.Config, "CanAddItem", v9, v8, v3.Slot, v3.Player))) then
					v10 = v3.Slot
					v11 = v3.Player
					v122 = v3.Player and p1:_getSeed(v3.Slot, v3.Player)
					v13 = p1:_validateItem(v9, v8, v10, v11, v122)
					if v13 then
						v14 = v12.MergeOriginal
						v15 = {
							Name = v9.Name,
							Data = v9
						}
						table.insert(t, v14(v13, v15))
						if not v13.P and p1.Config.ItemsUseWeightedProbability then
							warn("\226\154\160\239\184\143 Shop, P value is required for weighted probability", v9.Name, p1.Name)
						end
						if v13.Stock and not p1.Config.Stock then
							warn("\226\154\160\239\184\143 Shop, Stock was found for item but stock flag was not enabled for the shop", p1.Name)
						end
						continue
					end
					if p2 ~= "All" then
						warn("\226\154\160\239\184\143 Shop, Item could not be registered", v9.Name, p1.Name, v13)
					end
				end
			elseif not (v9.Disabled and v9.Disabled.Shops) and ((not p1.Config.ItemTypes or v2.IsItemOfType(v9.Name, p1.Config.ItemTypes)) and (not p1.Config.CanAddItem or p1:_getValueOrFunction(p1.Config, "CanAddItem", v9, v8, v3.Slot, v3.Player))) then
				v10 = v3.Slot
				v11 = v3.Player
				v122 = v3.Player and p1:_getSeed(v3.Slot, v3.Player)
				v13 = p1:_validateItem(v9, v8, v10, v11, v122)
				if v13 then
					v14 = v12.MergeOriginal
					v15 = {
						Name = v9.Name,
						Data = v9
					}
					table.insert(t, v14(v13, v15))
					if not v13.P and p1.Config.ItemsUseWeightedProbability then
						warn("\226\154\160\239\184\143 Shop, P value is required for weighted probability", v9.Name, p1.Name)
					end
					if v13.Stock and not p1.Config.Stock then
						warn("\226\154\160\239\184\143 Shop, Stock was found for item but stock flag was not enabled for the shop", p1.Name)
					end
					continue
				end
				if p2 ~= "All" then
					warn("\226\154\160\239\184\143 Shop, Item could not be registered", v9.Name, p1.Name, v13)
				end
			end
			continue
		end
		warn("\226\154\160\239\184\143 Shop, Invalid item", v7, "not found", p1.Name)
	end
	table.sort(t, function(p1, p2) --[[ Line: 300 ]]
		return p1.Name < p2.Name
	end)
	return t
end
function t.GetItemPool(p1) --[[ GetItemPool | Line: 308 ]]
	if not p1.Config.Items then
		return {}
	end
	if p1.CacheRegisteredItems then
		return p1.RegisteredItems
	else
		return {}
	end
end
function t._validateSlot(p1, p2, p3) --[[ _validateSlot | Line: 321 ]]
	return if p2.Items then p1:_validateItems(p2.Items, {
	Slot = p2,
	Player = p3
}) else {}
end
function t.new(p1, p2) --[[ new | Line: 335 | Upvalues: t (copy), v3 (copy), v8 (copy), v16 (copy), v1 (copy), v7 (copy), v11 (copy), v5 (copy), v17 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	v2.ItemsMaid = v2.Maid:GiveTask(v3.new())
	v2.Name = p1
	v2.Type = p2.Type or "Buy"
	v2.ShopType = p2.ShopType or v2.Name
	v2.Config = p2
	v2.Player = p2.Player
	v2.ItemsChangedSignal = v8.new()
	v2.Maid:GiveTask(v2.ItemsChangedSignal)
	v2.RegisteredItemsPerSlot = {}
	v2.ItemsByPlayer = {}
	v2.Currency = p2.Currency or "Coins"
	v2.ItemsAreSeeded = if (p2.Slots or p2.TotalItems) == nil then false else true
	v2.SlotsPerPlayer = p2.SlotsPerPlayer
	v2.ItemsPerPlayer = p2.ItemsPerPlayer
	v2.SeededPerPlayer = v2.SlotsPerPlayer or v2.ItemsPerPlayer
	v2.SeededOnServer = not v2.SeededPerPlayer and v2.ItemsAreSeeded
	local Items = p2.Items
	if Items then
		Items = if v2.SeededOnServer then not v2.ItemsPerPlayer and not v2.Config.ItemsRefresh else not v2.ItemsAreSeeded and not v2.ItemsPerPlayer and not v2.Config.ItemsRefresh
	end
	v2.CacheRegisteredItems = Items
	v2.CacheRegisteredSlots = not v2.SlotsPerPlayer
	v2.ItemsAreReplicated = v2.SeededOnServer or v2.SeededPerPlayer
	v2.AutoReplicateToAllPlayers = v2.Config.ForceAutoReplication or v2.SeededOnServer and p2.ReplicateToAllPlayers
	v2.ReplicatePlayers = {}
	if v2.SeededPerPlayer and v2.AutoReplicateToAllPlayers then
		warn("\226\154\160\239\184\143 Shop, SeededPerPlayer and AutoReplicateToAllPlayers cannot be true at the same time", v2.Name)
		v2.SeededPerPlayer = false
	end
	v2.ClientRequestsItems = not v2.AutoReplicateToAllPlayers and not v2.SeededOnServer
	if p2.Restock and not p2.Stock then
		warn("\226\154\160\239\184\143 Shop, Restock is not supported for shops that don\'t have stock", v2.Name)
		p2.Restock = nil
	end
	if p2.Reshuffle and not v2.SeededPerPlayer then
		p2.Reshuffle = nil
		warn("\226\154\160\239\184\143 Shop, Reshuffle is not supported for shops that don\'t have randomisation", v2.Name)
	end
	if v16 then
		v2.ShopFolder = Instance.new("Configuration")
		v2.ShopFolder.Name = p1
		v2.ShopFolder:SetAttribute("Currency", v2.Currency)
		if v2.CacheRegisteredItems then
			v2.RegisteredItems = v2:_validateItems(v2.Config.Items)
		end
		v2.OnPurchased = type(v2.Config.OnPurchased) == "function" and { v2.Config.OnPurchased } or v2.Config.OnPurchased
		if not v2.OnPurchased then
			v2.OnPurchased = {}
		end
		v2.OnSold = type(v2.Config.OnSold) == "function" and { v2.Config.OnSold } or v2.Config.OnSold
		if not v2.OnSold then
			v2.OnSold = {}
		end
		if v2.Config.Refresh then
			v2.RefreshTimer = v1.new({
				DoNotDeferSeedInit = true,
				Duration = v2.Config.Refresh.Duration,
				Start = v2.Config.Refresh.StartTime
			})
			v2.Maid:GiveTask(v2.RefreshTimer)
			v2.OnRefreshed = type(v2.Config.Refresh.OnRefreshed) == "function" and { v2.Config.Refresh.OnRefreshed } or v2.Config.Refresh.OnRefreshed
			if not v2.OnRefreshed then
				v2.OnRefreshed = {}
			end
			v2.Maid:GiveTask(v2.RefreshTimer.SeedChanged:Connect(function(p1, p2) --[[ Line: 450 | Upvalues: v2 (copy) ]]
				if p2 then
					return
				end
				if v2._initialStocked then
					v2:_serverGenerateItems("Refresh")
				end
			end))
		end
		local function resetPlayerData(p1, p2) --[[ resetPlayerData | Line: 464 | Upvalues: v2 (copy) ]]
			local LastRefresh = p2:FindFirstChild("LastRefresh")
			if not LastRefresh then
				warn("\226\154\160\239\184\143 Shop, No LastRefresh data value found in", p2, v2.Name)
				return
			end
			if LastRefresh.Value ~= v2.RefreshTimer.CurrentSeed then
				LastRefresh.Value = v2.RefreshTimer.CurrentSeed
				v2:ResetPlayerData(p1)
			end
		end
		if v2.Config.Refresh or v2.Config.CreateDataFolder then
			v2.Maid:GiveTask(v7.bindToPlayers({
				OnAdded = function(p12, p2) --[[ OnAdded | Line: 485 | Upvalues: v2 (copy), p1 (copy), v11 (ref), v5 (ref) ]]
					if v2._destroyed or not v2._getDataFolder then
						return
					end
					local v1 = v2:_getDataFolder(p2)
					if not v1 then
						if (v2.Config.GetShopData == nil or v2.Config.ShopDataName ~= nil) and not p2.PlayerData.Shops:FindFirstChild(p1) then
							local v22 = v11.CreateDataValueFromType("ShopTemplate")
							v22.Name = v2:_getValueOrFunction(v2.Config, "ShopDataName") or v2.Name
							v22.Parent = p2.PlayerData.Shops
							v1 = v2:_getDataFolder(p2)
						end
						if not v1 then
							warn("\226\154\160\239\184\143 Shop, No shop data folder found in", p2.Player, v2.Name)
						end
					end
					if v2.Config.GlobalStock and not v1:FindFirstChild("TotalPurchases") then
						v5.Create("IntValue", {
							Name = "TotalPurchases",
							Value = 0,
							Parent = v1
						})
					end
					if v2.RefreshTimer then
						p2.Maid:GiveTask(v2.RefreshTimer.SeedChanged:Connect(function() --[[ Line: 519 | Upvalues: p2 (copy), v1 (ref), v2 (ref) ]]
							local v12 = p2
							local v22 = v1
							local LastRefresh = v22:FindFirstChild("LastRefresh")
							if not LastRefresh then
								warn("\226\154\160\239\184\143 Shop, No LastRefresh data value found in", v22, v2.Name)
								return
							end
							if LastRefresh.Value ~= v2.RefreshTimer.CurrentSeed then
								LastRefresh.Value = v2.RefreshTimer.CurrentSeed
								v2:ResetPlayerData(v12)
							end
						end))
						local v4 = v1
						local LastRefresh = v4:FindFirstChild("LastRefresh")
						if LastRefresh then
							if LastRefresh.Value ~= v2.RefreshTimer.CurrentSeed then
								LastRefresh.Value = v2.RefreshTimer.CurrentSeed
								v2:ResetPlayerData(p2)
							end
						else
							warn("\226\154\160\239\184\143 Shop, No LastRefresh data value found in", v4, v2.Name)
						end
					end
				end,
				OnRemoved = function(p1, p2) --[[ OnRemoved | Line: 525 | Upvalues: v2 (copy) ]]
					v2.ReplicatePlayers[p1] = nil
					v2.ItemsByPlayer[p1] = nil
				end
			}))
		end
		v2.RequestItemsRemote = Instance.new("RemoteFunction")
		v2.RequestItemsRemote.Name = "RequestItems"
		function v2.RequestItemsRemote.OnServerInvoke(p1) --[[ Line: 534 | Upvalues: v7 (ref), v2 (copy) ]]
			local v1 = v7.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if not v2.ClientRequestsItems then
				return
			end
			if v2.ItemsByPlayer[v1.Player] then
			else
				v2:_generateItemsForPlayer(v1, true)
				return true
			end
		end
		v2.RequestItemsRemote.Parent = v2.ShopFolder
		v2.Maid:GiveTask(v2.RequestItemsRemote)
		if v2.SeededOnServer then
			v2.UpdateItemsSignal = v8.new()
			v2.Maid:GiveTask(v2.UpdateItemsSignal)
			v2.Maid:GiveTask(v2.UpdateItemsSignal:Connect(function() --[[ Line: 564 | Upvalues: v2 (copy) ]]
				v2:_serverGenerateItems()
			end))
		else
			v2.Maid:GiveTask(v7.bindToPlayers({
				OnAdded = function(p1, p2) --[[ OnAdded | Line: 571 | Upvalues: v2 (copy) ]]
					local v1 = v2:GetItemsUpdatedSignal(p2):Connect(function() --[[ Line: 572 | Upvalues: v2 (ref), p2 (copy) ]]
						v2:_clearItemsForPlayer(p2)
					end)
					local v22 = v2.Name .. "-ItemsUpdated-" .. p1.UserId
					p2.Maid:GiveTask(function() --[[ Line: 577 | Upvalues: v2 (ref), v22 (copy) ]]
						if not v2.Maid then
							return
						end
						v2.Maid[v22] = nil
					end)
					v2.Maid[v22] = v1
				end
			}))
		end
		v2:_serverGenerateItems("Init")
		v2.ShopFolder.Parent = v17
		v2.Maid:GiveTask(v2.ShopFolder)
	else
		v2.LocalWrapper = v7.GetClient()
		v2.ShopFolder = v17:WaitForChild(p1)
		v2.RequestItemsRemote = v2.ShopFolder:WaitForChild("RequestItems")
		if v2.CacheRegisteredItems then
			v2.RegisteredItems = v2:_validateItems(p2.Items)
		end
		v2.Maid:GiveTask(v2.LocalWrapper:GetReplicatedDataChangedSignal(v2.Name .. "-Items"):Connect(function() --[[ Line: 606 | Upvalues: v2 (copy) ]]
			v2:_updateItems()
		end))
	end
	v2.Maid:GiveTask(v2.ShopFolder:GetAttributeChangedSignal("Items"):Connect(function() --[[ Line: 612 | Upvalues: v2 (copy) ]]
		v2:_updateItems()
	end))
	v2:_updateItems()
	v2:_registerProducts()
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 625 | Upvalues: v4 (copy) ]]
	v4(p1)
end
function t._runCallbacks(p1, p2, ...) --[[ _runCallbacks | Line: 629 ]]
	for v1, v2 in p1[p2] do
		v2(p1, ...)
	end
end
function t._getValueOrFunction(p1, p2, p3, ...) --[[ _getValueOrFunction | Line: 635 ]]
	if not p2 then
		return
	end
	if type(p2) ~= "table" then
		return
	end
	if type(p2[p3]) == "function" then
		return p2[p3](p1, ...)
	else
		return p2[p3]
	end
end
function t._registerProducts(p1) --[[ _registerProducts | Line: 651 | Upvalues: t2 (copy), v14 (copy) ]]
	local t = {}
	local function addProduct(p1) --[[ addProduct | Line: 654 | Upvalues: t2 (ref), v14 (ref), t (copy) ]]
		if not p1.ProductId or t2[p1.ProductId] then
			return
		end
		local v1 = v14.GetPurchaseFromId(p1.ProductId)
		if v1 then
			if v14.HasProductPurchasedCallback(p1.ProductId) and v1.ProductCategory ~= p1.ProductCategory then
				warn("\226\154\160\239\184\143 ShopService, Product already has a purchased callback", p1.ProductId, v1)
				return
			end
		else
			t[p1.ProductId] = p1
			v1 = p1
		end
		t2[p1.ProductId] = v1
	end
	if not p1.SeededPerPlayer then
		for v3, v4 in p1:GetItemPool() do
			local v1, v2
			local v5 = p1:GetItemProductId({
				Amount = 1,
				Item = v4
			})
			local t3 = {
				ProductCategory = "ShopItem",
				ProductType = "DeveloperProduct"
			}
			if p1.Config.AllowDuplicates then
				v1 = "-" .. v3
				v2 = addProduct
			else
				v1 = ""
				v2 = addProduct
			end
			t3.Name = p1.Name .. "_" .. v4.Name .. v1
			t3.ProductId = v5
			v2(t3)
		end
	end
	local v9 = p1:GetRestockProductId()
	if v9 then
		addProduct({
			ProductType = "DeveloperProduct",
			ProductCategory = "ShopRestock",
			Name = p1.Name .. "_Restock",
			ProductId = v9
		})
	end
	local v10 = p1:GetReshuffleProductId()
	if v10 then
		addProduct({
			ProductType = "DeveloperProduct",
			ProductCategory = "ShopReshuffle",
			Name = p1.Name .. "_Reshuffle",
			ProductId = v10
		})
	end
	if not next(t) then
		return
	end
	v14.AddPurchasesFromModule(t)
end
function t.IsRobuxToRestock(p1) --[[ IsRobuxToRestock | Line: 715 ]]
	return p1:GetRestockProductId() and true or false
end
function t.IsRobuxToReshuffle(p1) --[[ IsRobuxToReshuffle | Line: 723 ]]
	return p1:GetReshuffleProductId() and true or false
end
function t._getSeed(p1, p2, p3) --[[ _getSeed | Line: 731 ]]
	local v1 = 0
	if type(p2) == "number" then
		v1 = p2
	elseif type(p2) == "table" then
		v1 = p2._index
	end
	local v2 = 0
	if p3 then
		local v3 = p1:GetReshuffleValue(p3)
		if v3 then
			v2 = v3.Value
		end
	end
	local v4 = (v1 or 0) * 100
	local v5 = p1:_getValueOrFunction(p1.Config.Refresh, "Seed", p3) or p1:_getValueOrFunction(p1.Config, "Seed", p3)
	local v6 = p1.RefreshTimer and p1.RefreshTimer:GetSeed() or p1.ShopFolder:GetAttribute("RefreshSeed")
	if v6 then
		return (v5 or 0) + v6 + v4 + v2
	end
	return (if v5 then v5 else os.time()) + v4 + v2
end
function t._getAvailableItemsForSlot(p1, p2, p3) --[[ _getAvailableItemsForSlot | Line: 763 ]]
	local t = {}
	local v1 = type(p2.ItemType) == "table" and p2.ItemType or { p2.ItemType }
	local v2 = type(p2.ItemName) == "table" and p2.ItemName or { p2.ItemName }
	local v3 = type(p2.Rarity) == "table" and p2.Rarity or { p2.Rarity }
	for v4, v5 in p3 do
		if (not next(v1) or table.find(v1, v5.Data.ItemType.Name)) and ((not next(v2) or table.find(v2, v5.Data.Name)) and (not next(v3) or table.find(v3, v5.Data.Rarity.Name))) then
			table.insert(t, v5)
		end
	end
	return t
end
function t._getRandomFromItemsAndSlots(p1, p2, p3, p4) --[[ _getRandomFromItemsAndSlots | Line: 791 ]]
	local v1 = Random.new(p4):NextInteger(1, #p2 + #p3)
	local v2 = p2[v1]
	if not v2 then
		v2 = p3[v1 - #p2]
		if v2 then
			return v2
		end
	end
	return v2
end
function t._generateItems(p1, p2) --[[ _generateItems | Line: 811 | Upvalues: v12 (copy), v6 (copy) ]]
	local v1 = p1.RegisteredItems and table.clone(p1.RegisteredItems) or (p1.Config.Items and p1:_validateItems(p1.Config.Items, {
		Player = p2
	}) or {})
	local v2 = p1:_getValueOrFunction(p1.Config, "Slots", p2)
	if v2 then
		local t = {}
		for v5, v62 in v2 do
			local v3, v4
			v62._index = v5
			local v7 = p1.RegisteredItemsPerSlot[v5]
			local v8, v9, v10, v11, v122
			if v7 then
				if v7 and not (next(v7) or next(v1)) then
					warn("\226\154\160\239\184\143 Shop, No items in slot", v5, p1.Name)
					continue
				end
				v8 = table.clone(v7)
				v9 = p1:_getSeed(v5, p2)
				if next(v8) then
					v3 = v8
					v4 = v8
				else
					v3 = p1:_getAvailableItemsForSlot(v62, v1)
					if v3 then
						v4 = v8
					else
						v3 = v8
						v4 = v8
					end
				end
				v10 = p1:_getRandomFromItemsAndSlots(v3, v4, v9)
				if v10 then
					v10.Modifiers = p1:_validateItemModifiers(v10.Data, v10, v62, p2, v9)
					v11 = v12.strip
					table.insert(t, v11(v10, { "Data", "P" }))
					if not p1.Config.AllowDuplicates then
						for v13, v14 in { v1, v4 } do
							v122 = table.find(v14, v10)
							if v122 then
								table.remove(v14, v122)
								break
							end
						end
					end
					continue
				end
				warn("\226\154\160\239\184\143 Shop, No item found for slot", v5, p1.Name, v4)
			else
				if type(v5) == "number" then
					local v15 = p1:_validateSlot(v62, p2)
					if p1.CacheRegisteredSlots then
						p1.RegisteredItemsPerSlot[v5] = v15
					end
					v7 = v15
					if v15 and not (next(v15) or next(v1)) then
						warn("\226\154\160\239\184\143 Shop, No items in slot", v5, p1.Name)
						continue
					end
					v8 = table.clone(v15)
					v9 = p1:_getSeed(v5, p2)
					if next(v8) then
						v3 = v8
						v4 = v8
					else
						v3 = p1:_getAvailableItemsForSlot(v62, v1)
						if v3 then
							v4 = v8
						else
							v3 = v8
							v4 = v8
						end
					end
					v10 = p1:_getRandomFromItemsAndSlots(v3, v4, v9)
					if v10 then
						v10.Modifiers = p1:_validateItemModifiers(v10.Data, v10, v62, p2, v9)
						v11 = v12.strip
						table.insert(t, v11(v10, { "Data", "P" }))
						if not p1.Config.AllowDuplicates then
							for v13, v14 in { v1, v4 } do
								v122 = table.find(v14, v10)
								if v122 then
									table.remove(v14, v122)
									break
								end
							end
						end
						continue
					end
					warn("\226\154\160\239\184\143 Shop, No item found for slot", v5, p1.Name, v4)
					continue
				end
				warn("\226\154\160\239\184\143 Shop, Slots aren\'t an indexed table", p1.Name)
			end
		end
		return t
	else
		local v16 = p1:_getValueOrFunction(p1.Config, "TotalItems")
		if v16 then
			local v17 = table.clone(v1)
			local t = {}
			for i = 1, v16 do
				local v18, v19
				if p1.Config.ItemsUseWeightedProbability then
					local v20 = v6.getRandomWeightedItem(v17, p1:_getSeed(i, p2))
					v18 = v17[v20]
					v19 = v20
				else
					local v21, v22 = v6.getRandomFromTable(v17, p1:_getSeed(i, p2))
					v18 = v21
					v19 = v22
				end
				if not v18 then
					break
				end
				table.insert(t, v12.strip(v18, { "Data", "P" }))
				if not p1.Config.AllowDuplicates then
					table.remove(v17, v19)
				end
			end
			return t
		else
			local t = {}
			for v23, v24 in v1 do
				table.insert(t, v12.strip(v24, { "Data", "P" }))
			end
			return t
		end
	end
end
function t._clearItemsForPlayer(p1, p2) --[[ _clearItemsForPlayer | Line: 913 | Upvalues: v7 (copy) ]]
	local v1 = if type(p2) == "table" and p2 then p2 else v7.getWrapperFromPlayer(p2)
	if not v1 then
		return
	end
	if not p1.ItemsByPlayer[v1.Player] then
		return
	end
	p1.ItemsByPlayer[v1.Player] = nil
	if not (p1.AutoReplicateToAllPlayers or p1.ClientRequestsItems) then
		return
	end
	v1:SetReplicatedData(p1.Name .. "-Items", nil)
end
function t._replicateItemsToPlayer(p1, p2, p3) --[[ _replicateItemsToPlayer | Line: 934 | Upvalues: v7 (copy), HttpService (copy) ]]
	local v1 = if type(p2) == "table" and p2 then p2 else v7.getWrapperFromPlayer(p2)
	if not v1 then
		return
	end
	v1:SetReplicatedData(p1.Name .. "-Items", p3 and HttpService:JSONEncode(p3) or p1.EncodedItemsInShop)
end
function t._serverGenerateItems(p1, p2) --[[ _serverGenerateItems | Line: 944 | Upvalues: HttpService (copy) ]]
	p1.ItemsMaid:DoCleaning()
	if p1.Config.Refresh then
		p1.ShopFolder:SetAttribute("RefreshTime", p1.RefreshTimer:GetEndTime())
	end
	p1._initialStocked = true
	if p1.SeededOnServer then
		p1.EncodedItemsInShop = HttpService:JSONEncode(select(1, p1:_generateItems()))
	end
	if p1.RefreshTimer then
		p1.ShopFolder:SetAttribute("RefreshSeed", p1.RefreshTimer:GetSeed())
	end
	if p1.AutoReplicateToAllPlayers then
		p1.ShopFolder:SetAttribute("Items", p1.EncodedItemsInShop)
	else
		for v1, v2 in p1.ReplicatePlayers do
			p1:_replicateItemsToPlayer(v1)
		end
	end
	if p2 ~= "Refresh" then
		return
	end
	p1:_runCallbacks("OnRefreshed")
end
function t._decodeItems(p1, p2) --[[ _decodeItems | Line: 979 | Upvalues: HttpService (copy), v2 (copy) ]]
	if not p2 then
		warn("\226\154\160\239\184\143 Shop, No decoded items found for", p1.Name)
		return
	end
	if type(p2) == "string" then
		p2 = HttpService:JSONDecode(p2)
	end
	for v22, v3 in p2 do
		v3.Slot = v22
		v3.Data = v2.GetByName(v3.Name)
		v3.Modifiers = v3.Modifiers or {}
		for v5, v6 in v3.Modifiers do
			v3[v5] = v6
		end
	end
	local t = {}
	if not p1.Config.AllowDuplicates then
		for v7, v8 in p2 do
			t[v8.Name] = v8
		end
	end
	local v9, v10
	if next(t) and t then
		v9 = p2
		v10 = t
	else
		v9 = p2
		v10 = nil
	end
	return v9, v10
end
function t._updateItems(p1) --[[ _updateItems | Line: 1012 ]]
	local v1 = p1.LocalWrapper and p1.LocalWrapper:GetReplicatedData(p1.Name .. "-Items") or (p1.ShopFolder:GetAttribute("Items") or not p1.ItemsAreReplicated and p1.RegisteredItems)
	local v2, v3
	if v1 then
		local v4, v5 = p1:_decodeItems(v1)
		v2 = v4
		v3 = v5
	else
		v2 = nil
		v3 = nil
	end
	if v2 then
		p1.Items = {
			ItemsBySlot = v2,
			ItemsByName = v3
		}
	else
		p1.Items = nil
	end
	if p1._requestingItems then
		return
	end
	p1.ItemsChangedSignal:Fire()
end
function t._generateItemsForPlayer(p1, p2, p3) --[[ _generateItemsForPlayer | Line: 1036 ]]
	local v1 = p1:_generateItems(p2)
	if not v1 then
		return
	end
	if p3 then
		p1:_replicateItemsToPlayer(p2, v1)
	end
	local v2, v3 = p1:_decodeItems(v1)
	local t = {
		ItemsBySlot = v2,
		ItemsByName = v3
	}
	p1.ItemsByPlayer[p2.Player] = t
	return t, v1
end
function t.GetItemInShop(p1, p2) --[[ GetItemInShop | Line: 1059 | Upvalues: v16 (copy) ]]
	local v1 = p2.Player or p1.LocalWrapper
	if p1.SeededPerPlayer and (v16 and not v1) then
		warn("\226\154\160\239\184\143 Shop, No player wrapper provided for GetItemInShop, and shop requires different items per player", p1.Name)
		return
	end
	local v2
	if v16 then
		if not v1 then
			warn("\226\154\160\239\184\143 Shop, No player wrapper provided for GetItemInShop, and shop requires different items per player", p1.Name)
			return
		end
		v2 = p1.ItemsByPlayer[v1.Player]
		if not v2 and p1.SeededPerPlayer then
			v2 = p1:_generateItemsForPlayer(v1, true)
		end
	else
		v2 = nil
	end
	local v4 = if v2 then v2 else p1.Items
	local v5 = if v4.ItemsByName then v4.ItemsByName[type(p2.Item) == "table" and p2.Item.Name or p2.Item] else nil
	if not v5 and v4.ItemsBySlot then
		v5 = v4.ItemsBySlot[type(p2.Item) == "table" and p2.Item.Slot or p2.Item]
	end
	return v5
end
function t.GetItemPriceInShop(p1, p2, ...) --[[ GetItemPriceInShop | Line: 1105 ]]
	local v1 = p1:GetItemInShop(p2)
	if not v1 then
		return
	end
	local v3 = p1:_getValueOrFunction(p1.Config, "PriceModifier", v1, p2.Player or p1.LocalWrapper, ...)
	local v4 = if v3 then p1:_validateCurrency(v3) else v1.Price
	return if v4 then table.clone(v4) else v4
end
function t.GetItemProductId(p1, p2) --[[ GetItemProductId | Line: 1124 ]]
	if p2.Amount ~= 1 then
		warn("\226\154\160\239\184\143 Shop, GetItemProductId does not support amounts other than 1", p1.Name)
		return nil
	end
	return tonumber(p2.Item.ProductId or p1:_getValueOrFunction(p1.Config, "ProductId", p2))
end
function t.GetItemPriceWithAmount(p1, p2, ...) --[[ GetItemPriceWithAmount | Line: 1135 ]]
	local v1 = p1:GetItemPriceInShop(p2, ...)
	if not v1 then
		return
	end
	for v2, v3 in v1 do
		v1[v2] = v1[v2] * p2.Amount
	end
	return v1
end
function t._getDataFolder(p1, p2) --[[ _getDataFolder | Line: 1147 ]]
	local v1 = if p2 then p2 else p1.LocalWrapper
	local v2 = p1:_getValueOrFunction(p1.Config, "GetShopData", v1)
	if v2 then
		return v2
	end
	return v1.PlayerData.Shops:FindFirstChild(p1:_getValueOrFunction(p1.Config, "ShopDataName") or p1.Name)
end
function t.GetRestockValue(p1, p2) --[[ GetRestockValue | Line: 1161 ]]
	if not p1.Config.Restock then
		return
	end
	local v1 = p1:_getValueOrFunction(p1.Config.Restock, "GetRestockValue", p2)
	if v1 then
		return v1
	end
	local v2 = p1:_getDataFolder(p2)
	if not v2 then
		return
	end
	local Restock = v2:FindFirstChild("Restock")
	if Restock and Restock:IsA("IntValue") then
		return Restock
	end
end
function t.GetRestockProductId(p1) --[[ GetRestockProductId | Line: 1184 | Upvalues: v14 (copy) ]]
	local v1 = tonumber(p1:_getValueOrFunction(p1.Config, "Restock"))
	if not v1 then
		local v2 = p1:_getValueOrFunction(p1.Config.Restock, "ProductId")
		v1 = if v2 and type(v2) == "string" then v14.GetProductIdFromName(v2) else v2
	end
	if not v1 then
		local v4 = p1:_getValueOrFunction(p1.Config.Restock, "ProductName")
		if v4 then
			v1 = v14.GetProductIdFromName(v4)
		end
	end
	if not v1 and p1:_getValueOrFunction(p1.Config, "Restock") == true then
		v1 = v14.GetProductIdFromName("RestockShop")
	end
	return tonumber(v1)
end
function t.GetReshuffleValue(p1, p2) --[[ GetReshuffleValue | Line: 1210 ]]
	if not p1.Config.Reshuffle then
		return
	end
	local v1 = p1:_getValueOrFunction(p1.Config.Reshuffle, "GetReshuffleValue", p2)
	if v1 then
		return v1
	end
	local v2 = p1:_getDataFolder(p2)
	if v2 then
		return v2:FindFirstChild("Reshuffle")
	end
end
function t.GetReshuffleProductId(p1) --[[ GetReshuffleProductId | Line: 1230 | Upvalues: v14 (copy) ]]
	local v1 = tonumber(p1:_getValueOrFunction(p1.Config, "Reshuffle"))
	if not v1 then
		local v2 = p1:_getValueOrFunction(p1.Config.Reshuffle, "ProductId")
		v1 = if v2 and type(v2) == "string" then v14.GetProductIdFromName(v2) else v2
	end
	if not v1 then
		local v4 = p1:_getValueOrFunction(p1.Config.Reshuffle, "ProductName")
		if v4 then
			v1 = v14.GetProductIdFromName(v4)
		end
	end
	if not v1 and p1:_getValueOrFunction(p1.Config, "Reshuffle") == true then
		v1 = v14.GetProductIdFromName("ReshuffleShop")
	end
	return tonumber(v1)
end
function t.GetStockPurchasedValue(p1, p2, p3) --[[ GetStockPurchasedValue | Line: 1256 ]]
	local v1 = p1:_getValueOrFunction(p1.Config.Stock, "GetStockPurchasedValue", p2, p3)
	if v1 then
		return v1
	end
	local v2 = p1:_getDataFolder(p2)
	if not v2 then
		return
	end
	local Purchased = v2:FindFirstChild("Purchased")
	if not Purchased then
		return
	end
	local v3 = Purchased:FindFirstChild(p3.Slot)
	if v3 then
		return v3
	end
end
function t.GetStockChangedSignal(p1, p2, p3) --[[ GetStockChangedSignal | Line: 1281 | Upvalues: v8 (copy) ]]
	local v1 = p1:_getValueOrFunction(p1.Config.Stock, "GetStockChangedSignal", p2, p3)
	if not v1 then
		v1 = v8.new()
		if p3.Slot then
			local v2 = p1:_getDataFolder(p2)
			if v2 then
				local Purchased = v2:FindFirstChild("Purchased")
				if Purchased then
					local function getOrRemovePurchasedValue(p1) --[[ getOrRemovePurchasedValue | Line: 1297 | Upvalues: p3 (copy), v1 (ref) ]]
						if tonumber(p1.Name) ~= p3.Slot then
							return
						end
						v1.Maid.PurchaseChanged = nil
						if p1.Parent then
							v1.Maid.PurchaseChanged = p1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1304 | Upvalues: v1 (ref), p1 (copy) ]]
								v1:Fire(p1.Value)
							end)
						end
						local v2 = v1
						v2:Fire(if p1.Parent then p1.Value or 0 else 0)
					end
					v1:GiveTask(Purchased.ChildAdded:Connect(getOrRemovePurchasedValue))
					v1:GiveTask(Purchased.ChildRemoved:Connect(getOrRemovePurchasedValue))
					for v3, v4 in Purchased:GetChildren() do
						getOrRemovePurchasedValue(v4)
					end
				end
			end
		end
	end
	local v5 = p1:GetRestockChangedSignal(p2)
	if v5 then
		v1:GiveTask(v5)
		v1:GiveTask(v5:Connect(function() --[[ Line: 1327 | Upvalues: v1 (ref) ]]
			v1:Fire()
		end))
	end
	return v1
end
function t.GetRestockChangedSignal(p1, p2) --[[ GetRestockChangedSignal | Line: 1335 | Upvalues: v8 (copy) ]]
	local v1 = p1:_getValueOrFunction(p1.Config.Restock, "GetRestockChangedSignal", p2)
	if v1 then
		return v1
	end
	local v2 = v8.new()
	local v3 = p1:GetRestockValue(p2)
	if v3 then
		v2:GiveTask(v3:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1343 | Upvalues: v2 (ref), v3 (copy) ]]
			v2:Fire(v3.Value)
		end))
	end
	return v2
end
function t.GetGlobalStockRemaining(p1, p2) --[[ GetGlobalStockRemaining | Line: 1352 ]]
	local v1 = if p2 then p2 else p1.LocalWrapper
	local v2 = p1:_getValueOrFunction(p1.Config, "GlobalStock", v1)
	if not v2 then
		return nil
	end
	local v3 = p1:_getDataFolder(v1)
	local v4 = if v3 then v3:FindFirstChild("TotalPurchases") else v3
	if v4 then
		return v2 - v4.Value
	else
		return nil
	end
end
function t.GetGlobalStockChangedSignal(p1, p2) --[[ GetGlobalStockChangedSignal | Line: 1368 | Upvalues: v8 (copy) ]]
	local v1 = p2 or p1.LocalWrapper
	local v2 = v8.new()
	local v3 = p1:_getValueOrFunction(p1.Config, "GetGlobalStockChangedSignal", v1)
	if v3 then
		v2:GiveTask(v3:Connect(function() --[[ Line: 1375 | Upvalues: v2 (copy) ]]
			v2:Fire()
		end))
	end
	local v4 = p1:_getDataFolder(v1)
	local v5 = if v4 then v4:FindFirstChild("TotalPurchases") else v4
	if v5 then
		v2:GiveTask(v5.Changed:Connect(function() --[[ Line: 1383 | Upvalues: v2 (copy) ]]
			v2:Fire()
		end))
	end
	return v2
end
function t.GetStockRemaining(p1, p2, p3) --[[ GetStockRemaining | Line: 1391 ]]
	if not p3.Stock then
		return
	end
	local Stock = p3.Stock
	local v1 = p1:GetStockPurchasedValue(p2, p3)
	local v2 = p1:GetRestockValue(p2)
	if v2 then
		Stock = Stock + Stock * v2.Value
	end
	return math.max(0, Stock - (v1 and v1.Value or 0))
end
function t.GetItemsUpdatedSignal(p1, p2) --[[ GetItemsUpdatedSignal | Line: 1411 | Upvalues: v8 (copy), v10 (copy) ]]
	local v1 = v8.new()
	if p1.Config.ItemsChanged then
		for v2, v3 in v10.getConnectionEvents(p1.Config.ItemsChanged, p1, p2) do
			v1:GiveTask(v3:Connect(function() --[[ Line: 1417 | Upvalues: v1 (copy) ]]
				v1:Fire()
			end))
		end
	end
	return v1
end
function t.IncrementStockOnPurchase(p1, p2, p3) --[[ IncrementStockOnPurchase | Line: 1426 ]]
	local v1 = p1:_getDataFolder(p2)
	local v2 = if v1 then v1:FindFirstChild("TotalPurchases") else v1
	if v2 then
		v2.Value = v2.Value + p3.Amount
	end
	local v3 = p1:_getValueOrFunction(p1.Config.Stock, "IncrementStockPurchased", p2, p3)
	if v3 == true then
		return v3
	end
	if not p1.Config.Stock then
		return v2 and true
	end
	local v4 = p1:GetStockPurchasedValue(p2, p3.Item)
	if not v4 and v1 then
		local Purchased = v1:FindFirstChild("Purchased")
		if Purchased then
			local v5 = Instance.new("IntValue")
			v5.Name = p3.Slot
			v5.Value = 0
			v5.Parent = Purchased
			v4 = v5
		end
	end
	if v4 then
		v4.Value = v4.Value + p3.Amount
		return true
	else
		return false
	end
end
function t.CanPurchaseItem(p1, p2, p3) --[[ CanPurchaseItem | Line: 1467 | Upvalues: v9 (copy) ]]
	if p1.Type ~= "Buy" then
		return "ShopTypeNotBuy"
	end
	local v1 = p1:GetItemInShop({
		Player = p2,
		Item = p3.Item
	})
	if not v1 then
		return "ItemNotFound"
	end
	local t = {
		Item = v1,
		Slot = v1.Slot,
		Amount = v9.SanitiseInput(p3.Amount) or 1,
		Shop = p1
	}
	t.Robux = p3.Robux or (if v1.ProductId == nil then false elseif v1.Price == nil then true else false)
	local v3
	if t.Robux and p1.Config.RobuxPurchasesIgnoreStock then
		v3 = t
	else
		local v4 = p1:GetStockRemaining(p2, v1)
		if v4 then
			t.Amount = math.min(t.Amount, v4)
		end
		v3 = t
		local v5 = p1:GetGlobalStockRemaining(p2)
		if v5 then
			t.Amount = math.min(t.Amount, v5)
		end
	end
	if v3.Amount <= 0 then
		return "OutOfStock"
	end
	local v6, v7 = p2:CanGiveItem(v1.Data.Name, v3.Amount)
	if not v6 then
		return "CapacityReached" .. v7.Type
	end
	if not v3.Robux then
		v3.Price = p1:GetItemPriceWithAmount({
			Player = p2,
			Item = v1,
			Amount = v3.Amount
		})
	end
	if p1.Config.CanPurchase then
		local v8 = p1:_getValueOrFunction(p1.Config, "CanPurchase", p2, v3)
		if v8 ~= true then
			return v8
		end
	end
	if v3.Robux then
		if not p1:GetItemProductId(v3) then
			return "CannotAfford"
		end
	else
		for v92, v10 in v3.Price do
			if not p2:HasRequiredItemAmount(v92, v10) then
				return "CannotAfford"
			end
		end
	end
	return true, v3
end
function t.PurchaseItem(p1, p2, p3) --[[ PurchaseItem | Line: 1547 | Upvalues: v14 (copy) ]]
	if p3.Robux then
		local v1 = p1:GetItemProductId(p3)
		if v1 then
			return v14.PromptPurchase(p2.Player, v1, "DeveloperProduct", {
				Shop = p1.Name,
				PurchaseInfo = p3
			})
		else
			return false
		end
	else
		for v2, v3 in p3.Price do
			p2:RemoveItem({
				Name = v2,
				Amount = v3,
				AnalyticsSource = p1.Name,
				ItemPurchased = p3.Item.Name
			})
		end
		return p1:OnItemPurchased(p2, p3)
	end
end
function t.OnItemPurchased(p1, p2, p3) --[[ OnItemPurchased | Line: 1573 | Upvalues: v12 (copy) ]]
	if p1.Config.GiveItem then
		p1:_getValueOrFunction(p1.Config, "GiveItem", p2, p3)
	else
		local t = {
			Item = v12.MergeOriginal({
				Name = p3.Item.Name,
				Amount = p3.Amount
			}, p3.Item.Modifiers)
		}
		t.Actions = p1.Config.GiveItemActions or {
			Preset = "NewItem"
		}
		t.AnalyticsSource = p1.Name
		t.ItemStream = if p1.Config.ItemStream == nil then nil else p1.Config.ItemStream
		p2:GiveItem(t)
	end
	if (p1.Config.Stock or p1.Config.GlobalStock) and not (p3.Robux and p1.Config.RobuxPurchasesIgnoreStock or p1:IncrementStockOnPurchase(p2, p3)) then
		warn("\226\154\160\239\184\143 Shop, Failed to increment stock on purchase", p1.Name, p3.Item.Name)
	end
	p1:_runCallbacks("OnPurchased", p2, p3)
	return true
end
function t.AddOnPurchasedCallback(p1, p2) --[[ AddOnPurchasedCallback | Line: 1612 ]]
	table.insert(p1.OnPurchased, p2)
end
function t.CanSellItem(p1, p2, p3) --[[ CanSellItem | Line: 1616 | Upvalues: v2 (copy), v9 (copy) ]]
	if p1.Type ~= "Sell" then
		return "ShopTypeNotSell"
	end
	local v1 = p2:GetItemValue(p3.Name)
	if not v1 then
		return "ItemValueNotFound"
	end
	local v22 = v2.GetByDataValue(v1)
	if not v22 then
		return "ItemDataNotFound"
	end
	local v3 = p1:GetItemInShop({
		Player = p2,
		Item = v22.Name
	})
	if not v3 then
		return "ItemNotFound"
	end
	local t = {
		Name = p3.Name,
		Item = v3,
		Slot = v3.Slot,
		DataValue = v1,
		Amount = v9.SanitiseInput(p3.Amount) or 1,
		Shop = p1
	}
	t.Amount = p2:GetItemAmountToUse(t.Name, t.Amount)
	if t.Amount <= 0 then
		return "NotEnoughToSell"
	end
	t.Price = p1:GetItemPriceWithAmount({
		Player = p2,
		Item = v3,
		Amount = t.Amount
	}, v1)
	local v4 = t
	for v5, v6 in t.Price do
		local v7, v8 = p2:CanGiveItem(v5, v6)
		if not v7 then
			return "CapacityReached" .. v8.Type
		end
	end
	if p1.Config.CanSell then
		local v92 = p1:_getValueOrFunction(p1.Config, "CanSell", p2, v4)
		if v92 ~= true then
			return v92
		end
	end
	return true, v4
end
function t.ItemSold(p1, p2, p3) --[[ ItemSold | Line: 1682 ]]
	local t = {}
	t.Name = p3.Name or p3.Item.Name
	t.Amount = p3.Amount
	t.AnalyticsSource = p1.Name
	t.ItemPurchased = p3.Item.Name
	p2:RemoveItem(t)
	for v2, v3 in p3.Price do
		if p2:GetItemValue(v2) then
			if not p3.BulkSell then
				local t2 = {
					Item = {
						Name = v2,
						Amount = v3
					},
					AnalyticsSource = p1.Name .. "-" .. p3.Item.Name
				}
				t2.Actions = p1.Config.GiveItemActions or {
					Preset = "NewItem"
				}
				t2.ItemStream = p1.Config.ItemStream ~= nil and p1.Config.ItemStream or false
				p2:GiveItem(t2)
			end
			continue
		end
		warn("\226\154\160\239\184\143 Shop, Currency not found", v2, p1.Name)
	end
	p1:_runCallbacks("OnSold", p2, p3)
	return true, p3
end
function t.CanBulkSellItems(p1, p2, p3) --[[ CanBulkSellItems | Line: 1723 ]]
	local t = {}
	local v1 = nil
	for v2, v3 in p3.Items do
		local v4, v5 = p1:CanSellItem(p2, {
			Name = v2,
			Amount = v3
		})
		if v4 == true and v5 then
			t[v2] = v5
			continue
		end
		v1 = v4
	end
	if next(t) then
		return true, t
	else
		return v1 or "NoItemsToSell"
	end
end
function t.BulkSellItems(p1, p2, p3) --[[ BulkSellItems | Line: 1748 ]]
	local t = {}
	for v1, v2 in p3 do
		v2.BulkSell = true
		local v3, v4 = p1:ItemSold(p2, v2)
		if v3 ~= true or not v4 then
			return v3
		end
		for v5, v6 in v4.Price do
			local v7 = t[v5]
			if not v7 then
				local t2 = {
					Amount = 0,
					Name = v5
				}
				t[v5] = t2
				v7 = t2
			end
			p2:_postItemAnalytics({
				FlowType = "Source",
				Amount = v6,
				Currency = v5,
				SourceLocation = p1.Name .. "-" .. v2.Item.Name
			})
			v7.Amount = v7.Amount + v6
		end
	end
	if not next(t) then
		return true
	end
	local t2 = {
		AnalyticsSource = false,
		Items = t
	}
	t2.ItemStream = if p1.Config.ItemStream == nil then "BulkSell" else p1.Config.ItemStream
	p2:GiveItems(t2)
	p1:_runCallbacks("OnSold", p2, p3)
	return true
end
function t.CanRestock(p1, p2) --[[ CanRestock | Line: 1799 | Upvalues: v13 (copy) ]]
	if not p1.Config.Restock then
		return "NoRestock"
	end
	local v1 = p1:GetRefreshTime()
	if v1 and v1 - v13.GetTime() <= 15 then
		return "CannotRestockRightNow", v1 - v13.GetTime()
	else
		return true
	end
end
function t.RestockOrPromptPurchase(p1, p2) --[[ RestockOrPromptPurchase | Line: 1814 | Upvalues: v14 (copy) ]]
	local v1 = p1:CanRestock(p2)
	if v1 ~= true then
		return v1
	end
	local v2 = p1:GetRestockProductId()
	if v2 then
		return v14.PromptPurchase(p2.Player, v2, "DeveloperProduct", {
			Shop = p1.Name
		})
	else
		return p1:Restock(p2)
	end
end
function t.Restock(p1, p2) --[[ Restock | Line: 1830 ]]
	local v1 = p1:_getValueOrFunction(p1.Config.Restock, "IncrementRestock", p2)
	if v1 == true then
		return v1
	end
	local v2 = p1:GetRestockValue(p2)
	if v2 then
		v2.Value = v2.Value + 1
		return v2.Value
	else
		return nil
	end
end
function t.CanReshuffle(p1, p2) --[[ CanReshuffle | Line: 1849 ]]
	if p1.Config.Reshuffle then
		return true
	else
		return "NoReshuffle"
	end
end
function t.ReshuffleOrPromptPurchase(p1, p2) --[[ ReshuffleOrPromptPurchase | Line: 1857 | Upvalues: v14 (copy) ]]
	local v1 = p1:CanReshuffle(p2)
	if v1 ~= true then
		return v1
	end
	local v2 = p1:GetReshuffleProductId()
	if v2 then
		return v14.PromptPurchase(p2.Player, v2, "DeveloperProduct", {
			Shop = p1.Name
		})
	else
		return p1:Reshuffle(p2)
	end
end
function t.Reshuffle(p1, p2) --[[ Reshuffle | Line: 1873 ]]
	local v1 = p1:GetReshuffleValue(p2)
	if v1 then
		v1.Value = v1.Value + 1
		p1.ItemsByPlayer[p2.Player] = nil
		p1:_generateItemsForPlayer(p2, true)
		return true
	else
		return false
	end
end
function t.RequestItems(p1) --[[ RequestItems | Line: 1890 | Upvalues: v16 (copy) ]]
	if v16 then
		return
	end
	if p1.Items then
		return p1.Items
	end
	p1._requestingItems = true
	warn("Requesting items from server", p1.Name)
	p1.RequestItemsRemote:InvokeServer()
	while not p1.Items do
		task.wait()
	end
	p1._requestingItems = false
	return p1.Items
end
function t.AddOnSoldCallback(p1, p2) --[[ AddOnSoldCallback | Line: 1914 ]]
	table.insert(p1.OnSold, p2)
end
function t.GetItems(p1, p2) --[[ GetItems | Line: 1918 | Upvalues: v16 (copy) ]]
	local v1 = if p2 then p2 else p1.LocalWrapper
	local v2 = if v16 and v1 then p1.ItemsByPlayer[v1.Player] else nil
	if not v2 then
		v2 = p1:RequestItems()
	end
	return v2.ItemsBySlot
end
function t.GetItemsChangedSignal(p1) --[[ GetItemsChangedSignal | Line: 1937 ]]
	return p1.ItemsChangedSignal
end
function t.GetRefreshTimeChangedSignal(p1) --[[ GetRefreshTimeChangedSignal | Line: 1941 ]]
	if p1.RefreshTimer then
		return p1.RefreshTimer.SeedChanged
	else
		return p1.ShopFolder:GetAttributeChangedSignal("RefreshTime")
	end
end
function t.GetRefreshTime(p1) --[[ GetRefreshTime | Line: 1948 ]]
	if p1.RefreshTimer then
		return p1.RefreshTimer:GetEndTime()
	else
		return p1.ShopFolder:GetAttribute("RefreshTime")
	end
end
function t.IsRotateShop(p1) --[[ IsRotateShop | Line: 1955 ]]
	return p1:GetRefreshTime() ~= nil
end
function t.GetReplicatePlayers(p1) --[[ GetReplicatePlayers | Line: 1959 ]]
	return p1.ReplicatePlayers
end
function t.AddReplicatePlayer(p1, p2) --[[ AddReplicatePlayer | Line: 1963 ]]
	if p1.AutoReplicateToAllPlayers then
		warn("\226\154\160\239\184\143 Shop, AutoReplicateToAllPlayers is true, you can\'t set specific players to replicate to", p1.Name)
		return
	end
	if not p1.ItemsAreReplicated then
		warn("\226\154\160\239\184\143 Shop, ItemsAreReplicated is false, you can\'t replicate items to players", p1.Name)
		return
	end
	if type(p2) == "table" then
		if p2.Player then
			p2 = p2.Player
		else
			for v1, v2 in p2 do
				p1:AddReplicatePlayer(v2)
			end
			return
		end
	end
	p1.ReplicatePlayers[p2] = true
	p1:_replicateItemsToPlayer(p2)
end
function t.UpdateItems(p1) --[[ UpdateItems | Line: 1992 ]]
	p1:_serverGenerateItems()
end
function t.RequestToPurchaseItem(p1, ...) --[[ RequestToPurchaseItem | Line: 1996 | Upvalues: v15 (copy) ]]
	return v15.RequestToPurchaseItem(...)
end
function t.ResetPlayerData(p1, p2) --[[ ResetPlayerData | Line: 2000 | Upvalues: v7 (copy) ]]
	local v1 = v7.getWrapperFromPlayer(p2)
	if not v1 then
		return
	end
	p1:_clearItemsForPlayer(v1)
	local v2 = p1:_getDataFolder(v1)
	if not v2 then
		return
	end
	if v2:FindFirstChild("Purchased") then
		v2.Purchased:ClearAllChildren()
	end
	if v2:FindFirstChild("TotalPurchases") then
		v2.TotalPurchases.Value = 0
	end
	local v3 = p1:GetRestockValue(v1)
	if not v3 then
		return
	end
	if v3:IsA("IntValue") then
		v3.Value = 0
	end
	v3:ClearAllChildren()
end
return t