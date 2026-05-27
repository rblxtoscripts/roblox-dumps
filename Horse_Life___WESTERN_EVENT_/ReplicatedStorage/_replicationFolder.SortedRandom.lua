-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local t = {}
for v1, v2 in require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").RandomDrops.RandomEquipment do
	table.insert(t, v2)
end
table.sort(t, function(p1, p2) --[[ Line: 13 ]]
	return p1.Name < p2.Name
end)
return t