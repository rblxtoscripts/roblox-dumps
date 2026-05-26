-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 10 | Upvalues: t (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Object = p1
	v22.Maid = v2.new()
	v22.Object.Touched:Connect(function(p1) --[[ Line: 16 ]]
		local v1 = p1:FindFirstAncestorOfClass("Model")
		if not (if v1 then v1:FindFirstChildWhichIsA("Humanoid") else v1) then
			return
		end
		local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
		if not (HumanoidRootPart and HumanoidRootPart.Velocity.Y < 5) then
			return
		end
		HumanoidRootPart.Velocity = Vector3.new(HumanoidRootPart.Velocity.X, 100, HumanoidRootPart.Velocity.Z)
	end)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 31 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 38 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("Bounce", t):Init()
end
t.Init()
return t