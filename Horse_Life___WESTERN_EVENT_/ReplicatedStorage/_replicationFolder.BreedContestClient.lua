-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
Sonar("BreedContestHorseSpawn")
Sonar("BreedContestLeaderboard")
Sonar("InfoOverlayGui")
local v1 = Sonar("BreedContestService")
local v2 = Sonar("InteractZone")
local v3 = Sonar("TimeUtils")
local v4 = Sonar("FormatNumber")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("IssueResponseClient")
local v7 = Sonar("PromptClient")
local v8 = Sonar("Maid")
local v9 = Sonar("GridSort")
local v10 = Sonar("AnimalGridButton")
local v11 = Sonar("Button")
local v12 = Sonar("GuiManager")
local v13 = Sonar("UINavigator")
local v14 = Sonar("ButtonTest")
local v15 = Sonar("AnimalInfoFrame")
local v16 = Sonar("InfoOverlayGui")
local v17 = Sonar("ItemDataService")
local v18 = Sonar("ItemGridButton")
local v19 = Sonar("ToolTipClient")
local v20 = Sonar("AnimalDataService")
local v21 = Sonar("TutorialService")
local v22 = Sonar("PlaceTypeService")
local v23 = Sonar("PlayerWrapper").GetClient()
local LocalPlayer = game.Players.LocalPlayer
local t = {}
repeat
	task.wait()
until v23.BreedContestData
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("BreedContestGui").ContainerFrame
local Horses = ContainerFrame.Menu.Content.Horses
local RefreshTimer = v1.RefreshTimer
local Score = v23.PlayerData.BreedContest.Score
local BillboardGui = workspace:WaitForChild("Interactions"):WaitForChild("BreedContest"):WaitForChild("InteractZone"):WaitForChild("BillboardGui")
local v24 = v23:GetItemFolder("Animals")
local v25 = v8.new()
local t2 = {}
local v26 = v8.new()
local v27 = nil
local t3 = {}
local v28 = v9.new({
	Priority = {
		{
			Priority = -1,
			Run = function(p1) --[[ Run | Line: 66 ]]
				return p1:HasLayoutUnableReason()
			end,
			Changed = function(p1) --[[ Changed | Line: 69 ]]
				return p1.UnableChangedSignal
			end
		}
	},
	EmptyString = {
		Text = "You do not have any horses!",
		Label = Horses.EmptyLabel
	},
	Sorts = {
		Score = {
			DisplayName = "Score",
			Run = function(p1, p2, p3) --[[ Run | Line: 83 | Upvalues: v1 (copy) ]]
				return v1.CompareSlots(p1.SlotValue) > v1.CompareSlots(p2.SlotValue)
			end,
			Changed = function(p1) --[[ Changed | Line: 88 | Upvalues: v1 (copy) ]]
				return { v1.CurrentSlotChangedSignal, p1.Frame:FindFirstChild("Score", true).ScoreLabel:GetPropertyChangedSignal("Text") }
			end
		}
	},
	Search = {
		TextBox = ContainerFrame.Menu.Content.SearchBar.Content.TextBox,
		Run = function(p1, p2) --[[ Run | Line: 99 ]]
			if #p1 <= 0 then
				return true
			end
			local v1 = p1:lower()
			local v2 = p2.NameLabel.Text:lower()
			local v3 = if p2.SlotValue and p2.SlotValue.Species then p2.SlotValue.Species.Value:lower() or "" else ""
			return string.find(v2, v1) or string.find(v3, v1)
		end
	}
})
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 111 | Upvalues: ContainerFrame (copy) ]]
	if p1 then
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = true
	else
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = false
	end
	ContainerFrame.Menu.Content.SelectFrame.Buttons.AllRewards.Visible = true
	ContainerFrame.Menu.Content.SelectFrame.AllRewards.Visible = false
	ContainerFrame.Menu.Content.SelectFrame.Buttons.ReturnRewards.Visible = false
