-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("TimeUtils")
local v5 = Sonar("StorageUtils")
local v6 = Sonar("AdventCalendarService")
local v7 = Sonar("ViewportUtils")
local v8 = Sonar("Maid")
local v9 = Sonar("FormatNumber")
local v10 = Sonar("MarketplaceUtils")
local v11 = Sonar("ItemDataService")
local v12 = Sonar("spr")
local v13 = Sonar("Confetti")
local v14 = Sonar("Constants")
local v15 = Sonar(v5.Get("AdventCalendar"))
local t2 = { "rbxassetid://15507441617", "rbxassetid://15507441720", "rbxassetid://15507441818", "rbxassetid://15507441933", "rbxassetid://15507442031", "rbxassetid://15507442183", "rbxassetid://15507442307" }
local LocalPlayer = game:GetService("Players").LocalPlayer
local v16 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("AdventCalendarGui"):WaitForChild("ContainerFrame")
local StreakFrame = ContainerFrame.StreakFrame
local v17 = v3.GetRemoteFunction("ClaimAdventCalendarRemote")
local t3 = {}
local function getImageFromNumber(p1) --[[ getImageFromNumber | Line: 53 | Upvalues: t2 (copy) ]]
	return t2[(p1 - 1) % #t2 + 1]
end
local function canClaimReward() --[[ canClaimReward | Line: 59 | Upvalues: v6 (copy), v16 (copy) ]]
	local CurrentSeed = v6.AdventTimer.CurrentSeed
	if not v6.GetRewardFromIndex(CurrentSeed) then
		return
	end
	warn("CAN CLAIM", v6.CanClaimReward(v16, CurrentSeed))
	return v6.CanClaimReward(v16, CurrentSeed) == true
end
local function setTimerLabel() --[[ setTimerLabel | Line: 69 | Upvalues: v6 (copy), v15 (copy), ContainerFrame (copy), v4 (copy) ]]
	local CurrentSeed = v6.AdventTimer.CurrentSeed
	if #v15 < CurrentSeed then
		ContainerFrame.TimerFrame.Visible = false
		return
	end
	if CurrentSeed == #v15 then
		ContainerFrame.TimerFrame.PromptLabel.Text = "Time left to claim:"
	elseif CurrentSeed <= 0 then
		ContainerFrame.TimerFrame.PromptLabel.Text = "Starts in:"
	else
		ContainerFrame.TimerFrame.PromptLabel.Text = "Next reward in:"
	end
	ContainerFrame.TimerFrame.TimeLabel.Text = v4.FormatString(v6.AdventTimer:GetTime())
	ContainerFrame.TimerFrame.Visible = true
end
local function setStreakLabel() --[[ setStreakLabel | Line: 87 | Upvalues: v6 (copy), v16 (copy), StreakFrame (copy), v9 (copy), TweenService (copy) ]]
	local v1 = v6.GetCurrentMultiplier(v16)
	local v2 = v6.GetCurrentStreak(v16)
	StreakFrame.BoostLabel.Text = "x" .. v9.decimalPlace(v1, 2)
	StreakFrame.StreakLabel.Text = v2
	StreakFrame.RestoreButton.Visible = v6.HasStreakBeenMissed(v16)
	if not StreakFrame.BoostLabel:FindFirstChild("UIScale") then
		return
	end
	local UIScale = StreakFrame.BoostLabel:FindFirstChild("UIScale")
	TweenService:Create(UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
		Scale = 1.15
	}):Play()
	task.wait(0.2)
	TweenService:Create(UIScale, TweenInfo.new(0.2), {
		Scale = 1
	}):Play()
end
local function animateEntrance() --[[ animateEntrance | Line: 105 | Upvalues: t3 (copy), TweenService (copy) ]]
	for k, v in pairs(t3) do
		if v.Frame.Parent then
			local FrameScale = v.FrameScale
			FrameScale.Scale = 0
			task.delay((k - 1) * 0.03, function() --[[ Line: 112 | Upvalues: v (copy), TweenService (ref), FrameScale (copy) ]]
				if not v.Frame.Parent then
					return
				end
				TweenService:Create(FrameScale, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					Scale = 1
				}):Play()
			end)
		end
	end
