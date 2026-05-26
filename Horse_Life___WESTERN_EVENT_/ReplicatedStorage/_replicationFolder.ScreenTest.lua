-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("GuiFrameworkService")
function t.new(p1) --[[ new | Line: 13 | Upvalues: t (copy), v1 (copy), v3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Config = v3.GetComponentConfig(p1)
	v2.Screen = (type(p1) == "string" or typeof(p1) == "Instance") and v3.GetScreen(v2.Config.Screen) or v2.Config.Screen
	if not v2.Screen then
		warn("\226\154\160\239\184\143 ScreenTest, Screen not found:", p1.Screen)
		return nil
	end
	local function onStateChanged() --[[ onStateChanged | Line: 26 | Upvalues: v2 (copy) ]]
		if v2.Screen:IsOpen(v2.Screen.Name) then
			print("ScreenTest, Screen is open:", v2.Screen.Name)
		else
			print("ScreenTest, Screen is closed:", v2.Screen.Name)
		end
	end
	v2.Maid:GiveTask(v2.Screen:GetStateChangedSignal():Connect(onStateChanged))
	if v2.Screen:IsOpen(v2.Screen.Name) then
		print("ScreenTest, Screen is open:", v2.Screen.Name)
	else
		print("ScreenTest, Screen is closed:", v2.Screen.Name)
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 39 | Upvalues: v2 (copy) ]]
	v2(p1)
end
return t