-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = game.Players.LocalPlayer
if UserInputService.PreferredInput == Enum.PreferredInput.Touch then
	local BottomLeftControl = Instance.new("Frame")
	BottomLeftControl.Name = "BottomLeftControl"
	BottomLeftControl.Size = UDim2.new(0.1, 0, 0.1, 0)
	BottomLeftControl.Position = UDim2.new(1, 0, 1, 0)
	BottomLeftControl.AnchorPoint = Vector2.new(1, 1)
	BottomLeftControl.BackgroundTransparency = 1
	BottomLeftControl.ZIndex = 10
	BottomLeftControl.Parent = script.Parent
	local MouseLockLabel = Instance.new("ImageButton")
	MouseLockLabel.Name = "MouseLockLabel"
	MouseLockLabel.Size = UDim2.new(1, 0, 1, 0)
	MouseLockLabel.Position = UDim2.new(0, 0, 0, 0)
	MouseLockLabel.BackgroundTransparency = 1
	MouseLockLabel.Image = "rbxasset://textures/ui/mouseLock_off.png"
	MouseLockLabel.Visible = true
	MouseLockLabel.Parent = BottomLeftControl
	local MiddleIcon = Instance.new("Frame")
	MiddleIcon.Name = "MiddleIcon"
	MiddleIcon.Size = UDim2.new(0.075, 0, 0.075, 0)
	MiddleIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
	MiddleIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	MiddleIcon.BackgroundTransparency = 1
	MiddleIcon.ZIndex = 10
	MiddleIcon.Visible = true
	MiddleIcon.Parent = script.Parent
	local MouseLockLabel_2 = Instance.new("ImageLabel")
	MouseLockLabel_2.Name = "MouseLockLabel"
	MouseLockLabel_2.Size = UDim2.new(1, 0, 1, 0)
	MouseLockLabel_2.Position = UDim2.new(0, 0, 0, 0)
	MouseLockLabel_2.BackgroundTransparency = 1
	MouseLockLabel_2.Image = "rbxasset://textures/MouseLockedCursor.png"
	MouseLockLabel_2.Visible = false
	MouseLockLabel_2.Parent = MiddleIcon
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.AspectRatio = 1
	UIAspectRatioConstraint.DominantAxis = "Height"
	UIAspectRatioConstraint.Parent = BottomLeftControl
	UIAspectRatioConstraint:Clone().Parent = MiddleIcon
	local v1 = false
	MouseLockLabel.Activated:connect(function() --[[ Line: 66 | Upvalues: v1 (ref), MouseLockLabel (copy), MouseLockLabel_2 (copy) ]]
		v1 = not v1
		MouseLockLabel.Image = if v1 then "rbxasset://textures/ui/mouseLock_on.png" else "rbxasset://textures/ui/mouseLock_off.png"
		MouseLockLabel_2.Visible = v1 and false
	end)
	local function OnStep() --[[ OnStep | Line: 74 | Upvalues: v1 (ref), LocalPlayer (copy) ]]
		if not v1 then
			return
		end
		local CurrentCamera = workspace.CurrentCamera
		if not CurrentCamera then
			return
		end
		local Character = LocalPlayer.Character
		local v12 = if Character then Character:FindFirstChild("Humanoid") else Character
		local v2 = if Character then Character:FindFirstChild("HumanoidRootPart") else Character
		local v3 = if Character then Character:FindFirstChild("Head") else Character
		if v12 and (v12.Health > 0 and v2) then
			local LookVector = CurrentCamera.CFrame.LookVector
			local v4 = CFrame.new(v2.Position)
			v2.CFrame = v4 * CFrame.Angles(0, math.atan2(-LookVector.X, -LookVector.Z), 0)
		end
		if not (v3 and (v3.Position - CurrentCamera.CFrame.Position).Magnitude >= 1) then
			return
		end
		CurrentCamera.CFrame = CurrentCamera.CFrame * CFrame.new(1.75, 0, 0)
	end
	RunService:BindToRenderStep("MobileShiftLock", Enum.RenderPriority.Camera.Value + 1, OnStep)
else
	task.wait(3)
	script.Parent:Destroy()
end