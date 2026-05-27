-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("NotificationsClient")
local v2 = Sonar("MessagesClient")
local v3 = Sonar("FormatString")
function t.init() --[[ init | Line: 10 | Upvalues: v1 (copy), v2 (copy), v3 (copy) ]]
	v1.AddNotificationCallback("GlobalBossStart", function(p1) --[[ Line: 11 | Upvalues: v2 (ref), v3 (ref) ]]
		v2:AddNotification({
			Type = "GlobalBossStart",
			DoNotSkip = true,
			Duration = 10,
			Text = "A " .. string.upper(v3.separateWordsInString(p1)) .. " GLOBAL BOSS HAS APPEARED!"
		})
	end)
end
t.init()
return t