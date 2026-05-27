-- https://lua.expert/
local t = {}
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Button3D")
local v2 = Sonar("GuiUtils")
local v3 = Sonar("TabManager")
local v4 = Sonar("TimeUtils")
local v5 = Sonar("Maid")
local v6 = Sonar("FormatNumber")
local v7 = Sonar("PlayerUtils")
local v8 = Sonar("Signal")
local v9 = Sonar("GlobalLeaderboardService")
local t2 = {
	Default = v6.suffix,
	PlayTime = v4.FormatString
}
local v10 = Sonar("PlayerWrapper").GetClient()
local Leaderboards = Workspace:WaitForChild("Leaderboards")
function t.Init(p1) --[[ Init | Line: 33 | Upvalues: Leaderboards (copy), t2 (copy), v5 (copy), v8 (copy), v3 (copy), HttpService (copy), v7 (copy), v6 (copy), v10 (copy), v9 (copy), v4 (copy), v1 (copy), v2 (copy) ]]
	for k, v in pairs(Leaderboards:GetChildren()) do
		local LeaderboardGui = v:WaitForChild("LeaderboardGui")
		local Default = LeaderboardGui.ContainerFrame.TabFrames.AllTime.ScrollingFrame.Default
		Default.Visible = false
		local v12 = t2[v.Name] or t2.Default
		for k2, v11 in pairs(v:WaitForChild("TimeFrames"):GetChildren()) do
			local v22 = LeaderboardGui.ContainerFrame.TabButtons[v11.Name]
			local v32 = LeaderboardGui.ContainerFrame.TabFrames[v11.Name]
			local v42 = v5.new()
			local v52 = v8.new()
			local t = {}
			local Data = v11:WaitForChild("Data")
			local t3 = {}
			local function updateLeaderboard(p1) --[[ updateLeaderboard | Line: 53 | Upvalues: v3 (ref), v32 (copy), Data (copy), HttpService (ref), v42 (copy), t (ref), t3 (ref), v52 (copy), Default (copy), v7 (ref), v12 (copy), v6 (ref) ]]
				local v1 = v3.IsTabOpen(v32) and #Data.Value > 0 and HttpService:JSONDecode(Data.Value) or nil
				if not (v1 and next(v1)) then
					v42:DoCleaning()
					t = {}
					t3 = {}
					v52:Fire()
					v32.LoadingLabel.Visible = true
					return
				end
				if p1 then
					return
				end
				v42:DoCleaning()
				t3 = {}
				local t2 = {}
				for k, v in pairs(v1) do
					local v2
					if t[k] then
						v2 = t[k]
					else
						local v33 = Default:Clone()
						v33.Name = k
						v33.Visible = true
						v33.Parent = v32.ScrollingFrame
						t[k] = v33
						v42:GiveTask(v33)
						v2 = v33
					end
					v2.InnerFrame.DisplayNameLabel.Text = v.Name or "Loading..."
					v2.InnerFrame.UserNameLabel.Text = "@" .. (v.Username or "Loading...")
					v2.InnerFrame.ImageLabel.PlayerLabel.Image = v7.GetUserThumbnail(v.UserId)
					v2.InnerFrame.AmountLabel.Text = v12((tonumber(v.Amount)))
					local v5 = v2.InnerFrame.RankLabels:FindFirstChild(k) or v2.InnerFrame.RankLabels.Other
					v5.Text = v6.GetOrdinalOfNumber(k)
					for k2, v8 in pairs(v2.InnerFrame.RankLabels:GetChildren()) do
						v8.Visible = v5 == v8
					end
					v2.Visible = true
					t2[k] = true
					t3[tonumber(v.UserId)] = k
				end
				for k, v in pairs(t) do
					if not t2[k] then
						v.Visible = false
					end
				end
				v32.ScrollingFrame.Visible = true
				v32.LoadingLabel.Visible = false
				v52:Fire()
			end
			Data:GetPropertyChangedSignal("Value"):Connect(updateLeaderboard)
			local StatFrame = v32.YourStatFrame.StatFrame
			StatFrame.InnerFrame.DisplayNameLabel.Text = v7.GetPlayerName(v10.Player)
			StatFrame.InnerFrame.UserNameLabel.Text = "@" .. v10.Player.Name
			StatFrame.InnerFrame.ImageLabel.PlayerLabel.Image = v7.GetUserThumbnail(v10.Player.UserId)
			local v62 = v9.GetStatHandler(v.Name)(v10, v11.Name)
			local function setStatLabel() --[[ setStatLabel | Line: 131 | Upvalues: StatFrame (copy), v12 (copy), v62 (copy) ]]
				StatFrame.InnerFrame.AmountLabel.Text = v12((tonumber(v62.Value)))
			end
			v62:GetPropertyChangedSignal("Value"):Connect(setStatLabel)
			StatFrame.InnerFrame.AmountLabel.Text = v12((tonumber(v62.Value)))
			local function setRankLabel() --[[ setRankLabel | Line: 138 | Upvalues: t3 (ref), v10 (ref), StatFrame (copy), v6 (ref) ]]
				local v1 = t3[v10.Player.UserId]
				local v2 = t3[v10.Player.UserId] and StatFrame.InnerFrame.RankLabels:FindFirstChild(v1) or StatFrame.InnerFrame.RankLabels.Other
				v2.Text = v1 and v6.GetOrdinalOfNumber(v1) or "#"
				for k, v in pairs(StatFrame.InnerFrame.RankLabels:GetChildren()) do
					v.Visible = v2 == v
				end
			end
			v52:Connect(setRankLabel)
			setRankLabel()
			local EndTime = v11:FindFirstChild("EndTime")
			if EndTime then
				local function setTimerLabel() --[[ setTimerLabel | Line: 153 | Upvalues: v32 (copy), v4 (ref), EndTime (copy) ]]
					v32.TopFrame.TimerLabel.Text = "Resets in " .. v4.FormatString(EndTime.Value - v4.Get())
				end
				v4.AttachToTime(setTimerLabel)
				EndTime:GetPropertyChangedSignal("Value"):Connect(setTimerLabel)
				v32.TopFrame.TimerLabel.Text = "Resets in " .. v4.FormatString(EndTime.Value - v4.Get())
			end
			v3.AddTab(v32, {
				ParentFrame = LeaderboardGui,
				Button = v22
			})
			v3.AddStateCallback(v32, "OnOpen", function() --[[ Line: 166 | Upvalues: v3 (ref), v32 (copy), Data (copy), HttpService (ref), v42 (copy), t (ref), t3 (ref), v52 (copy) ]]
				local v1 = if v3.IsTabOpen(v32) and #Data.Value > 0 then HttpService:JSONDecode(Data.Value) or nil else nil
				if not (v1 and next(v1)) then
					v42:DoCleaning()
					t = {}
					t3 = {}
					v52:Fire()
					v32.LoadingLabel.Visible = true
				end
			end)
			v1.new(v22, {
				Click = function() --[[ Click | Line: 171 | Upvalues: v32 (copy), v3 (ref) ]]
					if v32 then
						v3.OpenTab(v32)
					end
				end
			})
			v2.manageScrollFrame(v32.ScrollingFrame.UIListLayout)
		end
		v3.OpenTab(LeaderboardGui.ContainerFrame.TabFrames.AllTime)
	end
end
t:Init()
return t