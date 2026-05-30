-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Success = script.Parent.Success
local Alert = script.Parent.Alert
local Size = Alert.Size
local Notifies = script.Parent.Notifies
local v1 = 0
function alert(p1, p2) --[[ alert | Line: 10 | Upvalues: v1 (ref), TweenService (copy), Alert (copy), Success (copy), Size (copy) ]]
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
	if Success.Visible then
		Success.Visible = false
	end
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
function notify(p1, p2, p3) --[[ notify | Line: 44 | Upvalues: Notifies (copy), TweenService (copy) ]]
	if not p3 then
		p3 = 3
	end
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
	task.wait(p3)
	local v4 = TweenService:Create(v2, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 0, 0, 0)
	})
	v4:Play()
	v4.Completed:Wait()
	v2:Destroy()
end
function success(p1, p2) --[[ success | Line: 70 | Upvalues: v1 (ref), TweenService (copy), Success (copy), Alert (copy), Size (copy) ]]
	local v12 = tick()
	v1 = v12
	local v2 = TweenService:Create(Success, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		TextTransparency = 0
	})
	local v3 = TweenService:Create(Success.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Transparency = 0
	})
	v2:Play()
	v3:Play()
	if Alert.Visible then
		Alert.Visible = false
	end
	Success.Text = p1
	Success.TextColor3 = if p2 then p2 else Color3.fromRGB(0, 255, 127)
	Success.Size = UDim2.new(0, 0, 0, 0)
	Success.TextTransparency = 0
	Success.UIStroke.Transparency = 0
	Success.Visible = true
	TweenService:Create(Success, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = Size
	}):Play()
	task.wait(2)
	if v12 == v12 then
		local v6 = TweenService:Create(Success, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			TextTransparency = 1
		})
		local v7 = TweenService:Create(Success.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Transparency = 1
		})
		v6:Play()
		v7:Play()
	end
end
ReplicatedStorage.Remotes.Misc.Alert.OnClientEvent:Connect(alert)
ReplicatedStorage.Remotes.Misc.Alert.Bindable.Event:Connect(alert)
ReplicatedStorage.Remotes.Misc.Notify.OnClientEvent:Connect(notify)
ReplicatedStorage.Remotes.Misc.Success.OnClientEvent:Connect(success)