end
local t4 = {
	Submit = function() --[[ Submit | Line: 129 | Upvalues: v1 (copy), v23 (copy), v27 (ref), v6 (copy), v7 (copy), v4 (copy), v5 (copy) ]]
		local v12 = v1.CanSubmitSlot(v23, v27)
		if v12 == true then
			v7.Prompt({
				Type = "SubmitBreedContest",
				Setup = function(p1) --[[ Setup | Line: 138 | Upvalues: v4 (ref), v1 (ref) ]]
					p1.Content.Price.TextLabel.Text = v4.splice(v1.GetPriceToSubmit())
				end,
				Run = function() --[[ Run | Line: 141 | Upvalues: v1 (ref), v23 (ref), v27 (ref), v6 (ref), v5 (ref) ]]
					local v12 = v1.CanSubmitSlot(v23, v27)
					if v12 == true then
						return v5.GetRemoteFunction("SubmitBreedContestSlot"):InvokeServer(v27.Name)
					else
						v6.NotifyIssue(v12)
					end
				end,
				Cancel = function() --[[ Cancel | Line: 149 ]]
					return true
				end
			})
		else
			v6.NotifyIssue(v12)
		end
	end,
	Inspect = function() --[[ Inspect | Line: 154 | Upvalues: v16 (copy), v1 (copy) ]]
		v16.Open({
			HeadViewport = true,
			SpeciesAsName = true,
			SlotValue = v1.GetSlot(),
			Disabled = {
				Pedigree = true,
				InfoPopup = true,
				Favorite = true,
				Birthday = true,
				Mutations = true,
				Skills = true,
				Age = true,
				Origins = true,
				Activity = true
			}
		})
	end,
	AllRewards = function() --[[ AllRewards | Line: 179 | Upvalues: ContainerFrame (copy) ]]
		ContainerFrame.Menu.Content.SelectFrame.AllRewards.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.Buttons.ReturnRewards.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.Buttons.AllRewards.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = false
	end,
	ReturnRewards = function() --[[ ReturnRewards | Line: 188 | Upvalues: setSelectedFrame (copy), v27 (ref) ]]
		setSelectedFrame(v27)
	end
}
local function selectAnimal(p1) --[[ selectAnimal | Line: 193 | Upvalues: t2 (ref), v27 (ref), v26 (copy), v15 (copy), LocalPlayer (copy), ContainerFrame (copy), v1 (copy), v20 (copy) ]]
	local v12 = t2[v27]
	if v12 then
		v12:Deselect()
	end
	v26:DoCleaning()
	v27 = p1
	if not p1 then
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.Buttons.AllRewards.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.AllRewards.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.Buttons.ReturnRewards.Visible = false
		return
	end
	local v2 = t2[p1]
	if v2 then
		v2:Select()
	end
	v26:GiveTask(v15.new({
		HeadViewport = true,
		SlotValue = p1,
		Owner = LocalPlayer,
		Frame = ContainerFrame.Menu.Content.SelectFrame.HorseInfo
	}))
	local function setScoreLabel() --[[ setScoreLabel | Line: 215 | Upvalues: ContainerFrame (ref), v1 (ref), p1 (copy) ]]
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Profile.ScoreLabel.Text = v1.GetAccuracy(v1.CompareSlots(p1))
	end
	v26:GiveTask(v1.CurrentSlotChangedSignal:Connect(setScoreLabel))
	v26:GiveTask(v2.SlotAttributesChangedSignal:Connect(setScoreLabel))
	ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Profile.ScoreLabel.Text = v1.GetAccuracy(v1.CompareSlots(p1))
	for k, v in pairs(v1.GetAttributeCheckList(p1)) do
		local v3 = ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Checklist.Content.Default:Clone()
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Checklist.Content.Default.Visible = false
		local function setCompleted() --[[ setCompleted | Line: 227 | Upvalues: v (copy), v3 (copy) ]]
			local v1 = v.Check()
			v3.CorrectLabel.Visible = v1
			v3.IncorrectLabel.Visible = not v1
			v3.BackgroundColor3 = v1 and Color3.fromRGB(110, 255, 128) or Color3.fromRGB(238, 94, 115)
		end
		v26:GiveTask(v2.SlotAttributesChangedSignal:Connect(setCompleted))
		setCompleted()
		v3.Title.Text = v20.FormatAttributeName(v.Name, v.Type)
		v3.Name = v.Name
		v3.Visible = true
		v3.Parent = ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Checklist.Content
		v26:GiveTask(v3)
	end
	ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = true
	ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = false
	ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = true
	ContainerFrame.Menu.Content.SelectFrame.Buttons.AllRewards.Visible = true
	ContainerFrame.Menu.Content.SelectFrame.AllRewards.Visible = false
	ContainerFrame.Menu.Content.SelectFrame.Buttons.ReturnRewards.Visible = false
