-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("MobSpawner")
local v2 = Sonar("TutorialService")
local v3 = Sonar("ContextualUtils")
local v4 = Sonar("DisplayAnimalClient")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("MobAnimator")
local v7 = Sonar("TrackObjectiveClient")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v8 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local Tutorial = ReplicatedStorage.Storage.Assets.Tutorial
local function yieldForDisplayThenNoDisplay() --[[ yieldForDisplayThenNoDisplay | Line: 27 | Upvalues: RunService (copy), v4 (copy) ]]
	repeat
		RunService.Heartbeat:Wait()
	until v4.GetDisplay()
	return v4.YieldForNoDisplay()
end
local function yieldUntilAllMissionsClaimed(p1) --[[ yieldUntilAllMissionsClaimed | Line: 35 | Upvalues: RunService (copy) ]]
	local v1 = false
	while not v1 do
		v1 = true
		for v2, v3 in p1.Missions:GetChildren() do
			if not v3.Claimed.Value then
				v1 = false
			end
		end
		RunService.Heartbeat:Wait()
	end
end
local function yieldUntilAnyMissionClaimed(p1) --[[ yieldUntilAnyMissionClaimed | Line: 48 | Upvalues: RunService (copy) ]]
	local v1_2
	while true do
		for v2, v1_2 in p1.Missions:GetChildren() do
			if v1_2.Claimed.Value then
				return v1_2
			end
		end
		RunService.Heartbeat:Wait()
	end
	return v1_2
end
local function areAllMissionsCompleted(p1) --[[ areAllMissionsCompleted | Line: 59 ]]
	if p1.Completed.Value then
		return true
	end
	for v1, v2 in p1.Missions:GetChildren() do
		if not v2.Value then
			return
		end
	end
	return true
end
local function hasAnyUnclaimedMissions(p1) --[[ hasAnyUnclaimedMissions | Line: 71 ]]
	for v1, v2 in p1.Missions:GetChildren() do
		if v2.Value and not v2.Claimed.Value then
			return true
		end
	end
