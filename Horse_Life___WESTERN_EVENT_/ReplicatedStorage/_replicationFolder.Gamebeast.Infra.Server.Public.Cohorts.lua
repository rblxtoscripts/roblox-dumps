-- https://lua.expert/
local t = {}
game:GetService("ReplicatedStorage")
local v1 = shared.GBMod("InternalCohorts")
function t.GetCohortMembershipStatusAsync(p1, p2, p3) --[[ GetCohortMembershipStatusAsync | Line: 36 | Upvalues: v1 (copy) ]]
	return v1:GetCohortMembershipStatusAsync(p2, p3)
end
return t