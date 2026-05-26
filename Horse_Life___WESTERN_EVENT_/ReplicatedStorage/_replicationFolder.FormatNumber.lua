-- https://lua.expert/
local t = {
	splice = function(p1) --[[ splice | Line: 6 ]]
		if type(p1) == "number" then
			p1 = tostring(p1)
		end
		local v2 = -1
		while v2 ~= 0 do
			local v3, v4 = string.gsub(p1, "^(-?%d+)(%d%d%d)", "%1,%2")
			v2, p1 = v4, v3
		end
		return p1
	end
}
local t2 = {
	"K",
	"M",
	"B",
	"T",
	"Q",
	"Qu",
	"S",
	"Se",
	"O",
	"N",
	"D"
}
function t.suffix(p1, p2) --[[ suffix | Line: 22 | Upvalues: t2 (copy) ]]
	if not p1 then
		return tostring(p1)
	end
	for i = #t2, 1, -1 do
		local v1 = math.pow(10, i * 3)
		if v1 <= p1 then
			return p2 and ("%." .. p2 .. "f"):format(p1 / v1) .. t2[i] or ("%.2f"):format(p1 / v1) .. t2[i]
		end
	end
	return tostring(p1)
end
function t.percentage(p1, p2) --[[ percentage | Line: 38 ]]
	local v1 = p2 or 2
	if p1 % 1 == 0 then
		return string.format("%d", p1)
	else
		return string.format("%." .. v1 .. "f", p1)
	end
end
function t.round(p1, p2) --[[ round | Line: 51 ]]
	local v1 = p2 or 1
	return math.floor(p1 / v1 + 0.5) * v1
end
function t.decimalPlace(p1, p2) --[[ decimalPlace | Line: 56 ]]
	local v1 = math.pow(10, p2 or 0)
	local v2 = p1 * v1
	return (if v2 >= 0 then math.floor(v2 + 0.5) else math.ceil(v2 - 0.5)) / v1
end
function t.SanitiseInput(p1) --[[ SanitiseInput | Line: 69 | Upvalues: t (copy) ]]
	return math.abs((math.floor(tonumber((t.PositiveIntegerMask((tostring(p1))))) or 0)))
end
function t.PositiveIntegerMask(p1) --[[ PositiveIntegerMask | Line: 77 ]]
	return p1:gsub("%D+", "")
end
function t.roundToNearestMultiple(p1, p2) --[[ roundToNearestMultiple | Line: 81 ]]
	return math.floor((p1 + p2 / 2) / p2) * p2
end
function t.GetOrdinalOfNumber(p1) --[[ GetOrdinalOfNumber | Line: 85 ]]
	local v1 = p1 % 10
	local v2 = p1 % 100
	if v2 >= 10 and v2 <= 20 then
		return p1 .. "th"
	end
	if v1 == 1 then
		return p1 .. "st"
	end
	if v1 == 2 then
		return p1 .. "nd"
	end
	if v1 == 3 then
		return p1 .. "rd"
	else
		return p1 .. "th"
	end
end
function t.ToRomanNumerals(p1) --[[ ToRomanNumerals | Line: 104 ]]
	local sum = math.floor(p1)
	local v1 = ""
	for v2, v3 in {
		{ 1000, "M" },
		{ 900, "CM" },
		{ 500, "D" },
		{ 400, "CD" },
		{ 100, "C" },
		{ 90, "XC" },
		{ 50, "L" },
		{ 40, "XL" },
		{ 10, "X" },
		{ 9, "IX" },
		{ 5, "V" },
		{ 4, "IV" },
		{ 1, "I" }
	} do
		local v4 = v3[1]
		local v5 = v3[2]
		while v4 <= sum do
			sum = sum - v4
			v1 = v1 .. v5
		end
	end
	return v1
end
function t.condense(p1) --[[ condense | Line: 137 | Upvalues: t2 (copy) ]]
	for i = #t2, 1, -1 do
		local v1 = math.pow(10, i * 3)
		if v1 <= p1 then
			local v2 = p1 / v1
			if v2 % 1 == 0 then
				return tostring(v2) .. t2[i]
			else
				return tostring(v2):gsub("%.?0+$", "") .. t2[i]
			end
		end
	end
	return tostring(p1)
end
function t.robux(p1, p2) --[[ robux | Line: 154 | Upvalues: t (copy) ]]
	if type(p1) == "number" then
		p1 = (if p2 then p2 else t.splice)(p1)
	elseif p1 then
		p1 = tostring(p1)
	end
	return "\238\128\130" .. (p1 or "")
end
return t