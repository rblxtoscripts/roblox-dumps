-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("ItemDataService")
local v4 = Sonar("TimeUtils")
local LoyaltyRewards = Sonar("Constants").LoyaltyRewards
function t.CanClaimReward(p1) --[[ CanClaimReward | Line: 18 | Upvalues: v4 (copy) ]]
	if v4.Get() < p1.PlayerData.Loyalty.NextClaim.Value then
		return "CantClaimYet"
	end
	if p1.LoyaltyHandler.LoyaltyActive then
		return true
	else
		return "LoyaltyNotActive"
	end
end
function t.ClaimRewards(...) --[[ ClaimRewards | Line: 30 | Upvalues: v2 (copy) ]]
	return v2.GetRemoteFunction("ClaimLoyaltyRewardRemote"):InvokeServer(...)
end
function t.Init(p1) --[[ Init | Line: 34 | Upvalues: v1 (copy), LoyaltyRewards (copy), v3 (copy) ]]
	if not v1 then
		return
	end
	for k, v in pairs(LoyaltyRewards.DailyLogin) do
		if not v3.GetByName(v.Name) then
			warn("No item data can be found for loyalty reward", v.Name)
		end
	end
end
t:Init()
return t