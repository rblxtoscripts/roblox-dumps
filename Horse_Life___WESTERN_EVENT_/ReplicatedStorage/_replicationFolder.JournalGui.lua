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
local v10 = Sonar("AnimalDataService")
local v11 = Sonar("AnimalCosmetics")
local v12 = Sonar("FormatNumber")
local v13 = Sonar("DisplayUtils")
local v14 = Sonar("MissionsService")
local v15 = Sonar("IssueResponseClient")
local v16 = Sonar("ToolTipClient")
local v17 = Sonar("DynamicNPCService")
local v18 = Sonar("TimeUtils")
local v19 = Sonar("NotificationsClient")
local v20 = Sonar("RemoteUtils")
local v21 = Sonar("GuiUtils")
local v22 = Sonar("FormatString")
local v23 = Sonar("MarketplaceUtils")
local v24 = Sonar("TutorialService")
local v25 = Sonar("BreedUtils")
local v26 = Sonar("DiscoveryClient", {
	Deferred = true
})
local v27 = Sonar("State")
local v28 = Sonar("ActivityUpgradesService")
local v29 = Sonar("PremiumShopGui")
local v30 = Sonar("ItemGridButton")
local v31 = Sonar("StorageUtils")
local v32 = Sonar("PlaceTypeService")
local v33 = Sonar("Constants")
local v34 = Sonar(v31.Get("SpeciesUnlocks"))
local v35 = Sonar(v31.Get("SpeciesUpgrades"))
local v36 = Sonar(v31.Get("StoryMissions"))
local v37 = Sonar(v31.Get("StreakMissions"))
local v38 = Sonar(v31.Get("StreakTiers"))
local Colors = v33.Colors
local LocalPlayer = game:GetService("Players").LocalPlayer
local v39 = Sonar("PlayerWrapper").GetClient()
local JournalGui = LocalPlayer.PlayerGui:WaitForChild("JournalGui")
local ContainerFrame = JournalGui.ContainerFrame
local Selected = ContainerFrame.Menu.TabFrames.Horses.Content.Selected
local v40 = ContainerFrame.Menu.TabFrames.Story.Content
local ActivityUpgrades = ContainerFrame.Menu.TabFrames.Horses.Content.ActivityUpgrades
local Selected_2 = ContainerFrame.Menu.TabFrames.HorsesTest.Content.Selected
local v41 = v7.new()
local v42 = v7.new()
local v43 = v7.new()
local v44 = v7.new()
local v45 = v20.GetUnreliableRemoteEvent("ReportClientAnalyticsRemote")
local v46 = nil
local function createSpeciesViewport(p1, p2, p3, p4) --[[ createSpeciesViewport | Line: 75 | Upvalues: v7 (copy), v14 (copy), v39 (copy), Sonar (copy), v6 (copy), v11 (copy) ]]
	local v1 = v7.new()
	local v2 = v14.GetSlotInfoForMission(v39, {
		Species = p2.Name,
		SlotInfo = p3,
		SeedOffset = p4
	})
	for k, v in pairs({ p1, p1:FindFirstChild("Viewport") }) do
		v2.Age.Value = 66
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
		v1:GiveTask(v11.new(v3, {
			InViewport = true,
			SlotValue = v2
		}))
		v1:GiveTask(v4)
	end
	return v1
end
local function createNPCViewport(p1, p2) --[[ createNPCViewport | Line: 118 | Upvalues: v7 (copy), v6 (copy) ]]
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
local function claimSpeciesUnlockMissionReward(p1, p2) --[[ claimSpeciesUnlockMissionReward | Line: 138 | Upvalues: v14 (copy), v39 (copy), v15 (copy), Sonar (copy) ]]
	local v1 = v14.CanClaimSpeciesUnlockMission(v39, p1, p2)
	if v1 ~= true then
		v15.NotifyIssue(v1)
		return
	end
	local v2 = v14.ClaimSpeciesUnlockMission(p1, p2)
	if not v2 or v2 == true then
		return
	end
	task.wait()
	Sonar("DisplayAnimalClient"):DisplaySlot({
		Type = "Claimed",
		AllowNaming = true,
		ShowMaxWarning = true,
		MobileClickBackgroundToClose = true,
		Slot = v39:GetItemFolder("Animals"):WaitForChild(v2)
	})
end
local function claimOneTimeMissionReward(p1, p2) --[[ claimOneTimeMissionReward | Line: 159 | Upvalues: v14 (copy), v39 (copy), v15 (copy), Sonar (copy) ]]
	local v1 = v14.CanClaimOneTimeMission(v39, p1, p2)
	if v1 ~= true then
		v15.NotifyIssue(v1)
		return
	end
	local v2 = v14.ClaimOneTimeMission(p1, p2)
	if not v2 or v2 == true then
		return
	end
	task.wait()
	Sonar("DisplayAnimalClient"):DisplaySlot({
		Type = "Claimed",
		AllowNaming = true,
		ShowMaxWarning = true,
		MobileClickBackgroundToClose = true,
		Slot = v39:GetItemFolder("Animals"):WaitForChild(v2)
	})
end
local function claimSpeciesMissionReward(p1, p2) --[[ claimSpeciesMissionReward | Line: 179 | Upvalues: v14 (copy), v39 (copy), v15 (copy), Sonar (copy) ]]
	local v1 = v14.CanClaimSpeciesMission(v39, p1, p2)
	if v1 ~= true then
		v15.NotifyIssue(v1)
		return
	end
	local v2 = v14.ClaimSpeciesMission(p1, p2)
	if not v2 or v2 == true then
		return
	end
	task.wait()
	Sonar("DisplayAnimalClient"):DisplaySlot({
		Type = "Claimed",
		AllowNaming = true,
		ShowMaxWarning = true,
		MobileClickBackgroundToClose = true,
		Slot = v39:GetItemFolder("Animals"):WaitForChild(v2[1])
	})
end
local function claimStoryMissionReward(...) --[[ claimStoryMissionReward | Line: 199 | Upvalues: v14 (copy), v39 (copy), v15 (copy) ]]
	local v1 = v14.CanClaimStoryMission(v39, ...)
	if v1 == true then
		v14.ClaimStoryMission(...)
	else
		v15.NotifyIssue(v1)
	end
end
local function claimStreakMissionReward(p1, p2) --[[ claimStreakMissionReward | Line: 208 | Upvalues: v14 (copy), v39 (copy), v15 (copy) ]]
	local v1 = v14.CanClaimStreakMission(v39, p1, p2)
	if v1 == true then
		v14.ClaimStreakMission(p1, p2)
	else
		v15.NotifyIssue(v1)
	end
end
local function claimStreakReward() --[[ claimStreakReward | Line: 217 | Upvalues: v14 (copy), v39 (copy), v15 (copy), Sonar (copy) ]]
	local v1 = v14.CanClaimStreakReward(v39)
	if v1 ~= true then
		v15.NotifyIssue(v1)
		return
	end
	local v2 = v14.ClaimStreakReward()
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
			Slot = v39:GetItemFolder("Animals"):WaitForChild(v2[1])
		})
		if Sonar("DisplayAnimalClient").YieldForNoDisplay() then
			task.wait(0.5)
		end
	end
end
local function claimTutorialMissionReward(p1, p2) --[[ claimTutorialMissionReward | Line: 244 | Upvalues: v14 (copy), v39 (copy), v15 (copy), Sonar (copy) ]]
	local v1 = v14.CanClaimTutorialMission(v39, p1, p2)
	if v1 ~= true then
		v15.NotifyIssue(v1)
		return
	end
	local v2 = v14.ClaimTutorialMission(p1, p2)
	if not v2 or v2 == true then
		return
	end
	task.wait()
	Sonar("DisplayAnimalClient"):DisplaySlot({
		Type = "Claimed",
		AllowNaming = true,
		ShowMaxWarning = true,
		MobileClickBackgroundToClose = true,
		Slot = v39:GetItemFolder("Animals"):WaitForChild(v2)
	})
end
local function claimWorldMissionReward(p1, p2) --[[ claimWorldMissionReward | Line: 264 | Upvalues: v14 (copy), v39 (copy), v15 (copy), Sonar (copy) ]]
	local v1 = v14.CanClaimWorldMission(v39, p1, p2)
	if v1 ~= true then
		v15.NotifyIssue(v1)
		return
	end
	local v2 = v14.ClaimWorldMissionReward(p1, p2)
	if not v2 or v2 == true then
		return
	end
	task.wait()
	Sonar("DisplayAnimalClient"):DisplaySlot({
		Type = "Claimed",
		AllowNaming = true,
		ShowMaxWarning = true,
		MobileClickBackgroundToClose = true,
		Slot = v39:GetItemFolder("Animals"):WaitForChild(v2)
	})
end
local function isMissionUnclaimed(p1) --[[ isMissionUnclaimed | Line: 284 ]]
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
local function v47(p1) --[[ getTotalUnclaimedForType | Line: 304 | Upvalues: isMissionUnclaimed (copy), v47 (copy) ]]
	local sum = 0
	if p1:FindFirstChild("Missions") then
		for k, v in pairs(p1.Missions:GetChildren()) do
			sum = sum + (if isMissionUnclaimed(v) then 1 else 0)
		end
	elseif p1:FindFirstChild("Stories") then
		for k, v in pairs(p1.Stories:GetChildren()) do
			sum = sum + v47(v)
		end
	end
	if isMissionUnclaimed(p1) then
		sum = sum + 1
	end
	return sum
end
local function getUnclaimedForSpecies(p1) --[[ getUnclaimedForSpecies | Line: 321 | Upvalues: v39 (copy), v47 (copy) ]]
	local sum = 0
	local v1 = v39.PlayerData.Missions.SpeciesUnlocks[p1]
	if v1 then
		sum = sum + v47(v1)
	end
	local v2 = v39.PlayerData.Missions.SpeciesMissions[p1]
	if v2 then
		sum = sum + v47(v2)
	end
	return sum
end
local function getTotalUnclaimedForCategory(p1) --[[ getTotalUnclaimedForCategory | Line: 339 | Upvalues: v39 (copy), v47 (copy) ]]
	local v1 = v39.PlayerData.Missions[p1]
	local sum = 0
	for k, v in pairs((v1:FindFirstChild("Missions") or v1):GetChildren()) do
		sum = sum + v47(v)
	end
	return sum
end
function t._getTotalUnclaimedForAll() --[[ getTotalUnclaimedForAll | Line: 349 | Upvalues: v39 (copy), v47 (copy) ]]
	local sum = 0
	for k, v in pairs(v39.PlayerData.Missions:GetChildren()) do
		if v.Name ~= "Achivements" then
			for k2, v2 in pairs(v:GetChildren()) do
				if v2.Name == "Missions" then
					for k3, v3 in pairs(v2:GetChildren()) do
						sum = sum + v47(v3)
					end
					continue
				end
				sum = sum + v47(v2)
			end
		end
	end
	return sum
end
local function v48(p1, p2, p3) --[[ startStoryMission | Line: 371 | Upvalues: v14 (copy), v39 (copy), v3 (copy), v48 (copy) ]]
	if not p3 then
		local v1 = v14.GetStartedStoryMissions(v39)
		if next(v1) then
			v3.Prompt({
				Type = "StartNewStoryMission",
				Setup = function(p1) --[[ Setup | Line: 377 | Upvalues: v1 (copy) ]]
					p1.Content.StoryLabel.Text = string.format("You already have progress in a story, %s!", v1[1].Data.DisplayName)
				end,
				Run = function() --[[ Run | Line: 381 | Upvalues: v48 (ref), p1 (copy), p2 (copy) ]]
					v48(p1, p2, true)
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 385 ]]
					return true
				end
			})
			return
		end
	end
	if v14.CanStartStoryMission(v39, p1, p2) == true then
		v14.StartStoryMission(p1, p2)
	end
end
local function pinMission(...) --[[ pinMission | Line: 401 | Upvalues: v20 (copy) ]]
	return v20.GetRemoteFunction("PinMissionRemote"):InvokeServer(...)
