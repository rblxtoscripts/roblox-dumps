-- https://lua.expert/
local t = {}
t.__index = t
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("TimeUtils")
local v2 = Sonar("Signal")
local v3 = Sonar("Maid")
local v4 = game:GetService("RunService"):IsServer()
function t.new(p1) --[[ new | Line: 13 | Upvalues: t (copy), v3 (copy), v2 (copy), v1 (copy) ]]
	local v32 = setmetatable(if p1 then p1 else {}, t)
	v32.Maid = v3.new()
	v32.TimeChanged = v2.new()
	v32.Maid:GiveTask(v32.TimeChanged)
	v32.StateChanged = v2.new()
	v32.Maid:GiveTask(v32.StateChanged)
	v32.SeedChanged = v2.new()
	v32.Maid:GiveTask(v32.SeedChanged)
	v32.Active = false
	v32.OpenTimes = v32.OpenTimes or {
		{
			Start = 21600,
			End = 36000
		},
		{
			Start = 64800,
			End = 79200
		}
	}
	v32.Duration = v32.Duration or 86400
	v32.StartTime = v32.Start or 0
	v32.CurrentSeed = -1
	v32:_updateState()
	v32:_setSeed(true)
	v32.Maid:GiveTask(v1.AttachToTime(function() --[[ Line: 36 | Upvalues: v32 (copy) ]]
		v32:_timeChanged()
	end))
	return v32
end
function t.Destroy(p1) --[[ Destroy | Line: 43 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t._timeChanged(p1) --[[ _timeChanged | Line: 49 ]]
	p1:_updateState()
	if p1.Active ~= p1.Active then
		p1.StateChanged:Fire(p1.Active)
	end
	if p1.CurrentSeed ~= p1.CurrentSeed then
		p1.SeedChanged:Fire(p1.CurrentSeed, false, p1)
	end
	p1.TimeChanged:Fire(p1:GetTimeUntilNextChange())
end
function t._updateState(p1) --[[ _updateState | Line: 67 | Upvalues: v1 (copy), v4 (copy) ]]
	local v12 = v1.Get()
	if v12 < p1.StartTime then
		p1.Active = false
	else
		v12 = (v12 - p1.StartTime) % p1.Duration
		p1.Active = false
		for i, v in ipairs(p1.OpenTimes) do
			if v.Start <= v12 and v12 < v.End then
				p1.Active = true
				break
			end
		end
	end
	p1:_setSeed()
	return v12
end
function t._setSeed(p1, p2) --[[ _setSeed | Line: 92 ]]
	local v1 = p1:_getSeed()
	if v1 == p1.CurrentSeed then
		return
	end
	p1.CurrentSeed = v1
	if p2 then
		return
	end
	p1.SeedChanged:Fire(p1.CurrentSeed, p2, p1)
end
function t._getSeed(p1) --[[ _getSeed | Line: 103 | Upvalues: v1 (copy) ]]
	local v12 = v1.Get() - p1.StartTime
	if v12 < 0 then
		return 0
	else
		return math.max(0, math.floor(v12 / p1.Duration) + 1)
	end
end
function t.IsActive(p1) --[[ IsActive | Line: 110 ]]
	return p1.Active
end
function t.GetTimeUntilNextChange(p1) --[[ GetTimeUntilNextChange | Line: 115 | Upvalues: v1 (copy) ]]
	local v12 = v1.Get()
	if v12 < p1.StartTime then
		return p1.StartTime - v12
	end
	local v2 = (v12 - p1.StartTime) % p1.Duration
	local v3 = (1 / 0)
	for i, v in ipairs(p1.OpenTimes) do
		if v2 < v.Start then
			v3 = math.min(v3, v.Start - v2)
			continue
		end
		if v.Start <= v2 and v2 < v.End then
			v3 = math.min(v3, v.End - v2)
		end
	end
	if v3 == (1 / 0) and #p1.OpenTimes > 0 then
		v3 = p1.Duration - v2 + p1.OpenTimes[1].Start
	end
	return v3
end
function t.GetTimeUntilClose(p1) --[[ GetTimeUntilClose | Line: 142 | Upvalues: v1 (copy) ]]
	if not p1:IsActive() then
		return 0
	end
	local v12 = (v1.Get() - p1.StartTime) % p1.Duration
	for i, v in ipairs(p1.OpenTimes) do
		if v.Start <= v12 and v12 < v.End then
			return v.End - v12
		end
	end
	return 0
end
function t.GetTimeUntilOpen(p1) --[[ GetTimeUntilOpen | Line: 156 | Upvalues: v1 (copy) ]]
	if p1:IsActive() then
		return 0
	end
	local v12 = v1.Get()
	if v12 < p1.StartTime then
		return p1.StartTime - v12
	end
	local v2 = (v12 - p1.StartTime) % p1.Duration
	local v3 = (1 / 0)
	for i, v in ipairs(p1.OpenTimes) do
		if v2 < v.Start then
			v3 = math.min(v3, v.Start - v2)
		end
	end
	if v3 == (1 / 0) and #p1.OpenTimes > 0 then
		v3 = p1.Duration - v2 + p1.OpenTimes[1].Start
	end
	return v3
end
return t