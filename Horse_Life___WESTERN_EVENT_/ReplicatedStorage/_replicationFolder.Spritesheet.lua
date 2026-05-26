-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("Sprite")
local t = {
	ClassName = "Spritesheet"
}
t.__index = t
function t.new(p1) --[[ new | Line: 12 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2._texture = if p1 then p1 else error("no texture")
	v2._sprites = {}
	return v2
end
function t.AddSprite(p1, p2, p3, p4) --[[ AddSprite | Line: 21 | Upvalues: v1 (copy) ]]
	assert(not p1._sprites[p2])
	p1._sprites[p2] = v1.new({
		Texture = p1._texture,
		Position = p3,
		Size = p4,
		Name = tostring(p2)
	})
end
function t.GetSprite(p1, p2) --[[ GetSprite | Line: 34 ]]
	if not p2 then
		warn("[Spritesheet.GetSprite] - Image name cannot be nil")
		return nil
	end
	local v1 = p1._sprites[p2]
	if v1 then
		return v1
	end
	if typeof(p2) == "EnumItem" then
		v1 = p1._sprites[p2.Name]
	end
	return v1
end
function t.HasSprite(p1, p2) --[[ HasSprite | Line: 52 ]]
	return p1:GetSprite(p2) ~= nil
end
return t