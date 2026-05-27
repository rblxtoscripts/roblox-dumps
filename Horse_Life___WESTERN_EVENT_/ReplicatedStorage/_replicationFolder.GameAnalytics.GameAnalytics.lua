-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local t = {
	EGAResourceFlowType = Sonar(script.GAResourceFlowType),
	EGAProgressionStatus = Sonar(script.GAProgressionStatus),
	EGAErrorSeverity = Sonar(script.GAErrorSeverity)
}
local v1 = Sonar(script.Logger)
local v2 = Sonar(script.Threading)
local v3 = Sonar(script.State)
local v4 = Sonar(script.Validation)
local v5 = Sonar(script.Store)
local v6 = Sonar(script.Events)
local v7 = Sonar(script.Utilities)
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalizationService = game:GetService("LocalizationService")
game:GetService("ScriptContext")
local v8 = Sonar(script.Postie)
local v9 = nil
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
local t7 = {}
local function addToInitializationQueue(p1, ...) --[[ addToInitializationQueue | Line: 39 | Upvalues: t6 (ref), v1 (copy) ]]
	if t6 == nil then
		v1:w("Initialization queue already cleared.")
	else
		table.insert(t6, {
			Func = p1,
			Args = { ... }
		})
		v1:i("Added event to initialization queue")
	end
end
local function addToInitializationQueueByUserId(p1, p2, ...) --[[ addToInitializationQueueByUserId | Line: 53 | Upvalues: t (copy), t7 (copy), v1 (copy) ]]
	if t:isPlayerReady(p1) then
		v1:w("Player initialization queue already cleared.")
		return
	end
	if t7[p1] == nil then
		t7[p1] = {}
	end
	table.insert(t7[p1], {
		Func = p2,
		Args = { ... }
	})
	v1:i("Added event to player initialization queue")
end
local function isSdkReady(p1) --[[ isSdkReady | Line: 73 | Upvalues: v3 (copy), v1 (copy) ]]
	local v12 = p1.playerId or nil
	local v2 = p1.needsInitialized or true
	local v32 = p1.shouldWarn or false
	local v4 = p1.message or ""
	if v2 and not v3.Initialized then
		if not v32 then
			return false
		end
		v1:w(v4 .. " SDK is not initialized")
	elseif v2 and (v12 and not v3:isEnabled(v12)) then
		if not v32 then
			return false
		end
		v1:w(v4 .. " SDK is disabled")
	else
		if not v2 or (not v12 or v3:sessionIsStarted(v12)) then
			return true
		end
		if not v32 then
			return false
		end
		v1:w(v4 .. " Session has not started yet")
	end
	return false
end
function t.configureAvailableCustomDimensions01(p1, p2) --[[ configureAvailableCustomDimensions01 | Line: 109 | Upvalues: isSdkReady (copy), v1 (copy), v3 (copy) ]]
	if isSdkReady({
		needsInitialized = true,
		shouldWarn = false
	}) then
		v1:w("Available custom dimensions must be set before SDK is initialized")
	else
		v3:setAvailableCustomDimensions01(p2)
	end
end
function t.configureAvailableCustomDimensions02(p1, p2) --[[ configureAvailableCustomDimensions02 | Line: 118 | Upvalues: isSdkReady (copy), v1 (copy), v3 (copy) ]]
	if isSdkReady({
		needsInitialized = true,
		shouldWarn = false
	}) then
		v1:w("Available custom dimensions must be set before SDK is initialized")
	else
		v3:setAvailableCustomDimensions02(p2)
	end
end
function t.configureAvailableCustomDimensions03(p1, p2) --[[ configureAvailableCustomDimensions03 | Line: 127 | Upvalues: isSdkReady (copy), v1 (copy), v3 (copy) ]]
	if isSdkReady({
		needsInitialized = true,
		shouldWarn = false
	}) then
		v1:w("Available custom dimensions must be set before SDK is initialized")
	else
		v3:setAvailableCustomDimensions03(p2)
	end
end
function t.configureAvailableResourceCurrencies(p1, p2) --[[ configureAvailableResourceCurrencies | Line: 136 | Upvalues: isSdkReady (copy), v1 (copy), v6 (copy) ]]
	if isSdkReady({
		needsInitialized = true,
		shouldWarn = false
	}) then
		v1:w("Available resource currencies must be set before SDK is initialized")
	else
		v6:setAvailableResourceCurrencies(p2)
	end
