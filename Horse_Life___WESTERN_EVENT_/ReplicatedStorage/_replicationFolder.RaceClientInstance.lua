-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
local Sonar = require((ReplicatedStorage:WaitForChild("Sonar")))
local v1 = Sonar("GuiEffectsService")
local v2 = Sonar("TeleportService")
local v3 = Sonar("ItemDataService")
local v4 = Sonar("SprintService")
local v5 = Sonar("MusicService")
local v6 = Sonar("FoVService")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("Resource")
local v9 = Sonar("Confetti")
local v10 = Sonar("Animal")
local v11 = Sonar("Octree")
local v12 = Sonar("spr")
local v13 = Sonar("Maid")
local v14 = Sonar("NotificationsClient")
local v15 = Sonar("SellingAnimalClient")
local v16 = Sonar("DisplayAnimalClient")
local v17 = Sonar("DisplayItemClient")
local v18 = Sonar("TransitionClient")
local v19 = Sonar("BuildClient")
local v20 = Sonar("ItemGridButton")
local v21 = Sonar("UINavigator")
local v22 = Sonar("GuiManager")
local v23 = Sonar("ButtonTest")
local v24 = Sonar("FormatNumber")
local v25 = Sonar("PlayerUtils")
local v26 = Sonar("RemoteUtils")
local v27 = Sonar("EventUtils")
local v28 = Sonar("TimeUtils")
local v29 = Sonar("GuiUtils")
local v30 = Sonar("Table")
local v31 = Sonar("RacePowerupClient")
local v32 = Sonar("RaceCheckpoints")
local v33 = Sonar("RaceConfigs")
local v34 = Sonar("Constants")
RunService:IsStudio()
local LocalPlayer = Players.LocalPlayer
local v35 = v7.GetClient()
local RaceStateEnums = v33.RaceStateEnums
local v36 = v26.GetRemoteFunction("NewRaceRemoteFunction")
local v37 = v26.GetRemoteEvent("NewPlayerLoaded")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RacesGui = PlayerGui:WaitForChild("RacesGui")
local HUDGui = PlayerGui:WaitForChild("HUDGui")
local RaceFrame = RacesGui:WaitForChild("RaceFrame")
local RewardFrame = RacesGui:WaitForChild("RewardFrame")
local Countdown = RaceFrame:WaitForChild("Countdown")
local FinishFrame = RaceFrame:FindFirstChild("FinishFrame")
local LapLabel = RaceFrame:FindFirstChild("LapLabel")
local TimeLeftLabel = RaceFrame:FindFirstChild("TimeLeftLabel")
local LapsLabel = LapLabel:FindFirstChild("LapsLabel")
local PlayersFrame = RaceFrame:FindFirstChild("PlayersFrame")
local PositionLabel = RaceFrame:FindFirstChild("PositionLabel")
RewardFrame:FindFirstChild("PersonalBest")
local LeftFrame = RewardFrame:FindFirstChild("LeftFrame")
local RightFrame = RewardFrame:FindFirstChild("RightFrame")
local Default = LeftFrame:FindFirstChild("Default")
local BottomFrame = HUDGui:WaitForChild("BottomFrame")
local function setupRockwallObstacles(p1) --[[ setupRockwallObstacles | Line: 112 | Upvalues: v11 (copy), Debris (copy), CollectionService (copy), RunService (copy), v31 (copy), v35 (copy) ]]
	local v1 = v11.new("RaceRockWalls", 4, 512)
	local t = {}
	local function addRockWall(p1) --[[ addRockWall | Line: 116 | Upvalues: v1 (copy) ]]
		if v1.Tree and v1.Update then
			v1:Add(p1, p1:GetPivot().Position)
		end
	end
	local function removeRockWall(p1) --[[ removeRockWall | Line: 122 | Upvalues: v1 (copy) ]]
		if v1.Tree and v1.Update then
			v1:Remove(p1)
		end
	end
	local function onRockwallReached(p1) --[[ onRockwallReached | Line: 128 | Upvalues: t (copy), v1 (copy), Debris (ref) ]]
		local v12 = next
		local v2, v3 = p1:GetDescendants()
		for v4, v5 in v12, v2, v3 do
			if v5:IsA("BasePart") then
				v5.CanCollide = false
				local v6 = 60 + math.random() * 15
				local v9 = Vector3.new(math.random() * 2 - 1, 0, math.random() * 2 - 1)
				if v9.Magnitude > 0.001 then
					v9 = v9.Unit * (5 + math.random() * 8)
				end
				local t2 = {
					Part = v5,
					LinearVelocity = v9 + Vector3.new(0, v6, 0)
				}
				t2.AngularVelocity = Vector3.new((math.random() * 2 - 1) * 12, (math.random() * 2 - 1) * 12, (math.random() * 2 - 1) * 12)
				table.insert(t, t2)
			end
		end
		if v1.Tree and v1.Update then
			v1:Remove(p1)
		end
		Debris:AddItem(p1, 2)
	end
	p1.RaceRockWallsOctree = v1
	p1:Add(CollectionService:GetInstanceAddedSignal("RacePowerupRockWall"):Connect(addRockWall))
	p1:Add(CollectionService:GetInstanceRemovedSignal("RacePowerupRockWall"):Connect(removeRockWall))
	p1:GiveTask(function() --[[ Line: 160 | Upvalues: t (copy) ]]
		table.clear(t)
	end)
	p1:GiveTask(RunService.Heartbeat:Connect(function(p1) --[[ Line: 163 | Upvalues: t (copy), v31 (ref), v35 (ref), v1 (copy), onRockwallReached (copy) ]]
		local Gravity = workspace.Gravity
		for i = #t, 1, -1 do
			local v12 = t[i]
			local Part = v12.Part
			if Part.Parent then
				v12.LinearVelocity = v12.LinearVelocity + Vector3.new(0, -Gravity * p1, 0)
				local v2 = Part.CFrame
				local v5 = CFrame.Angles(v12.AngularVelocity.X * p1, v12.AngularVelocity.Y * p1, v12.AngularVelocity.Z * p1)
				Part.CFrame = CFrame.new(v2.Position + v12.LinearVelocity * p1) * (v2 - v2.Position) * v5
				continue
			end
			table.remove(t, i)
		end
		if not v31.IsSkillActive("WindDash") then
			return
		end
		local Character = v35.Character
		if not Character then
			return
		end
		local v6 = Character:GetPivot()
		local v7 = v1:GetNearestWithMax(v6.Position, 1, 30)[1]
		if not v7 then
			return
		end
		local v8 = v7:GetPivot().Position - v6.Position
		local v9 = Vector3.new(v8.X, 0, v8.Z)
		if v9.Magnitude < 0.001 then
			return
		end
		local v10 = Vector3.new(v6.LookVector.X, 0, v6.LookVector.Z)
		if v10.Magnitude < 0.001 then
			return
		end
		if not (v10.Unit:Dot(v9.Unit) < 0.65) then
			onRockwallReached(v7)
		end
	end))
	local v2 = next
	local v3, v4 = CollectionService:GetTagged("RacePowerupRockWall")
	for v5, v6 in v2, v3, v4 do
		if v1.Tree and v1.Update then
			v1:Add(v6, v6:GetPivot().Position)
		end
	end
