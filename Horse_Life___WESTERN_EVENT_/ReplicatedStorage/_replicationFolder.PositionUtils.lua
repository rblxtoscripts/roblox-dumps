-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local v1 = Random.new()
function t.getRandomXAndZPosition(p1, p2) --[[ getRandomXAndZPosition | Line: 10 | Upvalues: v1 (copy) ]]
	return (p1 * CFrame.new(v1:NextNumber(-p2.X / 2, p2.X / 2), p2.Y / 2, v1:NextNumber(-p2.Z / 2, p2.Z / 2))).p
end
function t.getRandomXZFromPart(p1) --[[ getRandomXZFromPart | Line: 20 | Upvalues: t (copy) ]]
	return t.getRandomXAndZPosition(p1.CFrame, p1.Size)
end
function t.getRandomNode(p1, p2) --[[ getRandomNode | Line: 24 | Upvalues: v1 (copy), RunService (copy) ]]
	if not (#p1 > 1) then
		return p1[v1:NextInteger(1, #p1)]
	end
	local v12
	repeat
		v12 = p1[v1:NextInteger(1, #p1)]
		RunService.Heartbeat:Wait()
	until v12 ~= p2
	return v12
end
function t.isPointInsidePart(p1, p2) --[[ isPointInsidePart | Line: 38 | Upvalues: t (copy) ]]
	return t.isPointInsideCFrame(p1.CFrame, p1.Size, p2)
end
function t.isPointInsideCFrame(p1, p2, p3) --[[ isPointInsideCFrame | Line: 42 ]]
	local v1 = p1:pointToObjectSpace(p3)
	local v2 = p2 / 2
	local v3 = -v2
	return if v1.x >= v3.x and (v1.x <= v2.x and (v1.y >= v3.y and (v1.y <= v2.y and v1.z >= v3.z))) then v1.z <= v2.z else false
end
function t.isPointInsidePartXZ(p1, p2) --[[ isPointInsidePartXZ | Line: 53 | Upvalues: t (copy) ]]
	return t.isPointInsideCFrame(p1.CFrame, Vector3.new(p1.Size.X, 0, p1.Size.Z), p2)
end
function t.isPointInsideCylinderCFrame(p1, p2, p3) --[[ isPointInsideCylinderCFrame | Line: 58 ]]
	local v1 = p1:PointToObjectSpace(p3)
	local v2 = p2.X * 0.5
	local v3 = math.min(p2.Y, p2.Z) * 0.5
	if v1.X < -v2 or v2 < v1.X then
		return false
	end
	local Y_2 = v1.Y
	local Z_2 = v1.Z
	return Y_2 * Y_2 + Z_2 * Z_2 <= v3 * v3
end
function t.clampPositionToPart(p1, p2, p3) --[[ clampPositionToPart | Line: 83 ]]
	local v1 = p1.CFrame:PointToObjectSpace(p2)
	local v2 = p1.Size * p3
	return p1.CFrame:PointToWorldSpace((Vector3.new(math.clamp(v1.X, -v2.X / 2, v2.X / 2), v1.Y, (math.clamp(v1.Z, -v2.Z / 2, v2.Z / 2)))))
end
function t.vectorDifferenceXZMagnitude(p1, p2) --[[ vectorDifferenceXZMagnitude | Line: 97 ]]
	local v1 = p1.X - p2.X
	local v2 = p1.Z - p2.Z
	return math.sqrt(v1 * v1 + v2 * v2)
end
function t.getActualPosition(p1) --[[ getActualPosition | Line: 104 ]]
	if not (p1:IsA("Bone") or p1:IsA("Attachment")) then
		return p1.Position
	end
	return p1.WorldCFrame.Position
end
return t