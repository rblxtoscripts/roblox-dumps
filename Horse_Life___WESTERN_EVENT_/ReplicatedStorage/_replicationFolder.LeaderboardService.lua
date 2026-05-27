-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("TimeSeedClass")
local v3 = Sonar("EventUtils")
local v4 = Sonar("GetUserInfo")
local v5 = Sonar("PlayerWrapper")
local v6 = v1 and Sonar("ChatService")
local t = {}
local IsStudio = Sonar("Constants").IsStudio
local IsTradeWorld = Sonar("Constants").IsTradeWorld
local v7 = v2.new({
	Duration = 2592000,
	Start = 1714417200
})
local t2 = { "Tames", "Foals", "Harvests", "JoustWins", "JoustLosses" }
local t3 = {}
local Leaderboard = ReplicatedStorage.Storage:WaitForChild("Leaderboard")
function t.GetLeaderboard(p1) --[[ GetLeaderboard | Line: 44 | Upvalues: t3 (ref) ]]
	return t3[p1]
end
function t.GetLeaderboardDatastoreKey(p1) --[[ GetLeaderboardDatastoreKey | Line: 48 | Upvalues: v7 (copy) ]]
	return "Live" .. "/" .. p1 .. "-Released" .. tostring(v7.CurrentSeed)
end
function t.ResetLeaderboards() --[[ ResetLeaderboards | Line: 54 | Upvalues: t3 (ref) ]]
	for v1, v2 in t3 do
		v2.ReplicateFolder.Leaderboard.Value = ""
	end
	t3 = {}
end
function t.RemoveFromAllLeaderboards(p1) --[[ RemoveFromAllLeaderboards | Line: 61 | Upvalues: t2 (copy), t (copy) ]]
	for v1, v2 in t2 do
		return t.GetLeaderboard(v2).DataStore:SetAsync(tostring(p1), 0)
	end
end
function t.UpdatePlayer(p1, p2) --[[ UpdatePlayer | Line: 69 | Upvalues: t (copy), v7 (copy) ]]
	if p1.Removed then
		return
	end
	if not p1.PlayerData.Leaderboards[p2] then
		return
	end
	local v1 = t.GetLeaderboard(p2)
	if not v1 then
		return
	end
	if p1.PlayerData.Leaderboards[p2].Last.Value ~= v7.CurrentSeed then
		return
	end
	if p1.PlayerData.Leaderboards[p2].Synced.Value ~= 0 then
		return
	end
	local UserId = p1.Player.UserId
	local Score = p1.PlayerData.Leaderboards[p2].Score.Value
	if Score <= 0 then
		return
	end
	if pcall(function() --[[ Line: 83 | Upvalues: v1 (copy), UserId (copy), Score (copy) ]]
		return v1.DataStore:SetAsync(tostring(UserId), Score)
	end) then
		p1.PlayerData.Leaderboards[p2].Synced.Value = v7.CurrentSeed
		return true
	end
end
function t.UpdateAllPlayers() --[[ UpdateAllPlayers | Line: 94 | Upvalues: t2 (copy), t (copy), v5 (copy) ]]
	for v1, v2 in t2 do
		if t.GetLeaderboard(v2) then
			for v3, v4 in v5.GetPlayers() do
				local v52, v6 = pcall(t.UpdatePlayer, v4, v2)
				if v52 then
					if v6 then
						task.wait(1)
					end
					continue
				end
				warn(v6)
			end
		end
	end
end
function t.GetLeaderboards() --[[ GetLeaderboards | Line: 110 | Upvalues: t (copy), t2 (copy), Leaderboard (copy), t3 (ref), DataStoreService (copy) ]]
	t.ResetLeaderboards()
	for v1, v2 in t2 do
		local v3 = Leaderboard:Clone()
		local t4 = {
			Type = v2,
			DataStore = DataStoreService:GetOrderedDataStore(t.GetLeaderboardDatastoreKey(v2)),
			ReplicateFolder = v3
		}
		t4.Value = if v2 == v2 then v3.Leaderboard else false
		t3[v2] = t4
		t3[v2].ReplicateFolder.Parent = t.ReplicationFolder
		t3[v2].ReplicateFolder.Name = v2
		task.spawn(t.UpdateLeaderboard, t3[v2])
	end
end
function t.UpdateLeaderboard(p1) --[[ UpdateLeaderboard | Line: 131 | Upvalues: IsStudio (copy), v4 (copy), v7 (copy), HttpService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 132 | Upvalues: p1 (copy) ]]
		return p1.DataStore:GetSortedAsync(false, 100)
	end)
	if not v1 then
		warn("Unable to refresh Leaderboard " .. p1.Type .. " due to DataStore failure: " .. tostring(v2))
		return
	end
	p1.CachedData = v2:GetCurrentPage()
	if not IsStudio then
		for k, v in pairs(p1.CachedData) do
			v4.AddToQueue((tonumber(v.key)))
		end
		v4.FetchAll()
	end
	local t = {}
	local t2 = {}
	for k, v in pairs(p1.CachedData) do
		local v3 = v4.Get((tonumber(v.key)))
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
		p1.Value.Value = v7.CurrentSeed
		return
	end
	p1.Value.Value = HttpService:JSONEncode(t)
