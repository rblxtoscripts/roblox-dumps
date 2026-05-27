-- https://lua.expert/
local t = {}
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local v1 = shared.GBMod("Utilities")
local v2 = shared.GBMod("DataCache")
local v3 = shared.GBMod("Signal")
local v4 = shared.GBMod("MetaData")
local t2 = {
	{
		URL = "https://api.gamebeast.gg",
		Requests = {
			["v1/markers"] = "POST",
			["v1/requests"] = "GET",
			["v1/requests/completed"] = "POST",
			["v1/requests/started"] = "PUT",
			["v1/configurations"] = "GET",
			["v1/latest/version?platform=roblox"] = "GET",
			["v1/experiments"] = "GET",
			["v1/experiments/assignments"] = "POST",
			["v1/servers/roblox/{serverId}"] = "POST",
			["v1/cohorts/membership"] = "POST"
		},
		EndpointTree = {}
	}
}
local t3 = {
	production = "false",
	studio = "true"
}
local v5 = v3.new()
local v6 = 0
local v7 = false
local v8 = false
local function GetEndpointForRequest(p1) --[[ GetEndpointForRequest | Line: 66 | Upvalues: t2 (copy), v2 (copy) ]]
	for v1, v22 in t2 do
		local EndpointTree = v22.EndpointTree
		for v3, v4 in string.split(p1, "/") do
			EndpointTree = EndpointTree[v4]
			if not EndpointTree then
				return nil, nil
			end
		end
		return (v2:Get("Settings").customUrl or v22.URL) .. "/sdk", EndpointTree.__method
	end
end
local function YeildForKey() --[[ YeildForKey | Line: 80 | Upvalues: v2 (copy), v7 (ref), v1 (copy) ]]
	local v12 = tick()
	repeat
		if v2:Get("Key") then
			return v2:Get("Key")
		end
		task.wait()
	until tick() - v12 > 5 and not v7
	v1.GBWarn("Gamebeast key not found! Did you call Gamebeast:Setup()?")
	v7 = true
	return v2:Get("Key")
end
function t.OnFinalRequestCall(p1, p2) --[[ OnFinalRequestCall | Line: 97 | Upvalues: v5 (copy) ]]
	return v5:Connect(function() --[[ Line: 98 | Upvalues: p2 (copy) ]]
		local v1 = coroutine.running()
		p2()
		if v1 == coroutine.running() then
			return
		end
		error("Final request should not yeild!")
	end)
end
function t.GBRequest(p1, p2, p3, p4, p5) --[[ GBRequest | Line: 109 | Upvalues: GetEndpointForRequest (copy), v1 (copy) ]]
	local _, v12 = GetEndpointForRequest(p2)
	if v12 ~= "POST" then
		v1.GBWarn("GBRequest should only be used for POST requests. Use GBRequestAsync for other request types.")
	end
	task.spawn(function() --[[ Line: 115 | Upvalues: p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy) ]]
		p1:GBRequestAsync(p2, p3, p4, p5)
	end)
end
function t.GBRequestAsync(p1, p2, p3, p4, p5) --[[ GBRequestAsync | Line: 121 | Upvalues: YeildForKey (copy), GetEndpointForRequest (copy), v1 (copy), v6 (ref), v2 (copy), RunService (copy), t3 (copy), v4 (copy), HttpService (copy), v8 (ref) ]]
	local v12 = YeildForKey()
	local v22, v3 = GetEndpointForRequest(p2)
	if not (v22 and v3) then
		v1.GBWarn("Invalid request route:", p2)
		return false, nil
	end
	v6 = v6 + 1
	local v42 = nil
	local v5 = if p3 then p3 else {}
	local environment = v2:Get("Settings").environment
	local v7 = tostring(RunService:IsStudio())
	if environment and t3[environment] then
		v7 = t3[environment]
	end
	local t = {
		authorization = v12,
		isstudio = v7,
		sdkversion = v4.version
	}
	t.universeid = tostring(game.GameId)
	t.serverid = v1.getServerId()
	if p4 then
		for v9, v10 in p4 do
			t[v9] = v10
		end
	end
	local v11 = v22 .. "/" .. p2
	if v3 == "POST" or v3 == "PUT" then
		v42 = HttpService:JSONEncode(v5)
		t["Content-Type"] = "application/json"
	elseif v3 == "GET" then
		local v122 = "?"
		for v13, v14 in v5 do
			v122 = v122 .. v13 .. "=" .. HttpService:UrlEncode(v14) .. "&"
		end
		v11 = v11 .. string.sub(v122, 1, #v122 - 1)
	end
	local v15, v16 = v1.promiseReturn(p5 or 1, function() --[[ Line: 176 | Upvalues: HttpService (ref), v11 (ref), v3 (copy), t (copy), v42 (ref) ]]
		return HttpService:RequestAsync({
			Url = v11,
			Method = v3,
			Headers = t,
			Body = v42
		})
	end)
	v6 = v6 - 1
	local v17 = v16 and v15.Success or false
	if v15 and #v15.Body > 0 then
		if (v15.StatusCode == 401 or v15.StatusCode == 403) and not v8 then
			v1.GBWarn("Gamebeast project key invalid or not set! Set your project key in the :Setup method.")
			v8 = true
		end
		local v18 = v1.promiseReturn(0, function() --[[ Line: 195 | Upvalues: HttpService (ref), v15 (copy) ]]
			return HttpService:JSONDecode(v15.Body)
		end)
		if v17 == false then
			v1.GBWarn("Request failed (" .. v15.StatusCode .. ") | " .. (v18 and v18.message or "Unknown error"))
		end
		return v17, v18
	else
		return v17
	end
end
function t.Init(p1) --[[ Init | Line: 210 | Upvalues: v5 (copy), v6 (ref) ]]
	game:BindToClose(function() --[[ Line: 211 | Upvalues: v5 (ref), v6 (ref) ]]
		v5:Fire()
		repeat
			task.wait()
		until v6 == 0
	end)
end
for v9, v10 in t2 do
	for v11, v12 in v10.Requests do
		local v13 = string.split(v11, "/")
		local EndpointTree = v10.EndpointTree
		for v14, v15 in v13 do
			local v16 = if string.match(v15, "{(.*)}") == nil then false else true
			if not EndpointTree[v15] then
				if v16 then
					local t4 = {}
					setmetatable(EndpointTree, {
						__index = function(p1, p2) --[[ __index | Line: 232 | Upvalues: t4 (copy) ]]
							return t4
						end
					})
				else
					EndpointTree[v15] = {}
				end
			end
			EndpointTree = EndpointTree[v15]
		end
		EndpointTree.__method = v12
	end
end
return t