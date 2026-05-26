-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MessagingService = game:GetService("MessagingService")
require(ReplicatedStorage:WaitForChild("Sonar"))
return function(p1, p2) --[[ Line: 8 | Upvalues: MessagingService (copy) ]]
	local v1 = string.lower(p2)
	if v1 ~= "fling" and (v1 ~= "spin" and (v1 ~= "dismount" and v1 ~= "confetti")) then
		warn("Invalid action. Use: fling, spin, dismount, or confetti")
		return "Invalid action. Use: fling, spin, dismount, or confetti"
	end
	local v2 = v1
	warn("Publishing abuse command", v2)
	MessagingService:PublishAsync("Abuse_Command", {
		Action = v2
	})
	return v2 .. " applied to all players in boss fights across all servers"
end