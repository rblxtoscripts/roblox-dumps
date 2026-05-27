-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("RadialConstants")
local v2 = Sonar("Maid")
local v3 = Sonar("InputTypeDetector")
local TAU = v1.TAU
local EX_OFFSET = v1.EX_OFFSET
local t = {
	[Enum.KeyCode.ButtonA] = true
}
local t2 = {
	[Enum.UserInputType.MouseButton1] = true,
	[Enum.UserInputType.MouseMovement] = true,
	[Enum.UserInputType.Touch] = true
}
local t3 = {
	[Enum.UserInputType.MouseButton1] = true,
	[Enum.UserInputType.Touch] = true
}
local t4 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local v4 = Sonar("CreateRadial")
local t5 = {}
t5.__index = t5
t5.__type = "RadialMenu"
function t5.__tostring(p1) --[[ __tostring | Line: 105 | Upvalues: t5 (copy) ]]
	return t5.__type
end
function t5.new(p1, p2, p3, p4) --[[ new | Line: 111 | Upvalues: t5 (copy), v2 (copy), v4 (copy) ]]
	local v22 = setmetatable({}, t5)
	v22._Maid = v2.new()
	v22._ClickedBind = Instance.new("BindableEvent")
	v22._HoverBind = Instance.new("BindableEvent")
	v22._LastHoverIndex = nil
	v22.Frame = v4(p1, p2, p3, p4)
	v22.Rotation = p3
	v22.SubN = p1
	v22.Enabled = false
	v22.DeadZoneIn = 0.1
	v22.DeadZoneOut = (1 / 0)
	v22.Clicked = v22._ClickedBind.Event
	v22.Hover = v22._HoverBind.Event
	init(v22)
	v22:SetDialProps({
		ImageColor3 = Color3.new(0/255, 0/255, 0/255)
	})
	v22:SetRadialProps({
		ImageTransparency = 0.7,
		ImageColor3 = Color3.new(0/255, 0/255, 0/255)
	})
	return v22
end
function init(p1) --[[ init | Line: 141 | Upvalues: UserInputService (copy), t2 (copy), t4 (copy), RunService (copy), v3 (copy), EX_OFFSET (copy), TAU (copy) ]]
	local RadialDial = p1.Frame.RadialDial
	p1.InputType = Enum.UserInputType.MouseMovement
	p1._Maid:GiveTask(p1._ClickedBind)
	p1._Maid:GiveTask(p1._HoverBind)
	p1._Maid:GiveTask(UserInputService.LastInputTypeChanged:Connect(function(p12) --[[ Line: 149 | Upvalues: t2 (ref), t4 (ref), p1 (copy) ]]
		if not (t2[p12] or t4[p12]) then
			return
		end
		p1.InputType = p12
	end))
	p1.lTheta = 0
	for k, v in pairs(p1.Frame.Attach:GetChildren()) do
		local Click = v:FindFirstChild("Click")
		if Click then
			p1._Maid:GiveTask(Click.MouseButton1Up:Connect(function() --[[ Line: 160 | Upvalues: p1 (copy) ]]
				if not p1.Enabled then
					return
				end
				local v1 = p1:GetTheta(Enum.UserInputType.Touch, true)
				if not v1 then
					return
				end
				p1._ClickedBind:Fire(p1:PickIndex(v1))
			end))
		end
	end
	p1._Maid:GiveTask(RunService.RenderStepped:Connect(function(p12) --[[ Line: 185 | Upvalues: p1 (copy), v3 (ref), EX_OFFSET (ref), TAU (ref), RadialDial (copy) ]]
		if not p1.Enabled then
			return
		end
		if v3.IsMobileInputType() then
			return
		end
		local v1 = p1:GetTheta(p1.InputType)
		if not (v1 and p1:IsVisible()) then
			return
		end
		p1.lTheta = v1
		RadialDial.Rotation = math.deg((p1:GetRotation(math.deg(v1 - p1.Rotation + math.rad(p1.Frame.Rotation) + EX_OFFSET + 2 * TAU) % 360 / (360 / p1.SubN) + 0.5)))
		local v7 = p1:PickIndex(v1)
		if v7 == p1._LastHoverIndex then
			return
		end
		p1._HoverBind:Fire(p1._LastHoverIndex, v7)
		p1._LastHoverIndex = v7
	end))
end
function t5.SetRadialPropRotation(p1, p2) --[[ SetRadialPropRotation | Line: 212 | Upvalues: v3 (copy) ]]
	if not v3.IsMobileInputType() then
		local v1 = p1:GetThetaOfAttachment(p2)
		local v2 = tonumber(p2)
		p1.Frame.RadialDial.Rotation = math.deg((p1:GetRotation(p1:PickIndex(v1))))
		p1._HoverBind:Fire(p1._LastHoverIndex, v2)
		p1._LastHoverIndex = v2
	end
