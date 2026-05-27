-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CurrentCamera = workspace.CurrentCamera
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("TransitionClient")
local v3 = Sonar("InputTypeDetector")
local v4 = Sonar("GuiUtils")
local v5 = Sonar("ContextualUtils")
local v6 = Sonar("Button")
local v7 = Sonar("PositionUtils")
local v8 = Sonar("GuiManager")
local v9 = Sonar("TrackObjectiveClient")
local v10 = Sonar("AnimalDataService")
local v11 = Sonar("TutorialService")
local v12 = Sonar("Animal")
local v13 = Sonar("ButtonTest")
local v14 = Sonar("DisplayAnimalClient")
local v15 = Sonar("spr")
local v16 = Sonar("Constants")
local t2 = {
	In = {
		TextLabel = {
			TextTransparency = 0,
			TextStrokeTransparency = 0
		},
		ImageButton = {
			BackgroundTransparency = 1,
			ImageTransparency = 0
		},
		ImageLabel = {
			BackgroundTransparency = 1,
			ImageTransparency = 0
		},
		UIStroke = {
			Transparency = 0
		}
	},
	Out = {
		TextLabel = {
			TextTransparency = 1,
			TextStrokeTransparency = 1
		},
		ImageButton = {
			BackgroundTransparency = 1,
			ImageTransparency = 1
		},
		ImageLabel = {
			BackgroundTransparency = 1,
			ImageTransparency = 1
		},
		UIStroke = {
			Transparency = 1
		}
	}
}
local t3 = {
	Primary = {
		Active = v11.IsTutorialWorld(),
		Modules = { "HorseSelection", "TameHorse", "BreedingHorse", "TutorialMissions", "ForageFeeding" }
	},
	Contextual = {
		Active = true,
		Modules = { "ObstacleJump" }
	}
}
local t4 = {
	PlayerInteract = false,
	OtherHorseInteract = false,
	ItemStream = false,
	TopBar = true,
	TopBarAction = false,
	TopFrame = false,
	SideFrame = false,
	RaceQueuePrompt = false,
	BottomFrame = false,
	PlayerLeaderboard = false,
	Currency = false,
	Inventory = false,
	Stables = false,
	Journal = false,
	PremiumShop = false,
	ActionMenu = false,
	EventJournal = false,
	ResetButtonCallback = false,
	PredictFoalAction = false,
	MutationNotifications = false,
	UpgradeStablesAction = false,
	EquipAction = false,
	UnequipAction = false,
	EditAction = false,
	SellAction = false,
	SellHorsesAction = false,
	DismountAction = false,
	UnequipHotbarAction = false,
	UnequipInventoryAction = false,
	EquipInventoryAction = false,
	DeleteItemAction = false,
	SkillsTab = false,
	BreedingTab = false,
	MainTab = true,
	MutationsTab = false,
	SpawnHorses = false,
	InteractZones = false,
	RenderGlobalMobs = false,
	OpenHUDOnBreed = false,
	ResourceHarvesting = false,
	PinnedMissions = false,
	JumpObstacles = false,
	HarvestingRange = false,
	HarvestingHitboxScale = false,
	CancelHarvestOnMovement = false,
	JournalTabs = false
}
local v17 = table.clone(v16.DefaultToGameStates)
local t5 = {
	Default = {
		Complete = "rbxassetid://115657414041732",
		New = "rbxassetid://133559504983976",
		Waiting = "rbxassetid://130619536468412"
	},
	ABTest = {
		Complete = "rbxassetid://115657414041732",
		New = "rbxassetid://133559504983976",
		Waiting = "rbxassetid://130619536468412"
	}
}
local Default = t5.Default
local LocalPlayer = game:GetService("Players").LocalPlayer
local v18 = Sonar("PlayerWrapper").GetClient()
local TutorialGui = LocalPlayer.PlayerGui:WaitForChild("TutorialGui")
local TalkFrame = TutorialGui.TalkFrame
local TalkButton = TalkFrame.TalkButton
local SpeechBubble = TalkButton.SpeechBubble
local SpeechDisplayFrame = TalkFrame.SpeechDisplayFrame
local SpeechFrame = SpeechDisplayFrame.SpeechFrame
local SpeechBackgroundFrame = SpeechDisplayFrame.SpeechBackgroundFrame
local ProgressFrame = TutorialGui.ProgressGui.ProgressFrame
local t6 = {}
local v19 = false
local v20 = false
local v21 = nil
local v22 = false
local v23 = false
local Tutorial = ReplicatedStorage.Storage.Assets.Tutorial
local v24 = 0
local v25 = nil
local function updateTuorialRewardClaim() --[[ updateTuorialRewardClaim | Line: 209 | Upvalues: v24 (ref), ProgressFrame (copy), v11 (copy), v18 (copy), v1 (copy), v14 (copy) ]]
	if v24 >= 14 then
		ProgressFrame.Menu.Content.ProgressBar.CompletedLabel.Visible = true
		ProgressFrame.Menu.Content.ProgressBar.CompletedTitle.Visible = true
		ProgressFrame.Menu.Reward.ClaimButton.Visible = true
		ProgressFrame.Menu.Reward.CompletedLabel.Visible = true
		ProgressFrame.Menu.Reward.FillColor.Visible = false
		ProgressFrame.Menu.Content.ProgressBar.FillColor.Visible = false
		ProgressFrame.Menu.Content.ProgressBar.Title.Visible = false
		if v11.CanClaimTutorialReward(v18) then
			task.spawn(function() --[[ Line: 224 | Upvalues: v1 (ref), v14 (ref), v18 (ref) ]]
				local v12 = v1.GetRemoteFunction("ClaimTutorialRewardRemote"):InvokeServer()
				if type(v12) ~= "string" then
					return
				end
				v14:DisplaySlot({
					Type = "Claimed",
					AllowNaming = true,
					ShowMaxWarning = false,
					MobileClickBackgroundToClose = true,
					ShowTameContestPoints = false,
					FullViewportSize = true,
					HideTopFrame = true,
					DismissDelay = 1.5,
					Slot = v18:GetItemFolder("Animals"):WaitForChild(v12)
				})
			end)
		end
	else
		ProgressFrame.Menu.Content.ProgressBar.CompletedLabel.Visible = false
		ProgressFrame.Menu.Content.ProgressBar.CompletedTitle.Visible = false
		ProgressFrame.Menu.Reward.ClaimButton.Visible = false
		ProgressFrame.Menu.Reward.CompletedLabel.Visible = false
		ProgressFrame.Menu.Reward.FillColor.Visible = true
		ProgressFrame.Menu.Content.ProgressBar.FillColor.Visible = true
		ProgressFrame.Menu.Content.ProgressBar.Title.Visible = true
	end
