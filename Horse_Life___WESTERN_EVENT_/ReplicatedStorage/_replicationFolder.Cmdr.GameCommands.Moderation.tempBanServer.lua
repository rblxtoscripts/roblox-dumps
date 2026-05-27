-- https://lua.expert/
local Players = game:GetService("Players")
require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
return function(p1, p2, p3, p4) --[[ Line: 13 | Upvalues: Players (copy) ]]
	local v1 = Players:GetUserIdFromNameAsync(p2)
	print("Attempting tempban of", p2, "-", v1, "by", p1.Executor.Name)
	if v1 then
		Players:BanAsync({
			ApplyToUniverse = true,
			ExcludeAltAccounts = false,
			UserIds = { v1 },
			Duration = p3,
			DisplayReason = p4,
			PrivateReason = p2 .. " was banned by " .. p1.Executor.Name
		})
		return ("Banned %d players."):format(1)
	else
		return "Failed to get player"
	end
end