end
local function animateFinish(p1, p2, p3) --[[ animateFinish | Line: 222 | Upvalues: v24 (copy), FinishFrame (copy), TimeLeftLabel (copy), ReplicatedStorage (copy), v12 (copy), v1 (copy), v9 (copy) ]]
	local v13 = if p1 then v24.GetOrdinalOfNumber(p1) .. " place!" else "DNF"
	FinishFrame.PlaceLabel.Upper.Title.Text = ""
	FinishFrame.PlaceLabel.Lower.Title.Text = ""
	FinishFrame.UIScale.Scale = 0
	FinishFrame.Visible = true
	TimeLeftLabel.Visible = false
	pcall(function() --[[ Line: 231 | Upvalues: ReplicatedStorage (ref) ]]
		ReplicatedStorage.WorldStorage.RaceSounds.FinishLine:Play()
		ReplicatedStorage.WorldStorage.RaceSounds.FinishLineCheering:Play()
	end)
	v12.target(FinishFrame.UIScale, 0.65, 1.5, {
		Scale = 1
	})
	local v2 = v1.PlayEffect("Typewriter", {
		CharDelay = 0.09,
		Instance = FinishFrame.PlaceLabel.Upper.Title,
		Text = v13
	})
	local v3 = v1.PlayEffect("Typewriter", {
		CharDelay = 0.09,
		Instance = FinishFrame.PlaceLabel.Lower.Title,
		Text = v13
	})
	local v4 = v1.PlayEffect("Typewriter", {
		Text = "FINISH!",
		CharDelay = 0.09,
		Instance = FinishFrame.FinishLabel.Upper.Title
	})
	local v5 = v1.PlayEffect("Typewriter", {
		Text = "FINISH!",
		CharDelay = 0.09,
		Instance = FinishFrame.FinishLabel.Lower.Title
	})
	v9.Emit(100)
	p3:GiveTask(v2)
	p3:GiveTask(v3)
	p3:GiveTask(v4)
	p3:GiveTask(v5)
	task.wait(3)
	v12.target(FinishFrame.UIScale, 0.65, 1.5, {
		Scale = 0
	})
	task.wait(0.15)
end
local function toggleRaceGlobalKnobs(p1) --[[ toggleRaceGlobalKnobs | Line: 273 ]]
	_G.DisableHotbar = p1
	_G.HideHUD = p1
	_G.StopFlying = p1
	_G.HideTopHUD = p1
	_G.UnlimitedStamina = p1
	_G.DisableUnequip = p1
	_G.LastCheckpoint = p1
	_G.RacingMovement = p1
	_G.HideHorseInteracts = p1
	if p1 then
		return
	end
	_G.WaitingForRaceRewards = false
