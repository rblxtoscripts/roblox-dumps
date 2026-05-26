-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("Maid")
local t = {
	ClassName = "BaseObject"
}
t.__index = t
function t.new(p1) --[[ new | Line: 12 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2._maid = v1.new()
	v2._obj = p1
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 21 ]]
	p1._maid:DoCleaning()
	setmetatable(p1, nil)
end
return t