-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("DiscoveryService")
local v2 = Sonar("Signal")
local v3 = Sonar("Maid")
local v4 = game:GetService("RunService"):IsServer()
local STATE_ENUMS = v1.STATE_ENUMS
function t.new(p1, p2, p3) --[[ new | Line: 15 | Upvalues: t (copy), v1 (copy), v3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.EntryName = p2
	v2.CategoryName = p3
	v2.DiscoveryWrapper = p1
	v2.PlayerWrapper = p1.PlayerWrapper
	v2.Player = p1.Player
	v2.CategoryData = v1.GetCategoryData(p3)
	local v32 = v1.GetCategoryEntries(p3)
	v2.EntryData = v32 and v32[p2] or {}
	if type(v2.EntryData) ~= "table" then
		v2.EntryData = {}
	end
	v2.IsIndexType = v2.CategoryData and (if v2.CategoryData.Type == "Index" then true else false)
	v2.Maid = v3.new()
	p1.Maid:GiveTask(v2.Maid)
	if not v2.IsIndexType then
		v2.ValueInstance = p1:GetDiscoveryDataValue(p2, p3)
		local v6 = p1:GetDiscoveryCategoryFolder(p3)
		if v6 then
			v2.Maid._childAdded = v6.ChildAdded:Connect(function(p1) --[[ Line: 41 | Upvalues: p2 (copy), v2 (copy) ]]
				if p1.Name ~= p2 or (p1.Name == "ClaimedStates" or v2.ValueInstance) then
					return
				end
				v2.ValueInstance = p1
				v2:_onValueInstanceChanged()
			end)
			v2.Maid._childRemoved = v6.ChildRemoved:Connect(function(p1) --[[ Line: 48 | Upvalues: v2 (copy) ]]
				if p1 ~= v2.ValueInstance then
					return
				end
				v2.ValueInstance = nil
				v2:_onValueInstanceChanged()
			end)
		end
	end
	return v2
end
function t._onValueInstanceChanged(p1) --[[ _onValueInstanceChanged | Line: 60 ]]
	if p1._changedSignal then
		p1:_connectChangedSignal()
	end
	if not p1._valueChangedSignal then
		return
	end
	p1:_connectValueChangedSignal()
	p1._valueChangedSignal:Fire()
end
function t.GetValue(p1) --[[ GetValue | Line: 70 | Upvalues: STATE_ENUMS (copy) ]]
	if p1.IsIndexType then
		return p1.DiscoveryWrapper:GetViewedState({
			Name = p1.EntryName,
			Category = p1.CategoryName
		}) >= STATE_ENUMS.NewlyDiscovered
	elseif p1.ValueInstance then
		return p1.ValueInstance.Value
	else
		return 0
	end
end
function t.GetStatus(p1) --[[ GetStatus | Line: 82 | Upvalues: STATE_ENUMS (copy) ]]
	if p1:IsRewardClaimed() then
		return "Claimed"
	end
	if not p1.CategoryData then
		return "Undiscovered"
	end
	if p1.IsIndexType then
		if p1.DiscoveryWrapper:GetViewedState({
			Name = p1.EntryName,
			Category = p1.CategoryName
		}) >= STATE_ENUMS.NewlyDiscovered then
			return "Completed"
		else
			return "Undiscovered"
		end
	else
		local v1 = p1:GetValue()
		if v1 >= 100 then
			return "Completed"
		end
		if v1 > 0 then
			return "InProgress"
		else
			return "Undiscovered"
		end
	end
end
function t.IsCompleted(p1) --[[ IsCompleted | Line: 106 ]]
	local v1 = p1:GetStatus()
	return if v1 == "Completed" then true else v1 == "Claimed"
end
function t.HasStartedDiscovery(p1) --[[ HasStartedDiscovery | Line: 111 ]]
	local v1 = p1:GetStatus()
	return if v1 == "InProgress" or v1 == "Completed" then true else v1 == "Claimed"
end
function t.GetGoalProgress(p1) --[[ GetGoalProgress | Line: 116 ]]
	if not p1.CategoryData then
		return 0
	end
	if not p1.IsIndexType then
		return math.clamp(p1:GetValue() / 100, 0, 1)
	end
	if p1:GetValue() then
		return 1
	else
		return 0
	end
end
function t.GetRevealedProperties(p1) --[[ GetRevealedProperties | Line: 128 | Upvalues: v1 (copy) ]]
	local t = {}
	if not p1.CategoryData then
		return t
	end
	if p1.IsIndexType then
		local v12 = p1:IsCompleted()
		local v2 = v1.GetCategoryTiers(p1.CategoryName)
		if v2 then
			for v3, v4 in v2 do
				for v5, v6 in v4.Reveals do
					t[v6] = v12
				end
			end
		end
	else
		local v7 = p1:GetValue()
		local v8 = v1.GetCategoryTiers(p1.CategoryName)
		if not v8 then
			return t
		end
		for v9, v10 in v8 do
			local v11 = if v10.Threshold <= v7 then true else false
			for v12, v13 in v10.Reveals do
				t[v13] = v11
			end
		end
	end
	return t
end
function t.IsRevealed(p1, p2) --[[ IsRevealed | Line: 165 ]]
	return p1:GetRevealedProperties()[p2] == true
end
function t.GetReward(p1) --[[ GetReward | Line: 169 | Upvalues: v1 (copy) ]]
	return v1.GetEntryReward(p1.CategoryName, p1.EntryName)
end
function t.GetViewedState(p1) --[[ GetViewedState | Line: 175 ]]
	return p1.DiscoveryWrapper:GetViewedState({
		Name = p1.EntryName,
		Category = p1.CategoryName
	})
end
function t.IsViewed(p1) --[[ IsViewed | Line: 179 ]]
	return p1.DiscoveryWrapper:IsViewed({
		Name = p1.EntryName,
		Category = p1.CategoryName
	})
end
function t.HasNotViewedDiscovery(p1) --[[ HasNotViewedDiscovery | Line: 183 ]]
	return p1.DiscoveryWrapper:HasNotViewedDiscovery({
		Name = p1.EntryName,
		Category = p1.CategoryName
	})
end
function t.IsNewlyDiscovered(p1) --[[ IsNewlyDiscovered | Line: 187 ]]
	return p1.DiscoveryWrapper:IsNewlyDiscovered({
		Name = p1.EntryName,
		Category = p1.CategoryName
	})
end
function t.IsNewlyAdded(p1) --[[ IsNewlyAdded | Line: 191 | Upvalues: v1 (copy) ]]
	return v1.IsNewlyAdded(p1.EntryName, p1.CategoryName)
end
function t.RequestToMarkAsViewed(p1) --[[ RequestToMarkAsViewed | Line: 195 | Upvalues: STATE_ENUMS (copy) ]]
	if p1:IsViewed() then
		return
	end
	if p1:HasNotViewedDiscovery() then
		p1.DiscoveryWrapper:MarkDiscoveryEntry({
			Name = p1.EntryName,
			Category = p1.CategoryName,
			State = STATE_ENUMS.ViewedAndDiscovered
		})
		return
	end
	if not p1:IsNewlyAdded() or p1:GetViewedState() ~= STATE_ENUMS.NotSetState then
		return
	end
	p1.DiscoveryWrapper:MarkDiscoveryEntry({
		Name = p1.EntryName,
		Category = p1.CategoryName,
		State = STATE_ENUMS.ViewedAndNewlyAdded
	})
end
function t.IsRewardClaimed(p1) --[[ IsRewardClaimed | Line: 209 ]]
	return p1.DiscoveryWrapper:IsRewardClaimed({
		Name = p1.EntryName,
		Category = p1.CategoryName
	})
end
function t.IsRewardClaimable(p1) --[[ IsRewardClaimable | Line: 213 ]]
	return p1:IsCompleted() and not p1:IsRewardClaimed()
end
function t.ClaimReward(p1) --[[ ClaimReward | Line: 217 | Upvalues: v4 (copy), v1 (copy) ]]
	if v4 then
		return v1.ClaimDiscoveryReward(p1.Player, p1.EntryName, p1.CategoryName)
	else
		return v1.RequestToClaimDiscoveryReward(p1.EntryName, p1.CategoryName)
	end
end
function t._connectChangedSignal(p1) --[[ _connectChangedSignal | Line: 226 ]]
	p1.Maid._valueChanged = nil
	p1.Maid._viewedChanged = nil
	p1.Maid._claimedChanged = nil
	if not p1.IsIndexType and p1.ValueInstance then
		p1.Maid._valueChanged = p1.ValueInstance:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 232 | Upvalues: p1 (copy) ]]
			p1._changedSignal:Fire()
		end)
	end
	local v1 = p1.DiscoveryWrapper:GetViewedStatesChangedSignal(p1.CategoryName)
	if v1 then
		p1._lastViewedState = p1:GetViewedState()
		p1.Maid._viewedChanged = v1:Connect(function() --[[ Line: 240 | Upvalues: p1 (copy) ]]
			local v1 = p1:GetViewedState()
			if v1 == p1._lastViewedState then
				return
			end
			p1._lastViewedState = v1
			p1._changedSignal:Fire()
		end)
	end
	local v2 = p1.DiscoveryWrapper:GetClaimedStatesChangedSignal(p1.CategoryName)
	if not v2 then
		return
	end
	p1._lastClaimedState = p1:IsRewardClaimed()
	p1.Maid._claimedChanged = v2:Connect(function() --[[ Line: 252 | Upvalues: p1 (copy) ]]
		local v1 = p1:IsRewardClaimed()
		if v1 == p1._lastClaimedState then
			return
		end
		p1._lastClaimedState = v1
		p1._changedSignal:Fire()
	end)