end
local function updateTutorialProgressBar() --[[ updateTutorialProgressBar | Line: 253 | Upvalues: v24 (ref), ProgressFrame (copy), v18 (copy), v11 (copy), updateTuorialRewardClaim (copy) ]]
	local v1 = v24 or 0
	ProgressFrame.Menu.Content.ProgressBar.FillColor.Size = UDim2.fromScale(v1 / 14, 1)
	ProgressFrame.Menu.Content.ProgressBar.TextLabel.Text = math.ceil(v1 / 14 * 100) .. "%"
	ProgressFrame.Visible = true
	if v18:GetABTestState("TutorialBar", "1") == "1" then
		if v11.GetTutorialReward(v18) then
			ProgressFrame.Menu.Visible = v11.CanClaimTutorialReward(v18)
		else
			ProgressFrame.Menu.Visible = _G.InTutorial
		end
	else
		ProgressFrame.Menu.Visible = false
	end
	updateTuorialRewardClaim()
end
local function updateTutorialReward() --[[ updateTutorialReward | Line: 273 | Upvalues: v11 (copy), v18 (copy), ProgressFrame (copy), updateTuorialRewardClaim (copy) ]]
	local v1 = v11.GetTutorialReward(v18)
	if v1 then
		ProgressFrame.Menu.Reward.Title.Text = v1.Title
		ProgressFrame.Menu.Reward.ImageLabel.Image = v1.Image or ProgressFrame.Menu.Reward.ImageLabel.Image
		ProgressFrame.Menu.Reward.Visible = true
	else
		ProgressFrame.Menu.Reward.Visible = false
	end
	updateTuorialRewardClaim()
