-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("AnalyticsService", "Server")
local v3 = Sonar("ItemSetService")
local v4 = Sonar("MarketplaceUtils")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("TimeUtils")
local v8 = Sonar("WeightedProbability")
local v9 = Sonar("StableClubsManager", "Server")
local v10 = Sonar("StorageUtils")
local v11 = Sonar("PlaceTypeService")
local v12 = Sonar("Constants")
local v13 = v11.IsTestGame() and false
local v14 = if v13 then 30 else 72000
local v16 = v14 + (if v13 then 30 else 86400)
local v17 = Sonar(v10.Get("Achivements"))
local v18 = Sonar(v10.Get("SubscriberRewardTiers"))
function t.GetSubscriberRewardTier(p1, p2) --[[ GetSubscriberRewardTier | Line: 34 | Upvalues: v18 (copy) ]]
	local v1 = p2.DailyLoginData.Streak.Value // 10
	local v2 = nil
	for v3, v4 in v18 do
		if not (v1 < v4.Tier) then
			v2 = v4
		end
	end
	return v2
end
function t.GetSubscriberInventorySlots(p1, p2) --[[ GetSubscriberInventorySlots | Line: 51 | Upvalues: t (copy) ]]
	local v1 = t:GetSubscriberRewardTier(p2)
	local sum = 0
	if not v1 then
		return 0
	end
	for v2, v3 in v1.Rewards do
		if typeof(v3.Amount) == "number" and v3.ItemType == "InventorySlot" then
			sum = sum + v3.Amount
		end
	end
	return 0
end
function t.GetSubscriberAnimalSlots(p1, p2) --[[ GetSubscriberAnimalSlots | Line: 74 | Upvalues: t (copy) ]]
	local v1 = t:GetSubscriberRewardTier(p2)
	local sum = 0
	if not v1 then
		return 0
	end
	for v2, v3 in v1.Rewards do
		if typeof(v3.Amount) == "number" and v3.ItemType == "AnimalSlot" then
			sum = sum + v3.Amount
		end
	end
	return 0
end
function t.ClaimReward(p1, p2, p3, p4) --[[ ClaimReward | Line: 96 | Upvalues: v1 (copy), v12 (copy), v8 (copy), v9 (copy), v3 (copy), v2 (copy), v6 (copy) ]]
	if not v1 then
		return v6.GetRemoteFunction("ClaimDailyLoginRemote"):InvokeServer()
	end
	local v13 = v12.DailyLoginRewards[p3]
	local v22 = v13[v8.getRandomWeightedItem(v13)]
	if p3 == 7 then
		v9.AddClubPoints(p2, 500, "DailyLoginDay7")
	else
		v9.AddClubPoints(p2, 200, "DailyLogin")
	end
	if v22.Species then
		local v32 = v3:_giveHorse(p2, v22)
		if v32 then
			v2.ReportResourceEvent(p2.Player, "Source", "HorseSlot", v32.Species.Value, "DailyLogin", 1)
		end
		return { v32.Name }
	else
		local t = {
			Source = "DailyLogin",
			IgnoreLimit = true,
			Name = v22.Name
		}
		t.Amount = (v22.Amount or 1) * (if p4 then 2 else 1)
		t.ItemStream = if v22.Name == "Coins" then true else false
		return p2:GiveItem(t)
	end
end
function t.ClaimStreakReward(p1, p2, p3) --[[ ClaimStreakReward | Line: 127 | Upvalues: v1 (copy), t (copy), v8 (copy), v3 (copy), v2 (copy), v6 (copy) ]]
	if not v1 then
		return v6.GetRemoteFunction("ClaimDailyLoginStreakRemote"):InvokeServer()
	end
	local v12 = t:GetStreakRewardsFromTier(p3)
	local v22 = v12[v8.getRandomWeightedItem(v12)]
	if v22.Species then
		local v32 = v3:_giveHorse(p2, v22)
		if v32 then
			v2.ReportResourceEvent(p2.Player, "Source", "HorseSlot", v32.Species.Value, "DailyLogin", 1)
		end
		return { v32.Name }
	else
		local t2 = {
			Source = "DailyLogin",
			IgnoreLimit = true,
			Name = v22.Name,
			Amount = v22.Amount
		}
		t2.ItemStream = v22.Name == "Coins"
		p2:GiveItem(t2)
		return true
	end
end
function t.CanClaimReward(p1, p2) --[[ CanClaimReward | Line: 154 | Upvalues: v7 (copy), v16 (copy), v14 (copy) ]]
	if not p2.LoyaltyHandler.LoyaltyActive then
		return
	end
	if v16 <= v7.Get() - p2.DailyLoginData.LastLogin.Value then
		return true
	end
	if v7.Get() >= p2.DailyLoginData.LastLogin.Value + v14 then
		return true
	end
