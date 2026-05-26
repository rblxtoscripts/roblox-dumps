-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local v1 = require(ReplicatedStorage.Sonar)("InputImageLibrary")
local t2 = { "Keyboard", "Gamepad", "Touch" }
local t3 = {
	[Enum.PreferredInput.Touch] = "Touch",
	[Enum.PreferredInput.KeyboardAndMouse] = "Keyboard",
	[Enum.PreferredInput.Gamepad] = "Gamepad"
}
local t4 = {
	Type = nil,
	SubType = nil
}
local v2 = RunService:IsStudio()
local v3 = Instance.new("BindableEvent")
local v4 = nil
local function getInputTypeFromPreferredInput(p1) --[[ getInputTypeFromPreferredInput | Line: 225 | Upvalues: t3 (copy) ]]
	return t3[p1] or "Keyboard"
end
local function getDeviceType() --[[ getDeviceType | Line: 230 | Upvalues: UserInputService (copy), VRService (copy), RunService (copy), GuiService (copy) ]]
	local v1 = "Unknown"
	if UserInputService.VREnabled or VRService.VREnabled then
		return "VR"
	end
	if UserInputService.TouchEnabled and (RunService:IsStudio() or not UserInputService.KeyboardEnabled) then
		return "Mobile"
	end
	if GuiService:IsTenFootInterface() then
		return "Console"
	end
	if UserInputService.KeyboardEnabled then
		v1 = "PC"
	end
	return v1
end
local function getDeviceSubType() --[[ getDeviceSubType | Line: 245 | Upvalues: t (copy), UserInputService (copy) ]]
	local v1 = t.GetDeviceType()
	local v2 = "Unknown"
	if v1 == "Mobile" then
		local CurrentCamera = workspace.CurrentCamera
		if CurrentCamera then
			local v3 = math.max(CurrentCamera.ViewportSize.X, CurrentCamera.ViewportSize.Y)
			local v4 = v3 / math.min(CurrentCamera.ViewportSize.X, CurrentCamera.ViewportSize.Y)
			if v4 > 1.8 then
				return "Phone"
			end
			if v4 <= 1.7 then
				return "Tablet"
			else
				return "Phone"
			end
		end
	else
		if v1 == "Console" then
			local v5 = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonX)
			if string.find(v5, "Xbox") then
				return "Xbox"
			end
			if string.find(v5, "PlayStation") then
				return "PlayStation"
			else
				return "Unknown"
			end
		end
		if v1 == "VR" then
			return "Unknown"
		end
		if v1 == "PC" then
			v2 = "Unknown"
		end
	end
	return v2
end
function t.GetDeviceType() --[[ GetDeviceType | Line: 281 | Upvalues: t4 (ref) ]]
	return t4.Type
end
function t.GetDeviceSubType() --[[ GetDeviceSubType | Line: 285 | Upvalues: t4 (ref) ]]
	return t4.SubType
end
function t.GetDeviceInfo() --[[ GetDeviceInfo | Line: 289 | Upvalues: t4 (ref) ]]
	return t4.Type, t4.SubType
end
function t.IsMobileDevice() --[[ IsMobileDevice | Line: 293 | Upvalues: t (copy) ]]
	return t.IsDeviceType("Mobile")
end
function t.IsConsoleDevice() --[[ IsConsoleDevice | Line: 297 | Upvalues: t (copy) ]]
	return t.IsDeviceType("Console")
end
function t.IsDeviceType(p1) --[[ IsDeviceType | Line: 301 | Upvalues: t (copy) ]]
	local v1 = t.GetDeviceType()
	for v3, v4 in type(p1) == "string" and { p1 } or p1 do
		if v1 == v4 then
			return true
		end
	end
	return false
end
function t.GetInputType() --[[ GetInputType | Line: 312 | Upvalues: v4 (ref) ]]
	return v4
end
function t.GetInputTypeChangedSignal() --[[ GetInputTypeChangedSignal | Line: 316 | Upvalues: v3 (copy) ]]
	return v3.Event
end
function t.IsInputType(p1) --[[ IsInputType | Line: 320 | Upvalues: t (copy) ]]
	for v2, v3 in type(p1) == "string" and { p1 } or p1 do
		if t.GetInputType() == v3 then
			return true
		end
	end
	return false
