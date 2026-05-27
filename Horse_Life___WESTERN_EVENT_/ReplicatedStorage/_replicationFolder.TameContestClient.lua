-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
Sonar("TameContestLeaderboard")
Sonar("TameContestChest")
Sonar("InfoOverlayGui")
local v1 = Sonar("TameContestService")
local v2 = Sonar("InteractZone")
local v3 = Sonar("TimeUtils")
local v4 = Sonar("FormatNumber")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("IssueResponseClient")
local v7 = Sonar("Maid")
local v8 = Sonar("Button")
local v9 = Sonar("GuiManager")
local v10 = Sonar("ButtonTest")
local v11 = Sonar("ItemDataService")
local v12 = Sonar("ItemGridButton")
local v13 = Sonar("ToolTipClient")
local v14 = Sonar("DisplayAnimalClient")
local v15 = Sonar("MessagesClient")
local v16 = Sonar("TutorialService")
Sonar("Constants")
local v17 = Sonar("PlaceTypeService")
local v18 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = game.Players.LocalPlayer.PlayerGui.TameContestGui.ContainerFrame
local RefreshTimer = v1.RefreshTimer
local Score = v18.PlayerData.TameContest.Score
local Entered = v18.PlayerData.TameContest.Entered
local TameContest = workspace:WaitForChild("Interactions"):WaitForChild("TameContest")
local BillboardGui = TameContest:WaitForChild("InteractZone"):WaitForChild("BillboardGui")
local v19 = v7.new()
local t2 = {}
local t3 = {
	EnterContest = function() --[[ EnterContest | Line: 55 | Upvalues: v1 (copy), v18 (copy), v6 (copy), v5 (copy) ]]
		local v12 = v1.CanEnterContest(v18)
		if v12 == true then
			v5.GetRemoteFunction("EnterTameContest"):InvokeServer()
		else
			v6.NotifyIssue(v12)
		end
	end,
	AllRewards = function() --[[ AllRewards | Line: 64 | Upvalues: ContainerFrame (copy) ]]
		ContainerFrame.Menu.Content.SelectFrame.AllRewards.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.Buttons.ReturnRewards.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.Buttons.AllRewards.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = false
	end,
	ReturnRewards = function() --[[ ReturnRewards | Line: 70 | Upvalues: ContainerFrame (copy) ]]
		ContainerFrame.Menu.Content.SelectFrame.RankInfo.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.Buttons.AllRewards.Visible = true
		ContainerFrame.Menu.Content.SelectFrame.AllRewards.Visible = false
		ContainerFrame.Menu.Content.SelectFrame.Buttons.ReturnRewards.Visible = false
	end
}
function t.OnClose(p1) --[[ OnClose | Line: 78 | Upvalues: v9 (copy), ContainerFrame (copy), t (copy) ]]
	if v9.MainFrameOpen ~= ContainerFrame then
		return
	end
	t.Close(true)
end
function t.Cleanup(p1) --[[ Cleanup | Line: 84 | Upvalues: v19 (copy), v9 (copy), ContainerFrame (copy) ]]
	v19:DoCleaning()
	v9.CleanContents(ContainerFrame)
