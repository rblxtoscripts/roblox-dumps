-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("Maid")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("Constants")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("MusicService")
local v8 = Sonar("NotificationsClient")
local v9 = Sonar("MessagesClient")
local v10 = Sonar("PlayerUtils")
local LocalPlayer = Players.LocalPlayer
local TagMinigame = LocalPlayer.PlayerGui:WaitForChild("TagMinigame")
local ContainerFrame = TagMinigame.ContainerFrame
local Hotbar = ContainerFrame.Hotbar
local Template = Hotbar.Template
local Timer = ContainerFrame.Timer
local t2 = {
	Freeze = "Freeze",
	Build = "Build",
	Trap = "Trap"
}
local t3 = { "Freeze", "Build", "Trap" }
local t4 = {
	[t2.Freeze] = Color3.fromRGB(170, 220, 255),
	[t2.Build] = Color3.fromRGB(139, 90, 43),
	[t2.Trap] = Color3.fromRGB(128, 0, 128)
}
local t5 = {
	[t2.Freeze] = "Freeze",
	[t2.Build] = "Wall",
	[t2.Trap] = "Trap"
}
local t6 = {
	[t2.Build] = "rbxassetid://138861116860797",
	[t2.Freeze] = "rbxassetid://88719362422799",
	[t2.Trap] = "rbxassetid://82632739323271"
}
local t7 = {}
local Freeze = t2.Freeze
local t8 = {}
local v11 = v2.new()
local v12 = nil
local Frozen = TagMinigame.Frozen
local RewardFrame = TagMinigame.RewardFrame
local ImageLabel = RewardFrame.WinnerFrame.ImageLabel
local LeftFrame = RewardFrame.LeftFrame
local Default = LeftFrame.Default
local CloseButton = RewardFrame.CloseButton
local Rewards = RewardFrame.Rewards
local Default_2 = Rewards.Default
local v13 = v4.GetRemoteEvent("TagGameRemote")
local PlayersFrame = ContainerFrame:FindFirstChild("PlayersFrame")
local v14 = PlayersFrame and PlayersFrame:FindFirstChild("Default")
local t9 = {}
local v15 = v2.new()
local t10 = {}
local t11 = {
	Team1 = "rbxassetid://101796112330714",
	Team2 = "rbxassetid://119410009089753"
}
local v16 = false
local v17 = false
local v18 = v2.new()
function t.Open() --[[ Open | Line: 85 | Upvalues: v16 (ref), v1 (copy), ContainerFrame (copy) ]]
	v16 = true
	v1.OpenFrame(ContainerFrame)
end
function t.Close() --[[ Close | Line: 90 | Upvalues: v16 (ref), v15 (copy), t9 (ref), t10 (ref), v1 (copy), ContainerFrame (copy) ]]
	v16 = false
	v15:DoCleaning()
	t9 = {}
	t10 = {}
	v1.CloseFrame(ContainerFrame)
end
function t.SetOnBrickSelected(p1) --[[ SetOnBrickSelected | Line: 98 | Upvalues: v12 (ref) ]]
	v12 = p1
end
function t.SetBrickInventory(p1, p2) --[[ SetBrickInventory | Line: 102 | Upvalues: t7 (ref), Freeze (ref), t2 (copy), t (copy) ]]
	t7 = p1
	Freeze = if p2 then p2 else t2.Freeze
	t.UpdateBrickSlots()
end
function t.SetSelectedBrick(p1) --[[ SetSelectedBrick | Line: 108 | Upvalues: Freeze (ref), t (copy) ]]
	Freeze = p1
	t.UpdateSlotSelection()
end
function t.UpdateBrickSlots() --[[ UpdateBrickSlots | Line: 113 | Upvalues: v11 (copy), t8 (ref), t3 (copy), t7 (ref), t2 (copy), Template (copy), Hotbar (copy), t5 (copy), t6 (copy), t4 (copy), Freeze (ref), v3 (copy), v12 (ref) ]]
	v11:DoCleaning()
	t8 = {}
	for v1, v2 in t3 do
		local v32 = t7[v2] or 0
		if v2 == t2.Freeze or v32 > 0 then
			local v4 = Template:Clone()
			v4.Name = "BrickSlot_" .. v2
			v4.Visible = true
			v4.Parent = Hotbar
			v4.Menu.Content.OwnedLabel.Text = (t5[v2] or v2) .. " x" .. tostring(v32)
			local Viewport = v4:FindFirstChild("Viewport", true)
			if Viewport then
				Viewport.Image = t6[v2] or ""
			end
			if v32 == 0 then
				v4.Menu.Content.OwnedLabel.TextColor3 = Color3.fromRGB(255, 48, 48)
			else
				v4.Menu.Content.OwnedLabel.TextColor3 = t4[v2] or Color3.fromRGB(255, 255, 255)
			end
			local v7 = if v2 == Freeze then true else false
			if v4:FindFirstChild("SelectionFrame") then
				v4.SelectionFrame.Visible = v7
			end
			v3.new(v4, {
				Click = function() --[[ Click | Line: 146 | Upvalues: v32 (copy), v12 (ref), v2 (copy) ]]
					if not (v32 > 0 and v12) then
						return
					end
					v12(v2)
				end
			})
			t8[v2] = v4
			v11:GiveTask(v4)
		end
	end
