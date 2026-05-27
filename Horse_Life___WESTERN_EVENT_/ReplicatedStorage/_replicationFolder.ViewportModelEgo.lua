-- https://lua.expert/
local t = {}
local function getBoundingBox(p1) --[[ getBoundingBox | Line: 3 ]]
	if p1:IsA("Model") then
		return p1:GetBoundingBox()
	else
		return p1.CFrame, p1.Size
	end
end
local function calculateFOV(p1, p2) --[[ calculateFOV | Line: 10 ]]
	local v2 = math.rad(p1.FieldOfView)
	return p2.x / p2.y * v2, v2
end
local function calculateCFrame(p1, p2, p3, p4, p5, p6) --[[ calculateCFrame | Line: 18 ]]
	local v1, v2
	if p1:IsA("Model") then
		local v3, v4 = p1:GetBoundingBox()
		v1 = v3
		v2 = v4
	else
		v1 = p1.CFrame
		v2 = p1.Size
	end
	local v5 = CFrame.fromEulerAnglesYXZ(math.rad(p3), math.rad(p2), 0)
	local v6 = CFrame.new(v1.Position)
	local v7 = math.tan(p4 / 2)
	local v8 = math.tan(p5 / 2)
	local v9 = 0
	for i = -1, 1, 2 do
		for j = -1, 1, 2 do
			for k = -1, 1, 2 do
				local v10 = Vector3.new(i, j, k) * v2 / 2
				v9 = math.max(v9, math.abs(v10.x) / v7 - v10.z, math.abs(v10.y) / v8 - v10.z)
			end
		end
	end
	return v6 * v5 * CFrame.new(0, 0, v9 + p6)
end
function t.fitCameraInViewport(p1, p2, p3, p4, p5, p6) --[[ fitCameraInViewport | Line: 50 | Upvalues: calculateCFrame (copy) ]]
	local ViewportSize = p3.ViewportSize
	local v2 = math.rad(p3.FieldOfView)
	return calculateCFrame(p2, p4, p5, ViewportSize.x / ViewportSize.y * v2, v2, p6)
end
return t