end
local function updateSpeechBubble() --[[ updateSpeechBubble | Line: 288 | Upvalues: SpeechBubble (copy), v23 (ref) ]]
	SpeechBubble.Visible = v23
end
local function setHasNewSpeech(p1) --[[ setHasNewSpeech | Line: 295 | Upvalues: v23 (ref), SpeechBubble (copy) ]]
	v23 = p1
	SpeechBubble.Visible = p1
end
local function getDefaultFramePosition(p1) --[[ getDefaultFramePosition | Line: 301 | Upvalues: v4 (copy), v11 (copy), v3 (copy), ProgressFrame (copy) ]]
	if v4.IsChatOpen() and v11.GetGameState("PinnedMissions") then
		local v1
		if v3.IsMobileInputType() then
			local v2 = UDim2.new
			local v6 = if ProgressFrame.Menu.Visible then 20 else 0
			v1 = v2(0.55, 0, 0.02, v6) or UDim2.new(0.01, 5, 0.955, 0)
		else
			v1 = UDim2.new(0.01, 5, 0.955, 0)
		end
		return v1
	else
		local v7
		if v3.IsMobileInputType() then
			local v8 = UDim2.new
			local v12 = if ProgressFrame.Menu.Visible then 20 else 0
			v7 = v8(0.55, 0, 0.02, v12) or UDim2.new(0.01, 5, 0.65, 0)
		else
			v7 = UDim2.new(0.01, 5, 0.65, 0)
		end
		return v7
	end
end
local function getDefaultAnchorPoint(p1) --[[ getDefaultAnchorPoint | Line: 312 | Upvalues: v4 (copy), v11 (copy), v3 (copy) ]]
	if v4.IsChatOpen() and v11.GetGameState("PinnedMissions") then
		return v3.IsMobileInputType() and Vector2.new(0.5, 0) or Vector2.new(0, 1)
	else
		return v3.IsMobileInputType() and Vector2.new(0.5, 0) or Vector2.new(0, 0.5)
	end
end
local function startPrimaryTutorial(p1, p2) --[[ startPrimaryTutorial | Line: 324 | Upvalues: Tutorial (copy), v25 (ref), v18 (copy), t (copy), v2 (copy) ]]
	if not Tutorial:FindFirstChild("TutorialBounds") or (v25 or v18.PlayerData.Missions.SpeciesUnlocks.Horse.Missions[1].Value) then
		_G.InTutorial = true
		t.StartSequence(p1, {
			AfterInit = function() --[[ AfterInit | Line: 340 | Upvalues: p2 (copy), v2 (ref) ]]
				if p2 then
					p2()
				end
				if not v2.Transitioning then
					return
				end
				v2.QuickEnd()
			end
		})
		return
	end
	v25 = Tutorial.TutorialBounds:Clone()
	v25.Parent = workspace
	_G.InTutorial = true
	t.StartSequence(p1, {
		AfterInit = function() --[[ AfterInit | Line: 340 | Upvalues: p2 (copy), v2 (ref) ]]
			if p2 then
				p2()
			end
			if not v2.Transitioning then
				return
			end
			v2.QuickEnd()
		end
	})
end
local function startContextualTutorial(p1, p2) --[[ startContextualTutorial | Line: 353 | Upvalues: v11 (copy), v18 (copy), t (copy), v9 (copy) ]]
	if _G.InTutorial then
		return
	end
	if not v11.HasCompletedPrimaryTutorial(v18) then
		return
	end
	if t.IsOpen() then
		return
	end
	if not _G.CurrentContextualTutorial then
		_G.CurrentContextualTutorial = p1
		print("Contextual Tutorial - Starting stage", p1)
		v9:StopTracking()
		t.StartSequence(p1, p2)
		_G.CurrentContextualTutorial = false
	end