end
local function createAnimal(p1, p2) --[[ createAnimal | Line: 252 | Upvalues: v10 (copy), LocalPlayer (copy), Horses (copy), v1 (copy), v23 (copy), v11 (copy), v27 (ref), selectAnimal (copy), t2 (ref), v28 (copy) ]]
	local v12, v2, v3
	if not p2 then
		task.wait()
	end
	v12 = v10.new({
		IgnoreBackgroundColor = true,
		SlotValue = p1,
		Owner = LocalPlayer,
		ParentFrame = Horses,
		UnableCheck = {
			ListenForValueAttributes = true,
			Changed = { v1.CurrentSlotChangedSignal, v1.RefreshTimer.SeedChanged },
			Get = function() --[[ Get | Line: 268 | Upvalues: v1 (ref), v23 (ref), p1 (copy) ]]
				if not v1.CheckSubmitCondition(v23, p1, "CorrectSpecies") then
					return "NotCorrectSpecies"
				end
				if v1.CheckSubmitCondition(v23, p1, "RecievedInWeek") then
					return true
				else
					return "NotReceivedInWeek"
				end
			end,
			Reasons = {
				NotCorrectSpecies = {
					Text = "Incorrect Species"
				},
				NotReceivedInWeek = {
					Text = "",
					IgnoreLayout = true,
					Transparency = 0.5
				}
			}
		}
	})
	v2 = v12.Frame:FindFirstChild("Score", true)
	v3 = function() --[[ setScoreLabel | Line: 291 | Upvalues: v2 (copy), v1 (ref), p1 (copy) ]]
		v2.ScoreLabel.Text = v1.GetAccuracy(v1.CompareSlots(p1))
		v2.Visible = true
	end
	v12:GiveTask(v1.CurrentSlotChangedSignal:Connect(v3))
	v12:GiveTask(v12.SlotAttributesChangedSignal:Connect(v3))
	v2.ScoreLabel.Text = v1.GetAccuracy(v1.CompareSlots(p1))
	v2.Visible = true
	v12:GiveTask(v11.new(v12.Frame, {
		Click = function() --[[ Click | Line: 305 | Upvalues: v27 (ref), p1 (copy), selectAnimal (ref) ]]
			if v27 == p1 then
				selectAnimal()
			else
				selectAnimal(p1)
			end
		end
	}))
	t2[p1] = v12
	v28:Add(v12, p2)
end
local function removeAnimal(p1) --[[ removeAnimal | Line: 320 | Upvalues: t2 (ref), v27 (ref), v26 (copy), ContainerFrame (copy), v28 (copy) ]]
	if not t2[p1] then
		return
	end
	if v27 == p1 then
		local v1 = t2[v27]
		if v1 then
			v1:Deselect()
		end
		v26:DoCleaning()
		v27 = nil
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.Buttons.AllRewards.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.AllRewards.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.Buttons.ReturnRewards.Visible = false
	end
	v28:Remove(t2[p1])
	t2[p1]:Destroy()
	t2[p1] = nil
end
function t.OnClose(p1) --[[ OnClose | Line: 333 | Upvalues: v12 (copy), ContainerFrame (copy), t (copy) ]]
	if v12.MainFrameOpen ~= ContainerFrame then
		return
	end
	t.Close(true)
end
function t.Cleanup(p1) --[[ Cleanup | Line: 339 | Upvalues: t2 (ref), v27 (ref), v26 (copy), ContainerFrame (copy), v28 (copy), v25 (copy), v12 (copy) ]]
	local v1 = t2[v27]
	if v1 then
		v1:Deselect()
	end
	v26:DoCleaning()
	v27 = nil
	ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = false
	ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = true
	ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = false
	ContainerFrame.Menu.Content.SelectFrame.Buttons.AllRewards.Visible = true
	ContainerFrame.Menu.Content.SelectFrame.AllRewards.Visible = false
	ContainerFrame.Menu.Content.SelectFrame.Buttons.ReturnRewards.Visible = false
	for k, v in pairs(t2) do
		if t2[k] then
			if v27 == k then
				local v2 = t2[v27]
				if v2 then
					v2:Deselect()
				end
				v26:DoCleaning()
				v27 = nil
				ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = false
				ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = true
				ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = false
				ContainerFrame.Menu.Content.SelectFrame.Buttons.AllRewards.Visible = true
				ContainerFrame.Menu.Content.SelectFrame.AllRewards.Visible = false
				ContainerFrame.Menu.Content.SelectFrame.Buttons.ReturnRewards.Visible = false
			end
			v28:Remove(t2[k])
			t2[k]:Destroy()
			t2[k] = nil
		end
	end
	t2 = {}
	v25:DoCleaning()
	v12.CleanContents(ContainerFrame)