end
function t.configureAvailableResourceItemTypes(p1, p2) --[[ configureAvailableResourceItemTypes | Line: 145 | Upvalues: isSdkReady (copy), v1 (copy), v6 (copy) ]]
	if isSdkReady({
		needsInitialized = true,
		shouldWarn = false
	}) then
		v1:w("Available resource item types must be set before SDK is initialized")
	else
		v6:setAvailableResourceItemTypes(p2)
	end
end
function t.configureBuild(p1, p2) --[[ configureBuild | Line: 154 | Upvalues: isSdkReady (copy), v1 (copy), v6 (copy) ]]
	if isSdkReady({
		needsInitialized = true,
		shouldWarn = false
	}) then
		v1:w("Build version must be set before SDK is initialized.")
	else
		v6:setBuild(p2)
	end
end
function t.configureAvailableGamepasses(p1, p2) --[[ configureAvailableGamepasses | Line: 163 | Upvalues: isSdkReady (copy), v1 (copy), v3 (copy) ]]
	if isSdkReady({
		needsInitialized = true,
		shouldWarn = false
	}) then
		v1:w("Available gamepasses must be set before SDK is initialized.")
	else
		v3:setAvailableGamepasses(p2)
	end
end
function t.startNewSession(p1, p2, p3) --[[ startNewSession | Line: 172 | Upvalues: v2 (copy), v3 (copy), v1 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 173 | Upvalues: v3 (ref), v1 (ref), p2 (copy), p3 (copy) ]]
		if not v3:isEventSubmissionEnabled() then
			return
		end
		if v3.Initialized then
			v3:startNewSession(p2, p3)
		else
			v1:w("Cannot start new session. SDK is not initialized yet.")
		end
	end)
end
function t.endSession(p1, p2) --[[ endSession | Line: 187 | Upvalues: v2 (copy), v3 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 188 | Upvalues: v3 (ref), p2 (copy) ]]
		if v3:isEventSubmissionEnabled() then
			v3:endSession(p2)
		end
	end)
end
function t.filterForBusinessEvent(p1, p2) --[[ filterForBusinessEvent | Line: 196 ]]
	return string.gsub(p2, "[^A-Za-z0-9%s%-_%.%(%)!%?]", "")
end
function t.getPlayerWithSessionReady(p1) --[[ getPlayerWithSessionReady | Line: 200 | Upvalues: Players (copy), v3 (copy) ]]
	local v1 = Players:GetPlayers()
	for v2, v32 in v1 do
		if v3:isEnabled(v32.UserId) and v3:sessionIsStarted(v32.UserId) then
			return v32.UserId
		end
	end
	return v1[math.random(1, #v1)].UserId
end
function t.addBusinessEvent(p1, p2, p3) --[[ addBusinessEvent | Line: 211 | Upvalues: v2 (copy), v3 (copy), isSdkReady (copy), addToInitializationQueueByUserId (copy), t (copy), addToInitializationQueue (copy), v6 (copy), Players (copy), v5 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 212 | Upvalues: v3 (ref), isSdkReady (ref), p2 (copy), addToInitializationQueueByUserId (ref), t (ref), p3 (copy), addToInitializationQueue (ref), v6 (ref), Players (ref), v5 (ref) ]]
		if not v3:isEventSubmissionEnabled() then
			return
		end
		if isSdkReady({
			needsInitialized = true,
			shouldWarn = false,
			message = "Could not add business event",
			playerId = p2
		}) then
			local v32 = tostring(p3.itemType or "")
			local v52 = tostring(p3.itemId or "")
			local v7 = tostring(p3.cartType or "")
			v6:addBusinessEvent(p2, "USD", math.floor((p3.amount or 0) * 0.7 * 0.35), v32, v52, v7)
			if v32 ~= "Gamepass" or v7 == "Website" then
				return
			end
			local v10 = Players:GetPlayerByUserId(p2)
			local v11 = v5:GetPlayerDataFromCache(p2)
			if not v11.OwnedGamepasses then
				v11.OwnedGamepasses = {}
			end
			table.insert(v11.OwnedGamepasses, p3.gamepassId or nil)
			v5.PlayerCache[p2] = v11
			v5:SavePlayerData(v10)
		elseif p2 then
			addToInitializationQueueByUserId(p2, t.addBusinessEvent, t, p2, p3)
		else
			addToInitializationQueue(t.addBusinessEvent, t, p2, p3)
		end
	end)
end
function t.addResourceEvent(p1, p2, p3) --[[ addResourceEvent | Line: 248 | Upvalues: v2 (copy), v3 (copy), isSdkReady (copy), addToInitializationQueueByUserId (copy), t (copy), addToInitializationQueue (copy), v6 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 249 | Upvalues: v3 (ref), isSdkReady (ref), p2 (copy), addToInitializationQueueByUserId (ref), t (ref), p3 (copy), addToInitializationQueue (ref), v6 (ref) ]]
		if not v3:isEventSubmissionEnabled() then
			return
		end
		if isSdkReady({
			needsInitialized = true,
			shouldWarn = false,
			message = "Could not add resource event",
			playerId = p2
		}) then
			v6:addResourceEvent(p2, p3.flowType or 0, p3.currency or "", p3.amount or 0, p3.itemType or "", p3.itemId or "")
			return
		end
		if p2 then
			addToInitializationQueueByUserId(p2, t.addResourceEvent, t, p2, p3)
		else
			addToInitializationQueue(t.addResourceEvent, t, p2, p3)
		end
	end)
