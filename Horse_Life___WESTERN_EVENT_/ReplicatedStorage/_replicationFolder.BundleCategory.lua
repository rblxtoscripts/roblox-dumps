-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("WeightedProbability")
local v2 = Sonar("TimeSeed")
Sonar("ItemDataService")
local t = {}
t.__index = t
function t.new(p1, p2) --[[ new | Line: 14 | Upvalues: t (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.CategoryName = p1
	v22.CategoryData = p2
	v22.Bundles = {}
	v22.TimeSeed = p2.TimeSeed and v2.new(p2.TimeSeed)
	return v22
end
function t._addBundle(p1, p2, p3) --[[ _addBundle | Line: 30 ]]
	p1.Bundles[p2] = p3
end
function t.GetAllBundles(p1) --[[ GetAllBundles | Line: 35 ]]
	return p1.Bundles
end
function t.GetCurrentBundles(p1) --[[ GetCurrentBundles | Line: 40 | Upvalues: v1 (copy) ]]
	if not p1.CategoryData.BundlesToShow then
		return p1:GetAllBundles()
	end
	local v12 = p1:GetSeed()
	if p1._currentBundles and p1._seed == v12 then
		return p1._currentBundles
	end
	local v2 = Random.new(v12)
	local v3 = table.clone(p1.Bundles)
	local t = {}
	for i = 1, p1.CategoryData.BundlesToShow do
		if not next(v3) then
			break
		end
		local v4 = v1.getRandomWeightedItem(v3, v2)
		t[v4] = p1.Bundles[v4]
		v3[v4] = nil
	end
	p1._currentBundles = t
	p1._seed = v12
	return t
end
function t.GetBundlesInOrder(p1, ...) --[[ GetBundlesInOrder | Line: 71 ]]
	local t = {}
	local t2 = { ... }
	for v1, v2 in p1:GetCurrentBundles() do
		table.insert(t, v2)
	end
	table.sort(t, function(p1, p2) --[[ Line: 80 | Upvalues: t2 (copy) ]]
		return p1:GetDisplayOrder(unpack(t2)) < p2:GetDisplayOrder(unpack(t2))
	end)
	return t
end
function t.GetProductIdsByRarity(p1) --[[ GetProductIdsByRarity | Line: 87 ]]
	return p1.CategoryData.ProductIdsByRarity
end
function t.GetProductIdFromItemRarity(p1, p2) --[[ GetProductIdFromItemRarity | Line: 91 ]]
	local v1 = p1:GetProductIdsByRarity()
	if not (p2 and v1) then
		return nil
	end
	return v1[p2] or v1.Default
end
function t.GetProductId(p1, p2) --[[ GetProductId | Line: 101 ]]
	local v1 = p1:GetProductIdFromItemRarity(p2)
	if v1 then
		return v1
	else
		return p1.CategoryData.ProductId
	end
end
function t.GetGiftProductId(p1, p2) --[[ GetGiftProductId | Line: 111 ]]
	return p1.CategoryData.Giftable and p1:GetProductId(p2) or p1.CategoryData.GiftProductId
end
function t.GetPrice(p1, ...) --[[ GetPrice | Line: 117 ]]
	return p1:_getConfigValue(p1.CategoryData.Price, { ... })
end
function t.GetSeedChangedSignal(p1) --[[ GetSeedChangedSignal | Line: 122 ]]
	return p1.TimeSeed and p1.TimeSeed.SeedChanged
end
function t.GetSeed(p1) --[[ GetSeed | Line: 127 ]]
	return p1.TimeSeed and p1.TimeSeed:GetSeed()
end
function t.GetRefreshTime(p1) --[[ GetRefreshTime | Line: 132 ]]
	return p1.TimeSeed and p1.TimeSeed:GetEndTime()
end
function t._getConfigValue(p1, p2, p3) --[[ _getConfigValue | Line: 139 ]]
	if typeof(p2) ~= "function" then
		return p2
	end
	return p2(p1, unpack(if p3 then p3 else {}))
end
return t