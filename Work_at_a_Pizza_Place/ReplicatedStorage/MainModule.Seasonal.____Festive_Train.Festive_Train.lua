-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
local _ = script:WaitForChild("HousePointer").Value
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 4 | Upvalues: v1 (copy) ]]
	if not (v1 and v1:FindFirstChild("Train")) then
		return
	end
	v1.Train:PivotTo(v1.Train:GetPivot() * CFrame.Angles(0, -0.01308996938995747, 0))
end)