end
local function createRewards() --[[ createRewards | Line: 121 | Upvalues: v1 (copy), ContainerFrame (copy), animateEntrance (copy), v16 (copy), setStreakLabel (copy), v6 (copy), v4 (copy), setTimerLabel (copy), v15 (copy), v8 (copy), v11 (copy), t2 (copy), v7 (copy), v9 (copy), v12 (copy), RunService (copy), TweenService (copy), v2 (copy), v17 (copy), v13 (copy), Sonar (copy), t3 (copy) ]]
	local v14 = v1.getFrameFromInstance(ContainerFrame)
	if v14.Opened then
		animateEntrance()
		return
	end
	v14.Opened = true
	for k, v in pairs(v16.EventData.AdventCalendar:GetChildren()) do
		v:GetPropertyChangedSignal("Value"):Connect(setStreakLabel)
	end
	v6.AdventTimer.SeedChanged:Connect(setStreakLabel)
	setStreakLabel()
	v4.AttachToTime(setTimerLabel)
	setTimerLabel()
	for k, v in pairs(v15) do
		local v22 = v16.EventData.AdventCalendar:FindFirstChild(k)
		local v3 = v8.new()
		local v42 = ContainerFrame.RewardsFrame.Default:Clone()
		local InnerFrame = v42.InnerFrame
		ContainerFrame.RewardsFrame.Default.Visible = false
		local v5 = v11.GetByName(v.Name)
		if v.Horse then
			v5 = v
		end
		InnerFrame.UnclaimedLabel.Image = t2[(k - 1) % #t2 + 1]
		if not v42:FindFirstChild("UIScale") then
			local UIScale = Instance.new("UIScale")
			UIScale.Scale = 0
			UIScale.Parent = v42
		end
		local UIScale = v42:FindFirstChild("UIScale")
		if not UIScale then
			UIScale = Instance.new("UIScale")
			UIScale.Parent = v42
		end
		local function setUnlocked() --[[ setUnlocked | Line: 165 | Upvalues: v3 (copy), v22 (copy), v5 (ref), InnerFrame (copy), v7 (ref), v42 (copy), v9 (ref), v (copy), v12 (ref) ]]
			v3:DoCleaning()
			if not v22.Value then
				InnerFrame.ImageLabel.Visible = false
				InnerFrame.AmountLabel.Visible = false
				InnerFrame.ClaimedLabel.Visible = false
				InnerFrame.UnclaimedLabel.Visible = true
				return
			end
			if v5.Image then
				InnerFrame.ImageLabel.Image = v5.Image
				InnerFrame.ImageLabel.ImageLabel.Image = v5.Image
				InnerFrame.ImageLabel.Visible = true
			elseif v5.Horse then
				InnerFrame.ImageLabel.Image = "rbxassetid://16450048331"
				InnerFrame.ImageLabel.ImageLabel.Image = "rbxassetid://16450048331"
				InnerFrame.ImageLabel.Visible = true
			else
				local v1 = v7.CreateViewport(v42, v5.Model, false, true)
				v1.AdornFrame.Ambient = Color3.fromRGB(255, 255, 255)
				v1.AdornFrame.LightColor = Color3.fromRGB(255, 255, 255)
				v1.AdornFrame.BackgroundColor3 = InnerFrame.BackgroundColor3
				v1.AdornFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
				v1.AdornFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				v3:GiveTask(v1)
				InnerFrame.ImageLabel.Visible = false
			end
			InnerFrame.AmountLabel.Text = "x" .. v9.splice(v.Amount)
			InnerFrame.AmountLabel.Visible = true
			InnerFrame.UnclaimedLabel.Visible = false
			InnerFrame.ClaimedLabel.Visible = true
			if not InnerFrame.ImageLabel.Visible then
				v12.target(InnerFrame.AmountLabel, 0.7, 0.5, {
					TextTransparency = 0
				})
				return
			end
			v12.target(InnerFrame.ImageLabel, 0.7, 0.5, {
				ImageTransparency = 0,
				Size = InnerFrame.ImageLabel.Size
			})
			v12.target(InnerFrame.AmountLabel, 0.7, 0.5, {
				TextTransparency = 0
			})
		end
		if v5 then
			v22:GetPropertyChangedSignal("Value"):Connect(setUnlocked)
			setUnlocked()
		end
		local v62 = false
		local v72 = nil
		local function createPulseEffect() --[[ createPulseEffect | Line: 219 | Upvalues: v72 (ref), v62 (ref), v22 (copy), InnerFrame (copy), RunService (ref), v3 (copy) ]]
			if v72 then
				v72:Disconnect()
				v72 = nil
			end
			if not v62 or v22.Value then
				return
			end
			local Glow = InnerFrame:FindFirstChild("Glow") or InnerFrame:FindFirstChild("UIStroke")
			if not Glow then
				Glow = Instance.new("UIStroke")
				Glow.Name = "Glow"
				Glow.Color = Color3.fromRGB(255, 215, 0)
				Glow.Thickness = 2
				Glow.Transparency = 0.5
				Glow.Parent = InnerFrame
			end
			local v1 = 0
			v72 = RunService.Heartbeat:Connect(function(p1) --[[ Line: 238 | Upvalues: v1 (ref), Glow (ref) ]]
				v1 = v1 + p1 * 2
				local v2 = (math.sin(v1) + 1) / 2
				Glow.Transparency = v2 * 0.4 + 0.3
				Glow.Thickness = v2 * 1.5 + 2
			end)
			v3:GiveTask(v72)
		end
		local function setClaimButton() --[[ setClaimButton | Line: 247 | Upvalues: v62 (ref), k (copy), v6 (ref), v22 (copy), v42 (copy), InnerFrame (copy), createPulseEffect (copy), TweenService (ref), v72 (ref) ]]
			local v1 = v62
			local v2 = if k >= 1 then k <= 4 else false
			local v3 = if v6.AdventTimer.CurrentSeed == k or v2 then not v22.Value else v2
			v62 = v3
			v42.ClaimButton.Visible = v3
			InnerFrame.TodayLabel.Visible = v3
			InnerFrame.DayLabel.Text = if v3 then "TODAY" else "Day " .. k
			if v3 and not v1 then
				createPulseEffect()
				if InnerFrame.TodayLabel:FindFirstChild("UIScale") then
					local UIScale = InnerFrame.TodayLabel:FindFirstChild("UIScale")
					TweenService:Create(UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
						Scale = 1.1
					}):Play()
					task.wait(0.3)
					TweenService:Create(UIScale, TweenInfo.new(0.2), {
						Scale = 1
					}):Play()
				end
			else
				if v3 then
					return
				end
				if v72 then
					v72:Disconnect()
					v72 = nil
				end
				local Glow = InnerFrame:FindFirstChild("Glow")
				if not Glow then
					return
				end
				Glow:Destroy()
			end
		end
		v22:GetPropertyChangedSignal("Value"):Connect(setClaimButton)
		v6.AdventTimer.SeedChanged:Connect(setClaimButton)
		setClaimButton();
		(function() --[[ setupHover | Line: 280 | Upvalues: v42 (copy), v22 (copy), v12 (ref), UIScale (ref), v3 (copy) ]]
			v3:GiveTask((v42.MouseEnter:Connect(function() --[[ Line: 281 | Upvalues: v22 (ref), v12 (ref), UIScale (ref) ]]
				if not v22.Value then
					v12.target(UIScale, 0.6, 2.5, {
						Scale = 1.12
					})
				end
			end)))
			v3:GiveTask((v42.MouseLeave:Connect(function() --[[ Line: 287 | Upvalues: v12 (ref), UIScale (ref) ]]
				v12.target(UIScale, 0.6, 2.5, {
					Scale = 1
				})
			end)))
		end)()
		v2.new(v42.ClaimButton, {
			Click = function() --[[ Click | Line: 296 | Upvalues: v17 (ref), k (copy), v13 (ref), TweenService (ref), UIScale (ref), Sonar (ref), v16 (ref) ]]
				local v1 = v17:InvokeServer(k)
				if not v1 or v1 == true then
					return
				end
				v13.Emit(30, {
					Size = UDim2.new(0, math.random(20, 40), 0, math.random(20, 40))
				})
				TweenService:Create(UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
					Scale = 0.9
				}):Play()
				task.wait(0.2)
				TweenService:Create(UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
					Scale = 1
				}):Play()
				Sonar("DisplayAnimalClient"):DisplaySlot({
					Type = "Claimed",
					AllowNaming = true,
					ShowMaxWarning = true,
					MobileClickBackgroundToClose = true,
					Slot = v16:GetItemFolder("Animals"):WaitForChild(v1)
				})
			end
		})
		v42.Name = k
		v42.LayoutOrder = k
		v42.Visible = true
		v42.Parent = ContainerFrame.RewardsFrame
		t3[k] = {
			Frame = v42,
			FrameScale = UIScale
		}
	end
	animateEntrance()
