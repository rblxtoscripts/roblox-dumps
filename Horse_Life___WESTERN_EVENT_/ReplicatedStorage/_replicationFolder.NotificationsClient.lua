-- https://lua.expert/
local t = {}
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("NotificationsService")
local PresetColors = Sonar("Constants").PresetColors
local t2 = {
	Up = {
		Tween = TweenInfo.new(0.75, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		Values = {
			TextTransparency = 0,
			TextStrokeTransparency = 0
		}
	},
	Down = {
		Tween = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		Values = {
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0)
		}
	}
}
local NotificationFrame = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("NotificationsGui"):WaitForChild("NotificationFrame")
local Default = NotificationFrame:WaitForChild("Default")
local t3 = {}
local v4 = v2.GetRemoteEvent("NotificationRemote")
local t4 = {}
local t5 = {}
local function createSystemMessage(p1, p2) --[[ createSystemMessage | Line: 61 | Upvalues: TextChatService (copy) ]]
	local v1 = p2.ChatColor or Color3.new(0.996078, 1, 0.866667)
	local v2, v3 = pcall(function() --[[ Line: 63 | Upvalues: TextChatService (ref), v1 (copy), p2 (copy), p1 (copy) ]]
		TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXSystem"):DisplaySystemMessage(string.format("<font color=\'#%s\'>%s</font>", v1:ToHex(), (p2.Prefix or "[!]") .. " " .. p1.Message))
	end)
	if v2 then
		return
	end
	warn(v3)
end
local function tweenOutNotification(p1) --[[ tweenOutNotification | Line: 74 | Upvalues: t3 (copy), TweenService (copy), t2 (copy) ]]
	local v1 = table.find(t3, p1)
	if v1 then
		table.remove(t3, v1)
	end
	if ClearNotifications then
		p1.Label:Destroy()
	else
		local v2 = TweenService:Create(p1.Label, t2.Down.Tween, t2.Down.Values)
		TweenService:Create(p1.Label.UIStroke, t2.Down.Tween, {
			Transparency = 1
		}):Play()
		TweenService:Create(p1.Label.ShadowLabel, t2.Down.Tween, {
			ImageTransparency = 1
		}):Play()
		v2:Play()
		v2.Completed:Connect(function() --[[ Line: 86 | Upvalues: p1 (copy) ]]
			if not p1.Label.Destroy then
				return
			end
			p1.Label:Destroy()
		end)
	end
end
local function createNotification(p1) --[[ createNotification | Line: 98 | Upvalues: t3 (copy), tweenOutNotification (copy), PresetColors (copy), Default (copy), NotificationFrame (copy), ReplicatedStorage (copy), TweenService (copy), t2 (copy), createSystemMessage (copy) ]]
	table.insert(t3, p1)
	if #t3 >= 3 then
		tweenOutNotification(t3[1])
	end
	local v2 = p1.Preset and PresetColors[p1.Preset] or PresetColors.Default
	local v3 = Default:Clone()
	v3.Name = p1.Type
	v3.Text = p1.Message
	v3.TextColor3 = p1.TextColor or v2.TextColor
	v3.UIStroke.Color = p1.TextStrokeColor or v2.TextStrokeColor
	v3.TextStrokeColor3 = p1.TextStrokeColor or v2.TextStrokeColor
	v3.UIStroke.Transparency = 1
	v3.TextStrokeTransparency = 1
	v3.TextTransparency = 1
	v3.ShadowLabel.ImageColor3 = p1.ShadowColor or v2.ShadowColor or p1.TextStrokeColor or v2.TextStrokeColor
	v3.ShadowLabel.ImageTransparency = 1
	v3.Visible = true
	v3.Parent = NotificationFrame
	p1.Label = v3
	if p1.Sound then
		p1.Sound:Play()
	end
	game.SoundService:PlayLocalSound(ReplicatedStorage.Storage.SFX.NotifyBloop)
	local v8 = TweenService:Create(v3, t2.Up.Tween, t2.Up.Values)
	TweenService:Create(v3.UIStroke, t2.Up.Tween, {
		Transparency = 0.19
	}):Play()
	TweenService:Create(p1.Label.ShadowLabel, t2.Up.Tween, {
		ImageTransparency = 0.4
	}):Play()
	v8:Play()
	if p1.ChatMessage ~= false then
		createSystemMessage(p1, v2)
	end
	local v9 = tick()
	repeat
		task.wait()
	until tick() - v9 < t2.Up.Tween.Time or ClearNotifications
	if not ClearNotifications then
		local v10 = tick()
		local count = 0
		repeat
			count = count + 1
			task.wait(0.01)
			local v11
			if p1.Lifetime then
				v11 = tick() - v10 >= p1.Lifetime
				continue
			end
			v11 = if 200 * (v2.WAIT_TIME_MULTIPLIER or 1) <= count then true else ClearNotifications
		until v11
	end
	if not table.find(t3, p1) then
		return
	end
	tweenOutNotification(p1)
