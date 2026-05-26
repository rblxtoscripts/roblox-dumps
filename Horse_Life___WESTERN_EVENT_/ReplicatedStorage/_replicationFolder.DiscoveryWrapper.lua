-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("DiscoveryService")
local v2 = Sonar("DiscoveryEntry")
local v3 = Sonar("Signal")
local v4 = Sonar("Maid")
local v5 = game:GetService("RunService"):IsServer()
local STATE_ENUMS = v1.STATE_ENUMS
local function _decodeJSON(p1) --[[ _decodeJSON | Line: 143 | Upvalues: HttpService (copy) ]]
	if not p1 or p1 == "" then
		return {}
	end
	local v1, v2 = pcall(HttpService.JSONDecode, HttpService, p1)
	return if v1 and v2 then v2 else {}
end
local function _encodeJSON(p1) --[[ _encodeJSON | Line: 151 | Upvalues: HttpService (copy) ]]
	local v1, v2 = pcall(HttpService.JSONEncode, HttpService, p1)
	return if v1 and v2 then v2 else "{}"
end
function t.new(p1) --[[ new | Line: 156 | Upvalues: t (copy), v3 (copy), v1 (copy), _decodeJSON (copy) ]]
	local v2 = setmetatable({}, t)
	if not p1:IsLocalOrServer() then
		return v2
	end
	v2.Maid = p1.Maid
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	v2.PlayerData = v2.PlayerWrapper.PlayerData
	v2.DiscoveryData = v2.PlayerData.Discovery
	v2.DiscoveryIncrementedSignal = v3.new()
	v2.Maid:GiveTask(v2.DiscoveryIncrementedSignal)
	v2.DiscoveryProgressIncrementedSignal = v2.Maid:GiveTask(v3.new())
	v2._discoveryEntries = {}
	v2._viewedStatesCache = {}
	v2._claimedStatesCache = {}
	v2._viewedStatesSignals = {}
	v2._claimedStatesSignals = {}
	local v32 = v1.GetCategories()
	if v32 then
		for v4 in v32 do
			local v5 = v2:GetDiscoveryCategoryFolder(v4)
			if v5 then
				if v1.ShouldTrackViewedStates(v4) and v5:IsA("StringValue") then
					v2._viewedStatesCache[v4] = _decodeJSON(v5.Value)
					local v6 = v3.new()
					v2._viewedStatesSignals[v4] = v6
					v2.Maid:GiveTask(v6)
					v2.Maid["_viewedStates_" .. v4] = v5:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 195 | Upvalues: v2 (copy), v4 (copy), _decodeJSON (ref), v5 (copy), v6 (copy) ]]
						v2._viewedStatesCache[v4] = _decodeJSON(v5.Value)
						v6:Fire()
					end)
				end
				if v1.HasRewards(v4) then
					local ClaimedStates = v5:FindFirstChild("ClaimedStates")
					if ClaimedStates then
						v2._claimedStatesCache[v4] = _decodeJSON(ClaimedStates.Value)
						local v7 = v3.new()
						v2._claimedStatesSignals[v4] = v7
						v2.Maid:GiveTask(v7)
						v2.Maid["_claimedStates_" .. v4] = ClaimedStates:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 210 | Upvalues: v2 (copy), v4 (copy), _decodeJSON (ref), ClaimedStates (copy), v7 (copy) ]]
							v2._claimedStatesCache[v4] = _decodeJSON(ClaimedStates.Value)
							v7:Fire()
						end)
					end
				end
				v2:_bindProgressListeners(v4, v5)
			end
		end
	end
	return v2
end
function t._fireProgressIncremented(p1, p2, p3) --[[ _fireProgressIncremented | Line: 224 ]]
	local v1 = p1:GetDiscoveryEntry({
		Name = p2,
		Category = p3
	})
	if not v1 then
		return
	end
	p1.DiscoveryProgressIncrementedSignal:Fire(v1)
