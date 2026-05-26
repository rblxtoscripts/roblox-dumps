-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("GuiUtils")
local v3 = Sonar("Maid")
local v4 = Sonar("TimeUtils")
local v5 = Sonar("NotificationsClient")
local v6 = Sonar("TutorialService")
local CurrentEvent = Sonar("Constants").CurrentEvent
local v7 = CurrentEvent and CurrentEvent.UICosmetics or nil
local t2 = {
	TextLabel = {
		TextTransparency = 1,
		TextStrokeTransparency = 1
	},
	ImageLabel = {
		BackgroundTransparency = 1,
		ImageTransparency = 1
	}
}
local LocalPlayer = game:GetService("Players").LocalPlayer
local v8 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local TopFrame = PlayerGui:WaitForChild("TouchNodeEventGui").TopFrame
local HUDGui = PlayerGui:WaitForChild("HUDGui")
local TouchNodeEvent = ReplicatedStorage.WorldStorage:WaitForChild("TouchNodeEvent")
local v9 = v3.new()
function t.Start(p1) --[[ Start | Line: 43 | Upvalues: v1 (copy), TopFrame (copy), HUDGui (copy), TouchNodeEvent (copy), v4 (copy), v9 (copy), v8 (copy), CurrentEvent (copy), v7 (copy), Sonar (copy), ReplicatedStorage (copy), t2 (copy) ]]
	_G.HideTopHUD = true
	v1.UpdateFrame(TopFrame)
	for k, v in pairs(HUDGui.TopFrame:GetChildren()) do
		v1.UpdateFrame(v)
	end
	local function setTimerLabel() --[[ setTimerLabel | Line: 50 | Upvalues: TouchNodeEvent (ref), v4 (ref), TopFrame (ref) ]]
		TopFrame.ContainerFrame.Content.Timer.TextLabel.Text = "Ends in " .. v4.FormatString((math.max(TouchNodeEvent.EndTime.Value - v4.Get(), 0)))
	end
	v9:GiveTask(TouchNodeEvent.EndTime:GetPropertyChangedSignal("Value"):Connect(setTimerLabel))
	v9:GiveTask(v4.AttachToTime(setTimerLabel))
	local v12 = TouchNodeEvent.EndTime.Value - v4.Get()
	TopFrame.ContainerFrame.Content.Timer.TextLabel.Text = "Ends in " .. v4.FormatString((math.max(v12, 0)))
	local function setCurrencyLabel() --[[ setCurrencyLabel | Line: 58 | Upvalues: TopFrame (ref), v8 (ref), CurrentEvent (ref) ]]
		TopFrame.ContainerFrame.Content.Currency.TextLabel.Text = "x" .. (v8:GetReplicatedData("TouchNodes") or 0) * CurrentEvent.CurrencyPerTouchNodeCleared
	end
	v9:GiveTask(v8:GetReplicatedDataChangedSignal("TouchNodes"):Connect(setCurrencyLabel))
	TopFrame.ContainerFrame.Content.Currency.TextLabel.Text = "x" .. (v8:GetReplicatedData("TouchNodes") or 0) * CurrentEvent.CurrencyPerTouchNodeCleared
	TopFrame.ContainerFrame.Content.BackgroundColor3 = v7.PrimaryColor
	TopFrame.ContainerFrame.BottomCard.BackgroundColor3 = v7.SecondaryColor
	TopFrame.ContainerFrame.Content.ProgressBar.BackgroundColor3 = v7.QuaternaryColor
	TopFrame.ContainerFrame.Content.ProgressBar.Fill.BackgroundColor3 = v7.TertiaryColor
	local Title = TopFrame.ContainerFrame.Content.ProgressBar.Title
	Title.Text = if v7.TouchNodeMinigameAmountLeftText then v7.TouchNodeMinigameAmountLeftText:upper() else "TOUCH NODES LEFT"
	TopFrame.ContainerFrame.Content.Currency.Image = v7.CurrencyImage or ""
	TopFrame.ContainerFrame.Content.Currency.TextLabel.TextColor3 = v7.CurrencyStrokeColor
	TopFrame.ContainerFrame.Content.Currency.TextLabel.UIStroke.Color = v7.CurrencyStrokeColor
	local BossLabel = TopFrame.ContainerFrame.Content.BossLabels.BossLabel
	BossLabel.Text = if v7.TouchNodeMinigameName then v7.TouchNodeMinigameName:upper() else "TOUCH NODES"
	local UIGradient = TopFrame.ContainerFrame.Content.BossLabels.BossLabel.UIGradient
	UIGradient.Color = if v7.MainUIGradient then v7.MainUIGradient.Color else ColorSequence.new(Color3.fromRGB(255, 255, 255))
	TopFrame.ContainerFrame.Content.BossLabels.BossLabel.UIStroke.Color = v7.MainStrokeColor
	v9:GiveTask(Sonar("StatBar").new({
		TweenAmount = true,
		Clipped = false,
		Frame = TopFrame.ContainerFrame.Content.ProgressBar.Fill,
		AmountLabel = TopFrame.ContainerFrame.Content.ProgressBar.AmountLabel,
		GetText = function(p1, p2) --[[ GetText | Line: 85 ]]
			return p1 .. "/" .. p2
		end,
		Get = function() --[[ Get | Line: 89 | Upvalues: TouchNodeEvent (ref) ]]
			return TouchNodeEvent.TotalRemaining.Value
		end,
		GetMax = function() --[[ GetMax | Line: 92 | Upvalues: CurrentEvent (ref) ]]
			return CurrentEvent.MaxTouchNodeSpawn
		end,
		Changed = { TouchNodeEvent.TotalRemaining:GetPropertyChangedSignal("Value") }
	}))
	v9:GiveTask(v8:GetReplicatedDataChangedSignal("TouchNodes"):Connect(function() --[[ Line: 100 | Upvalues: v8 (ref), ReplicatedStorage (ref), CurrentEvent (ref), v7 (ref), t2 (ref) ]]
		if not v8:GetReplicatedData("TouchNodes") then
			return
		end
		if v8:GetReplicatedData("TouchNodes") <= 0 then
			return
		end
		local v1 = ReplicatedStorage.Storage.Assets.Effects.TouchNodeCollected:Clone()
		local ItemsGui = v1.ItemsGui
		ItemsGui.Enabled = true
		v1.WorldPosition = v8.PrimaryPart.Position
		v1.Parent = workspace.Terrain
		ItemsGui:FindFirstChild("AmountLabel", true).Text = "+" .. CurrentEvent.CurrencyPerTouchNodeCleared
		ItemsGui:FindFirstChild("AmountLabel", true).TextColor3 = v7.CurrencyStrokeColor
		local Viewport = ItemsGui:FindFirstChild("Viewport", true)
		Viewport.Image = v7.CurrencyImage or ""
		Viewport.Viewport.Image = Viewport.Image
		local v2 = ItemsGui.Default:Clone()
		v2.UIScale.Scale = 0
		v2.Visible = true
		v2.Parent = ItemsGui
		local t = {}
		local tbl = {}
		for k, v in pairs(v2:GetDescendants()) do
			local v3 = t2[v.ClassName]
			if v3 then
				t[v] = {}
				for k2, v4 in pairs(v3) do
					t[v][k2] = v[k2]
					v[k2] = v4
				end
			end
		end
		tbl[v2] = t
		for k, v in pairs(tbl) do
			game.TweenService:Create(k.UIScale, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Scale = 1
			}):Play()
			for k2, v3 in pairs(v) do
				game.TweenService:Create(k2, TweenInfo.new(0.15), v3):Play()
			end
		end
		task.wait(0.45)
		local v4 = nil
		for k, v in pairs(tbl) do
			for k2, v3 in pairs(v) do
				local v5 = game.TweenService:Create(k2, TweenInfo.new(0.6), t2[k2.ClassName])
				v5:Play()
				v4 = v5
			end
		end
		v4.Completed:Wait()
		v1:Destroy()
	end))
