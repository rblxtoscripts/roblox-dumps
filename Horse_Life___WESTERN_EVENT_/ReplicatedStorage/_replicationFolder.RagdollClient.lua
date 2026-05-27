-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("BaseObject")
local v2 = setmetatable({}, v1)
v2.ClassName = "RagdollClient"
v2.__index = v2
function v2.new(p1) --[[ new | Line: 11 | Upvalues: v1 (copy), v2 (copy) ]]
	return setmetatable(v1.new(p1), v2)
end
return v2