end
local function setSelectedStoryMission(p1, p2, p3) --[[ setSelectedStoryMission | Line: 407 | Upvalues: v42 (copy), v36 (copy), v40 (copy), v18 (copy), v21 (copy), v1 (copy), pinMission (copy), v48 (copy), claimStoryMissionReward (copy), v5 (copy), Sonar (copy), v8 (copy), v16 (copy), v14 (copy), v9 (copy) ]]
	v42:DoCleaning()
	if not p1 then
		return
	end
	local v12 = v36.Chapters[p1].Stories[p2]
	local Title = v40.QuestContent.Narrative.Title
	Title.Text = v12.DisplayName or "Story " .. p2
	v40.QuestContent.Narrative.Description.Text = v12.Description or "Description needed for story"
	local SceneImage = v40.QuestContent.Narrative.SceneImage
	SceneImage.Image = v12.Image or v40.QuestContent.Narrative.SceneImage.Image
	local function setReplayButton() --[[ setReplayButton | Line: 422 | Upvalues: p3 (copy), v18 (ref), v40 (ref) ]]
		v40.QuestContent.ReplayButton.Visible = if p3.Value - v18.Get() <= 0 then p3.Unlocked.Value and (not p3.Started.Value and p3.Claimed.Value) else false
		v40.QuestContent.ReplayNotice.Visible = v40.QuestContent.ReplayButton.Visible
	end
	v42:GiveTask(p3.Unlocked:GetPropertyChangedSignal("Value"):Connect(setReplayButton))
	v42:GiveTask(p3.Claimed:GetPropertyChangedSignal("Value"):Connect(setReplayButton))
	v42:GiveTask(p3.Started:GetPropertyChangedSignal("Value"):Connect(setReplayButton))
	local v4 = p3.Value - v18.Get()
	local ReplayButton = v40.QuestContent.ReplayButton
	ReplayButton.Visible = if v4 <= 0 then p3.Unlocked.Value and (not p3.Started.Value and p3.Claimed.Value) else false
	v40.QuestContent.ReplayNotice.Visible = v40.QuestContent.ReplayButton.Visible
	local function setStartButton() --[[ setStartButton | Line: 437 | Upvalues: v40 (ref), p3 (copy), v12 (copy) ]]
		v40.QuestContent.StartButton.Visible = p3.Unlocked.Value and not p3.Started.Value and not p3.Claimed.Value and not v12.Locked
	end
	v42:GiveTask(p3.Unlocked:GetPropertyChangedSignal("Value"):Connect(setStartButton))
	v42:GiveTask(p3.Claimed:GetPropertyChangedSignal("Value"):Connect(setStartButton))
	v42:GiveTask(p3.Started:GetPropertyChangedSignal("Value"):Connect(setStartButton))
	local StartButton = v40.QuestContent.StartButton
	StartButton.Visible = p3.Unlocked.Value and not p3.Started.Value and not p3.Claimed.Value and not v12.Locked
	local function setClaimButton() --[[ setClaimButton | Line: 448 | Upvalues: v40 (ref), p3 (copy) ]]
		v40.QuestContent.ClaimButton.Visible = p3.Completed.Value and not p3.Claimed.Value
		v40.QuestContent.ClaimNotice.Visible = v40.QuestContent.ClaimButton.Visible
	end
	v42:GiveTask(p3.Completed:GetPropertyChangedSignal("Value"):Connect(setClaimButton))
	v42:GiveTask(p3.Claimed:GetPropertyChangedSignal("Value"):Connect(setClaimButton))
	local ClaimButton = v40.QuestContent.ClaimButton
	ClaimButton.Visible = p3.Completed.Value and not p3.Claimed.Value
	v40.QuestContent.ClaimNotice.Visible = v40.QuestContent.ClaimButton.Visible
	local function setPinned() --[[ setPinned | Line: 459 | Upvalues: v40 (ref), p3 (copy), v21 (ref) ]]
		v40.QuestContent.PinButton.Visible = p3.Pinned.Value or not p3.Completed.Value
		v40.QuestContent.PinButton.Top.CrossLabel.Visible = p3.Pinned.Value
		v21.SetButtonColor(v40.QuestContent.PinButton, "Diagonal", if p3.Pinned.Value then "Red" else "Blue")
	end
	v42:GiveTask(p3.Completed:GetPropertyChangedSignal("Value"):Connect(setPinned))
	v42:GiveTask(p3.Pinned:GetPropertyChangedSignal("Value"):Connect(setPinned))
	local PinButton = v40.QuestContent.PinButton
	PinButton.Visible = p3.Pinned.Value or not p3.Completed.Value
	v40.QuestContent.PinButton.Top.CrossLabel.Visible = p3.Pinned.Value
	local SetButtonColor = v21.SetButtonColor
	local PinButton_2 = v40.QuestContent.PinButton
	SetButtonColor(PinButton_2, "Diagonal", if p3.Pinned.Value then "Red" else "Blue")
	v42:GiveTask(v1.new(v40.QuestContent.PinButton, {
		Click = function() --[[ Click | Line: 475 | Upvalues: pinMission (ref), p1 (copy), p2 (copy) ]]
			pinMission("StoryMissions", p1, p2)
		end
	}))
	v42:GiveTask(v1.new(v40.QuestContent.ReplayButton, {
		Click = function() --[[ Click | Line: 481 | Upvalues: v48 (ref), p1 (copy), p2 (copy) ]]
			v48(p1, p2)
		end
	}))
	v42:GiveTask(v1.new(v40.QuestContent.StartButton, {
		Click = function() --[[ Click | Line: 487 | Upvalues: v48 (ref), p1 (copy), p2 (copy) ]]
			v48(p1, p2)
		end
	}))
	v42:GiveTask(v1.new(v40.QuestContent.ClaimButton, {
		Click = function() --[[ Click | Line: 493 | Upvalues: claimStoryMissionReward (ref), p1 (copy), p2 (copy) ]]
			claimStoryMissionReward(p1, p2)
		end
	}))
	local function setTimerLabel() --[[ setTimerLabel | Line: 498 | Upvalues: p3 (copy), v18 (ref), v40 (ref) ]]
		local v1 = p3.Value - v18.Get()
		if v1 > 0 and (p3.Completed.Value and p3.Claimed.Value) then
			v40.QuestContent.Timer.TextLabel.Text = "Can replay in " .. v18.FormatString(v1)
			v40.QuestContent.Timer.Visible = true
		else
			v40.QuestContent.Timer.Visible = false
		end
		v40.QuestContent.ReplayButton.Visible = if p3.Value - v18.Get() <= 0 then p3.Unlocked.Value and (not p3.Started.Value and p3.Claimed.Value) else false
		v40.QuestContent.ReplayNotice.Visible = v40.QuestContent.ReplayButton.Visible
	end
	v42:GiveTask(v18.AttachToTime(setTimerLabel))
	v42:GiveTask(p3.Claimed:GetPropertyChangedSignal("Value"):Connect(setTimerLabel))
	v42:GiveTask(p3.Completed:GetPropertyChangedSignal("Value"):Connect(setTimerLabel))
	v42:GiveTask(p3:GetPropertyChangedSignal("Value"):Connect(setTimerLabel))
	setTimerLabel()
	for k, v in pairs(v12.Rewards) do
		local v11 = v5.GetByName(v.Name)
		local v122 = Sonar("ItemGridButton").new({
			ForceVisible = true,
			Item = v11,
			ParentFrame = v40.QuestContent.RewardsContainer.Content,
			Theme = v.Theme,
			GetAmount = function() --[[ GetAmount | Line: 524 | Upvalues: v (copy) ]]
				return v.Amount
			end
		})
		if v11.Description then
			v122:GiveTask(v8.new(v122.Frame, {
				Click = function() --[[ Click | Line: 530 | Upvalues: v16 (ref), v122 (copy), v11 (copy) ]]
					v16:CreateToolTip({
						Type = "ItemDescription",
						Offset = Vector2.new(0.65, 0.5),
						GuiObject = v122.Frame,
						Get = function() --[[ Get | Line: 535 | Upvalues: v11 (ref) ]]
							return v11
						end
					})
				end
			}))
		end
		v42:GiveTask(v122)
	end
	for v13, v142 in v12.Missions do
		local v15 = p3.Missions:FindFirstChild(v13)
		local v162 = v40.QuestContent.TasksContainer.Tasks.Default:Clone()
		v40.QuestContent.TasksContainer.Tasks.Default.Visible = false
		v162.Content.QuestDescription.Text = v142.Description and string.format(v142.Description, v142.Amount) or string.format(v14.Descriptions[v142.Type], v142.Amount)
		local v182 = p3.Missions:FindFirstChild(v13 - 1)
		local function setLocked() --[[ setLocked | Line: 555 | Upvalues: v162 (copy), v182 (copy), p3 (copy) ]]
			v162.Locked.Visible = v182 and not v182.Value and not p3.Completed.Value
		end
		v42:GiveTask(p3.Completed:GetPropertyChangedSignal("Value"):Connect(setLocked))
		if v182 then
			v42:GiveTask(v182:GetPropertyChangedSignal("Value"):Connect(setLocked))
		end
		v162.Locked.Visible = if v182 then not v182.Value and not p3.Completed.Value else v182
		v42:GiveTask(v9.new({
			TweenAmount = false,
			Clipped = false,
			Frame = v162.Content.ProgressBar.Bar,
			AmountLabel = v162.Content.ProgressLabel,
			GetText = function(p1, p2) --[[ GetText | Line: 574 | Upvalues: v15 (copy), p3 (copy) ]]
				if v15.Value or p3.Completed.Value then
					return "COMPLETE"
				else
					return p1 .. "/" .. p2
				end
			end,
			Get = function() --[[ Get | Line: 581 | Upvalues: v15 (copy), p3 (copy), v142 (copy) ]]
				if v15.Value or p3.Completed.Value then
					return v142.Amount
				else
					return math.min(v15.Amount.Value, v142.Amount)
				end
			end,
			GetMax = function() --[[ GetMax | Line: 587 | Upvalues: v142 (copy) ]]
				return v142.Amount
			end,
			Changed = { v15.Amount:GetPropertyChangedSignal("Value"), v15:GetPropertyChangedSignal("Value"), p3.Completed:GetPropertyChangedSignal("Value") }
		}))
		v162.Visible = true
		v162.LayoutOrder = v13
		v162.Parent = v40.QuestContent.TasksContainer.Tasks
		v42:GiveTask(v162)
	end
end
local function setSelectedSpeciesUnlockMission(p1) --[[ setSelectedSpeciesUnlockMission | Line: 604 | Upvalues: v41 (copy), v5 (copy), v13 (copy), Selected (copy), v39 (copy), v9 (copy), v1 (copy), claimSpeciesUnlockMissionReward (copy), v21 (copy), pinMission (copy), v19 (copy), v20 (copy), LocalPlayer (copy), v23 (copy), createSpeciesViewport (copy), v14 (copy), v12 (copy), v8 (copy), v16 (copy), ContainerFrame (copy) ]]
	v41:DoCleaning()
	if not p1 then
		Selected.Visible = false
		ContainerFrame.Menu.TabFrames.Horses.Content.Missions.Visible = true
		ContainerFrame.Menu.TabFrames.Horses.Content.Selected.Upgrades.Visible = false
		return
	end
	local v15 = v5.GetByName(p1.Species)
	local v2 = v13.GetDisplayName(v15.Name, v15)
	Selected.Description.Text = string.format("Complete all missions to unlock %s Taming and claim your own foal!", v2)
	Selected.DisplayPanel.Title.Text = string.format("%s Missions", v2)
	local v3 = v39.PlayerData.Missions.SpeciesUnlocks[p1.Species]
	local t = {}
	for k, v in pairs(v3.Missions:GetChildren()) do
		table.insert(t, v:GetPropertyChangedSignal("Value"))
	end
	table.insert(t, v3.Completed:GetPropertyChangedSignal("Value"))
	table.insert(t, v3.Claimed:GetPropertyChangedSignal("Value"))
	v41:GiveTask(v9.new({
		TweenAmount = false,
		Clipped = false,
		Frame = Selected.DisplayPanel.Content.ProgressBar.Bar,
		AmountLabel = Selected.DisplayPanel.Content.ProgressBar.ProgressLabel,
		GetText = function(p1, p2) --[[ GetText | Line: 631 | Upvalues: v3 (copy) ]]
			if v3.Completed.Value then
				return "COMPLETED"
			else
				return p1 .. "/" .. p2
			end
		end,
		Get = function() --[[ Get | Line: 638 | Upvalues: v3 (copy), p1 (copy) ]]
			if v3.Completed.Value then
				return #p1.Missions
			end
			local sum = 0
			for k, v in pairs(v3.Missions:GetChildren()) do
				sum = sum + (if v.Value then 1 else 0)
			end
			return sum
		end,
		GetMax = function() --[[ GetMax | Line: 649 | Upvalues: p1 (copy) ]]
			return #p1.Missions
		end,
		Changed = t,
		OnChanged = function(p1, p2) --[[ OnChanged | Line: 653 | Upvalues: v3 (copy), Selected (ref) ]]
			if v3.Claimed.Value or p1 < p2 then
				Selected.DisplayPanel.Content.ProgressBar.Visible = true
				Selected.DisplayPanel.Content.ClaimButton.Visible = false
			else
				Selected.DisplayPanel.Content.ProgressBar.Visible = false
				Selected.DisplayPanel.Content.ClaimButton.Visible = true
			end
		end
	}))
	v41:GiveTask(v1.new(Selected.DisplayPanel.Content.ClaimButton, {
		Click = function() --[[ Click | Line: 665 | Upvalues: claimSpeciesUnlockMissionReward (ref), p1 (copy) ]]
			claimSpeciesUnlockMissionReward(p1.Name)
		end
	}))
	local function setPinned() --[[ setPinned | Line: 670 | Upvalues: Selected (ref), v3 (copy), v21 (ref) ]]
		Selected.DisplayPanel.PinButton.Visible = v3.Pinned.Value or not v3.Completed.Value
		Selected.DisplayPanel.PinButton.Top.CrossLabel.Visible = v3.Pinned.Value
		v21.SetButtonColor(Selected.DisplayPanel.PinButton, "Diagonal", if v3.Pinned.Value then "Red" else "Blue")
	end
	local function setSkip() --[[ setSkip | Line: 681 | Upvalues: Selected (ref) ]]
		Selected.SkipButton.Visible = false
	end
	v41:GiveTask(v3.Completed:GetPropertyChangedSignal("Value"):Connect(setPinned))
	v41:GiveTask(v3.Completed:GetPropertyChangedSignal("Value"):Connect(setSkip))
	v41:GiveTask(v3.Claimed:GetPropertyChangedSignal("Value"):Connect(setSkip))
	v41:GiveTask(v3.Pinned:GetPropertyChangedSignal("Value"):Connect(setPinned))
	local PinButton = Selected.DisplayPanel.PinButton
	PinButton.Visible = v3.Pinned.Value or not v3.Completed.Value
	Selected.DisplayPanel.PinButton.Top.CrossLabel.Visible = v3.Pinned.Value
	local SetButtonColor = v21.SetButtonColor
	local PinButton_2 = Selected.DisplayPanel.PinButton
	SetButtonColor(PinButton_2, "Diagonal", if v3.Pinned.Value then "Red" else "Blue")
	Selected.SkipButton.Visible = false
	v41:GiveTask(v1.new(Selected.DisplayPanel.PinButton, {
		Click = function() --[[ Click | Line: 693 | Upvalues: v3 (copy), pinMission (ref), v19 (ref) ]]
			if v3.Started.Value then
				pinMission("SpeciesUnlocks", v3.Name)
			else
				v19.Notify({
					Message = "You must start the mission first!",
					Type = "Red"
				})
			end
		end
	}))
	v41:GiveTask(v1.new(Selected.SkipButton, {
		Click = function() --[[ Click | Line: 706 | Upvalues: v20 (ref), p1 (copy), LocalPlayer (ref), v23 (ref) ]]
			if not v20.GetRemoteFunction("SkipMission"):InvokeServer(p1.Species) then
				return
			end
			if LocalPlayer:GetAttribute("SkipAB") == "2" then
				v23.PromptPurchase(LocalPlayer, 2661622690)
				return
			end
			if LocalPlayer:GetAttribute("SkipAB") ~= "3" then
				return
			end
			v23.PromptPurchase(LocalPlayer, 2661622642)
		end
	}))
	Selected.DisplayPanel.Content.HorseViewport.Visible = true
	Selected.DisplayPanel.Content.ItemViewport.Visible = false
	v41:GiveTask((createSpeciesViewport(Selected.DisplayPanel.Content.HorseViewport, v15)))
	for k, v in pairs(p1.Missions) do
		local v7 = v3.Missions:FindFirstChild(k)
		local v82 = Selected.MissionList.Content.Default:Clone()
		Selected.MissionList.Content.Default.Visible = false
		v82.Content.RewardContainer.UnclaimLabel.Visible = false
		v82.Content.QuestDescription.Text = v.Description and string.format(v.Description, v.Amount) or string.format(v14.Descriptions[v.Type], v.Amount, v.ItemType)
		local v10 = v5.GetByName(v.Reward.Name)
		v82.Content.RewardContainer.ImageLabel.Image = v10.Image
		v82.Content.RewardContainer.AmountLabel.Text = "x" .. v12.suffix(v.Reward.Amount)
		v82.Content.QuestReward.Text = "Reward: " .. v12.suffix(v.Reward.Amount) .. " " .. v13.GetDisplayName(v10.Name, v10)
		if v10.Description then
			v41:GiveTask(v8.new(v82.Content.RewardContainer, {
				Click = function() --[[ Click | Line: 747 | Upvalues: v16 (ref), v82 (copy), v10 (copy) ]]
					v16:CreateToolTip({
						Type = "ItemDescription",
						Offset = Vector2.new(0.65, 0.5),
						GuiObject = v82.Content.RewardContainer,
						Get = function() --[[ Get | Line: 752 | Upvalues: v10 (ref) ]]
							return v10
						end
					})
				end
			}))
		else
			v82.Content.RewardContainer.AutoButtonColor = false
		end
		v41:GiveTask(v9.new({
			TweenAmount = false,
			Clipped = false,
			Frame = v82.Content.ProgressBar.Bar,
			AmountLabel = v82.Content.ProgressLabel,
			GetText = function(p1, p2) --[[ GetText | Line: 768 | Upvalues: v7 (copy) ]]
				if v7.Claimed.Value then
					return "CLAIMED"
				else
					return p1 .. "/" .. p2
				end
			end,
			Get = function() --[[ Get | Line: 775 | Upvalues: v7 (copy), v (copy) ]]
				if v7.Value or v7.Claimed.Value then
					return v.Amount
				else
					return math.min(v7.Amount.Value, v.Amount)
				end
			end,
			GetMax = function() --[[ GetMax | Line: 781 | Upvalues: v (copy) ]]
				return v.Amount
			end,
			Changed = { v7.Amount:GetPropertyChangedSignal("Value"), v7.Claimed:GetPropertyChangedSignal("Value"), v7:GetPropertyChangedSignal("Value") },
			OnChanged = function() --[[ OnChanged | Line: 789 | Upvalues: v7 (copy), v82 (copy), k (copy) ]]
				if v7.Value and not v7.Claimed.Value then
					v82.Content.ClaimButton.Visible = true
					v82.Content.ProgressLabel.Visible = false
					v82.LayoutOrder = 1
					return
				end
				v82.Content.ClaimButton.Visible = false
				v82.Content.ProgressLabel.Visible = true
				v82.LayoutOrder = k + (if v7.Claimed.Value then 10 else 0)
			end
		}))
		v41:GiveTask(v1.new(v82.Content.ClaimButton, {
			Click = function() --[[ Click | Line: 804 | Upvalues: claimSpeciesUnlockMissionReward (ref), p1 (copy), k (copy) ]]
				claimSpeciesUnlockMissionReward(p1.Name, k)
			end
		}))
		v82.Visible = true
		v82.Parent = Selected.MissionList.Content
		v41:GiveTask(v82)
	end
	Selected.Visible = true
	ContainerFrame.Menu.TabFrames.Horses.Content.Missions.Visible = false
	ContainerFrame.Menu.TabFrames.Horses.Content.Selected.Upgrades.Visible = false
