-- https://lua.expert/
local t = {}
local v1 = shared.GBMod("InternalExperiments")
require(script.Parent.Parent.Parent.Types)
function t.GetGroupForPlayer(p1, p2) --[[ GetGroupForPlayer | Line: 9 | Upvalues: v1 (copy) ]]
	local v12 = v1.AssignedGroupIdByPlayer[p2] or v1.AssignedServerGroupId
	if v12 then
		return v1:GetActiveGroupMetadata(v12)
	else
		return nil
	end
end
return t