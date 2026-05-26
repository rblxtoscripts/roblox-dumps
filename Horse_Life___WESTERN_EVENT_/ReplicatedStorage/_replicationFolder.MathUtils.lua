-- https://lua.expert/
local t = {
	map = function(p1, p2, p3, p4, p5, p6) --[[ map | Line: 6 ]]
		assert(if p2 == p3 then false else true, "min0 cannot be equal to max0")
		local v2 = (p1 - p2) * (p5 - p4) / (p3 - p2) + p4
		if p6 then
			v2 = math.max(math.min(p4, p5), (math.min(math.max(p4, p5), v2)))
		end
		return v2
	end,
	lerp = function(p1, p2, p3) --[[ lerp | Line: 22 ]]
		return p1 + (p2 - p1) * p3
	end,
	exponentialLerp = function(p1, p2, p3, p4) --[[ exponentialLerp | Line: 26 ]]
		local v1 = p3 ^ p4
		return p1 * (1 - v1) + p2 * v1
	end,
	inverseExponentialLerp = function(p1, p2, p3, p4) --[[ inverseExponentialLerp | Line: 31 ]]
		if p3 == 0 then
			return p1
		end
		if p3 == 1 then
			return p2
		else
			local v1 = p3 ^ (1 / p4)
			return p1 * (1 - v1) + p2 * v1
		end
	end,
	round = function(p1, p2) --[[ round | Line: 42 ]]
		if p2 then
			return math.floor(p1 / p2 + 0.5) * p2
		else
			return math.floor(p1 + 0.5)
		end
	end,
	roundUp = function(p1, p2) --[[ roundUp | Line: 50 ]]
		return math.ceil(p1 / p2) * p2
	end,
	roundDown = function(p1, p2) --[[ roundDown | Line: 54 ]]
		return math.floor(p1 / p2) * p2
	end
}
function t.IsNAN(p1) --[[ IsNAN | Line: 58 | Upvalues: t (copy) ]]
	if typeof(p1) == "Vector3" then
		return (t.IsNAN(p1.X) or (t.IsNAN(p1.Y) or t.IsNAN(p1.Z))) and true or false
	end
	if typeof(p1) == "CFrame" then
		if t.IsNAN(p1.p) then
			return true
		else
			return t.IsNAN(p1.LookVector)
		end
	else
		if typeof(p1) ~= "number" then
			return
		end
		local v1 = math.abs(p1)
		if not v1 then
			return true
		end
		if v1 >= (1 / 0) then
			return true
		end
		return p1 ~= p1
	end
end
function t.clampVector(p1, p2, p3) --[[ clampVector | Line: 92 ]]
	return Vector3.new(math.clamp(p1.X, p2, p3), math.clamp(p1.Y, p2, p3), (math.clamp(p1.Z, p2, p3)))
end
function t.normalizeAngles(p1, p2) --[[ normalizeAngles | Line: 100 ]]
	local v1 = (p1 - p2) % 6.2831853071796
	return v1 > 3.1415926535898 and v1 - 6.2831853071796 or v1
end
function t.normalizeAngle(p1) --[[ normalizeAngle | Line: 105 ]]
	local v1 = p1 % 6.2831853071796
	return v1 > 3.14 and v1 - 6.2831853071796 or v1
end
function t.isEven(p1) --[[ isEven | Line: 110 ]]
	return p1 % 2 == 0
end
function t.roundVector(p1) --[[ roundVector | Line: 114 ]]
	return Vector3.new(math.floor(p1.X), math.floor(p1.Y), (math.floor(p1.Z)))
end
function t.getPointsOnSphere(p1, p2, p3) --[[ getPointsOnSphere | Line: 118 ]]
	local t = {}
	for i = 1, p1 do
		local v2 = math.acos(math.random() * 2 - 1)
		local v4 = math.rad(math.random() * 360)
		table.insert(t, (Vector3.new(p2.X + p3 * math.sin(v2) * math.cos(v4), p2.Y + p3 * math.cos(v2), p2.Z + p3 * math.sin(v2) * math.sin(v4))))
	end
	return t
