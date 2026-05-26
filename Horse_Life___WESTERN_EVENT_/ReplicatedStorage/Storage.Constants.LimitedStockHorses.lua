-- https://lua.expert/
return {
	{
		MaxStock = 7500,
		StockId = "StockClydesdale1",
		DisplayName = "Mesa Clydesdale",
		MissionUnlockRequired = true,
		MissionUnlockSkippable = true,
		FertileChoice = true,
		Currency = "Coins",
		FertilePrice = 12000,
		InfertilePrice = 6000,
		Infertile = true,
		Origin = "Developer",
		Species = "Clydesdale",
		Preset = { "Mesa" },
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
			Wings = 50
		},
		MaxCosmetics = {
			MaxPatternsPerSlot = 4,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 4,
			AlwaysMax = false
		}
	}
}