end
function t.CanClaimAdReward(p1, p2) --[[ CanClaimAdReward | Line: 166 | Upvalues: v7 (copy), v16 (copy), v14 (copy) ]]
	if not p2 then
		return
	end
	local LastAd = p2.DailyLoginData.LastAd.Value
	if v16 <= v7.Get() - LastAd then
		return true
	end
	if LastAd + v14 <= v7.Get() then
		return true
	end
end
function t.GetCurrentStreak(p1, p2) --[[ GetCurrentStreak | Line: 179 | Upvalues: v7 (copy), v16 (copy), t (copy) ]]
	if v16 <= v7.Get() - p2.DailyLoginData.LastLogin.Value then
		return 0
	end
	if t:CanClaimReward(p2) and p2.DailyLoginData.CurrentStreak.Value >= 7 then
		return 0
	end
	return p2.DailyLoginData.CurrentStreak.Value
end
function t.GetStreakRewardsFromTier(p1, p2) --[[ GetStreakRewardsFromTier | Line: 191 | Upvalues: v12 (copy) ]]
	local v1 = nil
	for v2, v3 in v12.DailyLoginTiers do
		if not (p2 < v3.Tier) then
			v1 = v3.Rewards
		end
	end
	return v1
end
function t.GetCurrentStreakForTier(p1, p2) --[[ GetCurrentStreakForTier | Line: 208 | Upvalues: v7 (copy), v16 (copy) ]]
	if v16 <= v7.Get() - p2.DailyLoginData.LastLogin.Value then
		return 0
	else
		return p2.DailyLoginData.Streak.Value
	end
end
function t.GetStreakTier(p1, p2) --[[ GetStreakTier | Line: 216 | Upvalues: t (copy) ]]
	return math.floor(t:GetCurrentStreakForTier(p2) / 10)
end
function t.GetStreakDaysLeftForTier(p1, p2) --[[ GetStreakDaysLeftForTier | Line: 220 | Upvalues: t (copy) ]]
	return (t:GetCurrentStreakForTier(p2) + 1) * 10
end
function t.CanClaimStreakReward(p1, p2) --[[ CanClaimStreakReward | Line: 224 | Upvalues: t (copy) ]]
	if p2.DailyLoginData.StreakTier.Value < t:GetStreakTier(p2) then
		return true
	end
end
function t.ClaimCurrentReward(p1, p2, p3) --[[ ClaimCurrentReward | Line: 231 | Upvalues: t (copy) ]]
	if not t:CanClaimReward(p2) then
		return
	end
	t:IncrementStreakAndReward(p2, false, p3)
end
function t.IncrementStreakAndReward(p1, p2, p3, p4) --[[ IncrementStreakAndReward | Line: 237 | Upvalues: v7 (copy), v16 (copy), t (copy), v14 (copy) ]]
	if v16 <= v7.Get() - p2.DailyLoginData.LastLogin.Value then
		p2.DailyLoginData.LastLogin.Value = v7.Get()
		p2.DailyLoginData.CurrentStreak.Value = 1
		p2.DailyLoginData.Streak.Value = 1
		p2.DailyLoginData.StreakTier.Value = 0
		p2.DailyLoginData.LongestStreak.Value = math.max(p2.DailyLoginData.LongestStreak.Value, p2.DailyLoginData.Streak.Value)
		return t:ClaimReward(p2, p2.DailyLoginData.Streak.Value)
	end
	if not (v7.Get() >= p2.DailyLoginData.LastLogin.Value + v14 or p3) then
		return
	end
	p2.DailyLoginData.LastLogin.Value = v7.Get()
	if p2.DailyLoginData.CurrentStreak.Value >= 7 then
		p2.DailyLoginData.CurrentStreak.Value = 0
	end
	local Streak = p2.DailyLoginData.Streak
	Streak.Value = Streak.Value + 1
	if p2.DailyLoginData.StreakTier.Value > t:GetStreakTier(p2) then
		p2.DailyLoginData.StreakTier.Value = 0
	end
	p2.DailyLoginData.CurrentStreak.Value = math.min(p2.DailyLoginData.CurrentStreak.Value + 1, 7)
	p2.DailyLoginData.LongestStreak.Value = math.max(p2.DailyLoginData.LongestStreak.Value, p2.DailyLoginData.Streak.Value)
	p2:IncrementMission({
		Type = "LoginStreak",
		Amount = 1
	})
	return t:ClaimReward(p2, p2.DailyLoginData.CurrentStreak.Value, p4)
