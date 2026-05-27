-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local t2 = {
	{
		Position = 5,
		Rewards = {
			{
				Name = "RacesChestTier3",
				Amount = 1
			}
		}
	},
	{
		Position = 10,
		Rewards = {
			{
				Name = "RacesChestTier2",
				Amount = 1
			}
		}
	},
	{
		Position = 30,
		Rewards = {
			{
				Name = "RacesChestTier1",
				Amount = 1
			}
		}
	}
}
t.Timer = require(ReplicatedStorage.Sonar)("TimeSeedClass").new({
	Duration = 604800,
	Start = 1769806800
})
function t.GetLeaderboardRewards() --[[ GetLeaderboardRewards | Line: 34 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetMaxLeaderboardRewardPosition() --[[ GetMaxLeaderboardRewardPosition | Line: 38 | Upvalues: t2 (copy) ]]
	local v1 = 0
	for v2, v3 in t2 do
		if v1 < v3.Position then
			v1 = v3.Position
		end
	end
	return v1
end
function t.GetRewardsForPosition(p1) --[[ GetRewardsForPosition | Line: 48 | Upvalues: t2 (copy) ]]
	if not p1 or p1 < 1 then
		return nil
	end
	local t = {}
	local t3 = {}
	for v1, v2 in t2 do
		table.insert(t, v2)
	end
	table.sort(t, function(p1, p2) --[[ Line: 59 ]]
		return p1.Position < p2.Position
	end)
	for v3, v4 in t do
		if p1 <= v4.Position then
			for v5, v6 in v4.Rewards do
				table.insert(t3, v6)
			end
		end
	end
	return if #t3 > 0 then t3 else nil
end
function t.GetSeedStartTime(p1) --[[ GetSeedStartTime | Line: 74 | Upvalues: t (copy) ]]
	local Timer = t.Timer
	return Timer.StartTime + Timer.Duration * (p1 - 1)
end
function t.GetLastCompHubLeaderboardClaimed(p1) --[[ GetLastCompHubLeaderboardClaimed | Line: 79 ]]
	return p1.PlayerData.CompHub.LastCompHubLeaderboardClaimed
end
return t