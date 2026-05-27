-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("FormatNumber")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("InstanceUtils")
local v5 = Sonar("EventUtils")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("PlayerUtils")
local v8 = v6.GetRemoteFunction("GetCompHubTopPlayers")
function t._getLeaderboardRows(p1) --[[ _getLeaderboardRows | Line: 35 | Upvalues: v5 (copy), v8 (copy) ]]
	local v1 = p1.FetchCount or 30
	local v2 = v5.safeCall(function() --[[ Line: 37 | Upvalues: v8 (ref), v1 (copy) ]]
		return v8:InvokeServer(v1)
	end) or {}
	return v2
end
function t._init(p1) --[[ _init | Line: 42 | Upvalues: v4 (copy), v2 (copy) ]]
	p1.Default = v4.GetTemplate(p1.Instance, "LeaderboardDefault")
	p1.LeaderboardMaid = v2.new()
	p1.Maid:GiveTask(p1.LeaderboardMaid)
	p1:Update()
end
function t._updateLeaderboard(p1) --[[ _updateLeaderboard | Line: 51 | Upvalues: v4 (copy), v1 (copy), v7 (copy) ]]
	local v12 = p1:_getLeaderboardRows()
	p1.LeaderboardMaid:DoCleaning()
	for v3, v42 in v12 do
		local v2
		local v5 = p1.Default:Clone()
		v5.LayoutOrder = v42.Rank or 0
		local v6 = v4.GetTagged(v5, "PlayerName")
		local v72 = v4.GetTagged(v5, "AmountLabel")
		local v8 = v4.GetTagged(v5, "PlayerIcon")
		local v9 = if v8 then v4.GetTagged(v8, "RankLabel") else v8
		if v6 and (v72 and (v8 and v9)) then
			local DisplayName = v42.DisplayName
			if DisplayName == nil or DisplayName == "" then
				v2 = v42.UserId and ("#%*"):format(v42.UserId) or "Unknown"
				DisplayName = v2
			end
			v6.Text = DisplayName
			local Points = v42.Points
			if type(Points) ~= "number" then
				Points = 0
			end
			v72.Text = v1.suffix(Points)
			v9.Text = ("#%*"):format(v42.Rank or 0)
			if v42.UserId then
				v8.Image = v7.GetUserThumbnail(v42.UserId, Enum.ThumbnailType.HeadShot)
			end
			p1.LeaderboardMaid:GiveTask(v5)
			v5.Visible = true
			v5.Parent = p1.Default.Parent
			continue
		end
		warn("[RacesLeaderboardGui] Row template missing PlayerName, AmountLabel, PlayerIcon, or RankLabel")
		v5:Destroy()
	end
end
function t.new(p1, p2) --[[ new | Line: 95 | Upvalues: t (copy), v2 (copy), v5 (copy) ]]
	local v3 = setmetatable(if p2 then p2 else {}, t)
	v3.Maid = v2.new()
	v3.Instance = p1
	if not v3.DoNotAutoUpdate then
		v3.Maid:GiveTask(v5.spawnLoop(function() --[[ Line: 103 | Upvalues: v3 (copy) ]]
			v3:Update()
		end, v3.RefreshInterval or 120))
	end
	v3:_init()
	return v3
end
function t.Destroy(p1) --[[ Destroy | Line: 115 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t.Update(p1) --[[ Update | Line: 119 ]]
	p1.Maid:GiveTask(task.spawn(function() --[[ Line: 120 | Upvalues: p1 (copy) ]]
		p1:_updateLeaderboard()
	end))
end
return t