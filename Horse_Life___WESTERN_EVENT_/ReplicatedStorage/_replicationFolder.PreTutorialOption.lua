-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
Sonar("PromptClient")
Sonar("Signal").new()
function t.Run(p1, p2) --[[ Run | Line: 16 ]] end
return t