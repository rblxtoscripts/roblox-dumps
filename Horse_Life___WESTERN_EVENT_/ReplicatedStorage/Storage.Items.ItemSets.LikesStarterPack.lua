-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137 Thank you for hitting 60k likes! \240\159\142\137",
	Items = {
		Coins = 1500,
		RandomWingPotion = 1,
		WovenLasso = 10,
		InstantFoalPotion = 5,
		TraitBoostPotion = 5
	},
	Claimable = {
		ClaimBeforeTimestamp = 1750207024,
		Badges = { "AlphaTester", "BetaTester" }
	},
	ExtraItems = {
		StarterHorse = {
			Species = "Horse",
			Gender = "Male",
			Origin = "Wild",
			Age = 66,
			Equipped = true,
			NoMutations = true,
			Preset = function() --[[ Preset | Line: 40 | Upvalues: StarterPresets (copy) ]]
				return StarterPresets[math.random(1, #StarterPresets)]
			end
		}
	}
}