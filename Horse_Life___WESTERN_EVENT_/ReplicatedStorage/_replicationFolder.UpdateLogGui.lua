-- https://lua.expert/
local t = {}
local ExperienceNotificationService = game:GetService("ExperienceNotificationService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("GuiUtils")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("Button")
local v5 = Sonar("TimeFormat")
local v6 = Sonar("UpdateLogService")
local v7 = Sonar("RemoteUtils")
local v8 = Sonar("TutorialService")
local v9 = Sonar("WebsiteGameEventsService")
local v10 = Sonar("Maid")
local v11 = Sonar("TimeUtils")
local v12 = Sonar("NotificationsClient")
local v13 = Sonar("PlaceTypeService")
Sonar("Constants")
local v14 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = Players.LocalPlayer.PlayerGui:WaitForChild("UpdateLogGui").ContainerFrame
local UpcomingEvents = ContainerFrame.UpcomingEvents
local NotifyButton = ContainerFrame.Featured.NotifyButton
local function canPromptOptIn() --[[ canPromptOptIn | Line: 39 | Upvalues: ExperienceNotificationService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 40 | Upvalues: ExperienceNotificationService (ref) ]]
		return ExperienceNotificationService:CanPromptOptInAsync()
	end)
	return v1 and v2
end
local function selectLog(p1) --[[ selectLog | Line: 46 | Upvalues: ContainerFrame (copy), v5 (copy) ]]
	pcall(function() --[[ Line: 47 | Upvalues: p1 (copy), ContainerFrame (ref), v5 (ref) ]]
		if p1 then
			ContainerFrame.Logs.Selected.Title.Text = "UPDATE " .. p1.Index
			ContainerFrame.Logs.Selected.DescriptionHolder.Description.Text = p1.Description
			ContainerFrame.Logs.Selected.Date.Text = v5.GetFormattedTime("F jS, o", p1.ReleaseTime)
			ContainerFrame.Logs.List.Visible = false
			ContainerFrame.Logs.Selected.Visible = true
		else
			ContainerFrame.Logs.List.Visible = true
			ContainerFrame.Logs.Selected.Visible = false
		end
	end)
end
local function createLogs() --[[ createLogs | Line: 61 | Upvalues: v1 (copy), ContainerFrame (copy), ReplicatedStorage (copy), Sonar (copy), v5 (copy), v4 (copy) ]]
	local v12 = v1.getFrameFromInstance(ContainerFrame)
	if v12.Opened then
		return
	end
	v12.Opened = true
	local tbl = {}
	local v2 = nil
	for k, v in pairs(ReplicatedStorage.Storage.UpdateLogs:GetChildren()) do
		if tonumber(v.Name) then
			tbl[tonumber(v.Name)] = Sonar(v)
			local v52, count
			if v2 then
				if v2 < tonumber(v.Name) then
					v52 = v.Name
					count = tonumber(v52)
					if count >= 22 then
						count = count - 1
					end
					v2 = count
				end
			else
				v52 = v.Name
				count = tonumber(v52)
				if count >= 22 then
					count = count - 1
				end
				v2 = count
			end
		end
	end
	for k, v in pairs(tbl) do
		if not (k <= 30) then
			if k >= 22 then
				k = k - 1
			end
			v.Index = k
			local v7 = ContainerFrame.Logs.List.ScrollingFrame.Default:Clone()
			ContainerFrame.Logs.List.ScrollingFrame.Default.Visible = false
			v7.Image = v.Image
			v7.Title.Text = "Update " .. k
			v7.Date.Text = v5.GetFormattedTime("M. j", v.ReleaseTime)
			local FontFace = v7.Title.FontFace
			FontFace.Weight = k == v2 and Enum.FontWeight.Heavy or Enum.FontWeight.Bold
			v7.Title.FontFace = FontFace
			v7.Visible = true
			v7.Name = k
			v7.LayoutOrder = -k
			v7.Parent = ContainerFrame.Logs.List.ScrollingFrame
			v4.new(v7, {
				NoHoverShadowLabel = true,
				Click = function() --[[ Click | Line: 117 | Upvalues: v (copy), ContainerFrame (ref), v5 (ref) ]]
					local v1 = v
					pcall(function() --[[ Line: 47 | Upvalues: v1 (copy), ContainerFrame (ref), v5 (ref) ]]
						if v1 then
							ContainerFrame.Logs.Selected.Title.Text = "UPDATE " .. v1.Index
							ContainerFrame.Logs.Selected.DescriptionHolder.Description.Text = v1.Description
							ContainerFrame.Logs.Selected.Date.Text = v5.GetFormattedTime("F jS, o", v1.ReleaseTime)
							ContainerFrame.Logs.List.Visible = false
							ContainerFrame.Logs.Selected.Visible = true
						else
							ContainerFrame.Logs.List.Visible = true
							ContainerFrame.Logs.Selected.Visible = false
						end
					end)
				end
			})
			v4:RegisterHover(v7, function() --[[ Line: 121 | Upvalues: v7 (copy) ]]
				v7.Gradient.BackgroundColor3 = Color3.fromRGB(205, 247, 174)
				v7.Date.TextColor3 = Color3.fromRGB(90, 131, 41)
			end)
			v4:RegisterLeave(v7, function() --[[ Line: 125 | Upvalues: v7 (copy) ]]
				v7.Gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				v7.Date.TextColor3 = Color3.fromRGB(180, 105, 236)
			end)
			if k == v2 then
				local ImageLabel = ContainerFrame.Featured.ImageLabel
				ImageLabel.Image = v.FeaturedImage or v.Image
				ContainerFrame.Featured.Content.Description.Text = v.FeaturedDescription
				ContainerFrame.Featured.Content.Title.Text = "UPDATE " .. k .. ": \n" .. v.Title
				ContainerFrame.Featured.Content.Date.Text = v5.GetFormattedTime("F jS, o", v.ReleaseTime)
				pcall(function() --[[ Line: 47 | Upvalues: v (copy), ContainerFrame (ref), v5 (ref) ]]
					if v then
						ContainerFrame.Logs.Selected.Title.Text = "UPDATE " .. v.Index
						ContainerFrame.Logs.Selected.DescriptionHolder.Description.Text = v.Description
						ContainerFrame.Logs.Selected.Date.Text = v5.GetFormattedTime("F jS, o", v.ReleaseTime)
						ContainerFrame.Logs.List.Visible = false
						ContainerFrame.Logs.Selected.Visible = true
					else
						ContainerFrame.Logs.List.Visible = true
						ContainerFrame.Logs.Selected.Visible = false
					end
				end)
			end
		end
	end
