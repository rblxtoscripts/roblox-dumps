-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
Sonar("Constants")
game:GetService("RunService"):IsServer()
local t = {}
for k, v in pairs(script.Parent.MissionTiers:GetChildren()) do
	t[tonumber(v.Name)] = Sonar(v)
end
return {
	StreakTiers = Sonar(script.Parent.StreakTiers),
	Missions = t
}