end
function t.GetChangedSignal(p1) --[[ GetChangedSignal | Line: 262 | Upvalues: v2 (copy) ]]
	if not p1._changedSignal then
		p1._changedSignal = v2.new()
		p1.Maid:GiveTask(p1._changedSignal)
		p1:_connectChangedSignal()
	end
	return p1._changedSignal
end
function t._connectValueChangedSignal(p1) --[[ _connectValueChangedSignal | Line: 274 ]]
	p1.Maid._valueOnlyChanged = nil
	if p1.IsIndexType then
		local v1 = p1.DiscoveryWrapper:GetViewedStatesChangedSignal(p1.CategoryName)
		if not v1 then
			return
		end
		p1._lastValueOnly = p1:GetValue()
		p1.Maid._valueOnlyChanged = v1:Connect(function() --[[ Line: 281 | Upvalues: p1 (copy) ]]
			local v1 = p1:GetValue()
			if v1 == p1._lastValueOnly then
				return
			end
			p1._lastValueOnly = v1
			p1._valueChangedSignal:Fire()
		end)
	else
		if not p1.ValueInstance then
			return
		end
		p1.Maid._valueOnlyChanged = p1.ValueInstance:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 293 | Upvalues: p1 (copy) ]]
			p1._valueChangedSignal:Fire()
		end)
	end
end
function t.GetValueChangedSignal(p1) --[[ GetValueChangedSignal | Line: 299 | Upvalues: v2 (copy) ]]
	if not p1._valueChangedSignal then
		p1._valueChangedSignal = v2.new()
		p1.Maid:GiveTask(p1._valueChangedSignal)
		p1:_connectValueChangedSignal()
	end
	return p1._valueChangedSignal
end
function t.GetState(p1) --[[ GetState | Line: 311 ]]
	return p1:GetStatus()
end
function t.GetStateChangedSignal(p1) --[[ GetStateChangedSignal | Line: 315 | Upvalues: v2 (copy) ]]
	if not p1._stateChangedSignal then
		p1._stateChangedSignal = v2.new()
		p1.Maid:GiveTask(p1._stateChangedSignal)
		local v1 = p1:GetState()
		p1._stateChangedSignal:GiveTask(p1:GetChangedSignal():Connect(function() --[[ Line: 324 | Upvalues: p1 (copy), v1 (ref) ]]
			local v12 = p1:GetState()
			if v12 == v1 then
				return
			end
			v1 = v12
			p1._stateChangedSignal:Fire(v12)
		end))
	end
	return p1._stateChangedSignal
end
return t