end
local t = {
	RaceStateEnums = RaceStateEnums
}
t.__index = t
function t.new(p1, p2, p3, p4) --[[ new | Line: 295 | Upvalues: t (copy), v13 (copy), RaceStateEnums (copy), v32 (copy) ]]
	local v2 = setmetatable({}, t)
	local v3 = v13.new()
	v2.CourseMap = v3:GiveTask(p3.CourseFolder:FindFirstChild("Map"):FindFirstChild("Races"):Clone())
	v2.LocalRaceValues = p4
	v2.Maid = v3
	v2.RaceId = p1
	v2.Config = p3
	v2.RacePlayers = p2
	v2.State = RaceStateEnums.LOADING
	v2.Checkpoints = v32.new({
		CourseFolder = p3.CourseFolder,
		MapFolder = v2.CourseMap,
		Laps = p3.Laps,
		CurrentLapValue = p4.RaceLap,
		CurrentCheckpointValue = p4.Checkpoint
	})
	v2:_init()
	return v2
end
function t.IsPlayerInRace(p1, p2) --[[ IsPlayerInRace | Line: 320 ]]
	return p1.RacePlayers[tostring(p2.UserId)] ~= nil
end
function t.GetState(p1) --[[ GetState | Line: 323 ]]
	return p1.State
end
function t.EnterCompleteState(p1, p2) --[[ EnterCompleteState | Line: 328 | Upvalues: RaceStateEnums (copy) ]]
	if not p2.Results then
		warn("no results passed to race completion state!")
		return
	end
	if p1.State ~= RaceStateEnums.COMPLETE then
		p1.State = RaceStateEnums.COMPLETE
		_G.UnlimitedStamina = false
		p1.Checkpoints:SetFinished()
		p1:_displayResults(p2.Results)
	end
end
function t.EnterRacingState(p1, p2) --[[ EnterRacingState | Line: 342 | Upvalues: RaceStateEnums (copy), v35 (copy), v21 (copy), v22 (copy), RaceFrame (copy), TimeLeftLabel (copy), v27 (copy), v28 (copy), LapsLabel (copy), v36 (copy), v4 (copy), v34 (copy), v10 (copy) ]]
	if p2.Duration and p2.StartTime then
		if p1.State == RaceStateEnums.RACING then
			return
		end
		p1.State = RaceStateEnums.RACING
		local Maid = p1.Maid
		local Laps = p1.Config.Laps
		local Checkpoints = p1.Checkpoints
		local LocalRaceValues = p1.LocalRaceValues
		local v1 = workspace:GetServerTimeNow()
		local v2 = p2.Duration - (v1 - p2.StartTime)
		Maid.LoadingFreezeConnection = nil
		v35.ControlsDisabled = false
		v35:EnablePlayerControls()
		Checkpoints:UpdateVisibility()
		v21.SetHUDNavigationEnabled(true)
		v22.OpenFrame(RaceFrame)
		TimeLeftLabel.Visible = true
		RaceFrame.LapLabel.Visible = true
		TimeLeftLabel.LeaveButton.Visible = false
		Maid.RaceTimerThread = v27.spawnLoop(function() --[[ Line: 373 | Upvalues: v1 (ref), v2 (ref), p2 (copy), TimeLeftLabel (ref), v28 (ref) ]]
			v1 = workspace:GetServerTimeNow()
			v2 = p2.Duration - (v1 - p2.StartTime)
			TimeLeftLabel.Text = v28.FormatString((math.max(0, v2)))
		end, 0.25)
		local function updateLapDisplay() --[[ updateLapDisplay | Line: 380 | Upvalues: LapsLabel (ref), LocalRaceValues (copy), Laps (copy), Checkpoints (copy) ]]
			LapsLabel.Text = math.clamp(LocalRaceValues.RaceLap.Value + 1, 0, Laps) .. "/" .. Laps
			Checkpoints:UpdateVisibility()
		end
		Maid:GiveTask(LocalRaceValues.RaceLap:GetPropertyChangedSignal("Value"):Connect(updateLapDisplay))
		Maid:GiveTask(LocalRaceValues.Checkpoint:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 386 | Upvalues: Checkpoints (copy) ]]
			Checkpoints:UpdateVisibility()
		end))
		local v3 = LapsLabel
		v3.Text = math.clamp(LocalRaceValues.RaceLap.Value + 1, 0, Laps) .. "/" .. Laps
		Checkpoints:UpdateVisibility()
		Maid:GiveTask(Checkpoints.OnCheckpointHit:Connect(function(p12) --[[ Line: 392 | Upvalues: v36 (ref), p1 (copy), Checkpoints (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 393 | Upvalues: v36 (ref), p1 (ref), p12 (copy) ]]
				return v36:InvokeServer(p1.RaceId, "Checkpoint", p12)
			end)
			if not v1 then
				warn("error requesting checkpoint completion for race")
				return
			end
			if v2 then
				Checkpoints:SetFinished()
			else
				Checkpoints:PlayCheckpointEffect()
			end
		end))
		local CurrentHorse = v35.CurrentHorse
		if not (_G.DisableRunning and CurrentHorse) then
			return
		end
		v4:StopSprinting()
		local v5 = table.find(v34.Gaits, CurrentHorse.MoveState)
		if v5 and not (v5 > 4) then
			return
		end
		v10:ChangeGait(v35, nil, 4)
	else
		warn((("could not start race, missing info! start time: %* | duration: %*"):format(p2.StartTime, p2.Duration)))
	end