end
function t.addProgressionEvent(p1, p2, p3) --[[ addProgressionEvent | Line: 273 | Upvalues: v2 (copy), v3 (copy), isSdkReady (copy), addToInitializationQueueByUserId (copy), t (copy), addToInitializationQueue (copy), v6 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 274 | Upvalues: v3 (ref), isSdkReady (ref), p2 (copy), addToInitializationQueueByUserId (ref), t (ref), p3 (copy), addToInitializationQueue (ref), v6 (ref) ]]
		if not v3:isEventSubmissionEnabled() then
			return
		end
		if isSdkReady({
			needsInitialized = true,
			shouldWarn = false,
			message = "Could not add progression event",
			playerId = p2
		}) then
			v6:addProgressionEvent(p2, p3.progressionStatus or 0, p3.progression01 or "", p3.progression02 or nil, p3.progression03 or nil, p3.score or nil)
			return
		end
		if p2 then
			addToInitializationQueueByUserId(p2, t.addProgressionEvent, t, p2, p3)
		else
			addToInitializationQueue(t.addProgressionEvent, t, p2, p3)
		end
	end)
end
function t.addDesignEvent(p1, p2, p3) --[[ addDesignEvent | Line: 298 | Upvalues: v2 (copy), v3 (copy), t (copy), isSdkReady (copy), addToInitializationQueueByUserId (copy), addToInitializationQueue (copy), v6 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 299 | Upvalues: v3 (ref), p2 (ref), t (ref), isSdkReady (ref), addToInitializationQueueByUserId (ref), p3 (copy), addToInitializationQueue (ref), v6 (ref) ]]
		if not v3:isEventSubmissionEnabled() then
			return
		end
		if p2 == "Server" or not p2 then
			p2 = t:getPlayerWithSessionReady()
		end
		if isSdkReady({
			needsInitialized = true,
			shouldWarn = false,
			message = "Could not add design event",
			playerId = p2
		}) then
			v6:addDesignEvent(p2, p3.eventId or "", p3.value or nil)
			return
		end
		if p2 then
			addToInitializationQueueByUserId(p2, t.addDesignEvent, t, p2, p3)
		else
			addToInitializationQueue(t.addDesignEvent, t, p2, p3)
		end
	end)
end
function t.addErrorEvent(p1, p2, p3) --[[ addErrorEvent | Line: 325 ]] end
function t.setEnabledDebugLog(p1, p2) --[[ setEnabledDebugLog | Line: 347 | Upvalues: RunService (copy), v1 (copy) ]]
	if not RunService:IsStudio() then
		v1:i("setEnabledDebugLog can only be used in studio")
		return
	end
	if p2 then
		v1:setDebugLog(p2)
		v1:i("Debug logging enabled")
	else
		v1:i("Debug logging disabled")
		v1:setDebugLog(p2)
	end
end
function t.setEnabledInfoLog(p1, p2) --[[ setEnabledInfoLog | Line: 361 | Upvalues: v1 (copy) ]]
	if p2 then
		v1:setInfoLog(p2)
		v1:i("Info logging enabled")
	else
		v1:i("Info logging disabled")
		v1:setInfoLog(p2)
	end
