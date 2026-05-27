-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("TimeSeedClass")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("EventUtils")
local v5 = Sonar("GetUserInfo")
local v6 = Sonar("TimeUtils")
local v7 = Sonar("PlayerWrapper")
local v8 = v1 and Sonar("ChatService")
local v9 = Sonar("ItemDataService")
local v10 = v1 and Sonar("AnalyticsService")
Sonar("StorageUtils")
local v11 = Sonar("Constants")
local IsStudio = v11.IsStudio
local v12 = game:GetService("RunService"):IsStudio() or Sonar("Constants").IsTestGame
local IsTradeWorld = Sonar("Constants").IsTradeWorld
local v13 = Sonar(ReplicatedStorage.Storage.TameContest.RankTiers)
local TameContestPoints = v11.TameContestPoints
local v14 = v2.new({
	Duration = 345600,
	Start = 1714417200
})
local t2 = {}
local TameContest = ReplicatedStorage.Storage:WaitForChild("TameContest")
function t.GetPriceToEnter() --[[ GetPriceToEnter | Line: 50 ]]
	return 1000
end
function t.GetLeaderboard(p1) --[[ GetLeaderboard | Line: 54 | Upvalues: t2 (ref) ]]
	return t2[p1]
end
function t.GetLeaderboardDatastoreKey() --[[ GetLeaderboardDatastoreKey | Line: 58 | Upvalues: v14 (copy), v12 (copy) ]]
	return (if v12 then "Test" else "Live") .. "/TameContestLeaderboard-Released" .. tostring(v14.CurrentSeed)
end
function t.ResetLeaderboards() --[[ ResetLeaderboards | Line: 63 | Upvalues: t2 (ref), TameContest (copy) ]]
	t2 = {}
	TameContest.Leaderboard.Value = ""
end
function t.GetLeaderboards() --[[ GetLeaderboards | Line: 68 | Upvalues: t (copy), t2 (ref), DataStoreService (copy), TameContest (copy) ]]
	t.ResetLeaderboards()
	for k, v in pairs({ "Active" }) do
		local t3 = {
			Type = v,
			DataStore = DataStoreService:GetOrderedDataStore(t.GetLeaderboardDatastoreKey())
		}
		t3.Value = if v == "Active" then TameContest.Leaderboard else false
		t2[v] = t3
		task.spawn(t.UpdateLeaderboard, t2[v])
	end
end
function t.UpdateLeaderboard(p1) --[[ UpdateLeaderboard | Line: 81 | Upvalues: IsStudio (copy), v5 (copy), v14 (copy), HttpService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 82 | Upvalues: p1 (copy) ]]
		return p1.DataStore:GetSortedAsync(false, 100)
	end)
	if not v1 then
		warn("Unable to refresh Leaderboard " .. p1.Type .. " due to DataStore failure: " .. tostring(v2))
		return
	end
	p1.CachedData = v2:GetCurrentPage()
	if not IsStudio then
		for k, v in pairs(p1.CachedData) do
			v5.AddToQueue((tonumber(v.key)))
		end
		v5.FetchAll()
	end
	local t = {}
	local t2 = {}
	for k, v in pairs(p1.CachedData) do
		local v3 = v5.Get((tonumber(v.key)))
		local t3 = {
			Amount = v.value
		}
		t3.UserId = tonumber(v.key)
		t3.Name = v3 and v3.DisplayName or nil
		t3.Username = v3 and v3.Username or nil
		t[k] = t3
		t2[tonumber(v.key)] = k
	end
	p1.UserIdToPosition = t2
	if not p1.Value then
		return
	end
	if p1.Value:IsA("IntValue") then
		p1.Value.Value = v14.CurrentSeed
		return
	end
	p1.Value.Value = HttpService:JSONEncode(t)