end
function t.EnterCountdownState(p1, p2) --[[ EnterCountdownState | Line: 419 | Upvalues: RaceStateEnums (copy), ReplicatedStorage (copy), v22 (copy), RaceFrame (copy), Countdown (copy), v1 (copy) ]]
	if p2.Duration and p2.StartTime then
		if p1.State ~= RaceStateEnums.COUNTDOWN then
			p1.State = RaceStateEnums.COUNTDOWN
			local Maid = p1.Maid
			local v12 = p2.Duration - 1
			local v2 = workspace:GetServerTimeNow()
			local v3 = v12 - (v2 - p2.StartTime)
			local RaceBegin = ReplicatedStorage:FindFirstChild("WorldStorage"):FindFirstChild("RaceSounds"):FindFirstChild("RaceBegin")
			local Countdown_2 = ReplicatedStorage:FindFirstChild("WorldStorage"):FindFirstChild("RaceSounds"):FindFirstChild("Countdown")
			local v4 = nil
			v22.OpenFrame(RaceFrame)
			Countdown.Visible = true
			local function resetTickCountdownCleanup() --[[ resetTickCountdownCleanup | Line: 442 | Upvalues: v4 (ref) ]]
				if v4 then
					v4()
					v4 = nil
				end
			end
			local function playCountdownTick(p1) --[[ playCountdownTick | Line: 449 | Upvalues: v4 (ref), v1 (ref), Countdown (ref), RaceBegin (copy), Countdown_2 (copy) ]]
				if v4 then
					v4()
					v4 = nil
				end
				v4 = v1.PlayEffect("ScaleFadeCountdown", {
					Instance = Countdown,
					Time = p1
				})
				if p1 == "GO" then
					RaceBegin:Play()
				else
					Countdown_2:Play()
				end
			end
			Maid.CountdownThread = task.spawn(function() --[[ Line: 461 | Upvalues: v3 (ref), v2 (ref), v12 (copy), p2 (copy), playCountdownTick (copy), v4 (ref), v1 (ref), Countdown (ref), Countdown_2 (copy), Maid (copy) ]]
				local v13 = -1
				while v3 > 0 do
					v2 = workspace:GetServerTimeNow()
					v3 = v12 - (v2 - p2.StartTime)
					if math.floor(v3) ~= v13 then
						local v42 = math.floor(v3)
						if v42 > 0 then
							playCountdownTick(v42)
						end
						v13 = v42
					end
					task.wait(0.1)
				end
				if v4 then
					v4()
					v4 = nil
				end
				v4 = v1.PlayEffect("ScaleFadeCountdown", {
					Time = "GO!",
					Instance = Countdown
				})
				Countdown_2:Play()
				Maid:GiveTask(task.delay(2, function() --[[ Line: 477 | Upvalues: Countdown (ref), v4 (ref) ]]
					Countdown.Visible = false
					if v4 then
						v4()
						v4 = nil
					end
				end))
			end)
		end
	else
		warn((("could not start race countdown, missing info! start time: %* | duration: %*"):format(p2.StartTime, p2.Duration)))
	end
end
function t.EnterCleaningupState(p1, p2) --[[ EnterCleaningupState | Line: 483 | Upvalues: RaceStateEnums (copy), FinishFrame (copy) ]]
	if p1.State ~= RaceStateEnums.CLEANINGUP then
		p1.State = RaceStateEnums.CLEANINGUP
		FinishFrame.Visible = false
		_G.WaitingForRaceRewards = false
		p1:Destroy()
	end
