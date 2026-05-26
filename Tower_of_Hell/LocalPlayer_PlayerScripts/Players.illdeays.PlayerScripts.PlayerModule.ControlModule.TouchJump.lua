-- https://lua.expert/
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local BaseCharacterController = require(script.Parent:WaitForChild("BaseCharacterController"))
local v1 = setmetatable({}, BaseCharacterController)
v1.__index = v1
function v1.new() --[[ new | Line: 20 | Upvalues: BaseCharacterController (copy), v1 (copy) ]]
	local v3 = setmetatable(BaseCharacterController.new(), v1)
	v3.parentUIFrame = nil
	v3.jumpButton = nil
	v3.characterAddedConn = nil
	v3.humanoidStateEnabledChangedConn = nil
	v3.humanoidJumpPowerConn = nil
	v3.humanoidParentConn = nil
	v3.externallyEnabled = false
	v3.jumpPower = 0
	v3.jumpStateEnabled = true
	v3.isJumping = false
	v3.humanoid = nil
	return v3
end
function v1.EnableButton(p1, p2) --[[ EnableButton | Line: 38 | Upvalues: Players (copy) ]]
	if p2 then
		if not p1.jumpButton then
			p1:Create()
		end
		local v1 = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if v1 and (p1.externallyEnabled and (p1.externallyEnabled and v1.JumpPower > 0)) then
			p1.jumpButton.Visible = true
		end
	else
		p1.jumpButton.Visible = false
		p1.isJumping = false
		p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
	end
end
function v1.UpdateEnabled(p1) --[[ UpdateEnabled | Line: 58 ]]
	if p1.jumpPower > 0 and p1.jumpStateEnabled then
		p1:EnableButton(true)
		return
	end
	p1:EnableButton(false)
end
function v1.HumanoidChanged(p1, p2) --[[ HumanoidChanged | Line: 66 | Upvalues: Players (copy) ]]
	local v1 = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if not v1 then
		return
	end
	if p2 == "JumpPower" then
		p1.jumpPower = v1.JumpPower
		p1:UpdateEnabled()
		return
	end
	if p2 ~= "Parent" or v1.Parent then
		return
	end
	p1.humanoidChangeConn:Disconnect()
end
function v1.HumanoidStateEnabledChanged(p1, p2, p3) --[[ HumanoidStateEnabledChanged | Line: 80 ]]
	if p2 ~= Enum.HumanoidStateType.Jumping then
		return
	end
	p1.jumpStateEnabled = p3
	p1:UpdateEnabled()
end
function v1.CharacterAdded(p1, p2) --[[ CharacterAdded | Line: 87 ]]
	if p1.humanoidChangeConn then
		p1.humanoidChangeConn:Disconnect()
		p1.humanoidChangeConn = nil
	end
	p1.humanoid = p2:FindFirstChildOfClass("Humanoid")
	while not p1.humanoid do
		p2.ChildAdded:wait()
		p1.humanoid = p2:FindFirstChildOfClass("Humanoid")
	end
	p1.humanoidJumpPowerConn = p1.humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function() --[[ Line: 99 | Upvalues: p1 (copy) ]]
		p1.jumpPower = p1.humanoid.JumpPower
		p1:UpdateEnabled()
	end)
	p1.humanoidParentConn = p1.humanoid:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 104 | Upvalues: p1 (copy) ]]
		if p1.humanoid.Parent then
			return
		end
		p1.humanoidJumpPowerConn:Disconnect()
		p1.humanoidJumpPowerConn = nil
		p1.humanoidParentConn:Disconnect()
		p1.humanoidParentConn = nil
	end)
	p1.humanoidStateEnabledChangedConn = p1.humanoid.StateEnabledChanged:Connect(function(p12, p2) --[[ Line: 113 | Upvalues: p1 (copy) ]]
		p1:HumanoidStateEnabledChanged(p12, p2)
	end)
	p1.jumpPower = p1.humanoid.JumpPower
	p1.jumpStateEnabled = p1.humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping)
	p1:UpdateEnabled()
end
function v1.SetupCharacterAddedFunction(p1) --[[ SetupCharacterAddedFunction | Line: 122 | Upvalues: Players (copy) ]]
	p1.characterAddedConn = Players.LocalPlayer.CharacterAdded:Connect(function(p12) --[[ Line: 123 | Upvalues: p1 (copy) ]]
		p1:CharacterAdded(p12)
	end)
	if not Players.LocalPlayer.Character then
		return
	end
	p1:CharacterAdded(Players.LocalPlayer.Character)
end
function v1.Enable(p1, p2, p3) --[[ Enable | Line: 131 ]]
	if p3 then
		p1.parentUIFrame = p3
	end
	p1.externallyEnabled = p2
	p1:EnableButton(p2)
end
function v1.Create(p1) --[[ Create | Line: 139 | Upvalues: GuiService (copy) ]]
	if not p1.parentUIFrame then
		return
	end
	if p1.jumpButton then
		p1.jumpButton:Destroy()
		p1.jumpButton = nil
	end
	local v1 = math.min(p1.parentUIFrame.AbsoluteSize.x, p1.parentUIFrame.AbsoluteSize.y) <= 500
	local v2 = if v1 then 70 else 120
	p1.jumpButton = Instance.new("ImageButton")
	p1.jumpButton.Name = "JumpButton"
	p1.jumpButton.Visible = false
	p1.jumpButton.BackgroundTransparency = 1
	p1.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
	p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
	p1.jumpButton.ImageRectSize = Vector2.new(144, 144)
	p1.jumpButton.Size = UDim2.new(0, v2, 0, v2)
	p1.jumpButton.Position = v1 and UDim2.new(1, -(v2 * 1.5 - 10), 1, -v2 - 20) or UDim2.new(1, -(v2 * 1.5 - 10), 1, -v2 * 1.75)
	local v4 = nil
	p1.jumpButton.InputBegan:connect(function(p12) --[[ Line: 166 | Upvalues: v4 (ref), p1 (copy) ]]
		if not v4 and (p12.UserInputType == Enum.UserInputType.Touch and p12.UserInputState == Enum.UserInputState.Begin) then
			v4 = p12
			p1.jumpButton.ImageRectOffset = Vector2.new(146, 146)
			p1.isJumping = true
		end
	end)
	p1.jumpButton.InputEnded:connect(function(p12) --[[ Line: 185 | Upvalues: v4 (ref), p1 (copy) ]]
		if p12 ~= v4 then
			return
		end
		v4 = nil
		p1.isJumping = false
		p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
	end)
	GuiService.MenuOpened:connect(function() --[[ Line: 191 | Upvalues: v4 (ref), p1 (copy) ]]
		if not v4 then
			return
		end
		v4 = nil
		p1.isJumping = false
		p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
	end)
	if not p1.characterAddedConn then
		p1:SetupCharacterAddedFunction()
	end
	p1.jumpButton.Parent = p1.parentUIFrame
end
return v1