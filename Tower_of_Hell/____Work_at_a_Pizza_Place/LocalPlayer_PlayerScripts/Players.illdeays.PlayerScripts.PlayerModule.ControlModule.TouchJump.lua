-- https://lua.expert/
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"))
local UserUpdateTouchJump3 = FlagUtil.getUserFlag("UserUpdateTouchJump3")
local UserControlModuleEnableIdempotent = FlagUtil.getUserFlag("UserControlModuleEnableIdempotent")
local v1, v2
if UserUpdateTouchJump3 then
	v1 = require(CommonUtils:WaitForChild("ConnectionUtil"))
	v2 = require(CommonUtils:WaitForChild("CharacterUtil"))
else
	v1 = nil
	v2 = nil
end
local t = {
	HUMANOID_STATE_ENABLED_CHANGED = "HUMANOID_STATE_ENABLED_CHANGED",
	HUMANOID_JUMP_POWER = "HUMANOID_JUMP_POWER",
	HUMANOID = "HUMANOID",
	JUMP_INPUT_ENDED = "JUMP_INPUT_ENDED",
	MENU_OPENED = "MENU_OPENED"
}
local BaseCharacterController = require(script.Parent:WaitForChild("BaseCharacterController"))
local v3 = setmetatable({}, BaseCharacterController)
v3.__index = v3
function v3.new() --[[ new | Line: 57 | Upvalues: BaseCharacterController (copy), v3 (copy), UserUpdateTouchJump3 (copy), v1 (ref) ]]
	local v32 = setmetatable(BaseCharacterController.new(), v3)
	v32.parentUIFrame = nil
	v32.jumpButton = nil
	if not UserUpdateTouchJump3 then
		v32.characterAddedConn = nil
		v32.humanoidStateEnabledChangedConn = nil
		v32.humanoidJumpPowerConn = nil
		v32.humanoidParentConn = nil
		v32.jumpPower = 0
		v32.jumpStateEnabled = true
		v32.humanoid = nil
	end
	v32.externallyEnabled = false
	v32.isJumping = false
	if UserUpdateTouchJump3 then
		v32._active = false
		v32._connectionUtil = v1.new()
	end
	return v32
end
if UserUpdateTouchJump3 then
	function v3._reset(p1) --[[ _reset | Line: 84 ]]
		p1.isJumping = false
		p1.touchObject = nil
		if not p1.jumpButton then
			return
		end
		p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
	end
end
function v3.EnableButton(p1, p2) --[[ EnableButton | Line: 95 | Upvalues: UserUpdateTouchJump3 (copy), t (copy), GuiService (copy), Players (copy) ]]
	if UserUpdateTouchJump3 then
		if p2 == p1._active then
			p1:_reset()
			return
		end
		if p2 then
			if not p1.jumpButton then
				p1:Create()
			end
			p1.jumpButton.Visible = true
			p1._connectionUtil:trackConnection(t.JUMP_INPUT_ENDED, p1.jumpButton.InputEnded:Connect(function(p12) --[[ Line: 112 | Upvalues: p1 (copy) ]]
				if p12 ~= p1.touchObject then
					return
				end
				p1:_reset()
			end))
			p1._connectionUtil:trackConnection(t.MENU_OPENED, GuiService.MenuOpened:Connect(function() --[[ Line: 122 | Upvalues: p1 (copy) ]]
				if not p1.touchObject then
					return
				end
				p1:_reset()
			end))
		else
			if p1.jumpButton then
				p1.jumpButton.Visible = false
			end
			p1._connectionUtil:disconnect(t.JUMP_INPUT_ENDED)
			p1._connectionUtil:disconnect(t.MENU_OPENED)
		end
		p1:_reset()
		p1._active = p2
	elseif p2 then
		if not p1.jumpButton then
			p1:Create()
		end
		local v1 = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if v1 and (p1.externallyEnabled and (p1.externallyEnabled and v1.JumpPower > 0)) then
			p1.jumpButton.Visible = true
		end
	else
		p1.jumpButton.Visible = false
		p1.touchObject = nil
		p1.isJumping = false
		p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
	end
