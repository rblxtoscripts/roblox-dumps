-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local v1 = shared.GBMod("Timer")
local v2 = shared.GBMod("Signal")
local v3 = shared.GBMod("Cleaner")
local v4 = shared.GBMod("Utilities")
local v5 = shared.GBMod("GBRequests")
local v6 = shared.GBMod("InternalExperiments")
local v7 = shared.GBMod("InternalConfigs")
local v8 = shared.GBMod("SignalConnection")
local v9 = shared.GBMod("LocalizationCache")
local v10 = shared.GBMod("LaunchDataResolver")
local v11 = shared.GBMod("ServerClientInfoHandler")
local v12 = if RunService:IsStudio() then 10 else 45
local v13 = 10
local t2 = {
	string = true,
	number = true,
	boolean = true,
	table = true
}
local t3 = {
	INVALID_MARKERS = true,
	SUBSCRIPTION_LIMIT_EXCEEDED = true,
	SUBSCRIPTION_UNPAID = true
}
local t4 = {}
local t5 = {}
local t6 = {}
local v14 = 0
local v15 = false
local function GetSessionIdForPlayer(p1) --[[ GetSessionIdForPlayer | Line: 71 | Upvalues: t6 (copy), HttpService (copy), v11 (copy) ]]
	if t6[p1] == nil and p1.Parent then
		t6[p1] = HttpService:GenerateGUID(false)
		v11:UpdateClientData(p1, "sessionId", t6[p1])
	end
	return t6[p1]
end
local function EncodeVector3(p1) --[[ EncodeVector3 | Line: 80 | Upvalues: v4 (copy) ]]
	local t = { p1.X, p1.Y, p1.Z }
	t[1] = v4.roundNum(t[1], 0.0001)
	t[2] = v4.roundNum(t[2], 0.0001)
	t[3] = v4.roundNum(t[3], 0.0001)
	return t
end
local function v16(p1) --[[ isMarkerDataValid | Line: 90 | Upvalues: t2 (copy), v16 (copy) ]]
	for v1, v2 in p1 do
		local v3 = type(v2)
		if t2[v3] == nil then
			return false
		end
		if v3 == "table" and not v16(v2) then
			return false
		end
	end
	return true
