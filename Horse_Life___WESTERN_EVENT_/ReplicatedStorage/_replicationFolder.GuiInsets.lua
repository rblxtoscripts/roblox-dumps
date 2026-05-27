-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Sonar)("Signal")
local v2 = game:GetService("RunService"):IsStudio()
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local GuiInsets = Instance.new("ScreenGui")
GuiInsets.ResetOnSpawn = false
GuiInsets.Name = "GuiInsets"
GuiInsets.Parent = PlayerGui
local DeviceSafeArea = Instance.new("ScreenGui")
DeviceSafeArea.Name = "DeviceSafeArea"
DeviceSafeArea.ResetOnSpawn = false
DeviceSafeArea.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
DeviceSafeArea.Parent = GuiInsets
local None = Instance.new("ScreenGui")
None.Name = "None"
None.ResetOnSpawn = false
None.ScreenInsets = Enum.ScreenInsets.None
None.Parent = GuiInsets
local v3 = v1.new()
function t.GetDeviceScreenInsets() --[[ GetDeviceScreenInsets | Line: 41 | Upvalues: None (copy), DeviceSafeArea (copy) ]]
	return None.AbsoluteSize - DeviceSafeArea.AbsoluteSize
end
function t.GetDeviceScreenOffset(p1) --[[ GetDeviceScreenOffset | Line: 49 | Upvalues: t (copy) ]]
	local v1 = t.GetDeviceScreenInsets()
	return (p1 == "X" and v1.X or v1.Y) / 2
end
function t.GetInsetsChangedSignal() --[[ GetInsetsChangedSignal | Line: 58 | Upvalues: v3 (copy) ]]
	return v3
end
function t.Init(p1) --[[ Init | Line: 62 | Upvalues: GuiInsets (copy), v3 (copy), v2 (copy), t (copy) ]]
	for v1, v22 in GuiInsets:GetChildren() do
		v22:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 64 | Upvalues: v3 (ref) ]]
			v3:Fire()
		end)
	end
	if not v2 then
		return
	end
	print("\226\154\153\239\184\143 GuiInsets, Offset:", t.GetDeviceScreenInsets())
end
t:Init()
return t