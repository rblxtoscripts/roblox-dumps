-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("GuiManager")
local v3 = Sonar("Maid")
local v4 = Sonar("AnimalGridButton")
local v5 = Sonar("AnimalDataService")
local v6 = Sonar("GridSort")
local v7 = Sonar("HorseShrineService")
local v8 = Sonar("InteractZone")
local v9 = Sonar("TimeUtils")
local v10 = Sonar("RemoteUtils")
local v11 = Sonar("StatBar")
local v12 = Sonar("ItemDataService")
local v13 = Sonar("ItemGridButton")
local v14 = Sonar("TutorialService")
local v15 = Sonar("NotificationsClient")
local v16 = Sonar("ColorCorrectionUtils")
local v17 = Sonar("DisplayAnimalClient")
local v18 = Sonar("PromptClient")
local v19 = Sonar("PlaceTypeService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v20 = Sonar("PlayerWrapper").GetClient()
local v21 = Sonar("Constants")
local HorseShrineMilestones = v21.HorseShrineMilestones
local HorseShrine = v21.HorseShrine
local BillboardGui = workspace:WaitForChild("Interactions"):WaitForChild("HorseShrine"):WaitForChild("BillboardGui")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local ContainerFrame = PlayerGui:WaitForChild("HorseShrineGui"):WaitForChild("ContainerFrame")
local Horses = ContainerFrame.Menu.Content.Horses
local v22 = v10.GetRemoteFunction("ShrineTurninRemote")
local v23 = v20:GetItemFolder("Animals")
local RefreshTimer = v7.RefreshTimer
local v24 = v3.new()
local v25 = v3.new()
local v26 = nil
local v27 = nil
local t2 = {}
local t3 = {}
local v28 = nil
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 58 | Upvalues: ContainerFrame (copy) ]]
	if p1 then
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = true
	else
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = false
	end
end
local v29 = v6.new({
	Priority = {
		{
			Priority = -1,
			Run = function(p1) --[[ Run | Line: 76 ]]
				return p1:HasLayoutUnableReason()
			end,
			Changed = function(p1) --[[ Changed | Line: 79 ]]
				return p1.UnableChangedSignal
			end
		}
	},
	EmptyString = {
		Text = "You do not have any horses!",
		Label = Horses.EmptyLabel
	},
	Sorts = {
		Alphabet = {
			DisplayName = "Alphabetical",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 94 ]]
				local v1 = p1.NameLabel.Text:lower()
				local v2 = p2.NameLabel.Text:lower()
				if p3 then
					return v1 < v2
				else
					return v2 < v1
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 105 ]]
				return p1.NameLabel:GetPropertyChangedSignal("Text")
			end
		},
		Points = {
			DisplayName = "Points",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 113 ]]
				local Score = p1.Frame:FindFirstChild("Score", true)
				local Score_2 = p2.Frame:FindFirstChild("Score", true)
				local v1 = tonumber(string.match(Score.ScoreLabel.Text, "(%d+)"))
				return tonumber(string.match(Score_2.ScoreLabel.Text, "(%d+)")) < v1
			end,
			Changed = function(p1) --[[ Changed | Line: 122 ]]
				return p1.Frame:FindFirstChild("Score", true).ScoreLabel:GetPropertyChangedSignal("Text")
			end
		}
	},
	Search = {
		TextBox = ContainerFrame.Menu.Content.SearchBar.Content.TextBox,
		Run = function(p1, p2) --[[ Run | Line: 131 ]]
			return if #p1 <= 0 then true else string.find(p2.NameLabel.Text:lower(), p1:lower())
		end
	}
})
local t4 = {
	Submit = function() --[[ Submit | Line: 138 | Upvalues: v18 (copy), v22 (copy), v26 (ref), v15 (copy), v16 (copy), ReplicatedStorage (copy), v17 (copy), v20 (copy) ]]
		v18.Prompt({
			Type = "ConfirmShrine",
			Run = function() --[[ Run | Line: 142 | Upvalues: v22 (ref), v26 (ref), v15 (ref), v16 (ref), ReplicatedStorage (ref), v17 (ref), v20 (ref) ]]
				local v1, v2 = v22:InvokeServer(v26.Name)
				if v1 == true then
					v15.Notify({
						Message = "Offering accepted! The Shrine rewards your devotion.",
						Preset = "Green"
					})
					v16:Tween()
					ReplicatedStorage.Storage.SFX.JumpSuccess:Play()
					if not v2 then
						return true
					end
					v17:DisplaySlot({
						Type = "Claimed",
						AllowNaming = true,
						MobileClickBackgroundToClose = true,
						Slot = v20:GetItemFolder("Animals"):WaitForChild(v2)
					})
				else
					ReplicatedStorage.Storage.SFX.Error:Play()
				end
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 169 ]]
				return true
			end
		})
	end
}
local function DisplayHorseInViewport(p1, p2) --[[ DisplayHorseInViewport | Line: 183 | Upvalues: v28 (ref), v3 (copy), v4 (copy), LocalPlayer (copy) ]]
	local v1
	if not v28 then
		v1 = v3.new()
		v28 = v1
		v1:GiveTask((v4.new({
			DoNotClone = true,
			SlotValue = p1,
			Owner = LocalPlayer,
			ViewportFrame = p2,
			GuiObject = p2
		})))
		return v1
	end
	v28:DoCleaning()
	v1 = v3.new()
	v28 = v1
	v1:GiveTask((v4.new({
		DoNotClone = true,
		SlotValue = p1,
		Owner = LocalPlayer,
		ViewportFrame = p2,
		GuiObject = p2
	})))
	return v1