end
function t.Open(...) --[[ Open | Line: 351 | Upvalues: v12 (copy), ContainerFrame (copy), t (copy) ]]
	if v12.IsFrameOpen(ContainerFrame) then
		t.Close()
	else
		v12.OpenMainFrame(ContainerFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	end
end
function t.Close(p1) --[[ Close | Line: 363 | Upvalues: v12 (copy), ContainerFrame (copy) ]]
	v12.CloseFrame(ContainerFrame, {})
	v12.OpenHUD({
		DoNotCloseMainFrame = p1
	})
end
function t.OnOpen(p1, p2) --[[ OnOpen | Line: 372 | Upvalues: v12 (copy), ContainerFrame (copy), t3 (copy), v14 (copy), t4 (copy), selectAnimal (copy), v1 (copy), v3 (copy), RefreshTimer (copy), ReplicatedStorage (copy), v8 (copy), Score (copy), v17 (copy), v18 (copy), v11 (copy), v19 (copy), v25 (copy), v24 (copy), removeAnimal (copy), createAnimal (copy), v28 (copy) ]]
	local v13 = v12.getFrameFromInstance(ContainerFrame)
	if not v13.Opened then
		v13.Opened = true
		for k, v in pairs(ContainerFrame.Menu.Content.SelectFrame.Buttons:GetChildren()) do
			if v:IsA("ImageButton") then
				if not t3[v.Name] then
					t3[v.Name] = {}
				end
				table.insert(t3[v.Name], v)
				v14.new(v, {
					Click = t4[v.Name]
				})
			end
		end
		v14.new(ContainerFrame.Menu.Content.SelectFrame.HorseInfo.BackButton, {
			Click = function() --[[ Click | Line: 391 | Upvalues: selectAnimal (ref) ]]
				selectAnimal()
			end
		})
		local function setTimerLabel() --[[ setTimerLabel | Line: 396 | Upvalues: v12 (ref), ContainerFrame (ref), v1 (ref), v3 (ref), RefreshTimer (ref) ]]
			if not v12.IsFrameOpen(ContainerFrame) then
				return
			end
			ContainerFrame.Menu.Countdown.Visible = v1.HasEnded()
			ContainerFrame.Menu.Countdown.TimerLabel.Text = v3.FormatString(RefreshTimer:GetTime())
			ContainerFrame.Menu.Content.Timer.Visible = not v1.HasEnded()
			ContainerFrame.Menu.Content.Timer.TextLabel.Text = "Ends in " .. v3.FormatString(v1.GetTimeTillEnd())
		end
		v12.AddStateCallback(ContainerFrame, "OnOpen", setTimerLabel)
		RefreshTimer.TimeChanged:Connect(setTimerLabel)
		RefreshTimer.SeedChanged:Connect(setTimerLabel)
		setTimerLabel()
		ReplicatedStorage.Storage.BreedContest.Ended:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 410 | Upvalues: setTimerLabel (copy), selectAnimal (ref) ]]
			setTimerLabel()
			selectAnimal()
		end)
		local v32 = ContainerFrame.Menu.Content.SelectFrame.RankInfo.RankFrame.Content
		local v4 = nil
		local v5 = v8.new()
		local function setScoreAndRank() --[[ setScoreAndRank | Line: 418 | Upvalues: v32 (copy), v1 (ref), Score (ref), v4 (ref), v5 (copy), v17 (ref), v18 (ref), v11 (ref), v19 (ref) ]]
			v32.ScoreLabel.Text = v1.GetAccuracy(Score.Value)
			local v12 = v1.GetRewardTier(Score.Value) or v1.RankTiers[#v1.RankTiers]
			local v2 = v1.RankTiers[v12.Index - 1]
			local v3 = v12 ~= v4
			v4 = v12
			if v2 then
				v32.NextScoreLabel.Text = type(v2.Score) == "number" and v2.Score .. "%" or v1.FormatPercentage(v2.Score.Min) .. " - " .. v1.FormatPercentage(v2.Score.Max)
			else
				v32.NextScoreLabel.Text = "MAX TIER"
			end
			if v3 then
				v5:DoCleaning()
				for k, v in pairs(v12.Rewards) do
					if v17.GetByName(v.Name) then
						local v52 = v18.new({
							ForceVisible = true,
							Item = v17.GetByName(v.Name),
							ParentFrame = v32.Rewards,
							GetAmount = function() --[[ GetAmount | Line: 443 | Upvalues: v (copy) ]]
								return v.Amount
							end
						})
						local ChanceLabel = v52.Frame:FindFirstChild("ChanceLabel", true)
						if v.P then
							ChanceLabel.Text = v.P .. "%"
							ChanceLabel.Visible = true
						else
							ChanceLabel.Visible = false
						end
						v52:GiveTask(v11.new(v52.Frame, {
							Click = function() --[[ Click | Line: 457 | Upvalues: v19 (ref), v52 (copy), v17 (ref), v (copy) ]]
								v19:CreateToolTip({
									Type = "ItemDescription",
									Offset = Vector2.new(0.65, 0.5),
									GuiObject = v52.Frame,
									Get = function() --[[ Get | Line: 462 | Upvalues: v17 (ref), v (ref) ]]
										return v17.GetByName(v.Name)
									end
								})
							end
						}))
						v5:GiveTask(v52)
					end
				end
			end
			v32.Rewards.Visible = Score.Value > 0
			v32.EmptyLabel.Visible = Score.Value <= 0
			v32.NextSubLabel.Visible = Score.Value > 0
			v32.NextScoreLabel.Visible = Score.Value > 0
		end
		Score:GetPropertyChangedSignal("Value"):Connect(setScoreAndRank)
		setScoreAndRank()
		local AllRewards = ContainerFrame.Menu.Content.SelectFrame.AllRewards
		for k, v in pairs(v1.RankTiers) do
			local v6 = AllRewards.Content.Default:Clone()
			AllRewards.Content.Default.Visible = false
			v6.Content.ScoreLabel.Text = type(v.Score) == "number" and v.Score .. "%" or v1.FormatPercentage(v.Score.Min) .. " - " .. v1.FormatPercentage(v.Score.Max)
			v6.Content.TierLabel.Text = "#" .. k
			for k2, v2 in pairs(v.Rewards) do
				if v17.GetByName(v2.Name) then
					local v82 = v18.new({
						ForceVisible = true,
						Item = v17.GetByName(v2.Name),
						ParentFrame = v6.Content.Rewards,
						GetAmount = function() --[[ GetAmount | Line: 499 | Upvalues: v2 (copy) ]]
							return v2.Amount
						end
					})
					local ChanceLabel = v82.Frame:FindFirstChild("ChanceLabel", true)
					if v2.P then
						ChanceLabel.Text = v2.P .. "%"
						ChanceLabel.Visible = true
					else
						ChanceLabel.Visible = false
					end
					v82:GiveTask(v11.new(v82.Frame, {
						Click = function() --[[ Click | Line: 513 | Upvalues: v19 (ref), v82 (copy), v17 (ref), v2 (copy) ]]
							v19:CreateToolTip({
								Type = "ItemDescription",
								Offset = Vector2.new(0.65, 0.5),
								GuiObject = v82.Frame,
								Get = function() --[[ Get | Line: 518 | Upvalues: v17 (ref), v2 (ref) ]]
									return v17.GetByName(v2.Name)
								end
							})
						end
					}))
				end
			end
			v6.Name = v.Index
			v6.Visible = true
			v6.Parent = AllRewards.Content
		end
	end
	if v13.ContentsLoaded then
		return
	end
	v13.ContentsLoaded = true
	v25:GiveTask(v24.ChildRemoved:Connect(removeAnimal))
	v25:GiveTask(v24.ChildAdded:Connect(createAnimal))
	for k, v in pairs(v24:GetChildren()) do
		createAnimal(v, true)
	end
	v28:Sort("Score")
end
function t.Init(p1) --[[ Init | Line: 545 | Upvalues: v12 (copy), ContainerFrame (copy), Horses (copy), t (copy), v13 (copy), v14 (copy), Sonar (copy), selectAnimal (copy), v21 (copy), v23 (copy), v7 (copy), v1 (copy), v4 (copy), v2 (copy), v22 (copy), BillboardGui (copy), v3 (copy), RefreshTimer (copy) ]]
	v12.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = Horses.Content
	})
	v12.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 555 | Upvalues: t (ref) ]]
		t:OnOpen(...)
	end)
	v12.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 558 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
	v12.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 561 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v13.SetUnselectableWhenSelected(Horses.Content)
	v14.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 567 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v14.new(ContainerFrame.Menu.HelpButton, {
		Click = function() --[[ Click | Line: 572 | Upvalues: Sonar (ref) ]]
			Sonar("TutorialService").PromptPopupInfo("BreedContest")
		end
	})
	selectAnimal()
	task.spawn(function() --[[ Line: 578 | Upvalues: Sonar (ref), v21 (ref), v23 (ref), v7 (ref), v1 (ref), v4 (ref), t (ref) ]]
		Sonar("InteractMenu").new(workspace:WaitForChild("Interactions"):WaitForChild("BreedContest"):WaitForChild("InteractZone"):WaitForChild("InteractPart"), {
			ShowHintLabel = true,
			Hint = "Open",
			Run = function() --[[ Run | Line: 581 | Upvalues: v21 (ref), v23 (ref), v7 (ref), Sonar (ref), v1 (ref), v4 (ref), t (ref) ]]
				if not v21.CanDoActionInTutorial("InteractZones") then
					return
				end
				if not v23.PlayerData.Missions.SpeciesUnlocks.Kelpie.Completed.Value then
					v7.Prompt({
						Type = "LockedJournal",
						Setup = function(p1) --[[ Setup | Line: 589 ]]
							p1.Content.Description.Text = string.format("To unlock the Cosmetic Contest you must complete the %s Quests!", "Kelpie")
						end,
						Run = function() --[[ Run | Line: 592 | Upvalues: Sonar (ref) ]]
							Sonar("JournalGui").Open("Horses")
							return true
						end,
						Cancel = function() --[[ Cancel | Line: 596 ]]
							return true
						end
					})
					return
				end
				if v23.BreedContestData.FoalsBorn.Value < v1.FoalsBornToCompete then
					v7.Prompt({
						Type = "FeatureLocked",
						Setup = function(p1, p2) --[[ Setup | Line: 606 | Upvalues: v1 (ref), Sonar (ref), v4 (ref), v23 (ref) ]]
							p1.Content.ProgressDescription.Description.Text = string.format("Foal %s horses to unlock the Cosmetic Contest for this week!", v1.FoalsBornToCompete)
							p1.Content.Description.Visible = false
							p1.Content.ProgressDescription.Visible = true
							p2.Maid:GiveTask(Sonar("StatBar").new({
								TweenAmount = true,
								Clipped = false,
								Frame = p1.Content.ProgressDescription.ProgressBar.Fill,
								AmountLabel = p1.Content.ProgressDescription.ProgressBar.Progress,
								GetText = function(p1, p2) --[[ GetText | Line: 618 | Upvalues: v4 (ref) ]]
									return v4.suffix(p1) .. "/" .. v4.suffix(p2)
								end,
								Get = function() --[[ Get | Line: 622 | Upvalues: v23 (ref) ]]
									return v23.BreedContestData.FoalsBorn.Value
								end,
								GetMax = function() --[[ GetMax | Line: 625 | Upvalues: v1 (ref) ]]
									return v1.FoalsBornToCompete
								end,
								Changed = { v23.BreedContestData.FoalsBorn:GetPropertyChangedSignal("Value") }
							}))
						end,
						Run = function() --[[ Run | Line: 633 ]]
							return true
						end
					})
				else
					t.Open()
				end
			end,
			GetRange = function() --[[ GetRange | Line: 642 ]]
				return 25
			end
		})
	end)
	local function setTimerLabel() --[[ setTimerLabel | Line: 649 | Upvalues: v2 (ref), v22 (ref), BillboardGui (ref), v1 (ref), v3 (ref), RefreshTimer (ref) ]]
		if not (v2.IsInZone("Town") or v22.IsMarketWorld()) then
			return
		end
		BillboardGui.TimerLabel.Text = v1.HasEnded() and "Starts in " .. v3.FormatString(RefreshTimer:GetTime()) or "Ends in " .. v3.FormatString(v1.GetTimeTillEnd())
	end
	RefreshTimer.TimeChanged:Connect(setTimerLabel)
	RefreshTimer.SeedChanged:Connect(setTimerLabel)
	setTimerLabel()
end
t:Init()
return t