end
function t._displayResults(p1, p2) --[[ _displayResults | Line: 494 | Upvalues: LocalPlayer (copy), Default (copy), v28 (copy), v25 (copy), v24 (copy), LeftFrame (copy), v12 (copy), animateFinish (copy), RewardFrame (copy), v20 (copy), v3 (copy), v23 (copy), v36 (copy), RightFrame (copy), v22 (copy) ]]
	_G.WaitingForRaceRewards = true
	local Maid = p1.Maid
	local t = {}
	local Rewards = p2.Rewards
	local function getLocalPlayerResult() --[[ getLocalPlayerResult | Line: 501 | Upvalues: p2 (copy), LocalPlayer (ref) ]]
		for v1, v2 in next, p2.SortedRacers do
			if v2.Player == LocalPlayer then
				return v2
			end
		end
	end
	local function createSortedResultRacerDisplay(p1) --[[ createSortedResultRacerDisplay | Line: 509 | Upvalues: Default (ref), v28 (ref), v25 (ref), v24 (ref), LocalPlayer (ref), LeftFrame (ref), v12 (ref), t (copy) ]]
		if not _G.WaitingForRaceRewards then
			return
		end
		local v1 = Default:Clone()
		local Container = v1:FindFirstChild("Container")
		Container.Position = UDim2.new(0, 0, 0.5, 0)
		Container.GroupTransparency = 1
		Container.PlayerLabel.Text = p1.Player.Name
		Container.FinishedLabel.Visible = not p1.DNF
		Container.TimeLabel.Text = if p1.DNF then "DNF" else v28.FormatString(p1.FinishTime)
		Container.PlayerImageLabel.Image = v25.GetUserThumbnail(p1.Player.UserId, Enum.ThumbnailType.HeadShot)
		Container.PositionLabel.Text = if p1.DNF then "DNF" else v24.GetOrdinalOfNumber(p1.Placement)
		v1.ImageColor3 = p1.Player == LocalPlayer and Color3.fromRGB(90, 217, 21) or v1.ImageColor3
		v1.LayoutOrder = p1.Placement or 999
		v1.Name = ("Result_%*"):format(p1.Player.UserId)
		v1.Visible = true
		v1.Parent = LeftFrame
		v12.target(v1.Container, 1, 1.5, {
			Position = UDim2.new(0.5, 0, 0.5, 0)
		})
		v12.target(v1.Container, 1, 1.5, {
			GroupTransparency = 0
		})
		table.insert(t, v1)
	end
	task.spawn(function() --[[ Line: 539 | Upvalues: p2 (copy), createSortedResultRacerDisplay (copy) ]]
		for i, v in ipairs(p2.SortedRacers) do
			createSortedResultRacerDisplay(v)
			task.wait(0.1)
		end
	end)
	Maid:GiveTask(function() --[[ Line: 545 | Upvalues: t (copy), v12 (ref) ]]
		for i = #t, 1, -1 do
			local v1 = t[i]
			v12.target(v1.Container, 1, 1.5, {
				GroupTransparency = 1
			})
			v12.target(v1.Container, 1, 1.5, {
				Position = UDim2.new(0, 0, 0.5, 0)
			})
		end
		for v2, v3 in next, t do
			v3:Destroy()
		end
		table.clear(t)
	end)
	local v1 = nil
	for v2, v32 in next, p2.SortedRacers do
		if v32.Player == LocalPlayer then
			v1 = v32
			break
		end
	end
	local v5 = if v1 then v1.Placement else v1
	animateFinish(v5, if v1 then v1.FinishTime else v1, Maid)
	if Rewards and next(Rewards) then
		RewardFrame.CloseButton.Visible = false
		RewardFrame.NoRewardLabel.Visible = false
		for i, v in ipairs(Rewards) do
			local v7 = Maid:GiveTask(v20.new({
				ForceVisible = true,
				Item = v3.GetByName(v.Name),
				ParentFrame = RewardFrame.Rewards,
				GetAmount = function() --[[ GetAmount | Line: 571 | Upvalues: v (copy) ]]
					return v.Amount
				end
			}))
			v7.Frame.Viewport.Visible = false
			v7.Frame.MysteryLabel.Visible = true
			v7:GiveTask(v23.new(v7.Frame.ClaimButton, {
				Click = function() --[[ Click | Line: 579 | Upvalues: v36 (ref), p1 (copy), i (copy), Rewards (copy), v7 (copy), RewardFrame (ref) ]]
					local v1, v2 = pcall(function() --[[ Line: 580 | Upvalues: v36 (ref), p1 (ref), i (ref) ]]
						return v36:InvokeServer(p1.RaceId, "ClaimReward", i)
					end)
					if not (v1 and v2) then
						return
					end
					if not Rewards[i] then
						return
					end
					Rewards[i] = nil
					v7.Frame.Viewport.Visible = true
					v7.Frame.MysteryLabel.Visible = false
					v7.Frame.ClaimButton.Visible = false
					if next(Rewards) then
						return
					end
					RewardFrame.CloseButton.Visible = true
				end
			}))
		end
	else
		RewardFrame.NoRewardLabel.Visible = true
		RewardFrame.CloseButton.Visible = true
	end
	RewardFrame.Rewards.Position = UDim2.new(0.5, 0, 0.745, 0)
	RightFrame.Visible = true
	LeftFrame.Visible = true
	v22.OpenMainFrame(RewardFrame, {
		CloseAll = "CloseOverlay",
		Blur = true
	})
