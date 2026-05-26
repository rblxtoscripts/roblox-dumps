-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.ModDashboardLoader)("Signal")
local t2 = {
	Minute = 60,
	Hour = 3600,
	Day = 86400,
	Week = 604800
}
local v2 = Instance.new("IntValue")
function t.Get() --[[ Get | Line: 23 | Upvalues: v2 (copy) ]]
	return v2.Value
end
function t.GetDay() --[[ GetDay | Line: 28 | Upvalues: t (copy) ]]
	return os.date("!*t", t.Get()).day
end
function t.GetMonth() --[[ GetMonth | Line: 33 | Upvalues: t (copy) ]]
	return os.date("!*t", t.Get()).month
end
function t.GetYear() --[[ GetYear | Line: 38 | Upvalues: t (copy) ]]
	return os.date("!*t", t.Get()).year
end
function t.GetHour() --[[ GetHour | Line: 43 | Upvalues: t (copy) ]]
	return os.date("!*t", t.Get()).hour
end
function t.GetMinute() --[[ GetMinute | Line: 48 | Upvalues: t (copy) ]]
	return os.date("!*t", t.Get()).min
end
function t.GetSecond() --[[ GetSecond | Line: 53 | Upvalues: t (copy) ]]
	return os.date("!*t", t.Get()).sec
end
function t.GetWeekday() --[[ GetWeekday | Line: 58 | Upvalues: t (copy) ]]
	return os.date("!*t", t.Get()).wday
end
function t.AttachToTime(p1, p2) --[[ AttachToTime | Line: 63 | Upvalues: v2 (copy) ]]
	return v2:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 64 | Upvalues: p2 (copy), p1 (copy), v2 (ref) ]]
		if not p2 or p2() then
			p1(v2.Value)
		end
	end)
end
function t.GetSignalForUnixTime(p1) --[[ GetSignalForUnixTime | Line: 74 | Upvalues: v1 (copy), t (copy) ]]
	local v12 = v1.new()
	local function checkTime() --[[ checkTime | Line: 77 | Upvalues: t (ref), p1 (copy), v12 (copy) ]]
		if p1 <= t.Get() then
			v12:Fire()
			return true
		else
			return false
		end
	end
	local v2
	if p1 <= t.Get() then
		v12:Fire()
		v2 = true
	else
		v2 = false
	end
	if not v2 then
		t.AttachToTime(function() --[[ Line: 86 | Upvalues: t (ref), p1 (copy), v12 (copy) ]]
			local v1
			if p1 <= t.Get() then
				v12:Fire()
				v1 = true
			else
				v1 = false
			end
			if not v1 then
				return
			end
			Connection:Disconnect()
		end)
	end
	return v12
end
function t.FormatString(p1) --[[ FormatString | Line: 98 | Upvalues: t2 (copy) ]]
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
function t.FormatStringTwoUnits(p1) --[[ FormatStringTwoUnits | Line: 120 | Upvalues: t2 (copy) ]]
	if p1 < t2.Minute then
		return ("%02is"):format(p1 % 60)
	end
	if p1 < t2.Hour then
		return ("%02im %02is"):format(p1 / 60 % 60, p1 % 60)
	end
	if p1 < t2.Day then
		return ("%02ih %02im"):format(p1 / 3600 % 24, p1 / 60 % 60)
	end
	local _ = p1 < t2.Week
	return ("%02id %02ih"):format(p1 / 86400, p1 / 3600 % 24)
end
function t.FormatTimeWithoutLeadingZeros(p1) --[[ FormatTimeWithoutLeadingZeros | Line: 139 | Upvalues: t2 (copy) ]]
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
function t.FormatRaw(p1, p2) --[[ FormatRaw | Line: 160 ]]
	return ("%01i"):format(p1 / p2)
end
function t.FormatStat(p1) --[[ FormatStat | Line: 164 | Upvalues: t2 (copy) ]]
	if p1 < t2.Minute then
		return ("%02is"):format(p1 % 60)
	end
	if p1 < t2.Hour then
		if p1 % 60 == 0 then
			return ("%01i mins"):format(p1 / 60 % 60)
		else
			return ("%01im %01is"):format(p1 / 60 % 60, p1 % 60)
		end
	else
		if not (p1 < t2.Day) then
			return
		end
		if p1 / 60 % 60 ~= 0 then
			return ("%01ih %01im"):format(p1 / 3600 % 24, p1 / 60 % 60)
		end
		return ("%01i hour"):format(p1 / 3600 % 24) .. (if p1 / 3600 % 24 == 1 then "" else "s")
	end
end
function t.FormatBoost(p1) --[[ FormatBoost | Line: 185 | Upvalues: t2 (copy), t (copy) ]]
	if p1 < t2.Hour then
		return t.FormatRaw(p1, t2.Minute) .. " minutes"
	end
	local v1 = t.FormatRaw(p1, t2.Hour)
	return v1 .. (if v1 == 1 then " hour" else " hours")
end
function t.FormatHMS(p1) --[[ FormatHMS | Line: 195 ]]
	return ("%02i:%02i:%02i"):format(p1 / 3600 % 24, p1 / 60 % 60, p1 % 60)
end
function t.ExtendedFormatHMS(p1) --[[ ExtendedFormatHMS | Line: 200 ]]
	local v1 = p1 / 3600 // 24
	local v2 = p1 / 3600 % 24
	local v3 = p1 / 60 % 60
	local v4 = p1 % 60
	if v1 > 0 then
		return ("%id %02ih %02im %02is"):format(v1, v2, v3, v4)
	else
		return ("%02ih %02im %02is"):format(v2, v3, v4)
	end
end
function t.FormatExactSeconds(p1) --[[ FormatExactSeconds | Line: 212 ]]
	return string.format("%2i.%.2ds", math.floor(p1 % 60), p1 % 1 * 100)
end
function t.GetSecondsLeftInMonth() --[[ GetSecondsLeftInMonth | Line: 219 | Upvalues: t (copy) ]]
	local v1 = t.Get()
	local v2 = t.GetMonth()
	local v3 = t.GetYear()
	local v4 = v2 + 1
	local v5
	if v4 > 12 then
		v5 = v3 + 1
		v4 = 1
	else
		v5 = v3
	end
	return os.time({
		day = 1,
		year = v5,
		month = v4
	}) - v1
end
v2.Value = workspace:GetServerTimeNow()
task.spawn(function() --[[ Line: 237 | Upvalues: v2 (copy) ]]
	while true do
		v2.Value = workspace:GetServerTimeNow()
		task.wait(1)
	end
end)
t.OnTimeChanged = v2:GetPropertyChangedSignal("Value")
t.DayCycle = 86400
t.Cycles = t2
return t