end
function t5.GetThetaOfAttachment(p1, p2) --[[ GetThetaOfAttachment | Line: 223 ]]
	local v1 = p1:GetAttachment(p2)
	local Frame = p1.Frame
	local v4 = (v1.AbsolutePosition - (Frame.AbsolutePosition + Frame.AbsoluteSize / 2)) / (Frame.AbsoluteSize.y / 2)
	return math.atan2(v4.y, -v4.x)
end
function t5.SetInputSinkButton(p1, p2) --[[ SetInputSinkButton | Line: 235 | Upvalues: UserInputService (copy), v3 (copy), t4 (copy), t (copy) ]]
	p1._Maid:GiveTask(UserInputService.InputBegan:Connect(function(p12) --[[ Line: 236 | Upvalues: p1 (copy), v3 (ref), t4 (ref), t (ref) ]]
		if not p1.Enabled then
			return
		end
		if v3.IsMobileInputType() then
			return
		end
		if not p1:IsVisible() then
			return
		end
		if not p1._LastHoverIndex then
			return
		end
		if t4[p12.UserInputType] then
			if not t[p12.KeyCode] then
				return
			end
			p1._ClickedBind:Fire(p1._LastHoverIndex)
		end
		if not p1:GetTheta(p12.UserInputType, true) then
			return
		end
		p1._ClickedBind:Fire(p1._LastHoverIndex)
	end))
end
function t5.SetRadialProps(p1, p2) --[[ SetRadialProps | Line: 262 ]]
	local v1 = next
	local v2, v3 = p1.Frame.Radial:GetChildren()
	for v4, v5 in v1, v2, v3 do
		for v6, v7 in next, p2 do
			v5[v6] = v7
		end
	end
end
function t5.SetDialProps(p1, p2) --[[ SetDialProps | Line: 270 ]]
	local RadialDial = p1.Frame.RadialDial
	for v1, v2 in next, p2 do
		RadialDial[v1] = v2
	end
end
function t5.GetTheta(p1, p2, p3, p4) --[[ GetTheta | Line: 277 | Upvalues: t3 (copy), t2 (copy), UserInputService (copy), t4 (copy) ]]
	local v1 = nil
	if (p3 and t3 or t2)[p2] then
		local Frame = p1.Frame
		v1 = (UserInputService:GetMouseLocation() + Vector2.new(0, -36) - (Frame.AbsolutePosition + Frame.AbsoluteSize / 2)) / (Frame.AbsoluteSize.y / 2)
	elseif t4[p2] then
		local v5 = UserInputService:GetGamepadState(p2)
		for v6, v7 in next, v5 do
			v5[v7.KeyCode] = v7
		end
		v1 = v5[Enum.KeyCode.Thumbstick1].Position * Vector3.new(1, -1, 1)
	end
	if not v1 then
		return
	end
	local Magnitude = v1.Magnitude
	if p1.DeadZoneIn <= Magnitude and Magnitude <= p1.DeadZoneOut then
		return math.atan2(v1.y, -v1.x)
	end
end
function t5.PickIndex(p1, p2) --[[ PickIndex | Line: 303 | Upvalues: EX_OFFSET (copy), TAU (copy) ]]
	return math.floor(math.deg(p2 - p1.Rotation + math.rad(p1.Frame.Rotation) + EX_OFFSET + 2 * TAU) % 360 / (360 / p1.SubN)) + 1
end
function t5.GetRotation(p1, p2) --[[ GetRotation | Line: 310 | Upvalues: TAU (copy) ]]
	return -TAU * ((p2 - 1) / p1.SubN)
end
function t5.GetRadial(p1, p2) --[[ GetRadial | Line: 314 ]]
	return p1.Frame.Radial[p2]
end
function t5.GetAttachment(p1, p2) --[[ GetAttachment | Line: 318 ]]
	return p1.Frame.Attach[p2]
end
function t5.IsVisible(p1) --[[ IsVisible | Line: 322 ]]
	local Frame = p1.Frame
	repeat
		if not (Frame and (Frame:IsA("GuiObject") and Frame.Visible)) then
			return false
		end
		Frame = Frame.Parent
	until Frame and (Frame:IsA("ScreenGui") and Frame.Enabled)
	return true
end
function t5.Destroy(p1) --[[ Destroy | Line: 333 ]]
	p1._Maid:Destroy()
	p1.Frame:Destroy()
	p1.Clicked = nil
	p1.Hover = nil
	p1.Frame = nil
end
return t5