end
local function tweenSpeechLabel(p1, p2, p3) --[[ tweenSpeechLabel | Line: 371 | Upvalues: t2 (copy), TweenService (copy) ]]
	local v1 = nil
	local v2 = p2 and t2.In or t2.Out
	for k, v in pairs((p1:GetDescendants())) do
		if v2[v.ClassName] then
			if p3 then
				for k2, v4 in pairs(v2[v.ClassName]) do
					v[k2] = v4
				end
				continue
			end
			local v4 = TweenService:Create(v, TweenInfo.new(0.5), v2[v.ClassName])
			v4:Play()
			v1 = v4
		end
	end
	return v1
end
local function shakeTalkButton() --[[ shakeTalkButton | Line: 392 | Upvalues: v22 (ref), TweenService (copy), TalkButton (copy) ]]
	if not v22 then
		v22 = true
		local v1 = TweenService:Create(TalkButton, TweenInfo.new(0.15), {
			Rotation = 10
		})
		v1:Play()
		v1.Completed:Wait()
		local v2 = TweenService:Create(TalkButton, TweenInfo.new(0.15), {
			Rotation = -10
		})
		v2:Play()
		v2.Completed:Wait()
		local v3 = TweenService:Create(TalkButton, TweenInfo.new(0.15), {
			Rotation = 0
		})
		v3:Play()
		v3.Completed:Wait()
		v22 = false
	end
end
function t.TweenInDialogue() --[[ TweenInDialogue | Line: 410 | Upvalues: SpeechFrame (copy), TalkButton (copy), SpeechBubble (copy), SpeechBackgroundFrame (copy), TalkFrame (copy), TweenService (copy) ]]
	SpeechFrame.Visible = false
	TalkButton.UIScale.Scale = 0
	TalkButton.ImageTransparency = 0
	SpeechBubble.ImageTransparency = 0
	SpeechBubble.ImageLabel.ImageTransparency = 0
	TalkButton.Visible = true
	SpeechBackgroundFrame.Transparency = 1
	TalkFrame.Visible = true
	TweenService:Create(TalkButton.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Bounce), {
		Scale = 1
	}):Play()
	wait(0.25)
	TweenService:Create(SpeechBackgroundFrame, TweenInfo.new(0.5), {
		Transparency = 0
	}):Play()
	wait(0.25)
end
function t.TweenOutDialogue() --[[ TweenOutDialogue | Line: 433 | Upvalues: v19 (ref), t (copy), TweenService (copy), SpeechBackgroundFrame (copy), TalkButton (copy), SpeechBubble (copy), v20 (ref) ]]
	v19 = true
	t.TweenOutText().Completed:Wait()
	task.wait(0.2)
	TweenService:Create(SpeechBackgroundFrame, TweenInfo.new(0.35), {
		Transparency = 1
	}):Play()
	wait(0.2)
	local v1 = TweenService:Create(TalkButton, TweenInfo.new(0.35), {
		ImageTransparency = 1
	})
	TweenService:Create(SpeechBubble, TweenInfo.new(0.35), {
		ImageTransparency = 1
	}):Play()
	TweenService:Create(SpeechBubble.ImageLabel, TweenInfo.new(0.35), {
		ImageTransparency = 1
	}):Play()
	v1:Play()
	v1.Completed:Wait()
	TalkButton.Visible = false
	v20 = false
	v19 = false
end
function t.TweenInText(p1, p2) --[[ TweenInText | Line: 455 | Upvalues: v18 (copy), v19 (ref), TalkButton (copy), Default (ref), v20 (ref), t (copy), SpeechFrame (copy), TweenService (copy), SpeechDisplayFrame (copy), shakeTalkButton (copy), v23 (ref), SpeechBubble (copy), tweenSpeechLabel (copy) ]]
	if v18._pressedTutorialSkip then
		return
	end
	v19 = true
	TalkButton.Image = p2 and Default.Complete or Default.New
	if not v20 then
		t.TweenInDialogue()
	end
	v20 = true
	local TextLabel = SpeechFrame.TextLabel
	TweenService:Create(TextLabel, TweenInfo.new(0), {
		MaxVisibleGraphemes = 0
	}):Play()
	TextLabel.Text = p1
	TextLabel.Position = UDim2.new(TextLabel.Position.X.Scale, 0, 0.5, 0)
	SpeechDisplayFrame.Visible = true
	task.spawn(shakeTalkButton)
	if not SpeechDisplayFrame.Visible then
		v23 = true
		SpeechBubble.Visible = v23
	end
	SpeechFrame.Visible = true
	task.wait(0.1)
	script.PopupSound:Play()
	local v4 = TweenService:Create(TextLabel, TweenInfo.new(#TextLabel.ContentText / 30, Enum.EasingStyle.Linear), {
		MaxVisibleGraphemes = #TextLabel.ContentText
	})
	v4:Play()
	tweenSpeechLabel(SpeechFrame, true)
	v4.Completed:Wait()
	task.wait(0.2)
	TalkButton.Image = p2 and Default.Complete or Default.Waiting
	v19 = false
