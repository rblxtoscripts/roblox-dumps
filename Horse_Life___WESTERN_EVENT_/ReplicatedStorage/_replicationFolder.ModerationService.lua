-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("MessagingService")
local v2 = Sonar("DataStore", "Server")
local v3 = Sonar("FormatTime")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("Constants")
local IS_SERVER = v5.IS_SERVER
local IS_STUDIO = v5.IS_STUDIO
local IS_PUBLISHED = v5.IS_PUBLISHED
local v6 = v4.GetConfig("Moderation")()
local ContactMessage = v6.ContactMessage
local BanMessages = v6.BanMessages
local v7 = IS_PUBLISHED and IS_SERVER and v2.new("Moderation")
local function searchForPlayerInServer(p1, p2) --[[ searchForPlayerInServer | Line: 82 | Upvalues: Players (copy) ]]
	if typeof(p1) == "Instance" then
		return p2(p1)
	end
	local v1 = Players:GetPlayerByUserId((tonumber(p1)))
	if v1 then
		return p2(v1)
	end
end
local function postToServers(p1) --[[ postToServers | Line: 92 | Upvalues: v1 (copy) ]]
	local t = {
		Action = p1.Action
	}
	t.UserId = tonumber(p1.UserId)
	t.EndTime = p1.EndTime
	v1.Publish("Moderation", t)
end
local function getActionEndTime(p1) --[[ getActionEndTime | Line: 100 ]]
	if type(p1.Length) == "number" then
		return math.floor(os.time() + p1.Length)
	else
		return p1.Length
	end
end
local function getEndTimeAttribute(p1) --[[ getEndTimeAttribute | Line: 108 ]]
	return if p1.EndTime == "Permanent" then true else p1.EndTime
end
local function updateDatastoreWithAction(p1, p2) --[[ updateDatastoreWithAction | Line: 112 | Upvalues: v7 (copy) ]]
	return v7:UpdateWithFunction(p2.UserId, function(p12_2) --[[ Line: 113 | Upvalues: p1 (copy), p2 (copy) ]]
		local v1 = if p12_2 then p12_2 else {}
		local v2 = v1[p1]
		if not v2 then
			v2 = {}
			v1[p1] = v2
		end
		local v4 = p2
		v2.EndTime = if type(v4.Length) == "number" then math.floor(os.time() + v4.Length) else v4.Length
		return v1
	end)
end
local function runAction(p1, p2, p3) --[[ runAction | Line: 129 | Upvalues: v7 (copy), v1 (copy), Players (copy) ]]
	if not (p2.FromMessagingService or p2.DoNotUpdateDatastore) then
		local v12 = v7:UpdateWithFunction(p2.UserId, function(p12_2) --[[ Line: 113 | Upvalues: p1 (copy), p2 (copy) ]]
			local v1 = if p12_2 then p12_2 else {}
			local v2 = v1[p1]
			if not v2 then
				v2 = {}
				v1[p1] = v2
			end
			local v4 = p2
			v2.EndTime = if type(v4.Length) == "number" then math.floor(os.time() + v4.Length) else v4.Length
			return v1
		end)
		if not v12 then
			return
		end
		p2.EndTime = v12[p1].EndTime
		if p3.OnSuccess then
			task.spawn(p3.OnSuccess, p2)
		end
		local t = {
			Action = p2.Action
		}
		t.UserId = tonumber(p2.UserId)
		t.EndTime = p2.EndTime
		v1.Publish("Moderation", t)
	end
	if not p3.OnPlayerFound then
		return
	end
	local v2 = p2.Player or p2.UserId
	if typeof(v2) == "Instance" then
		p3.OnPlayerFound(v2, p2)
		return
	end
	local v3 = Players:GetPlayerByUserId((tonumber(v2)))
	if not v3 then
		return
	end
	p3.OnPlayerFound(v3, p2)
