-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("NotificationsClient")
local v6 = Sonar("TimeUtils")
local v7 = Sonar("Snowball")
local v8 = v4.GetRemoteEvent("StartSnowmanMinigame")
local Christmas2024 = Sonar("Constants").Christmas2024
local t = {}
function t.new(p1) --[[ new | Line: 18 | Upvalues: t (copy), v2 (copy), v3 (copy), v8 (copy), v7 (copy), v5 (copy), v6 (copy), Christmas2024 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Maid:GiveTask(v3.new(p1, {
		ShowHintLabel = true,
		Hint = "Make Snowman!",
		Run = function() --[[ Run | Line: 25 | Upvalues: v8 (ref), v7 (ref), v5 (ref), v6 (ref), Christmas2024 (ref) ]]
			local v1, v2 = v8:InvokeServer()
			if v1 == true then
				v7.Start()
			else
				local t = {
					Preset = "Red"
				}
				t.Message = "Minigame on cooldown for " .. v6.FormatString((math.ceil(Christmas2024.CoolDown * 60 - (workspace:GetServerTimeNow() - v2))))
				v5.Notify(t)
			end
		end,
		GetRange = function() --[[ GetRange | Line: 37 ]]
			return 30
		end,
		Visibility = function() --[[ Visibility | Line: 41 | Upvalues: v7 (ref) ]]
			return not v7.IsRunning()
		end
	}))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 49 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 55 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("SnowmanStart", t):Init()
end
t.Init()
return t