end
function t.TweenOutText(p1) --[[ TweenOutText | Line: 502 | Upvalues: TweenService (copy), SpeechFrame (copy), tweenSpeechLabel (copy) ]]
	TweenService:Create(SpeechFrame.TextLabel, TweenInfo.new(0.5), {
		Position = UDim2.new(SpeechFrame.TextLabel.Position.X.Scale, 0, 0.55, 0)
	}):Play()
	task.wait(0.2)
	return tweenSpeechLabel(SpeechFrame, false)
end
function t.IsTweeningIn() --[[ IsTweeningIn | Line: 514 | Upvalues: v19 (ref) ]]
	return v19
end
function t.IsOpen() --[[ IsOpen | Line: 519 | Upvalues: v20 (ref) ]]
	return v20
end
function t.YieldForClientLoaded() --[[ YieldForClientLoaded | Line: 524 | Upvalues: RunService (copy), v16 (copy) ]]
	repeat
		RunService.Heartbeat:Wait()
	until v16.ClientLoaded
end
function t.YieldForTweenCompleted() --[[ YieldForTweenCompleted | Line: 531 | Upvalues: RunService (copy), t (copy), v18 (copy) ]]
	repeat
		RunService.Heartbeat:Wait()
	until not t.IsTweeningIn() or v18._pressedTutorialSkip
end
function t.StartSequence(p1, ...) --[[ StartSequence | Line: 538 | Upvalues: t6 (copy), v5 (copy) ]]
	local v1 = t6[p1]
	if not v1 then
		return
	end
	if v1.StartCalled then
		return
	end
	v1.StartCalled = true
	if v1.Preload then
		v1.Preload()
	end
	v5.PreloadAssets()
	v1.Start(...)
	v1.StartCalled = false
end
function t.HasCompletedContextual(p1) --[[ HasCompletedContextual | Line: 555 | Upvalues: t6 (copy) ]]
	local v1 = t6[p1]
	if v1 then
		return v1.IsCompleted()
	end
end
function t.YieldForCurrentHorse(p1) --[[ YieldForCurrentHorse | Line: 563 | Upvalues: RunService (copy), v18 (copy) ]]
	repeat
		RunService.Heartbeat:Wait()
		if not p1 and v18.CurrentHorse then
			break
		end
		if p1 and v18.CurrentHorse == p1 then
			break
		end
	until v18._pressedTutorialSkip
end
function t.YieldForHorse(p1) --[[ YieldForHorse | Line: 573 | Upvalues: RunService (copy), v12 (copy), v10 (copy), v18 (copy) ]]
	local v2, v3 = if p1 then p1 else {}, nil
	repeat
		RunService.Heartbeat:Wait()
		for k, v in pairs(v12.GetAll()) do
			if v.PrimaryPart and (not v2.SlotId or v.SlotValue.Name == v2.SlotId) and (not v2.ExcludeAge or v10.GetAge(v.SlotValue) ~= v2.ExcludeAge) then
				v3 = v
			end
		end
	until v3 or v18._pressedTutorialSkip
	return v3
end
function t.YieldForHorseAndMount(p1) --[[ YieldForHorseAndMount | Line: 594 | Upvalues: t (copy) ]]
	t.YieldForHorse({
		ExcludeAge = "Baby"
	}):_sit()
	if (if p1 then p1 else {}).MoveToStart then
		t.TeleportToStart()
	end
	t.ZoomOutCameraOnHorse()
