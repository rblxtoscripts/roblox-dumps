-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = script:WaitForChild("ObjectPointer").Value
local v2 = script:WaitForChild("HousePointer").Value
local v3 = v2:FindFirstChild("Owner").Value
local Handle = v1:WaitForChild("Handle")
local MobileTouchDetector = Handle:WaitForChild("MobileTouchDetector")
if v3 == game.Players.LocalPlayer then
	local XmasPresentClient = require(ReplicatedStorage._v6FiRE_Additions.XmasPresentClient)
	local isOpen = v1:WaitForChild("isOpen")
	XmasPresentClient.initPresent({
		model = v1,
		owner = v3,
		house = v2,
		prompt = Handle:WaitForChild("ProximityPrompt"),
		isOpenValue = isOpen,
		enabledValue = MobileTouchDetector,
		clickdetector = v1:WaitForChild("ClickDetector"),
		handle = Handle
	})
else
	MobileTouchDetector.Value = false
	MobileTouchDetector.Changed:Connect(function() --[[ Line: 16 | Upvalues: MobileTouchDetector (copy) ]]
		MobileTouchDetector.Value = false
	end)
end