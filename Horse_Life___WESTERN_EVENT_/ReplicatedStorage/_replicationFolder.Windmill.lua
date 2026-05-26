-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("Binder")
local v3 = Sonar("Maid")
local v4 = Sonar("State")
local v5 = Sonar("Constants").IsStudio and true
local v6 = nil
function t.new(p1) --[[ new | Line: 29 | Upvalues: t (ref), v3 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	v2.Model = p1
	v2.Wheel = v2.Model:WaitForChild("Wheel")
	v2._direction = v4.fromAttribute(v2.Model, "Direction"):derive(function(p1) --[[ Line: 37 ]]
		return if p1 then p1 elseif Random.new():NextInteger(1, 2) == 1 then "Clockwise" else ""
	end)
	v2._rate = v4.fromAttribute(v2.Model, "RPM"):derive(function(p1) --[[ Line: 43 ]]
		local v1 = tonumber(p1)
		if not v1 then
			local v2 = Random.new():NextNumber(10, 20)
			v1 = v2 * (if Random.new():NextNumber(1, 2) == 1 then 1 else -1)
		end
		return v1
	end)
	v2.Lifetime = v4.new(0)
	v2.Rate = v4.new(0)
	v2:_setup()
	return v2
end
function t._setup(p1) --[[ _setup | Line: 59 | Upvalues: v4 (copy), v1 (copy), v5 (copy) ]]
	p1.Maid:GiveTask(v4.subscribeMulti({ p1._direction, p1._rate }, function(p12, p2) --[[ Line: 60 | Upvalues: v1 (ref), p1 (copy) ]]
		v1.targetState(p1.Rate, 1, 0.5, p2 * (if p12 == "Clockwise" then 1 else -1))
	end))
	local v12 = p1.Lifetime:get()
	p1.Maid:GiveTask(v4.subscribeMulti({ p1.Lifetime, p1.Rate }, function(p12, p2) --[[ Line: 68 | Upvalues: v12 (ref), p1 (copy), v1 (ref) ]]
		v1.target(p1.Wheel, 1, 1, {
			Pivot = p1.Wheel:GetPivot() * CFrame.Angles(0, (p12 - v12) * p2, 0)
		})
		v12 = p12
	end))
	if not v5 then
		return
	end
	p1.Maid:GiveTask(v4.subscribeMulti({
		p1._direction,
		p1._rate,
		p1.Lifetime,
		p1.Rate
	}, function(...) --[[ Line: 81 | Upvalues: p1 (copy) ]]
		for v1, v2 in {
			_direction = select(1, ...),
			_rate = select(2, ...),
			Lifetime = select(3, ...),
			Rate = select(4, ...)
		} do
			p1.Model:SetAttribute(v1, v2)
		end
	end))
end
function t.Step(p1, p2) --[[ Step | Line: 95 ]]
	p1.Lifetime:set(p1.Lifetime:get() + p2)
end
function t.Destroy(p1) --[[ Destroy | Line: 100 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 109 | Upvalues: v6 (ref), v2 (copy), t (ref), RunService (copy) ]]
	v6 = v2.new("Windmill", t)
	v6:Init()
	RunService.PostSimulation:Connect(function(p1) --[[ Line: 113 | Upvalues: v6 (ref) ]]
		for v1, v2 in v6:GetAll() do
			v2:Step(p1)
		end
	end)
end
t:Init()
return t