end
function t.ZoomOutCameraOnHorse() --[[ ZoomOutCameraOnHorse | Line: 609 | Upvalues: v18 (copy) ]]
	local activeCameraController = v18.PlayerCameras.activeCameraController
	activeCameraController.currentSubjectDistance = activeCameraController.currentSubjectDistance + 25
	v18.PlayerCameras.activeCameraController:UpdateForDistancePropertyChange()
end
function t.TeleportToStart() --[[ TeleportToStart | Line: 617 | Upvalues: Tutorial (copy), v7 (copy), t (copy), v15 (copy), v18 (copy), RunService (copy), CurrentCamera (copy) ]]
	local PrimaryPart = Tutorial.PlayerStartSpawn.PrimaryPart
	local HorseSpawn = Tutorial.HorseSpawn
	local v1 = v7.getRandomXAndZPosition(PrimaryPart.CFrame, PrimaryPart.Size)
	local v2 = t.YieldForHorse()
	local v3 = v2.Model:GetExtentsSize() * 0.5
	local v4 = CFrame.lookAt(v1, HorseSpawn.Position) + Vector3.new(0, 1, 0) * v3.Y
	v2:StopMovement()
	v15.stop(v2.BodyGyro)
	v15.stop(v2.BodyVelocity)
	v18.Character:PivotTo(v4)
	v2.BodyGyro.CFrame = CFrame.lookAt(v1, HorseSpawn.Position)
	task.delay(1, RunService.UnbindFromRenderStep, RunService, "tutorialCamera")
	task.spawn(RunService.BindToRenderStep, RunService, "tutorialCamera", 1, function() --[[ Line: 641 | Upvalues: v18 (ref), CurrentCamera (ref), HorseSpawn (copy) ]]
		CurrentCamera.CFrame = CFrame.lookAt(v18.Character:GetPivot().Position + Vector3.new(0, 8, 0), HorseSpawn.Position)
	end)
end
function t.YieldForEquippedTool(p1) --[[ YieldForEquippedTool | Line: 650 | Upvalues: RunService (copy), v18 (copy) ]]
	repeat
		RunService.Heartbeat:Wait()
	until v18.EquippedTool and string.find(v18.EquippedTool.ToolData.Name, "Lasso")
	return v18.EquippedTool
end
function t.YieldForConditionThenPost(p1, p2) --[[ YieldForConditionThenPost | Line: 656 | Upvalues: RunService (copy), v11 (copy) ]]
	repeat
		RunService.Heartbeat:Wait()
	until p2()
	v11.PostTutorialStage(p1)
end
function t.SetProgressStep(p1, p2) --[[ SetProgressStep | Line: 663 | Upvalues: v24 (ref), updateTutorialProgressBar (copy) ]]
	if v24 <= 0 and p2 then
		v24 = p2
	end
	v24 = if p1 == "Increment" then v24 + 1 or p1 else p1
	updateTutorialProgressBar()
end
function t.SetTalkFramePosition(p1, p2) --[[ SetTalkFramePosition | Line: 672 | Upvalues: v21 (ref) ]]
	v21 = p1
	CurrentAnchorPoint = p2
end
function t.SetProgressBarVisible(p1) --[[ SetProgressBarVisible | Line: 677 | Upvalues: ProgressFrame (copy) ]]
	ProgressFrame.Visible = p1
end
function t.InitHUDandControls(p1) --[[ InitHUDandControls | Line: 682 | Upvalues: v11 (copy), t4 (copy), v4 (copy), v8 (copy) ]]
	local v1 = if p1 then p1 else {}
	if not v11.GetGameState("ClosedChatForTutorial") then
		v1.ClosedChatForTutorial = true
	end
	local v2 = v1
	local v3 = table.clone(t4)
	for v42, v5 in v2 do
		v3[v42] = v5
	end
	if v2.ClosedChatForTutorial then
		task.spawn(v4.SetChatVisibility, false)
	end
	v11.SetGameElements(v3)
	v4.SetCoreGui(Enum.CoreGuiType.Chat, true)
	v8.OpenHUD()
