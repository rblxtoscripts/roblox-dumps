-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("StableClubsManager")
return function(p1, p2) --[[ Line: 9 | Upvalues: v1 (copy), Players (copy) ]]
	local v12 = v1.GetClubIdFromName(p2)
	if not v12 then
		return "No club found with name: " .. p2
	end
	local v2, v3 = v1.GetClubData(v12, true)
	if not (v3 and v2) then
		return "Failed to retrieve club data for: " .. p2
	end
	for v4, v5 in v2.Members do
		if v5.Role == "Leader" then
			local v6 = "Unknown"
			local v7, v8 = pcall(function() --[[ Line: 26 | Upvalues: Players (ref), v4 (copy) ]]
				return Players:GetNameFromUserIdAsync((tonumber(v4)))
			end)
			if v7 and v8 then
				v6 = v8
			end
			return "Owner of \'" .. p2 .. "\': " .. v6 .. " (UserId: " .. v4 .. ")"
		end
	end
	return "No owner found for club: " .. p2
end