end
function v3.UpdateEnabled(p1) --[[ UpdateEnabled | Line: 159 | Upvalues: UserUpdateTouchJump3 (copy), v2 (ref) ]]
	if UserUpdateTouchJump3 then
		local v1 = v2.getChild("Humanoid", "Humanoid")
		if v1 and (p1.externallyEnabled and (v1.JumpPower > 0 and v1:GetStateEnabled(Enum.HumanoidStateType.Jumping))) then
			p1:EnableButton(true)
			return
		end
	elseif p1.jumpPower > 0 and p1.jumpStateEnabled then
		p1:EnableButton(true)
		return
	end
	p1:EnableButton(false)
end
if UserUpdateTouchJump3 then
	function v3._setupConfigurations(p1) --[[ _setupConfigurations | Line: 177 | Upvalues: v2 (ref), t (copy) ]]
		local function update() --[[ update | Line: 178 | Upvalues: p1 (copy) ]]
			p1:UpdateEnabled()
		end
		local v1 = v2.onChild("Humanoid", "Humanoid", function(p12) --[[ Line: 183 | Upvalues: p1 (copy), t (ref), update (copy) ]]
			p1:UpdateEnabled()
			p1._connectionUtil:trackConnection(t.HUMANOID_JUMP_POWER, p12:GetPropertyChangedSignal("JumpPower"):Connect(update))
			p1._connectionUtil:trackConnection(t.HUMANOID_STATE_ENABLED_CHANGED, p12.StateEnabledChanged:Connect(function(p12, p2) --[[ Line: 191 | Upvalues: p1 (ref) ]]
				if p12 ~= Enum.HumanoidStateType.Jumping or p2 == p1._active then
					return
				end
				p1:UpdateEnabled()
			end))
		end)
		p1._connectionUtil:trackConnection(t.HUMANOID, v1)
	end
end
if not UserUpdateTouchJump3 then
	function v3.HumanoidChanged(p1, p2) --[[ HumanoidChanged | Line: 205 | Upvalues: Players (copy) ]]
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
	function v3.HumanoidStateEnabledChanged(p1, p2, p3) --[[ HumanoidStateEnabledChanged | Line: 220 ]]
		if p2 ~= Enum.HumanoidStateType.Jumping then
			return
		end
		p1.jumpStateEnabled = p3
		p1:UpdateEnabled()
	end
	function v3.CharacterAdded(p1, p2) --[[ CharacterAdded | Line: 227 ]]
		if p1.humanoidChangeConn then
			p1.humanoidChangeConn:Disconnect()
			p1.humanoidChangeConn = nil
		end
		p1.humanoid = p2:FindFirstChildOfClass("Humanoid")
		while not p1.humanoid do
			p2.ChildAdded:wait()
			p1.humanoid = p2:FindFirstChildOfClass("Humanoid")
		end
		p1.humanoidJumpPowerConn = p1.humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function() --[[ Line: 239 | Upvalues: p1 (copy) ]]
			p1.jumpPower = p1.humanoid.JumpPower
			p1:UpdateEnabled()
		end)
		p1.humanoidParentConn = p1.humanoid:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 244 | Upvalues: p1 (copy) ]]
			if p1.humanoid.Parent then
				return
			end
			p1.humanoidJumpPowerConn:Disconnect()
			p1.humanoidJumpPowerConn = nil
			p1.humanoidParentConn:Disconnect()
			p1.humanoidParentConn = nil
		end)
		p1.humanoidStateEnabledChangedConn = p1.humanoid.StateEnabledChanged:Connect(function(p12, p2) --[[ Line: 253 | Upvalues: p1 (copy) ]]
			p1:HumanoidStateEnabledChanged(p12, p2)
		end)
		p1.jumpPower = p1.humanoid.JumpPower
		p1.jumpStateEnabled = p1.humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping)
		p1:UpdateEnabled()
	end
	function v3.SetupCharacterAddedFunction(p1) --[[ SetupCharacterAddedFunction | Line: 262 | Upvalues: Players (copy) ]]
		p1.characterAddedConn = Players.LocalPlayer.CharacterAdded:Connect(function(p12) --[[ Line: 263 | Upvalues: p1 (copy) ]]
			p1:CharacterAdded(p12)
		end)
		if not Players.LocalPlayer.Character then
			return
		end
		p1:CharacterAdded(Players.LocalPlayer.Character)
	end
