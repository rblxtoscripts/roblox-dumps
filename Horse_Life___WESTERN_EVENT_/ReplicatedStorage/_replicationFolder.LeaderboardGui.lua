-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("Maid")
local v3 = Sonar("PlayerUtils")
local v4 = Sonar("GuiManager")
local v5 = Sonar("FormatNumber")
local v6 = Sonar("CharacterControls")
local v7 = Sonar("UINavigator")
local v8 = Sonar("ButtonTest")
local v9 = Sonar("InputTypeDetector")
local v10 = Sonar("Button")
local v11 = Sonar("GuiUtils")
local v12 = Sonar("FriendsService")
local v13 = Sonar("State")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v14 = v1.GetClient()
local LeaderboardGui = LocalPlayer.PlayerGui:WaitForChild("LeaderboardGui")
local t2 = {}
local v15 = false
local v16 = false
local v17 = v13.new(false)
t.LeaderboardGui = LeaderboardGui
t.MinimapOpen = v17
local v18 = nil
local v19 = Sonar("Signal").new()
local function createPlayerFrame(p1, p2) --[[ createPlayerFrame | Line: 44 | Upvalues: v1 (copy), v2 (copy), LocalPlayer (copy), v3 (copy), v12 (copy), v10 (copy), v18 (ref), v19 (copy), v8 (copy), StarterGui (copy), v5 (copy), t2 (copy) ]]
	local v13 = v1.getWrapperFromPlayer(p2)
	if not v13 then
		return
	end
	local v22 = v2.new()
	local v32 = if p2 == LocalPlayer then true else false
	local Default = p1:FindFirstChild("Default", true)
	local v4 = Default:Clone()
	Default.Visible = false
	v4.List.PlayerInfo.UserNameLabel.Text = "@" .. p2.Name
	v4.List.PlayerInfo.DisplayNameLabel.Text = v3.GetPlayerName(p2)
	v4.List.PlayerInfo.ImageLabel.Image = v3.GetUserThumbnail(p2.UserId)
	local function getTextColor() --[[ getTextColor | Line: 60 | Upvalues: v32 (copy), v12 (ref), p2 (copy) ]]
		if v32 then
			return Color3.fromRGB(255, 227, 117)
		end
		if v12:IsFriendsWith(p2) then
			return Color3.fromRGB(125, 255, 173)
		else
			return Color3.fromRGB(255, 255, 255)
		end
	end
	local function getFontFace(p1) --[[ getFontFace | Line: 70 | Upvalues: v32 (copy) ]]
		local FontFace = p1.FontFace
		if v32 then
			FontFace.Weight = Enum.FontWeight.ExtraBold
		else
			FontFace.Weight = Enum.FontWeight.Regular
		end
		return FontFace
	end
	local function setFriendsWith() --[[ setFriendsWith | Line: 81 | Upvalues: v4 (copy) ]]
		v4.FriendButton.Visible = false
	end
	v22:GiveTask(v10.new(v4, {
		NoHoverShadowLabel = true,
		HoverLabel = v4.HoverShadow
	}))
	v10:RegisterHover(v4, function() --[[ Line: 89 | Upvalues: v4 (copy) ]]
		v4.List.PlayerInfo.UserNameLabel.Visible = true
		v4.List.PlayerInfo.DisplayNameLabel.Visible = false
		v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end)
	v10:RegisterLeave(v4, function() --[[ Line: 94 | Upvalues: v4 (copy), v18 (ref), p2 (copy) ]]
		v4.List.PlayerInfo.UserNameLabel.Visible = false
		v4.List.PlayerInfo.DisplayNameLabel.Visible = true
		v4.BackgroundColor3 = v18 == p2 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)
	end)
	v10:RegisterClick(v4, function() --[[ Line: 100 | Upvalues: v18 (ref), p2 (copy), v19 (ref) ]]
		v18 = if v18 == p2 then nil else p2
		v19:Fire()
	end)
	v22:GiveTask(v19:Connect(function() --[[ Line: 108 | Upvalues: v18 (ref), p2 (copy), v4 (copy), v32 (copy), v12 (ref) ]]
		if v18 ~= p2 then
			v4.FriendButton.Visible = false
			v4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			return
		end
		v4.FriendButton.Visible = not v32 and not v12:IsFriendsWith(p2)
		v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end))
	pcall(function() --[[ Line: 118 | Upvalues: v22 (copy), v13 (copy), setFriendsWith (copy) ]]
		v22:GiveTask(v13.FriendedSignal:Connect(setFriendsWith))
		v22:GiveTask(v13.UnfriendedSignal:Connect(setFriendsWith))
	end)
	v22:GiveTask(v8.new(v4.FriendButton, {
		Rotate = false,
		Click = function() --[[ Click | Line: 125 | Upvalues: StarterGui (ref), p2 (copy) ]]
			StarterGui:SetCore("PromptSendFriendRequest", p2)
		end
	}))
	for k, v in pairs({ "FoalsBorn", "Tames" }) do
		local v52 = if v == "Tames" then true else false
		local v6 = p2:WaitForChild("ReplicatedStats"):WaitForChild(v)
		local v7 = v4.List[v]
		local function setStat() --[[ setStat | Line: 135 | Upvalues: v7 (copy), v5 (ref), v6 (copy), v52 (copy), v4 (copy) ]]
			v7.TextLabel.Text = v5.suffix(v6.Value)
			if not v52 then
				return
			end
			v4.LayoutOrder = -v6.Value
		end
		v22:GiveTask(v6:GetPropertyChangedSignal("Value"):Connect(setStat))
		v7.TextLabel.Text = v5.suffix(v6.Value)
		if v52 then
			v4.LayoutOrder = -v6.Value
		end
		local function setTextColor() --[[ setTextColor | Line: 145 | Upvalues: v7 (copy), getTextColor (copy) ]]
			v7.TextLabel.TextColor3 = getTextColor()
		end
		pcall(function() --[[ Line: 149 | Upvalues: v22 (copy), v13 (copy), setTextColor (copy) ]]
			v22:GiveTask(v13.FriendedSignal:Connect(setTextColor))
			v22:GiveTask(v13.UnfriendedSignal:Connect(setTextColor))
		end)
		v7.TextLabel.TextColor3 = getTextColor()
		local FontFace = v7.TextLabel.FontFace
		if v32 then
			FontFace.Weight = Enum.FontWeight.ExtraBold
		else
			FontFace.Weight = Enum.FontWeight.Regular
		end
		v7.TextLabel.FontFace = FontFace
	end
	for k, v in pairs({ v4.List.PlayerInfo.UserNameLabel, v4.List.PlayerInfo.DisplayNameLabel }) do
		local FontFace = v.FontFace
		if v32 then
			FontFace.Weight = Enum.FontWeight.ExtraBold
		else
			FontFace.Weight = Enum.FontWeight.Regular
		end
		v.FontFace = FontFace
		local function setTextColor() --[[ setTextColor | Line: 160 | Upvalues: v (copy), getTextColor (copy) ]]
			v.TextColor3 = getTextColor()
		end
		pcall(function() --[[ Line: 164 | Upvalues: v22 (copy), v13 (copy), setTextColor (copy) ]]
			v22:GiveTask(v13.FriendedSignal:Connect(setTextColor))
			v22:GiveTask(v13.UnfriendedSignal:Connect(setTextColor))
		end)
		v.TextColor3 = getTextColor()
	end
	v4.Name = p2.Name
	v4.Visible = true
	v4.Parent = p1.ScrollingClipping.ScrollingFrame
	v22:GiveTask(v4)
	t2[p1][p2] = v22
