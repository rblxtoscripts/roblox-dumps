-- https://lua.expert/
local t = {}
t.__index = t
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("Binder")
local v3 = Sonar("TameContestService")
local v4 = Sonar("TimeUtils")
local v5 = Sonar("PlayerUtils")
local v6 = Sonar("Signal")
local v7 = Sonar("ItemGridButton")
local v8 = Sonar("ItemDataService")
local v9 = Sonar("FormatNumber")
local t2 = {
	{
		Image = Color3.fromRGB(255, 223, 55),
		Text = Color3.fromRGB(255, 223, 55)
	},
	{
		Image = Color3.fromRGB(192, 212, 249),
		Text = Color3.fromRGB(184, 218, 255)
	},
	{
		Image = Color3.fromRGB(198, 94, 13),
		Text = Color3.fromRGB(255, 128, 0)
	}
}
local v10 = Sonar("PlayerWrapper").GetClient()
local TameContest = ReplicatedStorage.Storage:WaitForChild("TameContest")
local RefreshTimer = v3.RefreshTimer
repeat
	task.wait()
until v10.TameContestData
local Score = v10.TameContestData.Score
function t.new(p1) --[[ new | Line: 37 | Upvalues: t (copy), v1 (copy), v5 (copy), v10 (copy), v6 (copy), Score (copy), TameContest (copy), v3 (copy), v9 (copy), v8 (copy), v7 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Gui = p1
	v2.ContentFrame = p1.ContainerFrame:WaitForChild("Content")
	v2.LeaderboardFrame = v2.ContentFrame:WaitForChild("Leaderboard")
	v2.RewardsFrame = v2.ContentFrame:WaitForChild("Rewards")
	v2.YourPlacementFrame = v2.LeaderboardFrame:WaitForChild("Content"):WaitForChild("YourPlacement")
	v2.RewardsFrame = v2.ContentFrame:WaitForChild("Rewards"):WaitForChild("Content"):WaitForChild("Content")
	v2.YourPlacementFrame.Content.UserNameLabel.Text = v5.GetPlayerName(v10.Player)
	v2.YourPlacementFrame.Content.PlayerAvatar.Image = v5.GetUserThumbnail(v10.Player.UserId)
	v2.LeaderboardFrame.LoadingLabel.Visible = true
	v2.PositionsByUserId = {}
	v2.CreatedFrames = {}
	v2.LeaderboardMaid = v1.new()
	v2.Maid:GiveTask(v2.LeaderboardMaid)
	v2.RankChangedSignal = v6.new()
	v2.Maid:GiveTask(v2.RankChangedSignal)
	v2.Maid:GiveTask(Score:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 61 | Upvalues: v2 (copy) ]]
		v2:SetYourScore()
	end))
	v2:SetYourScore()
	v2.Maid:GiveTask(v2.RankChangedSignal:Connect(function() --[[ Line: 66 | Upvalues: v2 (copy) ]]
		v2:SetYourRank()
	end))
	v2:SetYourRank()
	v2.Maid:GiveTask(TameContest.Leaderboard:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 79 | Upvalues: v2 (copy) ]]
		v2:Update()
	end))
	v2:Update()
	for k, v in pairs(v3.RankTiers) do
		local v32 = v2.RewardsFrame.Default:Clone()
		v2.RewardsFrame.Default.Visible = false
		v32.Content.TierLabel.Text = "#" .. k
		v32.BackgroundTransparency = if k % 2 == 0 then 0.5 else 0
		v32.Content.ScoreLabel.Text = type(v.Score) == "number" and "+" .. v9.splice(v.Score) .. " pts" or v9.splice(v.Score.Min) .. " pts - " .. v9.splice(v.Score.Max) .. " pts"
		for k2, v11 in pairs(v.Rewards) do
			if v8.GetByName(v11.Name) then
				local v62 = v7.new({
					ForceVisible = true,
					Item = v8.GetByName(v11.Name),
					Theme = v11.Theme,
					ParentFrame = v32.Content.Rewards,
					GetAmount = function() --[[ GetAmount | Line: 103 | Upvalues: v11 (copy) ]]
						return v11.Amount
					end
				})
				local ChanceLabel = v62.Frame:FindFirstChild("ChanceLabel", true)
				if v11.P then
					ChanceLabel.Text = v11.P .. "%"
					ChanceLabel.Visible = true
				else
					ChanceLabel.Visible = false
				end
				v2.Maid:GiveTask(v62)
			end
		end
		v32.Name = v.Index
		v32.Visible = true
		v32.Parent = v2.RewardsFrame
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 127 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.SetTimer(p1) --[[ SetTimer | Line: 132 | Upvalues: v3 (copy), v4 (copy), RefreshTimer (copy) ]]
	if v3.HasEnded() then
		p1.RewardsFrame.TimePrompt.Text = "New contest starts in"
		p1.RewardsFrame.TimerLabel.Text = v4.FormatString(RefreshTimer:GetTime())
	else
		p1.RewardsFrame.TimePrompt.Text = "Contest ends in "
		p1.RewardsFrame.TimerLabel.Text = v4.FormatString(v3.GetTimeTillEnd())
	end