end
local function selectAnimal(p1) --[[ selectAnimal | Line: 203 | Upvalues: t2 (copy), v26 (ref), v25 (copy), ContainerFrame (copy), DisplayHorseInViewport (copy), v1 (copy), v7 (copy), v20 (copy) ]]
	local v12 = t2[v26]
	if v12 then
		v12:Deselect()
	end
	v25:DoCleaning()
	v26 = p1
	if not p1 then
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = false
		return
	end
	local Default = ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Checklist.Content.Default
	v25:GiveTask((DisplayHorseInViewport(p1, ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Profile.Viewport)))
	v25:GiveTask(v1.new(ContainerFrame.Menu.Content.SelectFrame.HorseInfo.BackButton, {
		Click = function() --[[ Click | Line: 218 | Upvalues: ContainerFrame (ref) ]]
			ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = false
			ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = true
			ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = false
		end
	}))
	local v2, v3 = v7.GetPointsWorth(v20, p1)
	ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Profile.ScoreLabel.Text = v2 .. " Points"
	ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Profile.NameLabel.Text = p1.CustomName.Value
	local v4 = v25:GiveTask(Default:Clone())
	v4.Title.Text = v3.BaseText
	v4.Percent.Text = v3.BasePoints .. " Points"
	v4.Visible = true
	v4.Parent = ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Checklist.Content
	local Species = v3.Species
	if Species then
		local v5 = v25:GiveTask(Default:Clone())
		v5.Title.Text = "Species Bonus"
		v5.Percent.Text = "+" .. math.floor(Species * 100 + 0.5) .. "%"
		v5.Visible = true
		v5.Parent = ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Checklist.Content
	end
	local v6 = v25:GiveTask(Default:Clone())
	v6.Title.Text = v3.SkillLevel .. "% Leveled Horse"
	v6.Percent.Text = "+" .. math.floor((v3.SkillMultiplier - 1) * 100 + 0.5) .. "%"
	v6.Visible = true
	v6.Parent = ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Checklist.Content
	ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = true
	ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = false
	ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = true
end
local function createAnimal(p1, p2) --[[ createAnimal | Line: 262 | Upvalues: v4 (copy), LocalPlayer (copy), Horses (copy), v7 (copy), v20 (copy), v1 (copy), v26 (ref), selectAnimal (copy), t2 (copy), v29 (copy) ]]
	local v12
	if not p2 then
		task.wait()
	end
	v12 = v4.new({
		IgnoreBackgroundColor = true,
		SlotValue = p1,
		Owner = LocalPlayer,
		ParentFrame = Horses,
		UnableCheck = {
			ListenForValueAttributes = true,
			Changed = { v7.RefreshTimer.SeedChanged },
			Get = function() --[[ Get | Line: 277 | Upvalues: v7 (ref), v20 (ref), p1 (copy) ]]
				local v1, v2 = v7.CanTurnin(v20, p1)
				if v1 == false then
					return v2
				else
					return true
				end
			end,
			Reasons = {
				CannotTurnin = {
					Text = "Cannot Turn In"
				},
				Favorited = {
					Text = "Cannot turn in favorited horse!"
				},
				NotMet = {
					Text = "Doesn\'t meet requirements."
				}
			}
		}
	})
	v12.Frame:FindFirstChild("Score", true).ScoreLabel.Text = v7.GetPointsWorth(v20, p1) .. " Points"
	v12:GiveTask(v1.new(v12.Frame, {
		Click = function() --[[ Click | Line: 307 | Upvalues: v7 (ref), v20 (ref), p1 (copy), v26 (ref), selectAnimal (ref) ]]
			if not v7.CanTurnin(v20, p1) then
				return
			end
			if v26 == p1 then
				selectAnimal()
				return
			end
			selectAnimal(p1)
		end
	}))
	t2[p1] = v12
	v29:Add(v12, p2)