end
function t.ResetHUDandControls(p1) --[[ ResetHUDandControls | Line: 704 | Upvalues: t4 (copy), v17 (copy), v11 (copy), v8 (copy) ]]
	local v1 = table.clone(t4)
	for v2, v3 in v1 do
		v1[v2] = true
	end
	for v4, v5 in v17 do
		v1[v4] = v5
	end
	v11.SetGameElements(v1)
	v8.OpenHUD()
end
function t.StartFromJoin(p1) --[[ StartFromJoin | Line: 717 | Upvalues: v18 (copy), LocalPlayer (copy), t (copy), v11 (copy), startPrimaryTutorial (copy) ]]
	if typeof(p1) ~= "function" then
		p1 = nil
	end
	if v18.PlayerCohorts.NewTutorial:get() then
		return
	end
	if LocalPlayer:GetAttribute("ClientInitiated") ~= true then
		LocalPlayer:GetAttributeChangedSignal("ClientInitiated"):Wait()
	end
	if not t.CanDoPrimaryTutorial() then
		t.ResetHUDandControls()
		return
	end
	local v1 = v11.GetPrimaryStage(v18)
	if v1 then
		task.spawn(startPrimaryTutorial, v1, p1)
		return "Skip"
	end
end
function t.StartContextualTutorial(p1, p2) --[[ StartContextualTutorial | Line: 744 | Upvalues: startContextualTutorial (copy) ]]
	task.spawn(startContextualTutorial, p1, p2)
end
function t.CanDoPrimaryTutorial() --[[ CanDoPrimaryTutorial | Line: 749 | Upvalues: v11 (copy), v18 (copy) ]]
	if v11.HasCompletedPrimaryTutorial(v18) then
		return
	end
	if v11.IsTutorialWorld() then
		return true
	end
end
function t.EndPrimaryTutorial(p1) --[[ EndPrimaryTutorial | Line: 757 | Upvalues: v1 (copy), v25 (ref), v5 (copy), t (copy), v4 (copy), v3 (copy), Tutorial (copy), v8 (copy), ProgressFrame (copy), updateTutorialProgressBar (copy) ]]
	v1.GetRemoteFunction("SetTutorialStageRemote"):InvokeServer("Complete")
	if v25 and v25.Parent then
		v25:Destroy()
		v25 = nil
	end
	_G.InTutorial = false
	v5.SetGuiWorldspacePointTo()
	t.ResetHUDandControls()
	task.spawn(v4.SetChatVisibility, not v3.IsMobileInputType())
	Tutorial.Highlight.Enabled = false
	Tutorial.Highlight.Adornee = nil
	v8.AddFrame(ProgressFrame, {
		HUD = true,
		TweenAnimation = true,
		OpenPosition = ProgressFrame.Position,
		ClosePosition = ProgressFrame.Position + UDim2.new(0, 0, -0.2, 0),
		TweenStyle = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		CheckVisibility = function() --[[ CheckVisibility | Line: 781 | Upvalues: v4 (ref) ]]
			if not _G.InTutorial then
				return
			end
			if not v4.GetGameState("TopFrame") then
				return
			end
			return v4.CanShowHUD("TopHUD") and not _G.FocusedBossZone
		end
	})
	if v8.IsHUDOpen() then
		v8.OpenFrame(ProgressFrame)
	else
		v8.CloseFrame(ProgressFrame)
	end
	if p1 then
		v8.CloseFrame(ProgressFrame)
	end
	updateTutorialProgressBar()
end
function t.EndContextualTutorial(p1) --[[ EndContextualTutorial | Line: 801 | Upvalues: v1 (copy) ]]
	v1.GetRemoteFunction("SetContextualTutorialRemote"):FireServer(p1)
	_G.CurrentContextualTutorial = nil
