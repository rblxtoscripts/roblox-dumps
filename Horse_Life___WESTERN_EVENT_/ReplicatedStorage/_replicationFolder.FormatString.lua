-- https://lua.expert/
local t = {}
function t.GetDisplayName(p1, ...) --[[ GetDisplayName | Line: 3 | Upvalues: t (copy) ]]
	if typeof(p1) == "string" then
		return t.separateWordsInString(p1)
	end
	if type(p1) == "table" and p1.DisplayName then
		if type(p1.DisplayName) == "string" then
			return p1.DisplayName
		end
		if typeof(p1.DisplayName) == "function" then
			return p1.DisplayName(...)
		end
	end
	if p1.Name then
		return t.separateWordsInString(p1.Name)
	else
		return select(1, ...) or "---"
	end
end
function t.separateWordsInString(p1) --[[ separateWordsInString | Line: 23 ]]
	if string.upper(p1) == p1 then
		return p1
	end
	local v1 = p1:sub(1, 1)
	for i = 2, #p1 do
		if p1:byte(i) < 128 and (p1:sub(i, i) == p1:sub(i, i):upper() and (p1:sub(i + 1, i + 1) ~= ")" and p1:sub(i - 2, i - 2) ~= "(")) then
			v1 = v1 .. " " .. p1:sub(i, i)
			continue
		end
		v1 = v1 .. p1:sub(i, i)
	end
	return v1:gsub("L E G O", "LEGO")
end
function t.trimString(p1, p2) --[[ trimString | Line: 43 ]]
	return string.sub(p1, 1, p2)
end
function t.separateWordsInStringWithBreak(p1) --[[ separateWordsInStringWithBreak | Line: 47 ]]
	if string.upper(p1) == p1 then
		return p1
	end
	local v1 = p1:sub(1, 1)
	for i = 2, #p1 do
		if p1:byte(i) < 128 and (p1:sub(i, i) == p1:sub(i, i):upper() and (p1:sub(i, i) ~= ")" and p1:sub(i, i) ~= "(")) then
			v1 = v1 .. "\n" .. p1:sub(i, i)
			continue
		end
		v1 = v1 .. p1:sub(i, i)
	end
	return v1
end
function t.RemoveRichText(p1) --[[ RemoveRichText | Line: 66 ]]
	return p1:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "")
end
function t.splitStringAndGetPart(p1, p2, p3) --[[ splitStringAndGetPart | Line: 71 ]]
	local t = {}
	p1:gsub(string.format("([^%s]+)", p2), function(p1) --[[ Line: 74 | Upvalues: t (copy) ]]
		t[#t + 1] = p1
	end)
	return t[p3]
end
function t.isStringJustOneChar(p1, p2) --[[ isStringJustOneChar | Line: 78 ]]
	return p1:match("^" .. p2:gsub("([%W])", "%%%1") .. "+$") == p1
end
function t.trim(p1) --[[ trim | Line: 85 ]]
	return string.gsub(string.gsub(p1, "^%s+", ""), "%s+$", "")
end
function t.removeWhitespace(p1) --[[ removeWhitespace | Line: 91 ]]
	return string.gsub(p1, "%s+", "")
end
function t.normalize(p1) --[[ normalize | Line: 95 ]]
	return string.gsub(string.lower(p1), "%s+", "")
end
return t