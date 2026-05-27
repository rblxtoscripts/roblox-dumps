-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("GuiManager")
local v3 = Sonar("PromptClient")
local v4 = Sonar("TabManager")
local v5 = Sonar("ItemDataService")
local v6 = Sonar("ViewportModel")
local v7 = Sonar("Maid")
local v8 = Sonar("Button")
local v9 = Sonar("StatBar")
local v10 = Sonar("AnimalCosmetics")
local v11 = Sonar("FormatNumber")
local v12 = Sonar("DisplayUtils")
local v13 = Sonar("MissionsService")
local v14 = Sonar("IssueResponseClient")
local v15 = Sonar("ToolTipClient")
local v16 = Sonar("DynamicNPCService")
local v17 = Sonar("TimeUtils")
local v18 = Sonar("NotificationsClient")
local v19 = Sonar("RemoteUtils")
local v20 = Sonar("GuiUtils")
local v21 = Sonar("StoryClient")
local v22 = Sonar("MarketplaceUtils")
local v23 = Sonar("TutorialClient")
local v24 = Sonar("Signal")
local v25 = Sonar("InputTypeDetector")
local v26 = Sonar("BreedUtils")
local v27 = Sonar("StorageUtils")
local v28 = Sonar("Constants")
local v29 = Sonar(v27.Get("SpeciesUnlocks"))
local v30 = v13.GetType("StoryMissions")
local v31 = v13.GetType("StreakMissions")
local v32 = Sonar(v27.Get("StreakTiers"))
local Colors = v28.Colors
t.CloseSignal = v24.new()
local LocalPlayer = game:GetService("Players").LocalPlayer
local v33 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local JournalGui = PlayerGui:WaitForChild("JournalGui")
local ContainerFrame = JournalGui:WaitForChild("ContainerFrame")
local Selected = ContainerFrame.Menu.TabFrames.Horses.Content.Selected
local v34 = ContainerFrame.Menu.TabFrames.Story.Content
local HUDGui = PlayerGui:WaitForChild("HUDGui")
local v35 = v7.new()
local v36 = v7.new()
local v37 = nil
local function createSpeciesViewport(p1, p2, p3, p4) --[[ createSpeciesViewport | Line: 65 | Upvalues: v7 (copy), v13 (copy), v33 (copy), Sonar (copy), v6 (copy), v10 (copy) ]]
	local v1 = v7.new()
	local v2 = v13.GetSlotInfoForMission(v33, {
		Species = p2.Name,
		SlotInfo = p3,
		SeedOffset = p4
	})
	for k, v in pairs({ p1, p1:FindFirstChild("Viewport") }) do
		local v3, v4 = Sonar("AnimalRiggerService").CreateAnimalModel({
			SlotValue = v2
		})
		v3.Parent = v
		v1:GiveTask(v3)
		local Camera = Instance.new("Camera")
		Camera.Parent = v
		v.CurrentCamera = Camera
		v1:GiveTask(Camera)
		Camera.FieldOfView = 1
		Camera.CFrame = v6(v3, v, -130, -8)
		local Eyelid = v3:FindFirstChild("Eyelid")
		if Eyelid then
			Eyelid:Destroy()
		end
		v.Ambient = Color3.fromRGB(192, 192, 192)
		v.LightDirection = Camera.CFrame.LookVector
		v1:GiveTask(v10.new(v3, {
			InViewport = true,
			SlotValue = v2
		}))
		v1:GiveTask(v4)
	end
	return v1
end
local function createNPCViewport(p1, p2) --[[ createNPCViewport | Line: 106 | Upvalues: v7 (copy), v6 (copy) ]]
	local v1 = v7.new()
	for k, v in pairs({ p1, p1:FindFirstChild("Viewport") }) do
		local v2 = p2:Clone()
		v2.Parent = v
		v1:GiveTask(v2)
		local Camera = Instance.new("Camera")
		Camera.Parent = v
		v.CurrentCamera = Camera
		v1:GiveTask(Camera)
		Camera.FieldOfView = 1
		Camera.CFrame = v6(v2.Head, v, -130, -8)
		v.Ambient = Color3.fromRGB(192, 192, 192)
		v.LightDirection = Camera.CFrame.LookVector
	end
	return v1
end
local function findClosestObject(p1, p2, p3, p4) --[[ findClosestObject | Line: 127 ]]
	if not (p1 and p1:IsA("Folder")) then
		warn("Invalid folder provided")
		return nil
	end
	if not p2 or typeof(p2) ~= "Vector3" then
		warn("Invalid reference point provided")
		return nil
	end
	if p3 and type(p3) ~= "number" then
		warn("Invalid minimum distance provided")
		return nil
	end
	local v1 = (1 / 0)
	local v2 = nil
	for i, v in ipairs(p1:GetChildren()) do
		if v:IsA("Model") or v:IsA("BasePart") then
			local Magnitude = ((v:IsA("Model") and v:GetPivot().Position or v:GetPivot().Position) - p2).Magnitude
			if (p3 or 0) <= Magnitude and (Magnitude < v1 and (not p4 or v.Name == p4)) then
				v1 = Magnitude
				v2 = v
			end
		end
	end
	return v2, v1
end
local t2 = {
	Horse = {
		Tame = {
			OnClaim = function() --[[ OnClaim | Line: 166 | Upvalues: v23 (copy) ]]
				v23.SetGuiWorldspacePointTo(function() --[[ Line: 167 ]]
					return workspace.Interactions.Shop:GetPivot().Position
				end, "Head to the <font color=\"#fff64d\">Store</font> to buy <font color=\"#fff64d\">1 Lasso</font>!", true, false)
			end
		}
	},
	Pony = {
		BuyItem = {
			OnClaim = function() --[[ OnClaim | Line: 176 | Upvalues: findClosestObject (copy), LocalPlayer (copy), v25 (copy), v23 (copy), Sonar (copy) ]]
				local v1, _ = findClosestObject(workspace.Interactions.Resource, LocalPlayer.Character:GetPivot().Position, 100, "AppleBarrel")
				local v2 = v25.IsMobileInputType()
				local v3 = v25.IsGamepadInputType()
				local v4 = "<font color=\"#fff64d\">Left click</font> on the <font color=\"#fff64d\">Apple Barrel</font> to harvest!"
				if v2 then
					v4 = "<font color=\"#fff64d\">Tap</font> on the <font color=\"#fff64d\">Apple Barrel</font> to harvest!"
				elseif v3 then
					v4 = "<font color=\"#fff64d\">Button X</font> on the <font color=\"#fff64d\">Apple Barrel</font> to harvest!"
				end
				v23.SetGuiWorldspacePointTo(function() --[[ Line: 190 | Upvalues: v1 (copy) ]]
					return v1:GetPivot().Position
				end, v4, true, false)
				Sonar("CharacterUtils").unequipTools(LocalPlayer)
			end
		},
		HarvestNode = {
			OnClaim = function() --[[ OnClaim | Line: 199 | Upvalues: v23 (copy) ]]
				v23.SetGuiWorldspacePointTo(function() --[[ Line: 200 ]]
					return workspace.Interactions.HelpSign:GetPivot().Position
				end, "Head to the <font color=\"#fff64d\">Help Sign</font> at spawn!", true, false)
			end
		}
	},
	Equus = {
		Breed = {
			OnPin = function() --[[ OnPin | Line: 209 | Upvalues: v23 (copy) ]]
				v23.SetGuiWorldspacePointTo(function() --[[ Line: 210 ]]
					return workspace.Interactions.AnimalBreeding:GetPivot().Position
				end, "Head to the <font color=\"#fff64d\">Breeding Station</font> at spawn!", true, false)
			end
		}
	}
}
local function claimSpeciesUnlockMissionReward(p1, p2) --[[ claimSpeciesUnlockMissionReward | Line: 218 | Upvalues: v13 (copy), v33 (copy), v14 (copy), v29 (copy), Sonar (copy), t2 (copy) ]]
	local v1 = v13.CanClaimSpeciesUnlockMission(v33, p1, p2)
	if v1 ~= true then
		v14.NotifyIssue(v1)
		return
	end
	local v2 = v29.Missions[p1].Missions[p2]
	local v3 = v13.ClaimSpeciesUnlockMission(p1, p2)
	if v3 and v3 ~= true then
		task.wait()
		Sonar("DisplayAnimalClient"):DisplaySlot({
			Type = "Claimed",
			AllowNaming = true,
			ShowMaxWarning = true,
			MobileClickBackgroundToClose = true,
			Slot = v33:GetItemFolder("Animals"):WaitForChild(v3)
		})
	end
	if v3 ~= true or not (v2 and (t2[p1] and (t2[p1][v2.Type] and t2[p1][v2.Type].OnClaim))) then
		return
	end
	t2[p1][v2.Type].OnClaim()
end
local function claimOneTimeMissionReward(p1, p2) --[[ claimOneTimeMissionReward | Line: 246 | Upvalues: v13 (copy), v33 (copy), v14 (copy), Sonar (copy) ]]
	local v1 = v13.CanClaimOneTimeMission(v33, p1, p2)
	if v1 ~= true then
		v14.NotifyIssue(v1)
		return
	end
	local v2 = v13.ClaimOneTimeMission(p1, p2)
	if not v2 or v2 == true then
		return
	end
	task.wait()
	Sonar("DisplayAnimalClient"):DisplaySlot({
		Type = "Claimed",
		AllowNaming = true,
		ShowMaxWarning = true,
		MobileClickBackgroundToClose = true,
		Slot = v33:GetItemFolder("Animals"):WaitForChild(v2)
	})
end
local function claimSpeciesMissionReward(p1, p2) --[[ claimSpeciesMissionReward | Line: 266 | Upvalues: v13 (copy), v33 (copy), v14 (copy), Sonar (copy) ]]
	local v1 = v13.CanClaimSpeciesMission(v33, p1, p2)
	if v1 ~= true then
		v14.NotifyIssue(v1)
		return
	end
	local v2 = v13.ClaimSpeciesMission(p1, p2)
	if not v2 or v2 == true then
		return
	end
	task.wait()
	Sonar("DisplayAnimalClient"):DisplaySlot({
		Type = "Claimed",
		AllowNaming = true,
		ShowMaxWarning = true,
		MobileClickBackgroundToClose = true,
		Slot = v33:GetItemFolder("Animals"):WaitForChild(v2[1])
	})
end
local function claimStoryMissionReward(...) --[[ claimStoryMissionReward | Line: 286 | Upvalues: v13 (copy), v33 (copy), v14 (copy) ]]
	local v1 = v13.CanClaimStoryMission(v33, ...)
	if v1 == true then
		v13.ClaimStoryMission(...)
	else
		v14.NotifyIssue(v1)
	end
end
local function claimStreakMissionReward(p1, p2) --[[ claimStreakMissionReward | Line: 295 | Upvalues: v13 (copy), v33 (copy), v14 (copy) ]]
	local v1 = v13.CanClaimStreakMission(v33, p1, p2)
	if v1 == true then
		v13.ClaimStreakMission(p1, p2)
	else
		v14.NotifyIssue(v1)
	end
end
local function claimStreakReward() --[[ claimStreakReward | Line: 304 | Upvalues: v13 (copy), v33 (copy), v14 (copy), Sonar (copy) ]]
	local v1 = v13.CanClaimStreakReward(v33)
	if v1 ~= true then
		v14.NotifyIssue(v1)
		return
	end
	local v2 = v13.ClaimStreakReward()
	if not v2 or v2 == true then
		return
	end
	task.wait()
	for k, v in pairs(v2) do
		Sonar("DisplayAnimalClient"):DisplaySlot({
			Type = "Claimed",
			AllowNaming = true,
			ShowMaxWarning = true,
			MobileClickBackgroundToClose = true,
			Slot = v33:GetItemFolder("Animals"):WaitForChild(v2[1])
		})
		if Sonar("DisplayAnimalClient").YieldForNoDisplay() then
			task.wait(0.5)
		end
	end
end
local function isMissionUnclaimed(p1) --[[ isMissionUnclaimed | Line: 331 ]]
	if p1:FindFirstChild("Completed") then
		if not p1.Completed.Value then
			return
		end
	else
		if p1:IsA("Folder") then
			return
		end
		if not p1.Value then
			return
		end
	end
	if p1:FindFirstChild("Claimed") then
		return not p1.Claimed.Value
	end
end
local function v38(p1) --[[ getTotalUnclaimedForType | Line: 345 | Upvalues: isMissionUnclaimed (copy), v38 (copy) ]]
	local sum = 0
	if p1:FindFirstChild("Missions") then
		for k, v in pairs(p1.Missions:GetChildren()) do
			sum = sum + (if isMissionUnclaimed(v) then 1 else 0)
		end
	elseif p1:FindFirstChild("Stories") then
		for k, v in pairs(p1.Stories:GetChildren()) do
			sum = sum + v38(v)
		end
	end
	if isMissionUnclaimed(p1) then
		sum = sum + 1
	end
	return sum
end
local function getTotalUnclaimedForCategory(p1) --[[ getTotalUnclaimedForCategory | Line: 362 | Upvalues: v33 (copy), v38 (copy) ]]
	local v1 = v33.PlayerData.Missions[p1]
	local sum = 0
	for k, v in pairs((v1:FindFirstChild("Missions") or v1):GetChildren()) do
		sum = sum + v38(v)
	end
	return sum
end
local function getTotalUnclaimedForAll() --[[ getTotalUnclaimedForAll | Line: 372 | Upvalues: v33 (copy), v38 (copy) ]]
	local sum = 0
	for k, v in pairs(v33.PlayerData.Missions:GetChildren()) do
		if v.Name ~= "Achivements" then
			for k2, v2 in pairs(v:GetChildren()) do
				if v2.Name == "Missions" then
					for k3, v3 in pairs(v2:GetChildren()) do
						sum = sum + v38(v3)
					end
					continue
				end
				sum = sum + v38(v2)
			end
		end
	end
	return sum
end
local function v39(p1, p2, p3) --[[ startStoryMission | Line: 390 | Upvalues: v13 (copy), v33 (copy), v3 (copy), v39 (copy) ]]
	if not p3 then
		local v1 = v13.GetStartedStoryMissions(v33)
		if next(v1) then
			v3.Prompt({
				Type = "StartNewStoryMission",
				Setup = function(p1) --[[ Setup | Line: 396 | Upvalues: v1 (copy) ]]
					p1.Content.StoryLabel.Text = string.format("You already have progress in a story, %s!", v1[1].Data.DisplayName)
				end,
				Run = function() --[[ Run | Line: 399 | Upvalues: v39 (ref), p1 (copy), p2 (copy) ]]
					v39(p1, p2, true)
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 403 ]]
					return true
				end
			})
			return
		end
	end
	local v2 = v13.CanStartStoryMission(v33, p1, p2)
	if v2 == true then
		v13.StartStoryMission(p1, p2)
	else
		warn(v2)
	end
