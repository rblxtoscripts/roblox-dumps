-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
local _ = script:WaitForChild("HousePointer").Value
local v2 = 0
local v3 = false
local v4 = nil
function Spin() --[[ Spin | Line: 11 | Upvalues: v2 (ref), v3 (ref), v4 (ref), v1 (copy) ]]
	v2 = v2 + 0.4487989505128276
	if v2 > 1.5707963267948966 then
		v2 = 1.5707963267948966
	end
	if v3 then
		return
	end
	v3 = true
	v4 = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 18 | Upvalues: v1 (ref), v2 (ref), v4 (ref), v3 (ref) ]]
		if v1 and (v1.Parent and v1:FindFirstChild("Globe")) then
			v2 = v2 - 0.007479982508547127
			v1.Globe.CFrame = v1.Globe.CFrame * CFrame.Angles(0, v2, 0)
			if v2 <= 0 then
				v4:Disconnect()
				v3 = false
			end
		else
			v4:Disconnect()
		end
	end)
end
v1.Base:WaitForChild("ProximityPrompt", 3).Triggered:Connect(function() --[[ Line: 34 ]]
	print("SPUN")
	Spin()
end)