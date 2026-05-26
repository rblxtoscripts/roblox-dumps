-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local DataStoreService = game:GetService("DataStoreService")
local UserService = game:GetService("UserService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("EventUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("TimeUtils")
local v4 = Sonar("TimeSeedClass")
local v5 = RunService:IsStudio()
local v6 = RunService:IsServer()
local t2 = {
	{
		Name = "AllTime",
		Time = v3.Cycles.Day * 45
	},
	{
		Name = "Weekly",
		Time = v3.Cycles.Week
	},
	{
		Name = "Daily",
		Time = v3.Cycles.Day
	}
}
local v8 = (if v5 then "studio_" else "") .. "global_leaderboard"
local t3 = {
	Tames = function(p1, p2) --[[ Tames | Line: 35 ]]
		if p2 == "AllTime" then
			return p1.PlayerData.Stats.Tames
		else
			local v1 = p1.PlayerData.LeaderboardStats.Tames:FindFirstChild(p2)
			return v1.Stat, v1
		end
	end
}
local t4 = {}
local t5 = {}
local Leaderboards = workspace.Leaderboards
local t6 = {}
local function addUserIdFetch(p1) --[[ addUserIdFetch | Line: 52 | Upvalues: t5 (copy), t4 (copy) ]]
	local v1 = t5[p1]
	if v1 then
		return v1
	end
	if t4[p1] then
		return
	end
	t4[p1] = {}
end
local function fetchAll() --[[ fetchAll | Line: 66 | Upvalues: t4 (copy), UserService (copy), t5 (copy) ]]
	if not next(t4) then
		return
	end
	local count = 0
	local t = {}
	for v1, v2 in t4 do
		count = count + 1
		if count <= 150 then
			table.insert(t, v1)
		end
	end
	local v3, v4 = pcall(function() --[[ Line: 79 | Upvalues: UserService (ref), t (copy) ]]
		return UserService:GetUserInfosByUserIdsAsync(t)
	end)
	if not v3 then
		warn("Unable to get batch userInfos for: " .. #t .. " because: " .. tostring(v4))
		return
	end
	for v5, v6 in v4 do
		local Id = v6.Id
		t5[Id] = v6
		t4[Id] = nil
	end
end
local function playerAdded(p1) --[[ playerAdded | Line: 95 | Upvalues: v2 (copy), t6 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	for k, v in pairs(t6) do
		local v22, v3 = v.GetStat(v1, v.TimeFrame)
		if v3 then
			local function resetSyncValue() --[[ resetSyncValue | Line: 102 | Upvalues: v3 (copy), v (copy), v22 (copy) ]]
				if v3.Value ~= v.TimeSeed.CurrentSeed then
					v3.Value = v.TimeSeed.CurrentSeed
					v22.Value = 0
				end
			end
			v1.Maid:GiveTask(v.TimeSeed.SeedChanged:Connect(resetSyncValue))
			if v3.Value ~= v.TimeSeed.CurrentSeed then
				v3.Value = v.TimeSeed.CurrentSeed
				v22.Value = 0
			end
		end
	end
end
function t.UpdatePlayer(p1, p2) --[[ UpdatePlayer | Line: 113 ]]
	if p1.Removed then
		return
	end
	if not p2.Store then
		return
	end
	local v1, v2 = p2.GetStat(p1, p2.TimeFrame)
	if not v1 then
		return
	end
	if v2 and (p2.TimeSeed and v2.Value ~= p2.TimeSeed.CurrentSeed) then
		return
	end
	if not (v1.Value <= 0) then
		local UserId = p1.Player.UserId
		pcall(function() --[[ Line: 127 | Upvalues: p2 (copy), UserId (copy), v1 (copy) ]]
			return p2.Store:SetAsync(tostring(UserId), v1.Value)
		end)
	end
end
function t.UpdateAllPlayers() --[[ UpdateAllPlayers | Line: 136 | Upvalues: t6 (copy), v2 (copy), t (copy) ]]
	for k, v in pairs(t6) do
		for v1, v22 in v2.GetPlayers() do
			t.UpdatePlayer(v22, v)
			task.wait(5)
		end
		task.wait(1)
	end
end
function t.UpdateLeaderboard(p1) --[[ UpdateLeaderboard | Line: 146 | Upvalues: t5 (copy), t4 (copy), fetchAll (copy), HttpService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 147 | Upvalues: p1 (copy) ]]
		return p1.Store:GetSortedAsync(false, 100)
	end)
	if not v1 then
		warn("Unable to refresh Leaderboard " .. p1.Type .. " due to DataStore failure: " .. tostring(v2))
		return
	end
	p1.CachedData = v2:GetCurrentPage()
	for k, v in pairs(p1.CachedData) do
		local v3 = tonumber(v.key)
		if not (t5[v3] or t4[v3]) then
			t4[v3] = {}
		end
	end
	fetchAll()
	local t = {}
	for k, v in pairs(p1.CachedData) do
		local v5 = t5[tonumber(v.key)]
		local t2 = {
			Amount = v.value
		}
		t2.UserId = tonumber(v.key)
		t2.Name = v5 and v5.DisplayName or nil
		t2.Username = v5 and v5.Username or nil
		t[k] = t2
	end
	if not p1.DataValue then
		return
	end
	p1.DataValue.Value = HttpService:JSONEncode(t)
end
function t.UpdateAllLeaderboards(p1) --[[ UpdateAllLeaderboards | Line: 183 | Upvalues: t6 (copy), t (copy) ]]
	if p1 then
		task.wait(15)
	end
	for k, v in pairs(t6) do
		t.UpdateLeaderboard(v)
		task.wait(5)
	end
end
function t.GetStatHandler(p1) --[[ GetStatHandler | Line: 194 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t.Init(p1) --[[ Init | Line: 198 | Upvalues: v6 (copy), Leaderboards (copy), t2 (copy), t (copy), v8 (copy), DataStoreService (copy), v4 (copy), t6 (copy), v1 (copy), v2 (copy), playerAdded (copy) ]]
	if not v6 then
		return
	end
	for k, v in pairs(Leaderboards:GetChildren()) do
		local TimeFrames = Instance.new("Folder")
		TimeFrames.Name = "TimeFrames"
		TimeFrames.Parent = v
		for k2, v3 in pairs(t2) do
			local t3 = {}
			local v12 = if v3.Name == "AllTime" then true else false
			t3.Type = v.Name .. "_" .. v3.Name
			t3.Expire = v3.Time
			t3.TimeFrame = v3.Name
			t3.GetStat = t.GetStatHandler(v.Name)
			if t3.GetStat then
				local v22 = Instance.new("Folder")
				v22.Name = v3.Name
				v22.Parent = TimeFrames
				local Data = Instance.new("StringValue")
				Data.Name = "Data"
				Data.Parent = v22
				t3.DataValue = Data
				local function setMemoryStore(p1, p2) --[[ setMemoryStore | Line: 228 | Upvalues: v8 (ref), v (copy), v3 (copy), t3 (copy), DataStoreService (ref) ]]
					if p2 then
						return
					end
					local v1 = ("%*/%*/%*"):format(v8, v.Name, (string.lower(v3.Name)))
					local v2, v32
					if t3.TimeSeed then
						v2 = v1 .. "/" .. t3.TimeSeed.CurrentSeed
						if not v2 then
							v32 = v1
							v2 = v1
						end
					else
						v32 = v1
						v2 = v1
					end
					t3.Store = DataStoreService:GetOrderedDataStore(v2)
					t3.DataValue.Value = ""
					if not t3.TimeValue then
						return
					end
					t3.TimeValue.Value = t3.TimeSeed.EndTime
				end
				if not v12 then
					local EndTime = Instance.new("IntValue")
					EndTime.Name = "EndTime"
					EndTime.Parent = v22
					t3.TimeValue = EndTime
					t3.TimeSeed = v4.new({
						Duration = v3.Time,
						OnSeedChanged = setMemoryStore
					})
				end
				setMemoryStore()
				t6[t3.Type] = t3
				continue
			end
			warn("No stat get function for leaderboard", v.Name)
		end
	end
	v1.spawnLoop(t.UpdateAllPlayers, 60)
	task.spawn(v1.spawnLoop, t.UpdateAllLeaderboards, 60, true)
	v2.bindToPlayers(playerAdded)
end
t:Init()
return t