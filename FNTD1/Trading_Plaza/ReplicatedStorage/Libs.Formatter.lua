-- https://lua.expert/
local t = {
	"K",
	"M",
	"B",
	"T",
	"Qa",
	"Qn",
	"Sx",
	"Sp",
	"Oc",
	"N",
	"Dc",
	"Ud",
	"Dd",
	"Td",
	"Qad",
	"Qu",
	"Sd",
	"St",
	"O",
	"Nod",
	"Vg",
	"Uvg",
	"Dvg",
	"Tvg",
	"Qavg",
	"Qivg",
	"Sxvg",
	"Spvg",
	"Ocvg"
}
local t2 = {
	AbreviatedFormat = function(p1) --[[ AbreviatedFormat | Line: 6 | Upvalues: t (copy) ]]
		if not (p1 and tonumber(p1)) then
			return "N/A"
		end
		if p1 == (1 / 0) then
			return "\226\136\158"
		end
		local v1
		if p1 < 0 then
			p1, v1 = math.abs(p1), true
		else
			v1 = false
		end
		for i = #t, 1, -1 do
			local v3 = math.pow(10, i * 3)
			if v3 <= p1 then
				local v4 = p1 / v3
				return (if v1 then "-" else "") .. tostring(v4 - v4 % 0.001):sub(1, 5) .. t[i]
			end
		end
		return (if v1 then "-" else "") .. tostring((math.floor(p1)))
	end
}
function t2.FormatCompact(p1, p2) --[[ FormatCompact | Line: 27 | Upvalues: t2 (copy), t (copy) ]]
	if p1 == "HUGE" then
		return 1
	end
	if typeof(p1) == "string" then
		if t2.FormatToNumber(p1) == p1 then
			return p1
		end
		p1 = t2.FormatToNumber(p1)
	end
	if not p1 then
		return
	end
	if p1 <= 0 then
		return "0"
	end
	if p2 then
		if p2 == "DetailSave" then
			p2 = 8
		end
	else
		p2 = 2
	end
	local v3 = math.floor((math.log(p1, 1000)))
	local v4 = math.pow(10, v3 * 3)
	if p2 == 0 and p1 < 1000 then
		return string.split(("%.1f"):format(p1 / v4):gsub("%.?0+$", "") .. (t[v3] or ""), ".")[1]
	end
	return ("%." .. p2 .. "f"):format(p1 / v4):gsub("%.?0+$", "") .. (t[v3] or "")
end
function t2.FormatToNumber(p1, p2) --[[ FormatToNumber | Line: 59 | Upvalues: t2 (copy), t (copy) ]]
	if typeof(p1) == "number" then
		if t2.FormatCompact(p1) == p1 then
			return p1
		end
		p1 = t2.FormatCompact(p1)
	end
	if p1 == nil then
		return
	end
	if p1 == "0" then
		return 0
	end
	if p1 == "" then
		return 0
	end
	local v2, v3 = string.match(p1, "(.-)([a-zA-Z]*)$")
	if not (v2 and v3) then
		return math.round((tonumber(p1)))
	end
	local v6 = table.find(t, (string.lower(v3):gsub("^%l", string.upper))) or 0
	if not tonumber(v2) then
		return nil
	end
	local v7
	if p2 then
		local v8 = tonumber(v2) * math.pow(10, v6 * 3)
		v7 = math.floor(v8) or tonumber(v2) * math.pow(10, v6 * 3)
	else
		v7 = tonumber(v2) * math.pow(10, v6 * 3)
	end
	return v7
end
return t2