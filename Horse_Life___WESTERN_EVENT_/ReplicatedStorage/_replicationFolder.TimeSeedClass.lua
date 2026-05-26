-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("TimeUtils")
local v2 = Sonar("Signal")
local v3 = Sonar("Maid")
local TimeSyncStart = Sonar("Constants").TimeSyncStart
function t.new(p1) --[[ new | Line: 17 | Upvalues: t (copy), v3 (copy), TimeSyncStart (copy), v2 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v3.new()
	v22.StartTime = p1.Start or TimeSyncStart
	v22.Duration = p1.Duration
	v22.TimeChanged = v2.new()
	v22.Maid:GiveTask(v22.TimeChanged)
	v22.SeedChanged = v2.new()
	v22.Maid:GiveTask(v22.SeedChanged)
	if p1.OnSeedChanged then
		v22.Maid:GiveTask(v22.SeedChanged:Connect(p1.OnSeedChanged))
	end
	v22.CurrentSeed = -1
	v22:_setSeed(true)
	v22.Maid:GiveTask(v1.AttachToTime(function() --[[ Line: 37 | Upvalues: v22 (copy) ]]
		v22:_timeChanged()
	end))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 44 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t._setSeed(p1, p2) --[[ _setSeed | Line: 50 ]]
	p1.CurrentSeed = p1:_getSeed()
	p1.EndTime = p1:_getEndTime()
	p1.SeedChanged:Fire(p1.CurrentSeed, p2, p1)
end
function t._getSeed(p1) --[[ _getSeed | Line: 58 | Upvalues: v1 (copy) ]]
	return math.max(0, math.floor((v1.Get() - p1.StartTime) / p1.Duration) + 1)
end
function t._isSeedDifferent(p1) --[[ _isSeedDifferent | Line: 63 ]]
	local isNotCurrentSeed = p1:_getSeed() ~= p1.CurrentSeed
	return isNotCurrentSeed
end
function t._getEndTime(p1) --[[ _getEndTime | Line: 68 ]]
	return p1.StartTime + p1.Duration * p1.CurrentSeed
end
function t.GetStartTime(p1) --[[ GetStartTime | Line: 73 ]]
	return p1.StartTime + p1.Duration * (p1.CurrentSeed - 1)
end
function t._timeChanged(p1) --[[ _timeChanged | Line: 77 ]]
	if p1:_isSeedDifferent() then
		p1:_setSeed()
	end
	p1.TimeChanged:Fire(p1:GetTime())
end
function t.GetTime(p1) --[[ GetTime | Line: 85 | Upvalues: v1 (copy) ]]
	return math.max(0, p1.EndTime - v1.Get())
end
function t.GetTimeTillStart(p1) --[[ GetTimeTillStart | Line: 90 | Upvalues: v1 (copy) ]]
	return math.max(0, p1.StartTime - v1.Get())
end
function t.GetRelativeStartTime(p1) --[[ GetRelativeStartTime | Line: 94 ]]
	return p1.EndTime - p1.Duration
end
function t.UpdateStartTime(p1, p2) --[[ UpdateStartTime | Line: 98 ]]
	p1.StartTime = p2
	p1:_timeChanged()
end
return t