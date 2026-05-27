-- https://lua.expert/
local t = {}
t.__index = t
t.MilestoneState = {
	Locked = "Locked",
	Contributing = "Contributing",
	Claimable = "Claimable",
	Claimed = "Claimed",
	Missed = "Missed"
}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("CommunityGoalService", {
	Deferred = true
})
local v2 = Sonar("Signal")
local IS_SERVER = Sonar("Constants").IS_SERVER
local function _decodeJSON(p1) --[[ _decodeJSON | Line: 71 | Upvalues: HttpService (copy) ]]
	if not p1 or p1 == "" then
		return {}
	end
	local v1, v2 = pcall(HttpService.JSONDecode, HttpService, p1)
	return if v1 and v2 then v2 else {}
end
local function _encodeJSON(p1) --[[ _encodeJSON | Line: 79 | Upvalues: HttpService (copy) ]]
	local v1, v2 = pcall(HttpService.JSONEncode, HttpService, p1)
	return if v1 and v2 then v2 else "{}"
end
function t.new(p1) --[[ new | Line: 84 | Upvalues: t (copy), v2 (copy), _decodeJSON (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	if not p1:IsLocalOrServer() then
		return v22
	end
	v22.Maid = p1.Maid
	v22.Player = p1.Player
	v22.PlayerWrapper = p1
	v22.PlayerData = p1.PlayerData
	v22.CommunityGoalIncrementedSignal = v22.Maid:GiveTask(v2.new())
	v22.CommunityGoalMilestoneReachedSignal = v22.Maid:GiveTask(v2.new())
	v22.CommunityGoalMilestoneClaimedSignal = v22.Maid:GiveTask(v2.new())
	v22.CommunityGoalMilestoneStateChangedSignal = v22.Maid:GiveTask(v2.new())
	v22._contributedMilestonesCache = {}
	v22._claimedMilestonesCache = {}
	local v3 = v22.PlayerData and v22.PlayerData:FindFirstChild("CommunityGoals")
	if v3 then
		for v4, v5 in v3:GetChildren() do
			local v6 = v5.Name
			local ContributedMilestones = v5:FindFirstChild("ContributedMilestones")
			if ContributedMilestones then
				v22._contributedMilestonesCache[v6] = _decodeJSON(ContributedMilestones.Value)
				v22.Maid["_contributed_" .. v6] = ContributedMilestones:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 113 | Upvalues: v22 (copy), v6 (copy), _decodeJSON (ref), ContributedMilestones (copy) ]]
					v22._contributedMilestonesCache[v6] = _decodeJSON(ContributedMilestones.Value)
				end)
			end
			local ClaimedMilestones = v5:FindFirstChild("ClaimedMilestones")
			if ClaimedMilestones then
				v22._claimedMilestonesCache[v6] = _decodeJSON(ClaimedMilestones.Value)
				v22.Maid["_claimed_" .. v6] = ClaimedMilestones:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 122 | Upvalues: v22 (copy), v6 (copy), _decodeJSON (ref), ClaimedMilestones (copy) ]]
					v22._claimedMilestonesCache[v6] = _decodeJSON(ClaimedMilestones.Value)
				end)
			end
		end
	end
	for v7, v8 in v1.GetGoals() do
		v22.Maid["_milestoneReached_" .. v7] = v8:GetMilestoneReachedSignal():Connect(function(p1, p2) --[[ Line: 130 | Upvalues: v22 (copy), v7 (copy) ]]
			v22.CommunityGoalMilestoneReachedSignal:Fire(v7, p1, p2)
			local v1 = tostring(p1)
			if (v22._contributedMilestonesCache[v7] or {})[v1] then
				v22.CommunityGoalMilestoneStateChangedSignal:Fire(v7, p1, "Claimable")
			else
				v22.CommunityGoalMilestoneStateChangedSignal:Fire(v7, p1, "Missed")
			end
		end)
	end
	return v22
end
function t.IncrementCommunityGoal(p1, p2, p3) --[[ IncrementCommunityGoal | Line: 147 | Upvalues: IS_SERVER (copy), v1 (copy), HttpService (copy) ]]
	if not IS_SERVER then
		return false
	end
	local v2 = v1.GetGoalsByType(p2)
	if not v2 then
		return false
	end
	local v3, v4 = if p3 then p3 else {}, false
	for v5, v6 in v2 do
		if v6:CanIncrement(p1.PlayerWrapper, v3) then
			local v7 = v6:GetName()
			local v8 = v3.Amount or v6.Config.Amount or 1
			v6:IncrementProgress(v8, p1.PlayerWrapper, v3)
			local v9 = p1:_getGoalFolder(v7)
			if v9 then
				local Contribution = v9:FindFirstChild("Contribution")
				if Contribution then
					Contribution.Value = Contribution.Value + v8
				end
				local ContributedMilestones = v9:FindFirstChild("ContributedMilestones")
				if ContributedMilestones then
					local v10 = p1._contributedMilestonesCache[v7] or {}
					for v122 in v6:GetMilestones() do
						local v11
						if not v6:IsMilestoneCompleted(v122) then
							local v13 = tostring(v122)
							if not v10[v13] then
								v10[v13] = true
								p1._contributedMilestonesCache[v7] = v10
								local v14, v15 = pcall(HttpService.JSONEncode, HttpService, v10)
								v11 = if v14 and v15 then v15 else "{}"
								ContributedMilestones.Value = v11
								p1.CommunityGoalMilestoneStateChangedSignal:Fire(v7, v122, "Contributing")
							end
							break
						end
					end
				end
			end
			p1.CommunityGoalIncrementedSignal:Fire(v7, v8)
			v4 = true
		end
	end
	return v4
