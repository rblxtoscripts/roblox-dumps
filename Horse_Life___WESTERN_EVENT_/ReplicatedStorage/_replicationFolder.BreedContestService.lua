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
local v9 = Sonar("AnimalDataService")
local v10 = Sonar("ItemDataService")
local v11 = Sonar("ConversionUtils")
local v12 = v1 and Sonar("AnalyticsService")
Sonar("StorageUtils")
local IsStudio = Sonar("Constants").IsStudio
local v13 = game:GetService("RunService"):IsStudio() or Sonar("Constants").IsTestGame
local v14 = if v13 then 60 else 1800
local v15 = Sonar(ReplicatedStorage.Storage.BreedContest.RankTiers)
local t2 = {
	Start = 1714158000
}
t2.Duration = if v13 then 3600 else 604800
local v18 = v2.new(t2)
local t3 = {}
local BreedContest = ReplicatedStorage.Storage:WaitForChild("BreedContest")
function t.GetPriceToSubmit() --[[ GetPriceToSubmit | Line: 53 ]]
	return 50
end
function t.GetLeaderboard(p1) --[[ GetLeaderboard | Line: 57 | Upvalues: t3 (ref) ]]
	return t3[p1]
end
function t.GetLeaderboardDatastoreKey() --[[ GetLeaderboardDatastoreKey | Line: 61 | Upvalues: v18 (copy), v13 (copy) ]]
	return (if v13 then "Test" else "Live") .. "/BreedContestLeaderboard-Released" .. tostring(v18.CurrentSeed)
end
function t.ResetLeaderboards() --[[ ResetLeaderboards | Line: 66 | Upvalues: t3 (ref), BreedContest (copy) ]]
	t3 = {}
	BreedContest.Leaderboard.Value = ""
end
function t.GetLeaderboards() --[[ GetLeaderboards | Line: 71 | Upvalues: t (copy), t3 (ref), DataStoreService (copy), BreedContest (copy) ]]
	t.ResetLeaderboards()
	for k, v in pairs({ "Active" }) do
		local t2 = {
			Type = v,
			DataStore = DataStoreService:GetOrderedDataStore(t.GetLeaderboardDatastoreKey())
		}
		t2.Value = if v == "Active" then BreedContest.Leaderboard else false
		t3[v] = t2
		task.spawn(t.UpdateLeaderboard, t3[v])
	end
end
function t.UpdateLeaderboard(p1) --[[ UpdateLeaderboard | Line: 84 | Upvalues: IsStudio (copy), v5 (copy), v18 (copy), HttpService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 85 | Upvalues: p1 (copy) ]]
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
		p1.Value.Value = v18.CurrentSeed
		return
	end
	p1.Value.Value = HttpService:JSONEncode(t)
end
function t.UpdateAllLeaderboards() --[[ UpdateAllLeaderboards | Line: 131 | Upvalues: t3 (ref), t (copy) ]]
	for k, v in pairs(t3) do
		task.spawn(t.UpdateLeaderboard, v)
	end
end
function t.UpdatePlayer(p1) --[[ UpdatePlayer | Line: 137 | Upvalues: t (copy), v18 (copy) ]]
	if p1.Removed then
		return
	end
	if not p1.BreedContestData then
		return
	end
	local v1 = t.GetLeaderboard("Active")
	if not v1 then
		return
	end
	if p1.BreedContestData.Last.Value ~= v18.CurrentSeed then
		return
	end
	if p1.BreedContestData.Synced.Value ~= 0 then
		return
	end
	local UserId = p1.Player.UserId
	local Score = p1.BreedContestData.Score.Value
	if Score <= 0 then
		return
	end
	if pcall(function() --[[ Line: 151 | Upvalues: v1 (copy), UserId (copy), Score (copy) ]]
		return v1.DataStore:SetAsync(tostring(UserId), Score)
	end) then
		p1.BreedContestData.Synced.Value = v18.CurrentSeed
		print("Breed Contest - Updated entry for", p1.Player, Score)
		return true
	end
