-- https://lua.expert/
local Players = game:GetService("Players")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("DatastoreClass")
return function(p1, p2, p3) --[[ Line: 14 | Upvalues: v1 (copy), Players (copy) ]]
	local v12 = string.lower(p2)
	local v2 = v1.new("live/codes")
	local v3 = v2:Get("ActiveCodes", {})
	local v4 = v3[v12]
	if not v4 then
		return "Code " .. v12 .. " does not exist"
	end
	print("Code " .. v12 .. " had UserId " .. p3 .. " added by " .. p1.Executor.Name)
	if not v4.Player then
		v4.Player = {}
	end
	if type(v4.Player) == "table" then
		if table.find(v4.Player, p3) then
			return "Code " .. v12 .. " already has " .. p3 .. " in it"
		end
		table.insert(v4.Player, p3)
	else
		if v4.Player == p3 then
			return "Code " .. v12 .. " already has " .. p3 .. " in it"
		end
		v4.Player = { v4.Player, p3 }
	end
	local v5 = v12
	v3[v5] = v4
	v2:Set("ActiveCodes", v3)
	return "UserId: " .. p3 .. " / Username: " .. Players:GetNameFromUserIdAsync(p3) .. " was added to code " .. v5
end