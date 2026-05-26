-- https://lua.expert/
game:GetService("Players")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local BaseCharacterController = require(script.Parent:WaitForChild("BaseCharacterController"))
local v1 = setmetatable({}, BaseCharacterController)
v1.__index = v1
function v1.new() --[[ new | Line: 16 | Upvalues: BaseCharacterController (copy), v1 (copy) ]]
	local v3 = setmetatable(BaseCharacterController.new(), v1)
	v3.isFollowStick = false
	v3.thumbstickFrame = nil
	v3.moveTouchObject = nil
	v3.onTouchMovedConn = nil
	v3.onTouchEndedConn = nil
	v3.screenPos = nil
	v3.stickImage = nil
	v3.thumbstickSize = nil
	return v3
end
function v1.Enable(p1, p2, p3) --[[ Enable | Line: 31 ]]
	if p2 == nil then
		return false
	end
	local v1 = if p2 then true else false
	if p1.enabled == v1 then
		return true
	end
	p1.moveVector = Vector3.new(0, 0, 0)
	p1.isJumping = false
	if v1 then
		if not p1.thumbstickFrame then
			p1:Create(p3)
		end
		p1.thumbstickFrame.Visible = true
	else
		p1.thumbstickFrame.Visible = false
		p1:OnInputEnded()
	end
	p1.enabled = v1
end
function v1.OnInputEnded(p1) --[[ OnInputEnded | Line: 52 ]]
	p1.thumbstickFrame.Position = p1.screenPos
	p1.stickImage.Position = UDim2.new(0, p1.thumbstickFrame.Size.X.Offset / 2 - p1.thumbstickSize / 4, 0, p1.thumbstickFrame.Size.Y.Offset / 2 - p1.thumbstickSize / 4)
	p1.moveVector = Vector3.new(0, 0, 0)
	p1.isJumping = false
	p1.thumbstickFrame.Position = p1.screenPos
	p1.moveTouchObject = nil