end
function t.ClaimDailyBonusReward(p1, p2, p3) --[[ ClaimDailyBonusReward | Line: 278 | Upvalues: v1 (copy), v12 (copy), v8 (copy), v3 (copy), v2 (copy), v6 (copy) ]]
	if not v1 then
		return v6.GetRemoteFunction("ClaimDailyBonusRemote"):InvokeServer()
	end
	local v22 = Rewards[v8.getRandomWeightedItem(v12.DailyBonusRewards[p3])]
	if v22.Species then
		local v32 = v3:_giveHorse(p2, v22)
		if v32 then
			v2.ReportResourceEvent(p2.Player, "Source", "HorseSlot", v32.Species.Value, "DailyBonus", 1)
		end
		return { v32.Name }
	else
		local t = {
			Source = "DailyBonus",
			IgnoreLimit = true,
			Name = v22.Name,
			Amount = v22.Amount
		}
		t.ItemStream = v22.Name == "Coins"
		p2:GiveItem(t)
		return true
	end
end
function t.IncrementDailyBonusStreakAndReward(p1, p2) --[[ IncrementDailyBonusStreakAndReward | Line: 307 | Upvalues: t (copy) ]]
	local CurrentAdStreak = p2.DailyLoginData.CurrentAdStreak
	p2.PlayerData.DailyLogin.LastAd.Value = workspace:GetServerTimeNow()
	if CurrentAdStreak.Value >= 7 then
		CurrentAdStreak.Value = 0
	end
	CurrentAdStreak.Value = math.min(CurrentAdStreak.Value + 1, 7)
	return t:ClaimDailyBonusReward(p2, CurrentAdStreak.Value)
end
function t.Init(p1) --[[ Init | Line: 324 | Upvalues: t (copy), v14 (copy), v16 (copy), v1 (copy), v6 (copy), v5 (copy), v7 (copy), v17 (copy), v11 (copy), v4 (copy) ]]
	t.StreakWait = v14
	t.StreakGraceWait = v16
	t.StreakDaysPerTier = 10
	if not v1 then
		return
	end
	v6.GetRemoteFunction("ClaimDailyLoginRemote").OnServerInvoke = function(p1) --[[ Line: 330 | Upvalues: v5 (ref), t (ref) ]]
		local v1 = v5.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		if t:CanClaimReward(v1) then
			return t:IncrementStreakAndReward(v1)
		end
	end
	v6.GetRemoteFunction("ClaimDailyLoginStreakRemote").OnServerInvoke = function(p1) --[[ Line: 339 | Upvalues: v5 (ref), t (ref) ]]
		local v1 = v5.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		if t:CanClaimStreakReward(v1) then
			v1.DailyLoginData.StreakTier.Value = t:GetStreakTier(v1)
			return t:ClaimStreakReward(v1, t:GetStreakTier(v1))
		end
	end
	v6.GetRemoteFunction("ClaimDailyBonusRemote").OnServerInvoke = function(p1) --[[ Line: 350 | Upvalues: v5 (ref), t (ref) ]]
		local v1 = v5.getWrapperFromPlayer(p1)
		if t:CanClaimAdReward(v1) then
			return t:IncrementDailyBonusStreakAndReward(v1)
		end
	end
	local function restoreStreak(p1) --[[ restoreStreak | Line: 361 | Upvalues: v7 (ref), v14 (ref), v17 (ref) ]]
		local StreaksRestored = p1.DailyLoginData.StreaksRestored
		StreaksRestored.Value = StreaksRestored.Value + 1
		p1.DailyLoginData.LastLogin.Value = v7.Get() - v14
		p1.DailyLoginData.CurrentStreak.Value = p1.DailyLoginData.LongestStreak.Value % 7
		p1.DailyLoginData.Streak.Value = p1.DailyLoginData.LongestStreak.Value
		for k, v in pairs(p1.PlayerData.Missions.Milestones:GetChildren()) do
			for v1, v2 in v:GetChildren() do
				local v5 = v17.Milestones[v2.Type.Value][tonumber(v2.Name)]
				if v5 then
					local Amount = v2.Amount
					if v5.Type == "LoginStreak" then
						Amount.Value = math.min(p1.DailyLoginData.Streak.Value, v5.Amount)
					end
				end
			end
		end
	end
	v6.GetRemoteFunction("TESTRESTORELOGIN").OnServerInvoke = function(p1) --[[ Line: 381 | Upvalues: v11 (ref), v5 (ref), restoreStreak (copy) ]]
		if not v11.IsTestGame() then
			return
		end
		local v1 = v5.getWrapperFromPlayer(p1)
		if v1 then
			return restoreStreak(v1)
		end
	end
	v4.AddProductHandler("RestoreDailyStreak", function(p1, p2) --[[ Line: 390 | Upvalues: restoreStreak (copy) ]]
		restoreStreak(p1)
		return {
			ItemType = "RestoreDailyStreak",
			ItemId = 1
		}
	end)
end
t:Init()
return t