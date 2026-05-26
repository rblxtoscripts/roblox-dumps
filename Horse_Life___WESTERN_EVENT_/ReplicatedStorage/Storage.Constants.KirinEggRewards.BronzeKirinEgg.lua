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
			P = 1,
			Preset = { "KirinForest", "KirinSunset", "KirinWarm" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 1,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 1
			}
		}
	},
	MutationChances = {}
}