end
function t.Open(...) --[[ Open | Line: 90 | Upvalues: v9 (copy), ContainerFrame (copy), t (copy) ]]
	if v9.IsFrameOpen(ContainerFrame) then
		t.Close()
	else
		v9.OpenMainFrame(ContainerFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	end
end
function t.Close(p1) --[[ Close | Line: 102 | Upvalues: v9 (copy), ContainerFrame (copy) ]]
	v9.CloseFrame(ContainerFrame, {})
	v9.OpenHUD({
		DoNotCloseMainFrame = p1
	})
end
function t.OnOpen(p1, p2) --[[ OnOpen | Line: 111 | Upvalues: v9 (copy), ContainerFrame (copy), t2 (copy), v10 (copy), t3 (copy), Entered (copy), v1 (copy), v3 (copy), RefreshTimer (copy), ReplicatedStorage (copy), v7 (copy), v4 (copy), Score (copy), v11 (copy), v12 (copy), v8 (copy), v13 (copy), Sonar (copy), v18 (copy) ]]
	local v14 = v9.getFrameFromInstance(ContainerFrame)
	if not v14.Opened then
		v14.Opened = true
		for k, v in pairs({ ContainerFrame.Menu.Content.SelectFrame, ContainerFrame.Menu.Content.EnterFrame }) do
			for k2, v2 in pairs(v.Buttons:GetChildren()) do
				if v2:IsA("ImageButton") then
					if not t2[v2.Name] then
						t2[v2.Name] = {}
					end
					table.insert(t2[v2.Name], v2)
					v10.new(v2, {
						Click = t3[v2.Name]
					})
				end
			end
		end
		t3.ReturnRewards()
		local function updateEnteredCompetition() --[[ updateEnteredCompetition | Line: 133 | Upvalues: ContainerFrame (ref), Entered (ref) ]]
			ContainerFrame.Menu.Content.SelectFrame.Visible = Entered.Value
			ContainerFrame.Menu.Content.EnterFrame.Visible = not Entered.Value
		end
		Entered:GetPropertyChangedSignal("Value"):Connect(updateEnteredCompetition)
		ContainerFrame.Menu.Content.SelectFrame.Visible = Entered.Value
		ContainerFrame.Menu.Content.EnterFrame.Visible = not Entered.Value
		local function setTimerLabel() --[[ setTimerLabel | Line: 140 | Upvalues: v9 (ref), ContainerFrame (ref), v1 (ref), v3 (ref), RefreshTimer (ref) ]]
			if not v9.IsFrameOpen(ContainerFrame) then
				return
			end
			ContainerFrame.Menu.Countdown.Visible = v1.HasEnded()
			ContainerFrame.Menu.Countdown.TimerLabel.Text = v3.FormatString(RefreshTimer:GetTime())
			ContainerFrame.Menu.Content.Timer.Visible = not v1.HasEnded()
			ContainerFrame.Menu.Content.Timer.TextLabel.Text = "Ends in " .. v3.FormatString(v1.GetTimeTillEnd())
		end
		v9.AddStateCallback(ContainerFrame, "OnOpen", setTimerLabel)
		RefreshTimer.TimeChanged:Connect(setTimerLabel)
		RefreshTimer.SeedChanged:Connect(setTimerLabel)
		setTimerLabel()
		ReplicatedStorage.Storage.BreedContest.Ended:GetPropertyChangedSignal("Value"):Connect(setTimerLabel)
		local v32 = ContainerFrame.Menu.Content.SelectFrame.RankInfo.RankFrame.Content
		local v42 = nil
		local v5 = v7.new()
		local function setScoreAndRank() --[[ setScoreAndRank | Line: 159 | Upvalues: v32 (copy), v4 (ref), Score (ref), v1 (ref), v42 (ref), v5 (copy), v11 (ref), v12 (ref), v8 (ref), v13 (ref) ]]
			v32.ScoreLabel.Text = v4.splice(Score.Value) .. " pts"
			local v14 = v1.GetRewardTier(Score.Value) or v1.RankTiers[#v1.RankTiers]
			local v2 = v1.RankTiers[v14.Index - 1]
			local v3 = v14 ~= v42
			v42 = v14
			if v2 then
				v32.NextScoreLabel.Text = type(v2.Score) == "number" and "+" .. v4.splice(v2.Score) .. " pts" or v4.splice(v2.Score.Min) .. " pts - " .. v4.splice(v2.Score.Max) .. " pts"
			else
				v32.NextScoreLabel.Text = "MAX TIER"
			end
			if v3 then
				v5:DoCleaning()
				for k, v in pairs(v14.Rewards) do
					if v11.GetByName(v.Name) then
						local v52 = v12.new({
							ForceVisible = true,
							Item = v11.GetByName(v.Name),
							ParentFrame = v32.Rewards,
							GetAmount = function() --[[ GetAmount | Line: 184 | Upvalues: v (copy) ]]
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
						v52:GiveTask(v8.new(v52.Frame, {
							Click = function() --[[ Click | Line: 198 | Upvalues: v13 (ref), v52 (copy), v11 (ref), v (copy) ]]
								v13:CreateToolTip({
									Type = "ItemDescription",
									Offset = Vector2.new(0.65, 0.5),
									GuiObject = v52.Frame,
									Get = function() --[[ Get | Line: 203 | Upvalues: v11 (ref), v (ref) ]]
										return v11.GetByName(v.Name)
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
		for k, v in pairs(v1.ScoresPerSpecies) do
			local v6 = if k == "Default" then "Horse" else k
			local v72 = ContainerFrame.Menu.Content.SpeciesFrame.Content.List.Default:Clone()
			ContainerFrame.Menu.Content.SpeciesFrame.Content.List.Default.Visible = false
			v72.NameLabel.Text = v6
			v72.ValueLabel.Text = "+" .. v .. " pts"
			local v82 = Sonar("MissionsService").GetSlotInfoForMission(v18, {
				Species = v6
			})
			local v92 = Sonar("AnimalRiggerService").CreateAnimalModel({
				ForceAdult = true,
				SlotValue = v82
			})
			v92.Parent = v72.Viewport
			local Camera = Instance.new("Camera")
			Camera.Parent = v72.Viewport
			v72.Viewport.CurrentCamera = Camera
			Camera.FieldOfView = 1
			Camera.CFrame = Sonar("ViewportModel")(v92, v72.Viewport, -130, -8)
			local Eyelid = v92:FindFirstChild("Eyelid")
			if Eyelid then
				Eyelid:Destroy()
			end
			v72.Viewport.Ambient = Color3.fromRGB(192, 192, 192)
			v72.Viewport.LightDirection = Camera.CFrame.LookVector
			Sonar("AnimalCosmetics").new(v92, {
				InViewport = true,
				IsYoung = false,
				SlotValue = v82
			})
			v72.Visible = true
			v72.LayoutOrder = if v6 == "Horse" then -1 else v
			v72.Parent = ContainerFrame.Menu.Content.SpeciesFrame.Content.List
		end
		local AllRewards = ContainerFrame.Menu.Content.SelectFrame.AllRewards
		for k, v in pairs(v1.RankTiers) do
			local v112 = AllRewards.Content.Default:Clone()
			AllRewards.Content.Default.Visible = false
			v112.Content.ScoreLabel.Text = type(v.Score) == "number" and "+" .. v4.splice(v.Score) .. " pts" or v4.splice(v.Score.Min) .. " pts - " .. v4.splice(v.Score.Max) .. " pts"
			v112.Content.TierLabel.Text = "#" .. k
			for k2, v2 in pairs(v.Rewards) do
				if v11.GetByName(v2.Name) then
					local v132 = v12.new({
						ForceVisible = true,
						Item = v11.GetByName(v2.Name),
						Theme = v2.Theme,
						ParentFrame = v112.Content.Rewards,
						GetAmount = function() --[[ GetAmount | Line: 285 | Upvalues: v2 (copy) ]]
							return v2.Amount
						end
					})
					local ChanceLabel = v132.Frame:FindFirstChild("ChanceLabel", true)
					if v2.P then
						ChanceLabel.Text = v2.P .. "%"
						ChanceLabel.Visible = true
					else
						ChanceLabel.Visible = false
					end
					v132:GiveTask(v8.new(v132.Frame, {
						Click = function() --[[ Click | Line: 299 | Upvalues: v13 (ref), v132 (copy), v11 (ref), v2 (copy) ]]
							v13:CreateToolTip({
								Type = "ItemDescription",
								Offset = Vector2.new(0.65, 0.5),
								GuiObject = v132.Frame,
								Get = function() --[[ Get | Line: 304 | Upvalues: v11 (ref), v2 (ref) ]]
									return v11.GetByName(v2.Name)
								end
							})
						end
					}))
				end
			end
			v112.Name = v.Index
			v112.Visible = true
			v112.Parent = AllRewards.Content
		end
	end
	if v14.ContentsLoaded then
		return
	end
	v14.ContentsLoaded = true
end
function t.Init(p1) --[[ Init | Line: 324 | Upvalues: v9 (copy), ContainerFrame (copy), t (copy), v10 (copy), Sonar (copy), TameContest (copy), v16 (copy), v2 (copy), v17 (copy), BillboardGui (copy), v1 (copy), v3 (copy), RefreshTimer (copy), Score (copy), v14 (copy), v15 (copy), ReplicatedStorage (copy) ]]
	v9.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v9.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 333 | Upvalues: t (ref) ]]
		t:OnOpen(...)
	end)
	v9.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 336 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
	v9.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 339 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v10.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 344 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v10.new(ContainerFrame.Menu.HelpButton, {
		Click = function() --[[ Click | Line: 349 | Upvalues: Sonar (ref) ]]
			Sonar("TutorialService").PromptPopupInfo("TameContest")
		end
	})
	task.spawn(function() --[[ Line: 354 | Upvalues: Sonar (ref), TameContest (ref), v16 (ref), t (ref) ]]
		Sonar("InteractMenu").new(TameContest:WaitForChild("InteractZone"):WaitForChild("InteractPart"), {
			ShowHintLabel = true,
			Hint = "Open",
			Run = function() --[[ Run | Line: 357 | Upvalues: v16 (ref), t (ref) ]]
				if v16.CanDoActionInTutorial("InteractZones") then
					t.Open()
				end
			end,
			GetRange = function() --[[ GetRange | Line: 364 ]]
				return 25
			end
		})
	end)
	local function setTimerLabel() --[[ setTimerLabel | Line: 371 | Upvalues: v2 (ref), v17 (ref), BillboardGui (ref), v1 (ref), v3 (ref), RefreshTimer (ref) ]]
		if not (v2.IsInZone("Town") or v17.IsMarketWorld()) then
			return
		end
		BillboardGui.TimerLabel.Text = v1.HasEnded() and "Starts in " .. v3.FormatString(RefreshTimer:GetTime()) or "Ends in " .. v3.FormatString(v1.GetTimeTillEnd())
	end
	RefreshTimer.TimeChanged:Connect(setTimerLabel)
	RefreshTimer.SeedChanged:Connect(setTimerLabel)
	setTimerLabel()
	local v12 = v1.GetRewardTier(Score.Value)
	Score:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 382 | Upvalues: v1 (ref), Score (ref), v12 (ref), v14 (ref), v15 (ref), ReplicatedStorage (ref) ]]
		local v13 = v1.GetRewardTier(Score.Value)
		local v2 = if v12 and v13 then v13.Index < v12.Index elseif v12 == nil then v13 else false
		v12 = if v13 then v13 else v1.RankTiers[#v1.RankTiers]
		if not v2 then
			return
		end
		task.delay(1.25, function() --[[ Line: 393 | Upvalues: v14 (ref), v15 (ref), v13 (copy), ReplicatedStorage (ref) ]]
			if v14.YieldForNoDisplay() then
				task.wait(1.25)
			end
			v15:AddNotification({
				Type = "TamingContestReward",
				DoNotSkip = true,
				Duration = 3.5,
				Message = "Tier " .. v13.Index .. " Rewards",
				Sound = { ReplicatedStorage.Storage.SFX.EquipmentMessage, ReplicatedStorage.Storage.SFX.QuestComplete2 }
			})
		end)
	end)
end
t:Init()
return t