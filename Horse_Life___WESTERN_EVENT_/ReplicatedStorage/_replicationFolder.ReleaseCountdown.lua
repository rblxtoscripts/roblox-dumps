-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("Binder")
local v3 = Sonar("TimeUtils")
function t.new(p1) --[[ new | Line: 13 | Upvalues: t (copy), v1 (copy), v3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.TimerLabel = p1:WaitForChild("TimerLabel")
	v2.Maid:GiveTask(v3.AttachToTime(function() --[[ Line: 19 | Upvalues: v2 (copy), v3 (ref) ]]
		v2.TimerLabel.Text = v3.FormatString(1717156800 - v3.Get())
	end))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 26 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 31 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("ReleaseCountdown", t):Init()
end
t:Init()
return t