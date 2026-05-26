-- https://lua.expert/
local t = {}
local t2 = {
	Minute = 60,
	Hour = 3600,
	Day = 86400,
	Week = 604800
}
local v1 = Instance.new("IntValue")
function t.FormatTimeWithoutLeadingZeros(p1) --[[ FormatTimeWithoutLeadingZeros | Line: 15 | Upvalues: t2 (copy) ]]
	if p1 < t2.Minute then
		return ("%is"):format(p1 % 60)
	end
	if p1 < t2.Hour then
		return ("%im %is"):format(p1 / 60 % 60, p1 % 60)
	end
	if p1 < t2.Day then
		return ("%ih %im %is"):format(p1 / 3600 % 24, p1 / 60 % 60, p1 % 60)
	end
	local _ = p1 < t2.Week
	return ("%id %ih %im %is"):format(p1 / 86400, p1 / 3600 % 24, p1 / 60 % 60, p1 % 60)
end
function t.Get() --[[ Get | Line: 37 | Upvalues: v1 (copy) ]]
	return v1.Value
end
function t.AttachToTime(p1) --[[ AttachToTime | Line: 42 | Upvalues: v1 (copy) ]]
	return v1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 43 | Upvalues: p1 (copy), v1 (ref) ]]
		debug.profilebegin("AttachToTime")
		p1(v1.Value)
		debug.profileend()
	end)
end
function t.FormatString(p1) --[[ FormatString | Line: 51 | Upvalues: t2 (copy) ]]
	if p1 < t2.Minute then
		return ("%02is"):format(p1 % 60)
	end
	if p1 < t2.Hour then
		return ("%02im %02is"):format(p1 / 60 % 60, p1 % 60)
	end
	if p1 < t2.Day then
		return ("%02ih %02im %02is"):format(p1 / 3600 % 24, p1 / 60 % 60, p1 % 60)
	end
	local _ = p1 < t2.Week
	return ("%02id %02ih %02im %02is"):format(p1 / 86400, p1 / 3600 % 24, p1 / 60 % 60, p1 % 60)
end
function t.FormatRaw(p1, p2) --[[ FormatRaw | Line: 72 ]]
	return ("%01i"):format(p1 / p2)
end
function t.FormatStat(p1) --[[ FormatStat | Line: 76 | Upvalues: t2 (copy) ]]
	if p1 < t2.Minute then
		return ("%02is"):format(p1 % 60)
	end
	if p1 < t2.Hour then
		return ("%01im %02is"):format(p1 / 60 % 60, p1 % 60)
	end
	if p1 < t2.Day then
		local v1 = tonumber(("%01i"):format(p1 / 3600 % 24))
		return v1 .. " Hour" .. (if v1 == 1 then "" else "s")
	else
		local v4 = tonumber(("%01i"):format(p1 / 86400))
		return v4 .. " Day" .. (if v4 == 1 then "" else "s")
	end
end
function t.FormatBoost(p1) --[[ FormatBoost | Line: 93 | Upvalues: t2 (copy), t (copy) ]]
	if p1 < t2.Hour then
		return t.FormatRaw(p1, t2.Minute) .. " minutes"
	end
	local v1 = t.FormatRaw(p1, t2.Hour)
	return v1 .. (if v1 == 1 then " hour" else " hours")
end
function t.FormatHMS(p1) --[[ FormatHMS | Line: 103 ]]
	return ("%02i:%02i:%02i"):format(p1 / 3600 % 24, p1 / 60 % 60, p1 % 60)
end
function t.FormatDHMS(p1) --[[ FormatDHMS | Line: 107 ]]
	local v1 = math.floor(p1 / 86400)
	local v2 = p1 % 86400
	local v3 = math.floor(v2 / 3600 % 24)
	local v4 = math.floor(v2 / 60 % 60)
	local v5 = math.floor(v2 % 60)
	if v1 > 0 then
		return ("%i days, %02i:%02i:%02i"):format(v1, v3, v4, v5)
	else
		return ("%02i:%02i:%02i"):format(v3, v4, v5)
	end
end
function t.FormatExactSeconds(p1) --[[ FormatExactSeconds | Line: 121 ]]
	return string.format("%2i.%.2ds", math.floor(p1 % 60), p1 % 1 * 100)
end
v1.Value = workspace:GetServerTimeNow()
task.spawn(function() --[[ Line: 129 | Upvalues: v1 (copy) ]]
	while true do
		v1.Value = workspace:GetServerTimeNow()
		task.wait(1)
	end
end)
t.OnTimeChanged = v1:GetPropertyChangedSignal("Value")
t.ValueBase = v1
t.DayCycle = t2.Day
t.Cycles = t2
return t