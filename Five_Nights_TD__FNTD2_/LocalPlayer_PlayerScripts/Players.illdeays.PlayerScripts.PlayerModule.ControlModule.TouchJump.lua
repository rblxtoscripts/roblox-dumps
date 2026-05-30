-- https://lua.expert/
game:GetService("Players")
local GuiService = game:GetService("GuiService")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local ConnectionUtil = require(CommonUtils:WaitForChild("ConnectionUtil"))
local CharacterUtil = require(CommonUtils:WaitForChild("CharacterUtil"))
local UserAllowAbilityControls = require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserAllowAbilityControls")
local v1 = if UserAllowAbilityControls then require(script.Parent:WaitForChild("AvatarAbilitiesInterface")) else nil
local t = { "rbxasset://textures/ui/Input/JumpButtonRegular.png", "rbxasset://textures/ui/Input/JumpButtonPressed.png" }
local BaseCharacterController = require(script.Parent:WaitForChild("BaseCharacterController"))
local v2 = setmetatable({}, BaseCharacterController)
v2.__index = v2
function v2.new() --[[ new | Line: 61 | Upvalues: BaseCharacterController (copy), v2 (copy), ConnectionUtil (copy) ]]
	local v3 = setmetatable(BaseCharacterController.new(), v2)
	v3.parentUIFrame = nil
	v3.jumpButton = nil
	v3.externallyEnabled = false
	v3.isJumping = false
	v3._active = false
	v3._connectionUtil = ConnectionUtil.new()
	return v3
end
function v2._reset(p1) --[[ _reset | Line: 75 | Upvalues: UserAllowAbilityControls (copy), v1 (ref), t (copy) ]]
	p1.isJumping = false
	p1.touchObject = nil
	if not p1.jumpButton then
		return
	end
	if UserAllowAbilityControls and v1.isEnabled() then
		p1.jumpButton.Image = t[1]
		return
	end
	p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
end
function v2.EnableButton(p1, p2) --[[ EnableButton | Line: 90 | Upvalues: GuiService (copy) ]]
	if p2 == p1._active then
		return
	end
	if p2 then
		if not p1.jumpButton then
			p1:Create()
		end
		p1.jumpButton.Visible = true
		p1._connectionUtil:trackConnection("JUMP_INPUT_ENDED", p1.jumpButton.InputEnded:Connect(function(p12) --[[ Line: 105 | Upvalues: p1 (copy) ]]
			if p12 ~= p1.touchObject then
				return
			end
			p1:_reset()
		end))
		p1._connectionUtil:trackConnection("MENU_OPENED", GuiService.MenuOpened:Connect(function() --[[ Line: 115 | Upvalues: p1 (copy) ]]
			if not p1.touchObject then
				return
			end
			p1:_reset()
		end))
	else
		if p1.jumpButton then
			p1.jumpButton.Visible = false
		end
		p1._connectionUtil:disconnect("JUMP_INPUT_ENDED")
		p1._connectionUtil:disconnect("MENU_OPENED")
	end
	p1:_reset()
	p1._active = p2
end
function v2.UpdateEnabled(p1) --[[ UpdateEnabled | Line: 132 | Upvalues: CharacterUtil (copy) ]]
	local v1 = CharacterUtil.getChild("Humanoid", "Humanoid")
	if v1 and p1.externallyEnabled then
		if not (v1.UseJumpPower and v1.JumpPower > 0) and (v1.UseJumpPower or not (v1.JumpHeight > 0)) then
			p1:EnableButton(false)
			return
		end
		if v1:GetStateEnabled(Enum.HumanoidStateType.Jumping) then
			p1:EnableButton(true)
			return
		end
	end
	p1:EnableButton(false)
end
function v2._setupConfigurations(p1) --[[ _setupConfigurations | Line: 141 | Upvalues: CharacterUtil (copy) ]]
	local function update() --[[ update | Line: 142 | Upvalues: p1 (copy) ]]
		p1:UpdateEnabled()
	end
	p1._connectionUtil:trackConnection("HUMANOID", (CharacterUtil.onChild("Humanoid", "Humanoid", function(p12) --[[ Line: 147 | Upvalues: p1 (copy), update (copy) ]]
		p1:UpdateEnabled()
		p1:_reset()
		p1._connectionUtil:trackConnection("HUMANOID_JUMP_POWER", p12:GetPropertyChangedSignal("JumpPower"):Connect(update))
		p1._connectionUtil:trackConnection("HUMANOID_JUMP_HEIGHT", p12:GetPropertyChangedSignal("JumpHeight"):Connect(update))
		p1._connectionUtil:trackConnection("HUMANOID_STATE_ENABLED_CHANGED", p12.StateEnabledChanged:Connect(function(p12, p2) --[[ Line: 160 | Upvalues: p1 (ref) ]]
			if p12 ~= Enum.HumanoidStateType.Jumping or p2 == p1._active then
				return
			end
			p1:UpdateEnabled()
		end))
	end)))