end
function t.UpdateAllLeaderboards() --[[ UpdateAllLeaderboards | Line: 128 | Upvalues: t2 (ref), t (copy) ]]
	for k, v in pairs(t2) do
		task.spawn(t.UpdateLeaderboard, v)
	end
end
function t.UpdatePlayer(p1) --[[ UpdatePlayer | Line: 134 | Upvalues: t (copy), v14 (copy) ]]
	if p1.Removed then
		return
	end
	if not p1.TameContestData then
		return
	end
	local v1 = t.GetLeaderboard("Active")
	if not v1 then
		return
	end
	if not p1.TameContestData.Entered.Value then
		return
	end
	if p1.TameContestData.Last.Value ~= v14.CurrentSeed then
		return
	end
	if p1.TameContestData.Synced.Value ~= 0 then
		return
	end
	local UserId = p1.Player.UserId
	local Score = p1.TameContestData.Score.Value
	if Score <= 0 then
		return
	end
	if pcall(function() --[[ Line: 149 | Upvalues: v1 (copy), UserId (copy), Score (copy) ]]
		return v1.DataStore:SetAsync(tostring(UserId), Score)
	end) then
		p1.TameContestData.Synced.Value = v14.CurrentSeed
		print("Tame Contest - Updated entry for", p1.Player, Score)
		return true
	end
end
function t.UpdateAllPlayers() --[[ UpdateAllPlayers | Line: 161 | Upvalues: t (copy), v7 (copy) ]]
	if not t.GetLeaderboard("Active") then
		return
	end
	for v1, v2 in v7.GetPlayers() do
		local v3, v4 = pcall(t.UpdatePlayer, v2)
		if v3 then
			if v4 then
				task.wait(1)
			end
			continue
		end
		warn(v4)
	end
end
function t.Start(p1) --[[ Start | Line: 174 | Upvalues: v8 (copy), IsTradeWorld (copy), TameContest (copy), t (copy), v14 (copy), v4 (copy) ]]
	if not p1 then
		local t2 = {
			Type = "TameContest"
		}
		t2.Message = if IsTradeWorld then "The taming contest has begun, head to the main realm to start!" else "The taming contest has begun, head over to the town!"
		v8:BroadcastMessage(t2)
	end
	TameContest.Ended.Value = false
	t.GetLeaderboards()
	TameContest.ContestId.Value = v14.CurrentSeed
	if not p1 then
		return
	end
	v4.spawnLoop(t.UpdateAllLeaderboards, 60)
	v4.spawnLoop(t.UpdateAllPlayers, 60)
end
function t.End(p1) --[[ End | Line: 196 | Upvalues: v8 (copy), IsTradeWorld (copy), v14 (copy), TameContest (copy) ]]
	if p1 then
		print("Tame Contest - Ended contest", v14.CurrentSeed)
		TameContest.Ended.Value = true
		return
	end
	local t = {
		Type = "TameContest"
	}
	t.Message = if IsTradeWorld then "The contest has ended, head to the main realm for your reward!" else "The contest has ended, head over to the town for your reward!"
	v8:BroadcastMessage(t)
	print("Tame Contest - Ended contest", v14.CurrentSeed)
	TameContest.Ended.Value = true
end
function t.HasEnded() --[[ HasEnded | Line: 210 | Upvalues: v1 (copy), v14 (copy), TameContest (copy) ]]
	if not v1 then
		return TameContest.Ended.Value
	end
	return v14:GetTime() <= 1800
end
function t.GetTimeTillEnd() --[[ GetTimeTillEnd | Line: 218 | Upvalues: v14 (copy), v6 (copy) ]]
	return math.max(0, v14.EndTime - 1800 - v6.Get())
end
function t.CanEnterContest(p1) --[[ CanEnterContest | Line: 222 | Upvalues: t (copy) ]]
	if not p1:HasUnlockedSpecies("Equus") then
		return
	end
	if t.HasEnded() then
		return "ContestEnded"
	end
	if p1.TameContestData.Entered.Value then
		return "AlreadyInContest"
	end
	local v1 = p1:CanAfford(1000, "Coins")
	if v1 then
		return true, v1
	else
		return "CannotAfford"
	end