end
local function setSelectedActivityUnlock(p1, p2) --[[ setSelectedActivityUnlock | Line: 824 | Upvalues: v43 (copy), Selected (copy), ContainerFrame (copy), ActivityUpgrades (copy), v22 (copy), v9 (copy), t (copy), v12 (copy), v1 (copy), v20 (copy), v19 (copy) ]]
	v43:DoCleaning()
	Selected.Visible = false
	ContainerFrame.Menu.TabFrames.Horses.Content.Selected.Upgrades.Visible = false
	ContainerFrame.Menu.TabFrames.Horses.Content.Missions.Visible = true
	ActivityUpgrades.Visible = false
	ContainerFrame.Menu.TabFrames.Horses.Coins.Visible = false
	if not p1 then
		return
	end
	ContainerFrame.Menu.TabFrames.Horses.Content.Missions.Visible = false
	ActivityUpgrades.Visible = true
	ContainerFrame.Menu.TabFrames.Horses.Coins.Visible = true
	ActivityUpgrades.Description.Text = "Upgrade your activity to earn more rewards!"
	ActivityUpgrades.DisplayPanel.Title.Text = string.format(v22.separateWordsInString(p2.Name))
	local t2 = {}
	for k, v in pairs(p2.Upgrades:GetChildren()) do
		table.insert(t2, v:GetPropertyChangedSignal("Value"))
	end
	v43:GiveTask(v9.new({
		TweenAmount = false,
		Clipped = false,
		Frame = ActivityUpgrades.DisplayPanel.Content.ProgressBar.Bar,
		AmountLabel = ActivityUpgrades.DisplayPanel.Content.ProgressBar.ProgressLabel,
		GetText = function(p1, p2) --[[ GetText | Line: 857 ]]
			return p1 .. "/" .. p2
		end,
		Get = function() --[[ Get | Line: 861 | Upvalues: p2 (copy) ]]
			local sum = 0
			for k, v in pairs(p2.Upgrades:GetChildren()) do
				sum = sum + (if v.Value then 1 else 0)
			end
			return sum
		end,
		GetMax = function() --[[ GetMax | Line: 868 | Upvalues: p2 (copy) ]]
			return #p2.Upgrades:GetChildren()
		end,
		Changed = t2,
		OnChanged = function(p1, p2) --[[ OnChanged | Line: 872 ]] end
	}))
	v43:GiveTask((t:_createActivityUpgradeViewport(ActivityUpgrades.DisplayPanel.Content.HorseViewport, p1)))
	for v13, v2 in p1.Upgrades do
		local v3 = ActivityUpgrades.Upgrades.Content.Default:Clone()
		ActivityUpgrades.Upgrades.Content.Default.Visible = false
		local v4 = p2.Upgrades[v2.Name]
		v3.UpgradeName.Text = v2.Description
		local function setUnlocked() --[[ setUnlocked | Line: 889 | Upvalues: v4 (copy), v3 (copy), v12 (ref), v2 (copy) ]]
			if v4.Value then
				v3.Level.Text = "UNLOCKED"
				v3.StartButton.Visible = false
				v3.Level.Visible = true
			else
				v3.Level.Visible = false
				v3.StartButton.Visible = true
				v3.StartButton.Top.Coins.TextLabel.Text = v12.suffix(v2.Cost)
			end
		end
		v43:GiveTask(v1.new(v3.StartButton, {
			Click = function() --[[ Click | Line: 902 | Upvalues: v20 (ref), p2 (copy), v2 (copy), v19 (ref) ]]
				local v1, v22 = v20.GetRemoteFunction("UpgradeActivityUpgradesRemote"):InvokeServer(p2.Name, v2.Name)
				if v1 then
					return
				end
				v19.Notify({
					Type = "Red",
					Message = v22
				})
			end
		}))
		v3.Visible = true
		v3.Parent = ActivityUpgrades.Upgrades.Content
		v43:GiveTask(v4:GetPropertyChangedSignal("Value"):Connect(setUnlocked))
		if v4.Value then
			v3.Level.Text = "UNLOCKED"
			v3.StartButton.Visible = false
			v3.Level.Visible = true
		else
			v3.Level.Visible = false
			v3.StartButton.Visible = true
			v3.StartButton.Top.Coins.TextLabel.Text = v12.suffix(v2.Cost)
		end
		v43:GiveTask(v3)
	end
end
local function setSelectedSpeciesMission(p1) --[[ setSelectedSpeciesMission | Line: 925 | Upvalues: v41 (copy), Selected (copy), ContainerFrame (copy), v39 (copy), v5 (copy), v14 (copy), v9 (copy), v1 (copy), claimSpeciesMissionReward (copy), v21 (copy), pinMission (copy), v7 (copy), createSpeciesViewport (copy), Sonar (copy), v8 (copy), v16 (copy), v12 (copy), v13 (copy) ]]
	v41:DoCleaning()
	Selected.Visible = false
	ContainerFrame.Menu.TabFrames.Horses.Content.Selected.Upgrades.Visible = false
	ContainerFrame.Menu.TabFrames.Horses.Content.Missions.Visible = true
	if not p1 then
		return
	end
	ContainerFrame.Menu.TabFrames.Horses.Timer.Visible = true
	v41:GiveTask(function() --[[ Line: 937 | Upvalues: ContainerFrame (ref) ]]
		ContainerFrame.Menu.TabFrames.Horses.Timer.Visible = false
	end)
	Selected.Description.Text = "Finish the quests before time runs out to earn your reward!"
	Selected.DisplayPanel.Title.Text = string.format("Repeatable %s Missions", p1.Species)
	local v15 = v39.PlayerData.Missions.SpeciesMissions[p1.Species]
	local v2 = v5.GetByName(p1.Species)
	if not v15.Started.Value and v14.StartSpeciesMission(p1.Species) then
		task.wait()
	end
	local t = {}
	for k, v in pairs(v15.Missions:GetChildren()) do
		table.insert(t, v:GetPropertyChangedSignal("Value"))
	end
	table.insert(t, v15.Completed:GetPropertyChangedSignal("Value"))
	table.insert(t, v15.Claimed:GetPropertyChangedSignal("Value"))
	v41:GiveTask(v9.new({
		TweenAmount = false,
		Clipped = false,
		Frame = Selected.DisplayPanel.Content.ProgressBar.Bar,
		AmountLabel = Selected.DisplayPanel.Content.ProgressBar.ProgressLabel,
		GetText = function(p1, p2) --[[ GetText | Line: 969 | Upvalues: v15 (copy) ]]
			if v15.Completed.Value then
				return "COMPLETED"
			else
				return p1 .. "/" .. p2
			end
		end,
		Get = function() --[[ Get | Line: 976 | Upvalues: v15 (copy), p1 (copy) ]]
			if v15.Completed.Value then
				return #p1.Missions
			end
			local sum = 0
			for k, v in pairs(v15.Missions:GetChildren()) do
				sum = sum + (if v.Value then 1 else 0)
			end
			return sum
		end,
		GetMax = function() --[[ GetMax | Line: 987 | Upvalues: p1 (copy) ]]
			return #p1.Missions
		end,
		Changed = t,
		OnChanged = function(p1, p2) --[[ OnChanged | Line: 991 | Upvalues: v15 (copy), Selected (ref) ]]
			if v15.Claimed.Value or p1 < p2 then
				Selected.DisplayPanel.Content.ProgressBar.Visible = true
				Selected.DisplayPanel.Content.ClaimButton.Visible = false
			else
				Selected.DisplayPanel.Content.ProgressBar.Visible = false
				Selected.DisplayPanel.Content.ClaimButton.Visible = true
			end
		end
	}))
	v41:GiveTask(v1.new(Selected.DisplayPanel.Content.ClaimButton, {
		Click = function() --[[ Click | Line: 1003 | Upvalues: claimSpeciesMissionReward (ref), p1 (copy) ]]
			claimSpeciesMissionReward(p1.Name)
		end
	}))
	local function setPinned() --[[ setPinned | Line: 1008 | Upvalues: Selected (ref), v15 (copy), v21 (ref) ]]
		Selected.DisplayPanel.PinButton.Visible = v15.Pinned.Value or not v15.Completed.Value
		Selected.DisplayPanel.PinButton.Top.CrossLabel.Visible = v15.Pinned.Value
		v21.SetButtonColor(Selected.DisplayPanel.PinButton, "Diagonal", if v15.Pinned.Value then "Red" else "Blue")
	end
	v41:GiveTask(v15.Completed:GetPropertyChangedSignal("Value"):Connect(setPinned))
	v41:GiveTask(v15.Pinned:GetPropertyChangedSignal("Value"):Connect(setPinned))
	pcall(setPinned)
	v41:GiveTask(v1.new(Selected.DisplayPanel.PinButton, {
		Click = function() --[[ Click | Line: 1020 | Upvalues: pinMission (ref), v15 (copy) ]]
			pinMission("SpeciesMissions", v15.Name)
		end
	}))
	local v3 = v7.new()
	v41:GiveTask(v3)
	local function createReward() --[[ createReward | Line: 1029 | Upvalues: v15 (copy), v3 (copy), p1 (copy), createSpeciesViewport (ref), Selected (ref), v2 (copy), v5 (ref), Sonar (ref), v8 (ref), v16 (ref) ]]
		local v1 = game:GetService("HttpService"):JSONDecode(v15.Reward.Value)
		v3:DoCleaning()
		local v32 = type(v1[1]) == "table" and v1[1] or p1.Rewards[v1[1]]
		if v32.Species then
			v3:GiveTask((createSpeciesViewport(Selected.DisplayPanel.Content.HorseViewport, v2, v32, math.max(1, v15.Value) + p1.Index * 1000)))
			Selected.DisplayPanel.Content.ItemViewport.Visible = false
			Selected.DisplayPanel.Content.HorseViewport.Visible = true
			return
		end
		local v82 = v5.GetByName(v32.Name)
		local v9 = Sonar("ItemGridButton").new({
			DoNotClone = true,
			ForceVisible = true,
			Item = v82,
			GuiObject = Selected.DisplayPanel.Content.ItemViewport,
			Theme = v32.Theme,
			GetAmount = function() --[[ GetAmount | Line: 1049 | Upvalues: v32 (copy) ]]
				return v32.Amount
			end
		})
		if v82.Description then
			v9:GiveTask(v8.new(Selected.DisplayPanel.Content.ItemViewport, {
				Click = function() --[[ Click | Line: 1056 | Upvalues: v16 (ref), Selected (ref), v82 (copy) ]]
					v16:CreateToolTip({
						Type = "ItemDescription",
						Offset = Vector2.new(0.65, 0.5),
						GuiObject = Selected.DisplayPanel.Content.ItemViewport,
						Get = function() --[[ Get | Line: 1061 | Upvalues: v82 (ref) ]]
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
		v3:GiveTask(v9)
	end
	v41:GiveTask(v15:GetPropertyChangedSignal("Value"):Connect(createReward))
	v41:GiveTask(v15.Reward:GetPropertyChangedSignal("Value"):Connect(createReward))
	v41:GiveTask(v39.SpeciesMissionTimer.SeedChanged:Connect(createReward))
	pcall(createReward)
	local v4 = p1.Missions[1]
	local v52 = v15.Missions:FindFirstChild(1)
	local v6 = Selected.MissionList.Content.Default:Clone()
	local v82 = v15.Missions[tonumber(v52.Name)]
	Selected.MissionList.Content.Default.Visible = false
	local function setDescriptionLabel() --[[ setDescriptionLabel | Line: 1089 | Upvalues: v14 (ref), v2 (copy), v82 (copy), v6 (copy) ]]
		local v1 = v14.GetMissionPreset("SpeciesMissions", v2.Name, v82)
		local v22 = v1.Description or v14.Descriptions[v1.Type] or v1.Type
		if v1.DoNotFormat then
			v6.Content.QuestDescription.Text = v22
		else
			v6.Content.QuestDescription.Text = string.format(v22, v82.TargetAmount.Value)
		end
	end
	v41:GiveTask(v82.Amount:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel))
	v41:GiveTask(v82.TargetAmount:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel))
	v41:GiveTask(v82.Type:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel))
	pcall(setDescriptionLabel)
	local v92 = v5.GetByName(v4.Reward.Name)
	v6.Content.RewardContainer.ImageLabel.Image = v92.Image
	v6.Content.RewardContainer.AmountLabel.Text = "x" .. v12.suffix(v4.Reward.Amount)
	v6.Content.QuestReward.Text = "Reward: " .. v12.suffix(v4.Reward.Amount) .. " " .. v13.GetDisplayName(v92.Name, v92)
	if v92.Description then
		v41:GiveTask(v8.new(v6.Content.RewardContainer, {
			Click = function() --[[ Click | Line: 1113 | Upvalues: v16 (ref), v6 (copy), v92 (copy) ]]
				v16:CreateToolTip({
					Type = "ItemDescription",
					Offset = Vector2.new(0.65, 0.5),
					GuiObject = v6.Content.RewardContainer,
					Get = function() --[[ Get | Line: 1118 | Upvalues: v92 (ref) ]]
						return v92
					end
				})
			end
		}))
	else
		v6.Content.RewardContainer.AutoButtonColor = false
	end
	local function setUnclaimableLabel() --[[ setUnclaimableLabel | Line: 1128 | Upvalues: v6 (copy), v82 (copy), v15 (copy), v39 (ref) ]]
		v6.Content.RewardContainer.UnclaimLabel.Visible = not v82.Value and not v82.Claimed.Value and v15.Value ~= v39.SpeciesMissionTimer.CurrentSeed
	end
	v41:GiveTask(v39.SpeciesMissionTimer.SeedChanged:Connect(setUnclaimableLabel))
	v41:GiveTask(v15:GetPropertyChangedSignal("Value"):Connect(setUnclaimableLabel))
	v41:GiveTask(v82:GetPropertyChangedSignal("Value"):Connect(setUnclaimableLabel))
	v41:GiveTask(v82.Claimed:GetPropertyChangedSignal("Value"):Connect(setUnclaimableLabel))
	pcall(setUnclaimableLabel)
	v41:GiveTask(v15.Started:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1138 | Upvalues: v15 (copy), v14 (ref), p1 (copy) ]]
		if v15.Started.Value or not v14.StartSpeciesMission(p1.Species) then
			return
		end
		task.wait()
	end))
	v41:GiveTask(v9.new({
		TweenAmount = false,
		Clipped = false,
		Frame = v6.Content.ProgressBar.Bar,
		AmountLabel = v6.Content.ProgressLabel,
		GetText = function(p1, p2) --[[ GetText | Line: 1152 | Upvalues: v82 (copy), v15 (copy), v39 (ref) ]]
			if v82.Claimed.Value then
				return "CLAIMED"
			end
			if v15.Value == v39.SpeciesMissionTimer.CurrentSeed or (v82.Value or v82.Claimed.Value) then
				return p1 .. "/" .. p2
			else
				return "Out of Time!"
			end
		end,
		Get = function() --[[ Get | Line: 1165 | Upvalues: v82 (copy) ]]
			if v82.Value or v82.Claimed.Value then
				return v82.TargetAmount.Value
			else
				return math.min(v82.Amount.Value, v82.TargetAmount.Value)
			end
		end,
		GetMax = function() --[[ GetMax | Line: 1171 | Upvalues: v82 (copy) ]]
			return v82.TargetAmount.Value
		end,
		Changed = {
			v15:GetPropertyChangedSignal("Value"),
			v39.SpeciesMissionTimer.SeedChanged,
			v82.Amount:GetPropertyChangedSignal("Value"),
			v82.TargetAmount:GetPropertyChangedSignal("Value"),
			v82:GetPropertyChangedSignal("Value"),
			v82.Claimed:GetPropertyChangedSignal("Value")
		},
		OnChanged = function() --[[ OnChanged | Line: 1182 | Upvalues: v82 (copy), v6 (copy) ]]
			if v82.Value and not v82.Claimed.Value then
				v6.Content.ClaimButton.Visible = true
				v6.Content.ProgressLabel.Visible = false
				v6.LayoutOrder = 1
				return
			end
			v6.Content.ClaimButton.Visible = false
			v6.Content.ProgressLabel.Visible = true
			v6.LayoutOrder = 1 + (if v82.Claimed.Value then 10 else 0)
		end
	}))
	v41:GiveTask(v1.new(v6.Content.ClaimButton, {
		Click = function() --[[ Click | Line: 1196 | Upvalues: claimSpeciesMissionReward (ref), p1 (copy) ]]
			claimSpeciesMissionReward(p1.Name, 1)
		end
	}))
	v6.Parent = Selected.MissionList.Content
	v6.Visible = true
	v41:GiveTask(v6)
	local t2 = {
		MapIcon = "Species Map Icon",
		SpawnChance = "Species Spawn Chance",
		TraitSpawn = "Species Trait Bonus",
		MutationLuck = "Species Mutation Luck"
	}
	for v10, v11 in v39.PlayerData.SpeciesUpgrades[p1.Species]:GetChildren() do
		local v122 = ContainerFrame.Menu.TabFrames.Horses.Content.Selected.Upgrades.Content.Default:Clone()
		v122.UpgradeName.Text = t2[v11.Name]
		v122.Level.Text = "Level: " .. v11.Value
		v122.Visible = true
		v122.Parent = ContainerFrame.Menu.TabFrames.Horses.Content.Selected.Upgrades.Content
		v41:GiveTask(v11:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1222 | Upvalues: v122 (copy), v11 (copy) ]]
			v122.Level.Text = "Level: " .. v11.Value
		end))
		v41:GiveTask(v122)
	end
	ContainerFrame.Menu.TabFrames.Horses.Content.Selected.Upgrades.Visible = true
	Selected.Visible = true
	ContainerFrame.Menu.TabFrames.Horses.Content.Missions.Visible = false
