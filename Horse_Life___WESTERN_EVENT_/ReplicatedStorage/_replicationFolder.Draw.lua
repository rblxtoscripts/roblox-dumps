-- https://lua.expert/
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local Debris = game:GetService("Debris")
local Terrain = Workspace.Terrain
local v1 = Color3.new(255/255, 0/255, 0/255)
local t = {
	_defaultColor = v1
}
function t.setColor(p1) --[[ setColor | Line: 19 | Upvalues: t (copy) ]]
	t._defaultColor = p1
end
function t.resetColor() --[[ resetColor | Line: 23 | Upvalues: t (copy), v1 (copy) ]]
	t._defaultColor = v1
end
function t.setRandomColor() --[[ setRandomColor | Line: 28 | Upvalues: t (copy) ]]
	t.setColor(Color3.fromHSV(math.random(), 0.5 + 0.5 * math.random(), 1))
end
function t.ray(p1, p2) --[[ ray | Line: 35 | Upvalues: t (copy), Debris (copy) ]]
	assert(if typeof(p1) == "Ray" then true else false)
	local v2 = if p2 then p2 else {}
	local v3 = v2.Color or t._defaultColor
	local v4 = v2.Parent or t.getDefaultParent()
	local v5 = v2.MeshDiameter or 0.2
	local v6 = v2.Diameter or 0.2
	local DebugRay = Instance.new("Part")
	DebugRay.Material = Enum.Material.ForceField
	DebugRay.Anchored = true
	DebugRay.Archivable = false
	DebugRay.CanCollide = false
	DebugRay.CastShadow = false
	DebugRay.CanQuery = false
	DebugRay.CFrame = CFrame.new(p1.Origin + p1.Direction / 2, p1.Origin + p1.Direction) * CFrame.Angles(1.5707963267948966, 0, 0)
	DebugRay.Color = v3
	DebugRay.Name = "DebugRay"
	DebugRay.Shape = Enum.PartType.Cylinder
	DebugRay.Size = Vector3.new(v6, p1.Direction.Magnitude, v6)
	DebugRay.TopSurface = Enum.SurfaceType.Smooth
	DebugRay.Transparency = 0.5
	local Part = Instance.new("Part")
	Part.Anchored = true
	Part.Archivable = false
	Part.CanCollide = false
	Part.CastShadow = false
	Part.CFrame = CFrame.new(p1.Origin, p1.Origin + p1.Direction)
	Part.Transparency = 1
	Part.Size = Vector3.new(1, 1, 1)
	Part.Parent = DebugRay
	local LineHandleAdornment = Instance.new("LineHandleAdornment")
	LineHandleAdornment.Length = p1.Direction.Magnitude
	LineHandleAdornment.Thickness = 5 * v6
	LineHandleAdornment.ZIndex = 3
	LineHandleAdornment.Color3 = v3
	LineHandleAdornment.AlwaysOnTop = true
	LineHandleAdornment.Transparency = 0
	LineHandleAdornment.Adornee = Part
	LineHandleAdornment.Parent = Part
	local SpecialMesh = Instance.new("SpecialMesh")
	SpecialMesh.Scale = Vector3.new(0, 1, 0) + Vector3.new(v5, 0, v5) / v6
	SpecialMesh.Parent = DebugRay
	DebugRay.Parent = v4
	if v2.AutoDestroy then
		Debris:AddItem(DebugRay, v2.AutoDestroy)
	end
	return DebugRay
end
function t.text(p1, p2, p3) --[[ text | Line: 94 | Upvalues: t (copy), Terrain (copy), Debris (copy) ]]
	local v1 = if p3 then p3 else {}
	local v2 = v1.Color or t._defaultColor
	local v3 = nil
	local v4
	if typeof(p1) == "Vector3" then
		local DebugTextAttachment = Instance.new("Attachment")
		DebugTextAttachment.WorldPosition = p1
		DebugTextAttachment.Parent = Terrain
		DebugTextAttachment.Name = "DebugTextAttachment"
		t._textOnAdornee(DebugTextAttachment, p2, v2)
		v4 = v1
		v3 = DebugTextAttachment
	elseif typeof(p1) == "Instance" then
		v4, v3 = v1, t._textOnAdornee(p1, p2, v2)
	else
		error("Bad adornee")
	end
	if v4.AutoDestroy then
		Debris:AddItem(v3, v4.AutoDestroy)
	end
	return v3
