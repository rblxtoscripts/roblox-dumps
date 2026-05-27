-- https://lua.expert/
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
require(game.ReplicatedStorage.Sonar)
local t = {
	GetBuild = function(p1) --[[ GetBuild | Line: 11 ]]
		return ("%d"):format(game.PlaceVersion)
	end
}
function t.GetBuildWithServerType(p1) --[[ GetBuildWithServerType | Line: 20 | Upvalues: t (copy) ]]
	return t.GetServerType() .. " Build " .. t:GetBuild()
end
function t.GetServerType(p1) --[[ GetServerType | Line: 24 | Upvalues: t (copy) ]]
	if not t:IsPrivateServer() then
		return "Public"
	end
	if t:IsReserved() then
		return "Reserved"
	else
		return "Private"
	end
end
function t.IsPrivateServer(p1) --[[ IsPrivateServer | Line: 36 | Upvalues: RunService (copy) ]]
	if RunService:IsClient() then
		return workspace:FindFirstChild("IsPrivateServer")
	end
	return game.PrivateServerId ~= ""
end
function t.IsReserved(p1) --[[ IsReserved | Line: 43 | Upvalues: RunService (copy), t (copy) ]]
	if RunService:IsClient() then
		local v1 = t:IsPrivateServer()
		if v1 then
			return v1.Value == 0
		end
	end
	return if game.PrivateServerId == "" then false else game.PrivateServerOwnerId == 0
end
function t.GetServerRegionAsync(p1) --[[ GetServerRegionAsync | Line: 54 | Upvalues: HttpService (copy) ]]
	local v1 = nil
	local v2 = pcall(function() --[[ Line: 56 | Upvalues: v1 (ref), HttpService (ref) ]]
		v1 = HttpService:JSONDecode(HttpService:GetAsync("https://api4.my-ip.io/ip.json"))
	end)
	local ip = v1.ip
	if not (v2 and ip) then
		warn("Failed to get IP")
		return nil, nil
	end
	local v3 = nil
	local v4, v5 = pcall(function() --[[ Line: 63 | Upvalues: v3 (ref), HttpService (ref), ip (copy) ]]
		v3 = HttpService:JSONDecode(HttpService:GetAsync("http://ip-api.com/json/" .. ip))
	end)
	if v4 and (v3.region and v3.regionName) then
		return v3.region, v3.regionName
	else
		warn("Error fetching geolocation, error: " .. v5)
		return nil, nil
	end
end
function t.IsShuttingDown() --[[ IsShuttingDown | Line: 79 ]]
	return workspace:GetAttribute("ShuttingDown") == true
end
return t