end
local function removeAnimal(p1) --[[ removeAnimal | Line: 325 | Upvalues: t2 (copy), v26 (ref), v25 (copy), ContainerFrame (copy), v29 (copy) ]]
	if not t2[p1] then
		return
	end
	if v26 == p1 then
		local v1 = t2[v26]
		if v1 then
			v1:Deselect()
		end
		v25:DoCleaning()
		v26 = nil
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.Buttons.Submit.Visible = false
	end
	v29:Remove(t2[p1])
	t2[p1]:Destroy()
	t2[p1] = nil
end
function t.Open(p1, ...) --[[ Open | Line: 338 | Upvalues: v2 (copy), ContainerFrame (copy), v27 (ref), t (copy) ]]
	if v2.IsFrameOpen(ContainerFrame) then
		t.Close()
	else
		v27 = p1
		v2.OpenMainFrame(ContainerFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	end
end
function t.Close(p1) --[[ Close | Line: 352 | Upvalues: v27 (ref), v2 (copy), ContainerFrame (copy) ]]
	if v27 and not p1 then
		v27()
		v27 = nil
		return
	end
	v27 = nil
	v2.CloseFrame(ContainerFrame, {})
	v2.OpenHUD({
		DoNotCloseMainFrame = p1
	})
end
function t.OnOpen(p1) --[[ OnOpen | Line: 367 | Upvalues: v2 (copy), ContainerFrame (copy), v24 (copy), v23 (copy), removeAnimal (copy), createAnimal (copy), t3 (copy), v1 (copy), t4 (copy), v29 (copy), t2 (copy), v7 (copy), v20 (copy), v26 (ref) ]]
	local v12 = v2.getFrameFromInstance(ContainerFrame)
	if v12.ContentsLoaded then
		for k, v in pairs(t2) do
			local Score = v.Frame:FindFirstChild("Score", true)
			if Score then
				Score.ScoreLabel.Text = v7.GetPointsWorth(v20, k) .. " Points"
			end
		end
		if not v26 then
			v29:Sort("Points")
			return
		end
		local v22, v3 = v7.GetPointsWorth(v20, v26)
		ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Profile.ScoreLabel.Text = v22 .. " Points"
		for k, v in pairs(ContainerFrame.Menu.Content.SelectFrame.HorseInfo.Checklist.Content:GetChildren()) do
			if v:IsA("Frame") and (v.Title and v.Title.Text:find("Leveled Horse")) then
				v.Title.Text = v3.SkillLevel .. "% Leveled Horse"
				v.Percent.Text = "+" .. math.floor((v3.SkillMultiplier - 1) * 100 + 0.5) .. "%"
			end
		end
	else
		v12.ContentsLoaded = true
		v24:GiveTask(v23.ChildRemoved:Connect(removeAnimal))
		v24:GiveTask(v23.ChildAdded:Connect(createAnimal))
		for k, v in pairs(v23:GetChildren()) do
			createAnimal(v, true)
		end
		for k, v in pairs(ContainerFrame.Menu.Content.SelectFrame.Buttons:GetChildren()) do
			if v:IsA("ImageButton") then
				if not t3[v.Name] then
					t3[v.Name] = {}
				end
				table.insert(t3[v.Name], v)
				v1.new(v, {
					Click = t4[v.Name]
				})
			end
		end
	end
	v29:Sort("Points")
end
function t.OnClose(p1) --[[ OnClose | Line: 423 ]] end
function t.Cleanup(p1) --[[ Cleanup | Line: 427 ]] end
function t.Init() --[[ Init | Line: 432 | Upvalues: v2 (copy), ContainerFrame (copy), v1 (copy), t (copy), Sonar (copy), v14 (copy), v8 (copy), v19 (copy), BillboardGui (copy), v9 (copy), v7 (copy), RefreshTimer (copy), v20 (copy), HorseShrineMilestones (copy), v11 (copy), HorseShrine (copy), PlayerGui (copy), v3 (copy), v12 (copy), v13 (copy), v5 (copy), v4 (copy) ]]
	v2.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v1.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 442 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v1.new(ContainerFrame.HelpButton, {
		Click = function() --[[ Click | Line: 448 | Upvalues: Sonar (ref) ]]
			Sonar("TutorialService").PromptPopupInfo("CelestialShrine")
		end
	})
	v2.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 453 | Upvalues: t (ref) ]]
		t:OnOpen(...)
	end)
	v2.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 456 | Upvalues: t (ref) ]]
		t:OnClose()
		t.Close()
	end)
	v2.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 460 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	Sonar("InteractMenu").new(workspace:WaitForChild("Interactions"):WaitForChild("HorseShrine"):WaitForChild("InteractPart"), {
		ShowHintLabel = true,
		Hint = "Open Shrine",
		Run = function() --[[ Run | Line: 466 | Upvalues: v14 (ref), t (ref) ]]
			if v14.CanDoActionInTutorial("InteractZones") then
				t.Open()
			end
		end,
		GetRange = function() --[[ GetRange | Line: 472 ]]
			return 25
		end
	})
	local function setTimerLabel() --[[ setTimerLabel | Line: 478 | Upvalues: v8 (ref), v19 (ref), BillboardGui (ref), v9 (ref), v7 (ref) ]]
		if not v8.IsInZone("Town") and v19.IsMarketWorld() then
			return
		end
		BillboardGui.TimerLabel.Text = "Resets in " .. v9.FormatString(v7.GetTimeTillEnd())
	end
	RefreshTimer.TimeChanged:Connect(setTimerLabel)
	RefreshTimer.SeedChanged:Connect(setTimerLabel)
	if v8.IsInZone("Town") or not v19.IsMarketWorld() then
		BillboardGui.TimerLabel.Text = "Resets in " .. v9.FormatString(v7.GetTimeTillEnd())
	end
	local function GetNextMilestone() --[[ GetNextMilestone | Line: 493 | Upvalues: v20 (ref), HorseShrineMilestones (ref) ]]
		local TurninAmount = v20.PlayerData.HorseShrine.TurninAmount.Value
		local v1 = 2500
		for k, v in pairs(HorseShrineMilestones) do
			if TurninAmount < k and k < v1 then
				v1 = k
			end
		end
		return v1
	end
	v11.new({
		TweenAmount = false,
		Clipped = true,
		Frame = workspace.Interactions:WaitForChild("ShrineMilestoneGoal").Display.SurfaceGui.Progress.ProgressMeter.ProgressBar,
		AmountLabel = workspace.Interactions:WaitForChild("ShrineMilestoneGoal").Display.SurfaceGui.Progress.ProgressMeter.ProgressBar.Level,
		GetText = function(p1, p2) --[[ GetText | Line: 512 ]]
			return p1 .. "/" .. p2
		end,
		Get = function() --[[ Get | Line: 516 | Upvalues: v20 (ref) ]]
			return v20.PlayerData.HorseShrine.TurninAmount.Value
		end,
		GetMax = function() --[[ GetMax | Line: 520 | Upvalues: v20 (ref), HorseShrineMilestones (ref) ]]
			local TurninAmount = v20.PlayerData.HorseShrine.TurninAmount.Value
			local v1 = 2500
			for k, v in pairs(HorseShrineMilestones) do
				if TurninAmount < k and k < v1 then
					v1 = k
				end
			end
			return v1
		end,
		Changed = { v20.PlayerData.HorseShrine.TurninAmount:GetPropertyChangedSignal("Value") }
	})
	v11.new({
		TweenAmount = false,
		Clipped = true,
		Frame = workspace.Interactions:WaitForChild("ShrineSmallGoal").Display.SurfaceGui.Progress.ProgressMeter.ProgressBar,
		AmountLabel = workspace.Interactions:WaitForChild("ShrineSmallGoal").Display.SurfaceGui.Progress.ProgressMeter.ProgressBar.Level,
		GetText = function(p1, p2) --[[ GetText | Line: 535 ]]
			return p1 .. "/" .. p2
		end,
		Get = function() --[[ Get | Line: 539 | Upvalues: v20 (ref), HorseShrine (ref) ]]
			return v20.PlayerData.HorseShrine.TurninAmount.Value % HorseShrine.SmallMilestone
		end,
		GetMax = function() --[[ GetMax | Line: 544 | Upvalues: HorseShrine (ref) ]]
			return HorseShrine.SmallMilestone
		end,
		Changed = { v20.PlayerData.HorseShrine.TurninAmount:GetPropertyChangedSignal("Value") }
	})
	local ContainerFrame_2 = PlayerGui:WaitForChild("WorkspaceGui").ShrineLeaderboardGui.ContainerFrame
	PlayerGui:WaitForChild("WorkspaceGui").ShrineLeaderboardGui.Adornee = workspace.Interactions.HorseShrineLeaderboard.Part
	local function SetSpeciesOfDay() --[[ SetSpeciesOfDay | Line: 558 | Upvalues: v7 (ref), ContainerFrame_2 (copy) ]]
		ContainerFrame_2.Content.SpeciesOfTheDay.Text = "SPECIES OF THE DAY: " .. v7.GetSpecies()
	end
	v7.SpeciesTimer.SeedChanged:Connect(SetSpeciesOfDay)
	local v15 = v7.GetSpecies()
	ContainerFrame_2.Content.SpeciesOfTheDay.Text = "SPECIES OF THE DAY: " .. v15
	for v22, v32 in HorseShrineMilestones do
		local v42 = ContainerFrame_2.Content.Rewards.Content.Content.Default:Clone()
		v42.Content.ScoreLabel.Text = v22 .. " Points"
		v42.LayoutOrder = v22
		v42.Visible = true
		v42.Parent = ContainerFrame_2.Content.Rewards.Content.Content
		local v52 = v3.new()
		local t2 = {}
		for v6, v72 in v32 do
			if v72.Species then
				local v82 = v3.new()
				local function DisplayHorse() --[[ DisplayHorse | Line: 598 | Upvalues: v82 (copy), v72 (copy), v5 (ref), v20 (ref), v4 (ref), v42 (copy) ]]
					v82:DoCleaning()
					local v1 = v72.Preset[math.random(1, #v72.Preset)]
					local v2 = v5.CreateSlot(v20, {
						DoNotParent = true,
						DoNotIncrementCount = true,
						SpeciesAsName = true,
						Age = 100,
						Species = v72.Species,
						Preset = v1 or nil,
						Origin = v72.Origin or "Wild",
						Seed = math.random(1, 1000000),
						MaxCosmetics = v72.MaxCosmetics
					})
					local v3 = v4.new({
						ForceVisible = true,
						SpeciesAsName = true,
						SlotValue = v2,
						Owner = game.Players.LocalPlayer,
						GuiObject = v42.Content.Rewards.DefaultHorse,
						ParentFrame = v42.Content.Rewards
					})
					v82:GiveTask(v3)
					v82:GiveTask(v2)
					v3.Frame.Parent = v42.Content.Rewards
				end
				v52:GiveTask(task.spawn(function() --[[ Line: 632 | Upvalues: DisplayHorse (copy) ]]
					while true do
						task.wait(10)
						DisplayHorse()
					end
				end))
				continue
			end
			local v92 = v12.GetByName(v72.Name)
			if v92 then
				local v10 = v13.new({
					ForceVisible = true,
					Item = v92,
					ParentFrame = v42.Content.Rewards,
					GetAmount = function() --[[ GetAmount | Line: 587 | Upvalues: v72 (copy) ]]
						return v72.Amount
					end
				})
				v10.Frame.Visible = #t2 == 0
				v52:GiveTask(v10)
				table.insert(t2, v10)
				continue
			end
			local v122 = warn
			v122("No item data for " .. tostring(v72.Name))
		end
		if #t2 > 1 then
			local v142 = 1
			v52:GiveTask(task.spawn(function() --[[ Line: 644 | Upvalues: t2 (copy), v142 (ref) ]]
				while true do
					task.wait(10)
					t2[v142].Frame.Visible = false
					v142 = v142 % #t2 + 1
					t2[v142].Frame.Visible = true
				end
			end))
		end
	end
end
t.Init()
return t