-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("StorageUtils")
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("ItemDataService")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("MutationUtils")
local v7 = Sonar("SizeUtils")
local v8 = Sonar(v1.Get("NewlyAdded"))
local t2 = {}
function t.GetNewlyAddedItems() --[[ GetNewlyAddedItems | Line: 19 | Upvalues: v8 (copy) ]]
	return v8
end
function t.GetAllCategories() --[[ GetAllCategories | Line: 23 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetCategoryByName(p1) --[[ GetCategoryByName | Line: 27 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.CanAddItem(p1, p2) --[[ CanAddItem | Line: 31 ]]
	if p1 == "Nothing" then
		return
	end
	if p1 == "LEGOWings" then
		return
	end
	if p1 == "LEGOWingAttachment" then
		return
	end
	if p2.NotReleasedYet then
	else
		return true
	end
end
function t.CheckNewlyAddedItemExists(p1) --[[ CheckNewlyAddedItemExists | Line: 39 | Upvalues: v3 (copy), v2 (copy) ]]
	if v3.CheckItemExists(p1) or v2.GetTrait(p1) then
		return true
	end
end
function t.AddCategory(p1, p2, p3) --[[ AddCategory | Line: 45 | Upvalues: t2 (copy), t (copy) ]]
	local v1 = p3 or p1
	local v2 = t2[v1] or {}
	t2[v1] = v2
	if p3 then
		v2.SubCategories = true
		local v3 = v2[p1] or {}
		v2[p1] = v3
		for k, v in pairs(p2) do
			if t.CanAddItem(k, v) then
				v3[k] = true
			end
		end
	else
		for k, v in pairs(p2) do
			if t.CanAddItem(k, v) then
				v2[k] = true
			end
		end
	end
end
function t.IsItemNew(p1, p2) --[[ IsItemNew | Line: 70 | Upvalues: v8 (copy) ]]
	return v8[p2]
end
function t.IsItemNewAndNotViewed(p1, p2, p3) --[[ IsItemNewAndNotViewed | Line: 74 | Upvalues: t (copy) ]]
	if not t:IsItemNew(p3) then
		return
	end
	if p2:HasViewedDiscovery(p3) or p2:IsNewlyDiscovered(p3) then
	else
		return true
	end
end
function t.GetTotalDiscovered(p1, p2, p3) --[[ GetTotalDiscovered | Line: 86 ]]
	local count = 0
	local v1 = p2:GetDiscoveryCategory(p3)
	if v1 then
		for v2, v3 in v1.Discovered do
			if p2:IsDiscovered(v2) then
				count = count + 1
			end
		end
	end
	return count
end
function t.GetTotalNewlyDiscovered(p1, p2, p3) --[[ GetTotalNewlyDiscovered | Line: 99 ]]
	local count = 0
	local v1 = p2:GetDiscoveryCategory(p3)
	if v1 then
		for v2, v3 in v1.Discovered do
			if p2:HasNotViewedDiscovery(v2) then
				count = count + 1
			end
		end
	end
	return count
end
function t.GetTotalToDiscover(p1, p2, p3) --[[ GetTotalToDiscover | Line: 112 ]]
	local v1 = p2:GetDiscoveryCategory(p3)
	if v1 then
		return v1.TotalObjectsToDiscover
	else
		return 0
	end
end
function t.Init(p1) --[[ Init | Line: 120 | Upvalues: t (copy), v3 (copy), v6 (copy), v7 (copy), Sonar (copy), v8 (copy), v4 (copy), v5 (copy) ]]
	t.AddCategory("Species", v3.GetType("Animals"))
	for v1, v2 in v3.GetType("Animals") do
		if t.CanAddItem(v1, v2) then
			for v32, v42 in v2.Traits do
				if v32 ~= "Materials" then
					t.AddCategory(v32, v42, v1)
				end
			end
		end
	end
	t.AddCategory("Mutations", v6.GetAllMutations())
	t.AddCategory("Sizes", v7.Sizes)
	t.AddCategory("Eyes", Sonar("Constants").Eyes)
	for v52, v62 in v8 do
		if not t.CheckNewlyAddedItemExists(v52) then
			v8[v52] = nil
			warn("Newly Added item data cannot be found for", v52)
		end
	end
	if not game:GetService("RunService"):IsServer() then
		return
	end
	v4.GetRemoteEvent("ViewedDiscoveryItemsRemote").OnServerEvent:Connect(function(p1, p2) --[[ Line: 147 | Upvalues: v5 (ref) ]]
		local v1 = v5.getWrapperFromPlayer(p1)
		if v1 then
			v1:UpdatedViewedDiscovery({
				Viewed = true,
				Objects = p2
			})
		end
	end)
end
t:Init()
return t