end
function t.UpdateAllPlayers() --[[ UpdateAllPlayers | Line: 163 | Upvalues: t (copy), v7 (copy) ]]
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
function t.Start(p1) --[[ Start | Line: 176 | Upvalues: v8 (copy), BreedContest (copy), t (copy), v18 (copy), v4 (copy) ]]
	if not p1 then
		v8:BroadcastMessage({
			Type = "BreedContest",
			Message = "The weekly contest has begun, head over to the town!"
		})
	end
	BreedContest.Ended.Value = false
	t.GetLeaderboards()
	t.CreateSlot()
	BreedContest.ContestId.Value = v18.CurrentSeed
	if not p1 then
		return
	end
	v4.spawnLoop(t.UpdateAllLeaderboards, 60)
	v4.spawnLoop(t.UpdateAllPlayers, 60)
end
function t.End(p1) --[[ End | Line: 198 | Upvalues: v8 (copy), v18 (copy), BreedContest (copy) ]]
	if p1 then
		print("Breed Contest - Ended contest", v18.CurrentSeed)
		BreedContest.Ended.Value = true
		return
	end
	v8:BroadcastMessage({
		Type = "BreedContest",
		Message = "The contest has ended, head over to the town for your reward!"
	})
	print("Breed Contest - Ended contest", v18.CurrentSeed)
	BreedContest.Ended.Value = true
end
function t.HasEnded() --[[ HasEnded | Line: 211 | Upvalues: v1 (copy), v18 (copy), v14 (copy), BreedContest (copy) ]]
	if not v1 then
		return BreedContest.Ended.Value
	end
	return v18:GetTime() <= v14
end
function t.GetTimeTillEnd() --[[ GetTimeTillEnd | Line: 219 | Upvalues: v18 (copy), v14 (copy), v6 (copy) ]]
	return math.max(0, v18.EndTime - v14 - v6.Get())
end
function t.CreateSlot() --[[ CreateSlot | Line: 223 | Upvalues: v18 (copy), v9 (copy), BreedContest (copy), t (copy) ]]
	local v1 = Random.new(v18.CurrentSeed)
	local v2 = game.ReplicatedStorage.Storage.DataTemplates.Animals:Clone()
	local t2 = {
		NoMutations = true,
		NoPreset = true,
		Origin = "Wild",
		Species = "Horse",
		Age = 100,
		Seed = Random.new(v18.CurrentSeed):NextInteger(1, 1000000)
	}
	t2.Gender = if v1:NextNumber(0, 1) <= 0.5 then "Male" else "Female"
	t2.MaxCosmetics = {
		MaxPatternsPerSlot = 4,
		MaxPaintsPerSlot = 2,
		MaxCosmeticsPerSlot = 4,
		AlwaysMax = true
	}
	v9.UpdateSlot(v2, t2)
	v2.Origin.Value = "Bred"
	v2.Parent = BreedContest.CurrentSlot
	BreedContest.CurrentSlot.Value = v2
	BreedContest.TotalAttributes.Value = t.GetTotalAttributes(v2)
end
function t.GetSlot() --[[ GetSlot | Line: 247 | Upvalues: BreedContest (copy) ]]
	return BreedContest.CurrentSlot.Value
end
function t.CompareSlots(p1) --[[ CompareSlots | Line: 251 | Upvalues: BreedContest (copy), v11 (copy) ]]
	local count = 0
	local CurrentSlot = BreedContest.CurrentSlot.Value
	if p1.Species.Value ~= CurrentSlot.Species.Value then
		return 0
	end
	for k, v in pairs({ "Cosmetics", "Patterns", "Paints" }) do
		for k2, v2 in pairs(p1[v]:GetChildren()) do
			local v1 = CurrentSlot[v]:FindFirstChild(v2.Name)
			if v1 and (v2.Name ~= "Nothing" and (v1 and v11.NameToCode(v1.Value) == v11.NameToCode(v2.Value))) then
				count = count + 1
			end
		end
	end
	for k, v in pairs(p1.MiscCosmetics:GetChildren()) do
		local v2 = CurrentSlot.MiscCosmetics[v.Name].Value
		if #v2 > 0 and (v2 ~= "Nothing" and v11.NameToCode(v2) == v11.NameToCode(v.Value)) then
			count = count + 1
		end
	end
	for v3, v4 in p1.Colors:GetChildren() do
		local v5 = CurrentSlot.Colors[v4.Name].Value
		if #v5 > 0 and v11.NameToCode(v5) == v11.NameToCode(v4.Value) then
			count = count + 1
		end
	end
	for k, v in pairs({ "SizeType", "Gender" }) do
		if CurrentSlot[v].Value == p1[v].Value then
			count = count + 1
		end
	end
	return count / BreedContest.TotalAttributes.Value * 10000
