-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local v1 = shared.GBMod("GBRequests")
local v2 = shared.GBMod("LocalizationCache")
local Signal = require(script.Parent.Parent.Parent.Shared.Modules.Signal)
local v3 = shared.GBMod("Utilities")
local v4 = shared.GBMod("ServerClientInfoHandler")
local v5 = shared.GBMod("SignalConnection")
local v6 = shared.GBMod("Cleaner")
require(script.Parent.Parent.Parent.Types)
local t2 = {
	inputType = function(p1) --[[ inputType | Line: 94 | Upvalues: v4 (copy) ]]
		v4:WaitUntilClientInfoResolved(p1)
		return v4:GetClientInfo(p1, "inputType")
	end,
	device = function(p1) --[[ device | Line: 98 | Upvalues: v4 (copy) ]]
		v4:WaitUntilClientInfoResolved(p1)
		return v4:GetClientInfo(p1, "device")
	end,
	deviceSubType = function(p1) --[[ deviceSubType | Line: 102 | Upvalues: v4 (copy) ]]
		v4:WaitUntilClientInfoResolved(p1)
		return v4:GetClientInfo(p1, "deviceSubType")
	end,
	country = function(p1) --[[ country | Line: 106 | Upvalues: v2 (copy) ]]
		return v2:GetRegionId(p1)
	end,
	language = function(p1) --[[ language | Line: 109 | Upvalues: v2 (copy) ]]
		return v2:GetLocaleId(p1)
	end,
	placeId = function() --[[ placeId | Line: 112 ]]
		return game.PlaceId
	end,
	placeVersion = function() --[[ placeVersion | Line: 115 ]]
		return game.PlaceVersion
	end
}
local t3 = {
	placeId = function() --[[ placeId | Line: 130 ]]
		return game.PlaceId
	end,
	placeVersion = function() --[[ placeVersion | Line: 133 ]]
		return game.PlaceVersion
	end
}
local v7 = nil
local v8 = nil
local t4 = {}
local v9 = nil
t.AssignedServerGroupId = nil
t.AssignedGroupIdByPlayer = {}
t.OnServerGroupIdChanged = Signal.new()
t.OnPlayerGroupIdChanged = Signal.new()
t.AssignedServerConfig = nil
t.AssignedConfigByPlayer = {}
t.OnAssignedServerConfigChanged = Signal.new()
t.OnAssignedPlayerConfigChanged = Signal.new()
t.CanonicalServerConfig = nil
t.OnAssignmentDisabling = Signal.new()
function t.UpdateStateFromAvailableExperiments(p1, p2, p3) --[[ UpdateStateFromAvailableExperiments | Line: 214 | Upvalues: t (copy), v8 (ref), v7 (ref), v3 (copy), t4 (copy) ]]
	if p3 then
		t.CanonicalServerConfig = p3
	end
	if v8 and v8.timestampMs >= p2.timestampMs then
		return
	end
	v8 = p2
	local groups = p2.groups
	local v1 = v7 ~= nil
	if #groups > 0 and not v7 then
		enableAssignment()
	elseif #groups == 0 and v7 then
		disableAssignment()
	end
	if v7 then
		local t2 = {}
		local v2 = false
		for v32, v4 in groups do
			t2[v4.id] = true
			if initializeActiveGroupState(v4) then
				v2 = true
			end
			clearUnfetchedActiveGroupState(v4.id, true)
		end
		if v1 then
			for v5 in v7.unfetchedActiveGroupStateById do
				if not t2[v5] then
					v3.GBLog("Unfetched experiment group terminated:", v5)
					clearUnfetchedActiveGroupState(v5)
				end
			end
			local t3 = {}
			if t.AssignedServerGroupId and not t2[t.AssignedServerGroupId] then
				table.insert(t3, t.AssignedServerGroupId)
			end
			for v6 in v7.activeGroupStateById do
				if not t2[v6] then
					table.insert(t3, v6)
				end
			end
			if #t3 > 0 then
				v3.GBLog("Clearing terminated experiment groups:", t3)
				reassignTerminatedGroupMembers(t3)
				for v72, v82 in t3 do
					clearActiveGroupState(v82, true)
				end
			end
			if v2 then
				queueAssignmentForNonAssignedPlayers()
			end
		else
			executeAssignmentRequest()
		end
	end
	for v9, v10 in p2.scheduled do
		local v11 = tonumber(v9)
		if not t4[v11] then
			local v12 = v10[1]
			local v13 = v10[2]
			local v15 = math.max(0, v12 - DateTime.now().UnixTimestampMillis) / 1000
			v3.GBLog("Scheduling future experiment group wake-up timer:", v11, v12, "in", v15, "sec")
			t4[v11] = task.delay(v15, function() --[[ Line: 311 | Upvalues: t4 (ref), v11 (copy), v7 (ref), v13 (copy) ]]
				t4[v11] = nil
				if not v7 then
					queueAvailableExperimentsSnapshotUpdate()
					return
				end
				initializeUnfetchedActiveGroupState(v11, v13)
				queueAvailableExperimentsSnapshotUpdate()
			end)
		end
	end
	for v16, v17 in t4 do
		if not p2.scheduled[tostring(v16)] then
			v3.GBLog("Future experiment group", v16, "terminated, cancelling timer")
			task.cancel(v17)
			t4[v16] = nil
		end
	end
