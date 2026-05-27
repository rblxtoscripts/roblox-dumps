-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("FormatTime")
local v5 = Sonar("WebsiteGameEventsService")
local v6 = Sonar("Mutex")
function t.new(p1) --[[ new | Line: 15 | Upvalues: t (copy), v2 (copy), v1 (copy), v6 (copy), v4 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Context = p1
	v22.Config = v1.GetComponentConfig(p1)
	v22.Instance = p1.Instance
	v22.Event = p1.Event
	if not v22.Event then
		warn("\226\154\160\239\184\143 WebsiteEventDisplay, Event is required for website event display", v22.Instance, v22.Config)
		return v22
	end
	v22._startTimeInDays = math.round(v22.Event.StartTime / 86400)
	v22.TitleLabel = v1.FindElement(v22.Instance, "TitleLabel")
	v22:_setTitle()
	v22.DateLabel = v1.FindElement(v22.Instance, "DateLabel")
	v22:_setDate()
	v22.ThumbnailLabel = v1.FindElement(v22.Instance, "ThumbnailLabel")
	v22:_setThumbnail()
	v22.SubscribeButton = v1.FindElement(v22.Instance, "SubscribeButton")
	v22.SubscribedLabel = v1.FindElement(v22.Instance, "SubscribedLabel")
	v22.LiveLabel = v1.FindElement(v22.Instance, "LiveLabel")
	v22._subscribe = v6.new(function() --[[ Line: 48 | Upvalues: v22 (copy) ]]
		v22:Subscribe()
	end)
	v22.Maid._updateStatus = v4.OnTimeChanged(function() --[[ Line: 52 | Upvalues: v4 (ref), v22 (copy) ]]
		if not (v4.GetTime() >= v22.Event.StartTime and v4.GetTime() - 1 < v22.Event.StartTime) then
			return
		end
		v22:UpdateStatus()
		v22.Maid._updateStatus = nil
	end)
	v22:UpdateStatus()
	if v22.SubscribeButton and v22.SubscribeButton:IsA("GuiButton") then
		v22.Maid:GiveTask(v1.AddComponent("Button", {
			Instance = v22.SubscribeButton,
			OnClick = v22._subscribe
		}))
	end
	if v22.Context then
		v22.Context:RegisterButtonAction("OnClick", v22._subscribe)
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 76 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._setTitle(p1) --[[ _setTitle | Line: 80 ]]
	if p1.TitleLabel then
		p1.TitleLabel.Text = p1.Event.Title
	end
end
function t._setDate(p1) --[[ _setDate | Line: 88 | Upvalues: v4 (copy) ]]
	if p1.DateLabel then
		p1.DateLabel.Text = v4.GetFormattedTime("M. j", p1.Event.StartTime)
	end
end
function t._setThumbnail(p1) --[[ _setThumbnail | Line: 96 ]]
	if not p1.ThumbnailLabel then
		return
	end
	if next(p1.Event.Thumbnails) then
		p1.ThumbnailLabel.Image = "rbxassetid://" .. p1.Event.Thumbnails[1]
	else
		p1.ThumbnailLabel.Image = ""
	end
end
function t._setLayoutOrder(p1, p2) --[[ _setLayoutOrder | Line: 108 ]]
	if p1.Context then
		p1.Context:SetLayoutOrder(p2 + p1._startTimeInDays)
	end
end
function t.Subscribe(p1) --[[ Subscribe | Line: 116 | Upvalues: v5 (copy), v1 (copy) ]]
	if v5.CanPromptEventRsvp(p1.Event.Id) then
		v5.PromptRsvpToEventAsync(p1.Event.Id)
		local Going = Enum.RsvpStatus.Going
	else
		v1.Notify({
			Message = "An error occurred, try viewing this event on the website.",
			Preset = "Response",
			Type = p1.Event.Id .. "_rsvp_error"
		})
	end
	p1:UpdateStatus()
end
function t.UpdateStatus(p1) --[[ UpdateStatus | Line: 134 | Upvalues: v5 (copy) ]]
	p1._started = v5.HasEventStarted(p1.Event.Id)
	p1._isGoing = v5.IsGoingToEvent(p1.Event.Id)
	if p1._started then
		if p1.SubscribeButton then
			p1.SubscribeButton.Visible = false
		end
		if p1.SubscribedLabel then
			p1.SubscribedLabel.Visible = false
		end
		if p1.LiveLabel then
			p1.LiveLabel.Visible = true
		end
		p1:_setLayoutOrder(2000000000)
	elseif p1._isGoing then
		if p1.SubscribeButton then
			p1.SubscribeButton.Visible = false
		end
		if p1.SubscribedLabel then
			p1.SubscribedLabel.Visible = true
		end
		if p1.LiveLabel then
			p1.LiveLabel.Visible = false
		end
		p1:_setLayoutOrder(1000000000)
	else
		if p1.SubscribeButton then
			p1.SubscribeButton.Visible = true
		end
		if p1.SubscribedLabel then
			p1.SubscribedLabel.Visible = false
		end
		if p1.LiveLabel then
			p1.LiveLabel.Visible = false
		end
		p1:_setLayoutOrder(0)
	end
	if not p1.Config.OnStatusChanged then
		return
	end
	p1.Config.OnStatusChanged(p1)
end
return t