end
function t._textOnAdornee(p1, p2, p3) --[[ _textOnAdornee | Line: 121 | Upvalues: t (copy), TextService (copy) ]]
	local DebugBillboardGui = Instance.new("BillboardGui")
	DebugBillboardGui.Name = "DebugBillboardGui"
	DebugBillboardGui.SizeOffset = Vector2.new(0, 0.5)
	DebugBillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
	DebugBillboardGui.AlwaysOnTop = true
	DebugBillboardGui.Adornee = p1
	DebugBillboardGui.StudsOffset = Vector3.new(0, 0, 0.01)
	local Background = Instance.new("Frame")
	Background.Name = "Background"
	Background.Size = UDim2.new(1, 0, 1, 0)
	Background.Position = UDim2.new(0.5, 0, 1, 0)
	Background.AnchorPoint = Vector2.new(0.5, 1)
	Background.BackgroundTransparency = 0.3
	Background.BorderSizePixel = 0
	Background.BackgroundColor3 = if p3 then p3 else t._defaultColor
	Background.Parent = DebugBillboardGui
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Text = tostring(p2)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 32
	TextLabel.BackgroundTransparency = 1
	TextLabel.BorderSizePixel = 0
	TextLabel.TextColor3 = Color3.new(255/255, 255/255, 255/255)
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Parent = Background
	if tonumber(p2) then
		TextLabel.Font = Enum.Font.Code
	else
		TextLabel.Font = Enum.Font.GothamSemibold
	end
	local v2 = TextService:GetTextSize(TextLabel.Text, TextLabel.TextSize, TextLabel.Font, Vector2.new(1024, 1000000))
	local v4 = TextLabel.TextSize * 0.5
	local v5 = v2.y + 2 * v4
	local v6 = v2.x + 2 * v4
	local v7 = v6 / v5
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.AspectRatio = v7
	UIAspectRatioConstraint.Parent = Background
	local UIPadding = Instance.new("UIPadding")
	UIPadding.PaddingBottom = UDim.new(v4 / v5, 0)
	UIPadding.PaddingTop = UDim.new(v4 / v5, 0)
	UIPadding.PaddingLeft = UDim.new(v4 / v6, 0)
	UIPadding.PaddingRight = UDim.new(v4 / v6, 0)
	UIPadding.Parent = Background
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(v4 / v5 / 2, 0)
	UICorner.Parent = Background
	local v8 = v2.y / TextLabel.TextSize * 2 * 2 * 0.5
	DebugBillboardGui.Size = UDim2.new(v8 * v7, 0, v8, 0)
	DebugBillboardGui.Parent = p1
	return DebugBillboardGui
end
function t.point(p1, p2) --[[ point | Line: 199 | Upvalues: t (copy), Debris (copy) ]]
	local v1 = if p2 then p2 else {}
	assert(typeof(p1) == "Vector3")
	if typeof(p1) == "CFrame" then
		p1 = p1.p
	end
	local v3 = v1.Color or t._defaultColor
	local v4 = v1.Parent or t.getDefaultParent()
	local v5 = v1.Diameter or 1
	local DebugPoint = Instance.new("Part")
	DebugPoint.Material = Enum.Material.ForceField
	DebugPoint.Anchored = true
	DebugPoint.Archivable = false
	DebugPoint.BottomSurface = Enum.SurfaceType.Smooth
	DebugPoint.CanCollide = false
	DebugPoint.CastShadow = false
	DebugPoint.CanQuery = false
	DebugPoint.CFrame = CFrame.new(p1)
	DebugPoint.Color = v3
	DebugPoint.Name = "DebugPoint"
	DebugPoint.Shape = Enum.PartType.Ball
	DebugPoint.Size = Vector3.new(v5, v5, v5)
	DebugPoint.TopSurface = Enum.SurfaceType.Smooth
	DebugPoint.Transparency = v1.Transparency or 0.5
	if not v1.Simple then
		local SphereHandleAdornment = Instance.new("SphereHandleAdornment")
		SphereHandleAdornment.Archivable = false
		SphereHandleAdornment.Radius = v5 / 4
		SphereHandleAdornment.Color3 = v3
		SphereHandleAdornment.AlwaysOnTop = true
		SphereHandleAdornment.Adornee = DebugPoint
		SphereHandleAdornment.ZIndex = 2
		SphereHandleAdornment.Parent = DebugPoint
	end
	DebugPoint.Parent = v4
	if v1.AutoDestroy then
		Debris:AddItem(DebugPoint, v1.AutoDestroy)
	end
	return DebugPoint
