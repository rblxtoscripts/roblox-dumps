-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("BaseObject")
local v2 = setmetatable({}, v1)
v2.ClassName = "BindableRagdollHumanoidOnFall"
v2.__index = v2
function v2.new(p1, p2) --[[ new | Line: 17 | Upvalues: v1 (copy), v2 (copy) ]]
	local v3 = setmetatable(v1.new(p1), v2)
	v3._ragdollBinder = assert(p2)
	v3.ShouldRagdoll = Instance.new("BoolValue")
	v3.ShouldRagdoll.Value = false
	v3._maid:GiveTask(v3.ShouldRagdoll)
	v3:_initLastVelocityRecords()
	v3._lastRagDollTime = 0
	local v4 = true
	v3._maid:GiveTask(function() --[[ Line: 31 | Upvalues: v4 (ref) ]]
		v4 = false
	end)
	spawn(function() --[[ Line: 35 | Upvalues: v4 (ref), v3 (copy) ]]
		wait(math.random() * 0.1)
		while v4 do
			v3:_updateVelocity()
			wait(0.1)
		end
	end)
	v3._maid:GiveTask(v3._ragdollBinder:ObserveInstance(v3._obj, function(p1) --[[ Line: 43 | Upvalues: v3 (copy) ]]
		if p1 then
			return
		end
		v3._lastRagDollTime = tick()
		v3.ShouldRagdoll.Value = false
	end))
	return v3
end
function v2._initLastVelocityRecords(p1) --[[ _initLastVelocityRecords | Line: 53 ]]
	p1._lastVelocityRecords = {}
	for i = 1, 9 do
		table.insert(p1._lastVelocityRecords, (Vector3.new()))
	end
end
function v2._getLargestSpeedInRecords(p1) --[[ _getLargestSpeedInRecords | Line: 60 ]]
	local v1 = (-1 / 0)
	for k, v in pairs(p1._lastVelocityRecords) do
		local magnitude = v.magnitude
		if v1 < magnitude then
			v1 = magnitude
		end
	end
	return v1
end
function v2._ragdollFromFall(p1) --[[ _ragdollFromFall | Line: 73 ]]
	p1.ShouldRagdoll.Value = true
	spawn(function() --[[ Line: 76 | Upvalues: p1 (copy) ]]
		while p1.Destroy and (p1:_getLargestSpeedInRecords() >= 3 and p1.ShouldRagdoll.Value) do
			wait()
		end
		if p1.Destroy and p1.ShouldRagdoll.Value then
			wait(0.75)
		end
		if not (p1.Destroy and p1._obj.Health > 0) then
			return
		end
		p1.ShouldRagdoll.Value = false
	end)
end
function v2._updateVelocity(p1) --[[ _updateVelocity | Line: 93 ]]
	table.remove(p1._lastVelocityRecords, 1)
	local RootPart = p1._obj.RootPart
	if not RootPart then
		table.insert(p1._lastVelocityRecords, (Vector3.new()))
		return
	end
	local v2 = true
	local v3 = (1 / 0)
	for k, v in pairs(p1._lastVelocityRecords) do
		if v.y >= -2 then
			v2 = false
			break
		elseif v.y < v3 then
			v3 = v.y
		end
	end
	table.insert(p1._lastVelocityRecords, RootPart.Velocity)
	if not v2 then
		return
	end
	if v3 >= -30 then
		return
	end
	if p1._obj.Health <= 0 then
		return
	end
	if p1._obj.Sit then
		return
	end
	local v4 = p1._obj:GetState()
	if v4 == Enum.HumanoidStateType.Physics or v4 == Enum.HumanoidStateType.Swimming then
		return
	end
	if not (tick() - p1._lastRagDollTime <= 1) then
		p1:_ragdollFromFall()
	end
end
return v2