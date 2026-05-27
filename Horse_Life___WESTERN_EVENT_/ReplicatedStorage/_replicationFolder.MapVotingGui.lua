-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local CollectionService = game:GetService("CollectionService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("TeleportService")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("InstanceUtils")
local v4 = Sonar("FormatString")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("GuiManager")
local v7 = Sonar("ButtonTest")
local v8 = Sonar("TimeUtils")
local v9 = Sonar("Maid")
local v10 = Sonar("NotificationsClient")
local v11 = Sonar("RaceConfigs")
local v12 = Sonar("GuiUtils")
local v13 = Sonar("spr")
local v14 = Sonar("PromptClient")
Sonar("RacesClient")
local v15 = Sonar("EventUtils")
local VotingStateEnums = v11.VotingStateEnums
local t2 = { "Step 1 - Vote for a Map\n\nA map vote will appear with 3 track options. Vote for your favorite map! You have limited time, so choose fast!", "Step 2 - The Race Begins\n\nThe map with the most votes is selected.", "Step 3 - Compete & Earn\n\nRace to the finish line and place as high as you can. Better placements earn better rewards!" }
local v16 = v5.GetRemoteEvent("MapVoteRemote")
local v17 = v5.GetRemoteEvent("MapVoteStateRemote")
local MapVotingGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MapVotingGui")
local QueueFrame = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("RaceQueueGui"):FindFirstChild("QueueFrame")
local CountdownLabel = QueueFrame:FindFirstChild("CountdownLabel")
local ContainerFrame = MapVotingGui:FindFirstChild("ContainerFrame")
local Menu = ContainerFrame:FindFirstChild("Menu")
local v18 = Menu:FindFirstChild("Content")
local ProgressBar = v18:FindFirstChild("ProgressBar")
local VotingHint = v18:FindFirstChild("VotingHint")
local VotingFrame = v18:FindFirstChild("VotingFrame")
local MapList = VotingFrame:FindFirstChild("MapList")
VotingFrame:FindFirstChild("InRaceCover")
local Bar = ProgressBar:FindFirstChild("Bar")
local Timer = ProgressBar:FindFirstChild("Timer")
local v19 = v2.GetClient()
local v20 = v9.new()
local v21 = nil
local v22 = nil
local v23 = true
local v24 = nil
local v25 = nil
local v26 = false
local t3 = {}
local v27 = os.clock()
local t4 = {}
local function getValidatedTeleportZonePosition() --[[ getValidatedTeleportZonePosition | Line: 95 | Upvalues: t4 (copy) ]]
	local v1 = next(t4)
	if v1 then
		return v1:GetPivot().Position
	end
end
local function createRaceStartPrompt() --[[ createRaceStartPrompt | Line: 102 | Upvalues: v14 (copy), t4 (copy), v19 (copy), v1 (copy), t (copy) ]]
	v14.Prompt({
		Type = "RaceStart",
		OverwritePrompt = true,
		KeepVisible = true,
		AsFrame = false,
		BackgroundNotVisible = true,
		DontSetHUDNavigationEnabled = true,
		Setup = function(p1, p2) --[[ Setup | Line: 105 ]] end,
		Cancel = function(p1, p2) --[[ Cancel | Line: 108 ]]
			return true
		end,
		Run = function(p1, p2) --[[ Run | Line: 111 | Upvalues: t4 (ref), v19 (ref), v1 (ref), t (ref) ]]
			local v12 = next(t4)
			local v2 = if v12 then v12:GetPivot().Position else nil
			if v2 then
				local v3 = v19:IsInRange(v2, 50)
				task.spawn(function() --[[ Line: 115 | Upvalues: v1 (ref), v2 (copy), v3 (copy) ]]
					v1.TeleportToPosition(v2, {
						PivotTo = true,
						StopMovement = true,
						Transition = not v3
					})
				end)
			else
				t.Open()
			end
			return true
		end,
		SelectOnOpen = function(p1) --[[ SelectOnOpen | Line: 127 ]]
			return p1.Content.RunButton
		end
	})
end
local function clearVotingHintTween() --[[ clearVotingHintTween | Line: 141 | Upvalues: t3 (copy), VotingHint (copy) ]]
	for v1, v2 in next, t3 do
		v2:Cancel()
	end
	table.clear(t3)
	VotingHint.UIScale.Scale = 1.5
	VotingHint.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	VotingHint.DisplayLabel.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
end
local function triggerVotingHintTween() --[[ triggerVotingHintTween | Line: 151 | Upvalues: v27 (ref), clearVotingHintTween (copy), t3 (copy), TweenService (copy), VotingHint (copy) ]]
	local v1 = os.clock()
	v27 = v1
	clearVotingHintTween()
	task.delay(0.3, function() --[[ Line: 156 | Upvalues: v1 (copy), v27 (ref), t3 (ref), TweenService (ref), VotingHint (ref) ]]
		if v1 ~= v27 then
			return
		end
		table.insert(t3, TweenService:Create(VotingHint.DisplayLabel, TweenInfo.new(0.75, Enum.EasingStyle.Back, Enum.EasingDirection.Out, -1, true), {
			TextStrokeColor3 = Color3.fromRGB(121, 0, 2)
		}))
		table.insert(t3, TweenService:Create(VotingHint, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out, -1, true), {
			BackgroundColor3 = Color3.fromRGB(127, 0, 0)
		}))
		table.insert(t3, TweenService:Create(VotingHint.UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Scale = 1
		}))
		for v11, v122 in next, t3 do
			v122:Play()
		end
	end)
