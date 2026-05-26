-- https://lua.expert/
local t = {}
local HttpService = game:GetService("HttpService")
local MemoryStoreService = game:GetService("MemoryStoreService")
local OpenCloudService = game:GetService("OpenCloudService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Promise")
local v2 = Sonar("retryAsync")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("EventUtils")
local v5 = Sonar("StorageUtils")
local isNotPrivateServerId = game.PrivateServerId ~= ""
local v6 = RunService:IsStudio()
local v7 = RunService:IsServer()
local v8 = v5.GetConfig("GameNotifications")()
local NotificationPresets = v8.NotificationPresets
local PushNotifications = v8.PushNotifications
local DebugMode = v8.DebugMode
local DebugSendNotifications = v8.DebugSendNotifications
local NotificationPollRate = v8.NotificationPollRate
local NotificationPollSize = v8.NotificationPollSize
local v9 = string.format("%s/%s/%s/%s", "v1", "notifications", "%s", "%s")
local MemoryStoreShards = v8.MemoryStoreShards
local function getDaySeed(p1) --[[ getDaySeed | Line: 105 ]]
	return p1 // 86400
end
local function getMemoryStoreSortedMapName(p1, p2) --[[ getMemoryStoreSortedMapName | Line: 110 | Upvalues: v9 (copy) ]]
	return string.format(v9, p1, p2)
end
local function getShardFromUserId(p1) --[[ getShardFromUserId | Line: 115 | Upvalues: MemoryStoreShards (copy) ]]
	return (p1 - 1) % MemoryStoreShards + 1
end
local function getNextNotificationTimestamps() --[[ getNextNotificationTimestamps | Line: 120 | Upvalues: DebugMode (copy) ]]
	local UnixTimestamp = DateTime.now().UnixTimestamp
	if not DebugMode then
		UnixTimestamp = UnixTimestamp + 5
	end
	local v1 = UnixTimestamp - 28800
	local v3 = v1 + (if DateTime.fromUnixTimestamp(v1):FormatLocalTime("dddd", "en-us") == "Thursday" then 2 else 1) * 86400 // 1
	local v4 = v3 + 86400 + 28800
	local v5 = v3 + 28800
	return {
		notificationExpirationTimestamp = v4,
		processNotificationTimestamp = v5,
		timeUntilExpiration = v4 - UnixTimestamp,
		timeUntilProcessing = v5 - UnixTimestamp
	}
end
function t._postUserNotificationAsync(p1, p2, p3) --[[ _postUserNotificationAsync | Line: 179 | Upvalues: OpenCloudService (copy), v2 (copy), HttpService (copy) ]]
	local v1, v22 = v2({
		callback = {
			OpenCloudService.InvokeAsync,
			OpenCloudService,
			"v2",
			"userNotification",
			{
				user = p2,
				userNotification = p3
			}
		}
	})
	local v3, v4 = pcall(HttpService.JSONDecode, HttpService, v22.Body)
	local v5 = if v3 then if v1 then if v22.StatusCode == 200 then true else false else v1 else v3
	return {
		error = if v5 then nil else v4,
		response = if v5 then v4 else nil,
		success = v5,
		statusCode = v22.StatusCode
	}
end
function t._getHighestPriorityNotification(p1, ...) --[[ _getHighestPriorityNotification | Line: 202 | Upvalues: PushNotifications (copy), NotificationPresets (copy) ]]
	local t = {}
	for v2, v3 in PushNotifications do
		local v1
		local v4 = NotificationPresets[v2]
		if v4 then
			local Check = v4.Check
			v1 = if Check then Check(v4, ...) else true
			if v1 then
				table.insert(t, {
					Name = v2,
					Priority = v3
				})
			end
			continue
		end
		warn((("\226\154\160\239\184\143 GameNotificationsService, Push notification \'%*\' not found in notification presets"):format(v2)))
	end
	table.sort(t, function(p1, p2) --[[ Line: 223 ]]
		return p1.Priority < p2.Priority
	end)
	return p1:_createNotification(t[1], ...)
end
function t._createNotification(p1, p2, ...) --[[ _createNotification | Line: 230 | Upvalues: NotificationPresets (copy) ]]
	local v1 = NotificationPresets[p2]
	v1.Name = p2
	return v1.Get(v1, ...), p2
end
function t._processUserNotification(p1, p2, p3) --[[ _processUserNotification | Line: 237 | Upvalues: MemoryStoreService (copy), DebugMode (copy), DebugSendNotifications (copy), v2 (copy) ]]
	local v1 = tonumber(string.match(p2.key, "%d+"))
	if not v1 then
		return
	end
	local v22 = MemoryStoreService:GetSortedMap(p3)
	task.spawn(function() --[[ Line: 244 | Upvalues: v1 (copy), p1 (copy), DebugMode (ref), DebugSendNotifications (ref) ]]
		local v12, v2 = p1:_getHighestPriorityNotification({
			UserId = v1
		})
		if DebugMode and not DebugSendNotifications then
			warn((("\226\154\160\239\184\143 GameNotificationsService, Skipping push notification \'%*\' for userId \'%*\'"):format(v2, v1)))
			warn(v12)
			return
		end
		if not (p1:_postUserNotificationAsync(v1, v12).success and DebugMode) then
			return
		end
		warn((("\226\156\133 GameNotificationsService, Fired push notification \'%*\' for userId \'%*\'"):format(v2, v1)))
	end)
	if v2(v22.RemoveAsync, v22, p2.key) then
		return
	end
	warn((("\226\154\160\239\184\143 GameNotificationsService, Failed to remove user \'%*\' from sorted map \'%*\'"):format(v1, p3)))
