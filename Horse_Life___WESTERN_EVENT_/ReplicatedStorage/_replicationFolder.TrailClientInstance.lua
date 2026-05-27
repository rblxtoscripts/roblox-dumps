-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiEffectsService")
local v2 = Sonar("MusicService")
local v3 = Sonar("FoVService")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("Confetti")
local v6 = Sonar("Animal")
local v7 = Sonar("spr")
local v8 = Sonar("Maid")
local v9 = Sonar("NotificationsClient")
local v10 = Sonar("SellingAnimalClient")
local v11 = Sonar("DisplayAnimalClient")
local v12 = Sonar("DisplayItemClient")
local v13 = Sonar("BuildClient")
local v14 = Sonar("UINavigator")
local v15 = Sonar("GuiManager")
local v16 = Sonar("RemoteUtils")
local v17 = Sonar("EventUtils")
local v18 = Sonar("TimeUtils")
local v19 = Sonar("GuiUtils")
local v20 = Sonar("RaceCheckpoints")
local v21 = Sonar("TrailConfigs")
local v22 = Sonar("Constants")
local LocalPlayer = Players.LocalPlayer
local v23 = v4.GetClient()
local TrailStateEnums = v21.TrailStateEnums
local v24 = v16.GetRemoteFunction("TrailRemote")
local v25 = v16.GetRemoteEvent("TrailLoaded")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RacesGui = PlayerGui:WaitForChild("RacesGui")
local HUDGui = PlayerGui:WaitForChild("HUDGui")
local RaceFrame = RacesGui:WaitForChild("RaceFrame")
local Countdown = RaceFrame:WaitForChild("Countdown")
local FinishFrame = RaceFrame:FindFirstChild("FinishFrame")
local LapLabel = RaceFrame:FindFirstChild("LapLabel")
local TimeLeftLabel = RaceFrame:FindFirstChild("TimeLeftLabel")
local PositionLabel = RaceFrame:FindFirstChild("PositionLabel")
local BottomFrame = HUDGui:WaitForChild("BottomFrame")
local function toggleRaceGlobalKnobs(p1) --[[ toggleRaceGlobalKnobs | Line: 60 ]]
	_G.StopFlying = p1
	_G.HideTopHUD = p1
	_G.UnlimitedStamina = p1
	_G.DisableUnequip = p1
	_G.LastCheckpoint = p1
	_G.RacingMovement = p1
	_G.HideHorseInteracts = p1
	_G.DisableRunning = p1
	if p1 then
		return
	end
	_G.WaitingForRaceRewards = false
end
local function animateTrailFinish(p1, p2) --[[ animateTrailFinish | Line: 75 | Upvalues: FinishFrame (copy), v18 (copy), TimeLeftLabel (copy), ReplicatedStorage (copy), v7 (copy), v1 (copy), v5 (copy) ]]
	if not FinishFrame then
		return
	end
	local v12 = v18.FormatString(p1 or 0)
	FinishFrame.PlaceLabel.Upper.Title.Text = ""
	FinishFrame.PlaceLabel.Lower.Title.Text = ""
	FinishFrame.UIScale.Scale = 0
	FinishFrame.Visible = true
	local v2, v3, v4, v52
	if TimeLeftLabel then
		TimeLeftLabel.Visible = false
	end
	pcall(function() --[[ Line: 90 | Upvalues: ReplicatedStorage (ref) ]]
		ReplicatedStorage.WorldStorage.RaceSounds.FinishLine:Play()
		ReplicatedStorage.WorldStorage.RaceSounds.FinishLineCheering:Play()
	end)
	v7.target(FinishFrame.UIScale, 0.65, 1.5, {
		Scale = 1
	})
	v2 = v1.PlayEffect("Typewriter", {
		CharDelay = 0.09,
		Instance = FinishFrame.PlaceLabel.Upper.Title,
		Text = v12
	})
	v3 = v1.PlayEffect("Typewriter", {
		CharDelay = 0.09,
		Instance = FinishFrame.PlaceLabel.Lower.Title,
		Text = v12
	})
	v4 = v1.PlayEffect("Typewriter", {
		Text = "FINISH!",
		CharDelay = 0.09,
		Instance = FinishFrame.FinishLabel.Upper.Title
	})
	v52 = v1.PlayEffect("Typewriter", {
		Text = "FINISH!",
		CharDelay = 0.09,
		Instance = FinishFrame.FinishLabel.Lower.Title
	})
	v5.Emit(100)
	p2:GiveTask(v2)
	p2:GiveTask(v3)
	p2:GiveTask(v4)
	p2:GiveTask(v52)
	task.wait(3)
	v7.target(FinishFrame.UIScale, 0.65, 1.5, {
		Scale = 0
	})
	task.wait(0.15)
