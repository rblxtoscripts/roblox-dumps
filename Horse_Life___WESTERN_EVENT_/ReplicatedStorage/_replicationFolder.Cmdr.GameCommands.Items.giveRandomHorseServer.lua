-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local t = { "Clydesdale" }
return function(p1, p2, p3) --[[ Line: 21 | Upvalues: v1 (copy), Sonar (copy), t (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p2)
	for i = 1, p3 do
		Sonar("AnimalDataService").CreateSlot(v12, {
			Gender = "Female",
			Origin = "Wild",
			Age = 100,
			Species = t[math.random(#t)]
		})
	end
end