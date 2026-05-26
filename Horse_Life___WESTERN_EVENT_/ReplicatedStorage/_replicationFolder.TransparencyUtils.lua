-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("Constants")
local v2 = Sonar("WeightedProbability")
local TransparencyTable = v1.Transparency.TransparencyTable
local TransparencyArray = v1.Transparency.TransparencyArray
return {
	TransparencyArray = TransparencyArray,
	Transparency = TransparencyTable,
	GetRandomTransparency = function(p1) --[[ GetRandomTransparency | Line: 12 | Upvalues: v2 (copy), TransparencyArray (copy) ]]
		return TransparencyArray[v2.getRandomWeightedItem(TransparencyArray, p1)].Name
	end,
	GetTransparency = function(p1) --[[ GetTransparency | Line: 17 | Upvalues: TransparencyTable (copy) ]]
		return TransparencyTable[p1]
	end,
	GetTransparencyIndex = function(p1) --[[ GetTransparencyIndex | Line: 20 | Upvalues: TransparencyArray (copy) ]]
		for v1, v2 in TransparencyArray do
			if p1 == v2.Name then
				return v1, v2
			end
		end
	end
}