end
local t5 = {
	[VotingStateEnums.VOTING] = function(p1) --[[ Line: 176 | Upvalues: v23 (ref), v20 (copy), v21 (ref), v6 (copy), QueueFrame (copy), v12 (copy), v22 (ref), MapList (copy), v11 (copy), v4 (copy), v13 (copy), v7 (copy), v16 (copy), TweenService (copy), v24 (ref), VotingStateEnums (copy), t4 (copy), Timer (copy), CountdownLabel (copy), Bar (copy), v26 (ref), createRaceStartPrompt (copy), t (copy), v25 (ref) ]]
		v23 = true
		local function updateTrackButtonVoteCounts() --[[ updateTrackButtonVoteCounts | Line: 178 | Upvalues: p1 (copy), v20 (ref) ]]
			local TrackVotes = p1.TrackVotes
			if not TrackVotes then
				return
			end
			for v1, v2 in next, TrackVotes do
				local v3 = v20[("TrackButton:%*"):format(v1)]
				if v3 then
					v3.MapPreview.VotesCounter.Text = tostring(TrackVotes[v1] or 0) .. " Votes"
				end
			end
		end
		local function updateTrackButtonStates() --[[ updateTrackButtonStates | Line: 193 | Upvalues: v21 (ref), v6 (ref), QueueFrame (ref), p1 (copy), v20 (ref), v12 (ref) ]]
			if v21 then
				v6.OpenFrame(QueueFrame)
			else
				v6.CloseFrame(QueueFrame)
			end
			for v1, v2 in next, p1.TrackVotes do
				local v3 = v20[("TrackButton:%*"):format(v1)]
				if v3 then
					local v4 = v21 == v1
					v3.VoteButton.Top.TextLabel.Text = if v4 then "Voted!" else "Vote"
					v12.SetButtonColor(v3.VoteButton, "Diagonal", if v4 then "Green" else "Blue")
					v3.MapPreview.GlowImage.ImageTransparency = if v4 then 0 else 1
					v3.MapPreview.GlowImage.ImageColor3 = v4 and Color3.fromRGB(85, 255, 0) or Color3.fromRGB(0, 170, 255)
				end
			end
		end
		if p1.RaceId and (p1.TrackVotes and (p1.Duration and (p1.StartTime and p1.RaceId ~= v22))) then
			v22 = p1.RaceId
			v20:DoCleaning()
			local Template = MapList:FindFirstChild("Template")
			local RaceId = p1.RaceId
			local function createTrackVoteButton(p12) --[[ createTrackVoteButton | Line: 220 | Upvalues: Template (copy), v11 (ref), v4 (ref), p1 (copy), v20 (ref), v13 (ref), v7 (ref), v21 (ref), v16 (ref), RaceId (copy), updateTrackButtonStates (copy), TweenService (ref), v12 (ref), MapList (ref) ]]
				local v1 = Template:Clone()
				local v2 = v11.AvailableTracks[p12]
				local GlowImage = v1:FindFirstChild("MapPreview"):FindFirstChild("GlowImage")
				local UIScale = v1:FindFirstChild("UIScale")
				v1.Name = p12
				v1.Visible = true
				v1.MapPreview.Image = if v2 then v2.Image or "" else ""
				v1.MapPreview.NameLabel.Text = v4.separateWordsInString(p12)
				v1.MapPreview.VotesCounter.Text = tostring(p1.TrackVotes[p12] or 0) .. " Votes"
				v20[("TrackButton:%*"):format(p12)] = v1
				v13.target(v1.UIScale, 1, 2, {
					Scale = 1
				})
				v20:GiveTask(v7.new(v1.VoteButton, {
					Click = function() --[[ Click | Line: 240 | Upvalues: v21 (ref), p12 (copy), v16 (ref), RaceId (ref), updateTrackButtonStates (ref) ]]
						v21 = p12
						v16:FireServer(RaceId, p12)
						updateTrackButtonStates()
					end,
					OnHover = function() --[[ OnHover | Line: 245 | Upvalues: TweenService (ref), UIScale (copy), v21 (ref), p12 (copy), GlowImage (copy) ]]
						TweenService:Create(UIScale, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
							Scale = 1.05
						}):Play()
						if v21 == p12 then
							return
						end
						TweenService:Create(GlowImage, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							ImageTransparency = 0
						}):Play()
					end,
					OnLeave = function() --[[ OnLeave | Line: 255 | Upvalues: TweenService (ref), UIScale (copy), v21 (ref), p12 (copy), GlowImage (copy) ]]
						TweenService:Create(UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							Scale = 1
						}):Play()
						if v21 == p12 then
							return
						end
						TweenService:Create(GlowImage, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							ImageTransparency = 1
						}):Play()
					end
				}))
				v12.SetButtonColor(v1.VoteButton, "Diagonal", "Blue")
				v1.UIScale.Scale = 0
				v1.Parent = MapList
			end
			local function updateValidatedVoteZoneDisplays(p1) --[[ updateValidatedVoteZoneDisplays | Line: 271 | Upvalues: v24 (ref), VotingStateEnums (ref), t4 (ref) ]]
				if v24 ~= VotingStateEnums.VOTING then
					return
				end
				local v1 = if p1 then if p1 > 0 then true else false else false
				for v2, v3 in next, t4 do
					v3.PromptLabel.Text = if v1 then "RACE STARTS IN" else "RACE STARTING SOON"
					if v1 then
						v3.CountdownLowerLabel.Text = p1
						v3.CountdownUpperLabel.Text = p1
					end
					v3.CountdownFrame.Visible = v1
					v3.Billboard.StudsOffset = Vector3.new(0, if v1 then 6 else 3, 0)
					v3.Billboard.StudsOffsetWorldSpace = Vector3.new(0, 2, 0)
				end
			end
			local function startCountdown() --[[ startCountdown | Line: 289 | Upvalues: p1 (copy), updateValidatedVoteZoneDisplays (copy), Timer (ref), CountdownLabel (ref), Bar (ref), TweenService (ref), v20 (ref), v24 (ref), VotingStateEnums (ref) ]]
				local v1 = p1.Duration - (workspace:GetServerTimeNow() - p1.StartTime)
				if v1 <= 0 then
					updateValidatedVoteZoneDisplays()
					Timer.Text = ""
					CountdownLabel.Text = "RACE STARTS NOW"
					Bar.Size = UDim2.fromScale(0, 1)
				else
					Bar.Size = UDim2.fromScale(v1 / p1.Duration, 1)
					local v2 = TweenService:Create(Bar, TweenInfo.new(v1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
						Size = UDim2.fromScale(0, 1)
					})
					v2:Play()
					v20:GiveTask(function() --[[ Line: 306 | Upvalues: v2 (ref) ]]
						if not v2 then
							return
						end
						v2:Cancel()
						v2 = nil
					end)
					v20:GiveTask(task.spawn(function() --[[ Line: 312 | Upvalues: v1 (ref), v24 (ref), VotingStateEnums (ref), p1 (ref), CountdownLabel (ref), Timer (ref), updateValidatedVoteZoneDisplays (ref) ]]
						while v1 > 0 and v24 == VotingStateEnums.VOTING do
							v1 = math.round(p1.Duration - (workspace:GetServerTimeNow() - p1.StartTime))
							CountdownLabel.Text = ("RACE STARTS IN %*s"):format(v1)
							Timer.Text = ("VOTING ENDS IN %*s"):format(v1)
							updateValidatedVoteZoneDisplays((math.round(v1)))
							task.wait(0.15)
						end
					end))
				end
			end
			v21 = nil
			for v1, v2 in next, p1.TrackVotes do
				createTrackVoteButton(v1)
			end
			startCountdown()
			updateTrackButtonStates()
			if v26 then
				t.Open()
			else
				createRaceStartPrompt()
			end
		end
		v25 = nil
		updateTrackButtonVoteCounts()
		updateTrackButtonStates()
	end,
	[VotingStateEnums.COOLDOWN] = function(p1) --[[ Line: 344 | Upvalues: v20 (copy), v25 (ref), v23 (ref), v6 (copy), QueueFrame (copy), t (copy), t4 (copy) ]]
		v20:DoCleaning()
		v25 = nil
		v23 = false
		v6.CloseFrame(QueueFrame)
		t.ClearRaceStartPrompt()
		t.Close()
		if not (p1.Duration and p1.StartTime) then
			return
		end
		local v1 = p1.Duration - (workspace:GetServerTimeNow() - p1.StartTime)
		local function updateValidatedVoteZoneDisplays(p1) --[[ updateValidatedVoteZoneDisplays | Line: 355 | Upvalues: t4 (ref) ]]
			local v1 = if p1 then if p1 > 0 then true else false else false
			for v3, v4 in next, t4 do
				local v2
				v2 = v1 and ("IN %*"):format((("%d:%02d"):format(p1 / 60, p1 % 60))) or "SOON"
				v4.PromptLabel.Text = ("VOTING STARTS %*"):format(v2)
				v4.Billboard.StudsOffsetWorldSpace = Vector3.new(0, 2, 0)
				v4.Billboard.StudsOffset = Vector3.new(0, 3, 0)
				v4.CountdownFrame.Visible = false
			end
		end
		if v1 <= 0 then
			updateValidatedVoteZoneDisplays()
			return
		end
		v20:GiveTask(task.spawn(function() --[[ Line: 368 | Upvalues: v1 (ref), p1 (copy), updateValidatedVoteZoneDisplays (copy), v25 (ref) ]]
			while v1 > 0 do
				v1 = p1.Duration - (workspace:GetServerTimeNow() - p1.StartTime)
				updateValidatedVoteZoneDisplays((math.round(v1)))
				v25 = v1
				task.wait(0.5)
			end
		end))
	end,
	[VotingStateEnums.INRACE] = function(p1) --[[ Line: 378 | Upvalues: v20 (copy), v25 (ref), v23 (ref), v6 (copy), QueueFrame (copy), t (copy), v24 (ref), VotingStateEnums (copy), t4 (copy) ]]
		v20:DoCleaning()
		v25 = nil
		v23 = false
		v6.CloseFrame(QueueFrame)
		t.ClearRaceStartPrompt()
		t.Close()
		task.delay(0.5, function() --[[ Line: 387 | Upvalues: v24 (ref), VotingStateEnums (ref), t4 (ref) ]]
			if v24 ~= VotingStateEnums.INRACE then
				return
			end
			for v1, v2 in next, t4 do
				v2.PromptLabel.Text = "RACE IN PROGRESS"
				v2.CountdownFrame.Visible = false
				v2.Billboard.StudsOffset = Vector3.new(0, 3, 0)
				v2.Billboard.StudsOffsetWorldSpace = Vector3.new(0, 2, 0)
			end
		end)
	end
}
function t.Open() --[[ Open | Line: 402 | Upvalues: v23 (ref), v6 (copy), ContainerFrame (copy), v27 (ref), clearVotingHintTween (copy), t3 (copy), TweenService (copy), VotingHint (copy) ]]
	if v23 then
		v6.OpenFrame(ContainerFrame)
		local v1 = os.clock()
		v27 = v1
		clearVotingHintTween()
		task.delay(0.3, function() --[[ Line: 156 | Upvalues: v1 (copy), v27 (ref), t3 (ref), TweenService (ref), VotingHint (ref) ]]
			if v1 ~= v27 then
				return
			end
			table.insert(t3, TweenService:Create(VotingHint.DisplayLabel, TweenInfo.new(0.75, Enum.EasingStyle.Back, Enum.EasingDirection.Out, -1, true), {
				TextStrokeColor3 = Color3.fromRGB(121, 0, 2)
			}))
			table.insert(t3, TweenService:Create(VotingHint, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out, -1, true), {
				BackgroundColor3 = Color3.fromRGB(127, 0, 0)
			}))
			table.insert(t3, TweenService:Create(VotingHint.UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Scale = 1
			}))
			for v11, v122 in next, t3 do
				v122:Play()
			end
		end)
	end
