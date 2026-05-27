-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Binder")
function t.new(p1) --[[ new | Line: 11 | Upvalues: t (copy), v1 (copy), RunService (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Snowball = p1
	v2.Maid = v1.new()
	v2.BasePosition = p1:GetPivot().Position
	v2.Time = math.random() * math.pi * 2
	v2.Maid:GiveTask(RunService.Heartbeat:Connect(function(p1) --[[ Line: 19 | Upvalues: v2 (copy) ]]
		if v2.Snowball and v2.Snowball.Parent then
			local v1 = v2
			v1.Time = v1.Time + p1
			v2.Snowball:PivotTo(CFrame.new(v2.BasePosition + Vector3.new(0, math.sin(v2.Time * 2) * 2, 0)))
		end
	end))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 32 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 37 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("SnowballPickupVisual", t):Init()
end
t.Init()
return t