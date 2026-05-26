-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("Constants")
local v3 = v1.GetRemoteEvent("SetBossRewardsRemote")
return function(p1, p2) --[[ Line: 9 | Upvalues: v2 (copy), v3 (copy) ]]
	local t = {
		DamageDealt = 75,
		BuckedOff = 3,
		TimeTaken = 124,
		LassosLost = 2
	}
	local t2 = {}
	local v1 = p2 or 1
	for v22, v32 in v2.BossFightStatConversion do
		table.insert(t2, t[v32])
	end
	local v5 = "BossChestTier" .. v1
	local t3 = {
		{
			Amount = 1,
			LuckPower = 50,
			Name = v5
		},
		{
			Name = "BossBonusChest",
			Amount = 1
		}
	}
	local t4 = {
		{
			Amount = 1,
			LuckPower = 100,
			Name = v5
		}
	}
	task.delay(1, function() --[[ Line: 46 | Upvalues: v3 (ref), p1 (copy), v1 (ref), t2 (copy), t3 (copy), t4 (copy) ]]
		v3:FireClient(p1.Executor, {
			Tier = v1,
			Stats = t2,
			Rewards = t3,
			PremiumRewards = t4
		})
	end)
	return "Fired mock boss defeat for Tier " .. v1
end