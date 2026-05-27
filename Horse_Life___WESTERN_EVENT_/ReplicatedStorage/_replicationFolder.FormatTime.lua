-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("TaskScheduler")
local v2 = Sonar("Signal")
local v3 = Sonar("FormatDate")
local t2 = {
	Minute = 60,
	Hour = 3600,
	Day = 86400,
	Week = 604800
}
local v4 = Instance.new("IntValue")
local LocalPlayer = Players.LocalPlayer
function t.GetTime() --[[ GetTime | Line: 44 | Upvalues: v4 (copy) ]]
	return v4.Value
end
function t.GetDay() --[[ GetDay | Line: 50 | Upvalues: t (copy) ]]
	return os.date("!*t", t.GetTime()).day
end
function t.GetMonth() --[[ GetMonth | Line: 56 | Upvalues: t (copy) ]]
	return os.date("!*t", t.GetTime()).month
end
function t.GetYear() --[[ GetYear | Line: 62 | Upvalues: t (copy) ]]
	return os.date("!*t", t.GetTime()).year
end
function t.GetHour() --[[ GetHour | Line: 68 | Upvalues: t (copy) ]]
	return os.date("!*t", t.GetTime()).hour
end
function t.GetMinute() --[[ GetMinute | Line: 74 | Upvalues: t (copy) ]]
	return os.date("!*t", t.GetTime()).min
end
function t.GetSecond() --[[ GetSecond | Line: 80 | Upvalues: t (copy) ]]
	return os.date("!*t", t.GetTime()).sec
end
function t.GetWeekday() --[[ GetWeekday | Line: 86 | Upvalues: t (copy) ]]
	return os.date("!*t", t.GetTime()).wday
end
function t.GetTimeChangedSignal() --[[ GetTimeChangedSignal | Line: 92 | Upvalues: v4 (copy) ]]
	return v4:GetPropertyChangedSignal("Value")
end
function t.OnTimeChanged(p1) --[[ OnTimeChanged | Line: 99 | Upvalues: v4 (copy) ]]
	return v4:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 100 | Upvalues: p1 (copy), v4 (ref) ]]
		p1(v4.Value)
	end)
end
function t.GetTimeReachedSignal(p1) --[[ GetTimeReachedSignal | Line: 108 | Upvalues: v2 (copy), t (copy) ]]
	local v1 = v2.new()
	local function hasReachedTime() --[[ hasReachedTime | Line: 111 | Upvalues: t (ref), p1 (copy), v1 (copy) ]]
		if p1 <= t.GetTime() then
			v1:Fire()
			return true
		else
			return false
		end
	end
	local v22
	if p1 <= t.GetTime() then
		v1:Fire()
		v22 = true
	else
		v22 = false
	end
	if not v22 then
		v1.Maid.WaitForUnixTime = t.OnTimeChanged(function() --[[ Line: 120 | Upvalues: t (ref), p1 (copy), v1 (copy) ]]
			local v12
			if p1 <= t.GetTime() then
				v1:Fire()
				v12 = true
			else
				v12 = false
			end
			if not v12 then
				return
			end
			v1.Maid.WaitForUnixTime = nil
		end)
	end
	return v1
end
function t.FormatString(p1) --[[ FormatString | Line: 133 | Upvalues: t2 (copy) ]]
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
function t.FormatStringTwoUnits(p1) --[[ FormatStringTwoUnits | Line: 154 | Upvalues: t2 (copy) ]]
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
function t.FormatTimeWithoutLeadingZeros(p1) --[[ FormatTimeWithoutLeadingZeros | Line: 175 | Upvalues: t2 (copy) ]]
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
function t.FormatNonZeroUnits(p1) --[[ FormatNonZeroUnits | Line: 196 ]]
	local v1 = p1 % 60
	local v2 = p1 / 60 % 60
	local v3 = p1 / 3600 % 24
	local v4 = p1 / 86400
	local t = {}
	if v4 >= 1 then
		table.insert(t, string.format("%id", v4))
	end
	if v3 >= 1 then
		table.insert(t, string.format("%ih", v3))
	end
	if v2 >= 1 then
		table.insert(t, string.format("%im", v2))
	end
	if v1 >= 1 then
		table.insert(t, string.format("%is", v1))
	end
	return table.concat(t, " ")
end
function t.FormatRaw(p1, p2) --[[ FormatRaw | Line: 223 ]]
	return ("%01i"):format(p1 / p2)
