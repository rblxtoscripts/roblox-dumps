-- https://lua.expert/
local Names = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("Constants").Names
return {
	Names = Names,
	GetRandomName = function() --[[ GetRandomName | Line: 9 | Upvalues: Names (copy) ]]
		return Names[math.random(#Names)]
	end
}