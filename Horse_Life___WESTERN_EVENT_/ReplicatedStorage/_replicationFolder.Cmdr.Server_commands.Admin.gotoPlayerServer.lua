-- https://lua.expert/
local TeleportService = game:GetService("TeleportService")
return function(p1, p2, p3) --[[ Line: 3 | Upvalues: TeleportService (copy) ]]
	local v1 = if p2 then p2 else { p1.Executor }
	p1:Reply("Commencing teleport...")
	local v2, _, _2, v3, v4 = pcall(TeleportService.GetPlayerPlaceInstanceAsync, TeleportService, p3)
	if not v2 then
		return "Error with teleporting."
	end
	for i, v in ipairs(v1) do
		TeleportService:TeleportToPlaceInstance(v3, v4, v)
	end
	return "Teleported."
end