-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
local isGameId = game.GameId == 5749134964
return function(p1) --[[ Line: 14 | Upvalues: isGameId (copy), v1 (copy), TeleportService (copy) ]]
	if not isGameId then
		return "This command can only be used in the Test Build"
	end
	local Executor = p1.Executor
	local v12 = v1.getWrapperFromPlayer(Executor)
	if not v12 then
		return "Something went wrong"
	end
	local v2 = nil
	if (if v2 then v2 elseif Executor.UserId == 3872958933 then true else false) or (if Executor:GetRankInGroupAsync(34961104) == 100 then true else false) or v12:HasPermission("Developer") then
		TeleportService:Teleport(116185176304253, Executor)
		return "Teleporting to menu test place..."
	else
		return "You are unable to teleport to the menu at this time"
	end
end