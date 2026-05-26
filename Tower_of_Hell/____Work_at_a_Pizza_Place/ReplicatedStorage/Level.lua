-- https://lua.expert/
local t = {
	GetLevelFromExperience = function(p1, p2) --[[ GetLevelFromExperience | Line: 5 ]]
		return math.floor((math.sqrt(625 - 100 * -p2) + 25) / 50)
	end
}
function t.GetExperienceForNextLevel(p1, p2) --[[ GetExperienceForNextLevel | Line: 11 | Upvalues: t (copy) ]]
	if p2 - 1 == p2 then
		return 0
	else
		local v1 = t:GetLevelFromExperience(p2)
		return 25 * (v1 * (1 + v1)) - p2
	end
end
function t.GetExperienceRequiredForLevel(p1, p2) --[[ GetExperienceRequiredForLevel | Line: 27 ]]
	local v1 = p2 - 1
	return 25 * (v1 * (1 + v1))
end
function t.GetSubExperience(p1, p2) --[[ GetSubExperience | Line: 34 | Upvalues: t (copy) ]]
	if p2 - 1 == p2 then
		return 1, 1, 1
	else
		local v1 = t:GetLevelFromExperience(p2)
		local v2 = v1 - 1
		local v3 = 25 * (v2 * (1 + v2))
		local v4 = p2 - v3
		local v5 = 25 * (v1 * (1 + v1)) - v3
		return v4, v5, v4 / v5
	end
end
return t