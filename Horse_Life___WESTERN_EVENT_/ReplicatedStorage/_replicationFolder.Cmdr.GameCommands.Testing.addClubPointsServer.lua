-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("StableClubsManager")
return function(p1, p2, p3) --[[ Line: 9 | Upvalues: v1 (copy), v2 (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p2)
	if v12 then
		v2.AddClubPoints(v12, p3, "AdminCommand")
		return true, "Added " .. p3 .. " points to " .. p2.Name .. "\'s club"
	end
end