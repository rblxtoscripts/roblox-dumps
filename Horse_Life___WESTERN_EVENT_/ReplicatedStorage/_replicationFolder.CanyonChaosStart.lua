-- https://lua.expert/
game:GetService("ReplicatedStorage")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("CanyonChaos")
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 12 | Upvalues: t (copy), v2 (copy), v3 (copy), v4 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.InteractPoint = p1
	v22.Maid = v2.new()
	v22.Maid:GiveTask(v3.new(p1, {
		ShowHintLabel = true,
		Hint = "Start Minigame",
		Run = function() --[[ Run | Line: 21 | Upvalues: v4 (ref) ]]
			v4.new()
		end,
		GetRange = function() --[[ GetRange | Line: 24 ]]
			return 30
		end,
		Visibility = function() --[[ Visibility | Line: 28 | Upvalues: v4 (ref) ]]
			return not v4.IsRunning()
		end
	}))
	v22.Maid:GiveTask(function() --[[ Line: 33 | Upvalues: v22 (copy) ]]
		setmetatable(v22, nil)
	end)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 40 ]]
	p1.Maid:DoCleaning()
end
function t.Init() --[[ Init | Line: 44 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("CanyonChaos", t):Init()
	for v12, v2 in workspace:WaitForChild("Events"):WaitForChild("Valentines"):WaitForChild("DeliveryNodes"):GetChildren() do
		v2.Transparency = 1
	end
end
t.Init()
return t