end
function t._bindProgressListeners(p1, p2, p3) --[[ _bindProgressListeners | Line: 231 ]]
	local v1 = p1:GetDiscoveryCategoryData(p2)
	if not v1 then
		return
	end
	if v1.Type == "Index" then
		p1:_bindIndexProgressListeners(p2)
	else
		p1:_bindPercentageProgressListeners(p2, p3)
	end
end
function t._bindPercentageProgressListeners(p1, p2, p3) --[[ _bindPercentageProgressListeners | Line: 244 ]]
	local function bindEntryValue(p12) --[[ bindEntryValue | Line: 245 | Upvalues: p1 (copy), p2 (copy) ]]
		if p12.Name == "ClaimedStates" then
			return
		end
		local v1 = p12.Value
		if v1 > 0 then
			p1:_fireProgressIncremented(p12.Name, p2)
		end
		p1.Maid:GiveTask(p12:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 255 | Upvalues: p12 (copy), v1 (ref), p1 (ref), p2 (ref) ]]
			local v12 = p12.Value
			if v1 < v12 then
				v1 = v12
				p1:_fireProgressIncremented(p12.Name, p2)
			else
				v1 = v12
			end
		end))
	end
	p1.Maid:GiveTask(p3.ChildAdded:Connect(bindEntryValue))
	for v1, v2 in p3:GetChildren() do
		bindEntryValue(v2)
	end
end
function t._bindIndexProgressListeners(p1, p2) --[[ _bindIndexProgressListeners | Line: 272 | Upvalues: STATE_ENUMS (copy) ]]
	local v1 = p1._viewedStatesSignals[p2]
	if not v1 then
		return
	end
	local t = {}
	for v3, v4 in p1._viewedStatesCache[p2] or {} do
		t[v3] = v4
	end
	p1.Maid:GiveTask(v1:Connect(function() --[[ Line: 283 | Upvalues: p1 (copy), p2 (copy), t (copy), STATE_ENUMS (ref) ]]
		for v2, v3 in p1._viewedStatesCache[p2] or {} do
			if (t[v2] or STATE_ENUMS.NotSetState) < STATE_ENUMS.NewlyDiscovered and STATE_ENUMS.NewlyDiscovered <= v3 then
				p1:_fireProgressIncremented(v2, p2)
			end
			t[v2] = v3
		end
	end))
end
function t.GetDiscoveryCategoryData(p1, p2) --[[ GetDiscoveryCategoryData | Line: 295 | Upvalues: v1 (copy) ]]
	return v1.GetCategoryData(p2)
end
function t.GetDiscoveryCategoryFolder(p1, p2) --[[ GetDiscoveryCategoryFolder | Line: 299 ]]
	if p1.DiscoveryData then
		return p1.DiscoveryData:FindFirstChild(p2)
	else
		return nil
	end
end
function t.GetDiscoveryViewedStatesValue(p1, p2) --[[ GetDiscoveryViewedStatesValue | Line: 306 ]]
	local v1 = p1:GetDiscoveryCategoryFolder(p2)
	if v1 and v1:IsA("StringValue") then
		return v1
	else
		return nil
	end
end
function t.GetDiscoveryClaimedStatesValue(p1, p2) --[[ GetDiscoveryClaimedStatesValue | Line: 314 ]]
	local v1 = p1:GetDiscoveryCategoryFolder(p2)
	if v1 then
		return v1:FindFirstChild("ClaimedStates")
	else
		return nil
	end
end
function t._canIncludeCategory(p1, p2, p3) --[[ _canIncludeCategory | Line: 322 ]]
	return (not p3.IncludeCategory or table.find(p3.IncludeCategory, p2)) and true or false
end
function t._isRegisteredEntry(p1, p2, p3) --[[ _isRegisteredEntry | Line: 331 ]]
	return if p2 then p2.Entries and p2.Entries[p3] ~= nil else p2
