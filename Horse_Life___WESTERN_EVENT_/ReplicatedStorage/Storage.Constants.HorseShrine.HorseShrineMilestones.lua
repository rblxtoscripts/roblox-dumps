-- https://lua.expert/
return {
	[25] = {
		{
			Name = "TraitBoostPotion",
			Amount = 3
		}
	},
	[50] = {
		{
			Theme = "Random",
			ThemeChance = 1,
			Name = "CelestialStaff",
			Amount = 1
		}
	},
	[150] = {
		{
			Name = "Galactic",
			Amount = 1
		},
		{
			Name = "StarStream",
			Amount = 1
		}
	},
	[250] = {
		{
			Name = "InstantFoalPotion",
			Amount = 5
		}
	},
	[500] = {
		{
			Species = "Celestial",
			Preset = { "CelestialVibrant", "CelestialPurple" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 2,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 2,
				AlwaysMax = true
			}
		}
	},
	[750] = {
		{
			Theme = "Nebula",
			Name = "RandomEquipment",
			Amount = 1
		}
	},
	[1250] = {
		{
			Name = "CelestialWingPotion",
			Amount = 1
		}
	},
	[1750] = {
		{
			Species = "Celestial",
			MaxEyeRarity = 40,
			Preset = { "CelestialVibrant", "CelestialPurple", "CelestialBlack", "CelestialWhite", "CelestialHorizon" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	[2500] = {
		{
			Theme = "Random",
			Name = "GenderSwapPotion",
			Amount = 1
		}
	}
}