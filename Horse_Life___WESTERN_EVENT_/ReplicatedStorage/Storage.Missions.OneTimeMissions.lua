-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))
local tbl = {}
for k, v in pairs(tbl) do
	v.Name = k
end
return {
	Missions = tbl
}