end
function t.Close() --[[ Close | Line: 410 | Upvalues: v6 (copy), ContainerFrame (copy), clearVotingHintTween (copy) ]]
	v6.CloseFrame(ContainerFrame)
	clearVotingHintTween()
end
function t.OnOpen(p1) --[[ OnOpen | Line: 414 ]] end
function t.OnClose(p1) --[[ OnClose | Line: 416 ]] end
function t.ClearRaceStartPrompt() --[[ ClearRaceStartPrompt | Line: 419 | Upvalues: v14 (copy) ]]
	local v1 = v14.IsActive()
	if v1 and v1.Type == "RaceStart" then
		v14.Clear()
		v14.Close()
	end
end
function t.Init(p1) --[[ Init | Line: 429 | Upvalues: v12 (copy), v6 (copy), ContainerFrame (copy), QueueFrame (copy), t (copy), v7 (copy), Menu (copy), v3 (copy), v14 (copy), t2 (copy), v22 (ref), v21 (ref), v16 (copy), t4 (copy), v15 (copy), v19 (copy), v26 (ref), v24 (ref), VotingStateEnums (copy), v10 (copy), v25 (ref), v8 (copy), CollectionService (copy), v17 (copy), t5 (copy) ]]
	v12.SetGameElements({
		MapVoting = false
	})
	v6.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v6.AddFrame(QueueFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = false,
		OpenPosition = QueueFrame.Position,
		ClosePosition = QueueFrame.Position + UDim2.new(0, 0, -0.15, 0)
	})
	v6.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 449 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
	v6.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 452 | Upvalues: t (ref) ]]
		t:OnOpen()
	end)
	v7.new(Menu.CloseButton, {
		Click = t.Close
	})
	v7.new(v3.GetTagged(Menu, "HelpButton"), {
		Click = function() --[[ Click | Line: 459 | Upvalues: v14 (ref), v3 (ref), t2 (ref) ]]
			v14.Prompt({
				Type = "Tutorial",
				Setup = function(p1, p2) --[[ Setup | Line: 462 | Upvalues: v3 (ref), t2 (ref) ]]
					for v1, v2 in p1.Content.Prompts:GetChildren() do
						v2.Visible = v2.Name == "Template"
					end
					local Template = p1.Content.Prompts:FindFirstChild("Template")
					local v32 = v3.GetTemplate(Template, "Default")
					for v4, v5 in t2 do
						local v6 = v32:Clone()
						p2.Maid:GiveTask(v6)
						v6.LayoutOrder = v4
						local v7 = v3.GetTagged(v6, "TitleLabel")
						v7.Text = "Welcome to the Competitor Hub!"
						v7.Visible = v4 == 2
						v3.GetTagged(v6, "FrameText").Text = v5
						v6.Visible = true
						v6.Parent = v32.Parent
					end
				end,
				Run = function() --[[ Run | Line: 487 ]]
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 490 ]]
					return true
				end
			})
		end
	})
	v7.new(v3.GetTagged(QueueFrame, "LeaveButton"), {
		Click = function() --[[ Click | Line: 497 | Upvalues: v22 (ref), v21 (ref), v16 (ref) ]]
			if v22 then
				v21 = nil
				v16:FireServer(v22)
			end
		end
	})
	local function onVoteZoneAdded(p1) --[[ onVoteZoneAdded | Line: 508 | Upvalues: t4 (ref), v15 (ref), v19 (ref), v26 (ref), v24 (ref), VotingStateEnums (ref), v10 (ref), v25 (ref), v8 (ref), t (ref) ]]
		if not p1:IsDescendantOf(workspace) then
			return
		end
		local ZoneBox = p1:WaitForChild("ZoneBox", 10)
		local QueueGui = p1:WaitForChild("QueueGui", 10)
		if ZoneBox and QueueGui then
			local v1 = false
			local v2 = RaycastParams.new()
			local Countdown = QueueGui:FindFirstChild("Countdown")
			t4[p1] = {
				Billboard = QueueGui,
				CountdownFrame = Countdown,
				PromptLabel = QueueGui:FindFirstChild("PromptLabel"),
				CountdownLowerLabel = Countdown:FindFirstChild("DefaultTemplate"):FindFirstChild("Frame"):FindFirstChild("Title"):FindFirstChild("Lower"):FindFirstChild("Title"),
				CountdownUpperLabel = Countdown:FindFirstChild("DefaultTemplate"):FindFirstChild("Frame"):FindFirstChild("Title"):FindFirstChild("Upper"):FindFirstChild("Title")
			}
			v2.IncludeInstances = { ZoneBox }
			local v3 = nil
			local v4 = v15.spawnLoop(function() --[[ Line: 535 | Upvalues: v19 (ref), v2 (copy), v26 (ref), v1 (ref), v24 (ref), VotingStateEnums (ref), v10 (ref), v25 (ref), v8 (ref), t (ref) ]]
				if not v19.PrimaryPart then
					return
				end
				local v22 = workspace:Raycast(v19.PrimaryPart.Position + Vector3.new(0, 1, 0), Vector3.new(0, -50, 0), v2) and true or false
				v26 = v22
				if v1 == v22 then
					return
				end
				v1 = v22
				if not v22 then
					return
				end
				if v24 == VotingStateEnums.INRACE then
					v10.Notify({
						Message = "Race in progress, check back later!",
						Preset = "Default",
						ChatMessage = false,
						Type = ("RaceQueue%*"):format(v24)
					})
					return
				end
				if v24 == VotingStateEnums.COOLDOWN then
					local t2 = {
						Preset = "Default",
						ChatMessage = false
					}
					local v4
					if v25 then
						local v5 = ("in %*"):format((v8.FormatTimeWithoutLeadingZeros(v25)))
						v4 = if v5 then v5 else "soon"
					else
						v4 = "soon"
					end
					t2.Message = ("Come back to vote %*!"):format(v4)
					t2.Type = ("RaceQueue%*"):format(v24)
					v10.Notify(t2)
				else
					t.ClearRaceStartPrompt()
					t.Open()
				end
			end, 0.5)
			v3 = ZoneBox.AncestryChanged:Connect(function() --[[ Line: 572 | Upvalues: ZoneBox (copy), v3 (ref), t4 (ref), p1 (copy), v4 (copy) ]]
				if ZoneBox:IsDescendantOf(workspace) or not v3 then
					return
				end
				t4[p1] = nil
				v3:Disconnect()
				v3 = nil
				task.cancel(v4)
			end)
		else
			warn((("attempt to add zone model but it\'s missing zone box or queue display gui: %*"):format((p1:GetFullName()))))
		end
	end
	CollectionService:GetInstanceAddedSignal("RaceVoteZone"):Connect(onVoteZoneAdded)
	for v1, v2 in CollectionService:GetTagged("RaceVoteZone") do
		task.spawn(onVoteZoneAdded, v2)
	end
	v17.OnClientEvent:Connect(function(p1, p2) --[[ Line: 587 | Upvalues: t5 (ref), v24 (ref) ]]
		local v1 = t5[p1 or ""]
		if v1 then
			v24 = p1
			v1(p2)
		else
			warn("invalid vote state passed without handler: ", p1)
		end
	end)
	v17:FireServer()
end
t:Init()
return t