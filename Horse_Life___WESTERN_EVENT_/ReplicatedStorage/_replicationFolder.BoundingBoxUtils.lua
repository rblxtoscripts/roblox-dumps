-- https://lua.expert/
local v1 = CFrame.new()
function _getBoundingBox(p1, p2) --[[ _getBoundingBox | Line: 3 | Upvalues: v1 (copy) ]]
	if typeof(p1) == "Instance" then
		p1 = p1:GetDescendants()
	end
	if not p2 then
		p2 = v1
	end
	local abs = math.abs
	local v2 = (-1 / 0)
	local v3 = (-1 / 0)
	local v4 = (-1 / 0)
	local v5 = (1 / 0)
	local v6 = (1 / 0)
	local v7 = (1 / 0)
	for k, v in pairs(p1) do
		if v:IsA("BasePart") and not v.Name:find("BreathImpactPart") then
			local v8 = p2:ToObjectSpace(v.CFrame)
			local Size = v.Size
			local X = Size.X
			local Y = Size.Y
			local Z = Size.Z
			local v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20 = v8:components()
			local v21 = 0.5 * (abs(v12) * X + abs(v13) * Y + abs(v14) * Z)
			local v22 = 0.5 * (abs(v15) * X + abs(v16) * Y + abs(v17) * Z)
			local v23 = 0.5 * (abs(v18) * X + abs(v19) * Y + abs(v20) * Z)
			if v9 - v21 < v5 then
				v5 = v9 - v21
			end
			if v10 - v22 < v6 then
				v6 = v10 - v22
			end
			if v11 - v23 < v7 then
				v7 = v11 - v23
			end
			if v2 < v9 + v21 then
				v2 = v9 + v21
			end
			if v3 < v10 + v22 then
				v3 = v10 + v22
			end
			if v4 < v11 + v23 then
				v4 = v11 + v23
			end
		end
	end
	local v24 = Vector3.new(v5, v6, v7)
	local v25 = Vector3.new(v2, v3, v4)
	return p2 - p2.p + p2:PointToWorldSpace((v25 + v24) / 2), v25 - v24
end
return _getBoundingBox