end
function t.OpenAtMissions() --[[ OpenAtMissions | Line: 1236 ]] end
function t._createSpeciesViewport(p1, p2, p3) --[[ _createSpeciesViewport | Line: 1239 | Upvalues: v7 (copy), v10 (copy), v39 (copy), Sonar (copy), v6 (copy), v11 (copy) ]]
	local v1 = v7.new()
	local v2 = v10.CreateSlot(v39, {
		Origin = "Wild",
		DoNotParent = true,
		DoNotIncrementCount = true,
		Age = 66,
		Gender = "Female",
		NoMutations = true,
		Species = p3.Name,
		Preset = p3.DiscoveryPreset or "Brown",
		Seed = v39.Player.UserId + math.random(1, 100)
	})
	for k, v in pairs({ p2, p2:FindFirstChild("Viewport") }) do
		local v3, v4 = Sonar("AnimalRiggerService").CreateAnimalModel({
			SlotValue = v2
		})
		v3.Parent = v
		v1:GiveTask(v3)
		local Camera = Instance.new("Camera")
		Camera.Parent = v
		v.CurrentCamera = Camera
		v1:GiveTask(Camera)
		Camera.FieldOfView = 10
		Camera.CFrame = v6(v3, v, -130, -20)
		local Eyelid = v3:FindFirstChild("Eyelid")
		if Eyelid then
			Eyelid:Destroy()
		end
		v.Ambient = Color3.fromRGB(192, 192, 192)
		v.LightDirection = Camera.CFrame.LookVector
		v1:GiveTask(v11.new(v3, {
			InViewport = true,
			SlotValue = v2
		}))
		v1:GiveTask(v4)
	end
	return v1
end
function t._createActivityUpgradeViewport(p1, p2, p3) --[[ _createActivityUpgradeViewport | Line: 1286 | Upvalues: v7 (copy), v6 (copy) ]]
	local v1 = v7.new()
	for k, v in pairs({ p2, p2:FindFirstChild("Viewport") }) do
		local v2 = p3.ViewportModel:Clone()
		v2.Parent = v
		v1:GiveTask(v2)
		local Camera = Instance.new("Camera")
		Camera.Parent = v
		v.CurrentCamera = Camera
		v1:GiveTask(Camera)
		Camera.FieldOfView = 30
		Camera.CFrame = v6(v2, v, -130, -20) + Vector3.new(0, -2, 0)
		v1:GiveTask(v2)
	end
	return v1