end
function t.End(p1) --[[ End | Line: 160 | Upvalues: v9 (copy), v1 (copy), TopFrame (copy), HUDGui (copy) ]]
	v9:DoCleaning()
	_G.HideTopHUD = false
	v1.UpdateFrame(TopFrame)
	for k, v in pairs(HUDGui.TopFrame:GetChildren()) do
		v1.UpdateFrame(v)
	end
end
function t.Init(p1) --[[ Init | Line: 170 | Upvalues: CurrentEvent (copy), v1 (copy), TopFrame (copy), v6 (copy), v8 (copy), v2 (copy), TouchNodeEvent (copy), v5 (copy), Sonar (copy), ReplicatedStorage (copy), v7 (copy), t (copy) ]]
	if not CurrentEvent then
		return
	end
	v1.AddFrame(TopFrame, {
		HUD = true,
		TweenAnimation = true,
		OpenPosition = TopFrame.Position,
		MobileOpenPosition = UDim2.new(TopFrame.Position.X.Scale, TopFrame.Position.X.Offset, 0.15, TopFrame.Position.Y.Offset),
		ClosePosition = TopFrame.Position + UDim2.new(0, 0, -0.2, 0),
		TweenStyle = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		CheckVisibility = function() --[[ CheckVisibility | Line: 188 | Upvalues: v6 (ref), v8 (ref), v2 (ref), TouchNodeEvent (ref) ]]
			if not v6.HasCompletedPrimaryTutorial(v8) then
				return
			end
			if _G.FocusedBossZone then
				return
			end
			if v2.GetGameState("TouchNode") then
				return TouchNodeEvent.Active.Value
			end
		end
	})
	v5.AddNotificationCallback("TouchNodeComplete", function(p1) --[[ Line: 205 | Upvalues: Sonar (ref), CurrentEvent (ref), ReplicatedStorage (ref), v7 (ref) ]]
		Sonar("MessagesClient"):AddNotification({
			Type = "TouchNodeCompleted",
			DoNotSkip = true,
			Duration = 3.5,
			Message = p1 * CurrentEvent.CurrencyPerTouchNodeCleared,
			Sound = { ReplicatedStorage.Storage.SFX.QuestComplete2 },
			RunBefore = function(p1) --[[ RunBefore | Line: 215 | Upvalues: v7 (ref) ]]
				p1.IconLabel.Image = v7.CurrencyImage or ""
				p1.EventCurrency.Image = v7.CurrencyImage or ""
				p1.EventCurrency.MessageLabel.TextColor3 = v7.CurrencyStrokeColor
				p1.EventCurrency.MessageLabel.UIStroke.Color = v7.CurrencyStrokeColor
				p1.TextLabel.Text = if v7.TouchNodeMinigameName then (v7.TouchNodeMinigameName .. " Cleared"):upper() else "CLEARED"
				p1.TextLabel.UIGradient.Color = v7.MainUIGradient.Color
				p1.TextLabel.UIStroke.Color = v7.MainStrokeColor
			end
		})
	end)
	TouchNodeEvent.Active:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 228 | Upvalues: TouchNodeEvent (ref), t (ref) ]]
		if TouchNodeEvent.Active.Value then
			t:Start()
		else
			t:End()
		end
	end)
	if not TouchNodeEvent.Active.Value then
		return
	end
	t:Start()
end
t:Init()
return t