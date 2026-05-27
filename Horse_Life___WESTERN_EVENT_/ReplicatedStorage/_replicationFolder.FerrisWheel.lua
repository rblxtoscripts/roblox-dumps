-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
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
	v2.Seats = v2.Model:WaitForChild("Seats"):GetChildren()
	v2.Wheel = v2.Model:WaitForChild("Wheel")
	v2.Position = v2.Wheel:GetPivot()
	v2.Position = v2.Position.Position
	v2.SeatOffsets = {}
	v2.Radius = v2.Wheel:GetExtentsSize()
	v2.Radius = math.max(v2.Radius.X, v2.Radius.Z) * 100 // 1 * 0.01
	v2.Radius = v2.Radius * 0.5
	v2._direction = v4.fromAttribute(v2.Model, "Direction"):derive(function(p1) --[[ Line: 47 ]]
		return p1 or "Clockwise"
	end)
	v2._rate = v4.fromAttribute(v2.Model, "RPM"):derive(function(p1) --[[ Line: 53 ]]
		return tonumber(p1) or 3
	end)
	v2.Lifetime = v4.new(0)
	v2.Rate = v4.new(0)
	v2:_setup()
	return v2
end
function t._setup(p1) --[[ _setup | Line: 69 | Upvalues: v4 (copy), v1 (copy), v5 (copy) ]]
	for i = #p1.Seats, 1, -1 do
		if not p1.Seats[i]:IsA("Model") then
			table.remove(p1.Seats, i)
		end
	end
	for v12, v2 in p1.Seats do
		p1.SeatOffsets[v2] = v2:GetPivot().Position - p1.Position
	end
	p1.Maid:GiveTask(v4.subscribeMulti({ p1._direction, p1._rate }, function(p12, p2) --[[ Line: 82 | Upvalues: v1 (ref), p1 (copy) ]]
		v1.targetState(p1.Rate, 1, 0.5, p2 * (if p12 == "Clockwise" then 1 else -1))
	end))
	local v3 = p1.Lifetime:get()
	p1.Maid:GiveTask(v4.subscribeMulti({ p1.Lifetime, p1.Rate }, function(p12, p2) --[[ Line: 90 | Upvalues: v3 (ref), p1 (copy), v1 (ref) ]]
		local v2 = p1.Wheel:GetPivot()
		local v32 = v2 * CFrame.Angles(0, 0, (p12 - v3) * p2)
		v1.target(p1.Wheel, 1, 1, {
			Pivot = v32
		})
		local v4 = #p1.Seats
		local v5 = p1.Radius * 0.9
		local v6 = select(-1, v2:ToOrientation())
		local LookVector = v32.LookVector
		local RightVector = v32.RightVector
		local UpVector = v32.UpVector
		for v7, v8 in p1.Seats do
			local v9 = (v7 - 1) * (6.283185307179586 / v4) + v6
			local v11 = p1.Position + (RightVector * math.cos(v9) * v5 + UpVector * math.sin(v9) * v5)
			v1.target(v8, 1, 1, {
				Pivot = CFrame.new(v11, v11 + LookVector)
			})
		end
		v3 = p12
	end))
	if not v5 then
		return
	end
	p1.Maid:GiveTask(v4.subscribeMulti({
		p1._direction,
		p1._rate,
		p1.Lifetime,
		p1.Rate
	}, function(...) --[[ Line: 122 | Upvalues: p1 (copy) ]]
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
function t.Step(p1, p2) --[[ Step | Line: 136 ]]
	p1.Lifetime:set(p1.Lifetime:get() + p2)
end
function t.Destroy(p1) --[[ Destroy | Line: 141 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 150 | Upvalues: v6 (ref), v2 (copy), t (ref) ]]
	v6 = v2.new("FerrisWheel", t)
	v6:Init()
end
t:Init()
return t