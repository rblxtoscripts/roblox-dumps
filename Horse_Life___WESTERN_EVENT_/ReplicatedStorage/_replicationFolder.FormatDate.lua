-- https://lua.expert/
local t = {}
local t2 = {
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December"
}
local t3 = {
	"Jan",
	"Feb",
	"Mar",
	"Apr",
	"May",
	"Jun",
	"Jul",
	"Aug",
	"Sep",
	"Oct",
	"Nov",
	"Dec"
}
local t4 = {
	31,
	28,
	31,
	30,
	31,
	30,
	31,
	31,
	30,
	31,
	30,
	31
}
local t5 = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
local t6 = { "Sun", "Mon", "Tues", "Weds", "Thurs", "Fri", "Sat" }
local function GetDaysMonth(p1) --[[ GetDaysMonth | Line: 13 | Upvalues: t4 (copy) ]]
	local t = {}
	for k, v in pairs(t4) do
		t[k] = v
	end
	if p1 % 4 == 0 and (p1 % 100 ~= 0 or p1 % 400 == 0) then
		t[2] = 29
	else
		t[2] = 28
	end
	return t
end
function t.GetSecond(p1) --[[ GetSecond | Line: 28 ]]
	return math.floor(p1 % 60)
end
function t.GetMinute(p1) --[[ GetMinute | Line: 32 ]]
	return math.floor(p1 / 60 % 60)
end
function t.GetHour(p1) --[[ GetHour | Line: 36 ]]
	return math.floor(p1 / 3600 % 24)
end
function t.GetDay(p1) --[[ GetDay | Line: 40 ]]
	return math.ceil(p1 / 60 / 60 / 24 % 365.25)
end
function t.GetYear(p1) --[[ GetYear | Line: 45 ]]
	return math.floor(p1 / 60 / 60 / 24 / 365.25 + 1970)
end
function t.GetYearShort(p1) --[[ GetYearShort | Line: 51 | Upvalues: t (copy) ]]
	return t.GetYear(p1) % 100
end
function t.GetYearShortFormatted(p1) --[[ GetYearShortFormatted | Line: 56 | Upvalues: t (copy) ]]
	local v1 = t.GetYearShort(p1)
	if v1 < 10 then
		v1 = "0" .. v1
	end
	return v1
end
function t.GetMonth(p1) --[[ GetMonth | Line: 64 | Upvalues: t (copy), GetDaysMonth (copy) ]]
	local v1 = t.GetYear(p1)
	local sum = t.GetDay(p1)
	local v2 = GetDaysMonth(v1)
	for i = 1, #v2 do
		if not (v2[i] < sum) then
			return i
		end
		sum = sum - v2[i]
	end
end
function t.GetFormattedMonth(p1) --[[ GetFormattedMonth | Line: 80 | Upvalues: t (copy) ]]
	local v1 = t.GetMonth(p1)
	if v1 < 10 then
		v1 = "0" .. v1
	end
	return v1
end
function t.GetDayOfTheMonth(p1) --[[ GetDayOfTheMonth | Line: 89 | Upvalues: t (copy), GetDaysMonth (copy) ]]
	local v1 = t.GetYear(p1)
	local sum = t.GetDay(p1)
	local v2 = GetDaysMonth(v1)
	for i = 1, #v2 do
		if not (v2[i] < sum) then
			return sum
		end
		sum = sum - v2[i]
	end
end
function t.GetFormattedDayOfTheMonth(p1) --[[ GetFormattedDayOfTheMonth | Line: 105 | Upvalues: t (copy) ]]
	local v1 = t.GetDayOfTheMonth(p1)
	if v1 < 10 then
		v1 = "0" .. v1
	end
	return v1
end
function t.GetMonthName(p1) --[[ GetMonthName | Line: 115 | Upvalues: t2 (copy), t (copy) ]]
	return t2[t.GetMonth(p1)]
end
function t.GetMonthNameShort(p1) --[[ GetMonthNameShort | Line: 119 | Upvalues: t3 (copy), t (copy) ]]
	return t3[t.GetMonth(p1)]
end
function t.GetJulianDate(p1) --[[ GetJulianDate | Line: 123 | Upvalues: t (copy) ]]
	local v1 = t.GetMonth(p1)
	local v2 = (14 - v1) / 12
	local v3 = t.GetYear(p1) + 4800 - v2
	return t.GetDay(p1) + (153 * (v1 + 12 * v2 - 3) + 2) / 5 + 365 * v3 + v3 / 4 - v3 / 100 + v3 / 400 - 32045
end
function t.GetDayOfTheWeek(p1) --[[ GetDayOfTheWeek | Line: 145 | Upvalues: t (copy) ]]
	return math.floor((t.GetJulianDate(p1))) % 7
end
function t.GetDayOfTheWeekName(p1) --[[ GetDayOfTheWeekName | Line: 152 | Upvalues: t (copy), t5 (copy) ]]
	return t5[t.GetDayOfTheWeek(p1)]
end
function t.GetDayOfTheWeekNameShort(p1) --[[ GetDayOfTheWeekNameShort | Line: 159 | Upvalues: t (copy), t6 (copy) ]]
	return t6[t.GetDayOfTheWeek(p1)]
