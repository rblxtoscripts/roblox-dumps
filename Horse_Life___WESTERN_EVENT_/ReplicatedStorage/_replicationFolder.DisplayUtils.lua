-- https://lua.expert/
local t = {}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("FormatString")
local function getDisplayNameFromItem(p1, p2, p3) --[[ getDisplayNameFromItem | Line: 8 ]]
	if p3 and p2.SetDisplayName then
		return p2.SetDisplayName, true
	end
	return p2.ForcedDisplayName or (p2.DisplayName or p1), not p2.ForcedDisplayName
end
function t.SanitiseStringForAnalytics(p1) --[[ SanitiseStringForAnalytics | Line: 19 ]]
	local v1 = tostring(p1):gsub("%s+", ""):gsub("%(", ""):gsub("%)", ""):gsub("&", ""):gsub("\'", "")
	return tonumber(v1) or v1
end
function t.RemoveRichText(p1) --[[ RemoveRichText | Line: 32 ]]
	return p1:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "")
end
function t.GetDisplayName(p1, p2, p3) --[[ GetDisplayName | Line: 37 | Upvalues: v1 (copy) ]]
	local v12, v2
	if p3 and p2.SetDisplayName then
		v12 = p2.SetDisplayName
		v2 = true
	else
		v12 = p2.ForcedDisplayName or (p2.DisplayName or p1)
		v2 = not p2.ForcedDisplayName
	end
	if v2 then
		v12 = v1.separateWordsInString(v12)
	end
	return v12
end
function t.GetRawDisplayName(p1) --[[ GetRawDisplayName | Line: 46 | Upvalues: getDisplayNameFromItem (copy) ]]
	return getDisplayNameFromItem(p1.Name, p1)
end
t.GetDisplayNameFromItem = getDisplayNameFromItem
function t.SafeUpper(p1) --[[ SafeUpper | Line: 54 ]]
	local v1 = p1:split("\194\174")
	for v2, v3 in v1 do
		v1[v2] = v3:upper()
	end
	return table.concat(v1, "\194\174")
end
return t