end
function v2.Enable(p1, p2, p3) --[[ Enable | Line: 172 ]]
	if p3 then
		p1.parentUIFrame = p3
	end
	if p1.externallyEnabled == p2 then
		return
	end
	p1.externallyEnabled = p2
	p1:UpdateEnabled()
	if p2 then
		p1:_setupConfigurations()
	else
		p1._connectionUtil:disconnectAll()
	end
end
function v2.Create(p1) --[[ Create | Line: 189 | Upvalues: UserAllowAbilityControls (copy), v1 (ref), t (copy) ]]
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
	if UserAllowAbilityControls and p1.avatarAbilitiesEnabledChangedConn then
		p1.avatarAbilitiesEnabledChangedConn:Disconnect()
		p1.avatarAbilitiesEnabledChangedConn = nil
	end
	p1.jumpButton = Instance.new("ImageButton")
	p1.jumpButton.Name = "JumpButton"
	p1.jumpButton.Visible = false
	p1.jumpButton.BackgroundTransparency = 1
	if UserAllowAbilityControls and v1.isEnabled() then
		p1.jumpButton.Image = t[1]
	else
		p1.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
		p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
		p1.jumpButton.ImageRectSize = Vector2.new(144, 144)
	end
	local function ResizeJumpButton() --[[ ResizeJumpButton | Line: 224 | Upvalues: p1 (copy), UserAllowAbilityControls (ref), v1 (ref), t (ref) ]]
		local v12 = math.min(p1.parentUIFrame.AbsoluteSize.x, p1.parentUIFrame.AbsoluteSize.y) <= 500
		if UserAllowAbilityControls and v1.isEnabled() then
			local v2 = if v12 then 72 else 120
			p1.jumpButton.Image = t[1]
			p1.jumpButton.ImageRectOffset = Vector2.new(0, 0)
			p1.jumpButton.ImageRectSize = Vector2.new(0, 0)
			p1.jumpButton.Size = UDim2.new(0, v2, 0, v2)
			p1.jumpButton.Position = UDim2.new(1, -v2 - (if v12 then 64 else 100), 1, -v2 - (if v12 then 64 else 112))
		else
			local v5 = if v12 then 70 else 120
			if UserAllowAbilityControls then
				p1.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
				p1.jumpButton.ImageRectOffset = Vector2.new(1, 146)
				p1.jumpButton.ImageRectSize = Vector2.new(144, 144)
			end
			p1.jumpButton.Size = UDim2.new(0, v5, 0, v5)
			p1.jumpButton.Position = v12 and UDim2.new(1, -(v5 * 1.5 - 10), 1, -v5 - 20) or UDim2.new(1, -(v5 * 1.5 - 10), 1, -v5 * 1.75)
		end
	end
	ResizeJumpButton()
	p1.absoluteSizeChangedConn = p1.parentUIFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(ResizeJumpButton)
	if UserAllowAbilityControls then
		p1.avatarAbilitiesEnabledChangedConn = v1.GetEnabledChangedSignal():Connect(ResizeJumpButton)
	end
	p1.touchObject = nil
	p1.jumpButton.InputBegan:connect(function(p12) --[[ Line: 262 | Upvalues: p1 (copy), UserAllowAbilityControls (ref), v1 (ref), t (ref) ]]
		if p1.touchObject or (p12.UserInputType ~= Enum.UserInputType.Touch or p12.UserInputState ~= Enum.UserInputState.Begin) then
			return
		end
		p1.touchObject = p12
		if UserAllowAbilityControls and v1.isEnabled() then
			p1.jumpButton.Image = t[2]
		else
			p1.jumpButton.ImageRectOffset = Vector2.new(146, 146)
		end
		p1.isJumping = true
	end)
	p1.jumpButton.Parent = p1.parentUIFrame
end
return v2