end
function t.SetYourScore(p1) --[[ SetYourScore | Line: 142 | Upvalues: Score (copy), v9 (copy) ]]
	p1.YourPlacementFrame.Content.ScoreLabel.Text = if Score.Value > 0 then v9.splice(Score.Value) .. " pts" or "N/A" else "N/A"
	if Score.Value <= 0 then
		p1.YourPlacementFrame.Visible = false
		p1.YourPlacementFrame.Parent.YourPlacementTitle.Visible = false
		p1.YourPlacementFrame.Parent.NotParticipatedLabel.Visible = true
	else
		p1.YourPlacementFrame.Visible = true
		p1.YourPlacementFrame.Parent.YourPlacementTitle.Visible = true
		p1.YourPlacementFrame.Parent.NotParticipatedLabel.Visible = false
	end
end
function t.SetYourRank(p1) --[[ SetYourRank | Line: 157 | Upvalues: v10 (copy), t2 (copy), v3 (copy) ]]
	local v1 = p1.PositionsByUserId[v10.Player.UserId]
	local v2 = t2[v1]
	p1.YourPlacementFrame.Content.RankPlacementLabel.Text = v1 and "#" .. v1 or "+" .. v3.LeaderboardRangeSize
	p1.YourPlacementFrame.Content.RankPlacementLabel.TextColor3 = v2 and v2.Text or Color3.fromRGB(255, 255, 255)
	p1.YourPlacementFrame.Content.RankImage.Visible = v2
	p1.YourPlacementFrame.Content.RankImage.ImageColor3 = v2 and v2.Image or p1.YourPlacementFrame.Content.RankImage.ImageColor3
end
function t.Update(p1) --[[ Update | Line: 166 | Upvalues: TameContest (copy), HttpService (copy), t2 (copy), v5 (copy), v10 (copy), v9 (copy) ]]
	local v1 = #TameContest.Leaderboard.Value > 0 and HttpService:JSONDecode(TameContest.Leaderboard.Value) or nil
	if v1 and next(v1) then
		p1.PositionsByUserId = {}
		local t = {}
		for k, v in pairs(v1) do
			local v2
			if p1.CreatedFrames[k] then
				v2 = p1.CreatedFrames[k]
			else
				local v3 = p1.LeaderboardFrame.Content.ScrollingFrame.Default:Clone()
				v3.Name = k
				v3.Visible = true
				v3.Parent = p1.LeaderboardFrame.Content.ScrollingFrame
				p1.CreatedFrames[k] = v3
				p1.LeaderboardMaid:GiveTask(v3)
				v2 = v3
			end
			local v4 = t2[tonumber(k)]
			v2.Content.UserNameLabel.Text = v.Name or "Loading..."
			v2.Content.PlayerAvatar.Image = v5.GetUserThumbnail(v.UserId)
			v2.Content.UserNameLabel.TextColor3 = v.UserId == v10.Player.UserId and Color3.fromRGB(255, 227, 117) or Color3.fromRGB(255, 255, 255)
			v2.Content.ScoreLabel.TextColor3 = v.UserId == v10.Player.UserId and Color3.fromRGB(255, 227, 117) or Color3.fromRGB(255, 255, 255)
			v2.Content.ScoreLabel.Text = v9.splice((tonumber(v.Amount))) .. " pts"
			v2.Content.RankPlacementLabel.Text = "#" .. k
			v2.Content.RankPlacementLabel.TextColor3 = v4 and v4.Text or (v.UserId == v10.Player.UserId and Color3.fromRGB(255, 227, 117) or Color3.fromRGB(255, 255, 255))
			v2.Content.RankImage.Visible = v4
			v2.Content.RankImage.ImageColor3 = v4 and v4.Image or v2.Content.RankImage.ImageColor3
			v2.BackgroundTransparency = if tonumber(k) % 2 == 0 then 1 else 0
			v2.Visible = true
			t[k] = true
			p1.PositionsByUserId[tonumber(v.UserId)] = k
		end
		for k, v in pairs(p1.CreatedFrames) do
			if not t[k] then
				v.Visible = false
			end
		end
		p1.LeaderboardFrame.LoadingLabel.Visible = false
	else
		p1.LeaderboardMaid:DoCleaning()
		p1.CreatedFrames = {}
		p1.PositionsByUserId = {}
	end
	p1.RankChangedSignal:Fire()
end
function t.Init(p1) --[[ Init | Line: 227 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("TameContestLeaderboard", t):Init()
end
t:Init()
return t