end
function t._resolveCategoryForEntry(p1, p2) --[[ _resolveCategoryForEntry | Line: 335 | Upvalues: v1 (copy) ]]
	local v12 = v1.GetCategories()
	if not v12 then
		return nil
	end
	for v2, v3 in v12 do
		if v3.Entries and v3.Entries[p2] then
			return v2
		end
	end
	return nil
end
function t.GetViewedState(p1, p2) --[[ GetViewedState | Line: 351 | Upvalues: STATE_ENUMS (copy) ]]
	local v1 = p2.Name
	local v2 = p2.Category or p1:_resolveCategoryForEntry(v1)
	if not v2 then
		return STATE_ENUMS.NotSetState
	end
	local v3 = p1._viewedStatesCache[v2]
	if not v3 then
		return STATE_ENUMS.NotSetState
	end
	local v4 = v3[v1]
	if v4 == nil then
		return STATE_ENUMS.NotSetState
	else
		return v4
	end
end
function t.IsViewed(p1, p2) --[[ IsViewed | Line: 370 | Upvalues: STATE_ENUMS (copy) ]]
	local v1 = p1:GetViewedState(p2)
	return if v1 == STATE_ENUMS.ViewedAndDiscovered then true else v1 == STATE_ENUMS.ViewedAndNewlyAdded
end
function t.HasNotViewedDiscovery(p1, p2) --[[ HasNotViewedDiscovery | Line: 375 | Upvalues: STATE_ENUMS (copy) ]]
	local v1 = p1:GetViewedState(p2)
	return if v1 == STATE_ENUMS.NewlyDiscovered then true else v1 == STATE_ENUMS.NotViewedButDiscovered
end
function t.IsNewlyDiscovered(p1, p2) --[[ IsNewlyDiscovered | Line: 380 | Upvalues: STATE_ENUMS (copy) ]]
	local isNewlyDiscovered = p1:GetViewedState(p2) == STATE_ENUMS.NewlyDiscovered
	return isNewlyDiscovered
end
function t.MarkDiscoveryEntry(p1, p2) --[[ MarkDiscoveryEntry | Line: 384 | Upvalues: STATE_ENUMS (copy), v1 (copy), v5 (copy) ]]
	local v12 = p2.Name
	local v2 = p2.Category or p1:_resolveCategoryForEntry(v12)
	local v3 = p2.State or STATE_ENUMS.ViewedAndDiscovered
	if not v2 then
		return
	end
	if not v1.ShouldTrackViewedStates(v2) then
		return
	end
	if v5 then
		v1.SetViewedState(p1.Player, v12, v2, v3)
	else
		v1.RequestToMarkDiscoveryEntry({
			{ v12, v2, v3 }
		})
	end
end
function t.RequestToMarkAsDiscovered(p1, p2) --[[ RequestToMarkAsDiscovered | Line: 404 | Upvalues: STATE_ENUMS (copy) ]]
	p2.State = STATE_ENUMS.NotViewedButDiscovered
	p1:MarkDiscoveryEntry(p2)
