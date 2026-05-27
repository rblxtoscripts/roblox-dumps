-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnimalDataService")
local v2 = Sonar("PlayerWrapper")
return function(p1, p2, p3, p4) --[[ Line: 9 | Upvalues: v2 (copy), v1 (copy) ]]
	local v12 = v2.getWrapperFromPlayer(p2)
	if not v12 then
		return
	end
	if p3 then
		v1.CreateSlot(v12, {
			Origin = "Wild",
			Age = 100,
			Species = p3 or "Horse",
			Preset = p4 or nil,
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4
			}
		})
		return "Gave horse"
	end
end