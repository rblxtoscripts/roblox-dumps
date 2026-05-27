-- https://lua.expert/
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 17 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.FilterType = p1.Type
	v2.Parameters = p1.Parameters or {}
	return v2
end
function t.IsAllowed(p1, p2) --[[ IsAllowed | Line: 26 ]]
	for v2, v3 in p1.Parameters do
		local v1
		v1 = if typeof(v3) == "table" then table.find(v3, p2[v2]) ~= nil elseif v3 == p2[v2] then true else false
		if v1 and p1.FilterType == Enum.FilterType.Exclude then
			return false
		end
		if not v1 and p1.FilterType == Enum.FilterType.Include then
			return false
		end
	end
	return true
end
return t