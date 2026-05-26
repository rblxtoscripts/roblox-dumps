-- https://lua.expert/
local WedgePart = Instance.new("WedgePart")
WedgePart.Material = Enum.Material.SmoothPlastic
WedgePart.Anchored = true
WedgePart.CanCollide = false
WedgePart.Color = Color3.new(255/255, 255/255, 255/255)
return function(p1, p2, p3, p4) --[[ Line: 9 | Upvalues: WedgePart (copy) ]]
	local v1 = p3 - p2
	local v2 = p4 - p2
	local v3 = p4 - p3
	local v4 = v1:Dot(v1)
	local v5 = v2:Dot(v2)
	local v6 = v3:Dot(v3)
	if v5 < v4 and v6 < v4 then
		p2, p4 = p4, p2
	elseif v6 < v5 and v4 < v5 then
		p3, p2 = p2, p3
	end
	local v8 = p3 - p2
	local v9 = p4 - p2
	local v10 = p4 - p3
	local Unit = v9:Cross(v8).Unit
	local Unit_2 = v10:Cross(Unit).Unit
	local Unit_3 = v10.Unit
	local v12 = math.abs((v8:Dot(Unit_2)))
	local v14 = math.abs((v8:Dot(Unit_3)))
	local v16 = math.abs((v9:Dot(Unit_3)))
	local v17 = WedgePart:Clone()
	v17.Size = Vector3.new(0, v12, v14)
	v17.CFrame = CFrame.fromMatrix((p2 + p3) / 2, Unit, Unit_2, Unit_3)
	v17.Parent = p1
	local v18 = WedgePart:Clone()
	v18.Size = Vector3.new(0, v12, v16)
	v18.CFrame = CFrame.fromMatrix((p2 + p4) / 2, -Unit, Unit_2, -Unit_3)
	v18.Parent = p1
	return v17, v18
end