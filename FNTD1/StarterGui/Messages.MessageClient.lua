-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Alert = script.Parent.Alert
local Size = Alert.Size
local Notifies = script.Parent.Notifies
local v1 = 0
function alert(p1, p2) --[[ alert | Line: 9 | Upvalues: v1 (ref), TweenService (copy), Alert (copy), Size (copy) ]]
	local v12 = tick()
	v1 = v12
	local v2 = TweenService:Create(Alert, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		TextTransparency = 0
	})
	local v3 = TweenService:Create(Alert.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Transparency = 0
	})
	v2:Play()
	v3:Play()
	Alert.Text = p1
	Alert.TextColor3 = if p2 then p2 else Color3.fromRGB(255, 10, 14)
	Alert.Size = UDim2.new(0, 0, 0, 0)
	Alert.TextTransparency = 0
	Alert.UIStroke.Transparency = 0
	Alert.Visible = true
	TweenService:Create(Alert, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = Size
	}):Play()
	task.wait(2)
	if v12 == v12 then
		local v6 = TweenService:Create(Alert, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			TextTransparency = 1
		})
		local v7 = TweenService:Create(Alert.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Transparency = 1
		})
		v6:Play()
		v7:Play()
	end
end
function notify(p1, p2) --[[ notify | Line: 39 | Upvalues: Notifies (copy), TweenService (copy) ]]
	if not p2 then
		p2 = Color3.fromRGB(255, 255, 255)
	end
	local v2 = Notifies.Example:Clone()
	v2.Size = UDim2.new(0, 0, 0, 0)
	v2.Message.Text = p1
	v2.Message.TextColor3 = p2
	v2.Visible = true
	v2.Parent = Notifies
	local v3 = TweenService:Create(v2, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = Notifies.Example.Size
	})
	v3:Play()
	v3.Completed:Wait()
	task.wait(3)
	local v4 = TweenService:Create(v2, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 0, 0, 0)
	})
	v4:Play()
	v4.Completed:Wait()
	v2:Destroy()
end
ReplicatedStorage.Remotes.Misc.Alert.OnClientEvent:Connect(alert)
ReplicatedStorage.Remotes.Misc.Alert.Bindable.Event:Connect(alert)
ReplicatedStorage.Remotes.Misc.Notify.OnClientEvent:Connect(notify)