end
local function setSelectedSpeciesUnlockMissionTest(p1) --[[ setSelectedSpeciesUnlockMissionTest | Line: 1309 | Upvalues: v44 (copy), Selected_2 (copy), v39 (copy), v5 (copy), v9 (copy), v1 (copy), claimSpeciesUnlockMissionReward (copy), v21 (copy), pinMission (copy), v20 (copy), LocalPlayer (copy), v23 (copy), createSpeciesViewport (copy), v14 (copy), v12 (copy), v13 (copy), v8 (copy), v16 (copy), ContainerFrame (copy) ]]
	v44:DoCleaning()
	if not p1 then
		Selected_2.Visible = false
		ContainerFrame.Menu.TabFrames.HorsesTest.Content.Missions.Visible = true
		return
	end
	Selected_2.Description.Text = string.format("Complete all missions to unlock %s Taming and claim your own foal!", p1.Species)
	Selected_2.DisplayPanel.Title.Text = string.format("%s Missions", p1.Species)
	local v15 = v39.PlayerData.Missions.SpeciesUnlocks[p1.Species]
	local v2 = v5.GetByName(p1.Species)
	local t = {}
	for k, v in pairs(v15.Missions:GetChildren()) do
		table.insert(t, v:GetPropertyChangedSignal("Value"))
	end
	table.insert(t, v15.Completed:GetPropertyChangedSignal("Value"))
	table.insert(t, v15.Claimed:GetPropertyChangedSignal("Value"))
	v44:GiveTask(v9.new({
		TweenAmount = false,
		Clipped = false,
		Frame = Selected_2.DisplayPanel.Content.ProgressBar.Bar,
		AmountLabel = Selected_2.DisplayPanel.Content.ProgressBar.ProgressLabel,
		GetText = function(p1, p2) --[[ GetText | Line: 1333 | Upvalues: v15 (copy) ]]
			if v15.Completed.Value then
				return "COMPLETED"
			else
				return p1 .. "/" .. p2
			end
		end,
		Get = function() --[[ Get | Line: 1340 | Upvalues: v15 (copy), p1 (copy) ]]
			if v15.Completed.Value then
				return #p1.Missions
			end
			local sum = 0
			for k, v in pairs(v15.Missions:GetChildren()) do
				sum = sum + (if v.Value then 1 else 0)
			end
			return sum
		end,
		GetMax = function() --[[ GetMax | Line: 1351 | Upvalues: p1 (copy) ]]
			return #p1.Missions
		end,
		Changed = t,
		OnChanged = function(p1, p2) --[[ OnChanged | Line: 1355 | Upvalues: v15 (copy), Selected_2 (ref) ]]
			if v15.Claimed.Value or p1 < p2 then
				Selected_2.DisplayPanel.Content.ProgressBar.Visible = true
				Selected_2.DisplayPanel.Content.ClaimButton.Visible = false
			else
				Selected_2.DisplayPanel.Content.ProgressBar.Visible = false
				Selected_2.DisplayPanel.Content.ClaimButton.Visible = true
			end
		end
	}))
	v44:GiveTask(v1.new(Selected_2.DisplayPanel.Content.ClaimButton, {
		Click = function() --[[ Click | Line: 1367 | Upvalues: claimSpeciesUnlockMissionReward (ref), p1 (copy) ]]
			claimSpeciesUnlockMissionReward(p1.Name)
		end
	}))
	local function setPinned() --[[ setPinned | Line: 1372 | Upvalues: Selected_2 (ref), v15 (copy), v21 (ref) ]]
		Selected_2.DisplayPanel.PinButton.Visible = v15.Pinned.Value or not v15.Completed.Value
		Selected_2.DisplayPanel.PinButton.Top.CrossLabel.Visible = v15.Pinned.Value
		v21.SetButtonColor(Selected_2.DisplayPanel.PinButton, "Diagonal", if v15.Pinned.Value then "Red" else "Blue")
	end
	local function setSkip() --[[ setSkip | Line: 1378 | Upvalues: Selected_2 (ref) ]]
		Selected_2.SkipButton.Visible = false
	end
	v44:GiveTask(v15.Completed:GetPropertyChangedSignal("Value"):Connect(setPinned))
	v44:GiveTask(v15.Completed:GetPropertyChangedSignal("Value"):Connect(setSkip))
	v44:GiveTask(v15.Claimed:GetPropertyChangedSignal("Value"):Connect(setSkip))
	v44:GiveTask(v15.Pinned:GetPropertyChangedSignal("Value"):Connect(setPinned))
	local PinButton = Selected_2.DisplayPanel.PinButton
	PinButton.Visible = v15.Pinned.Value or not v15.Completed.Value
	Selected_2.DisplayPanel.PinButton.Top.CrossLabel.Visible = v15.Pinned.Value
	local SetButtonColor = v21.SetButtonColor
	local PinButton_2 = Selected_2.DisplayPanel.PinButton
	SetButtonColor(PinButton_2, "Diagonal", if v15.Pinned.Value then "Red" else "Blue")
	Selected_2.SkipButton.Visible = false
	v44:GiveTask(v1.new(Selected_2.DisplayPanel.PinButton, {
		Click = function() --[[ Click | Line: 1390 | Upvalues: pinMission (ref), v15 (copy) ]]
			pinMission("SpeciesUnlocks", v15.Name)
		end
	}))
	v44:GiveTask(v1.new(Selected_2.SkipButton, {
		Click = function() --[[ Click | Line: 1396 | Upvalues: v20 (ref), p1 (copy), LocalPlayer (ref), v23 (ref) ]]
			if not v20.GetRemoteFunction("SkipMission"):InvokeServer(p1.Species) then
				return
			end
			if LocalPlayer:GetAttribute("SkipAB") == "2" then
				v23.PromptPurchase(LocalPlayer, 2661622690)
				return
			end
			if LocalPlayer:GetAttribute("SkipAB") ~= "3" then
				return
			end
			v23.PromptPurchase(LocalPlayer, 2661622642)
		end
	}))
	Selected_2.DisplayPanel.Content.HorseViewport.Visible = true
	Selected_2.DisplayPanel.Content.ItemViewport.Visible = false
	v44:GiveTask((createSpeciesViewport(Selected_2.DisplayPanel.Content.HorseViewport, v2)))
	for k, v in pairs(p1.Missions) do
		local v6 = v15.Missions:FindFirstChild(k)
		local v7 = Selected_2.MissionList.Content.Default:Clone()
		Selected_2.MissionList.Content.Default.Visible = false
		v7.Content.RewardContainer.UnclaimLabel.Visible = false
		v7.Content.QuestDescription.Text = v.Description and string.format(v.Description, v.Amount) or string.format(v14.Descriptions[v.Type], v.Amount, v.ItemType)
		local v92 = v5.GetByName(v.Reward.Name)
		v7.Content.RewardContainer.ImageLabel.Image = v92.Image
		v7.Content.RewardContainer.AmountLabel.Text = "x" .. v12.suffix(v.Reward.Amount)
		v7.Content.QuestReward.Text = "Reward: " .. v12.suffix(v.Reward.Amount) .. " " .. v13.GetDisplayName(v92.Name, v92)
		if v92.Description then
			v44:GiveTask(v8.new(v7.Content.RewardContainer, {
				Click = function() --[[ Click | Line: 1430 | Upvalues: v16 (ref), v7 (copy), v92 (copy) ]]
					v16:CreateToolTip({
						Type = "ItemDescription",
						Offset = Vector2.new(0.65, 0.5),
						GuiObject = v7.Content.RewardContainer,
						Get = function() --[[ Get | Line: 1435 | Upvalues: v92 (ref) ]]
							return v92
						end
					})
				end
			}))
		else
			v7.Content.RewardContainer.AutoButtonColor = false
		end
		v44:GiveTask(v9.new({
			TweenAmount = false,
			Clipped = false,
			Frame = v7.Content.ProgressBar.Bar,
			AmountLabel = v7.Content.ProgressLabel,
			GetText = function(p1, p2) --[[ GetText | Line: 1451 | Upvalues: v6 (copy) ]]
				if v6.Claimed.Value then
					return "CLAIMED"
				else
					return p1 .. "/" .. p2
				end
			end,
			Get = function() --[[ Get | Line: 1458 | Upvalues: v6 (copy), v (copy) ]]
				if v6.Value or v6.Claimed.Value then
					return v.Amount
				else
					return math.min(v6.Amount.Value, v.Amount)
				end
			end,
			GetMax = function() --[[ GetMax | Line: 1464 | Upvalues: v (copy) ]]
				return v.Amount
			end,
			Changed = { v6.Amount:GetPropertyChangedSignal("Value"), v6.Claimed:GetPropertyChangedSignal("Value"), v6:GetPropertyChangedSignal("Value") },
			OnChanged = function() --[[ OnChanged | Line: 1472 | Upvalues: v6 (copy), v7 (copy), k (copy) ]]
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
		v44:GiveTask(v1.new(v7.Content.ClaimButton, {
			Click = function() --[[ Click | Line: 1487 | Upvalues: claimSpeciesUnlockMissionReward (ref), p1 (copy), k (copy) ]]
				claimSpeciesUnlockMissionReward(p1.Name, k)
			end
		}))
		v7.Visible = true
		v7.Parent = Selected_2.MissionList.Content
		v44:GiveTask(v7)
	end
	Selected_2.Visible = true
	ContainerFrame.Menu.TabFrames.HorsesTest.Content.Missions.Visible = false
end
local v49 = v27.new("HomePage")
local t2 = {
	Horses = function(p1, p2) --[[ Horses | Line: 1508 | Upvalues: v39 (copy), v8 (copy), v46 (ref), v45 (copy), v4 (copy), v21 (copy), v1 (copy), v29 (copy), v18 (copy), v49 (copy), v34 (copy), v14 (copy), t (copy), v5 (copy), v7 (copy), v30 (copy), v12 (copy), v3 (copy), v20 (copy), v19 (copy), setSelectedSpeciesUnlockMission (copy), setSelectedSpeciesMission (copy), v9 (copy), v35 (copy), v47 (copy), v28 (copy), v22 (copy), v13 (copy), setSelectedActivityUnlock (copy) ]]
		local SpeciesUnlocks = v39.PlayerData.Missions.SpeciesUnlocks
		local t2 = {
			Upgradeable = {
				Order = 1,
				Color = Color3.fromRGB(53, 233, 255),
				ProgressBarColor = Color3.fromRGB(24, 88, 127)
			},
			Unlock = {
				Order = 3,
				Color = Color3.fromRGB(255, 200, 46),
				ProgressBarColor = Color3.fromRGB(184, 108, 42)
			},
			Completed = {
				Order = 2,
				Color = Color3.fromRGB(110, 255, 128),
				ProgressBarColor = Color3.fromRGB(24, 127, 25)
			}
		}
		v8.new(p2, {
			Click = function() --[[ Click | Line: 1532 | Upvalues: v46 (ref), v45 (ref), v4 (ref), p1 (copy) ]]
				v46 = "Quests"
				v45:FireServer("AccessedMajorInterface", "Quests")
				v4.OpenTab(p1)
			end
		})
		v21.CreateCurrencyLabel({
			GuiObject = p1.Coins.Content.TextLabel,
			Value = v39:GetCurrencyValue("Coins"),
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 1543 ]] end
		})
		v1.new(p1.Coins.PurchaseButton, {
			Click = function() --[[ Click | Line: 1547 | Upvalues: v29 (ref) ]]
				v29.Open("Coins")
			end
		})
		local function setTimerLabel() --[[ setTimerLabel | Line: 1552 | Upvalues: p1 (copy), v18 (ref), v39 (ref) ]]
			p1.Timer.TextLabel.Text = "Resets in " .. v18.FormatString(v39.SpeciesMissionTimer:GetTime())
		end
		v39.SpeciesMissionTimer.TimeChanged:Connect(setTimerLabel)
		p1.Timer.TextLabel.Text = "Resets in " .. v18.FormatString(v39.SpeciesMissionTimer:GetTime())
		local function IsStarted(p1) --[[ IsStarted | Line: 1560 | Upvalues: SpeciesUnlocks (copy) ]]
			return SpeciesUnlocks:FindFirstChild(p1) and SpeciesUnlocks[p1].Started.Value
		end
		local function IsCompleted(p1) --[[ IsCompleted | Line: 1564 | Upvalues: v39 (ref), SpeciesUnlocks (copy) ]]
			local v1 = v39.PlayerData.Missions.SpeciesUnlocks[p1]
			if not v1.Claimed.Value and v1.Completed.Value then
				return false
			end
			for k, v in pairs(v1.Missions:GetChildren()) do
				if not v.Claimed.Value then
					return false
				end
			end
			return SpeciesUnlocks:FindFirstChild(p1) and SpeciesUnlocks[p1].Completed.Value
		end
		v49:subscribe(function() --[[ Line: 1580 | Upvalues: p1 (copy), v49 (ref) ]]
			p1.Coins.Visible = v49:get() == "AddPage"
			p1.Timer.Visible = false
		end)
		p1.Timer.Visible = false
		local t3 = {}
		for v15, v2 in v34.Missions do
			local v32 = SpeciesUnlocks[v15]
			local v42 = p1.Content.Missions.Content.Default:Clone()
			p1.Content.Missions.Content.Default.Visible = false
			local v52 = v14.GetTimedSpeciesMission(v39, v15)
			local v6 = v52 and v39.PlayerData.Missions.SpeciesMissions[v15]
			v42.Content.Title.Text = v2.Title
			t:_createSpeciesViewport(v42.Viewport, v5.GetByName(v15))
			local v72 = v7.new()
			local function updateRewardDisplay() --[[ updateRewardDisplay | Line: 1601 | Upvalues: v72 (copy), v6 (copy), v52 (copy), v5 (ref), v30 (ref), v42 (copy) ]]
				v72:DoCleaning()
				local v1 = game:GetService("HttpService"):JSONDecode(v6.Reward.Value)
				local v3 = if type(v1[1]) == "table" then v1[1] else v52.Rewards[v1[1]]
				if not v3 then
					return
				end
				local v4 = v3
				if v6.Completed.Value and (v3.Species and (v52.Missions and v52.Missions[1])) then
					local v53 = v52.Missions[1]
					if v53.Reward then
						v4 = v53.Reward
					end
				end
				if not v4 then
					return
				end
				local v62 = v5.GetByName(v4.Name)
				if v62 then
					v72:GiveTask(v30.new({
						DoNotClone = true,
						ForceVisible = true,
						GuiObject = v42.ItemViewport,
						Item = v62,
						Theme = v4.Theme,
						GetAmount = function() --[[ GetAmount | Line: 1647 | Upvalues: v4 (ref) ]]
							return v4.Amount
						end
					}))
				end
			end
			v39.SpeciesMissionTimer.SeedChanged:Connect(function() --[[ Line: 1653 | Upvalues: v6 (copy), updateRewardDisplay (copy) ]]
				if v6.Completed.Value then
					task.wait(0.1)
				end
				updateRewardDisplay()
			end)
			v6.Reward:GetPropertyChangedSignal("Value"):Connect(updateRewardDisplay)
			if v6.Completed then
				v6.Completed:GetPropertyChangedSignal("Value"):Connect(updateRewardDisplay)
			end
			updateRewardDisplay()
			if v2.New then
				v42.NewTag.Visible = true
			end
			t3[v15] = {
				SpeciesFrame = v42,
				MissionData = v32,
				Species = v15
			}
			v42.Visible = true
			v42.Parent = p1.Content.Missions.Content
			v42.LayoutOrder = v2.Cost
			local function UpdateState() --[[ UpdateState | Line: 1680 | Upvalues: v15 (copy), SpeciesUnlocks (copy), IsCompleted (copy), v42 (copy), t2 (copy), v2 (copy), v49 (ref), v32 (copy), v12 (ref) ]]
				local v1 = v15
				local v22 = SpeciesUnlocks:FindFirstChild(v1)
				local v3 = if v22 then SpeciesUnlocks[v1].Started.Value else v22
				local v4 = IsCompleted(v15)
				if v3 and not v4 then
					v42.White.BackgroundColor3 = t2.Upgradeable.Color
					v42.LayoutOrder = t2.Upgradeable.Order
					v42.Content.ProgressBar.BackgroundColor3 = t2.Upgradeable.ProgressBarColor
					v42.CloseButton.Visible = true
				elseif v4 then
					v42.White.BackgroundColor3 = t2.Completed.Color
					v42.LayoutOrder = t2.Completed.Order
					v42.Content.ProgressBar.BackgroundColor3 = t2.Completed.ProgressBarColor
					v42.CloseButton.Visible = false
					v42.Viewport.Visible = false
					v42.ItemViewport.Visible = true
				else
					v42.White.BackgroundColor3 = t2.Unlock.Color
					v42.LayoutOrder = v2.Cost
					v42.Content.ProgressBar.BackgroundColor3 = t2.Unlock.ProgressBarColor
					v42.CloseButton.Visible = false
				end
				local v5 = false
				if v49:get() == "HomePage" then
					v5 = v3 or v4
				elseif v49:get() == "AddPage" then
					v5 = not v3 and (not v32.Started.Value and not v4)
				end
				v42.Visible = v5
				local v7 = not v32.Started.Value and not v32.Completed.Value
				local v8 = if v7 then v7 elseif v49:get() == "AddPage" then not v32.Started.Value and v32.Completed.Value else false
				v42.Content.ProgressBar.Visible = not v8
				v42.Content.ProgressLabel.Visible = not v8
				v42.Content.StartButton.Visible = v8
				if not v8 then
					return
				end
				local v9 = v2.Cost > 0
				v42.Content.StartButton.Top.Coins.Visible = v9
				v42.Content.StartButton.Top.TextLabel.Visible = not v9
				if not v9 then
					return
				end
				v42.Content.StartButton.Top.Coins.TextLabel.Text = v12.suffix(v2.Cost)
			end
			if v14.GetSpeciesUnlockMission(v39, v15) then
				local v82 = v39.PlayerData.Missions.SpeciesUnlocks[v15]
				local t4 = {}
				for k, v in pairs(v32.Missions:GetChildren()) do
					table.insert(t4, v:GetPropertyChangedSignal("Value"))
				end
				for v92, v10 in v39.PlayerData.SpeciesUpgrades[v15]:GetChildren() do
					table.insert(t4, v10:GetPropertyChangedSignal("Value"))
				end
				table.insert(t4, v32.Completed:GetPropertyChangedSignal("Value"))
				if v82 then
					for k, v in pairs(v82.Missions:GetChildren()) do
						table.insert(t4, v:GetPropertyChangedSignal("Value"))
					end
					table.insert(t4, v82.Completed:GetPropertyChangedSignal("Value"))
					table.insert(t4, v82.Started:GetPropertyChangedSignal("Value"))
				end
				v1.new(v42.Content.StartButton, {
					Click = function() --[[ Click | Line: 1763 | Upvalues: v2 (copy), v3 (ref), v12 (ref), v20 (ref), v15 (copy), v49 (ref), v19 (ref) ]]
						if v2.Cost > 0 then
							v3.Prompt({
								Type = "StartSpecies",
								Setup = function(p1) --[[ Setup | Line: 1767 | Upvalues: v2 (ref), v12 (ref) ]]
									p1.Content.Label.Text = "Start " .. v2.Title .. " Quests?"
									p1.Content.Price.TextLabel.Text = v12.suffix(v2.Cost)
								end,
								Run = function() --[[ Run | Line: 1771 | Upvalues: v20 (ref), v15 (ref), v49 (ref), v19 (ref) ]]
									local v1, v2 = v20.GetRemoteFunction("StartSpeciesUnlockRemote"):InvokeServer(v15)
									if v1 then
										v49:set("HomePage")
									else
										v19.Notify({
											Type = "Red",
											Message = v2
										})
									end
									return true
								end,
								Cancel = function() --[[ Cancel | Line: 1786 ]]
									return true
								end
							})
							return
						end
						local v1, v22 = v20.GetRemoteFunction("StartSpeciesUnlockRemote"):InvokeServer(v15)
						if v1 then
							return
						end
						v19.Notify({
							Type = "Red",
							Message = v22
						})
					end
				})
				v1.new(v42, {
					Click = function() --[[ Click | Line: 1805 | Upvalues: IsCompleted (copy), v15 (copy), setSelectedSpeciesUnlockMission (ref), v2 (copy), setSelectedSpeciesMission (ref), v14 (ref), v39 (ref) ]]
						if IsCompleted(v15) then
							setSelectedSpeciesMission(v14.GetTimedSpeciesMission(v39, v15))
						else
							setSelectedSpeciesUnlockMission(v2)
						end
					end
				})
				v1.new(v42.CloseButton, {
					Click = function() --[[ Click | Line: 1815 | Upvalues: v3 (ref), v20 (ref), v15 (copy) ]]
						v3.Prompt({
							Type = "ConfirmCancel",
							Setup = function(p1) --[[ Setup | Line: 1818 ]] end,
							Run = function() --[[ Run | Line: 1819 | Upvalues: v20 (ref), v15 (ref) ]]
								v20.GetRemoteFunction("CancelSpeciesUnlockRemote"):InvokeServer(v15)
								return true
							end,
							Cancel = function() --[[ Cancel | Line: 1824 ]]
								return true
							end
						})
					end
				})
				v9.new({
					TweenAmount = false,
					Clipped = false,
					Frame = v42.Content.ProgressBar.Bar,
					AmountLabel = v42.Content.ProgressLabel,
					GetText = function(p1, p2) --[[ GetText | Line: 1837 ]]
						if p1 == p2 then
							return "COMPLETED"
						else
							return p1 .. "/" .. p2
						end
					end,
					Get = function() --[[ Get | Line: 1845 | Upvalues: v32 (copy), v39 (ref), v15 (copy) ]]
						if v32.Completed.Value then
							local sum = 0
							for v1, v2 in v39.PlayerData.SpeciesUpgrades[v15]:GetChildren() do
								sum = sum + v2.Value
							end
							return sum
						else
							local sum = 0
							for k, v in pairs(v32.Missions:GetChildren()) do
								sum = sum + (if v.Value then 1 else 0)
							end
							return sum
						end
					end,
					GetMax = function() --[[ GetMax | Line: 1862 | Upvalues: v32 (copy), v35 (ref), v15 (copy) ]]
						if not v32.Completed.Value then
							return #v32.Missions:GetChildren()
						end
						local sum = 0
						for v1, v2 in v35[v15] do
							sum = sum + #v2
						end
						return sum
					end,
					Changed = t4
				})
				v49:subscribe(UpdateState)
				local function setUnclaimed() --[[ setUnclaimed | Line: 1881 | Upvalues: v32 (copy), v15 (copy), v39 (ref), v47 (ref), v42 (copy), UpdateState (copy) ]]
					if v32.Completed.Value then
						local v1 = v15
						local sum = 0
						local v2 = v39.PlayerData.Missions.SpeciesUnlocks[v1]
						if v2 then
							sum = sum + v47(v2)
						end
						local v3 = v39.PlayerData.Missions.SpeciesMissions[v1]
						if v3 then
							sum = sum + v47(v3)
						end
						v42.DiscoveredTag.Content.TextLabel.Text = "+" .. sum
						v42.DiscoveredTag.Visible = sum > 0
					else
						local v5 = v15
						local sum = 0
						local v6 = v39.PlayerData.Missions.SpeciesUnlocks[v5]
						if v6 then
							sum = sum + v47(v6)
						end
						local v7 = v39.PlayerData.Missions.SpeciesMissions[v5]
						if v7 then
							sum = sum + v47(v7)
						end
						v42.DiscoveredTag.Content.TextLabel.Text = "+" .. sum
						v42.DiscoveredTag.Content.TextLabel.TextColor3 = Color3.fromRGB(236, 236, 236)
						v42.DiscoveredTag.Visible = sum > 0
						UpdateState()
					end
				end
				v39.MissionsChangedSignal:Connect(setUnclaimed)
				setUnclaimed()
				v32.Started:GetPropertyChangedSignal("Value"):Connect(UpdateState)
				v32.Completed:GetPropertyChangedSignal("Value"):Connect(UpdateState)
				if v82 then
					v82.Claimed:GetPropertyChangedSignal("Value"):Connect(UpdateState)
					for v11, v122 in v82.Missions:GetChildren() do
						if v122:FindFirstChild("Claimed") then
							v122.Claimed:GetPropertyChangedSignal("Value"):Connect(UpdateState)
						end
					end
				end
			end
		end
		for v132, v142 in v39.PlayerData.ActivityUpgrades:GetChildren() do
			local v15 = p1.Content.Missions.Content.Default:Clone()
			local v16 = v28.GetUpgradeData(v142.Name)
			v15.Content.Title.Text = v22.separateWordsInString(v142.Name)
			local v17 = true
			if v16.SpeciesRequired then
				local v182 = v39.PlayerData.Missions.SpeciesUnlocks[v16.SpeciesRequired]
				local v192 = v5.GetByName(v16.SpeciesRequired)
				local v202 = v13.GetDisplayName(v192.Name, v192)
				local function setLocked() --[[ setLocked | Line: 1927 | Upvalues: v15 (copy), v182 (copy), v202 (copy), v17 (ref) ]]
					v15.Locked.Visible = not v182.Completed.Value
					v15.Locked.Title.Text = "Required: " .. v202
					v17 = v182.Completed.Value
				end
				v182.Completed:GetPropertyChangedSignal("Value"):Connect(setLocked)
				v15.Locked.Visible = not v182.Completed.Value
				v15.Locked.Title.Text = "Required: " .. v202
				v17 = v182.Completed.Value
			end
			local function isAllUpgradesCompleted() --[[ isAllUpgradesCompleted | Line: 1938 | Upvalues: v142 (copy) ]]
				for v1, v2 in v142.Upgrades:GetChildren() do
					if not v2.Value then
						return false
					end
				end
				return true
			end
			local function UpdateState() --[[ UpdateState | Line: 1948 | Upvalues: v142 (copy), v15 (copy), t2 (copy), v49 (ref) ]]
				local Started = v142.Started.Value
				local v1
				if Started then
					local v2 = true
					for v3, v4 in v142.Upgrades:GetChildren() do
						if not v4.Value then
							v2 = false
							break
						end
					end
					if v2 then
						if Started then
							v1 = true
							for v5, v6 in v142.Upgrades:GetChildren() do
								if not v6.Value then
									v1 = false
									break
								end
							end
							if v1 then
								v15.White.BackgroundColor3 = t2.Unlock.Color
								v15.Content.ProgressBar.BackgroundColor3 = t2.Unlock.ProgressBarColor
								v15.CloseButton.Visible = false
								v15.LayoutOrder = t2.Unlock.Order
							else
								v15.White.BackgroundColor3 = t2.Upgradeable.Color
								v15.Content.ProgressBar.BackgroundColor3 = t2.Upgradeable.ProgressBarColor
								v15.CloseButton.Visible = false
								v15.LayoutOrder = t2.Upgradeable.Order
							end
						else
							v15.White.BackgroundColor3 = t2.Upgradeable.Color
							v15.Content.ProgressBar.BackgroundColor3 = t2.Upgradeable.ProgressBarColor
							v15.CloseButton.Visible = false
							v15.LayoutOrder = t2.Upgradeable.Order
						end
					else
						v15.White.BackgroundColor3 = t2.Completed.Color
						v15.CloseButton.Visible = false
						v15.Content.ProgressBar.BackgroundColor3 = t2.Completed.ProgressBarColor
						v15.LayoutOrder = t2.Completed.Order
					end
				elseif Started then
					v1 = true
					for v5, v6 in v142.Upgrades:GetChildren() do
						if not v6.Value then
							v1 = false
							break
						end
					end
					if v1 then
						v15.White.BackgroundColor3 = t2.Unlock.Color
						v15.Content.ProgressBar.BackgroundColor3 = t2.Unlock.ProgressBarColor
						v15.CloseButton.Visible = false
						v15.LayoutOrder = t2.Unlock.Order
					else
						v15.White.BackgroundColor3 = t2.Upgradeable.Color
						v15.Content.ProgressBar.BackgroundColor3 = t2.Upgradeable.ProgressBarColor
						v15.CloseButton.Visible = false
						v15.LayoutOrder = t2.Upgradeable.Order
					end
				else
					v15.White.BackgroundColor3 = t2.Upgradeable.Color
					v15.Content.ProgressBar.BackgroundColor3 = t2.Upgradeable.ProgressBarColor
					v15.CloseButton.Visible = false
					v15.LayoutOrder = t2.Upgradeable.Order
				end
				local v7 = false
				if v49:get() == "HomePage" then
					v7 = Started
				elseif v49:get() == "AddPage" then
					v7 = not Started
				end
				v15.Visible = v7
				v15.Content.UpgradeButton.Visible = false
				v15.Content.StartButton.Visible = not Started
				v15.Content.ProgressBar.Visible = Started
				v15.Content.ProgressLabel.Visible = Started
				v15.Content.StartButton.Top.TextLabel.Text = "Start Activity"
			end
			v1.new(v15, {
				Click = function() --[[ Click | Line: 1987 | Upvalues: v17 (ref), setSelectedActivityUnlock (ref), v16 (copy), v142 (copy) ]]
					if v17 then
						setSelectedActivityUnlock(v16, v142)
					end
				end
			})
			v1.new(v15.Content.StartButton, {
				Click = function() --[[ Click | Line: 1996 | Upvalues: v17 (ref), v3 (ref), v22 (ref), v142 (copy), v12 (ref), v20 (ref), v49 (ref), v19 (ref) ]]
					if v17 then
						v3.Prompt({
							Type = "StartSpecies",
							Setup = function(p1) --[[ Setup | Line: 2002 | Upvalues: v22 (ref), v142 (ref), v12 (ref) ]]
								p1.Content.Label.Text = "Start " .. v22.separateWordsInString(v142.Name) .. "?"
								p1.Content.Price.TextLabel.Text = v12.suffix(0)
							end,
							Run = function() --[[ Run | Line: 2008 | Upvalues: v20 (ref), v142 (ref), v49 (ref), v19 (ref) ]]
								local v1, v2 = v20.GetRemoteFunction("StartActivityUpgradesRemote"):InvokeServer(v142.Name)
								if v1 then
									v49:set("HomePage")
								else
									v19.Notify({
										Type = "Red",
										Message = v2
									})
								end
								return true
							end,
							Cancel = function() --[[ Cancel | Line: 2023 ]]
								return true
							end
						})
					end
				end
			})
			local t4 = {}
			for k, v in pairs(v142.Upgrades:GetChildren()) do
				table.insert(t4, v:GetPropertyChangedSignal("Value"))
			end
			v9.new({
				TweenAmount = false,
				Clipped = false,
				Frame = v15.Content.ProgressBar.Bar,
				AmountLabel = v15.Content.ProgressLabel,
				GetText = function(p1, p2) --[[ GetText | Line: 2042 ]]
					if p1 == p2 then
						return "COMPLETED"
					else
						return p1 .. "/" .. p2
					end
				end,
				Get = function() --[[ Get | Line: 2050 | Upvalues: v142 (copy) ]]
					local sum = 0
					for k, v in pairs(v142.Upgrades:GetChildren()) do
						sum = sum + (if v.Value then 1 else 0)
					end
					return sum
				end,
				GetMax = function() --[[ GetMax | Line: 2057 | Upvalues: v142 (copy) ]]
					return #v142.Upgrades:GetChildren()
				end,
				Changed = t4,
				OnChanged = function(p1, p2) --[[ OnChanged | Line: 2061 ]] end
			})
			v1.new(v15.CloseButton, {
				Click = function() --[[ Click | Line: 2065 | Upvalues: v17 (ref), v3 (ref), v20 (ref), v142 (copy), v19 (ref) ]]
					if v17 then
						v3.Prompt({
							Type = "ConfirmCancel",
							Setup = function(p1) --[[ Setup | Line: 2071 ]] end,
							Run = function() --[[ Run | Line: 2072 | Upvalues: v20 (ref), v142 (ref), v19 (ref) ]]
								local v1, v2 = v20.GetRemoteFunction("CancelActivityUpgradeRemote"):InvokeServer(v142.Name)
								if v1 then
									return true
								end
								v19.Notify({
									Type = "Red",
									Message = v2
								})
								return true
							end,
							Cancel = function() --[[ Cancel | Line: 2085 ]]
								return true
							end
						})
					end
				end
			})
			v142.Started:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2092 | Upvalues: UpdateState (copy) ]]
				UpdateState()
			end)
			v142.Completed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2096 | Upvalues: UpdateState (copy) ]]
				UpdateState()
			end)
			t:_createActivityUpgradeViewport(v15.Viewport, v16)
			v49:subscribe(UpdateState)
			v15.Parent = p1.Content.Missions.Content
		end
		local Add = p1.Content.Missions.Content.Add
		local BackButton = p1.Content.Missions.BackButton
		v1.new(Add, {
			Click = function() --[[ Click | Line: 2110 | Upvalues: v49 (ref) ]]
				v49:set("AddPage")
			end
		})
		v1.new(BackButton, {
			Click = function() --[[ Click | Line: 2116 | Upvalues: v49 (ref) ]]
				v49:set("HomePage")
			end
		})
		v49:subscribe(function() --[[ Line: 2121 | Upvalues: v49 (ref), Add (copy), BackButton (copy) ]]
			if v49:get() == "HomePage" then
				Add.Visible = true
				BackButton.Visible = false
			else
				Add.Visible = false
				BackButton.Visible = true
			end
		end)
		v1.new(p1.Content.Selected.DisplayPanel.BackButton, {
			Click = function() --[[ Click | Line: 2132 | Upvalues: p1 (copy), setSelectedActivityUnlock (ref), setSelectedSpeciesUnlockMission (ref) ]]
				p1.Timer.Visible = false
				setSelectedActivityUnlock()
				setSelectedSpeciesUnlockMission()
			end
		})
		v1.new(p1.Content.ActivityUpgrades.DisplayPanel.BackButton, {
			Click = function() --[[ Click | Line: 2140 | Upvalues: p1 (copy), setSelectedActivityUnlock (ref) ]]
				p1.Timer.Visible = false
				setSelectedActivityUnlock()
			end
		})
	end,
	HorsesTest = function(p1, p2) --[[ HorsesTest | Line: 2147 ]] end,
	DynamicNPCs = function(p1, p2) --[[ DynamicNPCs | Line: 2150 | Upvalues: v8 (copy), v24 (copy), v4 (copy), v17 (copy), createNPCViewport (copy), v39 (copy), v13 (copy), v5 (copy), v9 (copy) ]]
		v8.new(p2, {
			Click = function() --[[ Click | Line: 2152 | Upvalues: v24 (ref), v4 (ref), p1 (copy) ]]
				if v24.CanDoActionInTutorial("JournalTabs") then
					v4.OpenTab(p1)
				end
			end
		})
		for k, v in pairs(v17.GetAll()) do
			local v1 = p1.Content.NPCs.Content:FindFirstChild(k)
			if v1 and v17.CanBondWithNPC(k) then
				createNPCViewport(v1.Viewport, v.CharacterModel)
				v8.new(v1, {
					HoverUpPosition = 0.03,
					HoverUpLabel = v1.Viewport,
					Click = function() --[[ Click | Line: 2176 ]] end
				})
				local v2 = v39.PlayerData.Missions.SpeciesUnlocks[v.RequiredSpecies]
				local function setLocked() --[[ setLocked | Line: 2181 | Upvalues: v2 (copy), v1 (copy) ]]
					local Completed = v2.Completed.Value
					v1.Locked.Visible = false
				end
				v1.Locked.Title.Text = string.format("Complete %s Quests first!", v13.GetDisplayName(v.RequiredSpecies, v5.GetByName(v.RequiredSpecies)))
				v2.Completed:GetPropertyChangedSignal("Value"):Connect(setLocked)
				local Completed = v2.Completed.Value
				v1.Locked.Visible = false
				local v3 = v39.PlayerData.DynamicNPCs[k]
				v9.new({
					TweenAmount = false,
					Clipped = false,
					Frame = v1.Content.ProgressBar.Bar,
					AmountLabel = v1.Content.ProgressLabel,
					GetText = function(p1, p2) --[[ GetText | Line: 2199 ]]
						local v1 = p1 / p2 * 100
						return (if v1 % 1 == 0 then string.format("%d%%", v1) else string.format("%.2f%%", v1)) .. " Bond"
					end,
					Get = function() --[[ Get | Line: 2208 | Upvalues: v3 (copy) ]]
						return v3.Bond.Value
					end,
					GetMax = function() --[[ GetMax | Line: 2211 | Upvalues: v (copy) ]]
						return v.BondPointsForFull
					end,
					Changed = { v3.Bond:GetPropertyChangedSignal("Value") }
				})
			end
		end
	end,
	ColorPicking = function(p1, p2) --[[ ColorPicking | Line: 2221 | Upvalues: v7 (copy), v8 (copy), v24 (copy), v4 (copy), v21 (copy), v39 (copy), Colors (copy), v33 (copy), v1 (copy), v20 (copy), v25 (copy), JournalGui (copy) ]]
		local TextBox = p1.Content.Content.SearchBar.Content.TextBox
		local Result = p1.Content.Content.Result
		local t = {}
		local v12 = v7.new()
		local v2 = false
		local v3 = nil
		local v42 = nil
		local function UpdateColors() --[[ UpdateColors | Line: 2232 | Upvalues: v3 (ref), Result (copy), v42 (ref), v2 (ref), v12 (copy) ]]
			if v3 then
				Result.ColorSlot1.ColorLabel.BackgroundColor3 = v3.ColorRGB
				Result.ColorSlot1.ColorLabel.Icon.Text = v3.Name
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
		local function removeDuplicatesByName(p1) --[[ removeDuplicatesByName | Line: 2255 ]]
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
			Click = function() --[[ Click | Line: 2270 | Upvalues: v24 (ref), v4 (ref), p1 (copy) ]]
				if v24.CanDoActionInTutorial("JournalTabs") then
					v4.OpenTab(p1)
				end
			end
		})
		TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 2279 | Upvalues: TextBox (copy), t (copy) ]]
			local v1 = string.lower(TextBox.Text)
			for v2, v3 in t do
				if v1 == "" or string.find(string.lower(v2), v1) then
					v3.Visible = true
					continue
				end
				v3.Visible = false
			end
		end)
		v21.CreateCurrencyLabel({
			GuiObject = p1.Content.Content.Coins.Content.TextLabel,
			Value = v39:GetCurrencyValue("Coins"),
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 2294 ]] end
		})
		for v5, v6 in Colors.ColorData do
			local v72 = p1.Content.Content.Colors.Content.Default:Clone()
			v72.Content.Icon.Text = v6.Name
			v72.Content.ColorLabel.BackgroundColor3 = v6.ColorRGB
			v72.Visible = true
			v72.Parent = p1.Content.Content.Colors.Content
			t[v6.Name] = v72
			v8.new(v72.Content, {
				Click = function() --[[ Click | Line: 2310 | Upvalues: v3 (ref), v6 (copy), v42 (ref), UpdateColors (copy) ]]
					if v3 == nil then
						v3 = v6
					else
						v42 = v6
					end
					UpdateColors()
				end
			})
		end
		UpdateColors()
		v8.new(Result.ColorSlot1.ClearButton, {
			Click = function() --[[ Click | Line: 2325 | Upvalues: v3 (ref), UpdateColors (copy) ]]
				v3 = nil
				UpdateColors()
			end
		})
		v8.new(Result.ColorSlot2.ClearButton, {
			Click = function() --[[ Click | Line: 2333 | Upvalues: v42 (ref), UpdateColors (copy) ]]
				v42 = nil
				UpdateColors()
			end
		})
		p1.Content.Content.Result.PredictButton.Top.TextLabel.Text = "Predict ($" .. v33.PredictColorPrice .. ")"
		v1.new(p1.Content.Content.Result.PredictButton, {
			Click = function() --[[ Click | Line: 2344 | Upvalues: v3 (ref), v42 (ref), v2 (ref), v20 (ref), v25 (ref), v12 (copy), removeDuplicatesByName (copy), Result (copy) ]]
				if not (v3 and v42) then
					return
				end
				if v2 then
					return
				end
				if not v20.GetRemoteFunction("PredictColor"):InvokeServer() then
					return
				end
				local v1 = v25.GetPossibleColors(v3, v42, 5)
				if not v1 then
					return
				end
				v12:DoCleaning()
				v2 = true
				for v22, v32 in removeDuplicatesByName(v1) do
					local v4 = Result.Colors.Content.Default:Clone()
					v4.Content.Icon.Text = v32.Name
					v4.Content.ColorLabel.BackgroundColor3 = v32.ColorRGB
					v4.Visible = true
					v4.Parent = Result.Colors.Content
					v12:GiveTask(v4)
				end
			end
		})
		local FoalsBorn = v39.PlayerData.Stats.FoalsBorn
		if not (FoalsBorn.Value < 25) then
			return
		end
		JournalGui.ContainerFrame.TabButtons.ColorPicking.Visible = false
		local v82 = nil
		v82 = FoalsBorn:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2388 | Upvalues: FoalsBorn (copy), JournalGui (ref), v82 (ref) ]]
			if not (FoalsBorn.Value >= 25) then
				return
			end
			JournalGui.ContainerFrame.TabButtons.ColorPicking.Visible = true
			v82:Disconnect()
		end)
	end,
	Missions = function(p1, p2) --[[ Missions | Line: 2397 | Upvalues: v8 (copy), v24 (copy), v46 (ref), v45 (copy), v4 (copy), getTotalUnclaimedForCategory (copy), v39 (copy), v18 (copy), v14 (copy), v7 (copy), v38 (copy), Sonar (copy), LocalPlayer (copy), v12 (copy), v5 (copy), v16 (copy), v1 (copy), claimStreakReward (copy), v9 (copy), v37 (copy), v15 (copy), v21 (copy), v19 (copy), pinMission (copy) ]]
		v8.new(p2, {
			Click = function() --[[ Click | Line: 2399 | Upvalues: v24 (ref), v46 (ref), v45 (ref), v4 (ref), p1 (copy) ]]
				if v24.CanDoActionInTutorial("JournalTabs") then
					v46 = "Missions"
					v45:FireServer("AccessedMajorInterface", "Missions")
					v4.OpenTab(p1)
				end
			end
		})
		local function setUnclaimed() --[[ setUnclaimed | Line: 2411 | Upvalues: getTotalUnclaimedForCategory (ref), p2 (copy) ]]
			local v1 = getTotalUnclaimedForCategory("OneTimeMissions") + getTotalUnclaimedForCategory("StreakMissions")
			p2.Notification.Content.TextLabel.Text = "+" .. v1
			p2.Notification.Visible = v1 > 0
		end
		v39.MissionsChangedSignal:Connect(setUnclaimed)
		pcall(setUnclaimed)
		local function setDailyTimerLabel() --[[ setDailyTimerLabel | Line: 2421 | Upvalues: p1 (copy), v18 (ref), v14 (ref) ]]
			p1.Timer.TextLabel.Text = "Missions refresh in " .. v18.FormatString(v14.DailyStreakMissionTimer:GetTime())
		end
		v14.DailyStreakMissionTimer.TimeChanged:Connect(setDailyTimerLabel)
		pcall(setDailyTimerLabel)
		local function setTimerLabel() --[[ setTimerLabel | Line: 2428 | Upvalues: p1 (copy), v18 (ref), v14 (ref) ]]
			p1.Content.ResetLabel.Text = "\226\143\176 Streak resets in " .. v18.FormatString(v14.StreakMissionTimer:GetTime())
		end
		v14.StreakMissionTimer.TimeChanged:Connect(setTimerLabel)
		pcall(setTimerLabel)
		local v13 = nil
		local v2 = v7.new()
		local function setStreak() --[[ setStreak | Line: 2438 | Upvalues: v14 (ref), v39 (ref), v13 (ref), v2 (copy), v38 (ref), Sonar (ref), LocalPlayer (ref), p1 (copy), v12 (ref), v5 (ref), v8 (ref), v16 (ref) ]]
			local v1 = v14.GetCurrentStreakTier(v39)
			local v22 = v1 ~= v13
			v13 = v1
			if v22 then
				v2:DoCleaning()
				local v3 = v38[v1.Index]
				local sum = 0
				for k, v in pairs(v3.Rewards) do
					sum = sum + v.P
				end
				for k, v in pairs(v3.Rewards) do
					if v.Species then
						local v4 = Sonar("ItemSetService"):_giveHorse(v39, v)
						local v52 = Sonar("AnimalGridButton").new({
							DisplayName = "Random Themed Horse",
							ForceVisible = true,
							SlotValue = v4,
							Owner = LocalPlayer,
							GuiObject = p1.Content.DisplayPanel.Content.Rewards.DefaultAnimal,
							ParentFrame = p1.Content.DisplayPanel.Content.Rewards,
							Theme = v.Theme,
							GetAmount = function() --[[ GetAmount | Line: 2467 | Upvalues: v (copy) ]]
								return v.Amount
							end
						})
						local ChanceLabel = v52.Frame:FindFirstChild("ChanceLabel", true)
						ChanceLabel.Text = v12.percentage(v.P / sum * 100, 2) .. "%"
						ChanceLabel.Visible = true
						v52.Frame.LayoutOrder = -v.P
						v2:GiveTask(v52)
						continue
					end
					local v6 = v5.GetByName(v.Name)
					local v7 = Sonar("ItemGridButton").new({
						ForceVisible = true,
						Item = v6,
						ParentFrame = p1.Content.DisplayPanel.Content.Rewards,
						Theme = v.Theme,
						GetAmount = function() --[[ GetAmount | Line: 2488 | Upvalues: v (copy) ]]
							return v.Amount
						end
					})
					local ChanceLabel = v7.Frame:FindFirstChild("ChanceLabel", true)
					ChanceLabel.Text = v12.percentage(v.P / sum * 100, 2) .. "%"
					ChanceLabel.Visible = true
					v7.Frame.LayoutOrder = -v.P
					if v6.Description then
						v7:GiveTask(v8.new(v7.Frame, {
							Click = function() --[[ Click | Line: 2500 | Upvalues: v16 (ref), v7 (copy), v6 (copy) ]]
								v16:CreateToolTip({
									Type = "ItemDescription",
									Offset = Vector2.new(0.65, 0.5),
									GuiObject = v7.Frame,
									Get = function() --[[ Get | Line: 2505 | Upvalues: v6 (ref) ]]
										return v6
									end
								})
							end
						}))
					end
					v2:GiveTask(v7)
				end
			end
			p1.Content.DisplayPanel.Content.Title.Text = "STREAK " .. v1.Index
			p1.Content.DisplayPanel.Content.Description.Text = if v39.PlayerData.Missions.StreakMissions.ClaimedTiers[v1.Index].Value then "CLAIMED" else string.format("Earn %s Points and claim these rewards!", v1.Points)
			p1.Content.DisplayPanel.Content.ClaimButton.Visible = if v14.GetStreakPoints(v39) >= v1.Points then not v39.PlayerData.Missions.StreakMissions.ClaimedTiers[v1.Index].Value else false
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
		for k, v in pairs(v39.PlayerData.Missions.StreakMissions.ClaimedTiers:GetChildren()) do
			v:GetPropertyChangedSignal("Value"):Connect(setStreak)
		end
		v39.PlayerData.Missions.StreakMissions.StreakPoints:GetPropertyChangedSignal("Value"):Connect(setStreak)
		pcall(setStreak)
		v1.new(p1.Content.DisplayPanel.Content.ClaimButton, {
			Click = function() --[[ Click | Line: 2539 | Upvalues: claimStreakReward (ref) ]]
				claimStreakReward()
			end
		})
		Sonar("AdClient").CheckAdAvailability(p1.Content.AdButton)
		v1.new(p1.Content.AdButton, {
			Click = function() --[[ Click | Line: 2547 | Upvalues: Sonar (ref) ]]
				Sonar("AdClient").ShowAd("DailyMission")
			end
		})
		v9.new({
			TweenAmount = false,
			Clipped = false,
			Frame = p1.Content.ProgressBar.Bar,
			AmountLabel = p1.Content.PointsLabel,
			GetText = function(p1) --[[ GetText | Line: 2558 | Upvalues: v12 (ref) ]]
				return v12.suffix(p1) .. " Points"
			end,
			Get = function() --[[ Get | Line: 2561 | Upvalues: v14 (ref), v39 (ref) ]]
				return v14.GetStreakPoints(v39)
			end,
			GetMax = function() --[[ GetMax | Line: 2564 ]]
				return 50
			end,
			Changed = { v39.PlayerData.Missions.StreakMissions.StreakPoints:GetPropertyChangedSignal("Value") }
		})
		for k, v in pairs(v37.Missions) do
			local v3 = v39.PlayerData.Missions.StreakMissions.Missions[k]
			local v42 = v37.Missions[k - 1] and v39.PlayerData.Missions.StreakMissions.Missions[k - 1]
			for k2, v6 in pairs(v.Missions) do
				local v52 = v3.Missions:FindFirstChild(k2)
				local v62 = p1.Content.MissionList.Content.Default:Clone()
				p1.Content.MissionList.Content.Default.Visible = false
				local function setDescriptionLabel() --[[ setDescriptionLabel | Line: 2582 | Upvalues: v14 (ref), k (copy), v52 (copy), v62 (copy) ]]
					local v1 = v14.GetMissionPreset("StreakMissions", k, v52)
					local v2 = v1.Description or v14.Descriptions[v1.Type] or v1.Type
					if v1.DoNotFormat then
						v62.Content.QuestDescription.Text = v2
					else
						v62.Content.QuestDescription.Text = string.format(v2, v52.TargetAmount.Value)
					end
				end
				v52.Amount:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel)
				v52.TargetAmount:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel)
				v52.Type:GetPropertyChangedSignal("Value"):Connect(setDescriptionLabel)
				pcall(setDescriptionLabel)
				v1.new(v62.Content.ClaimButton, {
					Click = function() --[[ Click | Line: 2599 | Upvalues: k (copy), k2 (copy), v14 (ref), v39 (ref), v15 (ref) ]]
						local v1 = k
						local v2 = k2
						local v3 = v14.CanClaimStreakMission(v39, v1, v2)
						if v3 == true then
							v14.ClaimStreakMission(v1, v2)
						else
							v15.NotifyIssue(v3)
						end
					end
				})
				local function setPinned() --[[ setPinned | Line: 2604 | Upvalues: v62 (copy), v52 (copy), v21 (ref) ]]
					v62.Content.PinButton.Visible = v52.Pinned.Value or not v52.Value
					v62.Content.PinButton.Top.CrossLabel.Visible = v52.Pinned.Value
					v21.SetButtonColor(v62.Content.PinButton, "Diagonal", if v52.Pinned.Value then "Red" else "Blue")
				end
				v52:GetPropertyChangedSignal("Value"):Connect(setPinned)
				v52.Pinned:GetPropertyChangedSignal("Value"):Connect(setPinned)
				pcall(setPinned)
				v1.new(v62.Content.PinButton, {
					Click = function() --[[ Click | Line: 2615 | Upvalues: v42 (copy), v19 (ref), pinMission (ref), k (copy), k2 (copy) ]]
						if v42 and not v42.Completed.Value then
							v19.Notify({
								Message = "You must complete the previous mission first!",
								Type = "Red"
							})
						else
							pinMission("StreakMissions", k, k2)
						end
					end
				})
				local function setLocked() --[[ setLocked | Line: 2628 | Upvalues: v42 (copy), v62 (copy) ]]
					if v42 then
						v62.Locked.Visible = not v42.Completed.Value
					else
						v62.Locked.Visible = false
					end
				end
				if v42 then
					v42.Completed:GetPropertyChangedSignal("Value"):Connect(setLocked)
				end
				pcall(setLocked)
				local v72 = v7.new()
				local function createReward() --[[ createReward | Line: 2643 | Upvalues: v72 (copy), v52 (copy), v6 (copy), v5 (ref), Sonar (ref), v62 (copy), v8 (ref), v16 (ref) ]]
					v72:DoCleaning()
					local v1 = game:GetService("HttpService"):JSONDecode(v52.Reward.Value)
					local v3 = type(v1[1]) == "table" and v1[1] or v6.Rewards[v1[1]]
					local v4 = v5.GetByName(v3.Name)
					local v53 = Sonar("ItemGridButton").new({
						DoNotClone = true,
						IgnoreBackgroundColor = true,
						ForceVisible = true,
						Item = v4,
						GuiObject = v62.Content.RewardContainer,
						Theme = v3.Theme,
						GetAmount = function() --[[ GetAmount | Line: 2657 | Upvalues: v3 (copy) ]]
							return v3.Amount
						end
					})
					v72:GiveTask(v8.new(v62.Content.RewardContainer, {
						Click = function() --[[ Click | Line: 2663 | Upvalues: v16 (ref), v62 (ref), v4 (copy) ]]
							v16:CreateToolTip({
								Type = "ItemDescription",
								Offset = Vector2.new(0.65, 0.5),
								GuiObject = v62.Content.RewardContainer,
								Get = function() --[[ Get | Line: 2668 | Upvalues: v4 (ref) ]]
									return v4
								end
							})
						end
					}))
					v72:GiveTask(v53)
				end
				v52.Reward:GetPropertyChangedSignal("Value"):Connect(createReward)
				pcall(createReward)
				v9.new({
					TweenAmount = false,
					Clipped = false,
					Frame = v62.Content.ProgressBar.Bar,
					AmountLabel = v62.Content.ProgressLabel,
					GetText = function(p1, p2) --[[ GetText | Line: 2687 | Upvalues: v52 (copy) ]]
						if v52.Claimed.Value then
							return "CLAIMED"
						else
							return p1 .. "/" .. p2
						end
					end,
					Get = function() --[[ Get | Line: 2694 | Upvalues: v52 (copy) ]]
						if v52.Value or v52.Claimed.Value then
							return v52.TargetAmount.Value
						else
							return math.min(v52.Amount.Value, v52.TargetAmount.Value)
						end
					end,
					GetMax = function() --[[ GetMax | Line: 2700 | Upvalues: v52 (copy) ]]
						return v52.TargetAmount.Value
					end,
					Changed = {
						v52.Amount:GetPropertyChangedSignal("Value"),
						v52.Claimed:GetPropertyChangedSignal("Value"),
						v52.TargetAmount:GetPropertyChangedSignal("Value"),
						v52:GetPropertyChangedSignal("Value"),
						v62.Locked:GetPropertyChangedSignal("Visible")
					},
					OnChanged = function() --[[ OnChanged | Line: 2710 | Upvalues: v52 (copy), v62 (copy), k (copy), k2 (copy) ]]
						if v52.Value and not v52.Claimed.Value then
							v62.Content.ClaimButton.Visible = true
							v62.Content.ProgressLabel.Visible = false
							v62.LayoutOrder = 1
							return
						end
						v62.Content.ClaimButton.Visible = false
						v62.Content.ProgressLabel.Visible = true
						v62.LayoutOrder = k * 10 + k2 + (if v62.Locked.Visible then 2000 elseif v52.Claimed.Value then 1000 else 0)
					end
				})
				v1.new(v62.Content.ClaimButton, {
					Click = function() --[[ Click | Line: 2726 ]] end
				})
				v62.Visible = true
				v62.Parent = p1.Content.MissionList.Content
			end
		end
	end,
	Story = function(p1, p2) --[[ Story | Line: 2737 | Upvalues: v8 (copy), v24 (copy), v46 (ref), v45 (copy), v4 (copy), getTotalUnclaimedForCategory (copy), v39 (copy), v36 (copy), v47 (copy), v1 (copy), v19 (copy), setSelectedStoryMission (copy), v2 (copy), ContainerFrame (copy) ]]
		local v12 = p1.Content
		v8.new(p2, {
			Click = function() --[[ Click | Line: 2741 | Upvalues: v24 (ref), v46 (ref), v45 (ref), v4 (ref), p1 (copy) ]]
				if v24.CanDoActionInTutorial("JournalTabs") then
					v46 = "Storybook"
					v45:FireServer("AccessedMajorInterface", "Storybook")
					v4.OpenTab(p1)
				end
			end
		})
		local function setUnclaimed() --[[ setUnclaimed | Line: 2753 | Upvalues: getTotalUnclaimedForCategory (ref), p2 (copy) ]]
			local v1 = getTotalUnclaimedForCategory("StoryMissions")
			p2.Notification.Content.TextLabel.Text = "+" .. v1
			p2.Notification.Visible = v1 > 0
		end
		v39.MissionsChangedSignal:Connect(setUnclaimed)
		local v22 = getTotalUnclaimedForCategory("StoryMissions")
		p2.Notification.Content.TextLabel.Text = "+" .. v22
		p2.Notification.Visible = v22 > 0
		for v42, v5 in v36.Chapters do
			local v6 = (v42 - 1) * 100
			local v7 = v12.Chapters.Content.ChapterDefault:Clone()
			v12.Chapters.Content.ChapterDefault.Visible = false
			local v82 = v39.PlayerData.Missions.StoryMissions[v42]
			v7.ChapterName.Text = "Chapter " .. v42
			v7.ChapterDescription.Text = v5.DisplayName
			v7.Scene.Image = v5.Image or v7.Scene.Image
			local function setUnlocked() --[[ setUnlocked | Line: 2772 | Upvalues: v7 (copy), v82 (copy) ]]
				v7.Locked.Visible = not v82.Unlocked.Value
			end
			v82.Unlocked:GetPropertyChangedSignal("Value"):Connect(setUnlocked)
			v7.Locked.Visible = not v82.Unlocked.Value
			local function setUnclaimed_2() --[[ setUnclaimed | Line: 2778 | Upvalues: v47 (ref), v82 (copy), v7 (copy) ]]
				local v1 = v47(v82)
				v7.Notification.Content.TextLabel.Text = "+" .. v1
				v7.Notification.Visible = v82.Unlocked.Value and v1 > 0
			end
			v82.Unlocked:GetPropertyChangedSignal("Value"):Connect(setUnclaimed_2)
			v39.MissionsChangedSignal:Connect(setUnclaimed_2)
			local v10 = v47(v82)
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
				local function setChapterStarted() --[[ setChapterStarted | Line: 2798 | Upvalues: v82 (copy), v7 (copy) ]]
					local v1 = false
					for k, v in pairs(v82.Stories:GetChildren()) do
						if v.Started.Value then
							v1 = true
							break
						end
					end
					v7.StartedLabel.Visible = v1
				end
				local function setProgress() --[[ setProgress | Line: 2808 | Upvalues: v15 (copy), v13 (copy), v14 (copy), setChapterStarted (copy) ]]
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
					Click = function() --[[ Click | Line: 2852 | Upvalues: v15 (copy), v19 (ref), v13 (copy), setSelectedStoryMission (ref), v42 (copy), v122 (copy) ]]
						if not v15.Unlocked.Value then
							v19.Notify({
								Message = "You have to complete the previous story to unlock this!",
								Type = "StoryLocked"
							})
							return
						end
						if v13.Locked then
							v19.Notify({
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
					v2.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 2875 | Upvalues: v16 (ref), setSelectedStoryMission (ref), v42 (copy), v122 (copy), v15 (copy) ]]
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
	end,
	Index = function(p1, p2) --[[ Index | Line: 2891 | Upvalues: v8 (copy), v24 (copy), v4 (copy), v26 (copy) ]]
		v8.new(p2, {
			Click = function() --[[ Click | Line: 2893 | Upvalues: v24 (ref), v4 (ref), p1 (copy) ]]
				if v24.CanDoActionInTutorial("JournalTabs") then
					v4.OpenTab(p1)
				end
			end
		})
		v26:_initTabButton(p2)
	end
}
local v50 = false
function t.OnOpen(p1, p2, p3) --[[ OnOpen | Line: 2907 | Upvalues: v4 (copy), ContainerFrame (copy), v34 (copy), v39 (copy), setSelectedSpeciesMission (copy), v14 (copy), setSelectedSpeciesUnlockMission (copy), v50 (ref), setSelectedActivityUnlock (copy), v46 (ref), v45 (copy) ]]
	local v1 = if p2 then ContainerFrame.Menu.TabFrames:FindFirstChild(p2) or ContainerFrame.Menu.TabFrames.Horses else v4.getOpenedTab(ContainerFrame) or ContainerFrame.Menu.TabFrames.Horses
	if v1 == ContainerFrame.Menu.TabFrames.Horses then
		if p3 and v34.Missions[p3] then
			local v42 = v39.PlayerData.Missions.SpeciesMissions[p3]
			if v42 and v42.Started.Value then
				setSelectedSpeciesMission(v14.GetTimedSpeciesMission(v39, p3))
			else
				setSelectedSpeciesUnlockMission(v34.Missions[p3])
			end
		elseif v39.PlayerData.Missions.SpeciesUnlocks.Horse.Completed.Value then
			if v39:HasUnlockedSpecies("Pony") then
				setSelectedActivityUnlock()
				setSelectedSpeciesUnlockMission()
			else
				setSelectedSpeciesUnlockMission(v34.Missions.Pony)
			end
		else
			if v50 then
				setSelectedSpeciesUnlockMission(v34.Missions.Horse)
			end
			v50 = true
		end
	end
	if v1 == "Horses" then
		v46 = "Quests"
		v45:FireServer("AccessedMajorInterface", "Quests")
	elseif v1 == "Story" then
		v46 = "Storybook"
		v45:FireServer("AccessedMajorInterface", "Storybook")
	elseif v1 == "Missions" then
		v46 = "Missions"
		v45:FireServer("AccessedMajorInterface", "Missions")
	end
	v4.OpenTab(v1)
