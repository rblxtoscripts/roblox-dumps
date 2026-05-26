-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("GuiUtils")
local v3 = Sonar("GuiManager")
local v4 = Sonar("Resource")
local v5 = Sonar("ContextualUtils")
local v6 = Sonar("TutorialService")
local v7 = Sonar("InventoryGui")
local v8 = Sonar("QuickFeedGui")
local v9 = Sonar("RemoteUtils")
local v10 = Sonar("DisplayAnimalClient")
local v11 = Sonar("InputTypeDetector")
local v12 = Sonar("AnimalDataService")
local v13 = Sonar("TrackObjectiveClient")
local v14 = Sonar("ToolTipClient")
Sonar("Constants")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v15 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local v16 = v1.new()
local Tutorial = ReplicatedStorage.Storage.Assets.Tutorial
local Highlight = Tutorial.Highlight
local function yieldUntilAllMissionsClaimed(p1) --[[ yieldUntilAllMissionsClaimed | Line: 39 | Upvalues: RunService (copy) ]]
	local v1 = false
	while not v1 do
		v1 = p1.Claimed.Value and true or false
		for v2, v3 in p1.Missions:GetChildren() do
			if not v3.Claimed.Value then
				v1 = false
			end
		end
		RunService.Heartbeat:Wait()
	end
end
local function yieldUntilAnyMissionClaimed(p1) --[[ yieldUntilAnyMissionClaimed | Line: 55 | Upvalues: RunService (copy) ]]
	if p1.Claimed.Value then
		return true
	end
	for v1, v2 in p1.Missions:GetChildren() do
		if v2.Claimed.Value then
			return v2
		end
	end
	while not p1.Claimed.Value do
		for v3, v4 in p1.Missions:GetChildren() do
			if v4.Claimed.Value then
				return v4
			end
		end
		RunService.Heartbeat:Wait()
	end
	return true
end
local function yieldForInventoryGridButton(p1) --[[ yieldForInventoryGridButton | Line: 82 | Upvalues: PlayerGui (copy), RunService (copy) ]]
	local v1
	repeat
		v1 = PlayerGui.InventoryGui.ContainerFrame.Menu.Content.Items:FindFirstChild(p1, true)
		RunService.Heartbeat:Wait()
	until v1
	return v1
end
local function getHorseWithChildAndGestation() --[[ getHorseWithChildAndGestation | Line: 91 | Upvalues: v15 (copy) ]]
	for v1, v2 in v15.PlayerData.Animals:GetChildren() do
		if #v2.Child.Value > 0 then
			return v2
		end
	end
end
local function yieldForGestationHorseGridButton() --[[ yieldForGestationHorseGridButton | Line: 99 | Upvalues: v15 (copy), PlayerGui (copy), RunService (copy) ]]
	local v1
	repeat
		local v2 = nil
		for v3, v4 in v15.PlayerData.Animals:GetChildren() do
			if #v4.Child.Value > 0 then
				v2 = v4
				break
			end
		end
		v1 = PlayerGui.QuickFeedGui.ContainerFrame.Menu.Content.HorseSelect.Horses:FindFirstChild(v2.Name, true)
		RunService.Heartbeat:Wait()
	until v1
	return v1
end
local function yieldForGestationOver(p1) --[[ yieldForGestationOver | Line: 109 | Upvalues: v15 (copy), RunService (copy), v12 (copy) ]]
	local v1 = v15:GetItemValue("Apple")
	local v2 = v1.Value
	repeat
		RunService.Heartbeat:Wait()
		if v12.GetBirthTimeLeft(v15, p1) <= 0 then
			break
		end
		if v2 < v1.Value then
			v2 = v1.Value
		end
	until v1.Value < v2
end
local function getClosestResource(p1) --[[ getClosestResource | Line: 130 | Upvalues: v4 (copy), v15 (copy) ]]
	local v1 = 9000000000
	local v2 = nil
	for k, v in pairs(v4.GetAll()) do
		if k.IsLocal and (k.Destroy and (not p1 or k.Type == p1)) then
			local Magnitude = (v15.PrimaryPart.Position - k.Root:GetPivot().Position).Magnitude
			if Magnitude < v1 then
				v1 = Magnitude
				v2 = k
			end
		end
	end
	return v2
