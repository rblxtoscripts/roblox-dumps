-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Sonar)("StableClubsManager")
return function(p1, p2) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	local v12 = v1.GetClubIdFromName(p2)
	if v12 then
		return "Club ID for \'" .. p2 .. "\': " .. v12
	else
		return "No club found with name: " .. p2
	end
end