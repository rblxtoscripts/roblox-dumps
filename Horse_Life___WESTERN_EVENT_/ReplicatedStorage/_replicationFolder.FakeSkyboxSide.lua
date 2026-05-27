-- https://lua.expert/
local t = {}
t.__index = t
t.ClassName = "FakeSkyboxSide"
t.CanvasSize = 1024
t.PartWidth = 1
function t.new(p1, p2, p3) --[[ new | Line: 7 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.PartSize = if p1 then p1 else error("No PartSize")
	v2.Transparency = 1
	v2.Normal = if p2 then p2 else error("No Normal")
	v2.Part = Instance.new("Part")
	v2.Part.Name = "SkyboxSide" .. v2.Normal.Name
	v2.Part.Anchored = true
	v2.Part.Transparency = 1
	v2.Part.CanCollide = false
	v2.SurfaceGui = Instance.new("SurfaceGui")
	v2.SurfaceGui.Adornee = v2.Part
	v2.SurfaceGui.CanvasSize = Vector2.new(v2.CanvasSize, v2.CanvasSize)
	v2.SurfaceGui.LightInfluence = 0
	v2.SurfaceGui.Face = Enum.NormalId.Front
	v2.SurfaceGui.Parent = v2.Part
	local ImageLabel = Instance.new("ImageLabel")
	ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel.ImageTransparency = v2.Transparency
	ImageLabel.BackgroundColor3 = Color3.new(0/255, 0/255, 0/255)
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Parent = v2.SurfaceGui
	v2.ImageLabel = ImageLabel
	v2:UpdateSizing()
	v2.Part.Parent = p3
	return v2
end
function t.SetPartSize(p1, p2) --[[ SetPartSize | Line: 46 ]]
	p1.PartSize = if p2 then p2 else error("No PartSize")
	p1:UpdateSizing()
	return p1
end
function t.UpdateSizing(p1) --[[ UpdateSizing | Line: 53 ]]
	p1.Part.Size = Vector3.new(p1.PartSize, p1.PartSize, p1.PartWidth)
	local v1 = Vector3.FromNormalId(p1.Normal)
	p1.Relative = CFrame.new(v1 * (p1.PartSize / 2) + v1 * p1.PartWidth / 2) * CFrame.new(Vector3.new(0, 0, 0), -v1)
	if p1.Normal ~= Enum.NormalId.Bottom then
		return
	end
	p1.Relative = p1.Relative * CFrame.Angles(0, 0, math.pi)
end
function t.SetImage(p1, p2) --[[ SetImage | Line: 68 ]]
	p1.ImageLabel.Image = p2
	return p1
end
function t.SetTransparency(p1, p2) --[[ SetTransparency | Line: 74 ]]
	p1.Transparency = if p2 then p2 else error("No Transparency")
	p1.ImageLabel.ImageTransparency = p2
	return p1
end
function t.UpdateRender(p1, p2) --[[ UpdateRender | Line: 81 ]]
	p1.Part.CFrame = p2 * p1.Relative
end
return t