end
local function pinMission(...) --[[ pinMission | Line: 420 | Upvalues: v19 (copy) ]]
	return v19.GetRemoteFunction("PinMissionRemote"):InvokeServer(...)
end
local function setSelectedStoryMission(p1, p2, p3) --[[ setSelectedStoryMission | Line: 426 | Upvalues: v36 (copy), v30 (copy), v34 (copy), v17 (copy), v21 (copy), v20 (copy), v1 (copy), pinMission (copy), v39 (copy), claimStoryMissionReward (copy), v5 (copy), Sonar (copy), v8 (copy), v15 (copy), v13 (copy), v9 (copy) ]]
	v36:DoCleaning()
	if not p1 then
		return
	end
	local v12 = v30.Chapters[p1].Stories[p2]
	local Title = v34.QuestContent.Narrative.Title
	Title.Text = v12.DisplayName or "Story " .. p2
	v34.QuestContent.Narrative.Description.Text = v12.Description or "Description needed for story"
	local SceneImage = v34.QuestContent.Narrative.SceneImage
	SceneImage.Image = v12.Image or v34.QuestContent.Narrative.SceneImage.Image
	local function setReplayButton() --[[ setReplayButton | Line: 437 | Upvalues: p3 (copy), v17 (ref), v34 (ref) ]]
		v34.QuestContent.ReplayButton.Visible = if p3.Value - v17.Get() <= 0 then p3.Unlocked.Value and (not p3.Started.Value and p3.Claimed.Value) else false
		v34.QuestContent.ReplayNotice.Visible = v34.QuestContent.ReplayButton.Visible
	end
	v36:GiveTask(p3.Unlocked:GetPropertyChangedSignal("Value"):Connect(setReplayButton))
	v36:GiveTask(p3.Claimed:GetPropertyChangedSignal("Value"):Connect(setReplayButton))
	v36:GiveTask(p3.Started:GetPropertyChangedSignal("Value"):Connect(setReplayButton))
	local v4 = p3.Value - v17.Get()
	local ReplayButton = v34.QuestContent.ReplayButton
	ReplayButton.Visible = if v4 <= 0 then p3.Unlocked.Value and (not p3.Started.Value and p3.Claimed.Value) else false
	v34.QuestContent.ReplayNotice.Visible = v34.QuestContent.ReplayButton.Visible
	local function setStartButton() --[[ setStartButton | Line: 447 | Upvalues: v34 (ref), p3 (copy), v12 (copy) ]]
		v34.QuestContent.StartButton.Visible = p3.Unlocked.Value and not p3.Started.Value and not p3.Claimed.Value and not v12.Locked
	end
	v36:GiveTask(p3.Unlocked:GetPropertyChangedSignal("Value"):Connect(setStartButton))
	v36:GiveTask(p3.Claimed:GetPropertyChangedSignal("Value"):Connect(setStartButton))
	v36:GiveTask(p3.Started:GetPropertyChangedSignal("Value"):Connect(setStartButton))
	local StartButton = v34.QuestContent.StartButton
	StartButton.Visible = p3.Unlocked.Value and not p3.Started.Value and not p3.Claimed.Value and not v12.Locked
	local function setClaimButton() --[[ setClaimButton | Line: 455 | Upvalues: v34 (ref), p3 (copy) ]]
		v34.QuestContent.ClaimButton.Visible = p3.Completed.Value and not p3.Claimed.Value
		v34.QuestContent.ClaimNotice.Visible = v34.QuestContent.ClaimButton.Visible
	end
	v36:GiveTask(p3.Completed:GetPropertyChangedSignal("Value"):Connect(setClaimButton))
	v36:GiveTask(p3.Claimed:GetPropertyChangedSignal("Value"):Connect(setClaimButton))
	local ClaimButton = v34.QuestContent.ClaimButton
	ClaimButton.Visible = p3.Completed.Value and not p3.Claimed.Value
	v34.QuestContent.ClaimNotice.Visible = v34.QuestContent.ClaimButton.Visible
	local function setPinned() --[[ setPinned | Line: 464 | Upvalues: v34 (ref), p3 (copy), v21 (ref), v20 (ref) ]]
		v34.QuestContent.PinButton.Visible = p3.Pinned.Value or not p3.Completed.Value
		v34.QuestContent.PinButton.Top.CrossLabel.Visible = p3.Pinned.Value
		if p3.Pinned.Value then
			v21.EnableArrow(true)
		else
			v21.EnableArrow(false)
		end
		v20.SetButtonColor(v34.QuestContent.PinButton, "Diagonal", if p3.Pinned.Value then "Red" else "Blue")
	end
	v36:GiveTask(p3.Completed:GetPropertyChangedSignal("Value"):Connect(setPinned))
	v36:GiveTask(p3.Pinned:GetPropertyChangedSignal("Value"):Connect(setPinned))
	setPinned()
	v36:GiveTask(v1.new(v34.QuestContent.PinButton, {
		Click = function() --[[ Click | Line: 481 | Upvalues: pinMission (ref), p1 (copy), p2 (copy) ]]
			pinMission("StoryMissions", p1, p2)
		end
	}))
	v36:GiveTask(v1.new(v34.QuestContent.ReplayButton, {
		Click = function() --[[ Click | Line: 487 | Upvalues: v39 (ref), p1 (copy), p2 (copy) ]]
			v39(p1, p2)
		end
	}))
	v36:GiveTask(v1.new(v34.QuestContent.StartButton, {
		Click = function() --[[ Click | Line: 493 | Upvalues: v39 (ref), p1 (copy), p2 (copy) ]]
			v39(p1, p2)
		end
	}))
	v36:GiveTask(v1.new(v34.QuestContent.ClaimButton, {
		Click = function() --[[ Click | Line: 499 | Upvalues: claimStoryMissionReward (ref), p1 (copy), p2 (copy) ]]
			claimStoryMissionReward(p1, p2)
		end
	}))
	local function setTimerLabel() --[[ setTimerLabel | Line: 504 | Upvalues: p3 (copy), v17 (ref), v34 (ref) ]]
		local v1 = p3.Value - v17.Get()
		if v1 > 0 and (p3.Completed.Value and p3.Claimed.Value) then
			v34.QuestContent.Timer.TextLabel.Text = "Can replay in " .. v17.FormatString(v1)
			v34.QuestContent.Timer.Visible = true
		else
			v34.QuestContent.Timer.Visible = false
		end
		v34.QuestContent.ReplayButton.Visible = if p3.Value - v17.Get() <= 0 then p3.Unlocked.Value and (not p3.Started.Value and p3.Claimed.Value) else false
		v34.QuestContent.ReplayNotice.Visible = v34.QuestContent.ReplayButton.Visible
	end
	v36:GiveTask(v17.AttachToTime(setTimerLabel))
	v36:GiveTask(p3.Claimed:GetPropertyChangedSignal("Value"):Connect(setTimerLabel))
	v36:GiveTask(p3.Completed:GetPropertyChangedSignal("Value"):Connect(setTimerLabel))
	v36:GiveTask(p3:GetPropertyChangedSignal("Value"):Connect(setTimerLabel))
	setTimerLabel()
	for k, v in pairs(v12.Rewards) do
		local v82 = v5.GetByName(v.Name)
		local v92 = Sonar("ItemGridButton").new({
			ForceVisible = true,
			Item = v82,
			ParentFrame = v34.QuestContent.RewardsContainer.Content,
			Theme = v.Theme,
			GetAmount = function() --[[ GetAmount | Line: 529 | Upvalues: v (copy) ]]
				return v.Amount
			end
		})
		if v82.Description then
			v92:GiveTask(v8.new(v92.Frame, {
				Click = function() --[[ Click | Line: 535 | Upvalues: v15 (ref), v92 (copy), v82 (copy) ]]
					v15:CreateToolTip({
						Type = "ItemDescription",
						Offset = Vector2.new(0.65, 0.5),
						GuiObject = v92.Frame,
						Get = function() --[[ Get | Line: 540 | Upvalues: v82 (ref) ]]
							return v82
						end
					})
				end
			}))
		end
		v36:GiveTask(v92)
	end
	for v10, v11 in v12.Missions do
		local v122 = p3.Missions:FindFirstChild(v10)
		local v132 = v34.QuestContent.TasksContainer.Tasks.Default:Clone()
		v34.QuestContent.TasksContainer.Tasks.Default.Visible = false
		v132.Content.QuestDescription.Text = v11.Description and string.format(v11.Description, v11.Amount) or string.format(v13.Descriptions[v11.Type], v11.Amount)
		local v152 = p3.Missions:FindFirstChild(v10 - 1)
		local function setLocked() --[[ setLocked | Line: 560 | Upvalues: v132 (copy), v152 (copy), p3 (copy) ]]
			v132.Locked.Visible = v152 and not v152.Value and not p3.Completed.Value
		end
		v36:GiveTask(p3.Completed:GetPropertyChangedSignal("Value"):Connect(setLocked))
		if v152 then
			v36:GiveTask(v152:GetPropertyChangedSignal("Value"):Connect(setLocked))
		end
		v132.Locked.Visible = if v152 then not v152.Value and not p3.Completed.Value else v152
		v36:GiveTask(v9.new({
			TweenAmount = false,
			Clipped = false,
			Frame = v132.Content.ProgressBar.Bar,
			AmountLabel = v132.Content.ProgressLabel,
			GetText = function(p1, p2) --[[ GetText | Line: 578 | Upvalues: v122 (copy), p3 (copy) ]]
				if v122.Value or p3.Completed.Value then
					return "COMPLETE"
				else
					return p1 .. "/" .. p2
				end
			end,
			Get = function() --[[ Get | Line: 585 | Upvalues: v122 (copy), p3 (copy), v11 (copy) ]]
				if v122.Value or p3.Completed.Value then
					return v11.Amount
				else
					return math.min(v122.Amount.Value, v11.Amount)
				end
			end,
			GetMax = function() --[[ GetMax | Line: 591 | Upvalues: v11 (copy) ]]
				return v11.Amount
			end,
			Changed = { v122.Amount:GetPropertyChangedSignal("Value"), v122:GetPropertyChangedSignal("Value"), p3.Completed:GetPropertyChangedSignal("Value") }
		}))
		v132.Visible = true
		v132.LayoutOrder = v10
		v132.Parent = v34.QuestContent.TasksContainer.Tasks
		v36:GiveTask(v132)
	end
