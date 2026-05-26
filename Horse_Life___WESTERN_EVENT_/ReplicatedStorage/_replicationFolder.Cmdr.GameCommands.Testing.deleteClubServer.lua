-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Sonar)("StableClubsManager")
return function(p1, p2) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	local v12, v2 = v1.ForceDeleteClub(p2)
	if v12 then
		return true, "Deleted club: " .. (v2 or p2)
	else
		return false, "Failed to delete club: " .. p2
	end
end