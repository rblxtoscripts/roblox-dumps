-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("MessagingService", "Server")
local v3 = Sonar("FormatTime")
local v4 = Sonar("GameInviteService")
local v5 = Sonar("TableUtils")
local v6 = Sonar("DataStore", "Server")
local v7 = Sonar("DataUpdateService", "Server")
local v8 = Sonar("InstanceUtils")
local v9 = Sonar("StorageUtils")
local v10 = Sonar("TaskScheduler", "Server")
local v11 = game:GetService("RunService"):IsServer()
local v12 = game:GetService("RunService"):IsStudio()
local v13 = v9.GetConfig("PlayerReferral")()
local InviteMessageId = v13.InviteMessageId
local PromptMessage = v13.PromptMessage
local ConditionToRegisterReferral = v13.ConditionToRegisterReferral
local v14 = v12 and v13.DebugMode
local PendingReferralQueueInterval = v13.PendingReferralQueueInterval
local v15 = v11 and v6.new("PendingReferrals")
local t2 = {}
function t._processReferralQueue(p1) --[[ _processReferralQueue | Line: 74 | Upvalues: t2 (copy), v15 (copy), t (copy) ]]
	if #t2 == 0 then
		return
	end
	local v1 = table.remove(t2, 1)
	if not v1 or v1.Removed then
		return
	end
	local t3 = {}
	local _, v2 = v15:UpdateWithFunction(v1.Player.UserId, function(p1) --[[ Line: 87 | Upvalues: t3 (copy) ]]
		local v1 = if p1 then p1 else {}
		local v2 = v1
		for v3, v4 in v1 do
			table.insert(t3, v3)
			v2[v3] = nil
		end
		return t3
	end)
	if not (v2 and (t3 and next(t3))) then
		return
	end
	t:_addPendingReferrals(v1, t3, true)
end
function t._runReferralCallback(p1, p2, p3, ...) --[[ _runReferralCallback | Line: 106 | Upvalues: v13 (copy) ]]
	if v13.OnSuccessfulReferral then
		v13.OnSuccessfulReferral(p2, p3, ...)
	else
		warn("\226\154\160\239\184\143 PlayerReferralService, No on referral callback found:", p3.Player, p2)
	end
end
function t._getUserIdWhoReferredPlayer(p1, p2) --[[ _getUserIdWhoReferredPlayer | Line: 114 | Upvalues: v14 (copy), HttpService (copy) ]]
	local v1 = p2:GetJoinData().LaunchData or v14 and HttpService:JSONEncode({
		UserIdWhoReferred = p2.UserId
	})
	if not v1 or #v1 <= 0 then
		return nil
	end
	local v2 = HttpService:JSONDecode(v1)
	if v2 then
		return v2.UserIdWhoReferred
	else
		return nil
	end
end
function t._getWrapperFromReferrerUserId(p1, p2) --[[ _getWrapperFromReferrerUserId | Line: 132 | Upvalues: Players (copy), v1 (copy) ]]
	local v12 = Players:GetPlayerByUserId((tonumber(p2)))
	return if v12 then v1.getWrapperFromPlayer(v12) else v12
end
function t._findReferrer(p1, p2, p3) --[[ _findReferrer | Line: 137 | Upvalues: t (copy), v2 (copy) ]]
	local v1 = t:_getWrapperFromReferrerUserId(p2.UserIdWhoReferred)
	if v1 then
		t:_addPendingReferrals(v1, p2.UserIdWhoWasReferred)
		return true
	end
	if not p3 then
		return false
	end
	v2.Publish("FriendReferrals", p2)
	return false
end
function t._addPendingReferrals(p1, p2, p3, p4) --[[ _addPendingReferrals | Line: 154 | Upvalues: t (copy), v15 (copy), v5 (copy), HttpService (copy) ]]
	local v1 = t.GetReferralsByPlayer(p2)
	local t2 = {}
	local v3 = type(p3) == "table" and p3 or { p3 }
	for k, v in pairs(v3) do
		local v4 = tostring(v)
		if not v1[v4] then
			v1[v4] = true
			t2[v4] = true
		end
	end
	if not p4 then
		local v52, v6 = v15:UpdateWithFunction(p2.Player.UserId, function(p1) --[[ Line: 172 | Upvalues: v3 (ref) ]]
			local v2 = if p1 then p1 else {}
			for v32, v4 in v3 do
				v2[v4] = nil
			end
			return v2
		end)
		if not v6 then
			warn("\226\154\160\239\184\143 PlayerReferralService, Failed to remove referred players from pending referrals:", p2.Player, v52)
			return
		end
	end
	p2.PlayerData.Referrals.Total.Value = v5.Count(v1)
	p2.PlayerData.Referrals.Referrals.Value = HttpService:JSONEncode(v1)
	for v7 in t2 do
		t:_runReferralCallback("Inviter", p2, v7)
	end
end
function t.InvitePlayerToGame(p1, p2) --[[ InvitePlayerToGame | Line: 195 | Upvalues: v4 (copy), PromptMessage (copy), InviteMessageId (copy) ]]
	return v4.PromptGameInvite(p1, {
		PromptMessage = PromptMessage,
		InviteUser = p2,
		LaunchData = {
			UserIdWhoInvited = p1.UserId
		},
		InviteMessageId = InviteMessageId
	})
