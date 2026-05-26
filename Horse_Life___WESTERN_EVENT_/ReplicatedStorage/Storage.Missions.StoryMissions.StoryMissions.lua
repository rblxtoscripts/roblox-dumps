-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
Sonar("Constants")
game:GetService("RunService"):IsServer()
local tbl = {}
for k, v in pairs(script.Parent.Chapters:GetChildren()) do
	tbl[tonumber(v.Name)] = Sonar(v)
end
for k, v in pairs(tbl) do
	for k2, v2 in pairs(v.Stories) do
		v2.Name = k2
	end
end
return {
	Chapters = tbl
}