end
function t._setupPlayerListDisplay(p1) --[[ _setupPlayerListDisplay | Line: 615 | Upvalues: PlayersFrame (copy), LocalPlayer (copy), v35 (copy), v7 (copy), v25 (copy), v24 (copy), PositionLabel (copy), v30 (copy), Players (copy), v27 (copy) ]]
	local Maid = p1.Maid
	local Checkpoints = p1.Checkpoints
	local t = {}
	local Default = PlayersFrame.Default
	local function getPlayerRacerInfo(p12) --[[ getPlayerRacerInfo | Line: 623 | Upvalues: LocalPlayer (ref), v35 (ref), p1 (copy), v7 (ref) ]]
		if p12 == LocalPlayer then
			local Races = v35.SettingsFolder:FindFirstChild("Races")
			local t = {
				DNF = false,
				Player = p12,
				Wrapper = v35,
				RaceLapValue = p1.LocalRaceValues.RaceLap,
				CheckpointValue = p1.LocalRaceValues.Checkpoint
			}
			t.FinishedValue = if Races then Races:FindFirstChild("Finished") else Races
			t.PlacementValue = if Races then Races:FindFirstChild("Placement") else Races
			return t
		else
			local v3 = v7.getWrapperFromPlayer(p12)
			if not v3 then
				return nil
			end
			local Races = v3.SettingsFolder:WaitForChild("Races", 10)
			if not Races then
				return nil
			end
			local Checkpoint = Races:WaitForChild("Checkpoint", 10)
			local Lap = Races:WaitForChild("Lap", 10)
			if Lap and Checkpoint then
				return {
					DNF = false,
					Player = p12,
					Wrapper = v3,
					RaceLapValue = Lap,
					CheckpointValue = Checkpoint,
					FinishedValue = Races:WaitForChild("Finished", 10),
					PlacementValue = Races:WaitForChild("Placement", 10)
				}
			else
				return nil
			end
		end
	end
	local function buildDisplayForPlayer(p1) --[[ buildDisplayForPlayer | Line: 661 | Upvalues: getPlayerRacerInfo (copy), Maid (copy), Default (copy), LocalPlayer (ref), v25 (ref), PlayersFrame (ref), t (copy) ]]
		local v1 = getPlayerRacerInfo(p1)
		while not v1 do
			local v2 = getPlayerRacerInfo(p1)
			task.wait(0.25)
			v1 = v2
		end
		local v3 = Maid:GiveTask(Default:Clone())
		v3.ImageColor3 = p1 == LocalPlayer and Color3.fromRGB(90, 217, 21) or v3.ImageColor3
		v3.PlayerImageLabel.Image = v25.GetUserThumbnail(p1.UserId, Enum.ThumbnailType.HeadShot)
		v3.PlayerLabel.Text = v25.GetPlayerName(p1)
		v3.Name = p1.Name
		v3.Visible = true
		v3.Parent = PlayersFrame
		v1.DisplayFrame = v3
		table.insert(t, v1)
	end
	local function updatePlayerDisplays() --[[ updatePlayerDisplays | Line: 681 | Upvalues: t (copy), Checkpoints (copy), v24 (ref), LocalPlayer (ref), PositionLabel (ref), v30 (ref) ]]
		table.sort(t, function(p1, p2) --[[ Line: 682 | Upvalues: Checkpoints (ref) ]]
			local v1 = p1.FinishedValue and p1.FinishedValue.Value or false
			local v2 = p2.FinishedValue and p2.FinishedValue.Value or false
			if v1 ~= v2 then
				return v1
			end
			if v1 and v2 then
				local v3 = p1.PlacementValue and p1.PlacementValue.Value or 0
				local v4 = p2.PlacementValue and p2.PlacementValue.Value or 0
				if v3 ~= 0 and (v4 ~= 0 and v3 ~= v4) then
					return v3 < v4
				end
			end
			if p1.DNF and p2.DNF then
				return false
			end
			if p1.DNF ~= p2.DNF then
				return not p1.DNF
			end
			if p1.RaceLapValue.Value == p2.RaceLapValue.Value then
				if p1.CheckpointValue.Value == p2.CheckpointValue.Value then
					local v6 = Checkpoints:GetCheckpointPosition(p1.CheckpointValue.Value)
					if not v6 then
						return false
					end
					local v7 = p1.Wrapper.Character and p1.Wrapper.Character:GetPivot().Position
					local v8 = p2.Wrapper.Character and p2.Wrapper.Character:GetPivot().Position
					return (v7 and (v6 * Vector3.new(1, 0, 1) - v7 * Vector3.new(1, 0, 1)).Magnitude or 9000000000) < (v8 and (v6 * Vector3.new(1, 0, 1) - v8 * Vector3.new(1, 0, 1)).Magnitude or 9000000000)
				else
					return p1.CheckpointValue.Value > p2.CheckpointValue.Value
				end
			else
				return p1.RaceLapValue.Value > p2.RaceLapValue.Value
			end
		end)
		local v1 = 0
		for i, v in ipairs(t) do
			local v2 = if v.DNF then "DNF" else v24.GetOrdinalOfNumber(i)
			v.DisplayFrame.PositionLabel.Text = v2
			v.DisplayFrame.LayoutOrder = i
			if v.Player == LocalPlayer then
				PositionLabel.Text = v2
				v1 = i
			end
		end
		local v3 = v30.getNeighborsWithMinimum(t, v1)
		for i, v in ipairs(t) do
			v.DisplayFrame.Visible = table.find(v3, i) ~= nil
		end
	end
	for v1, v2 in next, p1.RacePlayers do
		p1.Maid:GiveTask(task.spawn(buildDisplayForPlayer, (Players:GetPlayerByUserId((tonumber(v1))))))
	end
	updatePlayerDisplays()
	Maid:GiveTask(v27.spawnLoop(updatePlayerDisplays, 0.5))
