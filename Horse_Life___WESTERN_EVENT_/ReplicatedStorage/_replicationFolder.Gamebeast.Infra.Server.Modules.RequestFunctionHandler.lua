-- https://lua.expert/
local t = {}
local HttpService = game:GetService("HttpService")
local DataStoreService = game:GetService("DataStoreService")
local MessagingService = game:GetService("MessagingService")
local v1 = shared.GBMod("Utilities")
local v2 = shared.GBMod("GBRequests")
local v3 = shared.GBMod("RequestFunctions")
local v4 = shared.GBMod("InternalConfigs")
local v5 = DataStoreService:GetDataStore("GB_CUSTOM_JOB_DATA")
local v6 = 1
local t2 = {}
local v7 = 0
local t3 = {}
local t4 = {}
local function AddResult(p1, p2, p3) --[[ AddResult | Line: 53 | Upvalues: t3 (ref), t4 (copy), v2 (copy) ]]
	local v22 = t3
	local t = {}
	t.status = if p1 then "success" else "failure"
	t.result = if p3 then p3 else {}
	t.requestId = p2
	table.insert(v22, t)
	if #t3 ~= 1 then
		return
	end
	task.delay(math.min(#t4 * 0.1, 3), function() --[[ Line: 61 | Upvalues: v2 (ref), t3 (ref) ]]
		v2:GBRequest("v1/requests/completed", t3)
		t3 = {}
	end)
end
function t.SetCallback(p1, p2, p3) --[[ SetCallback | Line: 71 | Upvalues: t2 (copy), v1 (copy) ]]
	if t2[p2] then
		v1.GBWarn((("Job name \"%*\" already has a callback set, additional sets will overwrite the previous callback."):format(p2)))
	end
	t2[p2] = p3
end
function t.ExecuteRequests(p1, p2) --[[ ExecuteRequests | Line: 79 | Upvalues: v7 (ref), t4 (copy), v2 (copy), t2 (copy), v3 (copy), v1 (copy), AddResult (copy), v5 (copy), HttpService (copy) ]]
	local v12 = v7
	local v22 = if #t4 == 0 then true else false
	for v32, v4 in p2 do
		if v7 < v4.requestId then
			v7 = v4.requestId
		end
		if v12 < v4.requestId then
			table.insert(t4, v4)
		end
	end
	if not v22 then
		return
	end
	task.spawn(function() --[[ Line: 97 | Upvalues: t4 (ref), v2 (ref), t2 (ref), v3 (ref), v1 (ref), AddResult (ref), v5 (ref), HttpService (ref) ]]
		while #t4 > 0 do
			local v12 = t4[1]
			v2:GBRequestAsync("v1/requests/started", { v12.requestId })
			local function performRequest() --[[ performRequest | Line: 104 | Upvalues: v12 (copy), t2 (ref), v3 (ref), v1 (ref), AddResult (ref), v5 (ref), HttpService (ref) ]]
				local v13 = if v12.details.custom then t2[v12.requestType] else v3.funcs[v12.requestType]
				if not v13 then
					v1.GBWarn((("No request function found for request type %*"):format(v12.requestType)))
					AddResult(false, v12.requestId, {
						details = "request callback not found"
					})
					return
				end
				if v12.details.custom then
					local v2, v32 = pcall(function() --[[ Line: 119 | Upvalues: v12 (ref), v5 (ref), v1 (ref) ]]
						local requestId = v12.requestId
						local v13 = tostring(requestId)
						v5:UpdateAsync(v12.requestType, function(p1) --[[ Line: 122 | Upvalues: v13 (copy), v12 (ref) ]]
							local v1 = if p1 then p1 else {}
							local v2 = v1
							for v3, v4 in v1 do
								if os.time() - v4.timestamp > 10 then
									v2[v3] = nil
								end
							end
							v2[v13] = {
								jobData = v12.args,
								timestamp = os.time(),
								requestId = v13
							}
							return v2
						end)
						v1.publishMessage("GB_PROPAGATE_CUSTOM", {
							fromServer = game.JobId,
							requestId = v13,
							requestType = v12.requestType
						})
					end)
					if not v2 then
						v1.GBWarn((("Failed to update custom job data for request of type %*: %*"):format(v12.requestType, v32)))
					end
				end
				local v4, v52 = pcall(v13, v12.args)
				if v4 then
					local v6 = type(v52)
					if v6 == "userdata" then
						v52 = {
							message = "returned value cannot be a userdata value"
						}
					elseif v6 == "table" then
						local v7, v8 = pcall(function() --[[ Line: 156 | Upvalues: HttpService (ref), v52 (ref) ]]
							HttpService:JSONEncode(v52)
						end)
						if not v7 then
							v52 = {
								message = "failed to encode returned value",
								encodeError = v8
							}
						end
					end
					AddResult(true, v12.requestId, v52)
				else
					AddResult(false, v12.requestId, {
						details = v52
					})
				end
			end
			if v12.details.async or v12.details.custom then
				task.spawn(performRequest)
			else
				performRequest()
			end
			table.remove(t4, 1)
		end
	end)
end
function t.Init(p1) --[[ Init | Line: 187 | Upvalues: v2 (copy), v4 (copy), v6 (ref), v1 (copy), MessagingService (copy), v5 (copy), t2 (copy) ]]
	local v12 = false
	task.spawn(function() --[[ Line: 191 | Upvalues: v2 (ref), p1 (copy), v4 (ref), v6 (ref), v12 (ref) ]]
		local function checkForRequests() --[[ checkForRequests | Line: 192 | Upvalues: v2 (ref), p1 (ref) ]]
			local v1, v22 = v2:GBRequestAsync("v1/requests")
			if not v1 then
				return
			end
			p1:ExecuteRequests(v22)
		end
		v4:OnReady(function() --[[ Line: 200 | Upvalues: v2 (ref), p1 (ref), v6 (ref), v4 (ref), v12 (ref) ]]
			repeat
				local v1, v22 = v2:GBRequestAsync("v1/requests")
				if v1 then
					p1:ExecuteRequests(v22)
				end
				v6 = v4:GetActiveConfig("GBConfigs").GBRates.CheckRequests
			until task.wait(v6) == nil or v12 == true
		end)
	end)
	local t = {}
	v1.promiseReturn(1, function() --[[ Line: 209 | Upvalues: MessagingService (ref), t (copy), v5 (ref), v1 (ref), t2 (ref) ]]
		MessagingService:SubscribeAsync("GB_PROPAGATE_CUSTOM", function(p1) --[[ Line: 210 | Upvalues: t (ref), v5 (ref), v1 (ref), t2 (ref) ]]
			local Data = p1.Data
			if Data.fromServer == game.JobId then
				return
			end
			table.insert(t, Data)
			if t[2] ~= nil then
				return
			end
			while t[1] do
				local v2 = t[1]
				local v3, v4 = pcall(function() --[[ Line: 222 | Upvalues: v5 (ref), v2 (copy) ]]
					return v5:GetAsync(v2.requestType)
				end)
				if v3 and v4[v2.requestId] ~= nil then
					local v52 = t2[v2.requestType]
					if v52 then
						local v6, v7 = pcall(function() --[[ Line: 235 | Upvalues: v52 (copy), v4 (copy), v2 (copy) ]]
							v52(v4[v2.requestId].jobData)
						end)
						if not v6 then
							v1.GBWarn((("Error executing custom job callback for request type %*: %*"):format(v2.requestType, v7)))
						end
					else
						v1.GBWarn((("Received custom job data for request type %* but no callback is set."):format(v2.requestType)))
					end
					task.wait(5)
					table.remove(t, 1)
					continue
				end
				v1.GBWarn(("Failed to fetch custom job data for request of type %*"):format(v2.requestType), v4, v2)
				table.remove(t, 1)
			end
		end)
	end)
	v2:OnFinalRequestCall(function() --[[ Line: 254 | Upvalues: v12 (ref) ]]
		v12 = true
	end)
end
return t