end
local function AddMarker(p1) --[[ AddMarker | Line: 105 | Upvalues: t5 (ref), t (copy) ]]
	table.insert(t5, p1)
	if not (#t5 >= 1000) then
		return
	end
	t:SendMarkers()
end
t.MarkersFailed = v2.new()
function t.SendMarkers(p1, p2) --[[ SendMarkers | Line: 119 | Upvalues: t5 (ref), v14 (ref), v5 (copy), v16 (copy), v4 (copy), t3 (copy) ]]
	local v1 = if p2 == nil then false else true
	local v2 = if p2 then p2 else t5
	if not (#v2 > 0) then
		return true
	end
	v14 = tick()
	local t = {
		markers = v2
	}
	if not v1 then
		t5 = {}
	end
	local v3, v42 = v5:GBRequestAsync("v1/markers", t)
	if not v3 then
		local t2 = {}
		local count = 0
		for v52, v6 in t.markers do
			if v16(v6) then
				if not v1 then
					table.insert(t2, v6)
				end
				continue
			end
			count = count + 1
		end
		if t2[1] then
			p1.MarkersFailed:Fire(t2)
		end
		if count > 0 then
			v4.GBWarn((("%* of the %* sent are invalid and will not be retried."):format(count, #t.markers)))
		end
		if v42 and (v42.errorCode and t3[v42.errorCode]) then
			return false, v42
		end
		v4.GBWarn("Failed to send engagement markers to Gamebeast.")
	end
	return v3, v42
end
function t._createMarker(p1, p2, p3, p4, p5) --[[ _createMarker | Line: 171 | Upvalues: v4 (copy), t2 (copy), HttpService (copy), EncodeVector3 (copy), v9 (copy), v6 (copy), v7 (copy), t5 (ref), t (copy), v3 (copy), v11 (copy), t6 (copy), t4 (copy), v8 (copy), v1 (copy), v12 (copy), v15 (ref), v10 (copy) ]]
	local v2 = p5 or {}
	local v32 = nil
	if p2 == "server" or p2 == "client" then
		v32 = "Usage: FireMarker(MarkerType, Value (optional), Parameters (optional))"
	end
	if typeof(p3) ~= "string" then
		v4.GBWarn("MarkerType argument should be a string.")
		return
	end
	local player = v2.player
	local position = v2.position
	if player ~= nil and (not player:IsA("Player") and typeof(player) ~= "number") then
		v4.GBWarn("Player argument for " .. p2 .. " marker \"" .. p3 .. "\" should be a player instance, string/numeric identifier, or nil.\n" .. v32)
		return
	end
	if position ~= nil and typeof(position) ~= "Vector3" then
		v4.GBWarn("Position argument for " .. p2 .. " marker \"" .. p3 .. "\" should be Vector3 or nil.\n" .. v32)
		return
	end
	local v42 = type(p4)
	if v42 == "table" and #p4 > 0 then
		v4.GBWarn("Value argument for " .. p2 .. " marker \"" .. p3 .. "\" should not be an array. Use a dictionary instead.")
		return
	end
	if p4 ~= nil and t2[v42] == nil then
		v4.GBWarn("Value argument for " .. p2 .. " marker \"" .. p3 .. "\" be a primitive type or dictionary, got: " .. v42)
		return
	end
	if p4 ~= nil and v42 ~= "table" then
		p4 = {
			value = p4
		}
	end
	local v5 = v4.resolvePlayerObject(player)
	local t3 = {
		markerId = HttpService:GenerateGUID(false)
	}
	t3.timestamp = v2.timestampOverride or DateTime.now().UnixTimestampMillis
	t3.type = p3
	t3.serverId = v4.getServerId()
	t3.userId = if v5 then v5.UserId else v5
	t3.sessionId = nil
	t3.value = p4
	local t7 = {
		sdkPlatform = "roblox",
		placeId = game.PlaceId,
		placeVersion = game.PlaceVersion,
		origin = p2,
		device = nil,
		deviceSubType = nil,
		inputType = nil,
		deeplinkData = nil
	}
	t7.position = position ~= nil and EncodeVector3(position) or nil
	t7.language = v5 and v9:GetLocaleId(v5) or nil
	t7.country = v5 and v9:GetRegionId(v5) or nil
	t7.experimentGroupId = v5 and v6.AssignedGroupIdByPlayer[v5] or v6.AssignedServerGroupId
	t3.properties = t7
	v7:OnReady(function() --[[ Line: 250 | Upvalues: v5 (copy), t3 (copy), t5 (ref), t (ref), v3 (ref), v11 (ref), t6 (ref), HttpService (ref), t4 (ref), v2 (ref), v8 (ref), p4 (ref), v1 (ref), v12 (ref), v15 (ref), v4 (ref), v10 (ref), v6 (ref) ]]
		if v5 then
			local t2 = {
				activeTasks = 0,
				resolved = nil,
				pendingCleaner = v3.new(),
				tasks = {}
			}
			local function resolved(p1) --[[ resolved | Line: 263 | Upvalues: t2 (copy), t3 (ref), v11 (ref), v5 (ref), t6 (ref), HttpService (ref), t5 (ref), t (ref), t4 (ref) ]]
				t2.pendingCleaner:Clean()
				t3.properties.device = v11:GetClientInfo(v5, "device")
				t3.properties.deviceSubType = v11:GetClientInfo(v5, "deviceSubType")
				t3.properties.inputType = v11:GetClientInfo(v5, "inputType")
				local v1 = v11:GetClientInfo(v5, "sessionId")
				if v1 and v1 ~= "" then
					t3.sessionId = v1
					if v5.Parent then
						t6[v5] = v1
					end
				else
					local v3 = v5
					if t6[v3] == nil and v3.Parent then
						t6[v3] = HttpService:GenerateGUID(false)
						v11:UpdateClientData(v3, "sessionId", t6[v3])
					end
					t3.sessionId = t6[v3]
				end
				table.insert(t5, t3)
				if #t5 >= 1000 then
					t:SendMarkers()
				end
				if p1 then
					return
				end
				local v6 = table.find(t4, t2)
				if not v6 then
					return
				end
				table.remove(t4, v6)
			end
			t2.resolved = resolved
			local function addTask(p1, p2) --[[ addTask | Line: 298 | Upvalues: t2 (copy) ]]
				if t2.tasks[p1] or (p2 == nil or p2.Connected ~= true) then
					return
				end
				local v1 = t2
				v1.activeTasks = v1.activeTasks + 1
				t2.tasks[p1] = p2
				if not p2 then
					return
				end
				t2.pendingCleaner:Add(p2)
			end
			local function completeTask(p1) --[[ completeTask | Line: 309 | Upvalues: t2 (copy), resolved (copy) ]]
				if not t2.tasks[p1] then
					return
				end
				t2.tasks[p1] = nil
				local v1 = t2
				v1.activeTasks = v1.activeTasks - 1
				if not (t2.activeTasks <= 0) then
					return
				end
				resolved()
			end
			if v2.tasks then
				for v13, v22 in v2.tasks do
					local v32 = v8.new(function() --[[ Line: 323 | Upvalues: v13 (copy), t2 (copy), resolved (copy) ]]
						local v1 = v13
						if not t2.tasks[v1] then
							return
						end
						t2.tasks[v1] = nil
						local v2 = t2
						v2.activeTasks = v2.activeTasks - 1
						if not (t2.activeTasks <= 0) then
							return
						end
						resolved()
					end)
					if not t2.tasks[v13] and (v32 ~= nil and v32.Connected == true) then
						t2.activeTasks = t2.activeTasks + 1
						t2.tasks[v13] = v32
						if v32 then
							t2.pendingCleaner:Add(v32)
						end
					end
					task.spawn(function() --[[ Line: 329 | Upvalues: v22 (copy), p4 (ref), v32 (copy), v13 (copy), t2 (copy), resolved (copy) ]]
						v22(p4)
						v32:Disconnect()
						local v1 = v13
						if not t2.tasks[v1] then
							return
						end
						t2.tasks[v1] = nil
						local v2 = t2
						v2.activeTasks = v2.activeTasks - 1
						if not (t2.activeTasks <= 0) then
							return
						end
						resolved()
					end)
				end
			end
			local v42 = v1.new(v12)
			t2.pendingCleaner:Add(v42)
			t2.pendingCleaner:Add(v42:OnEnd(function() --[[ Line: 340 | Upvalues: t2 (copy), v11 (ref), v5 (ref), v15 (ref), v4 (ref), resolved (copy) ]]
				if not t2.tasks.clientInfo then
					return
				end
				if not v11:IsClientInfoResolved(v5) and v15 == false then
					v4.GBWarn("Failed to resolve client info, did you forget to :Setup() Gamebeast SDK on the client?")
					v15 = true
				end
				if not t2.tasks.clientInfo then
					return
				end
				t2.tasks.clientInfo = nil
				local v1 = t2
				v1.activeTasks = v1.activeTasks - 1
				if not (t2.activeTasks <= 0) then
					return
				end
				resolved()
			end))
			local v52 = v11:OnClientInfoResolved(v5, function() --[[ Line: 354 | Upvalues: t2 (copy), resolved (copy) ]]
				if not t2.tasks.clientInfo then
					return
				end
				t2.tasks.clientInfo = nil
				local v1 = t2
				v1.activeTasks = v1.activeTasks - 1
				if not (t2.activeTasks <= 0) then
					return
				end
				resolved()
			end)
			if not t2.tasks.clientInfo and (v52 ~= nil and v52.Connected == true) then
				t2.activeTasks = t2.activeTasks + 1
				t2.tasks.clientInfo = v52
				if v52 then
					t2.pendingCleaner:Add(v52)
				end
			end
			local v62 = v10:OnResolved(v5, function(p1) --[[ Line: 359 | Upvalues: t3 (ref), t2 (copy), resolved (copy) ]]
				if p1 and p1._gbDeeplink then
					t3.properties.deeplinkData = {
						id = p1._gbDeeplink.deeplinkId,
						interactionId = p1._gbDeeplink.interactionId
					}
				end
				if not t2.tasks.launchData then
					return
				end
				t2.tasks.launchData = nil
				local v1 = t2
				v1.activeTasks = v1.activeTasks - 1
				if not (t2.activeTasks <= 0) then
					return
				end
				resolved()
			end)
			if not t2.tasks.launchData and (v62 ~= nil and v62.Connected == true) then
				t2.activeTasks = t2.activeTasks + 1
				t2.tasks.launchData = v62
				if v62 then
					t2.pendingCleaner:Add(v62)
				end
			end
			if t3.properties.experimentGroupId == nil then
				local v7 = v6:ListenForPlayerAssignment(v5, function(p1) --[[ Line: 371 | Upvalues: t3 (ref), t2 (copy), resolved (copy) ]]
					t3.properties.experimentGroupId = p1
					if not t2.tasks.experimentGroup then
						return
					end
					t2.tasks.experimentGroup = nil
					local v1 = t2
					v1.activeTasks = v1.activeTasks - 1
					if not (t2.activeTasks <= 0) then
						return
					end
					resolved()
				end)
				if not t2.tasks.experimentGroup and (v7 ~= nil and v7.Connected == true) then
					t2.activeTasks = t2.activeTasks + 1
					t2.tasks.experimentGroup = v7
					if v7 then
						t2.pendingCleaner:Add(v7)
					end
				end
			end
			if t2.activeTasks <= 0 then
				resolved()
			else
				table.insert(t4, t2)
			end
		else
			table.insert(t5, t3)
			if not (#t5 >= 1000) then
				return
			end
			t:SendMarkers()
		end
	end)
end
function t.FireMarker(p1, ...) --[[ FireMarker | Line: 387 ]]
	p1:_createMarker("server", ...)
end
function t.SDKMarker(p1, ...) --[[ SDKMarker | Line: 392 ]]
	p1:_createMarker("sdk", ...)
end
function t.ClearSessionId(p1, p2) --[[ ClearSessionId | Line: 396 | Upvalues: t6 (copy) ]]
	t6[p2] = nil
end
function t.Init(p1) --[[ Init | Line: 401 | Upvalues: Players (copy), t (copy), v14 (ref), v13 (ref), v7 (copy), v5 (copy), t4 (copy) ]]
	Players.ChildRemoved:Connect(function(p1) --[[ Line: 404 | Upvalues: t (ref) ]]
		task.defer(function() --[[ Line: 405 | Upvalues: t (ref), p1 (copy) ]]
			t:ClearSessionId(p1)
		end)
	end)
	task.spawn(function() --[[ Line: 411 | Upvalues: v14 (ref), v13 (ref), p1 (copy), v7 (ref) ]]
		while task.wait(5) do
			if v13 <= tick() - v14 then
				p1:SendMarkers()
			end
			if not v7:WaitForConfigsReady() then
				continue
			end
			v13 = v7:GetActiveConfig("GBConfigs").GBRates.EngagementMarkers
		end
	end)
	v5:OnFinalRequestCall(function() --[[ Line: 426 | Upvalues: t4 (ref), p1 (copy) ]]
		for v1, v2 in t4 do
			v2.resolved(true)
		end
		p1:SendMarkers()
	end)
end
return t