end
function t.UpdateAllLeaderboards() --[[ UpdateAllLeaderboards | Line: 177 | Upvalues: t3 (ref), t (copy) ]]
	for v1, v2 in t3 do
		task.spawn(t.UpdateLeaderboard, v2)
	end
end
function t.Start(p1) --[[ Start | Line: 183 | Upvalues: v6 (copy), IsTradeWorld (copy), t (copy), t3 (ref), v7 (copy), v3 (copy) ]]
	if not p1 then
		local t2 = {
			Type = "Leaderboards"
		}
		t2.Message = if IsTradeWorld then "The leaderboards have reset!" else "The leaderboards have reset, head over to the town!"
		v6:BroadcastMessage(t2)
	end
	t.GetLeaderboards()
	for v32, v4 in t3 do
		v4.ReplicateFolder.Ended.Value = false
		v4.ReplicateFolder.LeaderboardId.Value = v7.CurrentSeed
	end
	if not p1 then
		return
	end
	v3.spawnLoop(t.UpdateAllLeaderboards, 60)
	v3.spawnLoop(t.UpdateAllPlayers, 60)
end
function t.End(p1, p2) --[[ End | Line: 207 | Upvalues: t (copy), v6 (copy), IsTradeWorld (copy), v7 (copy) ]]
	local v1 = t.GetLeaderboard(p2)
	if not v1 then
		return
	end
	if not p1 then
		local t2 = {
			Type = "TameContest"
		}
		t2.Message = if IsTradeWorld then "The contest has ended, head to the main realm for your reward!" else "The contest has ended, head over to the town for your reward!"
		v6:BroadcastMessage(t2)
	end
	print("Tame Contest - Ended contest", v7.CurrentSeed)
	v1.ReplicateFolder.Ended.Value = true
end
function t.HasEnded(p1) --[[ HasEnded | Line: 225 | Upvalues: t (copy), v1 (copy), v7 (copy) ]]
	local v12 = t.GetLeaderboard(p1)
	if not v12 then
		return
	end
	if not v1 then
		return v12.ReplicateFolder.Ended.Value
	end
	return v7:GetTime() <= 1800
end
function t.IncrementScore(p1, p2, p3, p4) --[[ IncrementScore | Line: 237 | Upvalues: t (copy) ]]
	if t.HasEnded() then
		return
	end
	if p2.PlayerData.Leaderboards[p3] then
		local Score = p2.PlayerData.Leaderboards[p3].Score
		Score.Value = Score.Value + p4
		p2.PlayerData.Leaderboards[p3].Synced.Value = 0
	end
end
function t.Init(p1) --[[ Init | Line: 252 | Upvalues: t (copy), v7 (copy), v5 (copy), v1 (copy), t2 (copy), ReplicatedStorage (copy), t3 (ref) ]]
	t.LeaderboardRangeSize = 100
	t.RefreshTimer = v7
	v5.bindToPlayers(function(p1) --[[ Line: 260 | Upvalues: v5 (ref), v1 (ref), t2 (ref), v7 (ref) ]]
		local v12 = v5.getWrapperFromPlayer(p1)
		if not v12 then
			return
		end
		if v1 or p1 == game.Players.LocalPlayer then
			v12.LeaderboardData = v12.PlayerData.Leaderboards
		end
		if not v1 then
			return
		end
		local function resetSyncValue() --[[ resetSyncValue | Line: 269 | Upvalues: t2 (ref), v12 (copy), v7 (ref) ]]
			for v1, v2 in t2 do
				if v12.PlayerData.Leaderboards[v2].Last.Value ~= v7.CurrentSeed then
					v12.PlayerData.Leaderboards[v2].LastScore.Value = v12.PlayerData.Leaderboards[v2].Score.Value
					v12.PlayerData.Leaderboards[v2].Score.Value = 0
					v12.PlayerData.Leaderboards[v2].Last.Value = v7.CurrentSeed
				end
			end
		end
		v12.Maid:GiveTask(v7.SeedChanged:Connect(resetSyncValue))
		resetSyncValue()
	end)
	if not v1 then
		return
	end
	t.ReplicationFolder = Instance.new("Folder")
	t.ReplicationFolder.Name = "Leaderboards"
	t.ReplicationFolder.Parent = ReplicatedStorage
	v7.SeedChanged:Connect(function() --[[ Line: 290 | Upvalues: t (ref) ]]
		t.Start()
	end)
	t.Start(true)
	local function tryEnd(p1, p2) --[[ tryEnd | Line: 299 | Upvalues: t (ref) ]]
		local v1 = t.GetLeaderboard(p2)
		if not v1 then
			return
		end
		if v1.ReplicateFolder.Ended.Value then
			return
		end
		if not t.HasEnded() then
			return
		end
		t.End(p1)
	end
	v7.TimeChanged:Connect(function() --[[ Line: 308 | Upvalues: t3 (ref), t (ref) ]]
		for v1, v2 in t3 do
			local v3 = t.GetLeaderboard(v2.Type)
			if v3 and (not v3.ReplicateFolder.Ended.Value and t.HasEnded()) then
				t.End(false)
			end
		end
	end)
	for v12, v2 in t3 do
		local v3 = t.GetLeaderboard(v2.Type)
		if v3 and (not v3.ReplicateFolder.Ended.Value and t.HasEnded()) then
			t.End(true)
		end
	end
end
t:Init()
return t