end
function t.RequestToMarkAllUnviewedDiscoveries(p1, p2) --[[ RequestToMarkAllUnviewedDiscoveries | Line: 409 | Upvalues: v5 (copy), v1 (copy), STATE_ENUMS (copy) ]]
	if v5 then
		return 0
	end
	local v12 = if p2 then p2 else {}
	local v2 = v1.GetCategories()
	if not v2 then
		return 0
	end
	local v3 = v12.State or STATE_ENUMS.ViewedAndDiscovered
	local v4, v52 = v12, {}
	for v6 in v2 do
		if p1:_canIncludeCategory(v6, v4) and v1.ShouldTrackViewedStates(v6) then
			local v7 = v1.GetCategoryEntries(v6)
			if v7 then
				for v8 in v7 do
					if p1:HasNotViewedDiscovery({
						Name = v8,
						Category = v6
					}) then
						v52[#v52 + 1] = { v8, v6, v3 }
					end
				end
			end
		end
	end
	if #v52 == 0 then
		return 0
	else
		v1.RequestToMarkDiscoveryEntry(v52)
		return #v52
	end
end
function t._setViewedStateLocal(p1, p2, p3, p4) --[[ _setViewedStateLocal | Line: 451 | Upvalues: _decodeJSON (copy), HttpService (copy) ]]
	if not p1._viewedStatesCache[p3] then
		return
	end
	local v1 = p1:GetDiscoveryViewedStatesValue(p3)
	if not v1 then
		return
	end
	local v2 = _decodeJSON(v1.Value)
	v2[p2] = p4
	local v3, v4 = pcall(HttpService.JSONEncode, HttpService, v2)
	v1.Value = if v3 and v4 then v4 else "{}"
end
function t.GetViewedStatesChangedSignal(p1, p2) --[[ GetViewedStatesChangedSignal | Line: 466 ]]
	return p1._viewedStatesSignals[p2]
end
function t.GetClaimedStatesChangedSignal(p1, p2) --[[ GetClaimedStatesChangedSignal | Line: 470 ]]
	return p1._claimedStatesSignals[p2]
end
function t.GetUnviewedDiscoveryCount(p1, p2) --[[ GetUnviewedDiscoveryCount | Line: 474 | Upvalues: v1 (copy) ]]
	local count = 0
	local v2 = v1.GetCategories()
	if not v2 then
		return 0
	end
	local v3 = if p2 then p2 else {}
	for v4 in v2 do
		if p1:_canIncludeCategory(v4, v3) and v1.ShouldTrackViewedStates(v4) then
			local v5 = v1.GetCategoryEntries(v4)
			if v5 then
				for v6 in v5 do
					if p1:HasNotViewedDiscovery({
						Name = v6,
						Category = v4
					}) then
						count = count + 1
					end
				end
			end
		end
	end
	return count
end
function t.GetNewlyAddedCount(p1, p2) --[[ GetNewlyAddedCount | Line: 506 | Upvalues: v1 (copy), STATE_ENUMS (copy) ]]
	local count = 0
	local v2 = v1.GetCategories()
	if not v2 then
		return 0
	end
	local v3 = if p2 then p2 else {}
	for v4 in v2 do
		if p1:_canIncludeCategory(v4, v3) then
			local v5 = v1.GetCategoryEntries(v4)
			if v5 then
				for v6 in v5 do
					if v1.IsNewlyAdded(v6, v4) and p1:GetViewedState({
						Name = v6,
						Category = v4
					}) == STATE_ENUMS.NotSetState then
						count = count + 1
					end
				end
			end
		end
	end
	return count
end
function t.IsRewardClaimed(p1, p2) --[[ IsRewardClaimed | Line: 539 ]]
	local v1 = p2.Name
	local v2 = p2.Category or p1:_resolveCategoryForEntry(v1)
	if not v2 then
		return false
	end
	local v3 = p1._claimedStatesCache[v2]
	if not v3 then
		return false
	end
	return v3[v1] == true
end
function t.GetDiscoveryDataValue(p1, p2, p3) --[[ GetDiscoveryDataValue | Line: 556 ]]
	if p3 then
		local v1 = p1:GetDiscoveryCategoryData(p3)
		if v1 and v1.Type == "Index" then
			return nil
		end
		local v2 = p1:GetDiscoveryCategoryFolder(p3)
		if v2 then
			return v2:FindFirstChild(p2)
		else
			return nil
		end
	else
		if not p1.DiscoveryData then
			return nil, nil
		end
		for v3, v4 in p1.DiscoveryData:GetChildren() do
			local v5 = v4:FindFirstChild(p2)
			if v5 and (v5:IsA("ValueBase") and v5.Name ~= "ClaimedStates") then
				return v5, v4.Name
			end
		end
		return nil, nil
	end
end
function t.GetDiscoveryValue(p1, p2) --[[ GetDiscoveryValue | Line: 583 | Upvalues: STATE_ENUMS (copy) ]]
	local v1 = p2.Name
	local v2 = p2.Category or p1:_resolveCategoryForEntry(v1)
	if not v2 then
		return nil, nil
	end
	local v3 = p1:GetDiscoveryCategoryData(v2)
	if not v3 then
		return nil, nil
	end
	if v3.Type == "Index" then
		return p1:GetViewedState({
			Name = v1,
			Category = v2
		}) >= STATE_ENUMS.NewlyDiscovered, v2
	else
		local v5 = p1:GetDiscoveryDataValue(v1, v2)
		if v5 then
			return v5.Value, v2
		else
			return 0, v2
		end
	end
end
function t.GetDiscoveryChangedSignal(p1, p2) --[[ GetDiscoveryChangedSignal | Line: 608 ]]
	local v1 = p2.Name
	local v2 = p2.Category or p1:_resolveCategoryForEntry(v1)
	if not v2 then
		return nil, nil
	end
	local v3 = p1:GetDiscoveryEntry({
		Name = v1,
		Category = v2
	})
	if v3 then
		return v3:GetChangedSignal(), v2
	else
		return nil, v2
	end
end
function t.GetDiscoveryValueChangedSignal(p1, p2) --[[ GetDiscoveryValueChangedSignal | Line: 623 ]]
	local v1 = p2.Name
	local v2 = p2.Category or p1:_resolveCategoryForEntry(v1)
	if not v2 then
		return nil, nil
	end
	local v3 = p1:GetDiscoveryEntry({
		Name = v1,
		Category = v2
	})
	if v3 then
		return v3:GetValueChangedSignal(), v2
	else
		return nil, v2
	end
end
function t.GetDiscoveryProgressIncrementedSignal(p1) --[[ GetDiscoveryProgressIncrementedSignal | Line: 638 ]]
	return p1.DiscoveryProgressIncrementedSignal
end
function t._getOrCreateValue(p1, p2, p3) --[[ _getOrCreateValue | Line: 642 ]]
	local v1 = p1:GetDiscoveryCategoryData(p3)
	if not v1 then
		return nil
	end
	if v1.Type == "Index" then
		return nil
	end
	local v2 = p1:GetDiscoveryCategoryFolder(p3)
	if not v2 then
		return nil
	end
	local v3 = v2:FindFirstChild(p2)
	if v3 then
		return v3
	else
		local v4 = Instance.new("IntValue")
		v4.Name = p2
		v4.Parent = v2
		return v4
	end
end
function t.SetDiscovery(p1, p2) --[[ SetDiscovery | Line: 668 | Upvalues: v1 (copy), STATE_ENUMS (copy) ]]
	local v12 = p2.Name
	local Category = p2.Category
	local v2 = p2.Value
	local v3 = p1:GetDiscoveryCategoryData(Category)
	if not v3 then
		return
	end
	if not p1:_isRegisteredEntry(v3, v12) then
		return
	end
	if v3.Type == "Index" then
		if not (v2 and v1.ShouldTrackViewedStates(Category)) then
			return
		end
		local v4 = p1:GetViewedState({
			Name = v12,
			Category = Category
		})
		if v4 ~= STATE_ENUMS.NotSetState and v4 ~= STATE_ENUMS.ViewedAndNewlyAdded then
			return
		end
		p1:_setViewedStateLocal(v12, Category, STATE_ENUMS.NewlyDiscovered)
	else
		local v5 = p1:_getOrCreateValue(v12, Category)
		if not v5 then
			return
		end
		if v3.Type ~= "Percentage" then
			return
		end
		v5.Value = math.clamp(v2, 0, 100)
	end
end
function t.IncrementDiscovery(p1, p2) --[[ IncrementDiscovery | Line: 702 | Upvalues: STATE_ENUMS (copy), v1 (copy) ]]
	local v12 = p2.Name
	local v2 = p2.Category or p1:_resolveCategoryForEntry(v12)
	if not v2 then
		return
	end
	local v3 = p1:GetDiscoveryCategoryData(v2)
	if not v3 then
		return
	end
	if not p1:_isRegisteredEntry(v3, v12) then
		return
	end
	local t = {
		Name = v12,
		Category = v2
	}
	local State = p2.State
	if type(State) == "string" then
		State = STATE_ENUMS[State]
	end
	if State == nil then
		State = STATE_ENUMS.NewlyDiscovered
	end
	if v3.Type == "Index" then
		local v4 = p1:GetViewedState(t)
		if v4 == STATE_ENUMS.NotSetState or v4 == STATE_ENUMS.ViewedAndNewlyAdded then
			p1:_setViewedStateLocal(v12, v2, State)
		end
	else
		local v5 = p1:GetDiscoveryValue(t)
		if (if v5 == 0 then true else false) and v1.ShouldTrackViewedStates(v2) then
			local v7 = p1:GetViewedState(t)
			if v7 == STATE_ENUMS.NotSetState or v7 == STATE_ENUMS.ViewedAndNewlyAdded then
				p1:_setViewedStateLocal(v12, v2, State)
			end
		end
		p1:SetDiscovery({
			Name = v12,
			Category = v2,
			Value = v5 + (p2.Amount or 1)
		})
	end
	p1.DiscoveryIncrementedSignal:Fire(v2, v12, (p1:GetDiscoveryValue(t)))
end
function t.GetDiscoveryStatus(p1, p2) --[[ GetDiscoveryStatus | Line: 755 | Upvalues: STATE_ENUMS (copy) ]]
	local v1 = p2.Name
	local v2 = p2.Category or p1:_resolveCategoryForEntry(v1)
	if not v2 then
		return "Undiscovered"
	end
	local t = {
		Name = v1,
		Category = v2
	}
	if p1:IsRewardClaimed(t) then
		return "Claimed"
	end
	local v3 = p1:GetDiscoveryCategoryData(v2)
	if not v3 then
		return "Undiscovered"
	end
	if v3.Type == "Index" then
		if p1:GetViewedState(t) >= STATE_ENUMS.NewlyDiscovered then
			return "Completed"
		else
			return "Undiscovered"
		end
	else
		local v4 = p1:GetDiscoveryValue(t)
		if v4 == nil then
			return "Undiscovered"
		end
		if v4 >= 100 then
			return "Completed"
		end
		if v4 > 0 then
			return "InProgress"
		else
			return "Undiscovered"
		end
	end
end
function t.IsDiscoveryCompleted(p1, p2) --[[ IsDiscoveryCompleted | Line: 791 ]]
	local v1 = p1:GetDiscoveryStatus(p2)
	return if v1 == "Completed" then true else v1 == "Claimed"
end
function t.HasStartedDiscovery(p1, p2) --[[ HasStartedDiscovery | Line: 796 ]]
	local v1 = p1:GetDiscoveryStatus(p2)
	return if v1 == "InProgress" or v1 == "Completed" then true else v1 == "Claimed"
end
function t.GetDiscoveryCategoryEntries(p1, p2) --[[ GetDiscoveryCategoryEntries | Line: 801 | Upvalues: STATE_ENUMS (copy) ]]
	local v1 = p1:GetDiscoveryCategoryData(p2)
	if not v1 then
		return {}
	end
	if v1.Type == "Index" then
		local t = {}
		local v2 = p1._viewedStatesCache[p2]
		if v2 then
			for v3, v4 in v2 do
				if STATE_ENUMS.NewlyDiscovered <= v4 then
					t[v3] = true
				end
			end
		end
		return t
	else
		local v5 = p1:GetDiscoveryCategoryFolder(p2)
		if not v5 then
			return {}
		end
		local t = {}
		for v6, v7 in v5:GetChildren() do
			if v7.Name ~= "ClaimedStates" then
				t[v7.Name] = v7.Value
			end
		end
		return t
	end
end
function t.GetDiscoveryProgress(p1, p2) --[[ GetDiscoveryProgress | Line: 835 | Upvalues: v1 (copy), STATE_ENUMS (copy) ]]
	local v2 = v1.GetCategories()
	if not v2 then
		return 0, 0, 0
	end
	local v3, sum, count = if p2 then p2 else {}, 0, 0
	for v4, v5 in v2 do
		if p1:_canIncludeCategory(v4, v3) then
			local v6 = v1.GetCategoryEntries(v4)
			if v6 then
				local count_2 = 0
				for v7 in v6 do
					count_2 = count_2 + 1
				end
				sum = sum + count_2
				if v5.Type == "Index" then
					local v8 = p1._viewedStatesCache[v4]
					if v8 then
						for v9 in v6 do
							local v10 = v8[v9]
							if v10 ~= nil and STATE_ENUMS.NewlyDiscovered <= v10 then
								count = count + 1
							end
						end
					end
					continue
				end
				local v11 = p1:GetDiscoveryCategoryFolder(v4)
				if v11 then
					for v122, v13 in v11:GetChildren() do
						if v13.Name ~= "ClaimedStates" and v13.Value >= 100 then
							count = count + 1
						end
					end
				end
			end
		end
	end
	if sum == 0 then
		return 0, 0, 0
	else
		return count, sum, count / sum
	end
end
function t.GetTotalDiscoveryEntries(p1, p2) --[[ GetTotalDiscoveryEntries | Line: 895 ]]
	local _, v1 = p1:GetDiscoveryProgress(p2)
	return v1
end
function t.GetTotalCompleted(p1, p2) --[[ GetTotalCompleted | Line: 900 ]]
	return p1:GetDiscoveryProgress(p2)
end
function t.GetDiscoveryProgressChangedSignal(p1, p2) --[[ GetDiscoveryProgressChangedSignal | Line: 905 | Upvalues: v3 (copy), v4 (copy), v1 (copy) ]]
	local v2 = v3.new()
	local v32 = v4.new()
	v2:GiveTask(v32)
	local v42 = v1.GetCategories()
	if not v42 then
		return v2
	end
	local function connectChild(p1) --[[ connectChild | Line: 917 | Upvalues: v32 (copy), v2 (copy) ]]
		if p1.Name ~= "ClaimedStates" then
			v32[p1] = p1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 921 | Upvalues: v2 (ref) ]]
				v2:Fire()
			end)
		end
	end
	local v5 = p2 or {}
	for v6, v7 in v42 do
		if p1:_canIncludeCategory(v6, v5) then
			local v8
			if v7.Type == "Index" then
				local v9 = p1._viewedStatesSignals[v6]
				if v9 then
					v32["_index_" .. v6] = v9:Connect(function() --[[ Line: 934 | Upvalues: v2 (copy) ]]
						v2:Fire()
					end)
				end
				v8 = p1._claimedStatesSignals[v6]
				if v8 then
					v32["_claimed_" .. v6] = v8:Connect(function() --[[ Line: 956 | Upvalues: v2 (copy) ]]
						v2:Fire()
					end)
				end
			else
				local v10 = p1:GetDiscoveryCategoryFolder(v6)
				if v10 then
					for v11, v122 in v10:GetChildren() do
						if v122.Name ~= "ClaimedStates" then
							v32[v122] = v122:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 921 | Upvalues: v2 (copy) ]]
								v2:Fire()
							end)
						end
					end
					v32[v6] = v10.ChildAdded:Connect(function(p1) --[[ Line: 948 | Upvalues: v32 (copy), v2 (copy) ]]
						if p1.Name ~= "ClaimedStates" then
							v32[p1] = p1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 921 | Upvalues: v2 (ref) ]]
								v2:Fire()
							end)
						end
						v2:Fire()
					end)
					v8 = p1._claimedStatesSignals[v6]
					if v8 then
						v32["_claimed_" .. v6] = v8:Connect(function() --[[ Line: 956 | Upvalues: v2 (copy) ]]
							v2:Fire()
						end)
					end
				end
			end
		end
	end
	return v2
