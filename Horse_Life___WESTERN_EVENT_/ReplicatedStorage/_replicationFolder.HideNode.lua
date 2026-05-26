-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("Binder")
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 9 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Object = p1
	if not v2.Object:IsA("Model") then
		v2.Object.Transparency = 1
		return v2
	end
	for v3, v4 in p1:GetChildren() do
		if v4:IsA("BasePart") then
			v4.Transparency = 1
		end
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 29 ]]
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 33 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("HideNode", t):Init()
end
t.Init()
return t