end
function t.UpdateSlotSelection() --[[ UpdateSlotSelection | Line: 159 | Upvalues: t8 (ref), Freeze (ref), t7 (ref), t4 (copy) ]]
	for v1, v2 in t8 do
		local v3 = v1 == Freeze
		if v2:FindFirstChild("SelectionFrame") then
			v2.SelectionFrame.Visible = v3
		end
		if (t7[v1] or 0) == 0 then
			v2.Menu.Content.OwnedLabel.TextColor3 = Color3.fromRGB(255, 48, 48)
			continue
		end
		if v3 then
			v2.Menu.Content.OwnedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			continue
		end
		v2.Menu.Content.OwnedLabel.TextColor3 = t4[v1] or Color3.fromRGB(200, 200, 200)
	end
end
function t.SetTimer(p1) --[[ SetTimer | Line: 177 | Upvalues: Timer (copy) ]]
	local v1 = math.floor(p1 / 60)
	local v2 = math.floor(p1 % 60)
	if v1 > 0 then
		Timer.Text = v1 .. " min " .. v2 .. " seconds left!"
	else
		Timer.Text = v2 .. " seconds left!"
	end
end
function t.SetFrozen(p1) --[[ SetFrozen | Line: 188 | Upvalues: Frozen (copy), ReplicatedStorage (copy) ]]
	Frozen.Visible = p1
	if not p1 then
		return
	end
	ReplicatedStorage.Storage.SFX.Iced:Play()
end
function t.SetPlayers(p1) --[[ SetPlayers | Line: 196 | Upvalues: v15 (copy), t9 (ref), t10 (ref), PlayersFrame (copy), v14 (copy), v10 (copy) ]]
	v15:DoCleaning()
	t9 = {}
	t10 = p1
	if not (PlayersFrame and v14) then
		return
	end
	for v1, v2 in p1 do
		local v3 = v14:Clone()
		v3.Name = "PlayerEntry_" .. v2.Name
		v3.PlayerLabel.Text = v2.Name
		v3.PositionLabel.Text = "0"
		v3.PlayerImageLabel.Image = v10.GetUserThumbnail(v2.UserId, Enum.ThumbnailType.HeadShot)
		v3.Visible = true
		v3.Parent = PlayersFrame
		t9[v2] = v3
		v15:GiveTask(v3)
	end
end
function t.UpdateScoreboard(p1) --[[ UpdateScoreboard | Line: 219 | Upvalues: t10 (ref), t9 (ref) ]]
	local t = {}
	for v1, v2 in t10 do
		table.insert(t, {
			Player = v2,
			Tags = p1[v2.UserId] or 0
		})
	end
	table.sort(t, function(p1, p2) --[[ Line: 229 ]]
		return p1.Tags > p2.Tags
	end)
	for v3, v4 in t do
		local v5 = t9[v4.Player]
		if v5 then
			v5.PositionLabel.Text = tostring(v4.Tags)
			v5.LayoutOrder = v3
		end
	end
end
function t.GetPositionSuffix(p1) --[[ GetPositionSuffix | Line: 242 ]]
	if p1 == 1 then
		return "1st"
	end
	if p1 == 2 then
		return "2nd"
	end
	if p1 == 3 then
		return "3rd"
	else
		return p1 .. "th"
	end