end
function t.setEnabledVerboseLog(p1, p2) --[[ setEnabledVerboseLog | Line: 371 | Upvalues: v1 (copy) ]]
	if p2 then
		v1:setVerboseLog(p2)
		v1:ii("Verbose logging enabled")
	else
		v1:ii("Verbose logging disabled")
		v1:setVerboseLog(p2)
	end
end
function t.setEnabledEventSubmission(p1, p2) --[[ setEnabledEventSubmission | Line: 382 | Upvalues: v2 (copy), v3 (copy), v1 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 383 | Upvalues: p2 (copy), v3 (ref), v1 (ref) ]]
		if p2 then
			v3:setEventSubmission(p2)
			v1:i("Event submission enabled")
		else
			v1:i("Event submission disabled")
			v3:setEventSubmission(p2)
		end
	end)
end
function t.setCustomDimension01(p1, p2, p3) --[[ setCustomDimension01 | Line: 394 | Upvalues: v2 (copy), isSdkReady (copy), v3 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 395 | Upvalues: isSdkReady (ref), p2 (copy), v3 (ref), p3 (copy) ]]
		if isSdkReady({
			needsInitialized = true,
			shouldWarn = true,
			message = "Could not set custom01 dimension",
			playerId = p2
		}) then
			v3:setCustomDimension01(p2, p3)
		else
			warn("sdk not ready")
		end
	end)
end
function t.setCustomDimension02(p1, p2, p3) --[[ setCustomDimension02 | Line: 410 | Upvalues: v2 (copy), isSdkReady (copy), v3 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 411 | Upvalues: isSdkReady (ref), p2 (copy), v3 (ref), p3 (copy) ]]
		if isSdkReady({
			needsInitialized = true,
			shouldWarn = true,
			message = "Could not set custom02 dimension",
			playerId = p2
		}) then
			v3:setCustomDimension02(p2, p3)
		end
	end)
end
function t.setCustomDimension03(p1, p2, p3) --[[ setCustomDimension03 | Line: 425 | Upvalues: v2 (copy), isSdkReady (copy), v3 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 426 | Upvalues: isSdkReady (ref), p2 (copy), v3 (ref), p3 (copy) ]]
		if isSdkReady({
			needsInitialized = true,
			shouldWarn = true,
			message = "Could not set custom03 dimension",
			playerId = p2
		}) then
			v3:setCustomDimension03(p2, p3)
		end
	end)
end
function t.setEnabledReportErrors(p1, p2) --[[ setEnabledReportErrors | Line: 440 | Upvalues: v2 (copy), v3 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 441 | Upvalues: v3 (ref), p2 (copy) ]]
		v3.ReportErrors = p2
	end)
end
function t.setEnabledCustomUserId(p1, p2) --[[ setEnabledCustomUserId | Line: 446 | Upvalues: v2 (copy), v3 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 447 | Upvalues: v3 (ref), p2 (copy) ]]
		v3.UseCustomUserId = p2
	end)
end
function t.setEnabledAutomaticSendBusinessEvents(p1, p2) --[[ setEnabledAutomaticSendBusinessEvents | Line: 452 | Upvalues: v2 (copy), v3 (copy) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 453 | Upvalues: v3 (ref), p2 (copy) ]]
		v3.AutomaticSendBusinessEvents = p2
	end)
end
function t.addGameAnalyticsTeleportData(p1, p2, p3) --[[ addGameAnalyticsTeleportData | Line: 458 | Upvalues: v5 (copy) ]]
	local t = {}
	for i, v in ipairs(p2) do
		local v1 = v5:GetPlayerDataFromCache(v)
		v1.PlayerTeleporting = true
		t[tostring(v)] = {
			SessionID = v1.SessionID,
			Sessions = v1.Sessions,
			SessionStart = v1.SessionStart
		}
	end
	p3.gameanalyticsData = t
	return p3
end
function t.getRemoteConfigsValueAsString(p1, p2, p3) --[[ getRemoteConfigsValueAsString | Line: 477 | Upvalues: v3 (copy) ]]
	return v3:getRemoteConfigsStringValue(p2, p3.key or "", p3.defaultValue or nil)
end
function t.isRemoteConfigsReady(p1, p2) --[[ isRemoteConfigsReady | Line: 483 | Upvalues: v3 (copy) ]]
	return v3:isRemoteConfigsReady(p2)
end
function t.getRemoteConfigsContentAsString(p1, p2) --[[ getRemoteConfigsContentAsString | Line: 487 | Upvalues: v3 (copy) ]]
	return v3:getRemoteConfigsContentAsString(p2)