end
function t.GetAttributeCheckList(p1) --[[ GetAttributeCheckList | Line: 297 | Upvalues: BreedContest (copy) ]]
	local t = {}
	local CurrentSlot = BreedContest.CurrentSlot.Value
	table.insert(t, {
		Name = "Size",
		Check = function() --[[ Check | Line: 304 | Upvalues: CurrentSlot (copy), p1 (copy) ]]
			return CurrentSlot.SizeType.Value == p1.SizeType.Value
		end
	})
	table.insert(t, {
		Name = "Gender",
		Check = function() --[[ Check | Line: 311 | Upvalues: CurrentSlot (copy), p1 (copy) ]]
			return CurrentSlot.Gender.Value == p1.Gender.Value
		end
	})
	for k, v in pairs(CurrentSlot.MiscCosmetics:GetChildren()) do
		if v.Value ~= "Nothing" then
			table.insert(t, {
				Type = "MiscCosmetics",
				Name = v.Value,
				Check = function() --[[ Check | Line: 322 | Upvalues: p1 (copy), v (copy) ]]
					if not p1.MiscCosmetics:FindFirstChild(v.Name) then
						return
					end
					return v.Value == p1.MiscCosmetics[v.Name].Value
				end
			})
		end
	end
	for k, v in pairs({ "Cosmetics", "Patterns", "Paints" }) do
		for k2, v2 in pairs(CurrentSlot[v]:GetChildren()) do
			if v2.Name ~= "Nothing" and v2.Value then
				table.insert(t, {
					Name = v2.Name,
					Type = v,
					Check = function() --[[ Check | Line: 337 | Upvalues: p1 (copy), v (copy), v2 (copy) ]]
						if not p1[v]:FindFirstChild(v2.Name) then
							return
						end
						return v2.Value == p1[v][v2.Name].Value
					end
				})
			end
		end
	end
	for v1, v2 in CurrentSlot.Colors:GetChildren() do
		table.insert(t, {
			Name = v2.Name .. "Color",
			Check = function() --[[ Check | Line: 350 | Upvalues: CurrentSlot (copy), v2 (copy), p1 (copy) ]]
				return CurrentSlot.Colors[v2.Name].Value == p1.Colors[v2.Name].Value
			end
		})
	end
	return t
end
function t.GetTotalAttributes(p1) --[[ GetTotalAttributes | Line: 359 ]]
	local count = 0
	for k, v in pairs({ "Cosmetics", "Patterns", "Paints" }) do
		for k2, v2 in pairs(p1[v]:GetChildren()) do
			if v2.Value and v2.Name ~= "Nothing" then
				count = count + 1
			end
		end
	end
	for k, v in pairs(p1.MiscCosmetics:GetChildren()) do
		if v.Value ~= "Nothing" then
			count = count + 1
		end
	end
	for v1, v2 in p1.Colors:GetChildren() do
		count = count + 1
	end
	return count + 1 + 1
end
function t.GetPercentageScore(p1) --[[ GetPercentageScore | Line: 391 ]]
	return math.clamp(p1 / 100, 0, 100)
end
function t.GetAccuracy(p1) --[[ GetAccuracy | Line: 395 | Upvalues: t (copy) ]]
	return t.FormatPercentage((t.GetPercentageScore(p1)))
end
function t.FormatPercentage(p1) --[[ FormatPercentage | Line: 400 ]]
	if p1 % 1 == 0 then
		return string.format("%d%%", p1)
	else
		return string.format("%.2f%%", p1)
	end
