-- https://lua.expert/
local t = {}
game:GetService("ReplicatedStorage")
local v1 = shared.GBMod("GBRequests")
shared.GBMod("Utilities")
function t.GetCohortMembershipStatusAsync(p1, p2, p3) --[[ GetCohortMembershipStatusAsync | Line: 37 | Upvalues: v1 (copy) ]]
	local v12, v2 = v1:GBRequestAsync("v1/cohorts/membership", {
		cohortName = p2,
		userIds = p3
	})
	if not v12 then
		error("Failed to get cohort membership status: " .. tostring(v2))
	end
	if v2.cohortExists == false then
		error("Cohort \'" .. p2 .. "\' does not exist.", 3)
	end
	local t = {}
	for v3, v4 in v2.users do
		t[v4.userId] = v4.isMember
	end
	return t
end
function t.Init(p1) --[[ Init | Line: 61 ]] end
return t