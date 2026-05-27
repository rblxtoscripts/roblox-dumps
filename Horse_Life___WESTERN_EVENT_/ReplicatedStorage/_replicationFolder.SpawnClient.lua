-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("TeleportService")
local v2 = Sonar("PlayerWrapper").GetClient()
task.spawn(function() --[[ Line: 10 | Upvalues: v2 (copy), v1 (copy) ]]
	v2:yieldForCharacter()
	v2.MovedToSpawn = true
	local SpawnLocation = v2.PlayerData.SpawnLocation.Value
	if not workspace:WaitForChild("SpawnLocations"):FindFirstChild(SpawnLocation) then
		return
	end
	if SpawnLocation == "Town" then
		return
	end
	if workspace:GetServerTimeNow() - v2.PlayerData.DailyLogin.LastLogin.Value > 259200 then
		return
	end
	v1:Teleport({
		Type = "ToLastSpawn",
		Transition = false
	})
end)
return {}