end
function t.Open(p1) --[[ Open | Line: 143 | Upvalues: v1 (copy), ContainerFrame (copy), ExperienceNotificationService (copy), NotifyButton (copy) ]]
	if v1.IsFrameOpen(ContainerFrame) then
		return
	end
	CloseCallback = p1
	task.spawn(function() --[[ Line: 148 | Upvalues: ExperienceNotificationService (ref), NotifyButton (ref) ]]
		local v1, v2 = pcall(function() --[[ Line: 40 | Upvalues: ExperienceNotificationService (ref) ]]
			return ExperienceNotificationService:CanPromptOptInAsync()
		end)
		NotifyButton.Visible = v1 and v2
	end)
	v1.OpenMainFrame(ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
end
function t.Close() --[[ Close | Line: 160 | Upvalues: v1 (copy), ContainerFrame (copy) ]]
	if CloseCallback then
		CloseCallback()
	else
		v1.CloseMainFrame(ContainerFrame)
	end
end
function t.OpenFromJoin() --[[ OpenFromJoin | Line: 168 | Upvalues: v13 (copy), v14 (copy), v6 (copy), v8 (copy), v1 (copy), ContainerFrame (copy), v7 (copy), t (copy) ]]
	if game.PlaceId ~= v13.GetMainWorldId() then
		return
	end
	if v14.PlayerData.LastPlayedUpdate.Value == v6.GetLatest() or not v8.HasCompletedPrimaryTutorial(v14) then
		v7.GetRemoteEvent("SetLastPlayedUpdateRemote"):FireServer()
		return
	end
	if not (v14.PlayerData.LastPlayedUpdate.Value > 0) then
		v7.GetRemoteEvent("SetLastPlayedUpdateRemote"):FireServer()
		return
	end
	local v12 = false
	v1.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 179 | Upvalues: v12 (ref), v7 (ref) ]]
		if not v12 then
			v12 = true
			v7.GetRemoteEvent("SetLastPlayedUpdateRemote"):FireServer()
		end
	end)
	t.Open()
	repeat
		task.wait()
	until not v1.IsFrameOpen(ContainerFrame)