end
function t._getGoalFolder(p1, p2) --[[ _getGoalFolder | Line: 205 ]]
	local v1 = p1.PlayerData and p1.PlayerData:FindFirstChild("CommunityGoals")
	if v1 then
		return v1:FindFirstChild(p2)
	else
		return nil
	end
end
function t.CanClaimCommunityGoalMilestoneReward(p1, p2, p3) --[[ CanClaimCommunityGoalMilestoneReward | Line: 213 | Upvalues: v1 (copy) ]]
	return v1.CanClaimCommunityGoalMilestoneReward(p1.PlayerWrapper, p2, p3)
end
function t.ClaimCommunityGoalMilestoneReward(p1, p2, p3) --[[ ClaimCommunityGoalMilestoneReward | Line: 217 | Upvalues: v1 (copy) ]]
	return v1.ClaimCommunityGoalMilestoneReward(p1.PlayerWrapper, p2, p3)
end
function t.RequestToClaimCommunityGoalMilestoneReward(p1, p2, p3) --[[ RequestToClaimCommunityGoalMilestoneReward | Line: 221 | Upvalues: v1 (copy) ]]
	return v1.RequestToClaimCommunityGoalMilestoneReward(p2, p3)
end
function t.GetCommunityGoal(p1, p2) --[[ GetCommunityGoal | Line: 225 | Upvalues: v1 (copy) ]]
	return v1.GetGoal(p2)
end
function t.GetCommunityGoals(p1) --[[ GetCommunityGoals | Line: 229 | Upvalues: v1 (copy) ]]
	return v1.GetGoals()
end
function t.HasCommunityGoalContribution(p1, p2) --[[ HasCommunityGoalContribution | Line: 233 ]]
	return p1:GetCommunityGoalContribution(p2) > 0
end
function t.GetCommunityGoalContribution(p1, p2) --[[ GetCommunityGoalContribution | Line: 237 ]]
	local v1 = p1:_getGoalFolder(p2)
	if not v1 then
		return 0
	end
	local Contribution = v1:FindFirstChild("Contribution")
	if Contribution then
		return Contribution.Value
	else
		return 0
	end
end
function t.GetCommunityGoalContributedMilestones(p1, p2) --[[ GetCommunityGoalContributedMilestones | Line: 251 ]]
	return p1._contributedMilestonesCache[p2] or {}
end
function t.GetCommunityGoalClaimedMilestones(p1, p2) --[[ GetCommunityGoalClaimedMilestones | Line: 255 ]]
	return p1._claimedMilestonesCache[p2] or {}
end
function t.IsCommunityGoalMilestoneClaimed(p1, p2, p3) --[[ IsCommunityGoalMilestoneClaimed | Line: 259 ]]
	return (p1._claimedMilestonesCache[p2] or {})[tostring(p3)] == true
end
function t.IsCommunityGoalMilestoneClaimable(p1, p2, p3) --[[ IsCommunityGoalMilestoneClaimable | Line: 264 ]]
	return p1:GetCommunityGoalMilestoneState(p2, p3) == "Claimable"
end
function t.GetCommunityGoalMilestoneState(p1, p2, p3) --[[ GetCommunityGoalMilestoneState | Line: 268 | Upvalues: v1 (copy) ]]
	local v12 = v1.GetGoal(p2)
	if not v12 then
		return "Locked"
	end
	if not v12:GetMilestones()[p3] then
		return "Locked"
	end
	local v2 = tostring(p3)
	if (p1._claimedMilestonesCache[p2] or {})[v2] then
		return "Claimed"
	end
	local v5 = v12:IsMilestoneCompleted(p3)
	local v6 = (p1._contributedMilestonesCache[p2] or {})[v2] == true
	if v5 then
		if v6 then
			return "Claimable"
		else
			return "Missed"
		end
	elseif v6 then
		return "Contributing"
	else
		return "Locked"
	end
end
function t.GetCommunityGoalClaimableMilestones(p1, p2) --[[ GetCommunityGoalClaimableMilestones | Line: 306 | Upvalues: v1 (copy) ]]
	local v12 = v1.GetGoal(p2)
	if not v12 then
		return {}
	end
	local t = {}
	for v2, v3 in v12:GetMilestones() do
		if p1:GetCommunityGoalMilestoneState(p2, v2) == "Claimable" then
			t[#t + 1] = v3
		end
	end
	return t
end
function t.GetCommunityGoalIncrementedSignal(p1) --[[ GetCommunityGoalIncrementedSignal | Line: 322 ]]
	return p1.CommunityGoalIncrementedSignal
end
function t.GetCommunityGoalMilestoneReachedSignal(p1) --[[ GetCommunityGoalMilestoneReachedSignal | Line: 326 ]]
	return p1.CommunityGoalMilestoneReachedSignal
end
function t.GetCommunityGoalMilestoneClaimedSignal(p1) --[[ GetCommunityGoalMilestoneClaimedSignal | Line: 330 ]]
	return p1.CommunityGoalMilestoneClaimedSignal
end
function t.GetCommunityGoalMilestoneStateChangedSignal(p1) --[[ GetCommunityGoalMilestoneStateChangedSignal | Line: 334 ]]
	return p1.CommunityGoalMilestoneStateChangedSignal
end
return t