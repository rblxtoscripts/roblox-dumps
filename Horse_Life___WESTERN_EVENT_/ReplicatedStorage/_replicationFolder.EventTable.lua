-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
game:GetService("RunService")
game:GetService("SocialService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("WebsiteGameEventsService")
Sonar("DisplayAnimalClient")
Sonar("IssueResponseClient")
local v2 = Sonar("NotificationsClient")
Sonar("ItemDataService")
Sonar("TutorialService")
Sonar("ItemGridButton")
Sonar("ToolTipClient")
local v3 = Sonar("InteractMenu")
Sonar("PromptClient")
Sonar("RemoteUtils")
local v4 = Sonar("GuiManager")
local v5 = Sonar("ButtonTest")
local v6 = Sonar("TimeFormat")
local v7 = Sonar("TimeUtils")
local v8 = Sonar("GuiUtils")
Sonar("Signal")
Sonar("Button")
Sonar("State")
local v9 = Sonar("Maid")
Sonar("PlayerWrapper").GetClient()
local ContainerFrame = Players.LocalPlayer.PlayerGui:WaitForChild("UpcomingEventGui").ContainerFrame
local UpcomingEvents = ContainerFrame.UpcomingEvents
function t.Open(...) --[[ Open | Line: 43 | Upvalues: v4 (copy), ContainerFrame (copy) ]]
	v4.OpenFrame(ContainerFrame, {
		CloseAll = "CloseOverlay",
		CallbackArgs = { ... }
	})
end
function t.Close() --[[ Close | Line: 50 | Upvalues: v4 (copy), ContainerFrame (copy) ]]
	v4.CloseFrame(ContainerFrame, {})
end
function t.Init(p1) --[[ Init | Line: 55 | Upvalues: v4 (copy), ContainerFrame (copy), v5 (copy), t (copy), UpcomingEvents (copy), v9 (copy), v6 (copy), v1 (copy), v7 (copy), v2 (copy), v8 (copy), v3 (copy) ]]
	v4.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v5.new(ContainerFrame.CloseButton, {
		Click = function() --[[ Click | Line: 64 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	local t2 = {}
	local Default = UpcomingEvents.ScrollingFrame.Default
	Default.Visible = false
	local function onEventAdded(p1) --[[ onEventAdded | Line: 74 | Upvalues: v9 (ref), Default (copy), v6 (ref), v1 (ref), v7 (ref), v5 (ref), v2 (ref), t2 (copy) ]]
		local v12 = v9.new()
		local v22 = Default:Clone()
		v22.Visible = true
		v12:GiveTask(v22)
		v22.InnerFrame.UpdateTitleLabel.Text = p1.Title
		v22.InnerFrame.UpdateDate.Text = v6.GetFormattedTime("M. j", p1.StartTime)
		v22.InnerFrame.HoverUpLabel.Image = "rbxassetid://" .. p1.Thumbnails[1]
		local function updateStartedState() --[[ updateStartedState | Line: 87 | Upvalues: v1 (ref), p1 (copy), v22 (copy) ]]
			local v12 = v1.HasEventStarted(p1.Id)
			local v2 = v1.IsGoingToEvent(p1.Id)
			if v12 then
				v22.InnerFrame.ViewButton.Visible = false
				v22.InnerFrame.OngoingLabel.Visible = true
				v22.InnerFrame.OngoingLabel.Text = "Live!"
				v22.LayoutOrder = p1.StartTime
				return
			end
			if v2 then
				v22.InnerFrame.ViewButton.Visible = false
				v22.InnerFrame.OngoingLabel.Visible = true
				v22.InnerFrame.OngoingLabel.Text = "Subscribed!"
			else
				v22.InnerFrame.ViewButton.Visible = true
				v22.InnerFrame.OngoingLabel.Visible = false
			end
			v22.LayoutOrder = -p1.StartTime
		end
		v12.UpdateStartedState = v7.AttachToTime(function() --[[ Line: 112 | Upvalues: p1 (copy), updateStartedState (copy), v12 (copy) ]]
			if not (workspace:GetServerTimeNow() >= p1.StartTime and workspace:GetServerTimeNow() - 1 < p1.StartTime) then
				return
			end
			updateStartedState()
			v12.UpdateStartedState = nil
		end)
		updateStartedState()
		v5.new(v22.InnerFrame.ViewButton, {
			Click = function() --[[ Click | Line: 125 | Upvalues: v1 (ref), p1 (copy), v2 (ref), updateStartedState (copy) ]]
				if v1.CanPromptEventRsvp(p1.Id) then
					v1.PromptRsvpToEventAsync(p1.Id)
				else
					v2.Notify({
						Message = "An error occurred, try viewing this event on the website.",
						Preset = "Red"
					})
				end
				updateStartedState()
			end
		})
		v22.Visible = true
		v22.Parent = Default.Parent
		t2[p1.Id] = v12
	end
	local function onEventRemoved(p1) --[[ onEventRemoved | Line: 157 | Upvalues: t2 (copy) ]]
		t2[p1]:Destroy()
		t2[p1] = nil
	end
	v8.manageCanvasSize(UpcomingEvents.ScrollingFrame.UIListLayout, UpcomingEvents.ScrollingFrame, {
		y = true
	})
	v1.EventAdded:Connect(onEventAdded)
	v1.EventRemoved:Connect(onEventRemoved)
	for v12, v22 in v1.GetAllEvents() do
		task.spawn(onEventAdded, v22)
	end
	task.spawn(function() --[[ Line: 171 | Upvalues: v3 (ref), t (ref) ]]
		v3.new(workspace:WaitForChild("Interactions"):WaitForChild("Western Event Paper"):WaitForChild("InteractPart"), {
			AllowDuringTutorial = false,
			ShowHintLabel = true,
			Hint = "Signup",
			GetRange = function() --[[ GetRange | Line: 177 ]]
				return 15
			end,
			Run = function() --[[ Run | Line: 181 | Upvalues: t (ref) ]]
				t.Open()
			end
		})
	end)
end
t:Init()
return t