end
function t.Init(p1) --[[ Init | Line: 197 | Upvalues: v3 (copy), NotifyButton (copy), ExperienceNotificationService (copy), v1 (copy), ContainerFrame (copy), createLogs (copy), selectLog (copy), t (copy), v13 (copy), Sonar (copy), v8 (copy), UpcomingEvents (copy), v10 (copy), v5 (copy), v9 (copy), v11 (copy), v12 (copy), v2 (copy) ]]
	v3.new(NotifyButton, {
		Click = function() --[[ Click | Line: 199 | Upvalues: ExperienceNotificationService (ref), NotifyButton (ref) ]]
			local v1, v2 = pcall(function() --[[ Line: 40 | Upvalues: ExperienceNotificationService (ref) ]]
				return ExperienceNotificationService:CanPromptOptInAsync()
			end)
			if not (v1 and v2 and pcall(function() --[[ Line: 201 | Upvalues: ExperienceNotificationService (ref) ]]
				ExperienceNotificationService:PromptOptIn()
			end)) then
				return
			end
			NotifyButton.Visible = false
		end
	})
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = ContainerFrame.Logs.List
	})
	v1.AddStateCallback(ContainerFrame, "OnOpen", createLogs)
	v1.AddStateCallback(ContainerFrame, "OnClose", selectLog)
	v3.new(ContainerFrame.Featured.CloseButton, {
		Click = t.Close
	})
	v3.new(ContainerFrame.Logs.Selected.BackButton, {
		Click = selectLog
	})
	if v13.IsMainWorld() then
		Sonar("InteractMenu").new(workspace:WaitForChild("Interactions"):WaitForChild("UpdateLog"):WaitForChild("InteractPart"), {
			ShowHintLabel = true,
			Hint = "View Log",
			Run = function() --[[ Run | Line: 237 | Upvalues: v8 (ref), t (ref) ]]
				if v8.CanDoActionInTutorial("InteractZones") then
					t.Open()
				end
			end,
			GetRange = function() --[[ GetRange | Line: 243 ]]
				return 25
			end
		})
	end
	local t2 = {}
	local Default = UpcomingEvents.ScrollingFrame.Default
	Default.Visible = false
	local function onEventAdded(p1) --[[ onEventAdded | Line: 257 | Upvalues: v10 (ref), Default (copy), v5 (ref), v9 (ref), v11 (ref), v3 (ref), v12 (ref), t2 (copy) ]]
		local v1 = v10.new()
		local v2 = Default:Clone()
		v2.Visible = true
		v1:GiveTask(v2)
		v2.InnerFrame.UpdateTitleLabel.Text = p1.Title
		v2.InnerFrame.UpdateDate.Text = v5.GetFormattedTime("M. j", p1.StartTime)
		v2.InnerFrame.HoverUpLabel.Image = "rbxassetid://" .. p1.Thumbnails[1]
		local function updateStartedState() --[[ updateStartedState | Line: 270 | Upvalues: v9 (ref), p1 (copy), v2 (copy) ]]
			local v1 = v9.HasEventStarted(p1.Id)
			local v22 = v9.IsGoingToEvent(p1.Id)
			if v1 then
				v2.InnerFrame.ViewButton.Visible = false
				v2.InnerFrame.OngoingLabel.Visible = true
				v2.InnerFrame.OngoingLabel.Text = "Live!"
				v2.LayoutOrder = p1.StartTime
				return
			end
			if v22 then
				v2.InnerFrame.ViewButton.Visible = false
				v2.InnerFrame.OngoingLabel.Visible = true
				v2.InnerFrame.OngoingLabel.Text = "Subscribed!"
			else
				v2.InnerFrame.ViewButton.Visible = true
				v2.InnerFrame.OngoingLabel.Visible = false
			end
			v2.LayoutOrder = -p1.StartTime
		end
		v1.UpdateStartedState = v11.AttachToTime(function() --[[ Line: 295 | Upvalues: p1 (copy), updateStartedState (copy), v1 (copy) ]]
			if not (workspace:GetServerTimeNow() >= p1.StartTime and workspace:GetServerTimeNow() - 1 < p1.StartTime) then
				return
			end
			updateStartedState()
			v1.UpdateStartedState = nil
		end)
		updateStartedState()
		v3.new(v2.InnerFrame.ViewButton, {
			Click = function() --[[ Click | Line: 308 | Upvalues: v9 (ref), p1 (copy), v12 (ref), updateStartedState (copy) ]]
				if v9.CanPromptEventRsvp(p1.Id) then
					v9.PromptRsvpToEventAsync(p1.Id)
				else
					v12.Notify({
						Message = "An error occurred, try viewing this event on the website.",
						Preset = "Red"
					})
				end
				updateStartedState()
			end
		})
		v2.Visible = true
		v2.Parent = Default.Parent
		t2[p1.Id] = v1
	end
	local function onEventRemoved(p1) --[[ onEventRemoved | Line: 340 | Upvalues: t2 (copy) ]]
		t2[p1]:Destroy()
		t2[p1] = nil
	end
	v2.manageCanvasSize(UpcomingEvents.ScrollingFrame.UIListLayout, UpcomingEvents.ScrollingFrame, {
		y = true
	})
	v9.EventAdded:Connect(onEventAdded)
	v9.EventRemoved:Connect(onEventRemoved)
	for v14, v22 in v9.GetAllEvents() do
		task.spawn(onEventAdded, v22)
	end
end
t:Init()
return t