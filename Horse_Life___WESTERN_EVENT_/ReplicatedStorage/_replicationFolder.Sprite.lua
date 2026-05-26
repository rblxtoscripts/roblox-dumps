-- https://lua.expert/
local t = {
	ClassName = "Sprite"
}
t.__index = t
function t.new(p1) --[[ new | Line: 8 | Upvalues: t (copy) ]]
	assert(p1.Texture)
	assert(p1.Size)
	assert(p1.Position)
	assert(p1.Name)
	return setmetatable(p1, t)
end
function t.Style(p1, p2) --[[ Style | Line: 19 ]]
	p2.Size = UDim2.new(0, p1.Size.X, 0, p1.Size.Y)
	p2.ImageRectOffset = p1.Position
	p2.ImageRectSize = p1.Size
	return p2
end
function t.Get(p1, p2) --[[ Get | Line: 27 ]]
	local v1 = Instance.new(p2)
	v1.Name = p1.Name
	v1.BackgroundTransparency = 1
	v1.BorderSizePixel = 1
	v1.Image = p1.Texture
	p1:Style(v1)
	return v1
end
return t