end
function t.CheckSubmitCondition(p1, p2, p3) --[[ CheckSubmitCondition | Line: 408 | Upvalues: t (copy), v18 (copy) ]]
	local v1 = t.GetSlot()
	if p3 == "CorrectSpecies" then
		if p2.Species.Value == v1.Species.Value then
			return true
		end
	else
		if p3 ~= "RecievedInWeek" then
			return
		end
		if game:GetService("RunService"):IsStudio() or not (p2.TimeReceived.Value <= v18:GetRelativeStartTime()) then
			return true
		end
	end
end
function t.CanSubmitSlot(p1, p2) --[[ CanSubmitSlot | Line: 427 | Upvalues: t (copy) ]]
	if #p1:GetItemFolder("Animals"):GetChildren() <= 1 then
		return "CantSubmitLastHorse"
	end
	if t.HasEnded() then
		return "ContestEnded"
	end
	if not t.GetSlot() then
		return
	end
	local v1 = p1:CanAfford(50, "Coins")
	if not v1 then
		return "CannotAfford"
	end
	if not t.CheckSubmitCondition(p1, p2, "CorrectSpecies") then
		return "NotCorrectSpecies"
	end
	if not t.CheckSubmitCondition(p1, p2, "RecievedInWeek") then
		return "NotReceivedInWeek"
	end
	local v2 = t.CompareSlots(p2)
	if v2 <= 0 then
		return "NoSimilarAttributes"
	end
	if v2 <= p1.BreedContestData.Score.Value then
		return "LessThanSubmit"
	end
	if p1.BreedContestData.FoalsBorn.Value < 25 then
		return "NotRequiredFoals"
	end
	if p1.PlayerData.Missions.SpeciesUnlocks.Kelpie.Completed.Value then
		return true, v2, v1
	else
		return "NotUnlockedSpecies"
	end
end
function t.GetRewardTier(p1) --[[ GetRewardTier | Line: 471 | Upvalues: t (copy), v15 (copy) ]]
	local v2 = t.GetPercentageScore(p1)
	for k, v in pairs(v15) do
		if not v.Score then
			return v
		end
		if (type(v.Score) == "number" and v.Score or v.Score.Min) <= v2 then
			return v
		end
	end
end
function t.CheckClaimCondition(p1, p2) --[[ CheckClaimCondition | Line: 484 | Upvalues: t (copy), v18 (copy) ]]
	if p2 == "UnclaimedReward" then
		local Claimed = p1.BreedContestData.Claimed.Value
		if t.HasEnded() then
			if Claimed == v18.CurrentSeed then
				return
			end
		elseif Claimed == v18.CurrentSeed - 1 then
			return
		end
		return true
	else
		if p2 ~= "SubmittedScore" then
			return
		end
		if (t.HasEnded() and p1.BreedContestData.Score.Value or p1.BreedContestData.LastScore.Value) <= 0 then
		else
			return true
		end
	end
end
function t.CanClaimReward(p1) --[[ CanClaimReward | Line: 512 | Upvalues: t (copy), v1 (copy) ]]
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
function t.GetRewardTierFromScore(p1) --[[ GetRewardTierFromScore | Line: 529 | Upvalues: t (copy) ]]
	local v1 = t.HasEnded() and p1.BreedContestData.Score.Value or p1.BreedContestData.LastScore.Value
	return t.GetRewardTier(v1), v1
