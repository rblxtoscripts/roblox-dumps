-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("CodesService")
return function(p1, p2, p3) --[[ Line: 14 | Upvalues: v1 (copy), DataStoreService (copy) ]]
	local v12 = v1.CodeApprovalsQueue()
	local v2 = string.lower(p2)
	print("Code " .. v2 .. " had single redeem only " .. tostring(p3) .. " added by " .. p1.Executor.Name)
	v12[v2].SingleTimeRedeem = {
		Claimed = false,
		ClaimedByUserId = "Unclaimed",
		OneTimeUse = p3
	}
	if v12[v2].SingleTimeRedeem.OneTimeUse == true then
		DataStoreService:GetDataStore("codes/approvals"):SetAsync("1", v12)
		return v2 .. " has been set to be redeemed once to " .. tostring(p3)
	else
		v12[v2].SingleTimeRedeem = nil
		return "Single time use removed from " .. v2
	end
end