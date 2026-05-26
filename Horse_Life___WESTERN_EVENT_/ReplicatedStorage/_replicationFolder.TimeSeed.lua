-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("FormatTime")
local v2 = Sonar("Signal")
local v3 = Sonar("Maid")
local v4 = Sonar("safeDestroy")
local v5 = Sonar("Constants")
v5.TimeSyncStart = v5.TimeSyncStart or 1622419200
local TimeSyncStart = v5.TimeSyncStart
function t.new(p1) --[[ new | Line: 19 | Upvalues: t (copy), v3 (copy), TimeSyncStart (copy), v2 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v3.new()
	v22.StartTime = p1.Start or TimeSyncStart
	v22.EndTimeBounds = p1.End
	v22.Duration = v22.EndTimeBounds and v22.EndTimeBounds - v22.StartTime or p1.Duration
	v22.TimeChanged = v2.new()
	v22.Maid:GiveTask(v22.TimeChanged)
	v22.SeedChanged = v2.new()
	v22.Maid:GiveTask(v22.SeedChanged)
	if p1.OnSeedChanged then
		v22.Maid:GiveTask(v22.SeedChanged:Connect(p1.OnSeedChanged))
	end
	v22.CurrentSeed = -1
	if v22.DoNotDeferSeedInit then
		task.defer(function() --[[ Line: 44 | Upvalues: v22 (copy) ]]
			v22:_setSeed(true)
		end)
	else
		v22:_setSeed(true)
	end
	v22.Maid:GiveTask(v1.OnTimeChanged(function() --[[ Line: 49 | Upvalues: v22 (copy) ]]
		v22:_timeChanged()
	end))
	v22:_setSeed(true)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 58 | Upvalues: v4 (copy) ]]
	v4(p1)
end
function t._setSeed(p1, p2) --[[ _setSeed | Line: 63 ]]
	p1.CurrentSeed = p1:_getSeed()
	p1.EndTime = p1:_getEndTime()
	p1.SeedChanged:Fire(p1.CurrentSeed, p2, p1)
end
function t._getSeed(p1) --[[ _getSeed | Line: 71 | Upvalues: v1 (copy) ]]
	return math.max(0, math.floor((v1.GetTime() - p1.StartTime) / p1.Duration) + 1)
end
function t._isSeedDifferent(p1) --[[ _isSeedDifferent | Line: 76 ]]
	local isNotCurrentSeed = p1:_getSeed() ~= p1.CurrentSeed
	return isNotCurrentSeed
end
function t._getEndTime(p1, p2) --[[ _getEndTime | Line: 81 ]]
	return p1.StartTime + p1.Duration * (if p2 then p2 else p1.CurrentSeed)
end
function t._timeChanged(p1) --[[ _timeChanged | Line: 86 ]]
	if p1:_isSeedDifferent() then
		p1:_setSeed()
	end
	p1.TimeChanged:Fire(p1:GetTime())
end
function t.GetTime(p1) --[[ GetTime | Line: 94 | Upvalues: v1 (copy) ]]
	return math.max(0, p1.EndTime - v1.GetTime())
end
function t.GetTimeTillStart(p1) --[[ GetTimeTillStart | Line: 99 | Upvalues: v1 (copy) ]]
	return math.max(0, p1.StartTime - v1.Get())
end
function t.GetRelativeStartTime(p1) --[[ GetRelativeStartTime | Line: 103 ]]
	return p1.EndTime - p1.Duration
end
function t.UpdateStartTime(p1, p2) --[[ UpdateStartTime | Line: 107 ]]
	p1.StartTime = p2
	p1:_timeChanged()
end
function t.GetSeed(p1) --[[ GetSeed | Line: 112 ]]
	return p1.CurrentSeed
end
function t.GetEndTime(p1) --[[ GetEndTime | Line: 116 ]]
	return p1.EndTime or p1:_getEndTime()
end
return t