end
local function setSelectedSpeciesUnlockMission(p1) --[[ setSelectedSpeciesUnlockMission | Line: 608 | Upvalues: v35 (copy), Selected (copy), v33 (copy), v5 (copy), v9 (copy), v1 (copy), claimSpeciesUnlockMissionReward (copy), v20 (copy), pinMission (copy), v19 (copy), LocalPlayer (copy), v22 (copy), createSpeciesViewport (copy), v13 (copy), v11 (copy), v12 (copy), v8 (copy), v15 (copy), ContainerFrame (copy) ]]
	v35:DoCleaning()
	if not p1 then
		Selected.Visible = false
		ContainerFrame.Menu.TabFrames.Horses.Content.Missions.Visible = true
		return
	end
	Selected.Description.Text = string.format("Complete all missions to unlock %s Taming and claim your own foal!", p1.Species)
	Selected.DisplayPanel.Title.Text = string.format("%s Missions", p1.Species)
	local v14 = v33.PlayerData.Missions.SpeciesUnlocks[p1.Species]
	local v2 = v5.GetByName(p1.Species)
	local t = {}
	for k, v in pairs(v14.Missions:GetChildren()) do
		table.insert(t, v:GetPropertyChangedSignal("Value"))
	end
	table.insert(t, v14.Completed:GetPropertyChangedSignal("Value"))
	table.insert(t, v14.Claimed:GetPropertyChangedSignal("Value"))
	v35:GiveTask(v9.new({
		TweenAmount = false,
		Clipped = false,
		Frame = Selected.DisplayPanel.Content.ProgressBar.Bar,
		AmountLabel = Selected.DisplayPanel.Content.ProgressBar.ProgressLabel,
		GetText = function(p1, p2) --[[ GetText | Line: 632 | Upvalues: v14 (copy) ]]
			if v14.Completed.Value then
				return "COMPLETED"
			else
				return p1 .. "/" .. p2
			end
		end,
		Get = function() --[[ Get | Line: 639 | Upvalues: v14 (copy), p1 (copy) ]]
			if v14.Completed.Value then
				return #p1.Missions
			end
			local sum = 0
			for k, v in pairs(v14.Missions:GetChildren()) do
				sum = sum + (if v.Value then 1 else 0)
			end
			return sum
		end,
		GetMax = function() --[[ GetMax | Line: 650 | Upvalues: p1 (copy) ]]
			return #p1.Missions
		end,
		Changed = t,
		OnChanged = function(p1, p2) --[[ OnChanged | Line: 654 | Upvalues: v14 (copy), Selected (ref) ]]
			if v14.Claimed.Value or p1 < p2 then
				Selected.DisplayPanel.Content.ProgressBar.Visible = true
				Selected.DisplayPanel.Content.ClaimButton.Visible = false
			else
				Selected.DisplayPanel.Content.ProgressBar.Visible = false
				Selected.DisplayPanel.Content.ClaimButton.Visible = true
			end
		end
	}))
	v35:GiveTask(v1.new(Selected.DisplayPanel.Content.ClaimButton, {
		Click = function() --[[ Click | Line: 666 | Upvalues: claimSpeciesUnlockMissionReward (ref), p1 (copy) ]]
			claimSpeciesUnlockMissionReward(p1.Name)
		end
	}))
	local function setPinned() --[[ setPinned | Line: 672 | Upvalues: Selected (ref), v14 (copy), v20 (ref) ]]
		Selected.DisplayPanel.PinButton.Visible = v14.Pinned.Value or not v14.Completed.Value
		Selected.DisplayPanel.PinButton.Top.CrossLabel.Visible = v14.Pinned.Value
		v20.SetButtonColor(Selected.DisplayPanel.PinButton, "Diagonal", if v14.Pinned.Value then "Red" else "Blue")
	end
	local function setSkip() --[[ setSkip | Line: 678 | Upvalues: Selected (ref) ]]
		Selected.SkipButton.Visible = false
	end
	v35:GiveTask(v14.Completed:GetPropertyChangedSignal("Value"):Connect(setPinned))
	v35:GiveTask(v14.Completed:GetPropertyChangedSignal("Value"):Connect(setSkip))
	v35:GiveTask(v14.Claimed:GetPropertyChangedSignal("Value"):Connect(setSkip))
	v35:GiveTask(v14.Pinned:GetPropertyChangedSignal("Value"):Connect(setPinned))
	local PinButton = Selected.DisplayPanel.PinButton
	PinButton.Visible = v14.Pinned.Value or not v14.Completed.Value
	Selected.DisplayPanel.PinButton.Top.CrossLabel.Visible = v14.Pinned.Value
	local SetButtonColor = v20.SetButtonColor
	local PinButton_2 = Selected.DisplayPanel.PinButton
	SetButtonColor(PinButton_2, "Diagonal", if v14.Pinned.Value then "Red" else "Blue")
	Selected.SkipButton.Visible = false
	v35:GiveTask(v1.new(Selected.DisplayPanel.PinButton, {
		Click = function() --[[ Click | Line: 690 | Upvalues: pinMission (ref), v14 (copy) ]]
			pinMission("SpeciesUnlocks", v14.Name)
		end
	}))
	v35:GiveTask(v1.new(Selected.SkipButton, {
		Click = function() --[[ Click | Line: 696 | Upvalues: v19 (ref), p1 (copy), LocalPlayer (ref), v22 (ref) ]]
			if not v19.GetRemoteFunction("SkipMission"):InvokeServer(p1.Species) then
				return
			end
			if LocalPlayer:GetAttribute("SkipAB") == "2" then
				v22.PromptPurchase(LocalPlayer, 2661622690)
				return
			end
			if LocalPlayer:GetAttribute("SkipAB") ~= "3" then
				return
			end
			v22.PromptPurchase(LocalPlayer, 2661622642)
		end
	}))
	Selected.DisplayPanel.Content.HorseViewport.Visible = true
	Selected.DisplayPanel.Content.ItemViewport.Visible = false
	v35:GiveTask((createSpeciesViewport(Selected.DisplayPanel.Content.HorseViewport, v2)))
	for k, v in pairs(p1.Missions) do
		local v6 = v14.Missions:FindFirstChild(k)
		local v7 = Selected.MissionList.Content.Default:Clone()
		Selected.MissionList.Content.Default.Visible = false
		v7.Content.RewardContainer.UnclaimLabel.Visible = false
		v7.Content.QuestDescription.Text = v.Description and string.format(v.Description, v.Amount) or string.format(v13.Descriptions[v.Type], v.Amount, v.ItemType)
		local v92 = v5.GetByName(v.Reward.Name)
		v7.Content.RewardContainer.ImageLabel.Image = v92.Image
		v7.Content.RewardContainer.AmountLabel.Text = "x" .. v11.suffix(v.Reward.Amount)
		v7.Content.QuestReward.Text = "Reward: " .. v11.suffix(v.Reward.Amount) .. " " .. v12.GetDisplayName(v92.Name, v92)
		if v92.Description then
			v35:GiveTask(v8.new(v7.Content.RewardContainer, {
				Click = function() --[[ Click | Line: 730 | Upvalues: v15 (ref), v7 (copy), v92 (copy) ]]
					v15:CreateToolTip({
						Type = "ItemDescription",
						Offset = Vector2.new(0.65, 0.5),
						GuiObject = v7.Content.RewardContainer,
						Get = function() --[[ Get | Line: 735 | Upvalues: v92 (ref) ]]
							return v92
						end
					})
				end
			}))
		else
			v7.Content.RewardContainer.AutoButtonColor = false
		end
		v35:GiveTask(v9.new({
			TweenAmount = false,
			Clipped = false,
			Frame = v7.Content.ProgressBar.Bar,
			AmountLabel = v7.Content.ProgressLabel,
			GetText = function(p1, p2) --[[ GetText | Line: 751 | Upvalues: v6 (copy) ]]
				if v6.Claimed.Value then
					return "CLAIMED"
				else
					return p1 .. "/" .. p2
				end
			end,
			Get = function() --[[ Get | Line: 758 | Upvalues: v6 (copy), v (copy) ]]
				if v6.Value or v6.Claimed.Value then
					return v.Amount
				else
					return math.min(v6.Amount.Value, v.Amount)
				end
			end,
			GetMax = function() --[[ GetMax | Line: 764 | Upvalues: v (copy) ]]
				return v.Amount
			end,
			Changed = { v6.Amount:GetPropertyChangedSignal("Value"), v6.Claimed:GetPropertyChangedSignal("Value"), v6:GetPropertyChangedSignal("Value") },
			OnChanged = function() --[[ OnChanged | Line: 772 | Upvalues: v6 (copy), v7 (copy), k (copy) ]]
				if v6.Value and not v6.Claimed.Value then
					v7.Content.ClaimButton.Visible = true
					v7.Content.ProgressLabel.Visible = false
					v7.LayoutOrder = 1
					return
				end
				v7.Content.ClaimButton.Visible = false
				v7.Content.ProgressLabel.Visible = true
				v7.LayoutOrder = k + (if v6.Claimed.Value then 10 else 0)
			end
		}))
		v35:GiveTask(v1.new(v7.Content.ClaimButton, {
			Click = function() --[[ Click | Line: 787 | Upvalues: claimSpeciesUnlockMissionReward (ref), p1 (copy), k (copy) ]]
				claimSpeciesUnlockMissionReward(p1.Name, k)
			end
		}))
		v7.Visible = true
		v7.Parent = Selected.MissionList.Content
		v35:GiveTask(v7)
	end
	Selected.Visible = true
	ContainerFrame.Menu.TabFrames.Horses.Content.Missions.Visible = false
end
local function setSelectedSpeciesMission(p1) --[[ setSelectedSpeciesMission | Line: 805 | Upvalues: v35 (copy), Selected (copy), v33 (copy), v5 (copy), v13 (copy), v9 (copy), v1 (copy), claimSpeciesMissionReward (copy), v20 (copy), pinMission (copy), v7 (copy), createSpeciesViewport (copy), Sonar (copy), v8 (copy), v15 (copy), v11 (copy), v12 (copy), ContainerFrame (copy) ]]
	v35:DoCleaning()
	if not p1 then
		Selected.Visible = false
		ContainerFrame.Menu.TabFrames.Horses.Content.Missions.Visible = true
		return
	end
	Selected.Description.Text = "Finish the quests before time runs out to earn your reward!"
	Selected.DisplayPanel.Title.Text = string.format("Repeatable %s Missions", p1.Species)
	local v14 = v33.PlayerData.Missions.SpeciesMissions[p1.Species]
	local v2 = v5.GetByName(p1.Species)
	if not v14.Started.Value and v13.StartSpeciesMission(p1.Species) then
		task.wait()
	end
	local t = {}
	for k, v in pairs(v14.Missions:GetChildren()) do
		table.insert(t, v:GetPropertyChangedSignal("Value"))
	end
	table.insert(t, v14.Completed:GetPropertyChangedSignal("Value"))
	table.insert(t, v14.Claimed:GetPropertyChangedSignal("Value"))
	v35:GiveTask(v9.new({
		TweenAmount = false,
		Clipped = false,
		Frame = Selected.DisplayPanel.Content.ProgressBar.Bar,
		AmountLabel = Selected.DisplayPanel.Content.ProgressBar.ProgressLabel,
		GetText = function(p1, p2) --[[ GetText | Line: 833 | Upvalues: v14 (copy) ]]
			if v14.Completed.Value then
				return "COMPLETED"
			else
				return p1 .. "/" .. p2
			end
		end,
		Get = function() --[[ Get | Line: 840 | Upvalues: v14 (copy), p1 (copy) ]]
			if v14.Completed.Value then
				return #p1.Missions
			end
			local sum = 0
			for k, v in pairs(v14.Missions:GetChildren()) do
				sum = sum + (if v.Value then 1 else 0)
			end
			return sum
		end,
		GetMax = function() --[[ GetMax | Line: 851 | Upvalues: p1 (copy) ]]
			return #p1.Missions
		end,
		Changed = t,
		OnChanged = function(p1, p2) --[[ OnChanged | Line: 855 | Upvalues: v14 (copy), Selected (ref) ]]
			if v14.Claimed.Value or p1 < p2 then
				Selected.DisplayPanel.Content.ProgressBar.Visible = true
				Selected.DisplayPanel.Content.ClaimButton.Visible = false
			else
				Selected.DisplayPanel.Content.ProgressBar.Visible = false
				Selected.DisplayPanel.Content.ClaimButton.Visible = true
			end
		end
	}))
	v35:GiveTask(v1.new(Selected.DisplayPanel.Content.ClaimButton, {
		Click = function() --[[ Click | Line: 867 | Upvalues: claimSpeciesMissionReward (ref), p1 (copy) ]]
			claimSpeciesMissionReward(p1.Name)
		end
	}))
	local function setPinned() --[[ setPinned | Line: 872 | Upvalues: Selected (ref), v14 (copy), v20 (ref) ]]
		Selected.DisplayPanel.PinButton.Visible = v14.Pinned.Value or not v14.Completed.Value
		Selected.DisplayPanel.PinButton.Top.CrossLabel.Visible = v14.Pinned.Value
		v20.SetButtonColor(Selected.DisplayPanel.PinButton, "Diagonal", if v14.Pinned.Value then "Red" else "Blue")
	end
	v35:GiveTask(v14.Completed:GetPropertyChangedSignal("Value"):Connect(setPinned))
	v35:GiveTask(v14.Pinned:GetPropertyChangedSignal("Value"):Connect(setPinned))
	local PinButton = Selected.DisplayPanel.PinButton
	PinButton.Visible = v14.Pinned.Value or not v14.Completed.Value
	Selected.DisplayPanel.PinButton.Top.CrossLabel.Visible = v14.Pinned.Value
	local SetButtonColor = v20.SetButtonColor
	local PinButton_2 = Selected.DisplayPanel.PinButton
	SetButtonColor(PinButton_2, "Diagonal", if v14.Pinned.Value then "Red" else "Blue")
	v35:GiveTask(v1.new(Selected.DisplayPanel.PinButton, {
		Click = function() --[[ Click | Line: 882 | Upvalues: pinMission (ref), v14 (copy) ]]
			pinMission("SpeciesMissions", v14.Name)
		end
	}))
	local v6 = v7.new()
	v35:GiveTask(v6)
	local function createReward() --[[ createReward | Line: 889 | Upvalues: v14 (copy), v6 (copy), p1 (copy), createSpeciesViewport (ref), Selected (ref), v2 (copy), v5 (ref), Sonar (ref), v8 (ref), v15 (ref) ]]
		local v1 = game:GetService("HttpService"):JSONDecode(v14.Reward.Value)
		v6:DoCleaning()
		local v3 = type(v1[1]) == "table" and v1[1] or p1.Rewards[v1[1]]
		if v3.Species then
			v6:GiveTask((createSpeciesViewport(Selected.DisplayPanel.Content.HorseViewport, v2, v3, math.max(1, v14.Value) + p1.Index * 1000)))
			Selected.DisplayPanel.Content.ItemViewport.Visible = false
			Selected.DisplayPanel.Content.HorseViewport.Visible = true
			return
		end
		local v82 = v5.GetByName(v3.Name)
		local v9 = Sonar("ItemGridButton").new({
			DoNotClone = true,
			ForceVisible = true,
			Item = v82,
			GuiObject = Selected.DisplayPanel.Content.ItemViewport,
			Theme = v3.Theme,
			GetAmount = function() --[[ GetAmount | Line: 906 | Upvalues: v3 (copy) ]]
				return v3.Amount
			end
		})
		if v82.Description then
			v9:GiveTask(v8.new(Selected.DisplayPanel.Content.ItemViewport, {
				Click = function() --[[ Click | Line: 913 | Upvalues: v15 (ref), Selected (ref), v82 (copy) ]]
					v15:CreateToolTip({
						Type = "ItemDescription",
						Offset = Vector2.new(0.65, 0.5),
						GuiObject = Selected.DisplayPanel.Content.ItemViewport,
						Get = function() --[[ Get | Line: 918 | Upvalues: v82 (ref) ]]
							return v82
						end
					})
				end
			}))
		else
			Selected.DisplayPanel.Content.ItemViewport.AutoButtonColor = false
		end
		Selected.DisplayPanel.Content.ItemViewport.Visible = true
		Selected.DisplayPanel.Content.HorseViewport.Visible = false
		v6:GiveTask(v9)
	end
	v35:GiveTask(v14:GetPropertyChangedSignal("Value"):Connect(createReward))
	v35:GiveTask(v14.Reward:GetPropertyChangedSignal("Value"):Connect(createReward))
	createReward()
	for k, v in pairs(p1.Missions) do
		local v72 = v14.Missions:FindFirstChild(k)
		local v82 = Selected.MissionList.Content.Default:Clone()
		Selected.MissionList.Content.Default.Visible = false
		local v10 = v14.Missions[tonumber(v72.Name)]
		local function setDescriptionLabel() --[[ setDescriptionLabel | Line: 942 | Upvalues: v13 (ref), v2 (copy), v10 (copy), v82 (copy) ]]
			local v1 = v13.GetMissionPreset("SpeciesMissions", v2.Name, v10)
			local v22 = v1.Description or v13.Descriptions[v1.Type] or v1.Type
			if v1.DoNotFormat then
				v82.Content.QuestDescription.Text = v22
			else
				v82.Content.QuestDescription.Text = string.format(v22, v10.TargetAmount.Value)
			end
		end
		v35:GiveTask(v10.Amount:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel))
		v35:GiveTask(v10.TargetAmount:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel))
		v35:GiveTask(v10.Type:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel))
		setDescriptionLabel()
		local v112 = v5.GetByName(v.Reward.Name)
		v82.Content.RewardContainer.ImageLabel.Image = v112.Image
		v82.Content.RewardContainer.AmountLabel.Text = "x" .. v11.suffix(v.Reward.Amount)
		v82.Content.QuestReward.Text = "Reward: " .. v11.suffix(v.Reward.Amount) .. " " .. v12.GetDisplayName(v112.Name, v112)
		if v112.Description then
			v35:GiveTask(v8.new(v82.Content.RewardContainer, {
				Click = function() --[[ Click | Line: 963 | Upvalues: v15 (ref), v82 (copy), v112 (copy) ]]
					v15:CreateToolTip({
						Type = "ItemDescription",
						Offset = Vector2.new(0.65, 0.5),
						GuiObject = v82.Content.RewardContainer,
						Get = function() --[[ Get | Line: 968 | Upvalues: v112 (ref) ]]
							return v112
						end
					})
				end
			}))
		else
			v82.Content.RewardContainer.AutoButtonColor = false
		end
		local function setUnclaimableLabel() --[[ setUnclaimableLabel | Line: 978 | Upvalues: v82 (copy), v10 (copy), v14 (copy), v33 (ref) ]]
			v82.Content.RewardContainer.UnclaimLabel.Visible = not v10.Value and not v10.Claimed.Value and v14.Value ~= v33.SpeciesMissionTimer.CurrentSeed
		end
		v35:GiveTask(v33.SpeciesMissionTimer.SeedChanged:Connect(setUnclaimableLabel))
		v35:GiveTask(v14:GetPropertyChangedSignal("Value"):Connect(setUnclaimableLabel))
		v35:GiveTask(v10:GetPropertyChangedSignal("Value"):Connect(setUnclaimableLabel))
		v35:GiveTask(v10.Claimed:GetPropertyChangedSignal("Value"):Connect(setUnclaimableLabel))
		v82.Content.RewardContainer.UnclaimLabel.Visible = not v10.Value and not v10.Claimed.Value and (if v14.Value == v33.SpeciesMissionTimer.CurrentSeed then false else true)
		v35:GiveTask(v14.Started:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 988 | Upvalues: v14 (copy), v13 (ref), p1 (copy) ]]
			if v14.Started.Value or not v13.StartSpeciesMission(p1.Species) then
				return
			end
			task.wait()
		end))
		v35:GiveTask(v9.new({
			TweenAmount = false,
			Clipped = false,
			Frame = v82.Content.ProgressBar.Bar,
			AmountLabel = v82.Content.ProgressLabel,
			GetText = function(p1, p2) --[[ GetText | Line: 1002 | Upvalues: v10 (copy), v14 (copy), v33 (ref) ]]
				if v10.Claimed.Value then
					return "CLAIMED"
				end
				if v14.Value == v33.SpeciesMissionTimer.CurrentSeed or (v10.Value or v10.Claimed.Value) then
					return p1 .. "/" .. p2
				else
					return "Out of Time!"
				end
			end,
			Get = function() --[[ Get | Line: 1011 | Upvalues: v10 (copy) ]]
				if v10.Value or v10.Claimed.Value then
					return v10.TargetAmount.Value
				else
					return math.min(v10.Amount.Value, v10.TargetAmount.Value)
				end
			end,
			GetMax = function() --[[ GetMax | Line: 1017 | Upvalues: v10 (copy) ]]
				return v10.TargetAmount.Value
			end,
			Changed = {
				v14:GetPropertyChangedSignal("Value"),
				v33.SpeciesMissionTimer.SeedChanged,
				v10.Amount:GetPropertyChangedSignal("Value"),
				v10.TargetAmount:GetPropertyChangedSignal("Value"),
				v10:GetPropertyChangedSignal("Value"),
				v10.Claimed:GetPropertyChangedSignal("Value")
			},
			OnChanged = function() --[[ OnChanged | Line: 1028 | Upvalues: v10 (copy), v82 (copy), k (copy) ]]
				if v10.Value and not v10.Claimed.Value then
					v82.Content.ClaimButton.Visible = true
					v82.Content.ProgressLabel.Visible = false
					v82.LayoutOrder = 1
					return
				end
				v82.Content.ClaimButton.Visible = false
				v82.Content.ProgressLabel.Visible = true
				v82.LayoutOrder = k + (if v10.Claimed.Value then 10 else 0)
			end
		}))
		v35:GiveTask(v1.new(v82.Content.ClaimButton, {
			Click = function() --[[ Click | Line: 1043 | Upvalues: claimSpeciesMissionReward (ref), p1 (copy), k (copy) ]]
				claimSpeciesMissionReward(p1.Name, k)
			end
		}))
		v82.Visible = true
		v82.Parent = Selected.MissionList.Content
		v35:GiveTask(v82)
	end
	Selected.Visible = true
	ContainerFrame.Menu.TabFrames.Horses.Content.Missions.Visible = false
