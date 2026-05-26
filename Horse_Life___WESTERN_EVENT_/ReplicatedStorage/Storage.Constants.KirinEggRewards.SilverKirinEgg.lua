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
			Species = "Kirin",
			MaxEyeRarity = 40,
			P = 1,
			Preset = { "KirinWhite", "KirinVibrant", "KirinBlue" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 2,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 2
			}
		}
	},
	MutationChances = {}
}