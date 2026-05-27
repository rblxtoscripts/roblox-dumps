-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("TimeUtils")
local t = {}
t.__index = t
function t.Init() --[[ Init | Line: 9 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("Timer", t):Init()
end
function t.new(p1) --[[ new | Line: 14 | Upvalues: t (copy), v2 (copy), v3 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Timer = p1
	v22.Timestamp = p1.Timestamp.Value
	v22.Gui = p1.SurfaceGui
	v22.Maid = v2.new()
	v22.Maid:GiveTask(v3.AttachToTime(function() --[[ Line: 24 | Upvalues: v22 (copy), v3 (ref) ]]
		local v1 = v22.Timestamp - v3.Get()
		if v1 <= 0 then
			v22.Gui.TimerLabel.Text = "Event releasing soon..."
		else
			v22.Gui.TimerLabel.Text = v3.FormatString(v1)
		end
	end))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 56 | Upvalues: t (copy) ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, t)
end
t.Init()
return t