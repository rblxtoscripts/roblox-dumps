-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("Constants")
local v2 = Sonar("WeightedProbability")
local ReflectanceTable = v1.Reflectance.ReflectanceTable
local ReflectanceArray = v1.Reflectance.ReflectanceArray
return {
	ReflectanceArray = ReflectanceArray,
	Reflectance = ReflectanceTable,
	GetRandomReflectance = function(p1) --[[ GetRandomReflectance | Line: 12 | Upvalues: v2 (copy), ReflectanceArray (copy) ]]
		return ReflectanceArray[v2.getRandomWeightedItem(ReflectanceArray, p1)].Name
	end,
	GetReflectance = function(p1) --[[ GetReflectance | Line: 17 | Upvalues: ReflectanceTable (copy) ]]
		return ReflectanceTable[p1]
	end,
	GetReflectanceIndex = function(p1) --[[ GetReflectanceIndex | Line: 20 | Upvalues: ReflectanceArray (copy) ]]
		for v1, v2 in ReflectanceArray do
			if p1 == v2.Name then
				return v1, v2
			end
		end
	end
}