end
function t.Notify(p1) --[[ Notify | Line: 164 | Upvalues: t5 (copy), PresetColors (copy), createSystemMessage (copy), createNotification (copy) ]]
	p1.Type = p1.Type or tick()
	if t5[p1.Type] and tick() - t5[p1.Type] < 2 then
		return
	end
	t5[p1.Type] = tick()
	if not p1.ChatOnly then
		task.spawn(createNotification, p1)
		return
	end
	createSystemMessage(p1, p1.Preset and PresetColors[p1.Preset] or PresetColors.Default)
end
function t.SendSystemMessage(p1, p2) --[[ SendSystemMessage | Line: 180 | Upvalues: createSystemMessage (copy) ]]
	createSystemMessage(p1, if p2 then p2 else {})
end
function t.AddNotificationCallback(p1, p2) --[[ AddNotificationCallback | Line: 185 | Upvalues: v3 (copy), t4 (copy) ]]
	local v1 = v3.ConvertNotifyType(p1)
	if t4[v1] then
		warn("Notification callback already added for", v1)
	end
	t4[v1] = p2
end
function t.OpenNotificationFrame(p1) --[[ OpenNotificationFrame | Line: 195 | Upvalues: v1 (copy), NotificationFrame (copy) ]]
	v1.OpenFrame(NotificationFrame, if p1 then p1 else {})
end
function t.ClearNotifications() --[[ ClearNotifications | Line: 199 | Upvalues: Sonar (copy) ]]
	ClearNotifications = true
	task.delay(1, function() --[[ Line: 201 ]]
		ClearNotifications = false
	end)
	Sonar("MessagesClient").ClearNotifications()
end
function t.SetOverlayPosition(p1, p2) --[[ SetOverlayPosition | Line: 208 | Upvalues: v1 (copy), NotificationFrame (copy) ]]
	v1.getFrameFromInstance(NotificationFrame).OverlayOpenPosition = if p2 then p2 else UDim2.new(0.5, 0, 0.7, 0)
	v1.SetOverlayFrames(v1.MainFrameOpen)
end
function t.Disable(p1) --[[ Disable | Line: 216 | Upvalues: t (copy), v1 (copy) ]]
	t.Disabled = true
	v1.SetOverlayFrames(v1.MainFrameOpen)
end
function t.Enable(p1) --[[ Enable | Line: 222 | Upvalues: t (copy), v1 (copy) ]]
	t.Disabled = false
	v1.SetOverlayFrames(v1.MainFrameOpen)
end
v4.OnClientEvent:Connect(function(p1, ...) --[[ Line: 228 | Upvalues: t (copy), t4 (copy) ]]
	if typeof(p1) == "table" then
		t.Notify(p1)
		return
	end
	if not t4[p1] then
		return
	end
	local v1 = t4[p1](...)
	if v1 then
		v1.Type = v1.Type or p1
		t.Notify(v1)
	end
end)
v1.AddFrame(NotificationFrame, {
	Overlay = true,
	IgnoreLayerCollector = true,
	TweenAnimation = false,
	CheckVisibility = function() --[[ CheckVisibility | Line: 248 | Upvalues: t (copy) ]]
		return not t.Disabled
	end,
	OpenPosition = UDim2.new(0.5, 0, 0.7, 0),
	OverlayOpenPosition = UDim2.new(0.5, 0, 0.15, 0),
	OverlayClosedPosition = NotificationFrame.Position
})
return t