-- https://lua.expert/
local t = {}
local UserInputService = game:GetService("UserInputService")
local InputTypes = require(game.ReplicatedStorage:WaitForChild("Sonar"))("Constants").InputTypes
t.InputTypes = InputTypes
local t2 = {
	[Enum.UserInputType.MouseButton1] = InputTypes.Keyboard,
	[Enum.UserInputType.MouseButton2] = InputTypes.Keyboard,
	[Enum.UserInputType.MouseButton3] = InputTypes.Keyboard,
	[Enum.UserInputType.MouseWheel] = InputTypes.Keyboard,
	[Enum.UserInputType.MouseMovement] = InputTypes.Keyboard,
	[Enum.UserInputType.Keyboard] = InputTypes.Keyboard,
	[Enum.UserInputType.Touch] = InputTypes.Touch,
	[Enum.UserInputType.Gamepad1] = InputTypes.Gamepad,
	[Enum.UserInputType.Gamepad2] = InputTypes.Gamepad,
	[Enum.UserInputType.Gamepad3] = InputTypes.Gamepad,
	[Enum.UserInputType.Gamepad4] = InputTypes.Gamepad,
	[Enum.UserInputType.Gamepad5] = InputTypes.Gamepad,
	[Enum.UserInputType.Gamepad6] = InputTypes.Gamepad,
	[Enum.UserInputType.Gamepad7] = InputTypes.Gamepad,
	[Enum.UserInputType.Gamepad8] = InputTypes.Gamepad
}
local v1 = game:GetService("GuiService"):IsTenFootInterface() and InputTypes.Gamepad or (UserInputService.TouchEnabled and InputTypes.Touch or (t2[UserInputService:GetLastInputType()] or InputTypes.Keyboard))
function t.GetInputType() --[[ GetInputType | Line: 37 | Upvalues: v1 (ref) ]]
	return v1
end
function t.IsMobileInputType() --[[ IsMobileInputType | Line: 41 | Upvalues: v1 (ref), InputTypes (copy) ]]
	return v1 == InputTypes.Touch
end
function t.IsGamepadInputType() --[[ IsGamepadInputType | Line: 45 | Upvalues: v1 (ref), InputTypes (copy) ]]
	return v1 == InputTypes.Gamepad
end
function t.GetInputTypeName() --[[ GetInputTypeName | Line: 49 | Upvalues: InputTypes (copy), v1 (ref) ]]
	for k, v in pairs(InputTypes) do
		if v == v1 then
			return k
		end
	end
	return nil
end
function t.GetInputTypeNameFromInputEnum(p1) --[[ GetInputTypeNameFromInputEnum | Line: 63 | Upvalues: InputTypes (copy) ]]
	for v2, v3 in InputTypes do
		if p1 == v3 then
			return v2
		end
	end
	return nil
end
function t.GetInputEnumFromType(p1) --[[ GetInputEnumFromType | Line: 79 | Upvalues: InputTypes (copy) ]]
	for k, v in pairs(InputTypes) do
		if k == p1 then
			return v
		end
	end
	return nil
end
local v2 = Instance.new("BindableEvent")
t.InputTypeChanged = v2.Event
UserInputService.LastInputTypeChanged:Connect(function(p1) --[[ Line: 98 | Upvalues: t2 (copy), v1 (ref), v2 (copy) ]]
	local v12 = t2[p1]
	if not v12 then
		return
	end
	if v12 ~= v1 then
		v1 = v12
		v2:Fire(v12)
	end
end)
return t