end
function t.GetRewardTier(p1) --[[ GetRewardTier | Line: 243 | Upvalues: v13 (copy) ]]
	for k, v in pairs(v13) do
		if not v.Score then
			return v
		end
		if (type(v.Score) == "number" and v.Score or v.Score.Min) <= p1 then
			return v
		end
	end
end
function t.CheckClaimCondition(p1, p2) --[[ CheckClaimCondition | Line: 254 | Upvalues: t (copy), v14 (copy) ]]
	if p2 == "UnclaimedReward" then
		local Claimed = p1.TameContestData.Claimed.Value
		if t.HasEnded() then
			if Claimed == v14.CurrentSeed then
				return
			end
		elseif Claimed == v14.CurrentSeed - 1 then
			return
		end
		return true
	else
		if p2 ~= "SubmittedScore" then
			return
		end
		if (t.HasEnded() and p1.TameContestData.Score.Value or p1.TameContestData.LastScore.Value) <= 0 then
		else
			return true
		end
	end
end
function t.CanClaimReward(p1) --[[ CanClaimReward | Line: 282 | Upvalues: t (copy), v1 (copy) ]]
	if not t.CheckClaimCondition(p1, "UnclaimedReward") then
		return "AlreadyClaimed"
	end
	if not t.CheckClaimCondition(p1, "SubmittedScore") then
		return "NoScore"
	end
	if v1 then
		local v12, v2 = t.GetRewardTierFromScore(p1)
		return true, v12, v2
	else
		return true
	end
end
function t.GetRewardTierFromScore(p1) --[[ GetRewardTierFromScore | Line: 299 | Upvalues: t (copy) ]]
	local v1 = t.HasEnded() and p1.TameContestData.Score.Value or p1.TameContestData.LastScore.Value
	return t.GetRewardTier(v1), v1
end
function t.IncrementScore(p1, p2, p3) --[[ IncrementScore | Line: 305 | Upvalues: t (copy), TameContestPoints (copy) ]]
	if t.HasEnded() then
		return
	end
	if not p2.TameContestData.Entered.Value then
		return
	end
	if not TameContestPoints[p3] then
		warn("No Tame Contest score amount can be found for", p3)
	end
	local v1 = TameContestPoints[p3] or 1
	local Score = p2.TameContestData.Score
	Score.Value = Score.Value + v1
	p2.TameContestData.Synced.Value = 0
	p2:IncrementMission({
		Type = "TameContestScore",
		Data = {},
		Amount = v1
	})
	local NewMissionsWrapper = p2.NewMissionsWrapper
	if not NewMissionsWrapper then
		return
	end
	NewMissionsWrapper:IncrementMission("CompeteInSpecificContest", {
		Data = { "TamingContest", p2.TameContestData.Score.Value }
	})