end
local t = {
	TrailStateEnums = TrailStateEnums
}
t.__index = t
function t.new(p1, p2, p3) --[[ new | Line: 135 | Upvalues: t (copy), v8 (copy), TrailStateEnums (copy), v20 (copy) ]]
	local v2 = setmetatable({}, t)
	local v3 = v8.new()
	v2.LocalRaceValues = p3
	v2.Maid = v3
	v2.TrailId = p1
	v2.Config = p2
	v2.State = TrailStateEnums.LOADING
	v2.Checkpoints = v20.new({
		CourseFolder = p2.CourseFolder,
		Laps = p2.Laps,
		CurrentLapValue = p3.RaceLap,
		CurrentCheckpointValue = p3.Checkpoint
	})
	v2:_init()
	return v2
end
function t.IsPlayerInRace(p1, p2) --[[ IsPlayerInRace | Line: 158 | Upvalues: LocalPlayer (copy) ]]
	return if p2 == LocalPlayer then not p1.IsDestroyed else false
end
function t.GetState(p1) --[[ GetState | Line: 162 ]]
	return p1.State
end
function t.EnterCountdownState(p1, p2) --[[ EnterCountdownState | Line: 166 | Upvalues: TrailStateEnums (copy), ReplicatedStorage (copy), v15 (copy), RaceFrame (copy), Countdown (copy), v1 (copy) ]]
	if not (p2.Duration and p2.StartTime) then
		warn("could not start trail countdown, missing info!")
		return
	end
	if p1.State ~= TrailStateEnums.COUNTDOWN then
		p1.State = TrailStateEnums.COUNTDOWN
		local Maid = p1.Maid
		local v12 = workspace:GetServerTimeNow()
		local v2 = p2.Duration - (v12 - p2.StartTime)
		local RaceBegin = ReplicatedStorage:FindFirstChild("WorldStorage"):FindFirstChild("RaceSounds"):FindFirstChild("RaceBegin")
		local Countdown_2 = ReplicatedStorage:FindFirstChild("WorldStorage"):FindFirstChild("RaceSounds"):FindFirstChild("Countdown")
		local v3 = nil
		v15.OpenFrame(RaceFrame)
		Countdown.Visible = true
		local function resetTickCountdownCleanup() --[[ resetTickCountdownCleanup | Line: 188 | Upvalues: v3 (ref) ]]
			if v3 then
				v3()
				v3 = nil
			end
		end
		local function playCountdownTick(p1) --[[ playCountdownTick | Line: 195 | Upvalues: v3 (ref), v1 (ref), Countdown (ref), RaceBegin (copy), Countdown_2 (copy) ]]
			if v3 then
				v3()
				v3 = nil
			end
			v3 = v1.PlayEffect("ScaleFadeCountdown", {
				Instance = Countdown,
				Time = p1
			})
			if p1 == "GO!" then
				if not RaceBegin then
					return
				end
				RaceBegin:Play()
			else
				if not Countdown_2 then
					return
				end
				Countdown_2:Play()
			end
		end
		Maid.CountdownThread = task.spawn(function() --[[ Line: 212 | Upvalues: v2 (ref), v12 (ref), p2 (copy), playCountdownTick (copy), v3 (ref), v1 (ref), Countdown (ref), RaceBegin (copy), Maid (copy) ]]
			local v13 = -1
			while v2 > 0 do
				v12 = workspace:GetServerTimeNow()
				v2 = p2.Duration - (v12 - p2.StartTime)
				if math.ceil(v2) ~= v13 then
					local v4 = math.ceil(v2)
					if v4 > 0 then
						playCountdownTick(v4)
					end
					v13 = v4
				end
				task.wait(0.1)
			end
			if v3 then
				v3()
				v3 = nil
			end
			v3 = v1.PlayEffect("ScaleFadeCountdown", {
				Time = "GO!",
				Instance = Countdown
			})
			if not RaceBegin then
				Maid:GiveTask(task.delay(2, function() --[[ Line: 228 | Upvalues: Countdown (ref), v3 (ref) ]]
					Countdown.Visible = false
					if v3 then
						v3()
						v3 = nil
					end
				end))
				return
			end
			RaceBegin:Play()
			Maid:GiveTask(task.delay(2, function() --[[ Line: 228 | Upvalues: Countdown (ref), v3 (ref) ]]
				Countdown.Visible = false
				if v3 then
					v3()
					v3 = nil
				end
			end))
		end)
	end
