-- https://lua.expert/
return {
	OnlyDropSpecies = true,
	SpeciesDropCount = 1,
	Drops = {
		{
			Name = "TraitBoostPotion",
			Amount = 1,
			P = 10,
			DoNotRemove = true
		}
	},
	Species = {
		{
			Species = "Crystallion",
			MaxEyeRarity = 20,
			P = 1,
			Preset = { "PurpleGem", "VioletGem", "SeaGreenGem", "GreenMarble", "BlueLav", "RockyCrystal", "RedStone", "Amber" },
			MutationSlotChances = {
				{
					Amount = 0,
					P = 0
				},
				{
					Amount = 1,
					P = 0
				},
				{
					Amount = 2,
					P = 0
				},
				{
					Amount = 3,
					P = 1
				}
			},
			MutationChances = {
				Nothing = 0,
				Wings = 15
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4
			}
		}
	},
	MutationChances = {}
}