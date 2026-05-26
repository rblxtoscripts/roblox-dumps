-- https://lua.expert/
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"))
local Medium = Enum.ContextActionPriority.Medium.Value
local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")
local GameSettings = UserSettings().GameSettings
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"))
local UserFixCameraOffsetJitter2 = FlagUtil.getUserFlag("UserFixCameraOffsetJitter2")
local t = {}
t.__index = t
function t.new() --[[ new | Line: 32 | Upvalues: t (copy), GameSettings (copy), Players (copy) ]]
	local v2 = setmetatable({}, t)
	v2.isMouseLocked = false
	v2.savedMouseCursor = nil
	v2.boundKeys = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift }
	v2.mouseLockToggledEvent = Instance.new("BindableEvent")
	local BoundKeys = script:FindFirstChild("BoundKeys")
	if not (BoundKeys and BoundKeys:IsA("StringValue")) then
		if BoundKeys then
			BoundKeys:Destroy()
		end
		local BoundKeys_2 = Instance.new("StringValue")
		assert(BoundKeys_2, "")
		BoundKeys_2.Name = "BoundKeys"
		BoundKeys_2.Value = "LeftShift,RightShift"
		BoundKeys_2.Parent = script
		BoundKeys = BoundKeys_2
	end
	if BoundKeys then
		BoundKeys.Changed:Connect(function(p1) --[[ Line: 57 | Upvalues: v2 (copy) ]]
			v2:OnBoundKeysObjectChanged(p1)
		end)
		v2:OnBoundKeysObjectChanged(BoundKeys.Value)
	end
	GameSettings.Changed:Connect(function(p1) --[[ Line: 64 | Upvalues: v2 (copy) ]]
		if p1 ~= "ControlMode" and p1 ~= "ComputerMovementMode" then
			return
		end
		v2:UpdateMouseLockAvailability()
	end)
	Players.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function() --[[ Line: 71 | Upvalues: v2 (copy) ]]
		v2:UpdateMouseLockAvailability()
	end)
	Players.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 76 | Upvalues: v2 (copy) ]]
		v2:UpdateMouseLockAvailability()
	end)
	v2:UpdateMouseLockAvailability()
	return v2
end
function t.GetIsMouseLocked(p1) --[[ GetIsMouseLocked | Line: 85 ]]
	return p1.isMouseLocked
end
function t.GetBindableToggleEvent(p1) --[[ GetBindableToggleEvent | Line: 89 ]]
	return p1.mouseLockToggledEvent.Event
end
function t.GetMouseLockOffset(p1) --[[ GetMouseLockOffset | Line: 93 | Upvalues: UserFixCameraOffsetJitter2 (copy) ]]
	if UserFixCameraOffsetJitter2 then
		return Vector3.new(1.75, 0, 0)
	end
	local CameraOffset = script:FindFirstChild("CameraOffset")
	if CameraOffset and CameraOffset:IsA("Vector3Value") then
		return CameraOffset.Value
	end
	if CameraOffset then
		CameraOffset:Destroy()
	end
	local CameraOffset_2 = Instance.new("Vector3Value")
	assert(CameraOffset_2, "")
	CameraOffset_2.Name = "CameraOffset"
	CameraOffset_2.Value = Vector3.new(1.75, 0, 0)
	CameraOffset_2.Parent = script
	if CameraOffset_2 and CameraOffset_2.Value then
		return CameraOffset_2.Value
	else
		return Vector3.new(1.75, 0, 0)
	end
end
function t.UpdateMouseLockAvailability(p1) --[[ UpdateMouseLockAvailability | Line: 120 | Upvalues: Players (copy), GameSettings (copy) ]]
	local DevEnableMouseLock = Players.LocalPlayer.DevEnableMouseLock
	local v1 = if Players.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable then true else false
	local v2 = if GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then true else false
	local v4 = if DevEnableMouseLock then if v2 then not (if GameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove then true else false) and not v1 else v2 else DevEnableMouseLock
	if v4 == p1.enabled then
		return
	end
	p1:EnableMouseLock(v4)
end
function t.OnBoundKeysObjectChanged(p1, p2) --[[ OnBoundKeysObjectChanged | Line: 132 ]]
	p1.boundKeys = {}
	for v1 in string.gmatch(p2, "[^%s,]+") do
		for k, v in pairs(Enum.KeyCode:GetEnumItems()) do
			if v1 == v.Name then
				p1.boundKeys[#p1.boundKeys + 1] = v
				break
			end
		end
	end
	p1:UnbindContextActions()
	p1:BindContextActions()
end
function t.OnMouseLockToggled(p1) --[[ OnMouseLockToggled | Line: 147 | Upvalues: CameraUtils (copy) ]]
	p1.isMouseLocked = not p1.isMouseLocked
	if p1.isMouseLocked then
		local CursorImage = script:FindFirstChild("CursorImage")
		if CursorImage and (CursorImage:IsA("StringValue") and CursorImage.Value) then
			CameraUtils.setMouseIconOverride(CursorImage.Value)
		else
			if CursorImage then
				CursorImage:Destroy()
			end
			local CursorImage_2 = Instance.new("StringValue")
			assert(CursorImage_2, "")
			CursorImage_2.Name = "CursorImage"
			CursorImage_2.Value = "rbxasset://textures/MouseLockedCursor.png"
			CursorImage_2.Parent = script
			CameraUtils.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png")
		end
	else
		CameraUtils.restoreMouseIcon()
	end
	p1.mouseLockToggledEvent:Fire()
end
function t.DoMouseLockSwitch(p1, p2, p3, p4) --[[ DoMouseLockSwitch | Line: 172 ]]
	if p3 == Enum.UserInputState.Begin then
		p1:OnMouseLockToggled()
		return Enum.ContextActionResult.Sink
	else
		return Enum.ContextActionResult.Pass
	end
end
function t.BindContextActions(p1) --[[ BindContextActions | Line: 180 | Upvalues: ContextActionService (copy), Medium (copy) ]]
	ContextActionService:BindActionAtPriority("MouseLockSwitchAction", function(p12, p2, p3) --[[ Line: 181 | Upvalues: p1 (copy) ]]
		return p1:DoMouseLockSwitch(p12, p2, p3)
	end, false, Medium, unpack(p1.boundKeys))
end
function t.UnbindContextActions(p1) --[[ UnbindContextActions | Line: 186 | Upvalues: ContextActionService (copy) ]]
	ContextActionService:UnbindAction("MouseLockSwitchAction")
end
function t.IsMouseLocked(p1) --[[ IsMouseLocked | Line: 190 ]]
	return p1.enabled and p1.isMouseLocked
end
function t.EnableMouseLock(p1, p2) --[[ EnableMouseLock | Line: 194 | Upvalues: CameraUtils (copy) ]]
	if p2 == p1.enabled then
		return
	end
	p1.enabled = p2
	if p1.enabled then
		p1:BindContextActions()
		return
	end
	CameraUtils.restoreMouseIcon()
	p1:UnbindContextActions()
	if p1.isMouseLocked then
		p1.mouseLockToggledEvent:Fire()
	end
	p1.isMouseLocked = false
end
return t