end
function t.OpenAtMissions() --[[ OpenAtMissions | Line: 1323 ]] end
local t3 = {
	Horses = function(p1, p2) --[[ Horses | Line: 1328 | Upvalues: v8 (copy), v4 (copy), v1 (copy), setSelectedSpeciesUnlockMission (copy), getTotalUnclaimedForCategory (copy), v33 (copy), v17 (copy), v29 (copy), v5 (copy), v13 (copy), v7 (copy), createSpeciesViewport (copy), Sonar (copy), setSelectedSpeciesMission (copy), v38 (copy), v9 (copy) ]]
		v8.new(p2, {
			Click = function() --[[ Click | Line: 1331 | Upvalues: v4 (ref), p1 (copy) ]]
				v4.OpenTab(p1)
			end
		})
		v1.new(p1.Content.Selected.DisplayPanel.BackButton, {
			Click = function() --[[ Click | Line: 1337 | Upvalues: setSelectedSpeciesUnlockMission (ref) ]]
				setSelectedSpeciesUnlockMission()
			end
		})
		local function setUnclaimed() --[[ setUnclaimed | Line: 1342 | Upvalues: getTotalUnclaimedForCategory (ref), p2 (copy) ]]
			local v1 = getTotalUnclaimedForCategory("SpeciesMissions") + getTotalUnclaimedForCategory("SpeciesUnlocks")
			p2.Notification.Content.TextLabel.Text = "+" .. v1
			p2.Notification.Visible = v1 > 0
		end
		v33.MissionsChangedSignal:Connect(setUnclaimed)
		local v12 = getTotalUnclaimedForCategory("SpeciesMissions") + getTotalUnclaimedForCategory("SpeciesUnlocks")
		p2.Notification.Content.TextLabel.Text = "+" .. v12
		p2.Notification.Visible = v12 > 0
		local function setTimerVisible() --[[ setTimerVisible | Line: 1350 | Upvalues: v33 (ref), p1 (copy) ]]
			local v1 = false
			for k, v in pairs(v33.PlayerData.Missions.SpeciesMissions:GetChildren()) do
				if v.Started.Value then
					v1 = true
					break
				end
			end
			p1.Timer.Visible = v1
		end
		local function setTimerLabel() --[[ setTimerLabel | Line: 1361 | Upvalues: p1 (copy), v17 (ref), v33 (ref) ]]
			p1.Timer.TextLabel.Text = "Resets in " .. v17.FormatString(v33.SpeciesMissionTimer:GetTime())
		end
		v33.SpeciesMissionTimer.TimeChanged:Connect(setTimerLabel)
		p1.Timer.TextLabel.Text = "Resets in " .. v17.FormatString(v33.SpeciesMissionTimer:GetTime())
		for k, v in pairs(v29.UnlockTracks) do
			local v3 = p1.Content.Missions.Content.DefaultTrack:Clone()
			p1.Content.Missions.Content.DefaultTrack.Visible = false
			v3.Name = k
			v3.Title.Text = v.DisplayName
			for k2, v6 in pairs(v.UnlockOrder) do
				local v42 = v.UnlockOrder[k2 - 1]
				local v52 = v5.GetByName(v6.Species)
				local v62 = v13.GetTimedSpeciesMission(v33, v6.Species)
				local v72 = v62 and v33.PlayerData.Missions.SpeciesMissions[v6.Species]
				local v82 = v33.PlayerData.Missions.SpeciesUnlocks[v6.Species]
				local v92 = v42 and v33.PlayerData.Missions.SpeciesUnlocks[v42.Species]
				local v10 = v3.Content.Default:Clone()
				v3.Content.Default.Visible = false
				v10.Content.Title.Text = v6.Title:upper()
				local function hasClaimedAllRewards() --[[ hasClaimedAllRewards | Line: 1391 | Upvalues: v82 (copy) ]]
					if not v82.Claimed.Value and v82.Completed.Value then
						return
					end
					for k, v in pairs(v82.Missions:GetChildren()) do
						if not v.Claimed.Value then
							return
						end
					end
					return true
				end
				local function canViewMissions() --[[ canViewMissions | Line: 1403 | Upvalues: v82 (copy), hasClaimedAllRewards (copy), v72 (copy) ]]
					return v82.Completed.Value and not hasClaimedAllRewards() or (not v82.Completed.Value or v72 and v72.Started.Value)
				end
				local v11 = v7.new()
				local function createReward() --[[ createReward | Line: 1409 | Upvalues: v11 (copy), v72 (copy), v82 (copy), hasClaimedAllRewards (copy), v62 (copy), createSpeciesViewport (ref), v10 (copy), v52 (copy), k2 (copy), v5 (ref), Sonar (ref) ]]
					v11:DoCleaning()
					if not (v72 and v72.Started.Value or v82.Completed.Value and hasClaimedAllRewards()) then
						v10.ItemViewport.Visible = false
						v10.HorseViewport.Visible = true
						v11:GiveTask((createSpeciesViewport(v10.HorseViewport, v52)))
						return
					end
					local v1 = game:GetService("HttpService"):JSONDecode(v72.Reward.Value)
					local v3 = type(v1[1]) == "table" and v1[1] or v62.Rewards[v1[1]]
					if v3.Species then
						v11:GiveTask((createSpeciesViewport(v10.HorseViewport, v52, v3, math.max(1, v72.Value) + k2 * 1000)))
						v10.ItemViewport.Visible = false
						v10.HorseViewport.Visible = true
					else
						local v8 = v5.GetByName(v3.Name)
						local v9 = Sonar("ItemGridButton").new({
							DoNotClone = true,
							ForceVisible = true,
							Item = v8,
							GuiObject = v10.ItemViewport,
							Theme = v3.Theme,
							GetAmount = function() --[[ GetAmount | Line: 1428 | Upvalues: v3 (copy) ]]
								return v3.Amount
							end
						})
						v10.ItemViewport.Visible = true
						v10.HorseViewport.Visible = false
						v11:GiveTask(v9)
					end
				end
				if v72 then
					v72:GetPropertyChangedSignal("Value"):Connect(createReward)
					v72.Started:GetPropertyChangedSignal("Value"):Connect(createReward)
					v72.Reward:GetPropertyChangedSignal("Value"):Connect(createReward)
				end
				v82.Completed:GetPropertyChangedSignal("Value"):Connect(createReward)
				v82.Claimed:GetPropertyChangedSignal("Value"):Connect(createReward)
				for k3, v14 in pairs(v82.Missions:GetChildren()) do
					v14.Claimed:GetPropertyChangedSignal("Value"):Connect(createReward)
				end
				createReward()
				local function selectMission() --[[ selectMission | Line: 1454 | Upvalues: v72 (copy), setSelectedSpeciesMission (ref), v62 (copy), setSelectedSpeciesUnlockMission (ref), v6 (copy) ]]
					if v72 and v72.Started.Value then
						return setSelectedSpeciesMission(v62)
					else
						return setSelectedSpeciesUnlockMission(v6)
					end
				end
				v8.new(v10, {
					HoverUpPosition = 0.03,
					HoverUpLabel = v10.HorseViewport,
					Click = function() --[[ Click | Line: 1464 | Upvalues: v10 (copy), v82 (copy), hasClaimedAllRewards (copy), v72 (copy), setSelectedSpeciesMission (ref), v62 (copy), setSelectedSpeciesUnlockMission (ref), v6 (copy) ]]
						if v10.Locked.Visible and not game:GetService("RunService"):IsStudio() then
							return
						end
						if not (v82.Completed.Value and not hasClaimedAllRewards() or (not v82.Completed.Value or v72 and v72.Started.Value)) then
							return
						end
						if v72 and v72.Started.Value then
							setSelectedSpeciesMission(v62)
							return
						end
						setSelectedSpeciesUnlockMission(v6)
					end
				})
				v1.new(v10.Content.ViewButton, {
					Rotate = false,
					Selectable = false,
					Click = function() --[[ Click | Line: 1475 | Upvalues: v10 (copy), v82 (copy), hasClaimedAllRewards (copy), v72 (copy), setSelectedSpeciesMission (ref), v62 (copy), setSelectedSpeciesUnlockMission (ref), v6 (copy) ]]
						if v10.Locked.Visible and not game:GetService("RunService"):IsStudio() then
							return
						end
						if not (v82.Completed.Value and not hasClaimedAllRewards() or (not v82.Completed.Value or v72 and v72.Started.Value)) then
							return
						end
						if v72 and v72.Started.Value then
							setSelectedSpeciesMission(v62)
							return
						end
						setSelectedSpeciesUnlockMission(v6)
					end
				})
				v1.new(v10.Content.StartButton, {
					Rotate = false,
					Selectable = true,
					Click = function() --[[ Click | Line: 1486 | Upvalues: v13 (ref), v52 (copy), setSelectedSpeciesMission (ref), v62 (copy) ]]
						if not v13.StartSpeciesMission(v52.Name) then
							return
						end
						setSelectedSpeciesMission(v62)
					end
				})
				local function setUnclaimed_2() --[[ setUnclaimed | Line: 1494 | Upvalues: v38 (ref), v82 (copy), v72 (copy), v10 (copy) ]]
					local v1 = v38(v82)
					local v3 = v1 + (if v72 then v38(v72) or 0 else 0)
					v10.Notification.Content.TextLabel.Text = "+" .. v3
					v10.Notification.Visible = v3 > 0
				end
				v33.MissionsChangedSignal:Connect(setUnclaimed_2)
				local v122 = v38(v82)
				local v132 = v72 and v38(v72) or 0
				local v14 = v122 + v132
				v10.Notification.Content.TextLabel.Text = "+" .. v14
				v10.Notification.Visible = if v14 > 0 then true else false
				local function setCompletedOrStarted() --[[ setCompletedOrStarted | Line: 1502 | Upvalues: setTimerVisible (copy), v82 (copy), v72 (copy), hasClaimedAllRewards (copy), v10 (copy), v17 (ref), v33 (ref), v6 (copy) ]]
					setTimerVisible()
					if v82.Completed.Value then
						if not (v72 and hasClaimedAllRewards()) then
							v10.TimerLabel.Visible = false
							v10.BackgroundColor3 = Color3.fromRGB(205, 247, 174)
							v10.Content.Description.TextColor3 = Color3.fromRGB(19, 146, 121)
							v10.Content.Title.TextColor3 = Color3.fromRGB(19, 146, 121)
							v10.Content.Description.Text = string.format("Completed!\nYou can now breed the %s species!", v6.Species)
							v10.Content.ProgressBar.Visible = true
							v10.Content.ProgressLabel.Visible = true
							v10.Content.StartButton.Visible = false
							return
						end
						if v72.Completed.Value then
							v10.TimerLabel.Visible = true
							v10.BackgroundColor3 = Color3.fromRGB(205, 247, 174)
							v10.Content.Description.TextColor3 = Color3.fromRGB(19, 146, 121)
							v10.Content.Title.TextColor3 = Color3.fromRGB(19, 146, 121)
							v10.Content.Description.Text = "Completed!\nYou completed the quests, wait for them to reset!"
							v10.Content.StartButton.Visible = false
							v10.Content.ProgressBar.Visible = true
							v10.Content.ProgressLabel.Visible = true
						else
							local v1 = nil
							local function setTimerLabel() --[[ setTimerLabel | Line: 1518 | Upvalues: v1 (ref), v17 (ref), v33 (ref), v72 (ref), v10 (ref) ]]
								v1 = v17.FormatString(v33.SpeciesMissionTimer:GetTime())
								if v72.Started.Value then
									v10.TimerLabel.Visible = true
									v10.Content.Description.Text = "Complete the quests to unlock your reward! " .. v1
									v10.BackgroundColor3 = Color3.fromRGB(223, 193, 255)
									v10.Content.Description.TextColor3 = Color3.fromRGB(129, 73, 188)
									v10.Content.Title.TextColor3 = Color3.fromRGB(129, 73, 188)
									v10.Content.StartButton.Visible = false
									v10.Content.ProgressBar.Visible = true
									v10.Content.ProgressLabel.Visible = true
								else
									v10.TimerLabel.Visible = false
									v10.BackgroundColor3 = Color3.fromRGB(231, 171, 122)
									v10.Content.Description.TextColor3 = Color3.fromRGB(198, 74, 40)
									v10.Content.Title.TextColor3 = Color3.fromRGB(198, 74, 40)
									v10.Content.Description.Text = "Finish the quests before time runs out to earn your reward! " .. v1
									v10.Content.StartButton.Visible = true
									v10.Content.ProgressBar.Visible = false
									v10.Content.ProgressLabel.Visible = false
								end
							end
							v33.SpeciesMissionTimer.TimeChanged:Connect(setTimerLabel)
							setTimerLabel()
						end
					else
						v10.TimerLabel.Visible = false
						v10.Content.Description.Text = if v6.Species == "Horse" then "Complete to claim your foal and start your journey!" else string.format("Complete to unlock %s breeding!", v6.Species)
						v10.BackgroundColor3 = Color3.fromRGB(223, 193, 255)
						v10.Content.Description.TextColor3 = Color3.fromRGB(129, 73, 188)
						v10.Content.Title.TextColor3 = Color3.fromRGB(129, 73, 188)
						v10.Content.ProgressBar.Visible = true
						v10.Content.ProgressLabel.Visible = true
						v10.Content.StartButton.Visible = false
					end
				end
				if v72 then
					v72.Completed:GetPropertyChangedSignal("Value"):Connect(setCompletedOrStarted)
					v72.Started:GetPropertyChangedSignal("Value"):Connect(setCompletedOrStarted)
				end
				v82.Claimed:GetPropertyChangedSignal("Value"):Connect(setCompletedOrStarted)
				for k3, v16 in pairs(v82.Missions:GetChildren()) do
					v16.Claimed:GetPropertyChangedSignal("Value"):Connect(setCompletedOrStarted)
				end
				v82.Completed:GetPropertyChangedSignal("Value"):Connect(setCompletedOrStarted)
				setCompletedOrStarted()
				local function setLocked() --[[ setLocked | Line: 1578 | Upvalues: v92 (copy), v82 (copy), v10 (copy) ]]
					if v92 and not (v92.Completed.Value or v82.Completed.Value) then
						v10.Locked.Visible = true
					else
						v10.Locked.Visible = false
					end
				end
				if v92 then
					v10.Locked.Title.Text = string.format("Complete %s Quests first!", v42.Species)
					v92.Completed:GetPropertyChangedSignal("Value"):Connect(setLocked)
					v82.Completed:GetPropertyChangedSignal("Value"):Connect(setLocked)
				end
				if v92 and not (v92.Completed.Value or v82.Completed.Value) then
					v10.Locked.Visible = true
				else
					v10.Locked.Visible = false
				end
				local t = {}
				for k3, v16 in pairs(v82.Missions:GetChildren()) do
					table.insert(t, v16:GetPropertyChangedSignal("Value"))
				end
				table.insert(t, v82.Completed:GetPropertyChangedSignal("Value"))
				if v72 then
					for k3, v16 in pairs(v72.Missions:GetChildren()) do
						table.insert(t, v16:GetPropertyChangedSignal("Value"))
					end
					table.insert(t, v72.Completed:GetPropertyChangedSignal("Value"))
					table.insert(t, v72.Started:GetPropertyChangedSignal("Value"))
				end
				v9.new({
					TweenAmount = false,
					Clipped = false,
					Frame = v10.Content.ProgressBar.Bar,
					AmountLabel = v10.Content.ProgressLabel,
					GetText = function(p1, p2) --[[ GetText | Line: 1610 | Upvalues: v82 (copy), v72 (copy) ]]
						if not v82.Completed.Value then
							return p1 .. "/" .. p2
						end
						if not (v72 and v72.Started.Value) then
							return "Completed"
						end
						if v72.Completed.Value then
							return "Completed"
						else
							return p1 .. "/" .. p2
						end
					end,
					Get = function() --[[ Get | Line: 1625 | Upvalues: v82 (copy), v72 (copy), v62 (copy), v6 (copy) ]]
						if v82.Completed.Value then
							if not (v72 and v72.Started.Value) then
								return #v6.Missions
							end
							if v72.Completed.Value then
								return #v62.Missions
							end
							local sum = 0
							for k, v in pairs(v72.Missions:GetChildren()) do
								sum = sum + (if v.Value then 1 else 0)
							end
							return sum
						else
							local sum = 0
							for k, v in pairs(v82.Missions:GetChildren()) do
								sum = sum + (if v.Value then 1 else 0)
							end
							return sum
						end
					end,
					GetMax = function() --[[ GetMax | Line: 1648 | Upvalues: v82 (copy), v72 (copy), v62 (copy), v6 (copy) ]]
						if not v82.Completed.Value then
							return #v6.Missions
						end
						if v72 and v72.Started.Value then
							return #v62.Missions
						else
							return #v6.Missions
						end
					end,
					Changed = t
				})
				local function setHovered(p1) --[[ setHovered | Line: 1662 | Upvalues: v10 (copy), v82 (copy), hasClaimedAllRewards (copy), v72 (copy) ]]
					if p1 and not v10.Locked.Visible then
						if not (v82.Completed.Value and not hasClaimedAllRewards() or (not v82.Completed.Value or v72 and v72.Started.Value)) then
							v10.Content.ProgressBar.Visible = false
							v10.Content.ProgressLabel.Visible = false
							return
						end
						v10.Content.ViewButton.Visible = true
						v10.Content.ProgressBar.Visible = false
						v10.Content.ProgressLabel.Visible = false
					else
						v10.Content.ViewButton.Visible = false
						if v82.Completed.Value and not hasClaimedAllRewards() or (not v82.Completed.Value or v72 and v72.Started.Value) then
							v10.Content.ProgressBar.Visible = true
							v10.Content.ProgressLabel.Visible = true
						else
							v10.Content.ProgressBar.Visible = false
							v10.Content.ProgressLabel.Visible = false
						end
					end
				end
				v8:RegisterHover(v10, function() --[[ Line: 1680 | Upvalues: setHovered (copy) ]]
					setHovered(true)
				end)
				v8:RegisterLeave(v10, function() --[[ Line: 1683 | Upvalues: v10 (copy), v82 (copy), hasClaimedAllRewards (copy), v72 (copy) ]]
					v10.Content.ViewButton.Visible = false
					if v82.Completed.Value and not hasClaimedAllRewards() or (not v82.Completed.Value or v72 and v72.Started.Value) then
						v10.Content.ProgressBar.Visible = true
						v10.Content.ProgressLabel.Visible = true
					else
						v10.Content.ProgressBar.Visible = false
						v10.Content.ProgressLabel.Visible = false
					end
				end)
				v10.Content.ViewButton.Visible = false
				if v82.Completed.Value and not hasClaimedAllRewards() or (not v82.Completed.Value or v72 and v72.Started.Value) then
					v10.Content.ProgressBar.Visible = true
					v10.Content.ProgressLabel.Visible = true
				else
					v10.Content.ProgressBar.Visible = false
					v10.Content.ProgressLabel.Visible = false
				end
				v10.Name = k2
				v10.LayoutOrder = k2 * 5
				v10.Visible = true
				v10.Parent = v3.Content
				if k2 ~= #v.UnlockOrder then
					local v172 = v3.Content.DefaultArrow:Clone()
					v3.Content.DefaultArrow.Visible = false
					v172.LayoutOrder = k2 * 5 + 1
					v172.Name = k2
					v172.Visible = true
					local function setArrowColor() --[[ setArrowColor | Line: 1700 | Upvalues: v172 (copy), v82 (copy) ]]
						v172.ImageLabel.ImageColor3 = v82.Completed.Value and Color3.fromRGB(125, 255, 173) or Color3.fromRGB(122, 130, 161)
					end
					v82.Completed:GetPropertyChangedSignal("Value"):Connect(setArrowColor)
					v172.ImageLabel.ImageColor3 = v82.Completed.Value and Color3.fromRGB(125, 255, 173) or Color3.fromRGB(122, 130, 161)
					v172.Parent = v3.Content
				end
			end
			v3.LayoutOrder = k
			v3.Visible = true
			v3.Parent = p1.Content.Missions.Content
		end
	end,
	DynamicNPCs = function(p1, p2) --[[ DynamicNPCs | Line: 1716 | Upvalues: v8 (copy), v33 (copy), v3 (copy), Sonar (copy), v4 (copy), v16 (copy), createNPCViewport (copy), v9 (copy) ]]
		v8.new(p2, {
			Click = function() --[[ Click | Line: 1719 | Upvalues: v33 (ref), v3 (ref), Sonar (ref), v4 (ref), p1 (copy) ]]
				if v33:HasUnlockedSpecies("Pony") then
					v4.OpenTab(p1)
				else
					v3.Prompt({
						Type = "LockedJournal",
						Setup = function(p1) --[[ Setup | Line: 1723 ]]
							p1.Content.Description.Text = string.format("To unlock bonding with Guides you must complete the %s Quests!", "Pony")
						end,
						Run = function() --[[ Run | Line: 1726 | Upvalues: Sonar (ref) ]]
							Sonar("JournalGui").Open("DynamicNPCs")
							return true
						end,
						Cancel = function() --[[ Cancel | Line: 1730 ]]
							return true
						end
					})
				end
			end
		})
		local Pony = v33.PlayerData.Missions.SpeciesUnlocks.Pony
		local function setLocked() --[[ setLocked | Line: 1741 | Upvalues: Pony (copy), p2 (copy) ]]
			if Pony.Completed.Value then
				p2.Tab.Locked.Visible = false
			else
				p2.Tab.Locked.Visible = true
			end
		end
		Pony.Completed:GetPropertyChangedSignal("Value"):Connect(setLocked)
		if Pony.Completed.Value then
			p2.Tab.Locked.Visible = false
		else
			p2.Tab.Locked.Visible = true
		end
		for k, v in pairs(v16.GetAll()) do
			local v1 = p1.Content.NPCs.Content:FindFirstChild(k)
			if v1 and v16.CanBondWithNPC(k) then
				createNPCViewport(v1.Viewport, v.CharacterModel)
				v8.new(v1, {
					HoverUpPosition = 0.03,
					HoverUpLabel = v1.Viewport,
					Click = function() --[[ Click | Line: 1762 | Upvalues: Sonar (ref) ]]
						Sonar("NotificationsClient").Notify({
							Message = "Guide Rewards coming soon...",
							Type = "GuideRewardsSoon"
						})
					end
				})
				local v2 = v33.PlayerData.Missions.SpeciesUnlocks[v.RequiredSpecies]
				local function setLocked_2() --[[ setLocked | Line: 1771 | Upvalues: v2 (copy), v1 (copy) ]]
					if v2.Completed.Value then
						v1.Locked.Visible = false
					else
						v1.Locked.Visible = true
					end
				end
				v1.Locked.Title.Text = string.format("Complete %s Quests first!", v.RequiredSpecies)
				v2.Completed:GetPropertyChangedSignal("Value"):Connect(setLocked_2)
				if v2.Completed.Value then
					v1.Locked.Visible = false
				else
					v1.Locked.Visible = true
				end
				local v32 = v33.PlayerData.DynamicNPCs[k]
				v9.new({
					TweenAmount = false,
					Clipped = false,
					Frame = v1.Content.ProgressBar.Bar,
					AmountLabel = v1.Content.ProgressLabel,
					GetText = function(p1, p2) --[[ GetText | Line: 1789 ]]
						local v1 = p1 / p2 * 100
						return (if v1 % 1 == 0 then string.format("%d%%", v1) else string.format("%.2f%%", v1)) .. " Bond"
					end,
					Get = function() --[[ Get | Line: 1798 | Upvalues: v32 (copy) ]]
						return v32.Bond.Value
					end,
					GetMax = function() --[[ GetMax | Line: 1801 | Upvalues: v (copy) ]]
						return v.BondPointsForFull
					end,
					Changed = { v32.Bond:GetPropertyChangedSignal("Value") }
				})
			end
		end
	end,
	ColorPicking = function(p1, p2) --[[ ColorPicking | Line: 1811 | Upvalues: v7 (copy), v8 (copy), v33 (copy), v3 (copy), Sonar (copy), v11 (copy), v4 (copy), v20 (copy), Colors (copy), v28 (copy), v1 (copy), v19 (copy), v26 (copy), JournalGui (copy) ]]
		local TextBox = p1.Content.Content.SearchBar.Content.TextBox
		local Result = p1.Content.Content.Result
		local t = {}
		local v12 = v7.new()
		local v2 = false
		local v32 = nil
		local v42 = nil
		local function UpdateColors() --[[ UpdateColors | Line: 1822 | Upvalues: v32 (ref), Result (copy), v42 (ref), v2 (ref), v12 (copy) ]]
			if v32 then
				Result.ColorSlot1.ColorLabel.BackgroundColor3 = v32.ColorRGB
				Result.ColorSlot1.ColorLabel.Icon.Text = v32.Name
				Result.ColorSlot1.ClearButton.Visible = true
			else
				Result.ColorSlot1.ColorLabel.BackgroundColor3 = Color3.fromRGB(236, 236, 236)
				Result.ColorSlot1.ColorLabel.Icon.Text = ""
				Result.ColorSlot1.ClearButton.Visible = false
			end
			if v42 then
				Result.ColorSlot2.ColorLabel.BackgroundColor3 = v42.ColorRGB
				Result.ColorSlot2.ColorLabel.Icon.Text = v42.Name
				Result.ColorSlot2.ClearButton.Visible = true
			else
				Result.ColorSlot2.ColorLabel.BackgroundColor3 = Color3.fromRGB(236, 236, 236)
				Result.ColorSlot2.ColorLabel.Icon.Text = ""
				Result.ColorSlot2.ClearButton.Visible = false
			end
			v2 = false
			v12:DoCleaning()
		end
		local function removeDuplicatesByName(p1) --[[ removeDuplicatesByName | Line: 1845 ]]
			local t = {}
			local t2 = {}
			for i, v in ipairs(p1) do
				if v.Name and not t[v.Name] then
					table.insert(t2, v)
					t[v.Name] = true
				end
			end
			return t2
		end
		v8.new(p2, {
			Click = function() --[[ Click | Line: 1860 | Upvalues: v33 (ref), v3 (ref), Sonar (ref), v11 (ref), v4 (ref), p1 (copy) ]]
				if v33:GetStatValue("Tames").Value < 5 then
					v3.Prompt({
						Type = "FeatureLocked",
						Setup = function(p1, p2) --[[ Setup | Line: 1864 | Upvalues: Sonar (ref), v11 (ref), v33 (ref) ]]
							p1.Content.ProgressDescription.Description.Text = string.format("Tame %s horses to unlock the Color Calculator!", 5)
							p1.Content.Description.Visible = false
							p1.Content.ProgressDescription.Visible = true
							p2.Maid:GiveTask(Sonar("StatBar").new({
								TweenAmount = true,
								Clipped = false,
								Frame = p1.Content.ProgressDescription.ProgressBar.Fill,
								AmountLabel = p1.Content.ProgressDescription.ProgressBar.Progress,
								GetText = function(p1, p2) --[[ GetText | Line: 1875 | Upvalues: v11 (ref) ]]
									return v11.suffix(p1) .. "/" .. v11.suffix(p2)
								end,
								Get = function() --[[ Get | Line: 1879 | Upvalues: v33 (ref) ]]
									return v33:GetStatValue("Tames").Value
								end,
								GetMax = function() --[[ GetMax | Line: 1882 ]]
									return 5
								end,
								Changed = { v33:GetStatValue("Tames"):GetPropertyChangedSignal("Value") }
							}))
						end,
						Run = function() --[[ Run | Line: 1890 ]]
							return true
						end
					})
				else
					v4.OpenTab(p1)
				end
			end
		})
		local function setLocked() --[[ setLocked | Line: 1900 | Upvalues: v33 (ref), p2 (copy) ]]
			if v33:GetStatValue("Tames").Value >= 5 then
				p2.Tab.Locked.Visible = false
			else
				p2.Tab.Locked.Visible = true
			end
		end
		v33:GetStatValue("Tames"):GetPropertyChangedSignal("Value"):Connect(setLocked)
		if v33:GetStatValue("Tames").Value >= 5 then
			p2.Tab.Locked.Visible = false
		else
			p2.Tab.Locked.Visible = true
		end
		TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 1910 | Upvalues: TextBox (copy), t (copy) ]]
			local v1 = string.lower(TextBox.Text)
			for v2, v3 in t do
				if v1 == "" or string.find(string.lower(v2), v1) then
					v3.Visible = true
					continue
				end
				v3.Visible = false
			end
		end)
		v20.CreateCurrencyLabel({
			GuiObject = p1.Content.Content.Coins.Content.TextLabel,
			Value = v33:GetCurrencyValue("Coins"),
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 1925 ]] end
		})
		for v5, v6 in Colors.ColorData do
			local v72 = p1.Content.Content.Colors.Content.Default:Clone()
			v72.Content.Icon.Text = v6.Name
			v72.Content.ColorLabel.BackgroundColor3 = v6.ColorRGB
			v72.Visible = true
			v72.Parent = p1.Content.Content.Colors.Content
			t[v6.Name] = v72
			v8.new(v72.Content, {
				Click = function() --[[ Click | Line: 1943 | Upvalues: v32 (ref), v6 (copy), v42 (ref), UpdateColors (copy) ]]
					if v32 == nil then
						v32 = v6
					else
						v42 = v6
					end
					UpdateColors()
				end
			})
		end
		UpdateColors()
		v8.new(Result.ColorSlot1.ClearButton, {
			Click = function() --[[ Click | Line: 1958 | Upvalues: v32 (ref), UpdateColors (copy) ]]
				v32 = nil
				UpdateColors()
			end
		})
		v8.new(Result.ColorSlot2.ClearButton, {
			Click = function() --[[ Click | Line: 1966 | Upvalues: v42 (ref), UpdateColors (copy) ]]
				v42 = nil
				UpdateColors()
			end
		})
		p1.Content.Content.Result.PredictButton.Top.TextLabel.Text = "Predict ($" .. v28.PredictColorPrice .. ")"
		v1.new(p1.Content.Content.Result.PredictButton, {
			Click = function() --[[ Click | Line: 1975 | Upvalues: v32 (ref), v42 (ref), v2 (ref), v19 (ref), v26 (ref), v12 (copy), removeDuplicatesByName (copy), Result (copy) ]]
				if not (v32 and v42) then
					return
				end
				if v2 then
					return
				end
				if not v19.GetRemoteFunction("PredictColor"):InvokeServer() then
					return
				end
				local v1 = v26.GetPossibleColors(v32, v42, 5)
				if not v1 then
					return
				end
				v12:DoCleaning()
				v2 = true
				for v22, v3 in removeDuplicatesByName(v1) do
					local v4 = Result.Colors.Content.Default:Clone()
					v4.Content.Icon.Text = v3.Name
					v4.Content.ColorLabel.BackgroundColor3 = v3.ColorRGB
					v4.Visible = true
					v4.Parent = Result.Colors.Content
					v12:GiveTask(v4)
				end
			end
		})
		local FoalsBorn = v33.PlayerData.Stats.FoalsBorn
		if FoalsBorn.Value < 25 then
			JournalGui.ContainerFrame.TabButtons.ColorPicking.Visible = false
			local v82 = nil
			v82 = FoalsBorn:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2010 | Upvalues: FoalsBorn (copy), JournalGui (ref), v82 (ref) ]]
				if not (FoalsBorn.Value >= 25) then
					return
				end
				JournalGui.ContainerFrame.TabButtons.ColorPicking.Visible = true
				v82:Disconnect()
			end)
		end
	end,
	Missions = function(p1, p2) --[[ Missions | Line: 2019 | Upvalues: v8 (copy), v33 (copy), v3 (copy), Sonar (copy), v11 (copy), v4 (copy), getTotalUnclaimedForCategory (copy), v17 (copy), v13 (copy), v7 (copy), v32 (copy), LocalPlayer (copy), v5 (copy), v15 (copy), v1 (copy), claimStreakReward (copy), v9 (copy), v31 (copy), v14 (copy), v20 (copy), pinMission (copy) ]]
		v8.new(p2, {
			Click = function() --[[ Click | Line: 2022 | Upvalues: v33 (ref), v3 (ref), Sonar (ref), v11 (ref), v4 (ref), p1 (copy) ]]
				if v33:GetStatValue("Tames").Value < 5 then
					v3.Prompt({
						Type = "FeatureLocked",
						Setup = function(p1, p2) --[[ Setup | Line: 2026 | Upvalues: Sonar (ref), v11 (ref), v33 (ref) ]]
							p1.Content.ProgressDescription.Description.Text = string.format("Tame %s horses to unlock Quests!", 5)
							p1.Content.Description.Visible = false
							p1.Content.ProgressDescription.Visible = true
							p2.Maid:GiveTask(Sonar("StatBar").new({
								TweenAmount = true,
								Clipped = false,
								Frame = p1.Content.ProgressDescription.ProgressBar.Fill,
								AmountLabel = p1.Content.ProgressDescription.ProgressBar.Progress,
								GetText = function(p1, p2) --[[ GetText | Line: 2037 | Upvalues: v11 (ref) ]]
									return v11.suffix(p1) .. "/" .. v11.suffix(p2)
								end,
								Get = function() --[[ Get | Line: 2041 | Upvalues: v33 (ref) ]]
									return v33:GetStatValue("Tames").Value
								end,
								GetMax = function() --[[ GetMax | Line: 2044 ]]
									return 5
								end,
								Changed = { v33:GetStatValue("Tames"):GetPropertyChangedSignal("Value") }
							}))
						end,
						Run = function() --[[ Run | Line: 2052 ]]
							return true
						end
					})
				else
					v4.OpenTab(p1)
				end
			end
		})
		local function setLocked() --[[ setLocked | Line: 2062 | Upvalues: v33 (ref), p2 (copy) ]]
			if v33:GetStatValue("Tames").Value >= 5 then
				p2.Tab.Locked.Visible = false
			else
				p2.Tab.Locked.Visible = true
			end
		end
		v33:GetStatValue("Tames"):GetPropertyChangedSignal("Value"):Connect(setLocked)
		if v33:GetStatValue("Tames").Value >= 5 then
			p2.Tab.Locked.Visible = false
		else
			p2.Tab.Locked.Visible = true
		end
		local function setUnclaimed() --[[ setUnclaimed | Line: 2072 | Upvalues: getTotalUnclaimedForCategory (ref), p2 (copy) ]]
			local v1 = getTotalUnclaimedForCategory("OneTimeMissions") + getTotalUnclaimedForCategory("StreakMissions")
			p2.Notification.Content.TextLabel.Text = "+" .. v1
			p2.Notification.Visible = v1 > 0
		end
		v33.MissionsChangedSignal:Connect(setUnclaimed)
		local v12 = getTotalUnclaimedForCategory("OneTimeMissions") + getTotalUnclaimedForCategory("StreakMissions")
		p2.Notification.Content.TextLabel.Text = "+" .. v12
		p2.Notification.Visible = if v12 > 0 then true else false
		local function setDailyTimerLabel() --[[ setDailyTimerLabel | Line: 2080 | Upvalues: p1 (copy), v17 (ref), v13 (ref) ]]
			p1.Timer.TextLabel.Text = "Missions refresh in " .. v17.FormatString(v13.DailyStreakMissionTimer:GetTime())
		end
		v13.DailyStreakMissionTimer.TimeChanged:Connect(setDailyTimerLabel)
		p1.Timer.TextLabel.Text = "Missions refresh in " .. v17.FormatString(v13.DailyStreakMissionTimer:GetTime())
		local function setTimerLabel() --[[ setTimerLabel | Line: 2086 | Upvalues: p1 (copy), v17 (ref), v13 (ref) ]]
			p1.Content.ResetLabel.Text = "\226\143\176 Streak resets in " .. v17.FormatString(v13.StreakMissionTimer:GetTime())
		end
		v13.StreakMissionTimer.TimeChanged:Connect(setTimerLabel)
		p1.Content.ResetLabel.Text = "\226\143\176 Streak resets in " .. v17.FormatString(v13.StreakMissionTimer:GetTime())
		local v34 = nil
		local v42 = v7.new()
		local function setStreak() --[[ setStreak | Line: 2094 | Upvalues: v13 (ref), v33 (ref), v34 (ref), v42 (copy), v32 (ref), Sonar (ref), LocalPlayer (ref), p1 (copy), v11 (ref), v5 (ref), v8 (ref), v15 (ref) ]]
			local v1 = v13.GetCurrentStreakTier(v33)
			local v2 = v1 ~= v34
			v34 = v1
			if v2 then
				v42:DoCleaning()
				local v3 = v32[v1.Index]
				local sum = 0
				for k, v in pairs(v3.Rewards) do
					sum = sum + v.P
				end
				for k, v in pairs(v3.Rewards) do
					if v.Species then
						local v4 = Sonar("ItemSetService"):_giveHorse(v33, v)
						local v52 = Sonar("AnimalGridButton").new({
							DisplayName = "Random Themed Horse",
							ForceVisible = true,
							SlotValue = v4,
							Owner = LocalPlayer,
							GuiObject = p1.Content.DisplayPanel.Content.Rewards.DefaultAnimal,
							ParentFrame = p1.Content.DisplayPanel.Content.Rewards,
							Theme = v.Theme,
							GetAmount = function() --[[ GetAmount | Line: 2121 | Upvalues: v (copy) ]]
								return v.Amount
							end
						})
						local ChanceLabel = v52.Frame:FindFirstChild("ChanceLabel", true)
						ChanceLabel.Text = v11.percentage(v.P / sum * 100, 2) .. "%"
						ChanceLabel.Visible = true
						v52.Frame.LayoutOrder = -v.P
						v42:GiveTask(v52)
						continue
					end
					local v6 = v5.GetByName(v.Name)
					local v7 = Sonar("ItemGridButton").new({
						ForceVisible = true,
						Item = v6,
						ParentFrame = p1.Content.DisplayPanel.Content.Rewards,
						Theme = v.Theme,
						GetAmount = function() --[[ GetAmount | Line: 2142 | Upvalues: v (copy) ]]
							return v.Amount
						end
					})
					local ChanceLabel = v7.Frame:FindFirstChild("ChanceLabel", true)
					ChanceLabel.Text = v11.percentage(v.P / sum * 100, 2) .. "%"
					ChanceLabel.Visible = true
					v7.Frame.LayoutOrder = -v.P
					if v6.Description then
						v7:GiveTask(v8.new(v7.Frame, {
							Click = function() --[[ Click | Line: 2154 | Upvalues: v15 (ref), v7 (copy), v6 (copy) ]]
								v15:CreateToolTip({
									Type = "ItemDescription",
									Offset = Vector2.new(0.65, 0.5),
									GuiObject = v7.Frame,
									Get = function() --[[ Get | Line: 2159 | Upvalues: v6 (ref) ]]
										return v6
									end
								})
							end
						}))
					end
					v42:GiveTask(v7)
				end
			end
			p1.Content.DisplayPanel.Content.Title.Text = "STREAK " .. v1.Index
			p1.Content.DisplayPanel.Content.Description.Text = if v33.PlayerData.Missions.StreakMissions.ClaimedTiers[v1.Index].Value then "CLAIMED" else string.format("Earn %s Points and claim these rewards!", v1.Points)
			p1.Content.DisplayPanel.Content.ClaimButton.Visible = if v13.GetStreakPoints(v33) >= v1.Points then not v33.PlayerData.Missions.StreakMissions.ClaimedTiers[v1.Index].Value else false
			p1.Content.DisplayPanel.Content.Description.Visible = not p1.Content.DisplayPanel.Content.ClaimButton.Visible
			p1.Content.DisplayPanel.Content.RewardsLabel.Text = v1.RewardAmount .. " REWARDS"
			local isIndex = v1.Index == 1
			p1.Content.DisplayPanel["T" .. 1].Enabled = isIndex
			p1.Content.DisplayPanel["T" .. 1 .. "Tag"].Visible = isIndex
			local isIndex_2 = v1.Index == 2
			p1.Content.DisplayPanel["T" .. 2].Enabled = isIndex_2
			p1.Content.DisplayPanel["T" .. 2 .. "Tag"].Visible = isIndex_2
			local isIndex_3 = v1.Index == 3
			p1.Content.DisplayPanel["T" .. 3].Enabled = isIndex_3
			p1.Content.DisplayPanel["T" .. 3 .. "Tag"].Visible = isIndex_3
		end
		for k, v in pairs(v33.PlayerData.Missions.StreakMissions.ClaimedTiers:GetChildren()) do
			v:GetPropertyChangedSignal("Value"):Connect(setStreak)
		end
		v33.PlayerData.Missions.StreakMissions.StreakPoints:GetPropertyChangedSignal("Value"):Connect(setStreak)
		setStreak()
		v1.new(p1.Content.DisplayPanel.Content.ClaimButton, {
			Click = function() --[[ Click | Line: 2192 | Upvalues: claimStreakReward (ref) ]]
				claimStreakReward()
			end
		})
		v9.new({
			TweenAmount = false,
			Clipped = false,
			Frame = p1.Content.ProgressBar.Bar,
			AmountLabel = p1.Content.PointsLabel,
			GetText = function(p1) --[[ GetText | Line: 2203 | Upvalues: v11 (ref) ]]
				return v11.suffix(p1) .. " Points"
			end,
			Get = function() --[[ Get | Line: 2206 | Upvalues: v13 (ref), v33 (ref) ]]
				return v13.GetStreakPoints(v33)
			end,
			GetMax = function() --[[ GetMax | Line: 2209 ]]
				return 50
			end,
			Changed = { v33.PlayerData.Missions.StreakMissions.StreakPoints:GetPropertyChangedSignal("Value") }
		})
		for k, v in pairs(v31.Missions) do
			local v52 = v33.PlayerData.Missions.StreakMissions.Missions[k]
			local v6 = v31.Missions[k - 1] and v33.PlayerData.Missions.StreakMissions.Missions[k - 1]
			for k2, v10 in pairs(v.Missions) do
				local v72 = v52.Missions:FindFirstChild(k2)
				local v82 = p1.Content.MissionList.Content.Default:Clone()
				p1.Content.MissionList.Content.Default.Visible = false
				local function setDescriptionLabel() --[[ setDescriptionLabel | Line: 2228 | Upvalues: v13 (ref), k (copy), v72 (copy), v82 (copy) ]]
					local v1 = v13.GetMissionPreset("StreakMissions", k, v72)
					local v2 = v1.Description or v13.Descriptions[v1.Type] or v1.Type
					if v1.DoNotFormat then
						v82.Content.QuestDescription.Text = v2
					else
						v82.Content.QuestDescription.Text = string.format(v2, v72.TargetAmount.Value)
					end
				end
				v72.Amount:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel)
				v72.TargetAmount:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel)
				v72.Type:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel)
				setDescriptionLabel()
				v1.new(v82.Content.ClaimButton, {
					Click = function() --[[ Click | Line: 2243 | Upvalues: k (copy), k2 (copy), v13 (ref), v33 (ref), v14 (ref) ]]
						local v1 = k
						local v2 = k2
						local v3 = v13.CanClaimStreakMission(v33, v1, v2)
						if v3 == true then
							v13.ClaimStreakMission(v1, v2)
						else
							v14.NotifyIssue(v3)
						end
					end
				})
				local function setPinned() --[[ setPinned | Line: 2248 | Upvalues: v82 (copy), v72 (copy), v20 (ref) ]]
					v82.Content.PinButton.Visible = v72.Pinned.Value or not v72.Value
					v82.Content.PinButton.Top.CrossLabel.Visible = v72.Pinned.Value
					v20.SetButtonColor(v82.Content.PinButton, "Diagonal", if v72.Pinned.Value then "Red" else "Blue")
				end
				v72:GetPropertyChangedSignal("Value"):Connect(setPinned)
				v72.Pinned:GetPropertyChangedSignal("Value"):Connect(setPinned)
				v82.Content.PinButton.Visible = v72.Pinned.Value or not v72.Value
				v82.Content.PinButton.Top.CrossLabel.Visible = v72.Pinned.Value
				local SetButtonColor = v20.SetButtonColor
				SetButtonColor(v82.Content.PinButton, "Diagonal", if v72.Pinned.Value then "Red" else "Blue")
				v1.new(v82.Content.PinButton, {
					Click = function() --[[ Click | Line: 2258 | Upvalues: pinMission (ref), k (copy), k2 (copy) ]]
						pinMission("StreakMissions", k, k2)
					end
				})
				local function setLocked_2() --[[ setLocked | Line: 2263 | Upvalues: v6 (copy), v82 (copy) ]]
					if v6 then
						v82.Locked.Visible = not v6.Completed.Value
					else
						v82.Locked.Visible = false
					end
				end
				if v6 then
					v6.Completed:GetPropertyChangedSignal("Value"):Connect(setLocked_2)
				end
				if v6 then
					v82.Locked.Visible = not v6.Completed.Value
				else
					v82.Locked.Visible = false
				end
				local v122 = v7.new()
				local function createReward() --[[ createReward | Line: 2276 | Upvalues: v122 (copy), v72 (copy), v10 (copy), v5 (ref), Sonar (ref), v82 (copy), v8 (ref), v15 (ref) ]]
					v122:DoCleaning()
					local v1 = game:GetService("HttpService"):JSONDecode(v72.Reward.Value)
					local v3 = type(v1[1]) == "table" and v1[1] or v10.Rewards[v1[1]]
					local v4 = v5.GetByName(v3.Name)
					local v52 = Sonar("ItemGridButton").new({
						DoNotClone = true,
						IgnoreBackgroundColor = true,
						ForceVisible = true,
						Item = v4,
						GuiObject = v82.Content.RewardContainer,
						Theme = v3.Theme,
						GetAmount = function() --[[ GetAmount | Line: 2290 | Upvalues: v3 (copy) ]]
							return v3.Amount
						end
					})
					v122:GiveTask(v8.new(v82.Content.RewardContainer, {
						Click = function() --[[ Click | Line: 2296 | Upvalues: v15 (ref), v82 (ref), v4 (copy) ]]
							v15:CreateToolTip({
								Type = "ItemDescription",
								Offset = Vector2.new(0.65, 0.5),
								GuiObject = v82.Content.RewardContainer,
								Get = function() --[[ Get | Line: 2301 | Upvalues: v4 (ref) ]]
									return v4
								end
							})
						end
					}))
					v122:GiveTask(v52)
				end
				v72.Reward:GetPropertyChangedSignal("Value"):Connect(createReward)
				createReward()
				v9.new({
					TweenAmount = false,
					Clipped = false,
					Frame = v82.Content.ProgressBar.Bar,
					AmountLabel = v82.Content.ProgressLabel,
					GetText = function(p1, p2) --[[ GetText | Line: 2319 | Upvalues: v72 (copy) ]]
						if v72.Claimed.Value then
							return "CLAIMED"
						else
							return p1 .. "/" .. p2
						end
					end,
					Get = function() --[[ Get | Line: 2326 | Upvalues: v72 (copy) ]]
						if v72.Value or v72.Claimed.Value then
							return v72.TargetAmount.Value
						else
							return math.min(v72.Amount.Value, v72.TargetAmount.Value)
						end
					end,
					GetMax = function() --[[ GetMax | Line: 2332 | Upvalues: v72 (copy) ]]
						return v72.TargetAmount.Value
					end,
					Changed = {
						v72.Amount:GetPropertyChangedSignal("Value"),
						v72.Claimed:GetPropertyChangedSignal("Value"),
						v72.TargetAmount:GetPropertyChangedSignal("Value"),
						v72:GetPropertyChangedSignal("Value"),
						v82.Locked:GetPropertyChangedSignal("Visible")
					},
					OnChanged = function() --[[ OnChanged | Line: 2342 | Upvalues: v72 (copy), v82 (copy), k (copy), k2 (copy) ]]
						if v72.Value and not v72.Claimed.Value then
							v82.Content.ClaimButton.Visible = true
							v82.Content.ProgressLabel.Visible = false
							v82.LayoutOrder = 1
							return
						end
						v82.Content.ClaimButton.Visible = false
						v82.Content.ProgressLabel.Visible = true
						v82.LayoutOrder = k * 10 + k2 + (if v82.Locked.Visible then 2000 elseif v72.Claimed.Value then 1000 else 0)
					end
				})
				v1.new(v82.Content.ClaimButton, {
					Click = function() --[[ Click | Line: 2357 ]] end
				})
				v82.Visible = true
				v82.Parent = p1.Content.MissionList.Content
			end
		end
	end,
	Story = function(p1, p2) --[[ Story | Line: 2438 | Upvalues: v8 (copy), v33 (copy), v3 (copy), Sonar (copy), v11 (copy), v4 (copy), getTotalUnclaimedForCategory (copy), v30 (copy), v38 (copy), v1 (copy), v18 (copy), setSelectedStoryMission (copy), v2 (copy), ContainerFrame (copy) ]]
		local v12 = p1.Content
		v8.new(p2, {
			Click = function() --[[ Click | Line: 2442 | Upvalues: v33 (ref), v3 (ref), Sonar (ref), v11 (ref), v4 (ref), p1 (copy) ]]
				if v33:GetStatValue("Tames").Value < 5 then
					v3.Prompt({
						Type = "FeatureLocked",
						Setup = function(p1, p2) --[[ Setup | Line: 2446 | Upvalues: Sonar (ref), v11 (ref), v33 (ref) ]]
							p1.Content.ProgressDescription.Description.Text = string.format("Tame %s horses to unlock Story Mode!", 5)
							p1.Content.Description.Visible = false
							p1.Content.ProgressDescription.Visible = true
							p2.Maid:GiveTask(Sonar("StatBar").new({
								TweenAmount = true,
								Clipped = false,
								Frame = p1.Content.ProgressDescription.ProgressBar.Fill,
								AmountLabel = p1.Content.ProgressDescription.ProgressBar.Progress,
								GetText = function(p1, p2) --[[ GetText | Line: 2457 | Upvalues: v11 (ref) ]]
									return v11.suffix(p1) .. "/" .. v11.suffix(p2)
								end,
								Get = function() --[[ Get | Line: 2461 | Upvalues: v33 (ref) ]]
									return v33:GetStatValue("Tames").Value
								end,
								GetMax = function() --[[ GetMax | Line: 2464 ]]
									return 5
								end,
								Changed = { v33:GetStatValue("Tames"):GetPropertyChangedSignal("Value") }
							}))
						end,
						Run = function() --[[ Run | Line: 2472 ]]
							return true
						end
					})
				else
					v4.OpenTab(p1)
				end
			end
		})
		local function setLocked() --[[ setLocked | Line: 2482 | Upvalues: v33 (ref), p2 (copy) ]]
			if v33:GetStatValue("Tames").Value >= 5 then
				p2.Tab.Locked.Visible = false
			else
				p2.Tab.Locked.Visible = true
			end
		end
		v33:GetStatValue("Tames"):GetPropertyChangedSignal("Value"):Connect(setLocked)
		if v33:GetStatValue("Tames").Value >= 5 then
			p2.Tab.Locked.Visible = false
		else
			p2.Tab.Locked.Visible = true
		end
		local function setUnclaimed() --[[ setUnclaimed | Line: 2492 | Upvalues: getTotalUnclaimedForCategory (ref), p2 (copy) ]]
			local v1 = getTotalUnclaimedForCategory("StoryMissions")
			p2.Notification.Content.TextLabel.Text = "+" .. v1
			p2.Notification.Visible = v1 > 0
		end
		v33.MissionsChangedSignal:Connect(setUnclaimed)
		local v22 = getTotalUnclaimedForCategory("StoryMissions")
		p2.Notification.Content.TextLabel.Text = "+" .. v22
		p2.Notification.Visible = if v22 > 0 then true else false
		for v42, v5 in v30.Chapters do
			local v6 = (v42 - 1) * 100
			local v7 = v12.Chapters.Content.ChapterDefault:Clone()
			v12.Chapters.Content.ChapterDefault.Visible = false
			local v82 = v33.PlayerData.Missions.StoryMissions[v42]
			v7.ChapterName.Text = "Chapter " .. v42
			v7.ChapterDescription.Text = v5.DisplayName
			v7.Scene.Image = v5.Image or v7.Scene.Image
			local function setUnlocked() --[[ setUnlocked | Line: 2511 | Upvalues: v7 (copy), v82 (copy) ]]
				v7.Locked.Visible = not v82.Unlocked.Value
			end
			v82.Unlocked:GetPropertyChangedSignal("Value"):Connect(setUnlocked)
			v7.Locked.Visible = not v82.Unlocked.Value
			local function setUnclaimed_2() --[[ setUnclaimed | Line: 2517 | Upvalues: v38 (ref), v82 (copy), v7 (copy) ]]
				local v1 = v38(v82)
				v7.Notification.Content.TextLabel.Text = "+" .. v1
				v7.Notification.Visible = v82.Unlocked.Value and v1 > 0
			end
			v82.Unlocked:GetPropertyChangedSignal("Value"):Connect(setUnclaimed_2)
			v33.MissionsChangedSignal:Connect(setUnclaimed_2)
			local v10 = v38(v82)
			v7.Notification.Content.TextLabel.Text = "+" .. v10
			v7.Notification.Visible = v82.Unlocked.Value and v10 > 0
			v7.Visible = true
			v7.LayoutOrder = v6
			v7.Parent = v12.Chapters.Content
			for v122, v13 in v5.Stories do
				local v14 = v12.Chapters.Content.StoryDefault:Clone()
				v12.Chapters.Content.StoryDefault.Visible = false
				local v15 = v82.Stories[tonumber(v122)]
				v14.Content.Title.Text = v13.DisplayName
				local function setChapterStarted() --[[ setChapterStarted | Line: 2537 | Upvalues: v82 (copy), v7 (copy) ]]
					local v1 = false
					for k, v in pairs(v82.Stories:GetChildren()) do
						if v.Started.Value then
							v1 = true
							break
						end
					end
					v7.StartedLabel.Visible = v1
				end
				local function setProgress() --[[ setProgress | Line: 2547 | Upvalues: v15 (copy), v13 (copy), v14 (copy), setChapterStarted (copy) ]]
					if v15.Unlocked.Value and not v13.Locked then
						v14.Content.BackgroundColor3 = v15.Completed.Value and Color3.fromRGB(205, 247, 174) or (v15.Started.Value and Color3.fromRGB(255, 226, 120) or Color3.fromRGB(255, 255, 255))
						v14.Content.Locked.Visible = false
						if v15.Completed.Value then
							v14.Content.Notification.Visible = not v15.Claimed.Value
							v14.Content.ProgressLabel.Visible = false
							v14.Content.Check.Visible = true
						else
							local count = 0
							for k, v in pairs(v15.Missions:GetChildren()) do
								if v.Value then
									count = count + 1
								end
							end
							v14.Content.ProgressLabel.Text = count .. "/" .. #v13.Missions
							v14.Content.ProgressLabel.Visible = v15.Started.Value
							v14.Content.Check.Visible = false
							v14.Content.Notification.Visible = false
						end
					else
						v14.Content.Notification.Visible = false
						v14.Content.Locked.Visible = true
						v14.Content.ProgressLabel.Visible = false
						v14.Content.Check.Visible = false
						v14.Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					end
					setChapterStarted()
				end
				v15.Unlocked:GetPropertyChangedSignal("Value"):Connect(setProgress)
				v15.Completed:GetPropertyChangedSignal("Value"):Connect(setProgress)
				v15.Started:GetPropertyChangedSignal("Value"):Connect(setProgress)
				v15.Claimed:GetPropertyChangedSignal("Value"):Connect(setProgress)
				for k, v in pairs(v15.Missions:GetChildren()) do
					v:GetPropertyChangedSignal("Value"):Connect(setProgress)
				end
				setProgress()
				v1.new(v14, {
					Click = function() --[[ Click | Line: 2590 | Upvalues: v15 (copy), v18 (ref), v13 (copy), setSelectedStoryMission (ref), v42 (copy), v122 (copy) ]]
						if not v15.Unlocked.Value then
							v18.Notify({
								Message = "You have to complete the previous story to unlock this!",
								Type = "StoryLocked"
							})
							return
						end
						if v13.Locked then
							v18.Notify({
								Message = "This story is not yet released!",
								Preset = "Red"
							})
						else
							setSelectedStoryMission(v42, v122, v15)
						end
					end
				})
				if v42 == 1 and v122 == 1 then
					local v16 = false
					v2.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 2613 | Upvalues: v16 (ref), setSelectedStoryMission (ref), v42 (copy), v122 (copy), v15 (copy) ]]
						if not v16 then
							v16 = true
							setSelectedStoryMission(v42, v122, v15)
						end
					end)
				end
				v14.Visible = true
				v14.LayoutOrder = v6 + v122
				v14.Parent = v12.Chapters.Content
			end
		end
	end
}
local v40 = false
function t.OnOpen(p1, p2, p3) --[[ OnOpen | Line: 2629 | Upvalues: v4 (copy), ContainerFrame (copy), v29 (copy), v33 (copy), setSelectedSpeciesMission (copy), v13 (copy), setSelectedSpeciesUnlockMission (copy), v40 (ref) ]]
	local v1 = if p2 then ContainerFrame.Menu.TabFrames:FindFirstChild(p2) or ContainerFrame.Menu.TabFrames.Horses else v4.getOpenedTab(ContainerFrame) or ContainerFrame.Menu.TabFrames.Horses
	if v1 == ContainerFrame.Menu.TabFrames.Horses then
		if p3 and v29.Missions[p3] then
			local v42 = v33.PlayerData.Missions.SpeciesMissions[p3]
			if v42 and v42.Started.Value then
				setSelectedSpeciesMission(v13.GetTimedSpeciesMission(v33, p3))
			else
				setSelectedSpeciesUnlockMission(v29.Missions[p3])
			end
		elseif v33.PlayerData.Missions.SpeciesUnlocks.Horse.Completed.Value then
			if v33:HasUnlockedSpecies("Pony") then
				setSelectedSpeciesUnlockMission()
			else
				setSelectedSpeciesUnlockMission(v29.Missions.Pony)
			end
		else
			if v40 then
				setSelectedSpeciesUnlockMission(v29.Missions.Horse)
			end
			v40 = true
		end
	end
	v4.OpenTab(v1)