end
function v1.Create(p1, p2) --[[ Create | Line: 61 | Upvalues: UserInputService (copy), GuiService (copy) ]]
	if p1.thumbstickFrame then
		p1.thumbstickFrame:Destroy()
		p1.thumbstickFrame = nil
		if p1.onTouchMovedConn then
			p1.onTouchMovedConn:Disconnect()
			p1.onTouchMovedConn = nil
		end
		if p1.onTouchEndedConn then
			p1.onTouchEndedConn:Disconnect()
			p1.onTouchEndedConn = nil
		end
	end
	local v1 = if math.min(p2.AbsoluteSize.x, p2.AbsoluteSize.y) <= 500 then true else false
	p1.thumbstickSize = if v1 then 70 else 120
	p1.screenPos = v1 and UDim2.new(0, p1.thumbstickSize / 2 - 10, 1, -p1.thumbstickSize - 20) or UDim2.new(0, p1.thumbstickSize / 2, 1, -p1.thumbstickSize * 1.75)
	p1.thumbstickFrame = Instance.new("Frame")
	p1.thumbstickFrame.Name = "ThumbstickFrame"
	p1.thumbstickFrame.Active = true
	p1.thumbstickFrame.Visible = false
	p1.thumbstickFrame.Size = UDim2.new(0, p1.thumbstickSize, 0, p1.thumbstickSize)
	p1.thumbstickFrame.Position = p1.screenPos
	p1.thumbstickFrame.BackgroundTransparency = 1
	local OuterImage = Instance.new("ImageLabel")
	OuterImage.Name = "OuterImage"
	OuterImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
	OuterImage.ImageRectOffset = Vector2.new()
	OuterImage.ImageRectSize = Vector2.new(220, 220)
	OuterImage.BackgroundTransparency = 1
	OuterImage.Size = UDim2.new(0, p1.thumbstickSize, 0, p1.thumbstickSize)
	OuterImage.Position = UDim2.new(0, 0, 0, 0)
	OuterImage.Parent = p1.thumbstickFrame
	p1.stickImage = Instance.new("ImageLabel")
	p1.stickImage.Name = "StickImage"
	p1.stickImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
	p1.stickImage.ImageRectOffset = Vector2.new(220, 0)
	p1.stickImage.ImageRectSize = Vector2.new(111, 111)
	p1.stickImage.BackgroundTransparency = 1
	p1.stickImage.Size = UDim2.new(0, p1.thumbstickSize / 2, 0, p1.thumbstickSize / 2)
	p1.stickImage.Position = UDim2.new(0, p1.thumbstickSize / 2 - p1.thumbstickSize / 4, 0, p1.thumbstickSize / 2 - p1.thumbstickSize / 4)
	p1.stickImage.ZIndex = 2
	p1.stickImage.Parent = p1.thumbstickFrame
	local v4 = nil
	local function DoMove(p12) --[[ DoMove | Line: 114 | Upvalues: p1 (copy) ]]
		local v1 = p12 / (p1.thumbstickSize / 2)
		local magnitude = v1.magnitude
		local v2
		if magnitude < 0.05 then
			v2 = Vector3.new()
		else
			local v4 = v1.unit * ((magnitude - 0.05) / 0.95)
			v2 = Vector3.new(v4.x, 0, v4.y)
		end
		p1.moveVector = v2
	end
	local function MoveStick(p12) --[[ MoveStick | Line: 132 | Upvalues: v4 (ref), p1 (copy) ]]
		local v1 = Vector2.new(p12.x - v4.x, p12.y - v4.y)
		local magnitude = v1.magnitude
		local v2 = p1.thumbstickFrame.AbsoluteSize.x / 2
		if p1.isFollowStick and v2 < magnitude then
			local v3 = v1.unit * v2
			p1.thumbstickFrame.Position = UDim2.new(0, p12.x - p1.thumbstickFrame.AbsoluteSize.x / 2 - v3.x, 0, p12.y - p1.thumbstickFrame.AbsoluteSize.y / 2 - v3.y)
		else
			v1 = v1.unit * math.min(magnitude, v2)
		end
		p1.stickImage.Position = UDim2.new(0, v1.x + p1.stickImage.AbsoluteSize.x / 2, 0, v1.y + p1.stickImage.AbsoluteSize.y / 2)
	end
	p1.thumbstickFrame.InputBegan:Connect(function(p12) --[[ Line: 149 | Upvalues: p1 (copy), v4 (ref) ]]
		if not p1.moveTouchObject and (p12.UserInputType == Enum.UserInputType.Touch and p12.UserInputState == Enum.UserInputState.Begin) then
			p1.moveTouchObject = p12
			p1.thumbstickFrame.Position = UDim2.new(0, p12.Position.x - p1.thumbstickFrame.Size.X.Offset / 2, 0, p12.Position.y - p1.thumbstickFrame.Size.Y.Offset / 2)
			v4 = Vector2.new(p1.thumbstickFrame.AbsolutePosition.x + p1.thumbstickFrame.AbsoluteSize.x / 2, p1.thumbstickFrame.AbsolutePosition.y + p1.thumbstickFrame.AbsoluteSize.y / 2)
			Vector2.new(p12.Position.x - v4.x, p12.Position.y - v4.y)
		end
	end)
	p1.onTouchMovedConn = UserInputService.TouchMoved:Connect(function(p12, p2) --[[ Line: 164 | Upvalues: p1 (copy), v4 (ref), MoveStick (copy) ]]
		if p12 ~= p1.moveTouchObject then
			return
		end
		v4 = Vector2.new(p1.thumbstickFrame.AbsolutePosition.x + p1.thumbstickFrame.AbsoluteSize.x / 2, p1.thumbstickFrame.AbsolutePosition.y + p1.thumbstickFrame.AbsoluteSize.y / 2)
		local v1 = Vector2.new(p12.Position.x - v4.x, p12.Position.y - v4.y) / (p1.thumbstickSize / 2)
		local magnitude = v1.magnitude
		local v2
		if magnitude < 0.05 then
			v2 = Vector3.new()
		else
			local v42 = v1.unit * ((magnitude - 0.05) / 0.95)
			v2 = Vector3.new(v42.x, 0, v42.y)
		end
		p1.moveVector = v2
		MoveStick(p12.Position)
	end)
	p1.onTouchEndedConn = UserInputService.TouchEnded:Connect(function(p12, p2) --[[ Line: 174 | Upvalues: p1 (copy) ]]
		if p12 ~= p1.moveTouchObject then
			return
		end
		p1:OnInputEnded()
	end)
	GuiService.MenuOpened:Connect(function() --[[ Line: 180 | Upvalues: p1 (copy) ]]
		if not p1.moveTouchObject then
			return
		end
		p1:OnInputEnded()
	end)
	p1.thumbstickFrame.Parent = p2
end
return v1