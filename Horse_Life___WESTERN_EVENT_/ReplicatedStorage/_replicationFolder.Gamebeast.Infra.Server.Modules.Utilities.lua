-- https://lua.expert/
local MarketplaceService = game:GetService("MarketplaceService")
local MessagingService = game:GetService("MessagingService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local v1 = shared.GBMod("DataCache")
local t = {}
local t2 = {}
local v2 = nil
local t3 = {
	GBWarn = function(...) --[[ Line: 18 | Upvalues: v1 (copy) ]]
		if not v1:Get("Settings").sdkWarningsEnabled then
			return
		end
		warn("GamebeastSDK:", ...)
		if not v1:Get("Settings").includeWarningStackTrace then
			return
		end
		warn("GamebeastSDK Traceback:", debug.traceback())
	end,
	GBLog = function(...) --[[ Line: 27 | Upvalues: v1 (copy) ]]
		if not v1:Get("Settings").sdkDebugEnabled then
			return
		end
		print("GamebeastSDK:", ...)
	end,
	resolvePlayerObject = function(p1) --[[ Line: 33 ]]
		if typeof(p1) == "number" then
			return game.Players:GetPlayerByUserId(p1)
		else
			return p1
		end
	end
}
function t3.promiseReturn(p1, p2, p3) --[[ Line: 42 | Upvalues: t3 (copy) ]]
	if p1 and not p3 then
		p3 = 0
	elseif p3 and p1 < p3 then
		return nil, false
	end
	local v1 = nil
	local v2, v3 = pcall(function() --[[ Line: 52 | Upvalues: v1 (ref), p2 (copy) ]]
		v1 = p2()
	end)
	if v2 then
		return v1, true
	end
	task.wait()
	if p3 then
		p3 = p3 + 1
		if p1 < p3 then
			t3.GBWarn(v3)
		end
	end
	return t3.promiseReturn(p1, p2, p3)
end
function t3.PCallRetry(p1, p2, p3, p4) --[[ PCallRetry | Line: 72 ]]
	if not p4 then
		p4 = 0
	end
	local v1, v2 = pcall(p3)
	if v1 then
		return true, v2
	end
	if p4 < p2 then
		task.wait(0.1)
		return p1:PCallRetry(p2, p3, p4 + 1)
	else
		return false, v2
	end
end
function t3.tableEqualityCheck(p1, p2) --[[ Line: 93 ]]
	return table.concat(p1) == table.concat(p2)
end
function t3.primativeDeepEqual(p1, p2) --[[ primativeDeepEqual | Line: 98 | Upvalues: t3 (copy) ]]
	if p1 == p2 then
		return true
	end
	if typeof(p1) ~= typeof(p2) then
		return false
	end
	if typeof(p1) ~= "table" then
		return false
	end
	local count = 0
	for v1 in p1 do
		count = count + 1
	end
	local count_2 = 0
	for v2 in p2 do
		count_2 = count_2 + 1
	end
	if count ~= count_2 then
		return false
	end
	for v3, v4 in p1 do
		local v5 = p2[v3]
		if v5 == nil then
			return false
		end
		if not t3.primativeDeepEqual(v4, v5) then
			return false
		end
	end
	return true
end
function t3.formatTime(p1, p2) --[[ Line: 139 ]]
	local v1 = math.floor(p1 / 60 / 60)
	local v2 = math.floor(p1 / 60 - v1 * 60)
	local v3 = math.floor(p1 - v2 * 60 - v1 * 60 * 60)
	local v4 = tostring(v1)
	local v5 = tostring(v2)
	local v6 = tostring(v3)
	local v8 = if #v5 < 2 then "0" .. v5 else v5
	local v9 = if #v6 < 2 then "0" .. v6 else v6
	return p2 and v8 .. ":" .. v9 or (if #v4 < 2 then "0" .. v4 else v4) .. ":" .. v8 .. ":" .. v9
end
function t3.convertSecstoDay(p1) --[[ Line: 162 ]]
	local v2 = p1 % 86400
	local v4 = v2 % 3600
	return math.floor(p1 / 86400) .. "d " .. math.floor(v2 / 3600) .. "h " .. math.floor(v4 / 60) .. "m " .. math.floor(v4 % 60) .. "s"
end
function t3.getProductInfo(p1, p2) --[[ Line: 188 | Upvalues: t3 (copy), MarketplaceService (copy) ]]
	return t3.promiseReturn(nil, function() --[[ Line: 189 | Upvalues: MarketplaceService (ref), p1 (copy), p2 (copy) ]]
		return MarketplaceService:GetProductInfo(p1, p2)
	end)
end
function t3.recursiveCopy(p1, p2) --[[ Line: 195 | Upvalues: t3 (copy) ]]
	local t = {}
	for v1, v2 in p1 do
		if type(v2) == "table" then
			local v3 = t3.recursiveCopy(v2, p2)
			if p2 and not table.isfrozen(v3) then
				table.freeze(v3)
			end
			v2 = v3
		end
		t[v1] = v2
	end
	return t
end
function t3.roundNum(p1, p2) --[[ Line: 214 ]]
	return math.floor(0.5 + p1 / p2) / (1 / p2)
end
function t3.publishMessage(p1, p2) --[[ Line: 219 | Upvalues: t3 (copy), t (copy), MessagingService (copy), v2 (ref), t2 (copy) ]]
	local v1, v22 = t3:PCallRetry(1, function() --[[ Line: 220 | Upvalues: t (ref), p1 (copy), MessagingService (ref), p2 (copy) ]]
		t[p1] = (t[p1] or 0) + 1
		MessagingService:PublishAsync(p1, p2)
	end)
	local sum = 0
	if v2 then
		table.insert(t2, {
			Time = os.clock() - v2
		})
		if #t2 > 100 then
			table.remove(t2, 1)
		end
		for v4, v5 in t2 do
			sum = sum + v5.Time
		end
		sum = 60 / (sum / #t2)
	end
	if v1 then
		v2 = os.clock()
	else
		t3.GBWarn((("Failed to publish message to channel: %* (Req count on channel: %*, Avg. total req/min: %*) with error: %*"):format(p1, t[p1], math.round(sum), v22)))
	end
end
function t3.getTableValues(p1) --[[ getTableValues | Line: 254 ]]
	local t = {}
	for v1, v2 in p1 do
		table.insert(t, v2)
	end
	return t
end
function t3.getValueAtPath(p1, p2) --[[ getValueAtPath | Line: 263 ]]
	local v1 = p1
	for v2, v3 in p2 do
		if typeof(v1) ~= "table" then
			return nil
		end
		v1 = v1[v3]
	end
	return v1
end
local v3 = if RunService:IsStudio() then ("studio:%*"):format((HttpService:GenerateGUID(false):lower())) else game.JobId
function t3.getServerId() --[[ getServerId | Line: 278 | Upvalues: v3 (copy) ]]
	return v3
end
function t3.OnPlayerAdded(p1, p2) --[[ OnPlayerAdded | Line: 283 ]]
	for k, v in pairs(game.Players:GetPlayers()) do
		task.spawn(p2, v)
	end
	return game.Players.PlayerAdded:Connect(p2)
end
function t3.FindPlayer(p1, p2) --[[ FindPlayer | Line: 290 ]]
	if tonumber(p2) then
		return game.Players:GetPlayerByUserId((tonumber(p2)))
	else
		return game.Players:FindFirstChild(p2)
	end
end
function t3.waitForAllCalls(p1) --[[ waitForAllCalls | Line: 302 | Upvalues: t3 (copy) ]]
	local v1 = #p1
	if v1 == 0 then
		return
	end
	local v2 = coroutine.running()
	for v3, v4 in p1 do
		task.spawn(function() --[[ Line: 311 | Upvalues: v4 (copy), t3 (ref), v3 (copy), v1 (ref), v2 (copy) ]]
			local v12, v22 = pcall(v4)
			if not v12 then
				t3.GBWarn((("Uncaught error in waitForAllCalls callback %*: %*"):format(v3, v22)))
			end
			v1 = v1 - 1
			if v1 ~= 0 then
				return
			end
			coroutine.resume(v2)
		end)
	end
	if not (v1 > 0) then
		return
	end
	coroutine.yield()
end
function t3.waitForAnyCall(p1) --[[ waitForAnyCall | Line: 332 | Upvalues: t3 (copy) ]]
	if #p1 == 0 then
		return
	end
	local v1 = coroutine.running()
	local v2 = false
	for v3, v4 in p1 do
		task.spawn(function() --[[ Line: 341 | Upvalues: v4 (copy), t3 (ref), v3 (copy), v2 (ref), v1 (copy) ]]
			local v12, v22 = pcall(v4)
			if not v12 then
				t3.GBWarn((("Uncaught error in waitForAnyCall callback %*: %*"):format(v3, v22)))
			end
			if v2 then
				return
			end
			v2 = true
			coroutine.resume(v1)
		end)
	end
	if not v2 then
		coroutine.yield()
	end
end
return t3