end
function t.cframe(p1) --[[ cframe | Line: 248 | Upvalues: t (copy) ]]
	local DebugCFrame = Instance.new("Model")
	DebugCFrame.Name = "DebugCFrame"
	local Position = p1.Position
	t.point(Position, {
		Diameter = 0.1,
		Parent = DebugCFrame
	})
	t.ray(Ray.new(Position, p1.XVector), {
		MeshDiameter = 0.1,
		Color = Color3.new(0.75, 0.25, 0.25),
		Parent = DebugCFrame
	}).Name = "XVector"
	t.ray(Ray.new(Position, p1.YVector), {
		MeshDiameter = 0.1,
		Color = Color3.new(0.25, 0.75, 0.25),
		Parent = DebugCFrame
	}).Name = "YVector"
	t.ray(Ray.new(Position, p1.ZVector), {
		MeshDiameter = 0.1,
		Color = Color3.new(0.25, 0.25, 0.75),
		Parent = DebugCFrame
	}).Name = "ZVector"
	DebugCFrame.Parent = t.getDefaultParent()
	return DebugCFrame
end
function t.box(p1, p2, p3) --[[ box | Line: 269 | Upvalues: t (copy) ]]
	assert(if typeof(p2) == "Vector3" then true else false)
	local v2 = if p3 then p3 else t._defaultColor
	local v3, v4
	if typeof(p1) == "Vector3" then
		v3 = CFrame.new(p1)
		if v3 then
			v4 = v2
		else
			v3 = p1
			v4 = v2
		end
	else
		v3 = p1
		v4 = v2
	end
	local DebugPart = Instance.new("Part")
	DebugPart.Color = v4
	DebugPart.Material = Enum.Material.ForceField
	DebugPart.Name = "DebugPart"
	DebugPart.Anchored = true
	DebugPart.CanCollide = false
	DebugPart.CastShadow = false
	DebugPart.Archivable = false
	DebugPart.BottomSurface = Enum.SurfaceType.Smooth
	DebugPart.TopSurface = Enum.SurfaceType.Smooth
	DebugPart.Transparency = 0.75
	DebugPart.Size = p2
	DebugPart.CFrame = v3
	local BoxHandleAdornment = Instance.new("BoxHandleAdornment")
	BoxHandleAdornment.Adornee = DebugPart
	BoxHandleAdornment.Size = p2
	BoxHandleAdornment.Color3 = v4
	BoxHandleAdornment.AlwaysOnTop = true
	BoxHandleAdornment.Transparency = 0.75
	BoxHandleAdornment.ZIndex = 1
	BoxHandleAdornment.Parent = DebugPart
	DebugPart.Parent = t.getDefaultParent()
	return DebugPart
end
function t.region3(p1, p2) --[[ region3 | Line: 303 | Upvalues: t (copy) ]]
	return t.box(p1.CFrame, p1.Size, p2)
end
function t.terrainCell(p1, p2) --[[ terrainCell | Line: 307 | Upvalues: Terrain (copy), t (copy) ]]
	local v1 = Terrain:WorldToCell(p1)
	local DebugTerrainCell = t.box(CFrame.new((Terrain:CellCenterToWorld(v1.x, v1.y, v1.z))), Vector3.new(4, 4, 4), p2)
	DebugTerrainCell.Name = "DebugTerrainCell"
	return DebugTerrainCell
end
function t.vector(p1, p2, p3) --[[ vector | Line: 319 | Upvalues: t (copy) ]]
	return t.ray(Ray.new(p1, p2), if p3 then {
	Color = p3
} or nil else nil)
end
function t.getDefaultParent() --[[ getDefaultParent | Line: 323 | Upvalues: RunService (copy), Workspace (copy) ]]
	if not RunService:IsRunning() then
		return Workspace.CurrentCamera
	end
	return RunService:IsServer() and Workspace or Workspace.CurrentCamera
end
return t