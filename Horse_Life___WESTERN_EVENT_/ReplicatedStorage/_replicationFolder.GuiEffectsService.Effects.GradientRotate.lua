-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("InstanceUtils")
local t = {
	RotationSpeed = 0.5
}
local t2 = {}
local v2 = nil
local function StartHeartbeat() --[[ StartHeartbeat | Line: 14 | Upvalues: v2 (ref), RunService (copy), t2 (copy) ]]
	if not v2 then
		v2 = RunService.Heartbeat:Connect(function(p1_2) --[[ Line: 19 | Upvalues: t2 (ref) ]]
			for v1, v2 in t2 do
				v1.Rotation = (v1.Rotation + p1_2 * v2.RotationSpeed * 360) % 360
			end
		end)
	end
end
return function(p1) --[[ Line: 26 | Upvalues: v1 (copy), t (copy), t2 (copy), v2 (ref), RunService (copy) ]]
	local t3 = {}
	if p1.Instance and p1.Instance:IsA("UIGradient") then
		table.insert(t3, p1.Instance)
	end
	if p1.Instances then
		for v22, v3 in p1.Instances do
			if v3:IsA("UIGradient") then
				table.insert(t3, v3)
			end
		end
	end
	if p1.Tag and p1.Instance then
		for v4, v5 in v1.GetAllTagged(p1.Instance, p1.Tag) do
			if v5:IsA("UIGradient") then
				table.insert(t3, v5)
			end
		end
	end
	local v6 = p1.RotationSpeed or t.RotationSpeed
	for v7, v8 in t3 do
		t2[v8] = {
			RotationSpeed = v6,
			BaseRotation = v8.Rotation
		}
	end
	if not v2 then
		v2 = RunService.Heartbeat:Connect(function(p1_2) --[[ Line: 19 | Upvalues: t2 (ref) ]]
			for v1, v2 in t2 do
				v1.Rotation = (v1.Rotation + p1_2 * v2.RotationSpeed * 360) % 360
			end
		end)
	end
	return function() --[[ Line: 62 | Upvalues: t3 (copy), t2 (ref) ]]
		for v1, v2 in t3 do
			if t2[v2] then
				v2.Rotation = t2[v2].BaseRotation
				t2[v2] = nil
			end
		end
	end
end