end
function t.OnClose(p1) --[[ OnClose | Line: 2949 | Upvalues: v49 (copy), v2 (copy), ContainerFrame (copy), t (copy) ]]
	v49:set("HomePage")
	if v2.MainFrameOpen ~= ContainerFrame then
		return
	end
	t.Close(true)
end
function t.ClaimMission(p1, ...) --[[ ClaimMission | Line: 2956 | Upvalues: claimSpeciesUnlockMissionReward (copy), claimSpeciesMissionReward (copy), claimStoryMissionReward (copy), claimOneTimeMissionReward (copy), v14 (copy), v39 (copy), v15 (copy), claimTutorialMissionReward (copy), claimWorldMissionReward (copy) ]]
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
	if p1 == "StreakMissions" then
		local v1, v2 = ...
		local v3 = v14.CanClaimStreakMission(v39, v1, v2)
		if v3 == true then
			v14.ClaimStreakMission(v1, v2)
		else
			v15.NotifyIssue(v3)
		end
	else
		if p1 == "LimitedStockUnlocks" then
			return
		end
		if p1 == "Tutorial" then
			claimTutorialMissionReward(...)
			return
		end
		if p1 ~= "WorldMissions" then
			return
		end
		claimWorldMissionReward(...)
	end
end
function t.OpenAtMission(p1) --[[ OpenAtMission | Line: 2977 | Upvalues: t (copy) ]]
	t.Open(nil, p1)
