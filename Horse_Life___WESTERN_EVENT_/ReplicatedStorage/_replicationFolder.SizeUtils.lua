-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("Constants")
local v2 = Sonar("WeightedProbability")
local SizeTable = v1.Sizes.SizeTable
local SizeArray = v1.Sizes.SizeArray
return {
	SizeArray = SizeArray,
	Sizes = SizeTable,
	GetRandomSize = function(p1) --[[ GetRandomSize | Line: 12 | Upvalues: v2 (copy), SizeArray (copy) ]]
		return SizeArray[v2.getRandomWeightedItem(SizeArray, p1)].Name
	end,
	GetSize = function(p1) --[[ GetSize | Line: 17 | Upvalues: SizeTable (copy) ]]
		return SizeTable[p1]
	end,
	GetSizeIndex = function(p1) --[[ GetSizeIndex | Line: 20 | Upvalues: SizeArray (copy) ]]
		for v1, v2 in SizeArray do
			if p1 == v2.Name then
				return v1, v2
			end
		end
	end
}