end
function t.GetClaimableDiscoveryChangedSignal(p1, p2) --[[ GetClaimableDiscoveryChangedSignal | Line: 965 | Upvalues: v3 (copy), v4 (copy), v1 (copy) ]]
	local v2 = v3.new()
	local v32 = v4.new()
	v2:GiveTask(v32)
	local v42 = v1.GetCategories()
	if not v42 then
		return v2
	end
	local v5 = p2 or {}
	for v6 in v42 do
		if p1:_canIncludeCategory(v6, v5) then
			local v7 = p1._claimedStatesSignals[v6]
			if v7 then
				v32["_claimed_" .. v6] = v7:Connect(function() --[[ Line: 984 | Upvalues: v2 (copy) ]]
					v2:Fire()
				end)
			end
			local v8 = p1:GetDiscoveryCategoryFolder(v6)
			if v8 then
				for v9, v10 in v8:GetChildren() do
					if v10.Name ~= "ClaimedStates" then
						v32[v10] = v10:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 995 | Upvalues: v2 (copy) ]]
							v2:Fire()
						end)
					end
				end
			end
		end
	end
	return v2
end
function t.GetUnviewedDiscoveryChangedSignal(p1, p2) --[[ GetUnviewedDiscoveryChangedSignal | Line: 1005 | Upvalues: v3 (copy), v4 (copy), v1 (copy) ]]
	local v2 = v3.new()
	local v32 = v4.new()
	v2:GiveTask(v32)
	local v42 = v1.GetCategories()
	if not v42 then
		return v2
	end
	local v5 = p2 or {}
	for v6 in v42 do
		if p1:_canIncludeCategory(v6, v5) and v1.ShouldTrackViewedStates(v6) then
			local v7 = p1._viewedStatesSignals[v6]
			if v7 then
				v32[v6] = v7:Connect(function() --[[ Line: 1026 | Upvalues: v2 (copy) ]]
					v2:Fire()
				end)
			end
		end
	end
	return v2