end
function t.Open(...) --[[ Open | Line: 2981 | Upvalues: v39 (copy), v2 (copy), ContainerFrame (copy) ]]
	v39._openedJournal = true
	if not v2.IsFrameOpen(ContainerFrame) then
		v2.OpenMainFrame(ContainerFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	end
end
function t.Close(p1) --[[ Close | Line: 2995 | Upvalues: v2 (copy), ContainerFrame (copy), v46 (ref), v45 (copy), setSelectedSpeciesUnlockMission (copy), setSelectedActivityUnlock (copy), setSelectedSpeciesMission (copy) ]]
	if v2.IsFrameOpen(ContainerFrame) and v46 then
		v45:FireServer("ClosedMajorInterface", v46)
	end
	v2.CloseFrame(ContainerFrame, {})
	v2.OpenHUD({
		DoNotCloseMainFrame = p1
	})
	setSelectedSpeciesUnlockMission()
	setSelectedActivityUnlock()
	setSelectedSpeciesMission()
end
function t.Init(p1) --[[ Init | Line: 3014 | Upvalues: v2 (copy), ContainerFrame (copy), Selected (copy), v4 (copy), t2 (copy), v33 (copy), v24 (copy), v32 (copy), v8 (copy), Sonar (copy), t (copy), v1 (copy), setSelectedSpeciesUnlockMission (copy), setSelectedActivityUnlock (copy), setSelectedSpeciesMission (copy), setSelectedSpeciesUnlockMissionTest (copy) ]]
	v2.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = function() --[[ SelectOnOpen | Line: 3021 | Upvalues: Selected (ref), ContainerFrame (ref) ]]
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
				if t2[v.Name] then
					t2[v.Name](v12, v)
				end
				local function setSize() --[[ setSize | Line: 3046 | Upvalues: v (copy), v4 (ref), v12 (copy) ]]
					v.UIScale.Scale = if v4.IsTabOpen(v12) then 1.2 else 1
				end
				v4.AddStateCallback(v12, "OnOpen", setSize)
				v4.AddStateCallback(v12, "OnClose", setSize)
			end
			local InactiveFrame = v:FindFirstChild("InactiveFrame", true)
			v33.GameStateChangedSignal:Connect(function() --[[ Line: 3054 | Upvalues: InactiveFrame (copy), v24 (ref) ]]
				if not InactiveFrame then
					return
				end
				InactiveFrame.Visible = not v24.GetGameState("JournalTabs")
			end)
		end
	end
	ContainerFrame.TabButtons.Map.Visible = not v32.IsMarketWorld()
	v8.new(ContainerFrame.TabButtons.Map, {
		Click = function() --[[ Click | Line: 3063 | Upvalues: v24 (ref), Sonar (ref), t (ref) ]]
			if v24.CanDoActionInTutorial("JournalTabs") then
				Sonar("MapGui").Open(function() --[[ Line: 3068 | Upvalues: t (ref) ]]
					t.Open()
				end)
			end
		end
	})
	v2.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 3074 | Upvalues: t (ref) ]]
		t:OnOpen(...)
	end)
	v2.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 3077 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
	v1.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 3082 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v1.new(ContainerFrame.Menu.HelpButton, {
		Click = function() --[[ Click | Line: 3087 | Upvalues: Sonar (ref) ]]
			Sonar("TutorialService").PromptPopupInfo("Journal")
		end
	})
	setSelectedSpeciesUnlockMission()
	setSelectedActivityUnlock()
	setSelectedSpeciesMission()
	setSelectedSpeciesUnlockMissionTest()
end
t:Init()
return t