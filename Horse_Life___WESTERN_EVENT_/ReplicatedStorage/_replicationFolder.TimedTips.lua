-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper").GetClient()
local v2 = Sonar("Constants")
local v3 = Sonar("EventUtils")
local v4 = Sonar("NotificationsClient")
local Tips = v2.Tips
local v5 = table.clone(Tips)
v3.spawnLoop(function() --[[ Line: 19 | Upvalues: v5 (ref), Tips (copy), v1 (copy), v4 (copy) ]]
	if #v5 <= 0 then
		v5 = table.clone(Tips)
	end
	local v12 = math.random(1, #v5)
	local v2 = v5[v12]
	if v1.PlayerData.Settings.States.ChatTips.Value then
		v4.SendSystemMessage({
			Message = v2
		}, {
			Prefix = "[Tip]",
			TextSize = 16,
			ChatColor = Color3.new(0.45098, 0.85098, 0.631373),
			Font = Enum.Font.SourceSansSemibold
		})
	end
	table.remove(v5, v12)
end, v2.TimeBetweenTips)
return {}