end
function t.ShowResults(p1) --[[ ShowResults | Line: 254 | Upvalues: v16 (ref), v18 (copy), v11 (copy), v15 (copy), t8 (ref), t9 (ref), t10 (ref), v1 (copy), ContainerFrame (copy), ImageLabel (copy), t11 (copy), Frozen (copy), Default (copy), v10 (copy), t (copy), LeftFrame (copy), LocalPlayer (copy), v17 (ref), v5 (copy), Default_2 (copy), Rewards (copy), v6 (copy), v3 (copy), RewardFrame (copy) ]]
	v16 = false
	v18:DoCleaning()
	v11:DoCleaning()
	v15:DoCleaning()
	t8 = {}
	t9 = {}
	t10 = {}
	v1.CloseFrame(ContainerFrame)
	if p1.WinningTeam then
		ImageLabel.Image = t11[p1.WinningTeam]
	else
		ImageLabel.Image = ""
	end
	Frozen.Visible = false
	for v12, v2 in p1.Results do
		local v32 = Default:Clone()
		v32.Name = "Player_" .. v2.Player.Name
		v32.PlayerImageLabel.Image = v10.GetUserThumbnail(v2.Player.UserId, Enum.ThumbnailType.HeadShot)
		v32.PlayerLabel.Text = v2.Player.Name
		v32.PositionLabel.Text = t.GetPositionSuffix(v12)
		v32.TimeLabel.Text = v2.Tags .. " tags"
		v32.Visible = true
		v32.Parent = LeftFrame
		v18:GiveTask(v32)
	end
	local v4 = nil
	for v52, v62 in p1.Results do
		if v62.Player == LocalPlayer then
			v4 = v62.Team
			break
		end
	end
	local v8 = if p1.WinningTeam and (if v4 == p1.WinningTeam then true else false) then p1.RewardWin or 200 else p1.RewardLoss or 100
	v17 = v8 > 0
	if v17 and v5.EventCurrencyName then
		local EventCurrencyReward = Default_2:Clone()
		EventCurrencyReward.Name = "EventCurrencyReward"
		EventCurrencyReward.Visible = true
		EventCurrencyReward.Parent = Rewards
		local v102 = v6.GetByName(v5.EventCurrencyName)
		EventCurrencyReward.Viewport.Viewport.Image = v102.Image
		EventCurrencyReward.Viewport.Image = v102.Image
		EventCurrencyReward.Viewport.AmountLabel.Text = "x" .. v8
		EventCurrencyReward.Viewport.NameLabel.Text = v102.Name
		v3.new(EventCurrencyReward.ClaimButton, {
			Click = t.HideResults
		})
		v18:GiveTask(EventCurrencyReward)
	end
	RewardFrame.Visible = true
end
function t.ClaimReward() --[[ ClaimReward | Line: 320 | Upvalues: v17 (ref), v13 (copy) ]]
	if not v17 then
		return
	end
	v13:FireServer("ClaimReward")
	v17 = false
end
function t.CloseRewardFrame() --[[ CloseRewardFrame | Line: 327 | Upvalues: RewardFrame (copy), t (copy), v18 (copy) ]]
	if not RewardFrame.Visible then
		return
	end
	t.ClaimReward()
	RewardFrame.Visible = false
	v18:DoCleaning()
end
function t.HideResults() --[[ HideResults | Line: 335 | Upvalues: t (copy), RewardFrame (copy), v18 (copy), v1 (copy), ContainerFrame (copy), v7 (copy) ]]
	t.ClaimReward()
	RewardFrame.Visible = false
	v18:DoCleaning()
	_G.HideHUD = false
	_G.UnlimitedStamina = false
	_G.StopFlying = false
	_G.HotbarVisible = true
	v1.CloseFrame(ContainerFrame)
	v7.setMusicTrack("TagMinigame", false)
end
function t.Init() --[[ Init | Line: 350 | Upvalues: v1 (copy), ContainerFrame (copy), v16 (ref), Default (copy), Default_2 (copy), RewardFrame (copy), Template (copy), v14 (copy), v3 (copy), CloseButton (copy), t (copy), v8 (copy), v9 (copy) ]]
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		FrameType = "Sub",
		IgnoreLayerCollector = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		CheckVisibility = function() --[[ CheckVisibility | Line: 357 | Upvalues: v16 (ref) ]]
			return v16
		end
	})
	Default.Visible = false
	Default_2.Visible = false
	RewardFrame.Visible = false
	Template.Visible = false
	if v14 then
		v14.Visible = false
	end
	v3.new(CloseButton, {
		Click = t.HideResults
	})
	v8.AddNotificationCallback("TagMinigameStart", function(p1) --[[ Line: 374 | Upvalues: v9 (ref) ]]
		v9:AddNotification({
			Type = "TagMinigameStart",
			DoNotSkip = true,
			Duration = 10
		})
	end)
end
t.Init()
return t