end
function t.Init(p1) --[[ Init | Line: 328 | Upvalues: t (copy), v14 (copy), v13 (copy), TameContestPoints (copy), v9 (copy), v7 (copy), v1 (copy), v3 (copy), v10 (copy), TameContest (copy) ]]
	t.LeaderboardRangeSize = 100
	t.RefreshTimer = v14
	t.RankTiers = v13
	t.ScoresPerSpecies = TameContestPoints
	for k, v in pairs(v13) do
		v.Index = k
		for k2, v2 in pairs(v.Rewards) do
			if not v9.CheckItemExists(v2.Name) then
				warn("No item data can be found for", v2.Name)
			end
		end
	end
	v7.bindToPlayers(function(p1) --[[ Line: 346 | Upvalues: v7 (ref), v1 (ref), v14 (ref) ]]
		local v12 = v7.getWrapperFromPlayer(p1)
		if not v12 then
			return
		end
		if v1 or p1 == game.Players.LocalPlayer then
			v12.TameContestData = v12.PlayerData.TameContest
		end
		if not v1 then
			return
		end
		local function resetSyncValue() --[[ resetSyncValue | Line: 355 | Upvalues: v12 (copy), v14 (ref) ]]
			if v12.TameContestData.Last.Value ~= v14.CurrentSeed then
				v12.TameContestData.LastScore.Value = v12.TameContestData.Score.Value
				v12.TameContestData.Entered.Value = false
				v12.TameContestData.Score.Value = 0
				v12.TameContestData.Last.Value = v14.CurrentSeed
			end
		end
		v12.Maid:GiveTask(v14.SeedChanged:Connect(resetSyncValue))
		if v12.TameContestData.Last.Value == v14.CurrentSeed then
			return
		end
		v12.TameContestData.LastScore.Value = v12.TameContestData.Score.Value
		v12.TameContestData.Entered.Value = false
		v12.TameContestData.Score.Value = 0
		v12.TameContestData.Last.Value = v14.CurrentSeed
	end)
	if not v1 then
		return
	end
	v3.GetRemoteFunction("EnterTameContest").OnServerInvoke = function(p1) --[[ Line: 369 | Upvalues: v7 (ref), t (ref), v10 (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3 = t.CanEnterContest(v1)
		if v2 ~= true then
			return
		end
		v3.Value = v3.Value - 1000
		v1.TameContestData.Entered.Value = true
		v10.ReportResourceEvent(p1, "Sink", "Currency", "Coins", "TameContest", 1000)
		v1:IncrementMission({
			Type = "EnterTameContest",
			Amount = 1,
			Data = {}
		})
		local NewMissionsWrapper = v1.NewMissionsWrapper
		if not NewMissionsWrapper then
			return true
		end
		NewMissionsWrapper:IncrementMission("CompeteInAnyContest", {
			Data = {}
		})
		NewMissionsWrapper:IncrementMission("CompeteInSpecificContest", {
			Data = { "TamingContest", 0 }
		})
		return true
	end
	v3.GetRemoteFunction("ClaimTameContestReward").OnServerInvoke = function(p1) --[[ Line: 396 | Upvalues: v7 (ref), t (ref), v14 (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3 = t.CanClaimReward(v1)
		if v2 ~= true then
			return
		end
		v1.TameContestData.Claimed.Value = v14.CurrentSeed - (if t.HasEnded() then 0 else 1)
		for k, v in pairs(v3.Rewards) do
			if not (v.P and math.random(1, 100) > v.P) then
				local t2 = {
					Source = "TameContest",
					IgnoreLimit = true
				}
				for k2, v5 in pairs(v) do
					t2[k2] = v5
				end
				v1:GiveItem(t2)
			end
		end
		return true
	end
	v3.GetRemoteFunction("HasTameContestReward").OnServerInvoke = function(p1) --[[ Line: 425 | Upvalues: v7 (ref), t (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v4 = t.CanClaimReward(v1)
		if v2 == true then
			return {
				Tier = v3.Index,
				Score = v4
			}
		else
			return v2
		end
	end
	v14.SeedChanged:Connect(function() --[[ Line: 441 | Upvalues: t (ref) ]]
		t.Start()
	end)
	t.Start(true)
	local function tryEnd(p1) --[[ tryEnd | Line: 447 | Upvalues: TameContest (ref), t (ref) ]]
		if TameContest.Ended.Value then
			return
		end
		if t.HasEnded() then
			t.End(p1)
		end
	end
	v14.TimeChanged:Connect(function() --[[ Line: 452 | Upvalues: TameContest (ref), t (ref) ]]
		if TameContest.Ended.Value then
			return
		end
		if t.HasEnded() then
			t.End(nil)
		end
	end)
	if TameContest.Ended.Value then
		return
	end
	if t.HasEnded() then
		t.End(true)
	end
end
t:Init()
return t