end
function t.avgVector(p1) --[[ avgVector | Line: 132 ]]
	return (p1.X + p1.Y + p1.Z) / 3
end
function t.scaleParticle(p1, p2) --[[ scaleParticle | Line: 136 ]]
	local Keypoints = p1.Size.Keypoints
	for i = 1, #Keypoints do
		Keypoints[i] = NumberSequenceKeypoint.new(Keypoints[i].Time, Keypoints[i].Value * p2, Keypoints[i].Envelope)
	end
	p1.Size = NumberSequence.new(Keypoints)
end
function t.scaleNumberSequence(p1, p2) --[[ scaleNumberSequence | Line: 144 ]]
	local Keypoints = p1.Keypoints
	for i = 1, #Keypoints do
		Keypoints[i] = NumberSequenceKeypoint.new(Keypoints[i].Time, Keypoints[i].Value * p2, Keypoints[i].Envelope)
	end
	return NumberSequence.new(Keypoints)
end
function t.getRotationBetween(p1, p2, p3, p4) --[[ getRotationBetween | Line: 152 ]]
	local v1 = p1:Dot(p2)
	if v1 > 0.99999 then
		return CFrame.new()
	end
	if v1 < -0.99999 then
		return CFrame.fromAxisAngle(p3, p4)
	else
		return CFrame.fromAxisAngle(p1:Cross(p2), (math.acos(v1)))
	end
end
function t.interpolateNumberSequences(p1, p2, p3) --[[ interpolateNumberSequences | Line: 162 | Upvalues: t (copy) ]]
	local Keypoints = p1.Keypoints
	local Keypoints_2 = p2.Keypoints
	if #Keypoints ~= #Keypoints_2 then
		error("NumberSequences must have the same number of keypoints!")
	end
	local t2 = {}
	for i = 1, #Keypoints do
		local v1 = Keypoints[i]
		local v2 = Keypoints_2[i]
		if v1.Time ~= v2.Time then
			error("Keypoints at same index must have the same Time!")
		end
		local v3 = t.lerp(v1.Value, v2.Value, p3)
		local v4 = t.lerp(v1.Envelope, v2.Envelope, p3)
		local v5 = NumberSequenceKeypoint.new
		table.insert(t2, v5(v1.Time, v3, v4))
	end
	return NumberSequence.new(t2)
end
function t.normalizeToConstant(p1, p2) --[[ normalizeToConstant | Line: 191 ]]
	local t = {}
	for i, v in ipairs(p1.Keypoints) do
		local v1 = NumberSequenceKeypoint.new
		table.insert(t, v1(v.Time, p2))
	end
	return NumberSequence.new(t)
end
function t.isNaN(p1) --[[ isNaN | Line: 202 | Upvalues: t (copy) ]]
	if typeof(p1) == "Vector3" then
		return (t.isNaN(p1.X) or (t.isNaN(p1.Y) or t.isNaN(p1.Z))) and true or false
	end
	if typeof(p1) == "CFrame" then
		if t.isNaN(p1.p) then
			return true
		else
			return t.isNaN(p1.LookVector)
		end
	else
		local v1 = math.abs(p1)
		if not v1 then
			return true
		end
		if v1 >= (1 / 0) then
			return true
		end
		return p1 ~= p1
	end
end
function t.replaceColors(p1, p2) --[[ replaceColors | Line: 229 ]]
	local v1 = Color3.fromRGB(255, 255, 255)
	local t = {}
	for i, v in ipairs(p1.Keypoints) do
		local v2 = v.Value
		local Time = v.Time
		if v2 == v1 then
			table.insert(t, ColorSequenceKeypoint.new(Time, v2))
			continue
		end
		table.insert(t, ColorSequenceKeypoint.new(Time, p2))
	end
	return ColorSequence.new(t)
end
return t