end
function t.Start(p1) --[[ Start | Line: 151 | Upvalues: t (copy), v15 (copy), v2 (copy), v11 (copy), Tutorial (copy), v4 (copy), v9 (copy), v16 (copy), v5 (copy), RunService (copy), getClosestResource (copy), LocalPlayer (copy), Highlight (copy), v6 (copy), PlayerGui (copy), v3 (copy), yieldForInventoryGridButton (copy), v7 (copy), yieldForGestationHorseGridButton (copy), v8 (copy), v14 (copy), yieldForGestationOver (copy), yieldUntilAnyMissionClaimed (copy), v13 (copy), v10 (copy), yieldUntilAllMissionsClaimed (copy) ]]
	if p1.PreviousStage then
		p1.PreviousStage()
	else
		t.YieldForClientLoaded()
		task.spawn(t.YieldForHorseAndMount, {
			MoveToStart = true
		})
	end
	local Horse = v15.PlayerData.Missions.SpeciesUnlocks.Horse
	t.InitHUDandControls({
		PinnedMissions = true,
		BottomFrame = true,
		ItemStream = true,
		SideFrame = true,
		Stables = true,
		Journal = true,
		SellHorsesAction = false,
		KeepHorseAction = true,
		UnequipHotbarAction = true,
		KeepFrameOpenOnBreed = true,
		OpenHUDOnBreed = true,
		ResourceHarvesting = "Local",
		RenderGlobalMobs = true,
		OpenBreedingFromStablesHUD = false,
		AutoFillHorsesInBreeding = true,
		TrackObjective = false,
		UntrackObjective = false,
		FullViewportDisplaySize = true,
		HideDisplayTopFrame = true,
		HarvestingRange = 300,
		HarvestingHitboxScale = 3,
		DismountAction = true
	})
	t.SetProgressStep(8)
	task.spawn(v2.SetChatVisibility, not v11.IsMobileInputType())
	if p1.AfterInit then
		p1.AfterInit()
	end
	local v1 = false
	if if Horse and (Horse:FindFirstChild("Missions") and Horse.Missions:FindFirstChild("1")) then if Horse.Missions["1"].Value == true then true else false else false then
		t.SetProgressStep(9)
	end
	if v15:GetStatValue("HorsesFed").Value > 0 then
		v1 = true
	end
	if v1 then
		t.SetProgressStep(10)
	end
	if not Horse.Missions["1"].Value then
		if p1.PreviousStage then
			t.YieldForTweenCompleted()
		end
		task.spawn(t.TweenInText, string.format("Get some food!\n<font color=\'rgb(80, 214, 255)\'>%s</font> on it to harvest!", if v11.IsMobileInputType() then "Tap" else "Click"))
		v15.Character.Humanoid:UnequipTools()
		local v42 = false
		local v52 = Tutorial.AppleBarrel:Clone()
		v52.Parent = workspace.Interactions.Resource
		local v62 = v4.new(v52, {
			IsLocal = true,
			MaxHealth = 2,
			OnHarvested = function(p1) --[[ OnHarvested | Line: 249 | Upvalues: v9 (ref), v42 (ref) ]]
				if v9.GetRemoteFunction("HarvestTutorialNodeRemote"):InvokeServer(p1) ~= true then
					return
				end
				v42 = true
			end
		})
		local v72 = nil
		local v82 = nil
		v16:GiveTask(v5.ClearBeams)
		v16:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 259 | Upvalues: v82 (ref), getClosestResource (ref), v72 (ref), v5 (ref), LocalPlayer (ref), Highlight (ref) ]]
			v82 = getClosestResource("AppleBarrel")
			if not v82 then
				return
			end
			v72 = v72 or v5.FromPlayer(LocalPlayer, v82.PrimaryPart, {
				CenterOfPart = true
			})
			v72.Beam1.Enabled = true
			Highlight.Adornee = v82.Root
		end))
		v16:GiveTask(v62)
		local v92 = v5.SetWorldspaceClickPointTo({
			ShowPrompt = true,
			StudsOffsetWorldSpace = Vector3.new(0, 10, 0),
			Adornee = function() --[[ Adornee | Line: 275 | Upvalues: v82 (ref) ]]
				return v82 and v82.PrimaryPart
			end,
			CheckVisibility = function() --[[ CheckVisibility | Line: 278 | Upvalues: v82 (ref), v15 (ref) ]]
				if not v82 then
					return
				end
				if not v82.PrimaryPart then
					return
				end
				return (v82.PrimaryPart.Position - v15.PrimaryPart.Position).Magnitude < 85
			end
		})
		repeat
			RunService.Heartbeat:Wait()
		until v82 and v82.Targetted
		v6.PostTutorialStage("StartedHarvesting")
		v92()
		repeat
			RunService.Heartbeat:Wait()
		until v42
		v16:DoCleaning()
		t.SetProgressStep(9)
		v6.PostTutorialStage("FinishedHarvesting")
		v6.SetGameElements({
			ResourceHarvesting = true
		})
	end
	local v102 = if v15:GetStatValue("HorsesFed").Value > 0 then true else false
	if not v102 then
		task.spawn(t.TweenInText, "<font color=\'rgb(200, 255, 112)\'>Feed</font> it to your horse!")
		v6.SetGameElements({
			Inventory = true
		})
		local t2 = {}
		t2[#t2 + 1] = v5.SetGuiPointTo({
			Direction = "Right",
			Offset = -3,
			GuiElement = PlayerGui.HUDGui.MobileRightFrame.Core.Buttons.Inventory,
			NextElement = PlayerGui.InventoryGui.ContainerFrame
		})
		for v112, v12 in PlayerGui.HUDGui.RightFrame:GetChildren() do
			local Inventory = v12:FindFirstChild("Inventory", true)
			t2[#t2 + 1] = v5.SetGuiPointTo({
				Direction = "Right",
				Offset = -3,
				GuiElement = Inventory,
				NextElement = PlayerGui.InventoryGui.ContainerFrame
			})
		end
		repeat
			RunService.Heartbeat:Wait()
		until v3.IsFrameOpen(PlayerGui.InventoryGui.ContainerFrame)
		v6.PostTutorialStage("InventoryGuiOpened")
		v16:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 334 | Upvalues: v3 (ref), PlayerGui (ref), t (ref) ]]
			if v3.IsFrameOpen(PlayerGui.QuickFeedGui.ContainerFrame) then
				t.SetTalkFramePosition(UDim2.new(0.5, 0, 0, 0), Vector2.new(0.5, 0))
				return
			end
			if v3.IsFrameOpen(PlayerGui.InventoryGui.ContainerFrame) then
				t.SetTalkFramePosition(UDim2.new(0.01, 5, 0.955, 0), Vector2.new(0, 1))
			else
				t.SetTalkFramePosition()
			end
		end))
		local v132 = yieldForInventoryGridButton("Apple")
		t2[#t2 + 1] = v5.SetGuiPointTo({
			Direction = "Left",
			Offset = -4,
			GuiElement = v132,
			NextElement = function() --[[ NextElement | Line: 351 | Upvalues: v7 (ref) ]]
				local v1 = v7.GetSelectedItem()
				if not v1 then
					return true
				end
				return v1.Name ~= "Apple"
			end
		})
		task.spawn(t.YieldForConditionThenPost, "InventoryItemSelected", function() --[[ Line: 360 | Upvalues: v7 (ref) ]]
			local v1 = v7.GetSelectedItem()
			return if v1 then v1.Name == "Apple" else v1
		end)
		local Feed = PlayerGui.InventoryGui.ContainerFrame.Menu.Content.Info.Content.Buttons:FindFirstChild("Feed")
		t2[#t2 + 1] = v5.SetGuiPointTo({
			Direction = "Right",
			Offset = -4,
			GuiElement = Feed,
			NextElement = PlayerGui.QuickFeedGui.ContainerFrame
		})
		repeat
			RunService.Heartbeat:Wait()
		until v3.IsFrameOpen(PlayerGui.QuickFeedGui.ContainerFrame)
		v6.PostTutorialStage("FeedButtonPressed")
		for v142, v152 in t2 do
			v152()
		end
		local t3 = {}
		local v162 = yieldForGestationHorseGridButton()
		local v17 = v15.PlayerData.Animals:FindFirstChild(v162.Name)
		v8.SelectSlot(v17)
		task.spawn(t.YieldForConditionThenPost, "QuickFeedHorseSelected", function() --[[ Line: 389 | Upvalues: v8 (ref), v162 (copy) ]]
			local v1 = v8.GetSelectedSlot()
			return if v1 then v1.Name == v162.Name else v1
		end)
		t3[#t3 + 1] = v5.SetGuiPointTo({
			Direction = "Left",
			Offset = -4,
			GuiElement = v162,
			NextElement = function() --[[ NextElement | Line: 397 | Upvalues: v8 (ref), v162 (copy) ]]
				local v1 = v8.GetSelectedSlot()
				if not v1 then
					return true
				end
				return v1.Name ~= v162.Name
			end
		})
		t3[#t3 + 1] = v5.SetGuiPointTo({
			Direction = "Left",
			Offset = -4,
			GuiElement = function() --[[ GuiElement | Line: 404 | Upvalues: v8 (ref), v162 (copy), v14 (ref) ]]
				local v1 = v8.GetSelectedSlot()
				if not v1 then
					return
				end
				if v1.Name ~= v162.Name then
					return
				end
				local v2 = v14:GetTip()
				if v2 then
					return v2.TipFrame:FindFirstChild("Feed", true)["1"]
				end
			end
		})
		yieldForGestationOver(v17)
		t.SetProgressStep(10)
		v6.PostTutorialStage("QuickFeedItemUsed")
		for v18, v19 in t3 do
			v19()
		end
		task.spawn(t.TweenInText, "<font color=\'rgb(200, 255, 112)\'>Feeding</font> horses lower their <font color=\'rgb(255, 148, 230)\'>breed cooldowns</font>!")
		v6.SetGameElements({
			EquipInventoryAction = true
		})
		t.YieldForTweenCompleted()
		t3[#t3 + 1] = v5.SetGuiPointTo({
			Direction = "Right",
			Offset = -4,
			GuiElement = PlayerGui.InventoryGui.ContainerFrame.Menu.CloseButton,
			NextElement = function() --[[ NextElement | Line: 434 | Upvalues: PlayerGui (ref) ]]
				return PlayerGui.InventoryGui.ContainerFrame.Visible
			end
		})
		repeat
			RunService.Heartbeat:Wait()
		until not v3.IsFrameOpen(PlayerGui.InventoryGui.ContainerFrame)
		v6.PostTutorialStage("InventoryGuiClosed")
		for v20, v21 in t3 do
			v21()
		end
		v3.CloseFrame(PlayerGui.QuickFeedGui.ContainerFrame)
	end
	task.spawn(t.TweenInText, "<font color=\'rgb(255, 213, 85)\'>Complete</font> the rest of your missions!")
	v6.SetGameElements({
		TrackObjective = true,
		UntrackObjective = true,
		Inventory = true,
		EquipInventoryAction = true,
		OpenBreedingFromStablesHUD = true
	})
	task.spawn(function() --[[ Line: 458 | Upvalues: Horse (copy), t (ref), v16 (ref), yieldUntilAnyMissionClaimed (ref), v13 (ref), PlayerGui (ref), v5 (ref) ]]
		local count = 0
		for v1, v2 in Horse.Missions:GetChildren() do
			if v2.Claimed.Value then
				count = count + 1
			end
		end
		if Horse.Claimed.Value then
			count = count + 1
		end
		if count > 0 then
			t.SetProgressStep(count + 10)
		end
		local function incrementMissionCompletedStep(p1) --[[ incrementMissionCompletedStep | Line: 480 | Upvalues: t (ref) ]]
			if not p1.Claimed.Value then
				return
			end
			t.SetProgressStep("Increment")
		end
		for v3, v4 in Horse.Missions:GetChildren() do
			v16:GiveTask(v4.Claimed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 487 | Upvalues: v4 (copy), t (ref) ]]
				if not v4.Claimed.Value then
					return
				end
				t.SetProgressStep("Increment")
			end))
		end
		v16:GiveTask(Horse.Claimed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 492 | Upvalues: Horse (ref), t (ref) ]]
			if not Horse.Claimed.Value then
				return
			end
			t.SetProgressStep("Increment")
		end))
		yieldUntilAnyMissionClaimed(Horse)
		if v13:GetObjective() then
			return
		end
		for v52, v6 in Horse.Missions:GetChildren() do
			if not v6.Value then
				v13:TrackPinned({
					ID = "SpeciesUnlocks-Horse-" .. v52
				})
				if v52 ~= 2 then
					break
				end
				local t2 = {}
				for v7, v8 in PlayerGui.HUDGui.BottomFrame:GetChildren() do
					local Slot1 = v8:FindFirstChild("Slot1", true)
					if Slot1 then
						t2[#t2 + 1] = v5.SetGuiPointTo({
							Direction = "Down",
							Offset = -3,
							GuiElement = Slot1
						})
					end
				end
				t.YieldForEquippedTool("WovenLasso")
				for v9, v10 in t2 do
					v10()
				end
				return
			end
		end
	end)
	local t2 = {}
	for v222, v23 in PlayerGui.PinnedMissionsGui.MissionsFrame:GetChildren() do
		local v24 = v23:WaitForChild("SpeciesUnlocks-Horse")
		t2[#t2 + 1] = v5.SetGuiPointTo({
			Direction = "Left",
			Offset = -3,
			GuiElement = v24:FindFirstChild("ClaimButton", true),
			NextElement = function() --[[ NextElement | Line: 534 | Upvalues: v10 (ref), Horse (copy) ]]
				if v10.GetDisplay() then
					return
				end
				if Horse.Claimed.Value then
				else
					return true
				end
			end
		})
		for v25, v26 in Horse.Missions:GetChildren() do
			local v27 = v23:WaitForChild("SpeciesUnlocks-Horse-" .. v26.Name)
			t2[#t2 + 1] = v5.SetGuiPointTo({
				Direction = "Left",
				Offset = -3,
				GuiElement = v27:FindFirstChild("ClaimButton", true),
				NextElement = function() --[[ NextElement | Line: 546 | Upvalues: v10 (ref), Horse (copy), v26 (copy), v25 (copy) ]]
					if v10.GetDisplay() then
						return
					end
					if Horse.Completed.Value and not Horse.Claimed.Value then
						return
					end
					if v26.Claimed.Value then
						return
					end
					local v1 = Horse.Missions:FindFirstChild(v25 + 1)
					if v1 and (v1.Value and not v1.Claimed.Value) then
					else
						return true
					end
				end
			})
		end
	end
	task.spawn(t.YieldForConditionThenPost, "AnyHorseMissionClaimed", function() --[[ Line: 563 | Upvalues: Horse (copy) ]]
		if Horse.Claimed.Value then
			return true
		end
		for v1, v2 in Horse.Missions:GetChildren() do
			if v2.Claimed.Value then
				return true
			end
		end
	end)
	yieldUntilAllMissionsClaimed(Horse)
	t.SetProgressStep(14)
	for v28, v29 in t2 do
		v29()
	end
	v16:DoCleaning()
	t.SetTalkFramePosition()
	t.EndPrimaryTutorial()
	v10.YieldForNoDisplay()
	task.spawn(t.TweenInText, "You\'re an expert.\nTrack your progress in the <font color=\'rgb(208, 126, 255)\'>Quests</font> journal!", true)
	t.YieldForTweenCompleted()
	task.delay(4, function() --[[ Line: 587 | Upvalues: t (ref) ]]
		t.TweenOutDialogue()
	end)
end
return t