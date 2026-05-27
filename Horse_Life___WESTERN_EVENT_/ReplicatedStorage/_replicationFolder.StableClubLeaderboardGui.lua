-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StableClubsService")
local v2 = Sonar("FormatNumber")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("Maid")
local v5 = Sonar("safeDestroy")
local v6 = Sonar("InstanceUtils")
local v7 = Sonar("EventUtils")
local v8 = Sonar("RemoteUtils")
local v9 = v1.GetAllBanners()
local v10 = v1.GetAllIcons()
local v11 = v8.GetRemoteFunction("GetTopClubs")
function t._getClubData(p1) --[[ _getClubData | Line: 62 | Upvalues: v7 (copy), v11 (copy) ]]
	local v1 = v7.safeCall(function() --[[ Line: 63 | Upvalues: v11 (ref) ]]
		return v11:InvokeServer()
	end) or {}
	return v1
end
function t._init(p1) --[[ _init | Line: 69 | Upvalues: v6 (copy), v4 (copy) ]]
	p1.Default = v6.GetTemplate(p1.Instance, "LeaderboardDefault")
	p1.LeaderboardMaid = v4.new()
	p1.Maid:GiveTask(p1.LeaderboardMaid)
	p1:Update()
end
function t._updateLeaderboard(p1) --[[ _updateLeaderboard | Line: 79 | Upvalues: v6 (copy), v2 (copy), v1 (copy), v10 (copy), v9 (copy), v3 (copy) ]]
	local v12 = p1:_getClubData()
	p1.LeaderboardMaid:DoCleaning()
	for v22, v32 in v12 do
		local v4 = p1.Default:Clone()
		v4.LayoutOrder = v32.Rank
		v6.GetTagged(v4, "ClubName").Text = v32.Name or "Club Deleted"
		v6.GetTagged(v4, "PointsLabel").Text = ("%* Pts"):format((v2.suffix(v32.Points)))
		v6.GetTagged(v6.GetTagged(v4, "ClubIcon"), "RankLabel").Text = v2.GetOrdinalOfNumber(v32.Rank)
		v6.GetTagged(v6.GetTagged(v4, "RewardProgress"), "TierLabel").Text = ("T%*"):format((v1.GetCapacityTier(v32.Capacity)))
		v6.GetTagged(v4, "ClubIcon").Image = v32.CurrentIcon and v10[v32.CurrentIcon].Image or ""
		v6.GetTagged(v4, "ClubBanner").Image = v32.CurrentBanner and v9[v32.CurrentBanner].Image or ""
		local v92 = v6.GetTagged(v4, "ViewButton")
		if v92 then
			v92.Visible = p1.ViewButtonCallback
			p1.LeaderboardMaid:GiveTask(v3.new(v92, {
				Click = function() --[[ Click | Line: 110 | Upvalues: p1 (copy), v32 (copy) ]]
					p1.ViewButtonCallback(v32)
				end
			}))
		end
		p1.LeaderboardMaid:GiveTask(v4)
		v4.Visible = true
		v4.Parent = p1.Default.Parent
	end
end
function t.new(p1, p2) --[[ new | Line: 124 | Upvalues: t (copy), v4 (copy), v7 (copy) ]]
	local v3 = setmetatable(if p2 then p2 else {}, t)
	v3.Maid = v4.new()
	v3.Instance = p1
	if not v3.DoNotAutoUpdate then
		v3.Maid:GiveTask(v7.spawnLoop(function() --[[ Line: 132 | Upvalues: v3 (copy) ]]
			v3:Update()
		end, v3.RefreshInterval or 120))
	end
	v3:_init()
	return v3
end
function t.Destroy(p1) --[[ Destroy | Line: 145 | Upvalues: v5 (copy) ]]
	v5(p1)
end
function t.Update(p1) --[[ Update | Line: 150 ]]
	p1.Maid:GiveTask(task.spawn(function() --[[ Line: 151 | Upvalues: p1 (copy) ]]
		p1:_updateLeaderboard()
	end))
end
return t