end
function t.Init(p1) --[[ Init | Line: 535 | Upvalues: t (copy), v18 (copy), BreedContest (copy), v15 (copy), v10 (copy), v7 (copy), v1 (copy), v3 (copy), v12 (copy) ]]
	t.LeaderboardRangeSize = 100
	t.RefreshTimer = v18
	t.CurrentSlotChangedSignal = BreedContest.CurrentSlot:GetPropertyChangedSignal("Value")
	t.RankTiers = v15
	t.FoalsBornToCompete = 25
	for k, v in pairs(v15) do
		v.Index = k
		for k2, v2 in pairs(v.Rewards) do
			if not v10.CheckItemExists(v2.Name) then
				warn("No item data can be found for", v2.Name)
			end
		end
	end
	v7.bindToPlayers(function(p1) --[[ Line: 555 | Upvalues: v7 (ref), v1 (ref), v18 (ref) ]]
		local v12 = v7.getWrapperFromPlayer(p1)
		if not v12 then
			return
		end
		if v1 or p1 == game.Players.LocalPlayer then
			v12.BreedContestData = v12.PlayerData.BreedContest
		end
		if not v1 then
			return
		end
		local function resetSyncValue() --[[ resetSyncValue | Line: 564 | Upvalues: v12 (copy), v18 (ref) ]]
			if v12.BreedContestData.Last.Value ~= v18.CurrentSeed then
				v12.BreedContestData.LastScore.Value = v12.BreedContestData.Score.Value
				v12.BreedContestData.Score.Value = 0
				v12.BreedContestData.Last.Value = v18.CurrentSeed
				v12.BreedContestData.FoalsBorn.Value = 0
			end
		end
		v12.Maid:GiveTask(v18.SeedChanged:Connect(resetSyncValue))
		if v12.BreedContestData.Last.Value == v18.CurrentSeed then
			return
		end
		v12.BreedContestData.LastScore.Value = v12.BreedContestData.Score.Value
		v12.BreedContestData.Score.Value = 0
		v12.BreedContestData.Last.Value = v18.CurrentSeed
		v12.BreedContestData.FoalsBorn.Value = 0
	end)
	if not v1 then
		return
	end
	v3.GetRemoteFunction("SubmitBreedContestSlot").OnServerInvoke = function(p1, p2) --[[ Line: 579 | Upvalues: v7 (ref), t (ref), v12 (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v1:GetAnimalSlot(p2)
		if not v2 then
			return
		end
		local v3, v4, v5 = t.CanSubmitSlot(v1, v2)
		if v3 ~= true then
			return
		end
		v5.Value = v5.Value - 50
		v1.BreedContestData.Score.Value = v4
		v1.BreedContestData.Synced.Value = 0
		v2:Destroy()
		v12.ReportResourceEvent(p1, "Sink", "Currency", "Coins", "BreedContest", 50)
		warn(v1.Player, t.GetPercentageScore(v4))
		v1:IncrementMission({
			Type = "EnterBreedContest",
			Amount = 1,
			Data = { t.GetPercentageScore(v4) }
		})
		local NewMissionsWrapper = v1.NewMissionsWrapper
		if not NewMissionsWrapper then
			return true
		end
		NewMissionsWrapper:IncrementMission("CompeteInAnyContest", {
			Data = {}
		})
		NewMissionsWrapper:IncrementMission("CompeteInSpecificContest", {
			Data = { "CosmeticContest" }
		})
		return true
	end
	v3.GetRemoteFunction("ClaimBreedContestReward").OnServerInvoke = function(p1) --[[ Line: 612 | Upvalues: v7 (ref), t (ref), v18 (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3 = t.CanClaimReward(v1)
		if v2 ~= true then
			return
		end
		v1.BreedContestData.Claimed.Value = v18.CurrentSeed - (if t.HasEnded() then 0 else 1)
		for k, v in pairs(v3.Rewards) do
			if not (v.P and math.random(1, 100) > v.P) then
				local t2 = {
					Source = "BreedContest",
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
	v3.GetRemoteFunction("HasBreedContestReward").OnServerInvoke = function(p1) --[[ Line: 641 | Upvalues: v7 (ref), t (ref) ]]
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
	v18.SeedChanged:Connect(function() --[[ Line: 657 | Upvalues: t (ref) ]]
		t.Start()
	end)
	t.Start(true)
	local function tryEnd(p1) --[[ tryEnd | Line: 663 | Upvalues: BreedContest (ref), t (ref) ]]
		if BreedContest.Ended.Value then
			return
		end
		if t.HasEnded() then
			t.End(p1)
		end
	end
	v18.TimeChanged:Connect(function() --[[ Line: 668 | Upvalues: BreedContest (ref), t (ref) ]]
		if BreedContest.Ended.Value then
			return
		end
		if t.HasEnded() then
			t.End(nil)
		end
	end)
	if BreedContest.Ended.Value then
		return
	end
	if t.HasEnded() then
		t.End(true)
	end
end
t:Init()
return t