end
function t.EnterRacingState(p1, p2) --[[ EnterRacingState | Line: 235 | Upvalues: TrailStateEnums (copy), v14 (copy), v15 (copy), RaceFrame (copy), TimeLeftLabel (copy), LapLabel (copy), PositionLabel (copy), v17 (copy), v18 (copy), v24 (copy), v23 (copy), v22 (copy), v6 (copy) ]]
	if not (p2.Duration and p2.StartTime) then
		warn("could not start trail, missing info!")
		return
	end
	if p1.State == TrailStateEnums.RACING then
		return
	end
	p1.State = TrailStateEnums.RACING
	local Maid = p1.Maid
	local Checkpoints = p1.Checkpoints
	local v1 = workspace:GetServerTimeNow()
	local v2 = p2.Duration - (v1 - p2.StartTime)
	Checkpoints:UpdateVisibility()
	v14.SetHUDNavigationEnabled(true)
	v15.OpenFrame(RaceFrame)
	if TimeLeftLabel then
		TimeLeftLabel.Visible = true
		if TimeLeftLabel:FindFirstChild("LeaveButton") then
			TimeLeftLabel.LeaveButton.Visible = false
		end
	end
	if LapLabel then
		LapLabel.Visible = false
	end
	if PositionLabel then
		PositionLabel.Visible = false
	end
	Maid.RaceTimerThread = v17.spawnLoop(function() --[[ Line: 269 | Upvalues: v1 (ref), v2 (ref), p2 (copy), TimeLeftLabel (ref), v18 (ref) ]]
		v1 = workspace:GetServerTimeNow()
		v2 = p2.Duration - (v1 - p2.StartTime)
		if not TimeLeftLabel then
			return
		end
		TimeLeftLabel.Text = v18.FormatString((math.max(0, v2)))
	end, 0.25)
	Maid:GiveTask(p1.LocalRaceValues.Checkpoint:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 277 | Upvalues: Checkpoints (copy) ]]
		Checkpoints:UpdateVisibility()
	end))
	Maid:GiveTask(Checkpoints.OnCheckpointHit:Connect(function(p12) --[[ Line: 281 | Upvalues: v24 (ref), p1 (copy), Checkpoints (copy) ]]
		local v1, v2 = pcall(function() --[[ Line: 282 | Upvalues: v24 (ref), p1 (ref), p12 (copy) ]]
			return v24:InvokeServer(p1.TrailId, "Checkpoint", p12)
		end)
		if not v1 then
			warn("error requesting checkpoint completion for trail")
			return
		end
		if v2 then
			Checkpoints:SetFinished()
		else
			Checkpoints:PlayCheckpointEffect()
		end
	end))
	local CurrentHorse = v23.CurrentHorse
	if not (_G.DisableRunning and CurrentHorse) then
		return
	end
	local v3 = table.find(v22.Gaits, CurrentHorse.MoveState)
	if v3 and not (v3 > 4) then
		return
	end
	v6:ChangeGait(v23, nil, 4)
end
function t.EnterCompleteState(p1, p2) --[[ EnterCompleteState | Line: 305 | Upvalues: TrailStateEnums (copy), animateTrailFinish (copy), v9 (copy) ]]
	if p1.State == TrailStateEnums.COMPLETE then
		return
	end
	p1.State = TrailStateEnums.COMPLETE
	_G.UnlimitedStamina = false
	p1.Checkpoints:SetFinished()
	local v2 = p2 and p2.CoinsReward or 0
	task.spawn(animateTrailFinish, p2 and p2.FinishTime or 0, p1.Maid)
	if not (v2 > 0) then
		return
	end
	v9.Notify({
		Preset = "Green",
		Message = ("Trail complete! +%* Coins"):format(v2)
	})
end
function t.EnterCleaningupState(p1, p2) --[[ EnterCleaningupState | Line: 327 | Upvalues: TrailStateEnums (copy), FinishFrame (copy) ]]
	if p1.State == TrailStateEnums.CLEANINGUP then
		return
	end
	p1.State = TrailStateEnums.CLEANINGUP
	if FinishFrame then
		FinishFrame.Visible = false
	end
	_G.WaitingForRaceRewards = false
	p1:Destroy()