end
function t.IsMobileInputType() --[[ IsMobileInputType | Line: 330 | Upvalues: t (copy) ]]
	return t.IsInputType("Touch")
end
function t.IsGamepadInputType() --[[ IsGamepadInputType | Line: 334 | Upvalues: t (copy) ]]
	return t.IsInputType("Gamepad")
end
function t.GetInputTypeName() --[[ GetInputTypeName | Line: 338 | Upvalues: t (copy) ]]
	return t.GetInputType()
end
function t.BindToInputTypeChanged(p1) --[[ BindToInputTypeChanged | Line: 342 | Upvalues: t (copy), v3 (copy) ]]
	local function runCallback() --[[ runCallback | Line: 343 | Upvalues: t (ref), p1 (copy) ]]
		task.spawn(p1, (t.GetInputTypeName()))
	end
	task.spawn(runCallback)
	return v3.Event:Connect(runCallback)
end
function t.UpdateInputImage(p1, p2, p3, p4) --[[ UpdateInputImage | Line: 352 | Upvalues: UserInputService (copy), v1 (copy) ]]
	if p3 == "Gamepad" then
		p2.Image = UserInputService:GetImageForKeyCode(p1)
		p2.ImageRectOffset = Vector2.zero
		p2.ImageRectSize = Vector2.zero
		p2.Visible = true
	else
		local v12 = v1:GetScaledImageLabel(p1, p4, p3)
		p2.Image = v12.Image
		p2.ImageRectOffset = v12.ImageRectOffset
		p2.ImageRectSize = v12.ImageRectSize
	end
end
function t.BindInputImages(p1, p2, p3, p4) --[[ BindInputImages | Line: 367 | Upvalues: t (copy) ]]
	if p4 == true then
		p4 = p1.Image
	end
	return t.BindToInputTypeChanged(function(p12) --[[ Line: 372 | Upvalues: t (ref), p2 (copy), p1 (copy), p3 (copy), p4 (ref) ]]
		if p12 == "Keyboard" then
			t.UpdateInputImage(p2, p1, "Keyboard")
			p1.Visible = true
			return
		end
		if p12 == "Gamepad" then
			t.UpdateInputImage(p3, p1, "Gamepad")
			p1.Visible = true
			return
		end
		if p12 ~= "Touch" then
			return
		end
		if p4 then
			p1.Image = p4
			p1.Visible = true
			return
		end
		p1.Visible = false
	end)
end
function t.Init(p1) --[[ Init | Line: 390 | Upvalues: v4 (ref), UserInputService (copy), t3 (copy), t4 (ref), VRService (copy), RunService (copy), GuiService (copy), getDeviceSubType (copy), t (copy), t2 (copy), v3 (copy), v2 (copy) ]]
	v4 = t3[UserInputService.PreferredInput] or "Keyboard"
	local t5 = {}
	local v1 = "Unknown"
	if UserInputService.VREnabled or VRService.VREnabled then
		v1 = "VR"
	elseif UserInputService.TouchEnabled and (RunService:IsStudio() or not UserInputService.KeyboardEnabled) then
		v1 = "Mobile"
	elseif GuiService:IsTenFootInterface() then
		v1 = "Console"
	elseif UserInputService.KeyboardEnabled then
		v1 = "PC"
	end
	t5.Type = v1
	t5.SubType = getDeviceSubType()
	t4 = t5
	t.INPUT_TYPES = t2
	t.InputTypeChanged = v3.Event
	UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function(p1) --[[ Line: 405 | Upvalues: UserInputService (ref), v4 (ref), t3 (ref), v3 (ref) ]]
		local PreferredInput = UserInputService.PreferredInput
		warn(PreferredInput)
		if PreferredInput then
			v4 = t3[PreferredInput] or "Keyboard"
			v3:Fire(v4)
		end
	end)
	if not v2 then
		return
	end
	print("\226\140\168\239\184\143 InputTypeService, Device Type:", t5.Type, "| Device SubType:", t5.SubType, "| Input Type:", v4)
end
t:Init()
return t