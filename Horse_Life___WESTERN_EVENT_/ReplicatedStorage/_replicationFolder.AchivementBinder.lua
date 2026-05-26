-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("AchievementGui")
local v2 = Sonar("InteractMenu")
local v3 = Sonar("Binder")
local v4 = Sonar("Maid")
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 10 | Upvalues: t (copy), v4 (copy), v2 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Object = p1
	v22.Maid = v4.new()
	v22.Maid:GiveTask(v2.new(v22.Object, {
		ShowHintLabel = true,
		Hint = "Achievements",
		Run = function() --[[ Run | Line: 20 | Upvalues: v1 (ref) ]]
			v1.Open()
		end,
		GetRange = function() --[[ GetRange | Line: 24 ]]
			return 20
		end,
		Visibility = function() --[[ Visibility | Line: 28 ]]
			return true
		end
	}))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 36 ]]
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 40 | Upvalues: v3 (copy), t (copy) ]]
	v3.new("AchivementPrompt", t):Init()
end
t.Init()
return t