end
function t.CanBeReferred(p1) --[[ CanBeReferred | Line: 204 | Upvalues: v1 (copy), v3 (copy), v13 (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p1)
	if not v12 then
		return "PlayerNotFound"
	end
	if v12.PlayerData.Referrals.ReferredBy.Value > 0 then
		return "AlreadyInvitedToGame"
	end
	if v3.GetTime() - v12:GetFirstJoinTime() >= v13.MaxTimeWithData then
		return "AlreadyHasData"
	end
	if v12.Player.AccountAge < v13.MinAccountAge then
		return "AccountNotOldEnough"
	else
		return true
	end
end
function t.GetReferralsByPlayer(p1) --[[ GetReferralsByPlayer | Line: 225 | Upvalues: v1 (copy), HttpService (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p1)
	if not v12 then
		return {}
	end
	local Referrals = v12.PlayerData.Referrals.Referrals.Value
	if #Referrals > 0 then
		return HttpService:JSONDecode(Referrals)
	else
		return {}
	end
end
function t.AddPendingReferral(p1, p2) --[[ AddPendingReferral | Line: 239 | Upvalues: v1 (copy), t (copy), v15 (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p1)
	if not v12 then
		return
	end
	local Pending = v12.PlayerData.Referrals.Pending
	if not Pending then
		return
	end
	local v2 = Pending.Value
	if v2 <= 0 then
		return
	end
	local t2 = {
		UserIdWhoWasReferred = v12.Player.UserId,
		UserIdWhoReferred = v2
	}
	local v3 = t:_getWrapperFromReferrerUserId(v2)
	local v4 = false
	if not v3 then
		local v5, v6 = v15:UpdateWithFunction(v2, function(p1) --[[ Line: 269 | Upvalues: v2 (copy), v12 (copy) ]]
			local v1 = if p1 then p1 else {}
			v1[v2] = v12.Player.UserId
			return v1
		end)
		if v6 then
			t:_findReferrer(t2, true)
			v4 = true
		else
			warn("\226\154\160\239\184\143 PlayerReferralService, Failed to add pending referral to data store:", v12.Player, v5)
		end
	end
	if not (v3 or v4) then
		return
	end
	v12.PlayerData.Referrals.ReferredBy.Value = v2
	Pending.Value = 0
	t:_runReferralCallback("Invitee", v12, v2)
	if v3 then
		t:_addPendingReferrals(v3, v12.Player.UserId)
		return
	end
	t:_findReferrer(t2, true)
end
function t.Init(p1) --[[ Init | Line: 306 | Upvalues: v11 (copy), v7 (copy), v8 (copy), v1 (copy), t (copy), ConditionToRegisterReferral (copy), t2 (copy), v2 (copy), v10 (copy), PendingReferralQueueInterval (copy) ]]
	if not v11 then
		return
	end
	v7.AddRigDataCallback(function(p1) --[[ Line: 308 | Upvalues: v8 (ref) ]]
		if p1:FindFirstChild("Referrals") then
			return
		end
		local v1 = v8.Create("Folder", {
			Name = "Referrals",
			Parent = p1
		})
		v8.Create("IntValue", {
			Name = "Pending",
			Parent = v1
		})
		v8.Create("IntValue", {
			Name = "ReferredBy",
			Parent = v1
		})
		v8.Create("StringValue", {
			Name = "Referrals",
			Parent = v1
		})
		v8.Create("IntValue", {
			Name = "Total",
			Parent = v1
		})
	end)
	v1.bindToPlayers({
		OnAdded = function(p1, p2) --[[ OnAdded | Line: 338 | Upvalues: t (ref), ConditionToRegisterReferral (ref), t2 (ref) ]]
			local v1 = t:_getUserIdWhoReferredPlayer(p1)
			if v1 and t.CanBeReferred(p2) ~= true then
				p2.PlayerData.Referrals.Pending.Value = tonumber(v1)
			end
			local function checkCondition() --[[ checkCondition | Line: 352 | Upvalues: ConditionToRegisterReferral (ref), p2 (copy), t (ref) ]]
				if ConditionToRegisterReferral ~= "OnJoin" and not ConditionToRegisterReferral.Check(p2) then
					return
				end
				t.AddPendingReferral(p2)
			end
			local v2 = ConditionToRegisterReferral
			if type(v2) == "table" then
				p2.Maid:GiveTask(ConditionToRegisterReferral.Changed(p2):Connect(checkCondition))
			end
			if ConditionToRegisterReferral == "OnJoin" or ConditionToRegisterReferral.Check(p2) then
				t.AddPendingReferral(p2)
			end
			t2[#t2 + 1] = p2
		end,
		OnRemoved = function(p1, p2) --[[ OnRemoved | Line: 366 | Upvalues: t2 (ref) ]]
			local v1 = table.find(t2, p2)
			if not v1 then
				return
			end
			table.remove(t2, v1)
		end
	})
	v2.Subscribe("FriendReferrals", function(p1) --[[ Line: 375 | Upvalues: t (ref) ]]
		t:_findReferrer(p1.Data or p1)
	end)
	v10.Interval(PendingReferralQueueInterval, function() --[[ Line: 380 | Upvalues: t (ref) ]]
		t:_processReferralQueue()
	end)
end
t:Init()
return t