end
local t2 = {
	Mute = function(p1) --[[ Mute | Line: 154 | Upvalues: runAction (copy) ]]
		return runAction("Mute", p1, {
			OnPlayerFound = function(p12) --[[ OnPlayerFound | Line: 156 | Upvalues: p1 (copy) ]]
				local v2 = p1
				p12:SetAttribute("Muted", if v2.EndTime == "Permanent" then true else v2.EndTime)
			end
		})
	end,
	Unmute = function(p1) --[[ Unmute | Line: 161 | Upvalues: runAction (copy) ]]
		return runAction("Mute", p1, {
			OnPlayerFound = function(p1) --[[ OnPlayerFound | Line: 163 ]]
				p1:SetAttribute("Muted", nil)
			end
		})
	end,
	Ban = function(p1) --[[ Ban | Line: 169 | Upvalues: runAction (copy), Players (copy), ContactMessage (copy), t (copy) ]]
		return runAction("Ban", p1, {
			OnSuccess = function(p1) --[[ OnSuccess | Line: 171 | Upvalues: Players (ref), ContactMessage (ref) ]]
				local t = {
					ApplyToUniverse = true
				}
				local t2 = {}
				t2[1] = tonumber(p1.UserId)
				t.UserIds = t2
				t.Duration = type(p1.Length) == "number" and p1.Length or -1
				t.DisplayReason = ContactMessage
				t.PrivateReason = p1.UserId .. " was banned by " .. " for " .. p1.Reason
				t.ExcludeAltAccounts = p1.ExcludeAltAccounts
				Players:BanAsync(t)
			end,
			OnPlayerFound = function(p12) --[[ OnPlayerFound | Line: 181 | Upvalues: t (ref), p1 (copy) ]]
				t.Kick(p12, p1.Message)
			end
		})
	end,
	Unban = function(p1) --[[ Unban | Line: 186 | Upvalues: runAction (copy), Players (copy), t (copy) ]]
		return runAction("Ban", p1, {
			OnSuccess = function(p1) --[[ OnSuccess | Line: 188 | Upvalues: Players (ref) ]]
				local t = {
					ApplyToUniverse = true
				}
				local t2 = {}
				t2[1] = tonumber(p1.UserId)
				t.UserIds = t2
				Players:UnbanAsync(t)
			end,
			OnPlayerFound = function(p12) --[[ OnPlayerFound | Line: 194 | Upvalues: t (ref), p1 (copy) ]]
				t.Kick(p12, p1.Message)
			end
		})
	end,
	TradeLock = function(p1) --[[ TradeLock | Line: 200 | Upvalues: runAction (copy) ]]
		return runAction("TradeLock", p1, {
			OnPlayerFound = function(p12) --[[ OnPlayerFound | Line: 202 | Upvalues: p1 (copy) ]]
				local v2 = p1
				p12:SetAttribute("TradeLocked", if v2.EndTime == "Permanent" then true else v2.EndTime)
			end
		})
	end,
	TradeUnlock = function(p1) --[[ TradeUnlock | Line: 207 | Upvalues: runAction (copy) ]]
		return runAction("TradeUnlock", p1, {
			OnPlayerFound = function(p1) --[[ OnPlayerFound | Line: 209 ]]
				p1:SetAttribute("TradeLocked", nil)
			end
		})
	end,
	Kick = function(p1) --[[ Kick | Line: 215 | Upvalues: t (copy), Players (copy) ]]
		local UserId = p1.UserId
		if typeof(UserId) == "Instance" then
			t.Kick(UserId, p1.Message)
			return
		end
		local v1 = Players:GetPlayerByUserId((tonumber(UserId)))
		if v1 then
			t.Kick(v1, p1.Message)
		end
	end
}
function t.RunModerationAction(p1) --[[ RunModerationAction | Line: 222 | Upvalues: t2 (copy) ]]
	if t2[p1.Action] then
		local v1, v2 = pcall(function() --[[ Line: 228 | Upvalues: t2 (ref), p1 (copy) ]]
			return t2[p1.Action](p1)
		end)
		return v1, v2
	else
		warn("\226\154\160\239\184\143 ModerationService, Invalid action: " .. p1.Action)
	end
end
function t.GetUserIdFromName(p1) --[[ GetUserIdFromName | Line: 236 | Upvalues: Players (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 237 | Upvalues: Players (ref), p1 (copy) ]]
		return Players:GetUserIdFromNameAsync(p1)
	end)
	return v1, v2
end
function t.Kick(p1, p2) --[[ Kick | Line: 243 | Upvalues: ContactMessage (copy) ]]
	p1:Kick(ContactMessage .. (p2 or ""))
end
function t.GetPlayerModerationFile(p1) --[[ GetPlayerModerationFile | Line: 248 | Upvalues: v7 (copy) ]]
	return v7:Get(p1.UserId) or {}
end
function t.CheckPlayerModerationFile(p1, p2) --[[ CheckPlayerModerationFile | Line: 252 ]]
	local v1 = p1[p2]
	if not v1 then
		return false
	end
	if v1.EndTime == "Permanent" then
		return true, v1
	end
	if not v1.EndTime then
		return false
	end
	return os.time() < v1.EndTime, v1
end
function t.ModeratePlayerOnJoin(p1) --[[ ModeratePlayerOnJoin | Line: 266 | Upvalues: IS_PUBLISHED (copy), t (copy), IS_STUDIO (copy), v6 (copy), BanMessages (copy), v3 (copy) ]]
	if not IS_PUBLISHED then
		return
	end
	local v1 = t.GetPlayerModerationFile(p1)
	if not IS_STUDIO or v6.AllowBansOnJoinInStudio then
		local v2, v32 = t.CheckPlayerModerationFile(v1, "Ban")
		if v2 == true then
			t.Kick(p1, type(v32.EndTime) == "number" and string.format(BanMessages.Temporary, v3.FormatString(v32.EndTime - os.time())) or (if v32.EndTime == "Permanent" then BanMessages.Permanently else false))
			return true
		end
	end
	for v5, v62 in { "Mute", "TradeLock" } do
		local v7, v8 = t.CheckPlayerModerationFile(v1, v62)
		if v7 == true then
			t.RunModerationAction({
				DoNotUpdateDatastore = true,
				Action = v62,
				Player = p1,
				EndTime = v8.EndTime
			})
		end
	end
	return false
end
function t.HasActiveModeration(p1, p2) --[[ HasActiveModeration | Line: 300 ]]
	local v1 = p1:GetAttribute(p2)
	if not v1 then
		return false
	end
	if type(v1) == "number" and os.time() < v1 then
		return true, v1
	end
	if v1 == true then
		return true, v1
	else
		return false
	end
end
function t.Init(p1) --[[ Init | Line: 312 | Upvalues: IS_SERVER (copy), v1 (copy), t (copy) ]]
	if not IS_SERVER then
		return
	end
	v1.Subscribe("Moderation", function(p1) --[[ Line: 314 | Upvalues: t (ref) ]]
		p1.FromMessagingService = true
		t.RunModerationAction(p1)
	end)
end
t:Init()
return t