end
function t.ProcessExperimentReassignmentRequest(p1, p2) --[[ ProcessExperimentReassignmentRequest | Line: 333 | Upvalues: v3 (copy), Players (copy) ]]
	if table.find(p2.gameserverIds, (v3.getServerId())) then
		v3.GBLog("Queueing reassignment as requested for server...")
		queueAssignment(Players:GetPlayers())
	end
	for v2, v32 in p2.playerIds do
		local v4 = tonumber(v32)
		local v5 = if v4 then Players:GetPlayerByUserId(v4) else v4
		if v5 then
			v3.GBLog("Queueing reassignment as requested for player:", v5.Name)
			queueAssignment({ v5 })
		end
	end
end
function t.ListenForPlayerAssignment(p1, p2, p3) --[[ ListenForPlayerAssignment | Line: 359 | Upvalues: v6 (copy), v5 (copy), v7 (ref), t (copy), Players (copy) ]]
	local v1 = v6.new()
	local v2 = v5.new(function() --[[ Line: 361 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
	local function resolve(p1) --[[ resolve | Line: 365 | Upvalues: v2 (copy), p3 (copy) ]]
		v2:Disconnect()
		task.spawn(p3, p1)
		return v2
	end
	if not v7 then
		v2:Disconnect()
		task.spawn(p3, nil)
		return v2
	end
	if t.AssignedServerGroupId then
		v2:Disconnect()
		task.spawn(p3, t.AssignedServerGroupId)
		return v2
	end
	if t.AssignedGroupIdByPlayer[p2] then
		v2:Disconnect()
		task.spawn(p3, t.AssignedGroupIdByPlayer[p2])
	else
		v1:Add(t.OnPlayerGroupIdChanged:Connect(function(p1, p22) --[[ Line: 388 | Upvalues: p2 (copy), v2 (copy), p3 (copy) ]]
			if p1 ~= p2 or not p22 then
				return
			end
			v2:Disconnect()
			task.spawn(p3, p22)
		end))
		v1:Add(t.OnServerGroupIdChanged:Connect(function(p1) --[[ Line: 394 | Upvalues: v2 (copy), p3 (copy) ]]
			if not p1 then
				return
			end
			v2:Disconnect()
			task.spawn(p3, p1)
		end))
		v1:Add(t.OnAssignmentDisabling:Connect(function() --[[ Line: 400 | Upvalues: v2 (copy), p3 (copy) ]]
			v2:Disconnect()
			task.spawn(p3, nil)
		end))
		v1:Add(Players.PlayerRemoving:Connect(function(p1) --[[ Line: 404 | Upvalues: p2 (copy), v2 (copy), p3 (copy) ]]
			if p1 ~= p2 then
				return
			end
			v2:Disconnect()
			task.spawn(p3, nil)
		end))
	end
	return v2
end
function t.GetActiveGroupMetadata(p1, p2) --[[ GetActiveGroupMetadata | Line: 417 | Upvalues: v7 (ref) ]]
	if not v7 then
		return nil
	end
	local v1 = v7.activeGroupStateById[p2]
	if v1 then
		return {
			experimentName = v1.group.experimentName,
			groupName = v1.group.groupName
		}
	else
		return nil
	end
end
function enableAssignment() --[[ enableAssignment | Line: 439 | Upvalues: v7 (ref), Players (copy), t (copy), v3 (copy) ]]
	if not v7 then
		v7 = {
			deferredBulkAssignmentThread = nil,
			playerIdsPendingAssignment = {},
			playerJoinListener = Players.PlayerAdded:Connect(function(p1) --[[ Line: 447 | Upvalues: t (ref) ]]
				if t.AssignedServerGroupId then
					return
				end
				queueAssignment({ p1 })
			end),
			playerLeaveListener = Players.PlayerRemoving:Connect(function(p1) --[[ Line: 452 ]]
				task.defer(function() --[[ Line: 453 | Upvalues: p1 (copy) ]]
					setAssignedPlayerGroupId(p1, nil)
				end)
			end),
			activeGroupStateById = {},
			unfetchedActiveGroupStateById = {}
		}
		v3.GBLog("Started requesting experiment assignment")
		v3.GBLog("Queuing initial assignment...")
		queueAssignment(Players:GetPlayers())
	end
end
function disableAssignment() --[[ disableAssignment | Line: 475 | Upvalues: v7 (ref), t (copy), v3 (copy) ]]
	if not v7 then
		return
	end
	t.OnAssignmentDisabling:Fire()
	setAssignedServerGroupId(nil)
	for v1 in t.AssignedGroupIdByPlayer do
		setAssignedPlayerGroupId(v1, nil)
	end
	for v2 in v7.activeGroupStateById do
		clearActiveGroupState(v2)
	end
	for v32 in v7.unfetchedActiveGroupStateById do
		clearUnfetchedActiveGroupState(v32)
	end
	v7.playerJoinListener:Disconnect()
	v7.playerLeaveListener:Disconnect()
	if not v7.deferredBulkAssignmentThread then
		v7 = nil
		v3.GBLog("Stopped requesting experiment assignment")
		return
	end
	task.cancel(v7.deferredBulkAssignmentThread)
	v7 = nil
	v3.GBLog("Stopped requesting experiment assignment")
end
function queueAssignment(p1) --[[ queueAssignment | Line: 511 | Upvalues: v7 (ref) ]]
	local v1 = v7
	assert(v1, "Assignment has not been started")
	for v2, v3 in p1 do
		v7.playerIdsPendingAssignment[v3.UserId] = true
	end
	if v7.deferredBulkAssignmentThread then
		return
	end
	v7.deferredBulkAssignmentThread = task.delay(1, function() --[[ Line: 520 | Upvalues: v7 (ref) ]]
		v7.deferredBulkAssignmentThread = nil
		executeAssignmentRequest()
	end)
end
function executeAssignmentRequest() --[[ executeAssignmentRequest | Line: 530 | Upvalues: v7 (ref), v3 (copy), v1 (copy), Players (copy), t (copy) ]]
	local v12 = v7
	assert(v12, "Assignment has not been started")
	if v12.deferredBulkAssignmentThread then
		task.cancel(v12.deferredBulkAssignmentThread)
		v12.deferredBulkAssignmentThread = nil
	end
	local t2 = {}
	for v2 in v12.playerIdsPendingAssignment do
		table.insert(t2, v2)
	end
	v12.playerIdsPendingAssignment = {}
	local t3 = {}
	for v32 in v12.activeGroupStateById do
		table.insert(t3, v32)
	end
	local t4 = {}
	for v4, v5 in v12.unfetchedActiveGroupStateById do
		table.insert(t4, function() --[[ Line: 557 | Upvalues: v5 (copy) ]]
			v5.onFetched:Wait()
		end)
	end
	local t5 = { function() --[[ Line: 562 | Upvalues: v3 (ref), t4 (copy) ]]
			v3.waitForAllCalls(t4)
		end, function() --[[ Line: 565 ]]
			task.wait(3)
		end }
	v3.waitForAnyCall(t5)
	if v7 ~= v12 then
		return
	end
	local v6, v72 = getMetadataForAssignment(t2, 6)
	if v7 ~= v12 then
		return
	end
	v3.GBLog((("Requesting assignment (playerIds: %*)..."):format((table.concat(t2, ", ")))))
	local v8, v9 = v1:GBRequestAsync("v1/experiments/assignments", {
		allowGameserverAssignment = true,
		playerIds = t2,
		knownGroupIds = t3,
		serverProperties = v6,
		playerProperties = v72
	})
	if v7 ~= v12 then
		return
	end
	v3.GBLog("Received assignment response:", v8, v9)
	if v8 then
		if not v9 then
			disableAssignment()
			return
		end
		if v9.groups then
			for v10, v11 in v9.groups do
				initializeActiveGroupState(v11)
				clearUnfetchedActiveGroupState(v11.id, true)
			end
		end
		if v9.targetType == "gameserver" then
			setAssignedServerGroupId(v9.gameserverGroupId)
			for v122 in t.AssignedGroupIdByPlayer do
				setAssignedPlayerGroupId(v122, nil)
			end
		else
			if v9.targetType ~= "player" then
				return
			end
			local t6 = {}
			for v13, v14 in v9.playerIdsByGroupId do
				local v15 = tonumber(v13)
				for v16, v17 in v14 do
					local v18 = tonumber(v17)
					local v19 = if v18 then Players:GetPlayerByUserId(v18) else v18
					if v19 then
						setAssignedPlayerGroupId(v19, v15)
					end
					if v18 then
						t6[v18] = true
					end
				end
			end
			for v20, v21 in t2 do
				if not t6[v21] then
					local v22 = Players:GetPlayerByUserId(v21)
					if v22 then
						setAssignedPlayerGroupId(v22, nil)
					end
				end
			end
			setAssignedServerGroupId(nil)
		end
	else
		v3.GBWarn("Failed to get experiment assignment:", v9)
		local t6 = {}
		for v23, v24 in t2 do
			local v25 = Players:GetPlayerByUserId(v24)
			if v25 then
				table.insert(t6, v25)
			end
		end
		queueAssignment(t6)
	end
end
function setAssignedPlayerGroupId(p1, p2) --[[ setAssignedPlayerGroupId | Line: 662 | Upvalues: v7 (ref), v3 (copy), t (copy) ]]
	assert(v7, "Assignment has not been started")
	assert(if p2 == nil then true else v7.activeGroupStateById[p2], "Experiment group state has not been initialized")
	v3.GBLog("Setting assigned experiment group ID for player:", p1.UserId, p2)
	local v32 = t.AssignedGroupIdByPlayer[p1]
	if v32 == p2 then
		v3.GBLog("Skipping setting assigned experiment group ID for player:", p1.UserId, (("(unchanged %* -> %*)"):format(p2, v32)))
		return
	end
	local v4 = if v32 then v7.activeGroupStateById[v32] else v32
	if v4 then
		v3.GBLog("Clearing player from previous group state:", p1.UserId, v32)
		v4.playerSet[p1] = nil
	end
	t.AssignedGroupIdByPlayer[p1] = p2
	t.OnPlayerGroupIdChanged:Fire(p1, p2)
	if p2 then
		local v5 = v7.activeGroupStateById[p2]
		t.AssignedConfigByPlayer[p1] = v5.group.configs
		t.OnAssignedPlayerConfigChanged:Fire(p1, v5.group.configs)
		v7.activeGroupStateById[p2].playerSet[p1] = true
	else
		t.AssignedConfigByPlayer[p1] = nil
		t.OnAssignedPlayerConfigChanged:Fire(p1, nil)
	end
end
function setAssignedServerGroupId(p1) --[[ setAssignedServerGroupId | Line: 704 | Upvalues: v7 (ref), t (copy) ]]
	assert(v7, "Assignment has not been started")
	assert(if p1 == nil then true else v7.activeGroupStateById[p1], "Experiment group state has not been initialized")
	if t.AssignedServerGroupId == p1 then
		return
	end
	t.AssignedServerGroupId = p1
	t.OnServerGroupIdChanged:Fire(p1)
	if p1 then
		local v3 = v7.activeGroupStateById[p1]
		t.AssignedServerConfig = v3.group.configs
		t.OnAssignedServerConfigChanged:Fire(v3.group.configs)
	else
		t.AssignedServerConfig = nil
		t.OnAssignedServerConfigChanged:Fire(nil)
	end
end
function getDoAvailableExperimentsRemain(p1) --[[ getDoAvailableExperimentsRemain | Line: 729 | Upvalues: v7 (ref) ]]
	if not v7 then
		return false
	end
	local t = {}
	if p1 then
		for v1, v2 in p1 do
			t[v2] = true
		end
	end
	for v3, v4 in v7.activeGroupStateById do
		if not (t[v3] or v4.group.endsAt and DateTime.now().UnixTimestampMillis >= v4.group.endsAt) then
			return true
		end
	end
	for v5, v6 in v7.unfetchedActiveGroupStateById do
		if not (t[v5] or v6.endTime and DateTime.now().UnixTimestampMillis >= v6.endTime) then
			return true
		end
	end
	return false
end
function reassignTerminatedGroupMembers(p1) --[[ reassignTerminatedGroupMembers | Line: 774 | Upvalues: v7 (ref), v3 (copy), t (copy), Players (copy) ]]
	assert(v7, "Assignment has not been started")
	local t2 = {}
	local v2 = false
	for v32, v4 in p1 do
		local v5 = v7.activeGroupStateById[v4]
		if v5 then
			for v6 in v5.playerSet do
				v3.GBLog("Queuing reassignment for player from terminated experiment group:", v4, v6.Name)
				table.insert(t2, v6)
			end
		end
		if t.AssignedServerGroupId == v4 then
			v3.GBLog("Queuing reassignment for server from terminated experiment group:", v4)
			v2 = true
		end
	end
	if not getDoAvailableExperimentsRemain(p1) then
		v3.GBLog("No experiments available, skipping reassignment")
		return
	end
	if v2 then
		queueAssignment(Players:GetPlayers())
	end
	if not (#t2 > 0) then
		return
	end
	queueAssignment(t2)
end
function initializeActiveGroupState(p1) --[[ initializeActiveGroupState | Line: 828 | Upvalues: v7 (ref), v3 (copy), t (copy) ]]
	assert(v7, "Assignment has not been started")
	local v2 = v7.activeGroupStateById[p1.id]
	if v2 then
		local configs_2 = p1.configs
		if v3.primativeDeepEqual(v2.group.configs, configs_2) then
			return false
		end
		v3.GBLog("Updating cached configs for experiment group:", p1.id)
		v2.group = p1
		if t.AssignedServerGroupId == p1.id then
			v3.GBLog("Re-applying updated configs to assigned server")
			t.AssignedServerConfig = configs_2
			t.OnAssignedServerConfigChanged:Fire(configs_2)
		end
		for v32 in v2.playerSet do
			v3.GBLog("Re-applying updated configs to assigned player:", v32.Name)
			t.AssignedConfigByPlayer[v32] = configs_2
			t.OnAssignedPlayerConfigChanged:Fire(v32, configs_2)
		end
		return false
	else
		v7.activeGroupStateById[p1.id] = {
			group = p1,
			playerSet = {}
		}
		if not p1.endsAt then
			return true
		end
		local v5 = math.max(0, p1.endsAt - DateTime.now().UnixTimestampMillis) / 1000
		local v6 = v7.activeGroupStateById[p1.id]
		v6.experimentEndTimer = task.delay(v5 + 0, function() --[[ Line: 875 | Upvalues: v6 (copy), v3 (ref), p1 (copy) ]]
			v6.experimentEndTimer = nil
			v3.GBLog("Group", p1.id, "experiment ended, reassigning members & clearing...")
			reassignTerminatedGroupMembers({ p1.id })
			clearActiveGroupState(p1.id, true)
			if getDoAvailableExperimentsRemain() then
				return
			end
			v3.GBLog("No experiments remain, stopping assignment")
			disableAssignment()
		end)
		return true
	end
end
function clearActiveGroupState(p1, p2) --[[ clearActiveGroupState | Line: 901 | Upvalues: v7 (ref), t (copy), v3 (copy) ]]
	if not v7 then
		return
	end
	local v1 = v7.activeGroupStateById[p1]
	if not v1 then
		return
	end
	if not p2 then
		assert(next(v1.playerSet) == nil, "Cannot clear active experiment group state while players are assigned to it")
		assert(if t.AssignedServerGroupId == p1 then false else true, "Cannot clear active experiment group state while server is assigned to it")
	end
	if not v1.experimentEndTimer then
		v7.activeGroupStateById[p1] = nil
		v3.GBLog("Cleared active experiment group state:", p1)
		return
	end
	task.cancel(v1.experimentEndTimer)
	v7.activeGroupStateById[p1] = nil
	v3.GBLog("Cleared active experiment group state:", p1)
end
function initializeUnfetchedActiveGroupState(p1, p2) --[[ initializeUnfetchedActiveGroupState | Line: 940 | Upvalues: v7 (ref), Signal (copy), v3 (copy) ]]
	assert(v7, "Assignment has not been started")
	if v7.activeGroupStateById[p1] then
		return
	end
	if v7.unfetchedActiveGroupStateById[p1] then
		return
	end
	v7.unfetchedActiveGroupStateById[p1] = {
		endTime = p2,
		onFetched = Signal.new()
	}
	if p2 then
		local v32 = math.max(0, p2 - DateTime.now().UnixTimestampMillis) / 1000
		local v4 = v7.unfetchedActiveGroupStateById[p1]
		v4.experimentEndTimer = task.delay(v32, function() --[[ Line: 961 | Upvalues: v4 (copy), v3 (ref), p1 (copy) ]]
			v4.experimentEndTimer = nil
			v3.GBLog("Unfetched group", p1, "experiment ended, clearing")
			clearUnfetchedActiveGroupState(p1)
			if getDoAvailableExperimentsRemain() then
				return
			end
			v3.GBLog("No experiments remain, stopping assignment")
			disableAssignment()
		end)
	end
	v3.GBLog("Initialized state for unfetched active experiment group", p1, "until", p2)
end
function clearUnfetchedActiveGroupState(p1, p2) --[[ clearUnfetchedActiveGroupState | Line: 983 | Upvalues: v7 (ref), v3 (copy) ]]
	if not v7 then
		return
	end
	local v1 = v7.unfetchedActiveGroupStateById[p1]
	if not v1 then
		return
	end
	if v1.experimentEndTimer then
		task.cancel(v1.experimentEndTimer)
	end
	if not p2 then
		v7.unfetchedActiveGroupStateById[p1] = nil
		v3.GBLog("Cleared unfetched active experiment group state:", p1)
		return
	end
	v1.onFetched:Fire()
	v1.onFetched:Destroy()
	v7.unfetchedActiveGroupStateById[p1] = nil
	v3.GBLog("Cleared unfetched active experiment group state:", p1)
end
function queueAssignmentForNonAssignedPlayers() --[[ queueAssignmentForNonAssignedPlayers | Line: 1015 | Upvalues: v7 (ref), Players (copy), t (copy), v3 (copy) ]]
	if not v7 then
		return
	end
	local t2 = {}
	for v1, v2 in Players:GetPlayers() do
		if not t.AssignedGroupIdByPlayer[v2] then
			table.insert(t2, v2)
		end
	end
	if not (#t2 > 0) then
		return
	end
	v3.GBLog("New experiment groups available, queueing assignment for non-assigned players", t2)
	queueAssignment(t2)
end
function queueAvailableExperimentsSnapshotUpdate() --[[ queueAvailableExperimentsSnapshotUpdate | Line: 1047 | Upvalues: v9 (ref), v1 (copy), v3 (copy), t (copy) ]]
	if not v9 then
		v9 = task.delay(1, function() --[[ Line: 1052 | Upvalues: v9 (ref), v1 (ref), v3 (ref), t (ref) ]]
			v9 = nil
			local v12, v2 = v1:GBRequestAsync("v1/experiments")
			if v12 then
				t:UpdateStateFromAvailableExperiments(v2)
			else
				v3.GBWarn("Failed to fetch available experiments snapshot:", v2)
			end
		end)
	end
end
function getMetadataForAssignment(p1, p2) --[[ getMetadataForAssignment | Line: 1072 | Upvalues: v8 (ref), t3 (copy), Players (copy), t2 (copy), v3 (copy) ]]
	local v1 = v8
	if not (v1 and (v1.targetType and v1.requiredProperties)) then
		return nil, nil
	end
	local t = {}
	local t4 = {}
	local t5 = {}
	if v1.targetType == "gameserver" then
		for v2, v32 in v1.requiredProperties do
			if t3[v32] then
				local function f4() --[[ Line: 1091 | Upvalues: t (copy), v32 (copy), t3 (ref) ]]
					t[v32] = t3[v32]()
				end
				table.insert(t5, f4)
			end
		end
	elseif v1.targetType == "player" and p1 then
		for v5, v6 in p1 do
			local v7 = Players:GetPlayerByUserId(v6)
			if v7 then
				local v82 = tostring(v6)
				t4[v82] = {}
				local v9 = t4[v82]
				for v10, v11 in v1.requiredProperties do
					if t2[v11] then
						local function f12() --[[ Line: 1109 | Upvalues: v9 (copy), v11 (copy), t2 (ref), v7 (copy) ]]
							v9[v11] = t2[v11](v7)
						end
						table.insert(t5, f12)
					end
				end
			end
		end
	end
	if p2 then
		local t6 = { function() --[[ Line: 1120 | Upvalues: v3 (ref), t5 (copy) ]]
				v3.waitForAllCalls(t5)
			end, function() --[[ Line: 1123 | Upvalues: p2 (copy) ]]
				task.wait(p2)
			end }
		v3.waitForAnyCall(t6)
	else
		v3.waitForAllCalls(t5)
	end
	for v13, v14 in t4 do
		if next(v14) == nil then
			t4[v13] = nil
		end
	end
	if v1.targetType == "gameserver" and next(t) then
		return t, nil
	end
	if v1.targetType == "player" and next(t4) then
		return nil, t4
	else
		return nil, nil
	end
end
return t