end
function t.GetDiscoveryEntry(p1, p2) --[[ GetDiscoveryEntry | Line: 1037 | Upvalues: v2 (copy) ]]
	local v1 = p2.Name
	local v22 = p2.Category or p1:_resolveCategoryForEntry(v1)
	if not v22 then
		return nil
	end
	local v3 = v22 .. ":" .. v1
	if p1._discoveryEntries[v3] then
		return p1._discoveryEntries[v3]
	else
		local v4 = v2.new(p1, v1, v22)
		p1._discoveryEntries[v3] = v4
		return v4
	end
end
function t.GetDiscoveryEntries(p1, p2) --[[ GetDiscoveryEntries | Line: 1054 | Upvalues: v1 (copy) ]]
	local v2 = v1.GetCategories()
	if not v2 then
		return {}
	end
	local v3, v4 = if p2 then p2 else {}, {}
	for v5 in v2 do
		if p1:_canIncludeCategory(v5, v3) then
			local v6 = v1.GetCategoryEntries(v5)
			if v6 then
				for v7 in v6 do
					v4[#v4 + 1] = p1:GetDiscoveryEntry({
						Name = v7,
						Category = v5
					})
				end
			end
		end
	end
	return v4
end
function t.GetTotalDiscoveryClaimed(p1, p2) --[[ GetTotalDiscoveryClaimed | Line: 1081 ]]
	local count = 0
	for v1, v2 in p1:GetDiscoveryEntries(p2) do
		if v2:IsRewardClaimed() then
			count = count + 1
		end
	end
	return count
end
function t.GetTotalDiscoveryClaimable(p1, p2) --[[ GetTotalDiscoveryClaimable | Line: 1091 ]]
	local count = 0
	for v1, v2 in p1:GetDiscoveryEntries(p2) do
		if v2:IsRewardClaimable() then
			count = count + 1
		end
	end
	return count
end
function t.Init(p1) --[[ Init | Line: 1101 ]] end
return t