end
function t.GetOrdinalOfNumber(p1) --[[ GetOrdinalOfNumber | Line: 168 ]]
	local v1 = p1 % 10
	local v2 = p1 % 100
	if v2 >= 10 and v2 <= 20 then
		return "th"
	end
	if v1 == 1 then
		return "st"
	end
	if v1 == 2 then
		return "nd"
	end
	if v1 == 3 then
		return "rd"
	else
		return "th"
	end
end
function t.GetDayOfTheMonthOrdinal(p1) --[[ GetDayOfTheMonthOrdinal | Line: 187 | Upvalues: t (copy) ]]
	return t.GetOrdinalOfNumber((t.GetDayOfTheMonth(p1)))
end
function t.GetFormattedSecond(p1) --[[ GetFormattedSecond | Line: 193 | Upvalues: t (copy) ]]
	local v1 = t.GetSecond(p1)
	if v1 < 10 then
		v1 = "0" .. v1
	end
	return v1
end
function t.GetFormattedMinute(p1) --[[ GetFormattedMinute | Line: 201 | Upvalues: t (copy) ]]
	local v1 = t.GetMinute(p1)
	if v1 < 10 then
		v1 = "0" .. v1
	end
	return v1
end
function t.GetRegularHour(p1) --[[ GetRegularHour | Line: 211 | Upvalues: t (copy) ]]
	local sum = t.GetHour(p1)
	if sum > 12 then
		sum = sum - 12
	end
	return sum
end
function t.GetHourFormatted(p1) --[[ GetHourFormatted | Line: 221 | Upvalues: t (copy) ]]
	local v1 = t.GetHour(p1)
	if v1 < 10 then
		v1 = "0" .. v1
	end
	return v1
end
function t.GetRegularHourFormatted(p1) --[[ GetRegularHourFormatted | Line: 231 | Upvalues: t (copy) ]]
	local v1 = t.GetRegularHour(p1)
	if v1 < 10 then
		v1 = "0" .. v1
	end
	return v1
end
function t.GetamOrpm(p1) --[[ GetamOrpm | Line: 241 | Upvalues: t (copy) ]]
	if t.GetHour(p1) > 12 then
		return "pm"
	else
		return "am"
	end
end
function t.GetAMorPM(p1) --[[ GetAMorPM | Line: 251 | Upvalues: t (copy) ]]
	if t.GetHour(p1) > 12 then
		return "PM"
	else
		return "AM"
	end
end
function t.GetMilitaryHour(p1) --[[ GetMilitaryHour | Line: 261 | Upvalues: t (copy) ]]
	local _ = t.GetHour(p1) < 10
end
function t.LeapYear(p1) --[[ LeapYear | Line: 269 | Upvalues: t (copy) ]]
	local v1 = t.GetYear(p1)
	if v1 % 4 == 0 and (v1 % 100 ~= 0 or v1 % 400 == 0) then
		return 1
	else
		return 0
	end
end
function t.GetDaysInMonth(p1) --[[ GetDaysInMonth | Line: 279 | Upvalues: t (copy), GetDaysMonth (copy) ]]
	local v1 = t.GetMonth(p1)
	return GetDaysMonth((t.GetYear(p1)))[v1]
end
local tbl = {
	d = t.GetFormattedDayOfTheMonth,
	D = t.GetDayOfTheWeekNameShort,
	j = t.GetDayOfTheMonth,
	l = t.GetDayOfTheWeekName,
	N = t.GetDayOfTheWeek,
	S = t.GetDayOfTheMonthOrdinal,
	W = t.GetDayOfTheWeek,
	Z = t.GetDay,
	F = t.GetMonthName,
	m = t.GetFormattedMonth,
	M = t.GetMonthNameShort,
	n = t.GetMonth,
	t = t.GetDaysInMonth,
	L = t.LeapYear,
	o = t.GetYear,
	Y = t.GetYear,
	y = t.GetYearShortFormatted,
	a = t.GetamOrpm,
	A = t.GetAMorPM,
	g = t.GetRegularHour,
	G = t.GetHour,
	h = t.GetRegularHourFormatted,
	H = t.GetHourFormatted,
	i = t.GetFormattedMinute,
	s = t.GetFormattedSecond,
	X = t.GetJulianDate,
	U = time
}
local v1 = "["
for k, v in pairs(tbl) do
	v1 = v1 .. k
end
local v2 = v1 .. "]"
function t.GetFormattedTime(p1, p2) --[[ GetFormattedTime | Line: 340 | Upvalues: v2 (ref), tbl (copy) ]]
	local tbl2, v22, v3 = {}, p1, if p2 then p2 else tick()
	for v4 in string.gmatch(p1, v2) do
		tbl2[#tbl2 + 1] = v4
	end
	for k, v in pairs(tbl2) do
		v22 = v22:gsub(v, v:rep(3))
	end
	for k, v in pairs(tbl2) do
		local v6 = tbl[v](v3)
		v22 = v22:gsub(v:rep(3), v6)
	end
	return v22
end
return t