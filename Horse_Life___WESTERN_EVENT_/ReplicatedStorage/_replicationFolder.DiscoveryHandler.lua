-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("DiscoveryService")
local v2 = Sonar("Signal")
local v3 = Sonar("Table")
local v4 = Sonar("MutationUtils")
local v5 = game:GetService("RunService"):IsServer()
local t2 = {
	NotSetState = -2,
	ViewedAndNewlyAdded = -1,
	NewlyDiscovered = 0,
	NotViewedButDiscovered = 1,
	ViewedAndDiscovered = 2
}
function t.new(p1) --[[ new | Line: 26 | Upvalues: t (copy), v5 (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = p1.Maid
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	v2.PlayerData = p1.PlayerData
	if p1.IsLocalPlayer or v5 then
		v2.DiscoveryData = v2.PlayerData.Discovery
		v2.DecodedDiscoveryCategories = {}
		for v3, v4 in v1.GetAllCategories() do
			if v4.SubCategories then
				for v52, v6 in v4 do
					if type(v6) == "table" then
						v2:_addCategory({
							ID = v3 .. "-" .. v52,
							AllObjects = v6,
							DataValue = v2.DiscoveryData[v3][v52]
						})
					end
				end
				continue
			end
			v2:_addCategory({
				ID = v3,
				AllObjects = v4,
				DataValue = v2.DiscoveryData[v3]
			})
		end
		if v5 then
			v2.Maid:GiveTask(p1.PlayerData.Animals.ChildAdded:Connect(function(p1) --[[ Line: 59 | Upvalues: v2 (copy) ]]
				v2:_slotAdded(p1)
			end))
		end
	end
	for k, v in pairs(t) do
		if type(v) == "function" and not p1[k] then
			p1[k] = function(p1, ...) --[[ Line: 69 | Upvalues: v (copy), v2 (copy) ]]
				return v(v2, ...)
			end
		end
	end
	return v2
end
function t._slotAdded(p1, p2, p3) --[[ _slotAdded | Line: 77 | Upvalues: v4 (copy) ]]
	if not p3 then
		task.wait()
	end
	local t = {
		[p2:WaitForChild("Species").Value] = true
	}
	for k, v in pairs({ "Cosmetics", "Patterns", "Paints" }) do
		for k2, v2 in pairs(p2:WaitForChild(v):GetChildren()) do
			if v2.Value then
				t[v2.Name] = true
			end
		end
	end
	for k, v in pairs(p2.MiscCosmetics:GetChildren()) do
		t[v.Value] = true
	end
	for v1, v2 in v4.GetAllMutationsFromSlot(p2) do
		t[v2.Name] = true
	end
	t[p2.Colors.Eye.Value] = true
	p1:UpdateDiscovery({
		Objects = t,
		Replicate = p2.Name
	})
end
function t._getDiscoveryStateForItem(p1, p2, p3) --[[ _getDiscoveryStateForItem | Line: 111 ]]
	if p3 then
		return p3.Discovered[p2], p3
	end
	for v1, v2 in p1.DecodedDiscoveryCategories do
		local v3 = v2.Discovered[p2]
		if v3 then
			return v3, v2
		end
	end
end
function t._getCategoryFromItem(p1, p2) --[[ _getCategoryFromItem | Line: 123 ]]
	for v1, v2 in p1.DecodedDiscoveryCategories do
		if v2.AllObjects[p2] then
			return v2
		end
	end
end
function t._decodeString(p1, p2) --[[ _decodeString | Line: 131 | Upvalues: HttpService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 132 | Upvalues: HttpService (ref), p2 (copy) ]]
		return HttpService:JSONDecode(p2)
	end)
	return v1 and v2
end
function t._encodeTable(p1, p2) --[[ _encodeTable | Line: 138 | Upvalues: HttpService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 139 | Upvalues: HttpService (ref), p2 (copy) ]]
		return HttpService:JSONEncode(p2)
	end)
	return v1 and v2
end
function t._addCategory(p1, p2) --[[ _addCategory | Line: 145 | Upvalues: v3 (copy), v2 (copy), t2 (copy) ]]
	p2.ChangedStateValues = {}
	p2.TotalObjectsToDiscover = v3.Count(p2.AllObjects)
	local v1 = v2.new()
	p2.Changed = v1
	p1.Maid:GiveTask(v1)
	local function decode() --[[ decode | Line: 153 | Upvalues: p2 (copy), p1 (copy), t2 (ref), v1 (copy) ]]
		p2.Discovered = p1:_decodeString(p2.DataValue.Value) or (if #p2.DataValue.Value > 0 then p2.Discovered or {} else {})
		for v3, v4 in p2.ChangedStateValues do
			v4.Value = p2.Discovered[v3] or t2.NotSetState
		end
		v1:Fire()
	end
	p1.Maid:GiveTask(p2.DataValue:GetPropertyChangedSignal("Value"):Connect(decode))
	decode()
	p1.DecodedDiscoveryCategories[p2.ID] = p2
end
function t.GetDiscoveryCategory(p1, p2) --[[ GetDiscoveryCategory | Line: 169 ]]
	return p1.DecodedDiscoveryCategories[p2]
end
function t.GetDiscoveryCategoryChangedSignal(p1, p2) --[[ GetDiscoveryCategoryChangedSignal | Line: 173 ]]
	local v1 = p1:GetDiscoveryCategory(p2)
	if v1 then
		return v1.Changed
	end
end
function t.GetDiscoveryStateChangedSignal(p1, p2) --[[ GetDiscoveryStateChangedSignal | Line: 179 | Upvalues: t2 (copy) ]]
	local v1 = p1:_getCategoryFromItem(p2)
	if not v1 then
		return
	end
	local v2 = v1.ChangedStateValues[p2]
	if v2 then
		return v2:GetPropertyChangedSignal("Value")
	end
	local v3 = Instance.new("IntValue")
	v3.Value = v1.Discovered[p2] or t2.NotSetState
	v1.ChangedStateValues[p2] = v3
	p1.Maid:GiveTask(v3)
	return v3:GetPropertyChangedSignal("Value")
end
function t.IsDiscovered(p1, p2, p3) --[[ IsDiscovered | Line: 195 | Upvalues: t2 (copy) ]]
	local v1 = p1:_getDiscoveryStateForItem(p2, p3)
	return if v1 == t2.ViewedAndDiscovered or v1 == t2.NotViewedButDiscovered then true else v1 == t2.NewlyDiscovered
end
function t.IsNewlyDiscovered(p1, p2) --[[ IsNewlyDiscovered | Line: 203 | Upvalues: t2 (copy) ]]
	local isNewlyDiscovered = p1:_getDiscoveryStateForItem(p2) == t2.NewlyDiscovered
	return isNewlyDiscovered
end
function t.HasNotViewedDiscovery(p1, p2) --[[ HasNotViewedDiscovery | Line: 208 | Upvalues: t2 (copy) ]]
	local v1 = p1:_getDiscoveryStateForItem(p2)
	return if v1 == t2.NotViewedButDiscovered then true else v1 == t2.NewlyDiscovered
end
function t.HasViewedDiscovery(p1, p2) --[[ HasViewedDiscovery | Line: 215 | Upvalues: t2 (copy) ]]
	local v1 = p1:_getDiscoveryStateForItem(p2)
	return if v1 == t2.ViewedAndNewlyAdded then true else v1 == t2.ViewedAndDiscovered
end
function t.UpdateDiscovery(p1, p2) --[[ UpdateDiscovery | Line: 222 | Upvalues: t2 (copy) ]]
	local t = {}
	for v1, v2 in p2.Objects do
		local v3 = p1:_getCategoryFromItem(v1)
		if v3 then
			local v4 = v3.Discovered[v1]
			local v5, v6
			if v4 == t2.NewlyDiscovered or v4 == t2.ViewedAndDiscovered then
				if v4 == t2.ViewedAndNewlyAdded then
					v5 = v3.Discovered
					v6 = p2.Viewed and t2.ViewedAndDiscovered or t2.NewlyDiscovered
					v5[v1] = v6
					t[v3.DataValue] = v3
				end
			else
				v5 = v3.Discovered
				v6 = p2.Viewed and t2.ViewedAndDiscovered or t2.NewlyDiscovered
				v5[v1] = v6
				t[v3.DataValue] = v3
			end
		end
	end
	for v7, v8 in t do
		v8.DataValue.Value = p1:_encodeTable(v8.Discovered) or v8.DataValue.Value
	end
end
function t.UpdatedViewedDiscovery(p1, p2) --[[ UpdatedViewedDiscovery | Line: 242 | Upvalues: t2 (copy) ]]
	local t = {}
	for v1, v2 in p2.Objects do
		local v3 = p1:_getCategoryFromItem(v2)
		if v3 then
			local v4 = v3.Discovered[v2]
			if v4 == t2.NewlyDiscovered then
				v3.Discovered[v2] = p2.Viewed and t2.ViewedAndDiscovered or t2.NotViewedButDiscovered
				t[v3.DataValue] = v3
				continue
			end
			if v4 == t2.NotViewedButDiscovered then
				v3.Discovered[v2] = t2.ViewedAndDiscovered
				t[v3.DataValue] = v3
				continue
			end
			if v4 == nil then
				v3.Discovered[v2] = t2.ViewedAndNewlyAdded
				t[v3.DataValue] = v3
			end
		end
	end
	for v6, v7 in t do
		v7.DataValue.Value = p1:_encodeTable(v7.Discovered) or v7.DataValue.Value
	end
end
return t