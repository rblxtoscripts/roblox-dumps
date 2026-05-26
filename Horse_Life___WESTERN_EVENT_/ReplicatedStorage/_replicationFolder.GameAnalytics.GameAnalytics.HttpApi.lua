-- https://lua.expert/
game:GetService("RunService")
local Validation = require(script.Parent.Validation)
local Version = require(script.Parent.Version)
local HashLib = require(script.HashLib)
local t = {
	protocol = "https",
	hostName = "api.gameanalytics.com",
	version = "v2",
	remoteConfigsVersion = "v1",
	initializeUrlPath = "init",
	eventsUrlPath = "events",
	EGAHTTPApiResponse = {
		NoResponse = 0,
		BadResponse = 1,
		RequestTimeout = 2,
		JsonEncodeFailed = 3,
		JsonDecodeFailed = 4,
		InternalServerError = 5,
		BadRequest = 6,
		Unauthorized = 7,
		UnknownResponseCode = 8,
		Ok = 9,
		Created = 10
	}
}
local HttpService = game:GetService("HttpService")
local Logger = require(script.Parent.Logger)
local v1 = t.protocol .. "://" .. "" .. t.hostName .. "/" .. t.version
local v2 = t.protocol .. "://" .. "" .. t.hostName .. "/remote_configs/" .. t.remoteConfigsVersion
local function getInitAnnotations(p1, p2, p3) --[[ getInitAnnotations | Line: 35 | Upvalues: Version (copy) ]]
	return {
		user_id = tostring(p3) .. p2.CustomUserId,
		sdk_version = "roblox " .. Version.SdkVersion,
		os_version = p2.OS,
		platform = p2.Platform,
		build = p1,
		session_num = p2.Sessions,
		random_salt = p2.Sessions
	}
end
local function encode(p1, p2) --[[ encode | Line: 49 | Upvalues: Logger (copy), HashLib (copy) ]]
	if p2 then
		return HashLib.base64_encode((HashLib.hmac(HashLib.sha256, p2, p1, true)))
	else
		Logger:w("Error encoding, invalid SecretKey")
	end
end
local function processRequestResponse(p1, p2) --[[ processRequestResponse | Line: 67 | Upvalues: Logger (copy), t (copy) ]]
	local StatusCode = p1.StatusCode
	local Body = p1.Body
	if Body and #Body ~= 0 then
		if StatusCode == 200 then
			return t.EGAHTTPApiResponse.Ok
		end
		if StatusCode == 201 then
			return t.EGAHTTPApiResponse.Created
		end
		if StatusCode == 0 or StatusCode == 401 then
			Logger:d(p2 .. " request. 401 - Unauthorized.")
			return t.EGAHTTPApiResponse.Unauthorized
		end
		if StatusCode == 400 then
			Logger:d(p2 .. " request. 400 - Bad Request.")
			return t.EGAHTTPApiResponse.BadRequest
		end
		if StatusCode == 500 then
			Logger:d(p2 .. " request. 500 - Internal Server Error.")
			return t.EGAHTTPApiResponse.InternalServerError
		else
			return t.EGAHTTPApiResponse.UnknownResponseCode
		end
	else
		Logger:d(p2 .. " request. failed. Might be no connection. Status code: " .. tostring(StatusCode))
		return t.EGAHTTPApiResponse.NoResponse
	end