end
function t.Init(p1) --[[ Init | Line: 806 | Upvalues: v11 (copy), t (copy), v4 (copy), Default (ref), v18 (copy), t5 (copy), updateTutorialProgressBar (copy), updateTutorialReward (copy), TalkFrame (copy), SpeechFrame (copy), SpeechDisplayFrame (copy), TalkButton (copy), SpeechBackgroundFrame (copy), ProgressFrame (copy), SpeechBubble (copy), v23 (ref), v6 (copy), shakeTalkButton (copy), RunService (copy), v21 (ref), getDefaultFramePosition (copy), getDefaultAnchorPoint (copy), v13 (copy), v1 (copy), v14 (copy), t3 (copy), Sonar (copy), t6 (copy) ]]
	for k, v in pairs({ "TweenOutDialogue", "TweenInText", "TweenOutText", "YieldForNext" }) do
		v11[v] = t[v]
	end
	t.SetGuiElements = v4.SetGuiElements
	local function setDialogImages() --[[ setDialogImages | Line: 812 | Upvalues: Default (ref), v18 (ref), t5 (ref) ]]
		Default = v18:GetABTestState("TutorialNPC", "1") == "1" and t5.ABTest or t5.Default
	end
	v18:GetABTestStateChangedSignal("TutorialNPC"):Connect(setDialogImages)
	Default = v18:GetABTestState("TutorialNPC", "1") == "1" and t5.ABTest or t5.Default
	v18.PlayerData.Tutorial.ClaimedReward:GetPropertyChangedSignal("Value"):Connect(updateTutorialProgressBar)
	v18:GetABTestStateChangedSignal("TutorialBar"):Connect(updateTutorialProgressBar)
	for v2, v3 in { "TutorialBar", "TutorialReward" } do
		v18:GetABTestStateChangedSignal(v3):Connect(updateTutorialReward)
	end
	updateTutorialReward()
	TalkFrame.Visible = false
	SpeechFrame.Visible = false
	SpeechDisplayFrame.Visible = true
	TalkButton.UIScale.Scale = 0
	TalkButton.ImageTransparency = 0
	SpeechBackgroundFrame.Transparency = 1
	ProgressFrame.Visible = false
	SpeechBubble.Visible = v23
	v6.new(TalkButton, {
		Click = function() --[[ Click | Line: 839 | Upvalues: SpeechDisplayFrame (ref), v23 (ref), SpeechBubble (ref), shakeTalkButton (ref) ]]
			SpeechDisplayFrame.Visible = not SpeechDisplayFrame.Visible
			if not SpeechDisplayFrame.Visible then
				return
			end
			v23 = false
			SpeechBubble.Visible = v23
			task.spawn(shakeTalkButton)
		end
	})
	RunService.Heartbeat:Connect(function() --[[ Line: 848 | Upvalues: TalkFrame (ref), v21 (ref), getDefaultFramePosition (ref), getDefaultAnchorPoint (ref) ]]
		TalkFrame.Position = v21 or getDefaultFramePosition()
		TalkFrame.AnchorPoint = CurrentAnchorPoint or getDefaultAnchorPoint()
	end)
	v13.new(ProgressFrame.Menu.Reward.ClaimButton, {
		Click = function() --[[ Click | Line: 854 | Upvalues: v1 (ref), v14 (ref), v18 (ref) ]]
			local v12 = v1.GetRemoteFunction("ClaimTutorialRewardRemote"):InvokeServer()
			if type(v12) ~= "string" then
				return
			end
			v14:DisplaySlot({
				Type = "Claimed",
				AllowNaming = true,
				ShowMaxWarning = false,
				MobileClickBackgroundToClose = true,
				ShowTameContestPoints = false,
				FullViewportSize = true,
				HideTopFrame = true,
				DismissDelay = 1.5,
				Slot = v18:GetItemFolder("Animals"):WaitForChild(v12)
			})
		end
	})
	for k, v in pairs(t3) do
		if v.Active then
			v.Sequences = {}
			for k2, v2 in pairs(v.Modules) do
				local v42 = Sonar(v2)
				v42.SetTutorialStageRemote = v1.GetRemoteFunction("SetTutorialStageRemote")
				v42.PostStageRemote = v1.GetRemoteEvent("PostTutorialStageRemote")
				v42.SetContextualStageRemote = v1.GetRemoteFunction("SetContextualTutorialRemote")
				for k3, v3 in pairs(t) do
					v42[k3] = v3
				end
				v.Sequences[v2] = v42
				t6[v2] = v42
			end
		end
	end
	for v5, v62 in t3.Contextual.Sequences do
		if not v11.HasCompletedContextualTutorial(v18, v5) and v62.Setup then
			v62:Setup()
		end
	end
end
t:Init()
return t