-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Sonar)("StableClubsManager")
return function(p1) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	local v12 = v1.GetTopClubs(20)
	if not v12 or #v12 == 0 then
		return "No clubs in cache (cache may not be populated yet)"
	end
	local t = {}
	for v2, v3 in v12 do
		table.insert(t, v2 .. ". " .. (v3.Name or "Unknown") .. " " .. v3.ClubId)
	end
	return table.concat(t, "\n")
end