end
function t.PlayerJoined(p1, p2) --[[ PlayerJoined | Line: 491 | Upvalues: v5 (copy), v8 (copy), v7 (copy), LocalizationService (copy), v6 (copy), v3 (copy), v1 (copy), t (copy), v9 (ref), ReplicatedStorage (copy), MarketplaceService (copy), t2 (copy), t7 (copy) ]]
	local v12 = type(p2) ~= "table"
	local v2 = if v12 then p2:GetJoinData() else v12
	local v32 = if v2 then v2.TeleportData else v2
	local v4 = v5:GetPlayerData(p2)
	local v52
	if v32 then
		local gameanalyticsData = v32.gameanalyticsData
		if gameanalyticsData then
			gameanalyticsData = v32.gameanalyticsData[tostring(p2.UserId)]
		end
		v52 = gameanalyticsData
	else
		v52 = nil
	end
	local v62 = v5:GetPlayerDataFromCache(p2.UserId)
	if v62 then
		if v52 then
			v62.SessionID = v52.SessionID
			v62.SessionStart = v52.SessionStart
		end
		v62.PlayerTeleporting = false
	else
		local v72 = "unknown"
		if v12 then
			local v82, v92 = v8.invokeClient("getPlatform", p2, 5)
			if v82 then
				v72 = v92
			end
		end
		for k, v in pairs(v5.BasePlayerData) do
			v4[k] = v4[k] or v
			if not v4[k] then
				if typeof(v) == "table" then
					v4[k] = v7:copyTable(v)
					continue
				end
				v4[k] = v
			end
		end
		local v10, v11 = pcall(function() --[[ Line: 536 | Upvalues: v12 (copy), LocalizationService (ref), p2 (copy) ]]
			if v12 then
				return LocalizationService:GetCountryRegionForPlayerAsync(p2)
			end
		end)
		if v10 then
			v4.CountryCode = v11
		end
		v5.PlayerCache[p2.UserId] = v4
		v4.Platform = if v72 == "Console" then "uwp_console" elseif v72 == "Mobile" then "uwp_mobile" else "uwp_desktop"
		v4.OS = v4.Platform .. " 0.0.0"
		if not v10 and v12 then
			v6:addSdkErrorEvent(p2.UserId, "event_validation", "player_joined", "string_empty_or_null", "country_code", "")
		end
		local v13 = ""
		if v3.UseCustomUserId and v12 then
			local v14, v15 = v8.invokeClient("getCustomUserId", p2, 5)
			if v14 then
				v13 = v15
			end
		end
		if not v7:isStringNullOrEmpty(v13) then
			v1:i("Using custom id: " .. v13)
			v4.CustomUserId = v13
		end
		t:startNewSession(p2, v52)
		v9 = v9 or ReplicatedStorage:WaitForChild("OnPlayerReadyEvent")
		v9:Fire(p2)
		if v3.AutomaticSendBusinessEvents and v12 then
			if v4.OwnedGamepasses == nil then
				v4.OwnedGamepasses = {}
				for i, v in ipairs(v3._availableGamepasses) do
					if MarketplaceService:UserOwnsGamePassAsync(p2.UserId, v) then
						table.insert(v4.OwnedGamepasses, v)
					end
				end
			else
				local list = {}
				for i, v in ipairs(v3._availableGamepasses) do
					if MarketplaceService:UserOwnsGamePassAsync(p2.UserId, v) then
						table.insert(list, v)
					end
				end
				local t3 = {}
				for i, v in ipairs(v4.OwnedGamepasses) do
					t3[v] = true
				end
				for i, v in ipairs(list) do
					if not t3[v] then
						table.insert(v4.OwnedGamepasses, v)
						local v17 = t2[v]
						if not v17 then
							local v18 = MarketplaceService:GetProductInfo(v, Enum.InfoType.GamePass)
							t2[v] = v18
							v17 = v18
						end
						t:addBusinessEvent(p2.UserId, {
							itemType = "Gamepass",
							cartType = "Website",
							amount = v17.PriceInRobux,
							itemId = t:filterForBusinessEvent(v17.Name)
						})
					end
				end
			end
			v5.PlayerCache[p2.UserId] = v4
			v5:SavePlayerData(p2)
		end
		local v19 = t7[p2.UserId]
		if not v19 then
			return
		end
		t7[p2.UserId] = nil
		for i, v in ipairs(v19) do
			v.Func(unpack(v.Args))
		end
		v1:i("Player initialization queue called #" .. #v19 .. " events")
	end
end
function t.PlayerRemoved(p1, p2) --[[ PlayerRemoved | Line: 640 | Upvalues: v5 (copy), t (copy) ]]
	v5:SavePlayerData(p2)
	local v1 = v5:GetPlayerDataFromCache(p2.UserId)
	if not v1 then
		return
	end
	if not v1.PlayerTeleporting then
		t:endSession(p2.UserId)
		return
	end
	v5.PlayerCache[p2.UserId] = nil
end
function t.isPlayerReady(p1, p2) --[[ isPlayerReady | Line: 654 | Upvalues: v5 (copy) ]]
	return v5:GetPlayerDataFromCache(p2) and true or false
end
function t.ProcessReceiptCallback(p1, p2) --[[ ProcessReceiptCallback | Line: 662 | Upvalues: t2 (copy), MarketplaceService (copy), t (copy) ]]
	local v1 = t2[p2.ProductId]
	if not v1 then
		pcall(function() --[[ Line: 669 | Upvalues: v1 (ref), MarketplaceService (ref), p2 (copy), t2 (ref) ]]
			v1 = MarketplaceService:GetProductInfo(p2.ProductId, Enum.InfoType.Product)
			t2[p2.ProductId] = v1
		end)
	end
	if v1 then
		t:addBusinessEvent(p2.PlayerId, {
			itemType = "DeveloperProduct",
			amount = p2.CurrencySpent,
			itemId = t:filterForBusinessEvent(v1.Name)
		})
	end
end
function t.GamepassPurchased(p1, p2, p3, p4) --[[ GamepassPurchased | Line: 685 | Upvalues: t2 (copy), MarketplaceService (copy), t (copy) ]]
	local v1 = t2[p3]
	if not v1 then
		local v2 = MarketplaceService:GetProductInfo(p3, Enum.InfoType.GamePass)
		t2[p3] = v2
		v1 = v2
	end
	local v3 = 0
	local v4 = "GamePass"
	if p4 then
		v3 = p4.PriceInRobux
		v4 = p4.Name
	elseif v1 then
		v3 = v1.PriceInRobux
		v4 = v1.Name
	end
	t:addBusinessEvent(p2.UserId, {
		itemType = "Gamepass",
		amount = v3 or 0,
		itemId = t:filterForBusinessEvent(v4),
		gamepassId = p3
	})
end
local t8 = { "gameKey", "secretKey" }
function t.initServer(p1, p2) --[[ initServer | Line: 716 | Upvalues: t (copy) ]]
	t:initialize(p2)
end
function t.initialize(p1, p2) --[[ initialize | Line: 720 | Upvalues: v2 (copy), t8 (copy), v1 (copy), t (copy), isSdkReady (copy), v4 (copy), v6 (copy), v3 (copy), Players (copy), t6 (ref) ]]
	v2:performTaskOnGAThread(function() --[[ Line: 721 | Upvalues: t8 (ref), p2 (copy), v1 (ref), t (ref), isSdkReady (ref), v4 (ref), v6 (ref), v3 (ref), Players (ref), t6 (ref) ]]
		for i, v in ipairs(t8) do
			if p2[v] == nil then
				v1:e("Initialize \'" .. v .. "\' option missing")
				return
			end
		end
		if p2.enableInfoLog ~= nil and p2.enableInfoLog then
			t:setEnabledInfoLog(p2.enableInfoLog)
		end
		if p2.enableVerboseLog ~= nil and p2.enableVerboseLog then
			t:setEnabledVerboseLog(p2.enableVerboseLog)
		end
		if p2.availableCustomDimensions01 ~= nil and #p2.availableCustomDimensions01 > 0 then
			t:configureAvailableCustomDimensions01(p2.availableCustomDimensions01)
		end
		if p2.availableCustomDimensions02 ~= nil and #p2.availableCustomDimensions02 > 0 then
			t:configureAvailableCustomDimensions02(p2.availableCustomDimensions02)
		end
		if p2.availableCustomDimensions03 ~= nil and #p2.availableCustomDimensions03 > 0 then
			t:configureAvailableCustomDimensions03(p2.availableCustomDimensions03)
		end
		if p2.availableResourceCurrencies ~= nil and #p2.availableResourceCurrencies > 0 then
			t:configureAvailableResourceCurrencies(p2.availableResourceCurrencies)
		end
		if p2.availableResourceItemTypes ~= nil and #p2.availableResourceItemTypes > 0 then
			t:configureAvailableResourceItemTypes(p2.availableResourceItemTypes)
		end
		if p2.build ~= nil and #p2.build > 0 then
			t:configureBuild(p2.build)
		end
		if p2.availableGamepasses ~= nil and #p2.availableGamepasses > 0 then
			t:configureAvailableGamepasses(p2.availableGamepasses)
		end
		if p2.enableDebugLog ~= nil then
			t:setEnabledDebugLog(p2.enableDebugLog)
		end
		if p2.automaticSendBusinessEvents ~= nil then
			t:setEnabledAutomaticSendBusinessEvents(p2.automaticSendBusinessEvents)
		end
		if p2.reportErrors ~= nil then
			t:setEnabledReportErrors(p2.reportErrors)
		end
		if p2.useCustomUserId ~= nil then
			t:setEnabledCustomUserId(p2.useCustomUserId)
		end
		if isSdkReady({
			needsInitialized = true,
			shouldWarn = false
		}) then
			v1:w("SDK already initialized. Can only be called once.")
			return
		end
		local gameKey = p2.gameKey
		local secretKey = p2.secretKey
		if not v4:validateKeys(gameKey, secretKey) then
			v1:w("SDK failed initialize. Game key or secret key is invalid. Can only contain characters A-z 0-9, gameKey is 32 length, secretKey is 40 length. Failed keys - gameKey: " .. gameKey .. ", secretKey: " .. secretKey)
			return
		end
		v6.GameKey = gameKey
		v6.SecretKey = secretKey
		v3.Initialized = true
		Players.PlayerAdded:Connect(function(p1) --[[ Line: 789 | Upvalues: t (ref) ]]
			t:PlayerJoined(p1)
		end)
		Players.PlayerRemoving:Connect(function(p1) --[[ Line: 794 | Upvalues: t (ref) ]]
			t:PlayerRemoved(p1)
		end)
		for i, v in ipairs(Players:GetPlayers()) do
			coroutine.wrap(t.PlayerJoined)(t, v)
		end
		for i, v in ipairs(t6) do
			task.spawn(v.Func, unpack(v.Args))
		end
		v1:i("Server initialization queue called #" .. #t6 .. " events")
		t6 = nil
		v6:processEventQueue()
	end)
end
function t.bindToPlayerReady(p1, p2) --[[ bindToPlayerReady | Line: 813 | Upvalues: Players (copy), t (copy), ReplicatedStorage (copy) ]]
	for v1, v2 in Players:GetPlayers() do
		task.spawn(function() --[[ Line: 815 | Upvalues: t (ref), v2 (copy), p2 (copy) ]]
			if t:isPlayerReady(v2.UserId) then
				p2(v2)
			end
		end)
	end
	return ReplicatedStorage:WaitForChild("OnPlayerReadyEvent").Event:Connect(function(p1) --[[ Line: 821 | Upvalues: t (ref), p2 (copy) ]]
		if type(p1) == "table" then
			return
		end
		if t:isPlayerReady(p1.UserId) then
			p2(p1)
		end
	end)
end
function t.onPlayerConfigsReady(p1, p2, p3) --[[ onPlayerConfigsReady | Line: 829 | Upvalues: ReplicatedStorage (copy), t (copy) ]]
	local v1 = ReplicatedStorage:WaitForChild("OnPlayerConfigsReadyEvent").Event:Connect(function(p1) --[[ Line: 830 | Upvalues: p2 (copy), t (ref), p3 (copy) ]]
		if p1.UserId ~= p2.UserId then
			return
		end
		if t:isRemoteConfigsReady(p2.UserId) then
			p3(p2)
		end
	end)
	if not (t:isPlayerReady(p2.UserId) and t:isRemoteConfigsReady(p2.UserId)) then
		return v1
	end
	p3()
	return v1
end
if not ReplicatedStorage:FindFirstChild("GameAnalyticsRemoteConfigs") then
	local GameAnalyticsRemoteConfigs = Instance.new("RemoteEvent")
	GameAnalyticsRemoteConfigs.Name = "GameAnalyticsRemoteConfigs"
	GameAnalyticsRemoteConfigs.Parent = ReplicatedStorage
end
if not ReplicatedStorage:FindFirstChild("OnPlayerReadyEvent") then
	local OnPlayerReadyEvent = Instance.new("BindableEvent")
	OnPlayerReadyEvent.Name = "OnPlayerReadyEvent"
	OnPlayerReadyEvent.Parent = ReplicatedStorage
end
if not ReplicatedStorage:FindFirstChild("OnPlayerConfigsReadyEvent") then
	local OnPlayerConfigsReadyEvent = Instance.new("BindableEvent")
	OnPlayerConfigsReadyEvent.Name = "OnPlayerConfigsReadyEvent"
	OnPlayerConfigsReadyEvent.Parent = ReplicatedStorage
end
task.spawn(function() --[[ Line: 868 | Upvalues: t3 (ref), v5 (copy), t4 (ref), t5 (ref) ]]
	t3 = v5:GetErrorDataStore((math.floor(os.time() / 3600)))
	while task.wait(3600) do
		t3 = v5:GetErrorDataStore((math.floor(os.time() / 3600)))
		t4 = {}
		t5 = {}
	end
end)
task.spawn(function() --[[ Line: 880 | Upvalues: v5 (copy), t5 (ref), t4 (ref), t3 (ref) ]]
	while task.wait(v5.AutoSaveData) do
		for k, v in pairs(t5) do
			local v1 = t4[v]
			t4[v].countInDS = v5:IncrementErrorCount(t3, v, v1.currentCount - v1.countInDS)
			t4[v].currentCount = t4[v].countInDS
		end
	end
end)
local t9 = { "sound", "asset", "id", "failed" }
local function ErrorHandler(p1, p2, p3, p4) --[[ ErrorHandler | Line: 898 | Upvalues: t4 (ref), t5 (ref), t (copy) ]]
	local v4 = (if p3 == nil then "(null)" else p3) .. ": message=" .. (if p1 == nil then "(null)" else p1) .. ", trace=" .. (if p2 == nil then "(null)" else p2)
	if #v4 > 8192 then
		v4 = string.sub(v4, 1, 8192)
	end
	local v6
	if p4 then
		v6 = p4.UserId
		v4 = v4:gsub(p4.Name, "[LocalPlayer]")
	else
		v6 = nil
	end
	local v8 = if #v4 > 50 then string.sub(v4, 1, 50) else v4
	if t4[v8] == nil then
		t5[#t5 + 1] = v8
		t4[v8] = {}
		t4[v8].countInDS = 0
		t4[v8].currentCount = 0
	end
	if not (t4[v8].currentCount > 10) then
		t:addErrorEvent(v6, {
			severity = t.EGAErrorSeverity.error,
			message = v4
		})
		t4[v8].currentCount = t4[v8].currentCount + 1
	end
end
local function ErrorHandlerFromServer(p1, p2, p3) --[[ ErrorHandlerFromServer | Line: 949 | Upvalues: v3 (copy), t9 (copy), ErrorHandler (copy) ]]
	if not v3.ReportErrors then
		return
	end
	if not p3 then
		return
	end
	local v1 = p1:lower()
	for k, v in pairs(t9) do
		if v1:find(v) then
			return
		end
	end
	local v2 = nil
	local v32, _ = pcall(function() --[[ Line: 970 | Upvalues: v2 (ref), p3 (copy) ]]
		v2 = p3:GetFullName()
	end)
	if v32 then
		return ErrorHandler(p1, p2, v2)
	end
end
local function ErrorHandlerFromClient(p1, p2, p3, p4) --[[ ErrorHandlerFromClient | Line: 980 ]] end
if ReplicatedStorage:FindFirstChild("GameAnalyticsError") then
	MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(p1_2, p2_2, p3_2) --[[ Line: 1011 | Upvalues: v3 (copy), t (copy) ]]
		if v3.AutomaticSendBusinessEvents and p3_2 then
			t:GamepassPurchased(p1_2, p2_2)
		end
	end)
	t.state = v3
	t.store = v5
	return t
end
local GameAnalyticsError = Instance.new("RemoteEvent")
GameAnalyticsError.Name = "GameAnalyticsError"
GameAnalyticsError.Parent = ReplicatedStorage
MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(p1_2, p2_2, p3_2) --[[ Line: 1011 | Upvalues: v3 (copy), t (copy) ]]
	if v3.AutomaticSendBusinessEvents and p3_2 then
		t:GamepassPurchased(p1_2, p2_2)
	end
end)
t.state = v3
t.store = v5
return t