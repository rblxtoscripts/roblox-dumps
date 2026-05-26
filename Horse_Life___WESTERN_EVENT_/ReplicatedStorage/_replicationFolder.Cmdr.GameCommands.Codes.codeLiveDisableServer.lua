-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("DatastoreClass")
return function(p1, p2) --[[ Line: 11 | Upvalues: v1 (copy) ]]
	local v12 = string.lower(p2)
	local v2 = v1.new("live/codes")
	local v3 = v2:Get("ActiveCodes", {})
	local v4 = v3[v12]
	if v4 then
		v4.EndTime = os.time()
		v3[v12] = v4
		v2:Set("ActiveCodes", v3)
		return "Code " .. v12 .. " has been disabled"
	else
		return "Could not find code " .. v12
	end
end