end
function t.OnClose(p1) --[[ OnClose | Line: 2660 | Upvalues: v2 (copy), ContainerFrame (copy), t (copy) ]]
	if v2.MainFrameOpen ~= ContainerFrame then
		return
	end
	t.Close(true)
end
function t.ClaimMission(p1, ...) --[[ ClaimMission | Line: 2666 | Upvalues: claimSpeciesUnlockMissionReward (copy), claimSpeciesMissionReward (copy), claimStoryMissionReward (copy), claimOneTimeMissionReward (copy), v13 (copy), v33 (copy), v14 (copy) ]]
	if p1 == "SpeciesUnlocks" then
		claimSpeciesUnlockMissionReward(...)
		return
	end
	if p1 == "SpeciesMissions" then
		claimSpeciesMissionReward(...)
		return
	end
	if p1 == "StoryMissions" then
		claimStoryMissionReward(...)
		return
	end
	if p1 == "OneTimeMissions" then
		claimOneTimeMissionReward(...)
		return
	end
	if p1 ~= "StreakMissions" then
		return
	end
	local v1, v2 = ...
	local v3 = v13.CanClaimStreakMission(v33, v1, v2)
	if v3 ~= true then
		v14.NotifyIssue(v3)
		return
	end
	v13.ClaimStreakMission(v1, v2)
