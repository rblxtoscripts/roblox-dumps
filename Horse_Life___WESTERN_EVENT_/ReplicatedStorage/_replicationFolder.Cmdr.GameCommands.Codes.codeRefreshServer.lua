-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("DatastoreClass")
return function(p1, p2, p3) --[[ Line: 11 | Upvalues: v1 (copy) ]]
	local v12 = p3 or 600
	local v2 = string.lower(p2)
	local v3 = v1.new("live/codes")
	local v4 = v3:Get("ActiveCodes", {})
	local v5 = v4[v2]
	if v5 then
		v5.EndTime = os.time() + v12
		v4[v2] = v5
		v3:Set("ActiveCodes", v4)
		return "Code " .. v2 .. " has been refreshed for " .. v12 .. " seconds"
	else
		return "Could not find code " .. v2
	end
end