end
function t.AddPushNotificationForUser(p1) --[[ AddPushNotificationForUser | Line: 273 | Upvalues: getNextNotificationTimestamps (copy), v1 (copy), v2 (copy), MemoryStoreShards (copy), v9 (copy), MemoryStoreService (copy) ]]
	local v12 = getNextNotificationTimestamps()
	local timeUntilExpiration = v12.timeUntilExpiration
	local processNotificationTimestamp = v12.processNotificationTimestamp
	local v22 = processNotificationTimestamp // 86400
	return v1.new(function(p12, p2) --[[ Line: 280 | Upvalues: v2 (ref), v22 (copy), p1 (copy), MemoryStoreShards (ref), v9 (ref), MemoryStoreService (ref), timeUntilExpiration (copy), processNotificationTimestamp (copy), v12 (copy) ]]
		local v1, v23 = v2(function() --[[ Line: 281 | Upvalues: v22 (ref), p1 (ref), MemoryStoreShards (ref), v9 (ref), MemoryStoreService (ref), timeUntilExpiration (ref), processNotificationTimestamp (ref), v12 (ref) ]]
			local v3 = string.format(v9, v22, (p1 - 1) % MemoryStoreShards + 1)
			MemoryStoreService:GetSortedMap(v3):SetAsync(p1, true, timeUntilExpiration, processNotificationTimestamp)
			return {
				memoryStoreSortedMapName = v3,
				nextNotificationTimestamps = v12
			}
		end)
		if v1 then
			p12(v23)
		else
			p2("\226\154\160\239\184\143 GameNotificationsService, Failed to register notification for user")
		end
	end)
end
function t.SendNotificationToUser(p1, p2, ...) --[[ SendNotificationToUser | Line: 301 | Upvalues: t (copy), v1 (copy) ]]
	local v12 = t:_createNotification(p2, ...)
	return v1.new(function(p12, p2) --[[ Line: 306 | Upvalues: t (ref), p1 (copy), v12 (copy) ]]
		local v1 = t:_postUserNotificationAsync(p1, v12)
		if v1.success then
			p12(v1)
		else
			p2("\226\154\160\239\184\143 GameNotificationsService, Failed to send user notification")
		end
	end)
end
function t._setupPolling(p1) --[[ _setupPolling | Line: 317 | Upvalues: isNotPrivateServerId (copy), v6 (copy), DebugMode (copy), v4 (copy), MemoryStoreShards (copy), v9 (copy), MemoryStoreService (copy), v2 (copy), NotificationPollSize (copy), NotificationPollRate (copy) ]]
	if not isNotPrivateServerId and (not v6 or DebugMode) then
		v4.spawnLoop(function() --[[ Line: 322 | Upvalues: p1 (copy), MemoryStoreShards (ref), v9 (ref), MemoryStoreService (ref), v2 (ref), NotificationPollSize (ref), DebugMode (ref) ]]
			if not p1._processingShard then
				p1._processingShard = math.random(1, MemoryStoreShards)
			end
			local v1 = p1
			v1._processingShard = v1._processingShard + 1
			if MemoryStoreShards < p1._processingShard then
				p1._processingShard = 1
			end
			local UnixTimestamp = DateTime.now().UnixTimestamp
			local v22 = string.format(v9, UnixTimestamp // 86400, p1._processingShard)
			local v3 = MemoryStoreService:GetSortedMap(v22)
			local v4, v5 = v2(v3.GetRangeAsync, v3, Enum.SortDirection.Ascending, NotificationPollSize, nil, {
				sortKey = UnixTimestamp
			})
			if not v4 then
				return
			end
			if DebugMode then
				print("\226\156\133 GameNotificationsService, Successfully polled notifications", {
					MemoryStoreName = v22,
					Results = v5
				})
			end
			local v6 = v22
			for v7, v8 in v5 do
				p1:_processUserNotification(v8, v6)
			end
		end, NotificationPollRate, DebugMode)
	end
end
function t._subscribeToPlayers(p1) --[[ _subscribeToPlayers | Line: 362 | Upvalues: v3 (copy), t (copy) ]]
	local v1 = false
	game:BindToClose(function(p1) --[[ Line: 365 | Upvalues: v1 (ref) ]]
		v1 = p1 == Enum.CloseReason.ServerEmpty == false
	end)
	v3.bindToPlayers({
		OnRemoved = function(p1, p2) --[[ OnRemoved | Line: 374 | Upvalues: v1 (ref), t (ref) ]]
			if not v1 then
				t.AddPushNotificationForUser(p2)
			end
		end
	})
end
function t.Init(p1) --[[ Init | Line: 385 | Upvalues: v7 (copy) ]]
	if not v7 then
		return
	end
	p1:_subscribeToPlayers()
	p1:_setupPolling()
end
t:Init()
return t