end
function t.OpenAtMission(p1) --[[ OpenAtMission | Line: 2680 | Upvalues: t (copy) ]]
	t.Open(nil, p1)
end
function t.Open(...) --[[ Open | Line: 2684 | Upvalues: v33 (copy), v3 (copy), Sonar (copy), v37 (ref), v2 (copy), ContainerFrame (copy) ]]
	if v33:GetStatValue("Tames").Value <= 0 then
		v3.Prompt({
			OverwritePrompt = true,
			Type = "FeatureLocked",
			Setup = function(p1, p2) --[[ Setup | Line: 2689 ]]
				p1.Content.Description.Text = "Tame a horse to access your Quests!"
				p1.Content.Description.Visible = true
				p1.Content.ProgressDescription.Visible = false
			end,
			Run = function() --[[ Run | Line: 2694 ]]
				return true
			end
		})
		return
	end
	if v33:GetStatValue("Tames").Value <= 5 then
		Sonar("TutorialClient"):Post("OpenedJournal")
	end
	v33._openedJournal = true
	if v33._journalTweens then
		for v1, v22 in v33._journalTweens do
			v22:Cancel()
			v1.UIScale.Scale = 1
			if v37 then
				v37:Disconnect()
				v1.Button.UIStroke.Enabled = false
			end
		end
	end
	if not v2.IsFrameOpen(ContainerFrame) then
		v2.OpenMainFrame(ContainerFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	end
end
function t.Close(p1) --[[ Close | Line: 2730 | Upvalues: t (copy), Sonar (copy), v2 (copy), ContainerFrame (copy) ]]
	t.CloseSignal:Fire()
	Sonar("PinnedMissionsGui").TweenSidebar()
	v2.CloseFrame(ContainerFrame, {})
	v2.OpenHUD({
		DoNotCloseMainFrame = p1
	})
end
function t.Init(p1) --[[ Init | Line: 2746 | Upvalues: v2 (copy), ContainerFrame (copy), Selected (copy), v4 (copy), t3 (copy), v33 (copy), v8 (copy), Sonar (copy), HUDGui (copy), v37 (ref), getTotalUnclaimedForAll (copy), v1 (copy), t (copy), setSelectedSpeciesUnlockMission (copy), setSelectedSpeciesMission (copy) ]]
	v2.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = function() --[[ SelectOnOpen | Line: 2753 | Upvalues: Selected (ref), ContainerFrame (ref) ]]
			if Selected.Visible then
				return Selected.MissionList.Content
			else
				return ContainerFrame.Menu.TabFrames.Horses.Content.Missions.Content
			end
		end
	})
	for k, v in pairs(ContainerFrame.TabButtons:GetChildren()) do
		if v:IsA("ImageButton") then
			local v12 = ContainerFrame.Menu.TabFrames:FindFirstChild(v.Name)
			if v12 then
				v4.AddTab(v12, {
					ParentFrame = ContainerFrame,
					Button = v
				})
				t3[v.Name](v12, v)
				local function setSize() --[[ setSize | Line: 2775 | Upvalues: v (copy), v4 (ref), v12 (copy) ]]
					v.UIScale.Scale = if v4.IsTabOpen(v12) then 1.2 else 1
				end
				v4.AddStateCallback(v12, "OnOpen", setSize)
				v4.AddStateCallback(v12, "OnClose", setSize)
			end
		end
	end
	v33:HasUnlockedSpecies("Equus")
	local Equus = v33.PlayerData.Missions.SpeciesUnlocks.Equus
	local function setMapLocked() --[[ setMapLocked | Line: 2792 | Upvalues: Equus (copy), ContainerFrame (ref) ]]
		if Equus.Completed.Value then
			ContainerFrame.TabButtons.Map.Tab.Locked.Visible = false
		else
			ContainerFrame.TabButtons.Map.Tab.Locked.Visible = true
		end
	end
	Equus.Completed:GetPropertyChangedSignal("Value"):Connect(setMapLocked)
	if Equus.Completed.Value then
		ContainerFrame.TabButtons.Map.Tab.Locked.Visible = false
	else
		ContainerFrame.TabButtons.Map.Tab.Locked.Visible = true
	end
	v8.new(ContainerFrame.TabButtons.Map, {
		Click = function() --[[ Click | Line: 2803 | Upvalues: v33 (ref), Sonar (ref) ]]
			if not (v33.PlayerData.Stats.Tames.Value < 1) then
				Sonar("MapGui").Open()
			end
		end
	})
	for k, v in pairs(HUDGui.RightFrame:GetChildren()) do
		local JournalButton = v:FindFirstChild("JournalButton", true)
		if JournalButton then
			local function setButton() --[[ setButton | Line: 2817 | Upvalues: JournalButton (copy) ]]
				local TweenService = game.TweenService
				local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
				local t = {}
				t.Scale = if JournalButton.Button:FindFirstChild("Color").Menu.Locked.Visible then 0.85 else 1
				TweenService:Create(JournalButton.UIScale, v1, t):Play()
			end
			JournalButton.Button:FindFirstChild("Color").Menu.Locked:GetPropertyChangedSignal("Visible"):Connect(setButton)
			setButton()
			JournalButton.Visible = true
			local function setUnlocked() --[[ setUnlocked | Line: 2824 | Upvalues: v33 (ref), JournalButton (copy), v37 (ref) ]]
				local v1 = v33:GetStatValue("Tames")
				local v2 = JournalButton
				v2.Visible = v1.Value > 0
				if v1.Value <= 0 then
					JournalButton.Button.BackgroundTransparency = 0.75
					JournalButton.Button:FindFirstChild("Color").BackgroundTransparency = 0.65
					JournalButton.Button:FindFirstChild("Color").Menu.BackgroundTransparency = 0.5
					JournalButton.Button:FindFirstChild("Color").Menu.Icon.ImageTransparency = 0.5
					JournalButton.Button:FindFirstChild("Color").Menu.Locked.Visible = true
					JournalButton.Button.Title.TextTransparency = 0.25
					JournalButton.Button.Title.UIStroke.Transparency = 0.75
				else
					JournalButton.Button.BackgroundTransparency = 0
					JournalButton.Button:FindFirstChild("Color").BackgroundTransparency = 0
					JournalButton.Button:FindFirstChild("Color").Menu.BackgroundTransparency = 0
					JournalButton.Button:FindFirstChild("Color").Menu.Icon.ImageTransparency = 0
					JournalButton.Button:FindFirstChild("Color").Menu.Locked.Visible = false
					JournalButton.Button.Title.TextTransparency = 0
					JournalButton.Button.Title.UIStroke.Transparency = 0.5
				end
				if not (v1.Value <= 5) or v33._openedJournal then
					return
				end
				if not v33._journalTweens then
					v33._journalTweens = {}
				end
				local v4 = game:GetService("TweenService"):Create(JournalButton.UIScale, TweenInfo.new(0.45, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 9000000000, true), {
					Scale = JournalButton.UIScale.Scale * 1.2
				})
				JournalButton.Button.UIStroke.Enabled = true
				v37 = game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 2857 | Upvalues: JournalButton (ref) ]]
					JournalButton.Button.UIStroke.UIGradient.Rotation = JournalButton.Button.UIStroke.UIGradient.Rotation + 1
					if not (JournalButton.Button.UIStroke.UIGradient.Rotation >= 180) then
						return
					end
					JournalButton.Button.UIStroke.UIGradient.Rotation = -180
				end)
				v33._journalTweens[JournalButton] = v4
				v4:Play()
			end
			v33:GetStatValue("Tames"):GetPropertyChangedSignal("Value"):Connect(setUnlocked)
			setUnlocked()
			local function setUnclaimed() --[[ setUnclaimed | Line: 2876 | Upvalues: getTotalUnclaimedForAll (ref), JournalButton (copy) ]]
				local v1 = getTotalUnclaimedForAll()
				JournalButton.Button.Notification.Content.TextLabel.Text = "+" .. v1
				JournalButton.Button.Notification.Visible = v1 > 0
			end
			v33.MissionsChangedSignal:Connect(setUnclaimed)
			local v22 = getTotalUnclaimedForAll()
			JournalButton.Button.Notification.Content.TextLabel.Text = "+" .. v22
			JournalButton.Button.Notification.Visible = v22 > 0
			v1.new(JournalButton.Button, {
				Rotate = false,
				AddHoverButton = true,
				HoverUpLabel = JournalButton:FindFirstChild("Icon", true),
				Click = t.Open
			})
		end
	end
	v2.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 2893 | Upvalues: t (ref) ]]
		t:OnOpen(...)
	end)
	v2.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 2896 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
	v1.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 2901 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v1.new(ContainerFrame.Menu.HelpButton, {
		Click = function() --[[ Click | Line: 2906 | Upvalues: Sonar (ref) ]]
			Sonar("TutorialService").PromptInfo("Journal")
		end
	})
	setSelectedSpeciesUnlockMission()
	setSelectedSpeciesMission()
end
t:Init()
return t