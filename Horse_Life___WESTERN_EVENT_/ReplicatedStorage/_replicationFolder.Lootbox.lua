-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("WeightedProbability")
local v2 = Sonar("ItemDataService")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("TableUtils")
local v5 = v3.GetConfig("Lootbox")()
local t = {
	ClassName = "Lootbox"
}
t.__index = t
function t.new(p1) --[[ new | Line: 19 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Config = p1
	v2.LootboxName = v2.Config.Name
	v2:_generateItemPools()
	return v2
end
function t.GetPrice(p1, p2) --[[ GetPrice | Line: 32 ]]
	return p1:_getConfigValue(p1.Config.Price, { p2 })
end
function t.CanPurchase(p1, p2) --[[ CanPurchase | Line: 37 ]]
	local v1 = p1:GetPrice(p2)
	if not v1 then
		return true
	end
	for v2, v3 in v1 do
		if not p2:HasRequiredItemAmount(v2, v3) then
			return false
		end
	end
	return true
end
function t.Purchase(p1, p2) --[[ Purchase | Line: 53 ]]
	if p1:CanPurchase(p2) then
		return p1:Open(p2)
	else
		return nil
	end
end
function t.Open(p1, p2) --[[ Open | Line: 64 ]]
	local v1 = p1:Roll()
	return p2:GiveItems({
		Items = v1,
		AnalyticsSource = p1.LootboxName,
		Actions = {
			Preset = "NewItem"
		}
	}), v1
end
function t.Roll(p1, p2) --[[ Roll | Line: 83 | Upvalues: v4 (copy), v1 (copy), v2 (copy), v5 (copy) ]]
	local v12 = if p2 then p2 else {}
	local v22, v3
	if typeof(v12.Seed) == "Random" then
		v22 = v12.Seed
		v3 = v12
		if not v22 then
			v22 = Random.new(v12.Seed)
		end
	else
		v3 = v12
		v22 = Random.new(v12.Seed)
	end
	local t = {}
	local v42 = p1.ItemPools or p1:_generateItemPools()
	local v52 = v3.GiveAllItems or p1.Config.GiveAllItems
	local v6 = p1.Config.UniqueRolls or v52
	local v7 = p1:_getNumber(v3.Amount, 1, v22)
	local v8 = if v52 then v4.Count(v42) else p1:_getNumber(p1.Config.RollAmount, 1, v22)
	local v9 = nil
	for i = 1, v7 do
		if not v9 or v6 and not next(v9) then
			v9 = table.clone(v42)
		end
		for j = 1, v8 do
			if not next(v9) then
				break
			end
			local v11 = v1.getRandomWeightedItem(v9, v22)
			local v122 = v9[v11]
			local ItemsInPool = v122.ItemsInPool
			if v6 then
				v9[v11] = nil
			end
			local sum = p1:_getNumber(v122.Amount, 1, v22)
			while sum > 0 do
				local v13 = ItemsInPool[v22:NextInteger(1, #ItemsInPool)]
				local v14 = v2.GetByName(v13)
				local v15 = math.min(sum, p1:_getNumber(v122.ChunkSize, sum, v22))
				sum = sum - v15
				local t2 = {
					Name = v13,
					Amount = v15
				}
				local v16 = p1:_getConfigValue(v122.ItemData, { v14, v22 })
				if v16 then
					v4.MergeOriginal(t2, v16, true)
				end
				local v17 = p1:_getConfigValue(v5.ItemDataPresets[v14.ItemType.Name], {
					v14,
					v22,
					v3.Player,
					v3.ItemData
				})
				if v17 then
					v4.MergeOriginal(t2, v17, true)
				end
				table.insert(t, t2)
			end
		end
	end
	if v3.MergeDuplicateItems ~= false then
		p1:_mergeDuplicateItems(t)
	end
	return t
end
function t._mergeDuplicateItems(p1, p2) --[[ _mergeDuplicateItems | Line: 159 ]]
	local v1 = false
	for i = #p2, 1, -1 do
		local v2 = p2[i]
		for j = i - 1, 1, -1 do
			local v3 = p2[j]
			if p1:_shouldItemsBeMerged(v2, v3) then
				v3.Amount = v3.Amount + v2.Amount
				table.remove(p2, i)
				v1 = true
				break
			end
		end
	end
	if not v1 then
		return
	end
	p1:_mergeDuplicateItems(p2)
end
function t._shouldItemsBeMerged(p1, p2, p3) --[[ _shouldItemsBeMerged | Line: 182 ]]
	if p2.Name ~= p3.Name then
		return false
	end
	for v1, v2 in p2 do
		if v1 ~= "Amount" and v2 ~= p3[v1] then
			return false
		end
	end
	for v3, v4 in p3 do
		if v3 ~= "Amount" and v4 ~= p2[v3] then
			return false
		end
	end
	return true
end
function t.GetItemPool(p1) --[[ GetItemPool | Line: 203 ]]
	if p1._itemPool then
		return p1._itemPool
	end
	local t = {}
	for v1, v2 in p1:_getItemPools() do
		for v3, v4 in v2.ItemsInPool do
			if not table.find(t, v4) then
				table.insert(t, v4)
			end
		end
	end
	p1._itemPool = t
	return p1._itemPool
end
function t.GetWeightedItemPool(p1, p2) --[[ GetWeightedItemPool | Line: 230 | Upvalues: v2 (copy), v4 (copy), v5 (copy) ]]
	local v1 = if p2 then p2 else {}
	print(v1)
	local t, v22 = {}, v1
	for v3, v42 in p1:_getItemPools() do
		local v52 = tonumber(v42.Amount) or 1
		local v6 = v42.Probability * (1 / #v42.ItemsInPool)
		local v7 = if v42.ItemName then "ItemName" elseif v42.ItemType then "ItemType" else "ItemName"
		for v8, v9 in v42.ItemsInPool do
			local v10 = v7 == "ItemType" and v2.GetItemType(v9).Name or v9
			local v11 = v10 .. tostring(v52)
			if not t[v11] then
				t[v11] = {
					Probability = 0,
					ItemKey = v10,
					KeyType = v7,
					Amount = v52,
					ItemData = {}
				}
				local v12 = v2.GetByName(v10) or v2.GetItemType(v10)
				local v13 = p1:_getConfigValue(v42.ItemData, { v12 })
				if v13 then
					v4.MergeOriginal(t[v11].ItemData, v13, true)
				end
				local t2 = {}
				t2[1] = v12
				t2[2] = nil
				t2[3] = v22.Player
				t2[4] = v22.ItemData or {}
				local v17 = p1:_getConfigValue(v5.ItemDataPresets[v12.ItemType.Name], t2)
				if v17 then
					v4.MergeOriginal(t[v11].ItemData, v17, true)
				end
			end
			local v18 = t[v11]
			v18.Probability = v18.Probability + v6
		end
	end
	return t
end
function t._getItemPools(p1) --[[ _getItemPools | Line: 281 ]]
	return p1.ItemPools or p1:_generateItemPools()
end
function t._generateItemPools(p1) --[[ _generateItemPools | Line: 286 | Upvalues: v2 (copy) ]]
	p1.ItemPools = {}
	local sum = 0
	for v1, v22 in p1.Config.ItemPool do
		local v3 = p1:_getItemsInPool(v22)
		if #v3 == 0 then
			warn((("\226\154\160\239\184\143 Lootbox \'%*\' generates empty item pool for item pool %*"):format(p1.LootboxName, v1)))
			continue
		end
		if v22.P then
			v22.ItemsInPool = v3
			p1.ItemPools[v1] = v22
			sum = sum + v22.P
			continue
		end
		if p1.Config.ItemProbability then
			local t = {}
			for v4, v5 in v3 do
				local v6 = v2.GetByName(v5)
				if v6 then
					local v7 = p1:_getConfigValue(p1.Config.ItemProbability, { v6 })
					if not t[v7] then
						t[v7] = {}
					end
					table.insert(t[v7], v5)
				end
			end
			for v9, v10 in t do
				local v11 = ("%*_prob_%*"):format(v1, v9)
				local v12 = table.clone(v22)
				v12.P = v9
				v12.ItemsInPool = v10
				p1.ItemPools[v11] = v12
				sum = sum + v9
			end
			continue
		end
		v22.P = 1
		v22.ItemsInPool = v3
		p1.ItemPools[v1] = v22
		sum = sum + v22.P
	end
	if not next(p1.ItemPools) then
		warn((("\226\154\160\239\184\143 Lootbox \'%*\' generates no item pools"):format(p1.LootboxName)))
	end
	for v13, v14 in p1.ItemPools do
		v14.Probability = v14.P / sum
	end
	return p1.ItemPools
end
function t._getItemsInPool(p1, p2) --[[ _getItemsInPool | Line: 346 | Upvalues: v2 (copy), v4 (copy) ]]
	local t = {}
	local v1 = typeof(p2.ItemType) == "table" and p2.ItemType or { p2.ItemType }
	local v22 = typeof(p2.ItemName) == "table" and p2.ItemName or { p2.ItemName }
	local v3 = typeof(p2.Rarity) == "table" and p2.Rarity or { p2.Rarity }
	for v42, v5 in v2.GetAll() do
		local v6 = v4.Find(v1, function(p1, p2) --[[ Line: 354 | Upvalues: v2 (ref), v42 (copy) ]]
			return v2.IsItemOfTypeOrCategory(v42, p2)
		end)
		if (not next(v1) or v6 ~= nil) and (not next(v22) or table.find(v22, v5.Name)) and ((not next(v3) or table.find(v3, v5.Rarity.Name)) and p1:_validateItem(v42, v5)) then
			table.insert(t, v42)
		end
	end
	table.sort(t, function(p1, p2) --[[ Line: 376 ]]
		return p1 < p2
	end)
	return t
end
function t._validateItem(p1, p2, p3) --[[ _validateItem | Line: 386 ]]
	return not p3.Disabled.Lootboxes
end
function t._getNumber(p1, p2, p3, p4) --[[ _getNumber | Line: 398 ]]
	if typeof(p2) == "number" then
		return p2
	end
	if typeof(p2) == "NumberRange" then
		return p4:NextInteger(p2.Min, p2.Max)
	else
		return p3
	end
end
function t._getConfigValue(p1, p2, p3) --[[ _getConfigValue | Line: 411 ]]
	if typeof(p2) ~= "function" then
		return p2
	end
	return p2(p1, unpack(if p3 then p3 else {}))
end
function t.IsA(p1, p2) --[[ IsA | Line: 419 ]]
	return p2 == p1.ClassName
end
function t.Destroy(p1) --[[ Destroy | Line: 423 ]]
	table.clear(p1)
	setmetatable(p1, nil)
end
return t