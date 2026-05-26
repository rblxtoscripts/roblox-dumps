-- https://lua.expert/
local t = {}
local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local v1 = shared.GBMod("ClientInfoHandler")
local v2 = shared.GBMod("Signal").new()
local v3 = nil
local function DetermineInputTypeString(p1) --[[ DetermineInputTypeString | Line: 40 ]]
	if p1 == Enum.UserInputType.Keyboard then
		return "keyboard"
	end
	if p1 == Enum.UserInputType.Touch then
		return "touch"
	end
	if string.match(tostring(p1), "Gamepad") then
		return "gamepad"
	end
end
function t.GetDeviceType(p1) --[[ GetDeviceType | Line: 53 | Upvalues: UserInputService (copy), VRService (copy) ]]
	local v1 = "unknown"
	if UserInputService.VREnabled or VRService.VREnabled then
		v1 = "vr"
	elseif UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
		v1 = "mobile"
	elseif UserInputService.GamepadEnabled and not UserInputService.KeyboardEnabled then
		v1 = "console"
	elseif UserInputService.KeyboardEnabled then
		v1 = "pc"
	end
	local v2 = "unknown"
	if v1 == "mobile" then
		local CurrentCamera = workspace.CurrentCamera
		if CurrentCamera then
			local v3 = math.max(CurrentCamera.ViewportSize.X, CurrentCamera.ViewportSize.Y)
			local v4 = v3 / math.min(CurrentCamera.ViewportSize.X, CurrentCamera.ViewportSize.Y)
			if v4 > 1.8 then
				return v1, "phone"
			end
			if v4 <= 1.7 then
				return v1, "tablet"
			else
				return v1, "phone"
			end
		end
	else
		if v1 == "console" then
			local v5 = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonX)
			if string.find(v5, "Xbox") then
				return v1, "xbox"
			end
			if string.find(v5, "PlayStation") then
				return v1, "playstation"
			else
				return v1, "unknown"
			end
		end
		if v1 == "vr" then
			return v1, "unknown"
		end
		if v1 == "pc" then
			v2 = "unknown"
		end
	end
	return v1, v2
end
function t.OnInputTypeChanged(p1, p2) --[[ OnInputTypeChanged | Line: 100 | Upvalues: v2 (copy) ]]
	return v2:Connect(p2)
end
function t.GetCurrentInputType(p1) --[[ GetCurrentInputType | Line: 104 | Upvalues: v3 (ref), UserInputService (copy) ]]
	if v3 then
		return v3
	end
	v3 = if UserInputService.GamepadEnabled then "gamepad" elseif UserInputService.TouchEnabled then "touch" else "keyboard"
	return v3
end
function t.Init(p1) --[[ Init | Line: 118 | Upvalues: v3 (ref), v2 (copy), v1 (copy), t (copy), UserInputService (copy) ]]
	local function inputTypeChanged(p1) --[[ inputTypeChanged | Line: 119 | Upvalues: v3 (ref), v2 (ref), v1 (ref) ]]
		if v3 == p1 then
			return
		end
		v3 = p1
		v2:Fire(p1)
		v1:UpdateClientInfo("inputType", p1)
	end
	local v12, v22 = p1:GetDeviceType()
	v1:UpdateClientInfo("inputType", t:GetCurrentInputType())
	v1:UpdateClientInfo("deviceSubType", v22)
	v1:UpdateClientInfo("device", v12)
	UserInputService.LastInputTypeChanged:Connect(function(p1) --[[ Line: 133 | Upvalues: v3 (ref), v2 (ref), v1 (ref) ]]
		local v12 = if p1 == Enum.UserInputType.Keyboard then "keyboard" elseif p1 == Enum.UserInputType.Touch then "touch" elseif string.match(tostring(p1), "Gamepad") then "gamepad" else nil
		if not v12 or (v12 == v3 or v3 == v12) then
			return
		end
		v3 = v12
		v2:Fire(v12)
		v1:UpdateClientInfo("inputType", v12)
	end)
	UserInputService.InputChanged:Connect(function(p1) --[[ Line: 140 | Upvalues: v3 (ref), v2 (ref), v1 (ref) ]]
		if p1.UserInputType ~= Enum.UserInputType.MouseMovement or v3 == "keyboard" then
			return
		end
		v3 = "keyboard"
		v2:Fire(v3)
		v1:UpdateClientInfo("inputType", v3)
	end)
end
return t