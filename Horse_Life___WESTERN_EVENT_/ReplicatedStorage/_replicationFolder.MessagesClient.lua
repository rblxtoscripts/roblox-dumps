-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("GuiManager")
local t2 = {
	TextLabel = {
		TextTransparency = 1,
		TextStrokeTransparency = 1
	},
	ImageLabel = {
		BackgroundTransparency = 1,
		ImageTransparency = 1
	},
	ImageButton = {
		BackgroundTransparency = 1,
		ImageTransparency = 1
	},
	UIStroke = {
		Transparency = 1
	}
}
local v3 = v1.GetClient()
local MessagesFrame = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("NotificationsGui"):WaitForChild("MessagesFrame")
local t3 = {}
local v4 = false
local v5 = false
local function removeNotification(p1, p2) --[[ removeNotification | Line: 47 | Upvalues: t3 (copy), v5 (ref), t2 (copy), TweenService (copy) ]]
	local v1 = table.find(t3, p1)
	if v1 then
		table.remove(t3, v1)
	end
	if not v5 then
		local v2 = nil
		for k, v in pairs(p1.Label:GetDescendants()) do
			if t2[v.ClassName] then
				local v6 = TweenService:Create(v, TweenInfo.new(if p2 then 0.3 else 0.65), t2[v.ClassName])
				v6:Play()
				v2 = v6
			end
		end
		v2.Completed:Wait()
	end
	p1.Label:Destroy()
end
local function createNotification(p1) --[[ createNotification | Line: 68 | Upvalues: v5 (ref), MessagesFrame (copy), t2 (copy), TweenService (copy), t3 (copy), removeNotification (copy) ]]
	if v5 then
		return
	end
	local v1 = MessagesFrame[p1.Type]:Clone()
	v1.Name = tick()
	if p1.Message then
		v1:FindFirstChild("MessageLabel", true).Text = p1.Message
	end
	p1.Label = v1
	local t = {}
	for k, v in pairs(p1.Label:GetDescendants()) do
		local v2 = t2[v.ClassName]
		if v2 then
			t[v] = {}
			for k2, v3 in pairs(v2) do
				t[v][k2] = v[k2]
				v[k2] = v3
			end
		end
	end
	v1.UIScale.Scale = 0
	v1.TextLabel.Text = p1.Text or v1.TextLabel.Text
	if p1.SubText then
		v1.MessageLabel.Text = p1.SubText
	end
	v1.Visible = true
	v1.Parent = MessagesFrame
	if p1.RunBefore then
		p1.RunBefore(v1)
	end
	if p1.Sound then
		if type(p1.Sound) == "table" then
			for k, v in pairs(p1.Sound) do
				v:Play()
			end
		else
			p1.Sound:Play()
		end
	end
	TweenService:Create(v1.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Scale = 1
	}):Play()
	task.wait(0.1)
	for k, v in pairs({
		v1.TextLabel,
		v1.TextLabel.UIStroke,
		v1.ShadowLabel,
		v1:FindFirstChild("IconLabel")
	}) do
		TweenService:Create(v, TweenInfo.new(0.3), t[v]):Play()
	end
	task.wait(0.2)
	if v1:FindFirstChild("MessageLabel", true) then
		local tbl2 = {}
		local MessageLabel = v1:FindFirstChild("MessageLabel", true)
		local UIStroke = v1:FindFirstChild("MessageLabel", true).UIStroke
		local SubLabel = v1:FindFirstChild("SubLabel")
		local v4 = v1:FindFirstChild("SubLabel") and v1:FindFirstChild("SubLabel"):FindFirstChild("UIStroke")
		tbl2[1] = MessageLabel
		tbl2[2] = UIStroke
		tbl2[3] = SubLabel
		tbl2[4] = v4
		tbl2[5] = v1:FindFirstChild("EventCurrency")
		for k, v in pairs(tbl2) do
			TweenService:Create(v, TweenInfo.new(0.6), t[v]):Play()
		end
	end
	local v52 = tick()
	repeat
		task.wait()
		if #t3 > 0 and not p1.DoNotSkip then
			break
		end
		local v6 = tick() - v52
	until ((#t3 == 0 or p1.DoNotSkip) and p1.Duration or 0) <= v6 or v5
	removeNotification(p1, #t3 > 0)
end
local function startNotificationQueue() --[[ startNotificationQueue | Line: 157 | Upvalues: v4 (ref), t3 (copy), createNotification (copy) ]]
	if v4 then
		return
	end
	v4 = true
	while true do
		while #t3 > 0 do
			createNotification(table.remove(t3, 1))
		end
		wait(0.05)
	end
end
function t.AddNotification(p1, p2) --[[ AddNotification | Line: 174 | Upvalues: v3 (copy), t3 (copy), startNotificationQueue (copy) ]]
	if not p2.CheckSetting or v3.PlayerData.Settings.States.TopNotifications.Value then
		table.insert(t3, p2)
		task.spawn(startNotificationQueue)
	end
end
function t.ClearNotifications() --[[ ClearNotifications | Line: 182 | Upvalues: v5 (ref) ]]
	v5 = true
	task.delay(1, function() --[[ Line: 184 | Upvalues: v5 (ref) ]]
		v5 = false
	end)
end
function t.Init(p1) --[[ Init | Line: 189 | Upvalues: MessagesFrame (copy), v2 (copy) ]]
	for k, v in pairs(MessagesFrame:GetChildren()) do
		if v:IsA("Frame") then
			v.Visible = false
		end
	end
	v2.AddFrame(MessagesFrame, {
		TweenAnimation = false,
		Overlay = true,
		OpenPosition = UDim2.new(0.5, 0, 0.08, 100),
		MobileOpenPosition = UDim2.new(0.5, 0, 0.08, 10)
	})
end
t:Init()
return t