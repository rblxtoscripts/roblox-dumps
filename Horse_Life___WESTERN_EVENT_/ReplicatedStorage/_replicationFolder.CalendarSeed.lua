-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("safeDestroy")
local v2 = Sonar("FormatTime")
local v3 = Sonar("Signal")
local v4 = Sonar("Maid")
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 43 | Upvalues: t (copy), v4 (copy), v3 (copy), v2 (copy) ]]
	local v1 = p1 or {}
	local v32 = setmetatable({}, t)
	v32.Maid = v4.new()
	v32.SeedType = v1.SeedType or "Monthly"
	v32.Offset = v32:_getOffset(v1.Offset)
	v32.SeedChanged = v3.new()
	v32.Maid:GiveTask(v32.SeedChanged)
	v32:_setSeed()
	v32.Maid:GiveTask(v2.OnTimeChanged(function() --[[ Line: 57 | Upvalues: v32 (copy) ]]
		v32:_timeChanged()
	end))
	return v32
end
function t.GetSeed(p1) --[[ GetSeed | Line: 65 ]]
	return p1.CurrentSeed
end
function t.GetEndTime(p1) --[[ GetEndTime | Line: 70 ]]
	return p1.EndTime
end
function t.GetTimeRemaining(p1) --[[ GetTimeRemaining | Line: 75 ]]
	return p1.EndTime - DateTime.now().UnixTimestamp
end
function t._timeChanged(p1) --[[ _timeChanged | Line: 80 ]]
	if not (DateTime.now().UnixTimestamp >= p1.EndTime) then
		return
	end
	p1:_setSeed()
end
function t._setSeed(p1) --[[ _setSeed | Line: 88 ]]
	local v1 = p1:_getSeed()
	if p1.CurrentSeed ~= v1 then
		p1.CurrentSeed = v1
		p1.EndTime = p1:_getEndTime()
		p1.SeedChanged:Fire(p1.CurrentSeed)
	end
end
function t._getSeed(p1) --[[ _getSeed | Line: 102 ]]
	local v2 = DateTime.fromUnixTimestamp(DateTime.now().UnixTimestamp + p1.Offset):ToUniversalTime()
	if p1.SeedType == "Monthly" then
		return v2.Year * 100 + v2.Month
	end
	if p1.SeedType == "Yearly" then
		return v2.Year
	else
		return -1
	end
end
function t._getEndTime(p1) --[[ _getEndTime | Line: 117 ]]
	return (p1.SeedType == "Monthly" and p1:_getStartOfNextMonth() or (if p1.SeedType == "Yearly" then p1:_getStartOfNextYear() else false)) + p1.Offset
end
function t._getStartOfNextMonth(p1) --[[ _getStartOfNextMonth | Line: 125 ]]
	local v1 = DateTime.now():ToUniversalTime()
	local v2 = v1.Month + 1
	local Year = v1.Year
	if v2 > 12 then
		Year = Year + 1
		v2 = 1
	end
	return DateTime.fromUniversalTime(Year, v2, 1).UnixTimestamp
end
function t._getStartOfNextYear(p1) --[[ _getStartOfNextYear | Line: 140 ]]
	return DateTime.fromUniversalTime(DateTime.now():ToUniversalTime().Year + 1, 1, 1).UnixTimestamp
end
function t._getOffset(p1, p2) --[[ _getOffset | Line: 146 ]]
	if typeof(p2) == "number" then
		return p2
	end
	if typeof(p2) ~= "table" and typeof(p2) ~= "DateTime" then
		return 0
	end
	if typeof(p2) == "DateTime" then
		p2 = p2:ToUniversalTime()
	end
	if p1.SeedType == "Monthly" then
		assert(if p2.Years == 0 then true elseif p2.Years == nil then true else false, "Years offset is not supported for monthly seeds")
		assert(if p2.Months == 0 then true elseif p2.Months == nil then true else false, "Months offset is not supported for monthly seeds")
	elseif p1.SeedType == "Yearly" then
		assert(if p2.Years == 0 then true elseif p2.Years == nil then true else false, "Years offset is not supported for yearly seeds")
	end
	return (p2.Seconds or 0) + (p2.Minutes or 0) * 60 + (p2.Hours or 0) * 3600 + (p2.Days or 0) * 86400 + (p2.Months or 0) * 2592000
end
function t.Destroy(p1) --[[ Destroy | Line: 171 | Upvalues: v1 (copy) ]]
	v1(p1)
end
return t