end
t.CanClaimReward = canClaimReward
function t.OpenFromJoin() --[[ OpenFromJoin | Line: 336 | Upvalues: v14 (copy), v6 (copy), v16 (copy), t (copy), v1 (copy), ContainerFrame (copy) ]]
	if not v14.IsEventWorld then
		return
	end
	if v6:HasUnclaimedReward(v16) ~= true then
		return
	end
	t.Open()
	repeat
		task.wait()
	until not v1.IsFrameOpen(ContainerFrame)
end
function t.Open() --[[ Open | Line: 347 | Upvalues: v1 (copy), ContainerFrame (copy) ]]
	v1.OpenFrame(ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
end
function t.Close() --[[ Close | Line: 354 | Upvalues: v1 (copy), ContainerFrame (copy) ]]
	v1.CloseFrame(ContainerFrame)
	v1.OpenHUD()
end
function t.InitButtons(p1) --[[ InitButtons | Line: 360 | Upvalues: v16 (copy), v6 (copy), RunService (copy) ]]
	local AdventCalendar = p1.RightCornerFrame.AdventCalendar
	local function setClaimLabel() --[[ setClaimLabel | Line: 362 | Upvalues: v16 (ref), v6 (ref), AdventCalendar (copy) ]]
		local v1 = v16.EventData.AdventCalendar:FindFirstChild(v6.AdventTimer.CurrentSeed)
		if not v1 then
			AdventCalendar.ClaimLabel.Visible = false
			return
		end
		local v2 = if v1.Value then 0 else 1
		AdventCalendar.ClaimLabel.TextLabel.Text = v2
		AdventCalendar.ClaimLabel.Visible = v2 > 0
	end
	for k, v in pairs(v16.EventData.AdventCalendar:GetChildren()) do
		v:GetPropertyChangedSignal("Value"):Connect(setClaimLabel)
	end
	v6.AdventTimer.SeedChanged:Connect(setClaimLabel)
	RunService.Heartbeat:Connect(function() --[[ Line: 377 | Upvalues: p1 (copy), AdventCalendar (copy) ]]
		if not p1.Visible then
			return
		end
		if AdventCalendar.RaysLabel.Rotation >= 360 then
			AdventCalendar.RaysLabel.Rotation = 0
		end
		local RaysLabel = AdventCalendar.RaysLabel
		RaysLabel.Rotation = RaysLabel.Rotation + 0.25
		if not AdventCalendar.ClaimLabel.Visible then
			return
		end
		local UIScale = AdventCalendar.ClaimLabel:FindFirstChild("UIScale")
		if not UIScale then
			local UIScale_2 = Instance.new("UIScale")
			UIScale_2.Parent = AdventCalendar.ClaimLabel
			UIScale = UIScale_2
		end
		UIScale.Scale = (math.sin(tick() * 3) + 1) / 2 * 0.15 + 1
	end)
	local v1 = v16.EventData.AdventCalendar:FindFirstChild(v6.AdventTimer.CurrentSeed)
	if not v1 then
		AdventCalendar.ClaimLabel.Visible = false
		return
	end
	local v2 = if v1.Value then 0 else 1
	AdventCalendar.ClaimLabel.TextLabel.Text = v2
	AdventCalendar.ClaimLabel.Visible = v2 > 0
end
function t.Init(p1) --[[ Init | Line: 406 | Upvalues: v1 (copy), ContainerFrame (copy), createRewards (copy), t (copy), v2 (copy), StreakFrame (copy), v10 (copy), LocalPlayer (copy) ]]
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v1.AddStateCallback(ContainerFrame, "OnOpen", createRewards)
	v1.AddStateCallback(ContainerFrame, "OnClose", t.Close)
	v2.new(ContainerFrame.CloseButton, {
		Click = t.Close
	})
	v2.new(StreakFrame.RestoreButton, {
		Click = function() --[[ Click | Line: 424 | Upvalues: v10 (ref), LocalPlayer (ref) ]]
			v10.PromptPurchase(LocalPlayer, 2661630285, "Product")
		end
	})
end
t:Init()
return t