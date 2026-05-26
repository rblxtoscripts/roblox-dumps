-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlaceTypeService")
local function init(p1) --[[ init | Line: 11 | Upvalues: Sonar (copy) ]]
	Sonar(p1)
end
Sonar("HorseShrineGui")
Sonar("FlagTurnin")
if not v1.IsCompHub() then
	Sonar("DiggingService")
	Sonar("ShovelNodes")
	Sonar("FreeShovelService")
end
Sonar("CluesClient")
Sonar("AppleStart")
Sonar("MazeClient")
Sonar("CostumeContestGui")
Sonar("MutationSpawnService")
Sonar("FireWhisps")
Sonar("DungeonResources")
Sonar("FireWispsBinder")
Sonar("SpeciesSpawnService")
Sonar("WishingWell")
Sonar("KirinEggs")
Sonar("KirinDance")
return {}