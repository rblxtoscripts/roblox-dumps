-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper").GetClient()
local v3 = Sonar("InteractMenu")
Sonar("PromptClient")
local v4 = Sonar("Binder")
local v5 = Sonar("Maid")
local t = {}
t.__index = t
local v6 = v1.GetRemoteFunction("UnlockAchievements")
local _ = {
	[true] = {
		Image = "rbxassetid://16661322264",
		Color = Color3.fromRGB(154, 255, 117)
	},
	[false] = {
		Image = "rbxassetid://16651378674",
		Color = Color3.fromRGB(255, 125, 127)
	}
}
function t.new(p1) --[[ new | Line: 25 | Upvalues: t (copy), v5 (copy), v3 (copy), v6 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Object = p1
	v2.Maid = v5.new()
	v2.Maid:GiveTask(v3.new(v2.Object, {
		ShowHintLabel = true,
		Hint = "Unlock",
		Run = function() --[[ Run | Line: 35 | Upvalues: v6 (ref) ]]
			if not v6:InvokeServer() then
				return
			end
			workspace:WaitForChild("Interactions").AchivementDoor:Destroy()
		end,
		GetRange = function() --[[ GetRange | Line: 64 ]]
			return 20
		end,
		Visibility = function() --[[ Visibility | Line: 68 ]]
			return true
		end
	}))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 76 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 81 | Upvalues: v2 (copy), v4 (copy), t (copy) ]]
	local AchievementsUnlocked = v2.PlayerData.AchievementsUnlocked.Value
	v4.new("AchievementGate", t):Init()
end
t.Init()
return t