end
function t.initRequest(p1, p2, p3, p4, p5, p6) --[[ initRequest | Line: 94 | Upvalues: v2 (copy), t (copy), Logger (copy), HttpService (copy), Version (copy), HashLib (copy), processRequestResponse (copy), Validation (copy) ]]
	local v1 = v2 .. "/" .. t.initializeUrlPath .. "?game_key=" .. p2 .. "&interval_seconds=0&configs_hash=" .. (p5.ConfigsHash or "")
	Logger:d("Sending \'init\' URL: " .. v1)
	local v22 = HttpService:JSONEncode({
		user_id = tostring(p6) .. p5.CustomUserId,
		sdk_version = "roblox " .. Version.SdkVersion,
		os_version = p5.OS,
		platform = p5.Platform,
		build = p4,
		session_num = p5.Sessions,
		random_salt = p5.Sessions
	}):gsub("\"country_code\":\"unknown\"", "\"country_code\":null")
	local v3 = v22
	local v4
	if p3 then
		v4 = HashLib.base64_encode((HashLib.hmac(HashLib.sha256, p3, v3, true)))
	else
		Logger:w("Error encoding, invalid SecretKey")
		v4 = nil
	end
	Logger:d("init payload: " .. v22)
	local v6 = nil
	local v7, v8 = pcall(function() --[[ Line: 109 | Upvalues: v6 (ref), HttpService (ref), v1 (ref), v4 (copy), v22 (ref) ]]
		v6 = HttpService:RequestAsync({
			Method = "POST",
			Url = v1,
			Headers = {
				Authorization = v4,
				["Content-Type"] = "application/json"
			},
			Body = v22
		})
	end)
	if not v7 then
		Logger:d("Failed Init Call. error: " .. v8)
		return {
			body = nil,
			statusCode = t.EGAHTTPApiResponse.UnknownResponseCode
		}
	end
	Logger:d("init request content: " .. v6.Body)
	local v9 = processRequestResponse(v6, "Init")
	if v9 ~= t.EGAHTTPApiResponse.Ok and (v9 ~= t.EGAHTTPApiResponse.Created and v9 ~= t.EGAHTTPApiResponse.BadRequest) then
		Logger:d("Failed Init Call. URL: " .. v1 .. ", JSONString: " .. v22 .. ", Authorization: " .. v4)
		return {
			body = nil,
			statusCode = v9
		}
	end
	local v10 = nil
	if not pcall(function() --[[ Line: 143 | Upvalues: v10 (ref), HttpService (ref), v6 (ref) ]]
		v10 = HttpService:JSONDecode(v6.Body)
	end) then
		Logger:d("Failed Init Call. Json decoding failed: " .. v8)
		return {
			body = nil,
			statusCode = t.EGAHTTPApiResponse.JsonDecodeFailed
		}
	end
	if v9 == t.EGAHTTPApiResponse.BadRequest then
		Logger:d("Failed Init Call. Bad request. Response: " .. v6.Body)
		return {
			body = nil,
			statusCode = v9
		}
	end
	local v12 = v10
	if Validation:validateAndCleanInitRequestResponse(v12, v9 == t.EGAHTTPApiResponse.Created) then
		return {
			statusCode = v9,
			body = v10
		}
	else
		return {
			body = nil,
			statusCode = t.EGAHTTPApiResponse.BadResponse
		}
	end
end
function t.sendEventsInArray(p1, p2, p3, p4) --[[ sendEventsInArray | Line: 181 | Upvalues: Logger (copy), v1 (copy), HttpService (copy), HashLib (copy), t (copy), processRequestResponse (copy) ]]
	if not p4 or #p4 == 0 then
		Logger:d("sendEventsInArray called with missing eventArray")
		return
	end
	local v12 = v1 .. "/" .. p2 .. "/" .. p1.eventsUrlPath
	Logger:d("Sending \'events\' URL: " .. v12)
	local v2 = HttpService:JSONEncode(p4):gsub("\"country_code\":\"unknown\"", "\"country_code\":null")
	local v3 = v2
	local v4
	if p3 then
		v4 = HashLib.base64_encode((HashLib.hmac(HashLib.sha256, p3, v3, true)))
	else
		Logger:w("Error encoding, invalid SecretKey")
		v4 = nil
	end
	local v6 = nil
	local v7, v8 = pcall(function() --[[ Line: 201 | Upvalues: v6 (ref), HttpService (ref), v12 (ref), v4 (copy), v2 (ref) ]]
		v6 = HttpService:RequestAsync({
			Method = "POST",
			Url = v12,
			Headers = {
				Authorization = v4,
				["Content-Type"] = "application/json"
			},
			Body = v2
		})
	end)
	if not v7 then
		Logger:d("Failed Events Call. error: " .. v8)
		return {
			body = nil,
			statusCode = t.EGAHTTPApiResponse.UnknownResponseCode
		}
	end
	Logger:d("body: " .. v6.Body)
	local v9 = processRequestResponse(v6, "Events")
	if v9 ~= t.EGAHTTPApiResponse.Ok and (v9 ~= t.EGAHTTPApiResponse.Created and v9 ~= t.EGAHTTPApiResponse.BadRequest) then
		Logger:d("Failed Events Call. URL: " .. v12 .. ", JSONString: " .. v2 .. ", Authorization: " .. v4)
		return {
			body = nil,
			statusCode = v9
		}
	end
	local v10 = nil
	pcall(function() --[[ Line: 235 | Upvalues: v10 (ref), HttpService (ref), v6 (ref) ]]
		v10 = HttpService:JSONDecode(v6.Body)
	end)
	if not v10 then
		Logger:d("Failed Events Call. Json decoding failed")
		return {
			body = nil,
			statusCode = t.EGAHTTPApiResponse.JsonDecodeFailed
		}
	end
	if v9 == t.EGAHTTPApiResponse.BadRequest then
		Logger:d("Failed Events Call. Bad request. Response: " .. v6.Body)
		return {
			body = nil,
			statusCode = v9
		}
	else
		return {
			statusCode = t.EGAHTTPApiResponse.Ok,
			body = v10
		}
	end
end
return t