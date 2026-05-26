-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Constants")
function t.new() --[[ new | Line: 14 ]] end
function t.Destroy(p1) --[[ Destroy | Line: 18 ]]
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 22 | Upvalues: v1 (copy), v2 (copy), t (copy) ]]
	v1.new(v2.AnimalTag, t):Init()
end
return t