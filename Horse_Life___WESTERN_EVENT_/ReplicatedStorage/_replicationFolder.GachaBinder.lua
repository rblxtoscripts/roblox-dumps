-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("GachaMachineGui")
local v2 = Sonar("InteractMenu")
local v3 = Sonar("Binder")
local v4 = Sonar("Maid")
local t = {}
t.__index = t
function t.Init() --[[ Init | Line: 10 | Upvalues: v3 (copy), t (copy) ]]
	v3.new("GachaInteract", t):Init()
end
function t.new(p1) --[[ new | Line: 15 | Upvalues: t (copy), v4 (copy), v2 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.SpawnPad = p1
	v22.Maid = v4.new()
	v22.Maid:GiveTask(v2.new(v22.SpawnPad, {
		Hint = "Open Gacha Machine",
		GetRange = function() --[[ GetRange | Line: 22 ]]
			return 30
		end,
		Run = function() --[[ Run | Line: 26 | Upvalues: v1 (ref), v22 (copy) ]]
			v1.Open(nil, v22.SpawnPad.Type.Value)
		end
	}))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 34 | Upvalues: t (copy) ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, t)
end
t.Init()
return t