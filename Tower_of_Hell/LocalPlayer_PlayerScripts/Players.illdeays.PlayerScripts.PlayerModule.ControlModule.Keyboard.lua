-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local BaseCharacterController = require(script.Parent:WaitForChild("BaseCharacterController"))
local v1 = setmetatable({}, BaseCharacterController)
v1.__index = v1
function v1.new(p1) --[[ new | Line: 20 | Upvalues: BaseCharacterController (copy), v1 (copy) ]]
	local v3 = setmetatable(BaseCharacterController.new(), v1)
	v3.CONTROL_ACTION_PRIORITY = p1
	v3.textFocusReleasedConn = nil
	v3.textFocusGainedConn = nil
	v3.windowFocusReleasedConn = nil
	v3.forwardValue = 0
	v3.backwardValue = 0
	v3.leftValue = 0
	v3.rightValue = 0
	v3.jumpEnabled = true
	return v3
end
function v1.Enable(p1, p2) --[[ Enable | Line: 39 | Upvalues: UserInputService (copy) ]]
	if not UserInputService.KeyboardEnabled then
		return false
	end
	if p2 == p1.enabled then
		return true
	end
	p1.forwardValue = 0
	p1.backwardValue = 0
	p1.leftValue = 0
	p1.rightValue = 0
	p1.moveVector = Vector3.new(0, 0, 0)
	p1.jumpRequested = false
	p1:UpdateJump()
	if p2 then
		p1:BindContextActions()
		p1:ConnectFocusEventListeners()
	else
		p1:UnbindContextActions()
		p1:DisconnectFocusEventListeners()
	end
	p1.enabled = p2
	return true
end
function v1.UpdateMovement(p1, p2) --[[ UpdateMovement | Line: 71 ]]
	if p2 == Enum.UserInputState.Cancel then
		p1.moveVector = Vector3.new(0, 0, 0)
	else
		p1.moveVector = Vector3.new(p1.leftValue + p1.rightValue, 0, p1.forwardValue + p1.backwardValue)
	end
end
function v1.UpdateJump(p1) --[[ UpdateJump | Line: 79 ]]
	p1.isJumping = p1.jumpRequested
end
function v1.BindContextActions(p1) --[[ BindContextActions | Line: 83 | Upvalues: ContextActionService (copy) ]]
	ContextActionService:BindActionAtPriority("moveForwardAction", function(p12, p2, p3) --[[ Line: 89 | Upvalues: p1 (copy) ]]
		p1.forwardValue = if p2 == Enum.UserInputState.Begin then -1 else 0
		p1:UpdateMovement(p2)
		return Enum.ContextActionResult.Pass
	end, false, p1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterForward)
	ContextActionService:BindActionAtPriority("moveBackwardAction", function(p12, p2, p3) --[[ Line: 95 | Upvalues: p1 (copy) ]]
		p1.backwardValue = if p2 == Enum.UserInputState.Begin then 1 else 0
		p1:UpdateMovement(p2)
		return Enum.ContextActionResult.Pass
	end, false, p1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterBackward)
	ContextActionService:BindActionAtPriority("moveLeftAction", function(p12, p2, p3) --[[ Line: 101 | Upvalues: p1 (copy) ]]
		p1.leftValue = if p2 == Enum.UserInputState.Begin then -1 else 0
		p1:UpdateMovement(p2)
		return Enum.ContextActionResult.Pass
	end, false, p1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterLeft)
	ContextActionService:BindActionAtPriority("moveRightAction", function(p12, p2, p3) --[[ Line: 107 | Upvalues: p1 (copy) ]]
		p1.rightValue = if p2 == Enum.UserInputState.Begin then 1 else 0
		p1:UpdateMovement(p2)
		return Enum.ContextActionResult.Pass
	end, false, p1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterRight)
	ContextActionService:BindActionAtPriority("jumpAction", function(p12, p2, p3) --[[ Line: 113 | Upvalues: p1 (copy) ]]
		p1.jumpRequested = p1.jumpEnabled and p2 == Enum.UserInputState.Begin
		p1:UpdateJump()
		return Enum.ContextActionResult.Pass
	end, false, p1.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterJump)
end
function v1.UnbindContextActions(p1) --[[ UnbindContextActions | Line: 133 | Upvalues: ContextActionService (copy) ]]
	ContextActionService:UnbindAction("moveForwardAction")
	ContextActionService:UnbindAction("moveBackwardAction")
	ContextActionService:UnbindAction("moveLeftAction")
	ContextActionService:UnbindAction("moveRightAction")
	ContextActionService:UnbindAction("jumpAction")
end
function v1.ConnectFocusEventListeners(p1) --[[ ConnectFocusEventListeners | Line: 141 | Upvalues: UserInputService (copy) ]]
	local function onFocusReleased() --[[ onFocusReleased | Line: 142 | Upvalues: p1 (copy) ]]
		p1.moveVector = Vector3.new(0, 0, 0)
		p1.forwardValue = 0
		p1.backwardValue = 0
		p1.leftValue = 0
		p1.rightValue = 0
		p1.jumpRequested = false
		p1:UpdateJump()
	end
	local function onTextFocusGained(p12) --[[ onTextFocusGained | Line: 152 | Upvalues: p1 (copy) ]]
		p1.jumpRequested = false
		p1:UpdateJump()
	end
	p1.textFocusReleasedConn = UserInputService.TextBoxFocusReleased:Connect(onFocusReleased)
	p1.textFocusGainedConn = UserInputService.TextBoxFocused:Connect(onTextFocusGained)
	p1.windowFocusReleasedConn = UserInputService.WindowFocused:Connect(onFocusReleased)
end
function v1.DisconnectFocusEventListeners(p1) --[[ DisconnectFocusEventListeners | Line: 162 ]]
	if p1.textFocusReleasedConn then
		p1.textFocusReleasedConn:Disconnect()
		p1.textFocusReleasedConn = nil
	end
	if p1.textFocusGainedConn then
		p1.textFocusGainedConn:Disconnect()
		p1.textFocusGainedConn = nil
	end
	if not p1.windowFocusReleasedConn then
		return
	end
	p1.windowFocusReleasedConn:Disconnect()
	p1.windowFocusReleasedConn = nil
end
return v1