end
local function removePlayerFrame(p1, p2) --[[ removePlayerFrame | Line: 180 | Upvalues: t2 (copy), v18 (ref) ]]
	local v1 = t2[p1]
	if not v1[p2] then
		return
	end
	if v18 ~= p2 then
		v1[p2]:Destroy()
		v1[p2] = nil
		return
	end
	v18 = nil
	v1[p2]:Destroy()
	v1[p2] = nil
end
function t.Toggle() --[[ Toggle | Line: 190 | Upvalues: v17 (copy), v9 (copy), v15 (ref), v16 (ref), t (copy) ]]
	local v1 = not v17:get()
	if v9.IsMobileInputType() then
		v15 = not v15
		v16 = v15
	else
		v17:set(v1)
		v16 = not v16
		v15 = v16
	end
	if v15 or v16 then
		t.Open()
	else
		t.Close()
	end
end
function t.Open() --[[ Open | Line: 212 | Upvalues: v15 (ref), v16 (ref), LeaderboardGui (copy), v4 (copy) ]]
	v15 = true
	v16 = true
	LeaderboardGui.Other.ScrollingClipping.Visible = true
	LeaderboardGui.Other.CollapseButton.Top.TextLabel.Rotation = 0
	v4.UpdateFrame(LeaderboardGui.Mobile)
	v4.UpdateFrame(LeaderboardGui.Other)