end
function t.Start(p1) --[[ Start | Line: 80 | Upvalues: t (copy), v8 (copy), PlayerGui (copy), v3 (copy), v4 (copy), v2 (copy), LocalPlayer (copy), v1 (copy), Tutorial (copy), v6 (copy), RunService (copy), v5 (copy), ReplicatedStorage (copy), yieldForDisplayThenNoDisplay (copy), yieldUntilAnyMissionClaimed (copy), v7 (copy), yieldUntilAllMissionsClaimed (copy) ]]
	if p1.PreviousStage then
		p1.PreviousStage()
	else
		t.YieldForClientLoaded()
		task.spawn(t.YieldForHorseAndMount, {
			MoveToStart = true
		})
	end
	t.InitHUDandControls({
		PinnedMissions = true,
		BottomFrame = true,
		ItemStream = true,
		SideFrame = true,
		Stables = true,
		Journal = false,
		BreedAction = true,
		SellHorsesAction = true,
		KeepHorseAction = true,
		UnequipHotbarAction = true,
		PredictFoalAction = false,
		KeepFrameOpenOnBreed = false,
		OpenHUDOnBreed = true,
		OpenBreedingFromStablesHUD = true,
		AutoFillHorsesInBreeding = true,
		FullViewportDisplaySize = true,
		HideDisplayTopFrame = true,
		UntrackObjective = false
	})
	t.SetProgressStep(4)
	if p1.AfterInit then
		p1.AfterInit()
	end
	local WelcomeToHorseLife = v8.TutorialData.Missions.WelcomeToHorseLife
	local t2 = {}
	local v12
	if WelcomeToHorseLife.Completed.Value then
		v12 = true
	else
		v12 = true
		for v22, v32 in WelcomeToHorseLife.Missions:GetChildren() do
			if not v32.Value then
				v12 = nil
				break
			end
		end
	end
	if not v12 then
		local v42 = nil
		for v52, v62 in WelcomeToHorseLife.Missions:GetChildren() do
			if v62.Value and not v62.Claimed.Value then
				v42 = true
				break
			end
		end
		if not v42 then
			task.spawn(t.TweenInText, "<font color=\'rgb(80, 214, 255)\'>Track</font> your missions for rewards!")
		end
		for v72, v82 in WelcomeToHorseLife.Missions:GetChildren() do
			for v9, v10 in PlayerGui.PinnedMissionsGui.MissionsFrame:GetChildren() do
				local v11 = v10:WaitForChild("Tutorial-WelcomeToHorseLife-" .. v82.Name)
				t2[#t2 + 1] = v3.SetGuiPointTo({
					Direction = "Left",
					Offset = -3,
					GuiElement = v11:FindFirstChild("TrackButton", true),
					NextElement = function() --[[ NextElement | Line: 146 | Upvalues: WelcomeToHorseLife (copy), v4 (ref), v82 (copy), v72 (copy) ]]
						local v1 = nil
						for v2, v3 in WelcomeToHorseLife.Missions:GetChildren() do
							if v3.Value and not v3.Claimed.Value then
								v1 = true
								break
							end
						end
						if v1 then
							return
						end
						if v4.GetDisplay() then
							return
						end
						if v82.Value then
							return
						end
						local v42 = WelcomeToHorseLife.Missions:FindFirstChild(v72 - 1)
						if v42 and not v42.Value then
						else
							return true
						end
					end
				})
			end
		end
	end
	v2.PostTutorialStage("TrackedTamedHorseObjective")
	for v122, v13 in t2 do
		v13()
	end
	local v14 = v8.TutorialData.Missions.WelcomeToHorseLife.Missions["1"].Value
	local v15 = v8.PlayerData.Animals:GetChildren()
	local v16 = v14 and v15[#v15].Name
	if not v14 then
		task.spawn(t.TweenInText, "Try <font color=\'rgb(80, 214, 255)\'>taming</font> and <font color=\'rgb(255, 148, 230)\'>breeding</font> on your own!")
		task.spawn(function() --[[ Line: 182 | Upvalues: t (ref), LocalPlayer (ref) ]]
			t.YieldForCurrentHorse()
			local WovenLasso = LocalPlayer.Backpack:FindFirstChild("WovenLasso")
			if not WovenLasso then
				return
			end
			LocalPlayer.Character.Humanoid:EquipTool(WovenLasso)
		end)
		task.spawn(function() --[[ Line: 192 | Upvalues: v1 (ref), Tutorial (ref), v2 (ref), v8 (ref), v6 (ref), RunService (ref), v16 (ref), v5 (ref) ]]
			local v12 = v1.new(Tutorial.HorseSpawn, {
				MobType = "Horse"
			})
			local v22 = false
			local tbl = {}
			for i = 1, 3 do
				local v3 = i * 10
				local v4 = v12:SpawnMob({
					DoNotRespawn = true,
					SpeedMultiplier = 0.3,
					NoiseMultiplier = 0.8,
					TamingMaxPoints = 3,
					SlotInfo = v2.GetHorseSlotInfoForTame(v8, v3),
					OnTameCompleted = function() --[[ OnTameCompleted | Line: 207 | Upvalues: v22 (ref), v3 (copy) ]]
						v22 = v3
					end
				})
				local v52 = v6.getMobFromModel(v4.Model)
				local v62 = Tutorial.Highlight:Clone()
				v62.Enabled = true
				v62.Adornee = v52.CosmeticModel
				v62.Parent = v52.CosmeticModel
				v52.Maid:GiveTask(v62)
				tbl[i] = v4
			end
			repeat
				RunService.Heartbeat:Wait()
			until v22
			v2.PostTutorialStage("TamedHorse")
			for k, v in pairs(tbl) do
				if v and (v.Destroy and not v.GivenRewards) then
					v:Destroy()
				end
			end
			v16 = v5.GetRemoteFunction("TameTutorialHorseRemote"):InvokeServer(v22)
		end)
	end
	local v17 = if v8:GetStatValue("HorsesSold").Value > 0 then true else false
	if not v17 and v8:GetABTestState("SkipSellStage", "1") == "1" then
		task.spawn(function() --[[ Line: 240 | Upvalues: RunService (ref), v16 (ref), v2 (ref), p1 (copy), WelcomeToHorseLife (copy), t (ref), ReplicatedStorage (ref), v4 (ref), v8 (ref) ]]
			repeat
				RunService.Heartbeat:Wait()
			until v16
			v2.PostTutorialStage("SoldHorse")
			if p1.AfterInit and not WelcomeToHorseLife.Missions["1"].Value or not p1.AfterInit then
				task.spawn(t.TweenInText, "You can <font color=\'rgb(238, 94, 115)\'>sell</font> for money!")
				ReplicatedStorage.Storage.SFX.QuestComplete1:Play()
				ReplicatedStorage.Storage.SFX.QuestComplete2:Play()
				v4:DisplaySlot({
					Type = "Tamed",
					AllowNaming = false,
					ShowMaxWarning = true,
					MobileClickBackgroundToClose = false,
					ShowTameContestPoints = false,
					FullViewportSize = true,
					HideTopFrame = true,
					DismissDelay = 1.5,
					Slot = v8:GetItemFolder("Animals"):WaitForChild(v16)
				})
				v4.YieldForNoDisplay()
			end
		end)
	elseif not v17 then
		task.spawn(function() --[[ Line: 266 | Upvalues: RunService (ref), v16 (ref), v8 (ref), t (ref), ReplicatedStorage (ref), v3 (ref), PlayerGui (ref), v2 (ref), v4 (ref) ]]
			repeat
				RunService.Heartbeat:Wait()
			until v16
			v8.Character.Humanoid:UnequipTools()
			task.spawn(t.TweenInText, "<font color=\'rgb(138, 255, 167)\'>Sell</font> the horse for money!")
			ReplicatedStorage.Storage.SFX.QuestComplete1:Play()
			ReplicatedStorage.Storage.SFX.QuestComplete2:Play()
			local t2 = {}
			t2[#t2 + 1] = v3.SetGuiPointTo({
				Direction = "Down",
				Offset = -3,
				GuiElement = PlayerGui.DisplayAnimalGui.ContainerFrame.Content.BottomFrame:FindFirstChild("SellButton", true)
			})
			v2.SetGameElements({
				KeepHorseAction = false,
				SellingHorseAction = true
			})
			v4:DisplaySlot({
				Type = "Tamed",
				AllowNaming = false,
				ShowMaxWarning = true,
				MobileClickBackgroundToClose = false,
				ShowTameContestPoints = false,
				FullViewportSize = true,
				HideTopFrame = true,
				DismissDelay = 1.5,
				Slot = v8:GetItemFolder("Animals"):WaitForChild(v16)
			})
			v4.YieldForNoDisplay()
			v2.SetGameElements({
				KeepHorseAction = true,
				SellingHorseAction = true,
				Currency = true
			})
			v2.PostTutorialStage("SoldHorse")
			for v1, v22 in t2 do
				v22()
			end
		end)
	end
	task.spawn(function() --[[ Line: 311 | Upvalues: WelcomeToHorseLife (copy), PlayerGui (ref), v3 (ref), v4 (ref), t (ref), yieldForDisplayThenNoDisplay (ref), yieldUntilAnyMissionClaimed (ref), v2 (ref), v7 (ref), RunService (ref), yieldUntilAllMissionsClaimed (ref) ]]
		local t2 = {}
		local v1 = false
		for v22, v32 in WelcomeToHorseLife.Missions:GetChildren() do
			for v42, v5 in PlayerGui.PinnedMissionsGui.MissionsFrame:GetChildren() do
				local v6 = v5:WaitForChild("Tutorial-WelcomeToHorseLife-" .. v32.Name)
				t2[#t2 + 1] = v3.SetGuiPointTo({
					Direction = "Left",
					Offset = -3,
					GuiElement = v6:FindFirstChild("ClaimButton", true),
					NextElement = function() --[[ NextElement | Line: 322 | Upvalues: v4 (ref), v32 (copy), WelcomeToHorseLife (ref), v22 (copy) ]]
						if v4.GetDisplay() then
							return
						end
						if v32.Claimed.Value then
							return
						end
						local v1 = WelcomeToHorseLife.Missions:FindFirstChild(v22 + 1)
						if v1 and (v1.Value and not v1.Claimed.Value) then
						else
							return true
						end
					end
				})
			end
			local function promptMissionsToClaim(p1) --[[ promptMissionsToClaim | Line: 335 | Upvalues: v32 (copy), t (ref), v1 (ref), v22 (copy), yieldForDisplayThenNoDisplay (ref) ]]
				if v32.Value then
					t.SetProgressStep("Increment", 4)
				end
				if not v32.Value or v32.Claimed.Value then
					return
				end
				if v1 then
					return
				end
				v1 = true
				if v22 == 1 and not p1 then
					yieldForDisplayThenNoDisplay()
				end
				task.spawn(t.TweenInText, "We have missions to <font color=\'rgb(255, 213, 85)\'>claim</font>!")
			end
			v32:GetPropertyChangedSignal("Value"):Connect(promptMissionsToClaim)
			task.spawn(promptMissionsToClaim, true)
		end
		task.spawn(function() --[[ Line: 353 | Upvalues: WelcomeToHorseLife (ref), t (ref), yieldUntilAnyMissionClaimed (ref), v2 (ref), v7 (ref), RunService (ref), yieldForDisplayThenNoDisplay (ref) ]]
			local v1 = WelcomeToHorseLife
			local v22
			if v1.Completed.Value then
				v22 = true
			else
				v22 = true
				for v3, v4 in v1.Missions:GetChildren() do
					if not v4.Value then
						v22 = nil
						break
					end
				end
			end
			if not v22 then
				local v5 = yieldUntilAnyMissionClaimed(WelcomeToHorseLife)
				v2.PostTutorialStage("AnyTutorialMissionClaimed")
				if not v5 then
					t.YieldForTweenCompleted()
					task.spawn(t.TweenOutDialogue)
					return
				end
				if tonumber(v5.Name) == 1 then
					if not WelcomeToHorseLife.Missions["2"].Value then
						v7:TrackPinned({
							ID = "Tutorial-WelcomeToHorseLife-2"
						})
						task.spawn(t.TweenInText, "<font color=\'rgb(255, 148, 230)\'>Breed</font> a horse to finish your mission!")
						repeat
							RunService.Heartbeat:Wait()
						until WelcomeToHorseLife.Missions["2"].Value
					end
				else
					t.YieldForTweenCompleted()
					if not WelcomeToHorseLife.Missions["1"].Value then
						task.spawn(t.TweenInText, "Now <font color=\'rgb(80, 214, 255)\'>tame</font> a new horse!")
						v7:TrackPinned({
							ID = "Tutorial-WelcomeToHorseLife-1"
						})
						repeat
							RunService.Heartbeat:Wait()
						until WelcomeToHorseLife.Missions["1"].Value
						yieldForDisplayThenNoDisplay()
					end
				end
			end
			task.spawn(t.TweenInText, "<font color=\'rgb(255, 213, 85)\'>Claim</font> the rest of your rewards!")
		end)
		task.spawn(t.YieldForConditionThenPost, "BreedingTutorialMissionCompleted", function() --[[ Line: 393 | Upvalues: WelcomeToHorseLife (ref) ]]
			return WelcomeToHorseLife.Missions["2"].Value
		end)
		task.spawn(function() --[[ Line: 397 | Upvalues: RunService (ref), WelcomeToHorseLife (ref), yieldForDisplayThenNoDisplay (ref) ]]
			repeat
				RunService.Heartbeat:Wait()
			until WelcomeToHorseLife.Completed.Value
			yieldForDisplayThenNoDisplay()
		end)
		yieldUntilAllMissionsClaimed(WelcomeToHorseLife)
		t.SetProgressStep(8)
		t.StartSequence("ForageFeeding", {
			PreviousStage = function() --[[ PreviousStage | Line: 408 | Upvalues: t2 (copy), t (ref) ]]
				for v1, v2 in t2 do
					v2()
				end
				t.SetTutorialStageRemote:InvokeServer("ForageFeeding")
			end
		})
	end)
end
return t