end
function t.FormatStat(p1) --[[ FormatStat | Line: 230 | Upvalues: t2 (copy) ]]
	if p1 < t2.Minute then
		return ("%2is"):format(p1 % 60)
	end
	if p1 < t2.Hour then
		if p1 % 60 == 0 then
			return ("%1i mins"):format(p1 / 60 % 60)
		else
			return ("%1im %1is"):format(p1 / 60 % 60, p1 % 60)
		end
	else
		if not (p1 < t2.Day) then
			return
		end
		if p1 / 60 % 60 ~= 0 then
			return ("%1ih %1im"):format(p1 / 3600 % 24, p1 / 60 % 60)
		end
		return ("%1i hour"):format(p1 / 3600 % 24) .. (if p1 / 3600 % 24 == 1 then "" else "s")
	end
end
function t.FormatBoost(p1) --[[ FormatBoost | Line: 253 | Upvalues: t2 (copy), t (copy) ]]
	if p1 < t2.Hour then
		return t.FormatRaw(p1, t2.Minute) .. " minutes"
	end
	local v1 = t.FormatRaw(p1, t2.Hour)
	return v1 .. (if v1 == 1 then " hour" else " hours")
end
function t.FormatHMS(p1) --[[ FormatHMS | Line: 265 ]]
	return ("%02i:%02i:%02i"):format(p1 / 3600 % 24, p1 / 60 % 60, p1 % 60)
end
function t.ExtendedFormatHMS(p1) --[[ ExtendedFormatHMS | Line: 272 ]]
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
function t.FormatExactSeconds(p1, p2) --[[ FormatExactSeconds | Line: 287 ]]
	local v1 = math.floor(p1 % 60)
	return string.format(p2 or "%2i.%.2ds", v1, (math.floor(p1 % 1 * 10)))
end
function t.FormatStandardTime(p1) --[[ FormatStandardTime | Line: 296 ]]
	local v1 = p1 / 3600 % 24
	local v3 = v1 % 12
	if v3 < 1 then
		v3 = 12
	end
	return ("%01i:%02i %s"):format(v3, p1 / 60 % 60, if v1 < 12 then "AM" else "PM")
end
function t.FormatMilitaryTime(p1) --[[ FormatMilitaryTime | Line: 310 ]]
	return ("%01i:%02i"):format(p1 / 3600 % 24, p1 / 60 % 60)
end
function t.FormatLocalTime(p1, p2, p3) --[[ FormatLocalTime | Line: 321 | Upvalues: LocalPlayer (copy) ]]
	local v1 = DateTime.fromUnixTimestamp(p1)
	return v1:FormatLocalTime(p2, if p3 then p3 else LocalPlayer.LocaleId)
end
function t.FormatUniversalTime(p1, p2, p3) --[[ FormatUniversalTime | Line: 329 | Upvalues: LocalPlayer (copy) ]]
	local v1 = DateTime.fromUnixTimestamp(p1)
	return v1:FormatUniversalTime(p2, if p3 then p3 else LocalPlayer.LocaleId)
end
function t.Relative(p1) --[[ Relative | Line: 333 | Upvalues: t (copy) ]]
	local v1 = t.GetTime() - p1
	if v1 < 60 then
		return "just now"
	end
	if v1 < 3600 then
		local v2 = math.floor(v1 / 60)
		if v2 == 1 then
			return "1 minute ago"
		else
			return v2 .. " minutes ago"
		end
	elseif v1 < 86400 then
		local v3 = math.floor(v1 / 3600)
		if v3 == 1 then
			return "1 hour ago"
		else
			return v3 .. " hours ago"
		end
	elseif v1 < 604800 then
		local v4 = math.floor(v1 / 86400)
		if v4 == 1 then
			return "1 day ago"
		else
			return v4 .. " days ago"
		end
	elseif v1 < 2592000 then
		local v5 = math.floor(v1 / 604800)
		if v5 == 1 then
			return "1 week ago"
		else
			return v5 .. " weeks ago"
		end
	elseif v1 < 31536000 then
		local v6 = math.floor(v1 / 2592000)
		if v6 == 1 then
			return "1 month ago"
		else
			return v6 .. " months ago"
		end
	else
		local v7 = math.floor(v1 / 31536000)
		if v7 == 1 then
			return "1 year ago"
		else
			return v7 .. " years ago"
		end
	end
end
function t.GetFormattedTime(p1, p2) --[[ GetFormattedTime | Line: 360 | Upvalues: v3 (copy) ]]
	return v3.GetFormattedTime(p1, p2)
end
function t.Init(p1) --[[ Init | Line: 366 | Upvalues: v4 (copy), v1 (copy) ]]
	local function setTime() --[[ setTime | Line: 367 | Upvalues: v4 (ref) ]]
		v4.Value = workspace:GetServerTimeNow()
	end
	v1.Interval(1, setTime)
	v4.Value = workspace:GetServerTimeNow()
end
t:Init()
return t