end
function t._setupCourseMap(p1) --[[ _setupCourseMap | Line: 747 | Upvalues: v35 (copy), v2 (copy), setupRockwallObstacles (copy) ]]
	local CourseMap = p1.CourseMap
	local Obstacles = CourseMap:FindFirstChild("Obstacles")
	local TeleportBack = CourseMap:FindFirstChild("TeleportBack")
	if Obstacles then
		p1.Maid:GiveTask(Obstacles)
		Obstacles.Parent = workspace.CurrentCamera
	end
	if TeleportBack then
		local function setupTeleportBackPart(p12) --[[ setupTeleportBackPart | Line: 760 | Upvalues: p1 (copy), v35 (ref), v2 (ref) ]]
			if p12:IsA("BasePart") then
				p1.Maid:GiveTask(p12.Touched:Connect(function(p1_2) --[[ Line: 765 | Upvalues: v35 (ref), v2 (ref) ]]
					if p1_2:IsDescendantOf(v35.Character) then
						v2:Teleport({
							Type = "ToLastCheckpoint",
							Transition = false
						})
					end
				end))
			end
		end
		p1.Maid:GiveTask(TeleportBack.DescendantAdded:Connect(setupTeleportBackPart))
		for v1, v22 in TeleportBack:GetDescendants() do
			if v22:IsA("BasePart") then
				p1.Maid:GiveTask(v22.Touched:Connect(function(p1_2) --[[ Line: 765 | Upvalues: v35 (ref), v2 (ref) ]]
					if p1_2:IsDescendantOf(v35.Character) then
						v2:Teleport({
							Type = "ToLastCheckpoint",
							Transition = false
						})
					end
				end))
			end
		end
	end
	for v3, v4 in { "Boosts", "MysteryBoxes" } do
		local v5 = CourseMap:FindFirstChild(v4)
		if v5 then
			for v6, v7 in v5:GetChildren() do
				v7:SetAttribute("Enabled", true)
			end
		end
	end
	setupRockwallObstacles(p1.Maid)
	CourseMap.Parent = workspace.Terrain
end
function t._teleportToStart(p1) --[[ _teleportToStart | Line: 798 | Upvalues: LocalPlayer (copy), v35 (copy), v18 (copy), v10 (copy), v12 (copy), RunService (copy) ]]
	local v1 = p1.RacePlayers[tostring(LocalPlayer.UserId)]
	local Checkpoints = p1.Checkpoints
	local v2 = Checkpoints:GetStartPart(v1)
	if not v2 then
		warn((("could not find start part to teleport player for start position: %*"):format(v1)))
		return false
	end
	local CurrentHorse = v35.CurrentHorse
	if not (CurrentHorse and (CurrentHorse.Model and CurrentHorse.Root)) then
		warn((("could not get valid mounted horse to start race for player: %*"):format(LocalPlayer.Name)))
		return false
	end
	local v3 = Checkpoints:GetFirstCheckpoint()
	local v4 = CurrentHorse.Model:GetExtentsSize()
	v18:Start()
	v10:StopMovement()
	pcall(function() --[[ Line: 820 | Upvalues: CurrentHorse (copy) ]]
		CurrentHorse:_tryAFK(false)
	end)
	v12.stop(CurrentHorse.BodyGyro)
	v12.stop(CurrentHorse.BodyVelocity)
	v35.Character:PivotTo(v2.CFrame + v4 * Vector3.new(0, 2, 0))
	if v3 and v3.PrimaryPart then
		local v5 = CFrame.lookAt(v2.Position, v3.PrimaryPart.Position)
		local v6 = CurrentHorse.Root.Position + v5:VectorToWorldSpace(Vector3.new(0, 5, 15))
		CurrentHorse.BodyGyro.CFrame = v5
		workspace.CurrentCamera.CFrame = CFrame.lookAt(v6, v3.PrimaryPart.Position)
	else
		CurrentHorse.BodyGyro.CFrame = v2.CFrame
	end
	p1.Maid.LoadingFreezeConnection = RunService.Heartbeat:Connect(function() --[[ Line: 841 | Upvalues: CurrentHorse (copy) ]]
		if CurrentHorse and CurrentHorse.Root then
			CurrentHorse.Root.Velocity = CurrentHorse.Root.Velocity * Vector3.new(0, 1, 0)
			CurrentHorse.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
		end
	end)
	v18:End()
	return true
