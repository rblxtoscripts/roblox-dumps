-- https://lua.expert/
local TeleportService = game:GetService("TeleportService")
local isGameId = game.GameId == 5749134964
return function(p1) --[[ Line: 9 | Upvalues: isGameId (copy), TeleportService (copy) ]]
	if isGameId then
		TeleportService:Teleport(127981259757046, p1.Executor)
		return "Teleporting to parallel test place..."
	else
		return "This command can only be used in the Test Build"
	end
end