-- https://lua.expert/
function GetBoundingBox(p1, p2) --[[ GetBoundingBox | Line: 2 ]]
	if typeof(p1) == "Instance" then
		local v1 = p1:GetDescendants()
		v1[#v1 + 1] = p1
		p1 = v1
	end
	if not p2 then
		p2 = CFrame.new()
	end
	local abs = math.abs
	local v3 = (-1 / 0)
	local v4 = (-1 / 0)
	local v5 = (-1 / 0)
	local v6 = (1 / 0)
	local v7 = (1 / 0)
	local v8 = (1 / 0)
	for k, v in pairs(p1) do
		if v:IsA("BasePart") then
			local v9 = p2:toObjectSpace(v.CFrame)
			local Size = v.Size
			local X = Size.X
			local Y = Size.Y
			local Z = Size.Z
			local v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21 = v9:components()
			local v22 = 0.5 * (abs(v13) * X + abs(v14) * Y + abs(v15) * Z)
			local v23 = 0.5 * (abs(v16) * X + abs(v17) * Y + abs(v18) * Z)
			local v24 = 0.5 * (abs(v19) * X + abs(v20) * Y + abs(v21) * Z)
			if v10 - v22 < v6 then
				v6 = v10 - v22
			end
			if v11 - v23 < v7 then
				v7 = v11 - v23
			end
			if v12 - v24 < v8 then
				v8 = v12 - v24
			end
			if v3 < v10 + v22 then
				v3 = v10 + v22
			end
			if v4 < v11 + v23 then
				v4 = v11 + v23
			end
			if v5 < v12 + v24 then
				v5 = v12 + v24
			end
		end
	end
	local v25 = Vector3.new(v6, v7, v8)
	local v26 = Vector3.new(v3, v4, v5)
	return p2 - p2.p + p2:pointToWorldSpace((v26 + v25) / 2), v26 - v25
end
function calculateFOV(p1, p2, p3) --[[ calculateFOV | Line: 60 ]]
	local FieldOfView = p1.FieldOfView
	return math.rad((math.deg(math.atan(p2 * math.tan(math.rad(FieldOfView) / 2) / p3) * 2))), math.rad(FieldOfView)
end
function findBoxedCFrame(p1, p2, p3, p4, p5) --[[ findBoxedCFrame | Line: 66 ]]
	local v1, v2 = GetBoundingBox(p1, CFrame.new())
	local t = {
		v1 * CFrame.new(v2.X / 2, v2.Y / 2, v2.Z / 2),
		v1 * CFrame.new(-v2.X / 2, v2.Y / 2, v2.Z / 2),
		v1 * CFrame.new(v2.X / 2, -v2.Y / 2, v2.Z / 2),
		v1 * CFrame.new(-v2.X / 2, -v2.Y / 2, v2.Z / 2),
		v1 * CFrame.new(v2.X / 2, v2.Y / 2, -v2.Z / 2),
		v1 * CFrame.new(-v2.X / 2, v2.Y / 2, -v2.Z / 2),
		v1 * CFrame.new(v2.X / 2, -v2.Y / 2, -v2.Z / 2),
		v1 * CFrame.new(-v2.X / 2, -v2.Y / 2, -v2.Z / 2)
	}
	local v3 = CFrame.new(v1.X, v1.Y, v1.Z) * CFrame.Angles(0, math.rad(p2), 0) * CFrame.Angles(math.rad(p3), 0, 0)
	local v4, v5 = 0, v1
	for i = 1, #t do
		local p = v3:ToObjectSpace(t[i]).p
		local v6 = math.abs(p.Y)
		local v7 = math.abs(p.X)
		v4 = math.max(v4, v6 / math.tan(p5 / 2) - p.Z, v7 / math.tan(p4 / 2) - p.Z)
	end
	return v3 * CFrame.new(0, 0, v4), v4, v5.p
end
function fitCameraInViewport(p1, p2, p3, p4, p5) --[[ fitCameraInViewport | Line: 106 ]]
	local v1, v2
	if p2:IsA("ViewportFrame") then
		local v3, v4 = calculateFOV(p2:FindFirstChildOfClass("Camera"), p2.AbsoluteSize.X, p2.AbsoluteSize.Y)
		v1 = v3
		v2 = v4
	else
		local v5, v6 = calculateFOV(p2, p2.ViewportSize.X, p2.ViewportSize.Y)
		v1 = v5
		v2 = v6
	end
	return findBoxedCFrame(p1, p3, p4, v1, v2)
end
return fitCameraInViewport