end
function v3.Enable(p1, p2, p3) --[[ Enable | Line: 272 | Upvalues: UserControlModuleEnableIdempotent (copy), UserUpdateTouchJump3 (copy) ]]
	if p3 then
		p1.parentUIFrame = p3
	end
	if UserControlModuleEnableIdempotent and p1.externallyEnabled == p2 then
		return
	end
	p1.externallyEnabled = p2
	if not UserUpdateTouchJump3 then
		p1:EnableButton(p2)
		return
	end
	p1:UpdateEnabled()
	if p2 then
		p1:_setupConfigurations()
	else
		p1._connectionUtil:disconnectAll()
	end
end
function v3.Create(p1) --[[ Create | Line: 293 | Upvalues: UserUpdateTouchJump3 (copy), GuiService (copy) ]]
	if not p1.parentUIFrame then
		return
	end
	if p1.jumpButton then
		p1.jumpButton:Destroy()
		p1.jumpButton = nil
	end
	if p1.absoluteSizeChangedConn then
		p1.absoluteSizeChangedConn:Disconnect()
		p1.absoluteSizeChangedConn = nil
	end
	p1.jumpButton = Instance.new("ImageButton")
	p1.jumpButton.Name = "JumpButton"
	p1.jumpButton.Visible = false
	p1.jumpButton.BackgroundTransparency = 1
	p1.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
	p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
	p1.jumpButton.ImageRectSize = Vector2.new(144, 144)
	local function ResizeJumpButton() --[[ ResizeJumpButton | Line: 316 | Upvalues: p1 (copy) ]]
		local v1 = math.min(p1.parentUIFrame.AbsoluteSize.x, p1.parentUIFrame.AbsoluteSize.y) <= 500
		local v2 = if v1 then 70 else 120
		p1.jumpButton.Size = UDim2.new(0, v2, 0, v2)
		p1.jumpButton.Position = v1 and UDim2.new(1, -(v2 * 1.5 - 10), 1, -v2 - 20) or UDim2.new(1, -(v2 * 1.5 - 10), 1, -v2 * 1.75)
	end
	ResizeJumpButton()
	p1.absoluteSizeChangedConn = p1.parentUIFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(ResizeJumpButton)
	p1.touchObject = nil
	p1.jumpButton.InputBegan:connect(function(p12) --[[ Line: 330 | Upvalues: p1 (copy) ]]
		if not p1.touchObject and (p12.UserInputType == Enum.UserInputType.Touch and p12.UserInputState == Enum.UserInputState.Begin) then
			p1.touchObject = p12
			p1.jumpButton.ImageRectOffset = Vector2.new(146, 146)
			p1.isJumping = true
		end
	end)
	if not UserUpdateTouchJump3 then
		p1.jumpButton.InputEnded:connect(function(p12) --[[ Line: 350 | Upvalues: p1 (copy) ]]
			if p12 ~= p1.touchObject then
				return
			end
			p1.touchObject = nil
			p1.isJumping = false
			p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
		end)
		GuiService.MenuOpened:connect(function() --[[ Line: 356 | Upvalues: p1 (copy) ]]
			if not p1.touchObject then
				return
			end
			p1.touchObject = nil
			p1.isJumping = false
			p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
		end)
		if not p1.characterAddedConn then
			p1:SetupCharacterAddedFunction()
		end
	end
	p1.jumpButton.Parent = p1.parentUIFrame
end
return v3