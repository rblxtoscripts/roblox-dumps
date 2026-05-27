-- https://lua.expert/
local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")
return function(p1, p2) --[[ Line: 5 | Upvalues: TeleportService (copy), MarketplaceService (copy) ]]
	p1:Reply("Locating " .. p2 .. "\'s server..")
	local v1, _, v2, v3, v4 = pcall(function() --[[ Line: 9 | Upvalues: TeleportService (ref), p2 (copy) ]]
		return TeleportService:GetPlayerPlaceInstanceAsync(p2)
	end)
	if not v1 or v2 and #v2 > 0 then
		return "Failed to retrieve target player\'s server details. Are you sure the user is online?"
	end
	if v3 <= 0 then
		return "Invalid place ID."
	end
	if v4 == "-" then
		return "Invalid job ID. This user may be in a private server."
	end
	local v5, v6 = pcall(function() --[[ Line: 24 | Upvalues: MarketplaceService (ref), v3 (copy) ]]
		return MarketplaceService:GetProductInfo(v3, Enum.InfoType.Asset)
	end)
	local v7 = v5 and v6 and v6.Name or "Unknown Game"
	for i = 3, 1, -1 do
		p1:Reply(string.format("(%d) Teleporting to %s in %s", i, p2, v7))
		task.wait(1)
	end
	TeleportService:TeleportToPlaceInstance(v3, v4, p1.Executor)
	return "Teleport requested"
end