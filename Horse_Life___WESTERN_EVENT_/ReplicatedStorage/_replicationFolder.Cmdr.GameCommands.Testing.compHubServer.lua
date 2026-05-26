-- https://lua.expert/
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Draw")
local IsTestGame = Sonar("Constants").IsTestGame
local CompHubTeleportPart = workspace:FindFirstChild("CompHubTeleportPart")
if CompHubTeleportPart and IsTestGame then
	CompHubTeleportPart.Touched:Connect(function(p1) --[[ Line: 15 | Upvalues: TeleportService (copy) ]]
		local v1 = game.Players:GetPlayerFromCharacter(p1.Parent)
		if not v1 then
			return
		end
		TeleportService:Teleport(101224150419293, v1)
	end)
	v1.text(CompHubTeleportPart, "Competitive Hub Teleport")
elseif CompHubTeleportPart then
	CompHubTeleportPart:Destroy()
end
return function(p1, p2) --[[ Line: 28 | Upvalues: IsTestGame (copy), TeleportService (copy) ]]
	if not IsTestGame then
		return "This command can only be used in the Test Build"
	end
	for v1, v2 in p2 do
		TeleportService:Teleport(101224150419293, v2)
	end
	return ("Teleporting %d player(s) to Competitive Hub..."):format(#p2)
end