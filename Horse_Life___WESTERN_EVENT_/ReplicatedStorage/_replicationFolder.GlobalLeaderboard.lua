-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("InstanceUtils")
local v2 = Sonar("TimeFrameLeaderboard")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("TableUtils")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("DataUtils")
Sonar("criticalWarn")
local v7 = Sonar("DataUpdateService", "Server")
local v8 = v3.GetConfig("GlobalLeaderboard")()
local v9 = v3.Get("GlobalLeaderboards")()
local v10 = game:GetService("RunService"):IsServer()
local v11 = v1.Create("Configuration", {
	Name = "GlobalLeaderboardReplication",
	Parent = ReplicatedStorage
}, true)
local v12 = 0
function t.new(p1, p2) --[[ new | Line: 32 | Upvalues: t (copy), v9 (copy), v4 (copy), v12 (ref), v8 (copy), v10 (copy), v2 (copy), v7 (copy), v1 (copy), v5 (copy), v11 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Name = p1
	v22.Preset = v9[p1] or {}
	v22.Config = v4.Merge(v22.Preset, if p2 then p2 else {})
	v22.Leaderboards = {}
	v12 = v12 + 1
	v22.NextUpdateTime = tick() + v8.InitStaggerIntervalGlobalLeaderboard * (v12 - 1)
	v22.LastPlayerInitTime = 0
	if v10 then
		v22.GlobalLeaderboardFolder = Instance.new("Configuration")
		v22.GlobalLeaderboardFolder.Name = p1
		v22.TimeFrames = v22:_getTimeFrames()
		for v72, v82 in v22.TimeFrames do
			local v52, v6
			v52 = if type(v82) == "table" and v82 then v82 else {}
			local v92 = v52.Duration or v8.TimeFrames[v72]
			if type(v92) == "number" and v92 then
				_ = v92
				v6 = v52
			else
				v6 = v52
				_ = nil
			end
			v22.Leaderboards[v72] = v2.new(v6)
		end
		v7.AddRigDataCallback(function(p12) --[[ Line: 66 | Upvalues: v1 (ref), p1 (copy) ]]
			if not p12:FindFirstChild("GlobalLeaderboards") then
				v1.Create("Folder", {
					Name = "GlobalLeaderboards",
					Parent = p12
				})
			end
			if p12.GlobalLeaderboards:FindFirstChild(p1) then
				return
			end
			local v12 = Instance.new("Folder")
			v12.Name = p1
			v12.Parent = p12.GlobalLeaderboards
		end)
		v5.bindToPlayers({
			OnAdded = function(p1, p2) --[[ OnAdded | Line: 82 | Upvalues: v22 (copy), v8 (ref) ]]
				local v1 = tick()
				local v2 = 0
				if v22.LastPlayerInitTime > 0 then
					local v3 = v1 - v22.LastPlayerInitTime
					if v3 < v8.InitStaggerIntervalPlayer then
						v2 = v8.InitStaggerIntervalPlayer - v3
					end
				end
				p2["_nextUpdateTime" .. v22.Name] = v1 + v2 + v8.InitStaggerIntervalPlayer
				v22.LastPlayerInitTime = v1 + v2
				local v4 = v22:_getDataFolder(p2)
				if not v4 then
					warn("\226\154\160\239\184\143 GlobalLeaderboard, No global leaderboard data folder found in", p2.Player, v22.Name)
					return
				end
				for v5, v6 in v4:GetChildren() do
					v22:GetLeaderboard(v6.Name)
				end
				for v7, v82 in v22.Leaderboards do
					v82:PlayerAdded(p2, v4)
				end
			end
		})
		v22.GlobalLeaderboardFolder.Parent = v11
		print("\240\159\143\134 GlobalLeaderboard, Created leaderboard", p1, v22.Leaderboards)
	else
		v22.GlobalLeaderboardFolder = v11:WaitForChild(p1)
		v22.TimeFrames = v22:_getTimeFrames()
		for v112, v122 in v22.TimeFrames do
			local v102
			v102 = if type(v122) == "table" and v122 then v122 else {}
			v22.Leaderboards[v112] = v2.new(v102)
		end
	end
	return v22
end
function t.CreateRewards(p1, p2, p3) --[[ CreateRewards | Line: 141 | Upvalues: v6 (copy) ]]
	if p1.Config.CreateRewards then
		p3.Rewards = p1:GetRewards(p3)
		local v1, v2 = pcall(p1.Config.CreateRewards, p2, p3)
		if not v1 then
			warn("\226\157\140 GlobalLeaderboard, Error running custom set rewards function", p2.Player, p3, v2)
		end
		return v1 and v2
	else
		local v3 = p3.Leaderboard:_getDataFolder(p2)
		if v3 then
			local v4 = v6.CreateDataValueFromType("PreviousLeaderboardReward")
			v4.Name = p3.Seed
			v4.Score.Value = p3.Score
			v4.Position.Value = p3.Position
			v4.Parent = v3.Rewards
			return true
		end
	end
end
function t._getTimeFrames(p1) --[[ _getTimeFrames | Line: 174 | Upvalues: v8 (copy), v4 (copy) ]]
	local t = {}
	for v42, v5 in p1.Config.TimeFrames or {
		Default = p1.Config
	} do
		local v2, v3
		v2 = if type(v5) == "table" and v5 then v5 else {}
		local v6 = nil
		if v2.EndTime then
			if v2.Duration then
				warn("\226\154\160\239\184\143 GlobalLeaderboard, Duration and EndTime are both set, EndTime will be used", p1.Name, v42, v2)
			end
			v3 = v2
		else
			local v7 = v2.Duration or v8.TimeFrames[v42]
			if type(v7) == "number" and v7 then
				v3 = v2
			else
				v3 = v2
				v7 = nil
			end
			v6 = v7
		end
		if v3.ExpireTime then
			warn("\226\154\160\239\184\143 GlobalLeaderboard, ExpireTime cannot be set, EndTime will be used", p1.Name, v42, v3)
			v3.ExpireTime = nil
		end
		t[v42] = v4.MergeOriginal(v3, {
			GlobalLeaderboard = p1,
			Name = v42,
			Id = p1.Name .. "-" .. v42,
			Duration = v6,
			StartTime = p1.Config.StartTime,
			EndTime = p1.Config.EndTime,
			ExpireTime = if v3.EndTime then v3.EndTime + v8.WarnExpireTimeAfterLeaderboardEnd else nil,
			Parent = p1.GlobalLeaderboardFolder
		})
	end
	return t
end
function t.GetRewards(p1, p2) --[[ GetRewards | Line: 222 ]]
	local v1 = type(p2.Leaderboard) == "string" and p1:GetLeaderboard(p2.Leaderboard) or p2.Leaderboard
	if not v1 then
		return
	end
	local v2 = p1:_getRewardsData(v1.Name)
	if not v2 then
		return
	end
	local v3 = if v2.ByPosition then p1:_calculateRewardTier(v2.ByPosition, p2.Position, "position") else nil
	local t = {}
	for v7, v8 in { v3, if v2.ByScore and (not v3 or v2.GiveBothRewardSets) then p1:_calculateRewardTier(v2.ByScore, p2.Score, "score") else nil } do
		if v8 then
			for v10, v11 in v8 do
				local v9
				v9 = if type(v11) == "table" and v11 then v11 else {
	Amount = v11
}
				v9.Name = v9.Name or v10
				t[#t + 1] = v9
			end
		end
	end
	return if #t > 0 then t else nil
end
function t._calculateRewardTier(p1, p2, p3, p4) --[[ _calculateRewardTier | Line: 263 ]]
	if not p3 then
		return nil
	end
	local list = {}
	for k, v in pairs(p2) do
		table.insert(list, v)
	end
	table.sort(list, function(p1, p2) --[[ Line: 274 ]]
		return p1.Threshold < p2.Threshold
	end)
	local v1 = nil
	for i, v in ipairs(list) do
		if p4 == "position" and p3 <= v.Threshold then
			v1 = v
			break
		elseif p4 == "position" then
			continue
		end
		if p4 == "score" then
			if not (if v.Threshold <= p3 then true else false) then
				break
			end
			v1 = v
		end
	end
	if not v1 and p4 == "score" then
		for i, v in ipairs(list) do
			if (v.Threshold or 0) == 0 then
				v1 = v
				break
			end
		end
	end
	return if v1 then v1.Rewards or nil else nil
end
function t._getRewardsData(p1, p2) --[[ _getRewardsData | Line: 311 ]]
	local v1 = p1:GetLeaderboard(p2)
	if v1 and v1.Rewards then
		return v1.Rewards
	else
		return p1.Config.Rewards
	end
end
function t._getDataFolder(p1, p2) --[[ _getDataFolder | Line: 322 ]]
	return p2.PlayerData.GlobalLeaderboards:FindFirstChild(p1.Name)
end
function t.CanUpdate(p1) --[[ CanUpdate | Line: 326 ]]
	if not p1.NextUpdateTime then
		return false
	end
	if p1._updating then
		return false
	else
		return not (tick() < p1.NextUpdateTime)
	end
end
function t.Update(p1, p2) --[[ Update | Line: 342 | Upvalues: v8 (copy) ]]
	p1._updating = true
	for v1, v2 in p1.Leaderboards do
		if v2:Update() then
			task.wait(v8.StaggerIntervalTimeFrameLeaderboard)
		end
	end
	p1.NextUpdateTime = tick() + v8.LeaderboardRefreshRate
	p1._updating = false
end
function t.CanUpdatePlayer(p1, p2) --[[ CanUpdatePlayer | Line: 359 ]]
	if not p2["_nextUpdateTime" .. p1.Name] then
		return false
	end
	if p2["_updating" .. p1.Name] then
		return false
	else
		return not (tick() < p2["_nextUpdateTime" .. p1.Name])
	end
end
function t.UpdatePlayer(p1, p2) --[[ UpdatePlayer | Line: 375 | Upvalues: v8 (copy) ]]
	local v1 = "_updateLeaderboard" .. p1.Name .. "Thread"
	local v2 = "_updating" .. p1.Name
	local v3 = "_nextUpdateTime" .. p1.Name
	p2.Maid[v1] = task.spawn(function() --[[ Line: 379 | Upvalues: p2 (copy), v2 (copy), p1 (copy), v8 (ref), v3 (copy), v1 (copy) ]]
		p2[v2] = true
		for v12, v22 in p1.Leaderboards do
			if v22:UpdatePlayer(p2) then
				task.wait(v8.StaggerIntervalPlayer)
			end
		end
		p2[v3] = tick() + v8.PlayerRefreshRate
		p2[v2] = false
		p2.Maid[v1] = nil
	end)
end
function t.IncrementScore(p1, p2, p3) --[[ IncrementScore | Line: 400 | Upvalues: v8 (copy) ]]
	if p1.Config.Type ~= p3.Type then
		return
	end
	if v8.CanIncrement and not v8.CanIncrement(p2, p3) then
		return
	end
	for v1, v2 in p1.Leaderboards do
		v2:IncrementScore(p2, p3)
	end
end
function t.GetLeaderboards(p1) --[[ GetLeaderboards | Line: 416 ]]
	return p1.Leaderboards
end
function t.GetLeaderboard(p1, p2) --[[ GetLeaderboard | Line: 420 ]]
	return p1.Leaderboards[p2 or "Default"]
end
return t