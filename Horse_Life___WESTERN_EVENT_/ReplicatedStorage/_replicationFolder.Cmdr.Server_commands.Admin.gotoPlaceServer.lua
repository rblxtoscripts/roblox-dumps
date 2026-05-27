-- https://lua.expert/
local TeleportService = game:GetService("TeleportService")
return function(p1, p2, p3, p4) --[[ Line: 3 | Upvalues: TeleportService (copy) ]]
	local v1 = if p2 then p2 else { p1.Executor }
	if p3 <= 0 then
		return "Invalid place ID"
	end
	if p4 == "-" then
		return "Invalid job ID"
	end
	p1:Reply("Commencing teleport...")
	if p4 then
		for i, v in ipairs(v1) do
			TeleportService:TeleportToPlaceInstance(p3, p4, v)
		end
	else
		TeleportService:TeleportPartyAsync(p3, v1)
	end
	return "Teleported."
end