end
function t._init(p1) --[[ _init | Line: 854 | Upvalues: v35 (copy), v8 (copy), v22 (copy), v16 (copy), v17 (copy), v15 (copy), BottomFrame (copy), v21 (copy), v29 (copy), v19 (copy), v14 (copy), v36 (copy), v10 (copy), v5 (copy), v6 (copy), v37 (copy) ]]
	v35.ControlsDisabled = true
	v35:DisablePlayerControls()
	v8.CancelCurrentTarget()
	p1:_setupCourseMap()
	_G.DisableHotbar = true
	_G.HideHUD = true
	_G.StopFlying = true
	_G.HideTopHUD = true
	_G.UnlimitedStamina = true
	_G.DisableUnequip = true
	_G.LastCheckpoint = true
	_G.RacingMovement = true
	_G.HideHorseInteracts = true
	if v35.Humanoid then
		v35.Humanoid:UnequipTools()
	end
	if v22.MainFrameOpen then
		v22.CloseMainFrame(v22.MainFrameOpen)
	end
	if v16.GetDisplay() then
		v16:Stop()
	end
	if v17.GetDisplay() then
		v17:Stop()
	end
	if v15:IsRunning() then
		task.spawn(function() --[[ Line: 879 | Upvalues: v15 (ref) ]]
			v15:Stop()
		end)
	end
	v22.CloseHUD()
	BottomFrame.Visible = false
	v21.SetHUDNavigationEnabled(false)
	v29.SetGameElements({
		SideFrame = false,
		MutationNotifications = false
	}, true)
	if v35.CurrentHorse and v35.CurrentHorse.Flying then
		pcall(v35.CurrentHorse.Fly, v35.CurrentHorse, false)
	end
	if v35:IsInAction("BuildMode") then
		v19:ExitMode()
	end
	local CurrentHorse = v35.CurrentHorse
	local function removePlayerFromRace() --[[ removePlayerFromRace | Line: 900 | Upvalues: v14 (ref), v36 (ref), p1 (copy) ]]
		v14.Notify({
			Message = "Failed to load into the race!",
			Preset = "Red"
		})
		task.defer(function() --[[ Line: 905 | Upvalues: v36 (ref), p1 (ref) ]]
			v36:InvokeServer(p1.RaceId, "RemovePlayer")
		end)
	end
	if not CurrentHorse then
		local _, v1 = next(v10.GetAllAnimals())
		if not v1 then
			print(v10.GetAllAnimals())
			warn("could not get random horse to start race for player!")
			removePlayerFromRace()
			return
		end
		v1:_sit()
		local sum = 0
		while not CurrentHorse and sum < 1 do
			CurrentHorse = v35.CurrentHorse
			sum = sum + task.wait()
		end
	end
	if not CurrentHorse then
		warn("could not get current horse to start race for player!")
		removePlayerFromRace()
		return
	end
	if p1:_teleportToStart() then
		v5.setMusicTrack("RaceMusic", true)
		v6.setModifier("Race", true)
		v37:FireServer(p1.RaceId)
		p1:_setupPlayerListDisplay()
		p1.WasLoaded = true
	else
		warn("could not teleport player to start position for race!")
		removePlayerFromRace()
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 945 | Upvalues: v36 (copy), v22 (copy), RewardFrame (copy), RaceFrame (copy), FinishFrame (copy), v2 (copy), v6 (copy), v5 (copy), v31 (copy), v35 (copy), v21 (copy), BottomFrame (copy), v29 (copy) ]]
	if p1.IsDestroyed then
		return
	end
	p1.IsDestroyed = true
	task.defer(function() --[[ Line: 950 | Upvalues: v36 (ref), p1 (copy) ]]
		v36:InvokeServer(p1.RaceId, "RemovePlayer")
	end)
	v22.CloseMainFrame(RewardFrame)
	v22.CloseFrame(RaceFrame)
	FinishFrame.Visible = false
	if p1.WasLoaded then
		task.wait(0.1)
		local SpawnLocations = workspace:FindFirstChild("SpawnLocations")
		if SpawnLocations then
			local t = {}
			for v1, v23 in SpawnLocations:GetChildren() do
				if v23:IsA("SpawnLocation") then
					table.insert(t, v23)
				end
			end
			if #t > 0 then
				v2.TeleportToPosition(t[math.random(1, #t)].Position, {
					Transition = true
				})
			end
		end
	end
	p1.Checkpoints:SetFinished()
	p1.Maid:DoCleaning()
	v6.setModifier("Race", false)
	v5.setMusicTrack("RaceMusic", false)
	v31.ResetHeld()
	_G.DisableHotbar = false
	_G.HideHUD = false
	_G.StopFlying = false
	_G.HideTopHUD = false
	_G.UnlimitedStamina = false
	_G.DisableUnequip = false
	_G.LastCheckpoint = false
	_G.RacingMovement = false
	_G.HideHorseInteracts = false
	_G.WaitingForRaceRewards = false
	v35:SetActionState("Race", false)
	v35.ControlsDisabled = false
	v35:EnablePlayerControls()
	v21.SetHUDNavigationEnabled(true)
	v22.OpenHUD()
	BottomFrame.Visible = true
	v29.SetGameElements({
		SideFrame = true,
		MutationNotifications = true
	}, true)
end
return t