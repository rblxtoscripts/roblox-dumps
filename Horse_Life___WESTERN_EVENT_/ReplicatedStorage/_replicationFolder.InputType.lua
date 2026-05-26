-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("InputTypeDetector")
local v2 = Sonar("State").new(nil)
local function setInputType() --[[ setInputType | Line: 16 | Upvalues: v1 (copy), v2 (copy) ]]
	v2:set((v1.GetInputTypeNameFromInputEnum((v1.GetInputType()))))
end
function t._setupInputType(p1) --[[ _setupInputType | Line: 24 | Upvalues: v1 (copy), setInputType (copy), v2 (copy) ]]
	v1.InputTypeChanged:Connect(setInputType)
	v2:set((v1.GetInputTypeNameFromInputEnum((v1.GetInputType()))))
end
function t.Init(p1) --[[ Init | Line: 30 ]]
	p1:_setupInputType()
end
t:Init()
return v2