end
function t.Close() --[[ Close | Line: 222 | Upvalues: v15 (ref), v16 (ref), LeaderboardGui (copy), v4 (copy) ]]
	v15 = false
	v16 = false
	LeaderboardGui.Other.ScrollingClipping.Visible = false
	LeaderboardGui.Other.CollapseButton.Top.TextLabel.Rotation = 180
	v4.UpdateFrame(LeaderboardGui.Mobile)
	v4.UpdateFrame(LeaderboardGui.Other)
end
function t.IsMobileLeaderboardOpen() --[[ IsMobileLeaderboardOpen | Line: 232 | Upvalues: v15 (ref) ]]
	return v15
end
function t.IsLeaderboardVisible() --[[ IsLeaderboardVisible | Line: 236 | Upvalues: v16 (ref) ]]
	return v16
end
function t.Init(p1) --[[ Init | Line: 240 | Upvalues: LeaderboardGui (copy), t2 (copy), v4 (copy), v11 (copy), v14 (copy), v15 (ref), v17 (copy), v1 (copy), createPlayerFrame (copy), v18 (ref), v9 (copy), t (copy), v8 (copy), v6 (copy), v19 (copy), v7 (copy) ]]
	for k, v in pairs(LeaderboardGui:GetChildren()) do
		t2[v] = {}
		local v12 = v.Name == "Mobile" and UDim2.new(-0.35, 0, 0, 0) or UDim2.new(0.35, 0, 0, -game.GuiService.TopbarInset.Height)
		local v2 = v.Name == "Other" and UDim2.new(0, 0, 0, -game.GuiService.TopbarInset.Height) or UDim2.new(0, 0, 0, 0)
		v4.AddFrame(v, {
			HUD = true,
			TweenAnimation = true,
			OpenPosition = v.Position + v2,
			ClosePosition = v.Position + v12,
			TweenStyle = TweenInfo.new(0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			InputType = v.Name,
			CheckVisibility = function() --[[ CheckVisibility | Line: 258 | Upvalues: v11 (ref), v14 (ref), v (copy), v15 (ref), v17 (ref) ]]
				if not v11.GetGameState("PlayerLeaderboard") then
					return
				end
				if not v11.CanShowHUD() then
					return
				end
				if v14:IsInAction("Race") then
					return
				end
				if v.Name == "Mobile" then
					return v15
				end
				if v17:get() then
				else
					return true
				end
			end
		})
		if v.Name == "Mobile" then
			v4.AddStateCallback(v, "OnOpen", function() --[[ Line: 276 | Upvalues: v11 (ref) ]]
				v11.SetChatVisibility(false)
			end)
		end
		v1.bindToPlayers(function(p1) --[[ Line: 281 | Upvalues: createPlayerFrame (ref), v (copy) ]]
			createPlayerFrame(v, p1)
		end, function(p1) --[[ Line: 283 | Upvalues: v (copy), t2 (ref), v18 (ref) ]]
			local v1 = t2[v]
			if not v1[p1] then
				return
			end
			if v18 ~= p1 then
				v1[p1]:Destroy()
				v1[p1] = nil
				return
			end
			v18 = nil
			v1[p1]:Destroy()
			v1[p1] = nil
		end)
	end
	v11.GetChatVisiblityChanged(function() --[[ Line: 288 | Upvalues: v9 (ref), v11 (ref), t (ref) ]]
		if not (v9.IsMobileInputType() and v11.IsChatOpen()) then
			return
		end
		t.Close()
	end)
	v8.new(LeaderboardGui.Other.CollapseButton, {
		Click = t.Toggle
	})
	v6:AddControls("LeaderboardDeselectPlayer", {
		Enum.KeyCode.ButtonSelect,
		Enum.UserInputType.Touch,
		Enum.UserInputType.MouseButton1,
		Enum.KeyCode.ButtonB
	}, {
		InputBegan = function(p1, p2) --[[ InputBegan | Line: 306 | Upvalues: v18 (ref), v19 (ref) ]]
			if not v18 then
				return
			end
			v18 = nil
			v19:Fire()
		end
	}, function() --[[ Line: 312 | Upvalues: v7 (ref) ]]
		return v7.CanNavigateHUD()
	end)
	v6:AddControls("Leaderboard", { Enum.KeyCode.Tab }, {
		InputBegan = t.Toggle
	}, function() --[[ Line: 320 | Upvalues: v4 (ref), v7 (ref) ]]
		if v4.IsHUDOpen() then
			return v7.CanNavigateHUD()
		end
	end)
	if v9.IsMobileInputType() then
		return
	end
	t.Open()
end
t:Init()
return t