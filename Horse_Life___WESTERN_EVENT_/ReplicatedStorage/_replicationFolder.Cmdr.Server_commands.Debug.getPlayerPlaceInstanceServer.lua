-- https://lua.expert/
local TeleportService = game:GetService("TeleportService")
return function(p1, p2, p3) --[[ Line: 3 | Upvalues: TeleportService (copy) ]]
	local v1 = p3 or "PlaceIdJobId"
	local v2, _, v3, v4, v5 = pcall(function() --[[ Line: 6 | Upvalues: TeleportService (ref), p2 (copy) ]]
		return TeleportService:GetPlayerPlaceInstanceAsync(p2)
	end)
	if not v2 or v3 and #v3 > 0 then
		if v1 == "PlaceIdJobId" then
			return "0 -"
		end
		if v1 == "PlaceId" then
			return "0"
		end
		if v1 == "JobId" then
			return "-"
		end
	end
	if v1 == "PlaceIdJobId" then
		return v4 .. " " .. v5
	end
	if v1 == "PlaceId" then
		return tostring(v4)
	end
	if v1 == "JobId" then
		return tostring(v5)
	end
end