end
function t._init(p1) --[[ _init | Line: 340 | Upvalues: v23 (copy), v15 (copy), v11 (copy), v12 (copy), v10 (copy), v14 (copy), v19 (copy), v13 (copy), v2 (copy), v3 (copy), v25 (copy) ]]
	_G.StopFlying = true
	_G.HideTopHUD = true
	_G.UnlimitedStamina = true
	_G.DisableUnequip = true
	_G.LastCheckpoint = true
	_G.RacingMovement = true
	_G.HideHorseInteracts = true
	_G.DisableRunning = true
	if v23.Humanoid then
		v23.Humanoid:UnequipTools()
	end
	if v15.MainFrameOpen then
		v15.CloseMainFrame(v15.MainFrameOpen)
	end
	if v11.GetDisplay() then
		v11:Stop()
	end
	if v12.GetDisplay() then
		v12:Stop()
	end
	if v10:IsRunning() then
		task.spawn(function() --[[ Line: 356 | Upvalues: v10 (ref) ]]
			v10:Stop()
		end)
	end
	v15.CloseHUD()
	v14.SetHUDNavigationEnabled(false)
	v19.SetGameElements({
		SideFrame = false,
		MutationNotifications = false
	}, true)
	if v23.CurrentHorse and v23.CurrentHorse.Flying then
		pcall(v23.CurrentHorse.Fly, v23.CurrentHorse, false)
	end
	if not v23:IsInAction("BuildMode") then
		v2.setMusicTrack("RaceMusic", true)
		v3.setModifier("Race", true)
		v25:FireServer(p1.TrailId)
		p1.WasLoaded = true
		return
	end
	v13:ExitMode()
	v2.setMusicTrack("RaceMusic", true)
	v3.setModifier("Race", true)
	v25:FireServer(p1.TrailId)
	p1.WasLoaded = true
end
function t.Destroy(p1) --[[ Destroy | Line: 380 | Upvalues: v24 (copy), v15 (copy), RaceFrame (copy), FinishFrame (copy), v3 (copy), v2 (copy), v23 (copy), v14 (copy), BottomFrame (copy), v19 (copy) ]]
	if p1.IsDestroyed then
		return
	end
	p1.IsDestroyed = true
	task.defer(function() --[[ Line: 385 | Upvalues: v24 (ref), p1 (copy) ]]
		v24:InvokeServer(p1.TrailId, "RemovePlayer")
	end)
	v15.CloseFrame(RaceFrame)
	if not FinishFrame then
		p1.Checkpoints:SetFinished()
		p1.Maid:DoCleaning()
		v3.setModifier("Race", false)
		v2.setMusicTrack("RaceMusic", false)
		_G.StopFlying = false
		_G.HideTopHUD = false
		_G.UnlimitedStamina = false
		_G.DisableUnequip = false
		_G.LastCheckpoint = false
		_G.RacingMovement = false
		_G.HideHorseInteracts = false
		_G.DisableRunning = false
		_G.WaitingForRaceRewards = false
		v23:SetActionState("Race", false)
		v23:SetActionState("Trail", false)
		v14.SetHUDNavigationEnabled(true)
		v15.OpenHUD()
		BottomFrame.Visible = true
		v19.SetGameElements({
			SideFrame = true,
			MutationNotifications = true
		}, true)
		return
	end
	FinishFrame.Visible = false
	p1.Checkpoints:SetFinished()
	p1.Maid:DoCleaning()
	v3.setModifier("Race", false)
	v2.setMusicTrack("RaceMusic", false)
	_G.StopFlying = false
	_G.HideTopHUD = false
	_G.UnlimitedStamina = false
	_G.DisableUnequip = false
	_G.LastCheckpoint = false
	_G.RacingMovement = false
	_G.HideHorseInteracts = false
	_G.DisableRunning = false
	_G.WaitingForRaceRewards = false
	v23:SetActionState("Race", false)
	v23:SetActionState("Trail", false)
	v14.SetHUDNavigationEnabled(true)
	v15.OpenHUD()
	BottomFrame.Visible = true
	v19.SetGameElements({
		SideFrame = true,
		MutationNotifications = true
	}, true)
end
return t