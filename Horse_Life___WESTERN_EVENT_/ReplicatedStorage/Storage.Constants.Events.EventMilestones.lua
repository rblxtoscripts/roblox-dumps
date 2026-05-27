-- https://lua.expert/
return {
	[25] = {
		{
			Name = "RandomEquipment",
			Amount = 1,
			Theme = { "Mint", "Rose" }
		}
	},
	[50] = {
		Species = "Pastrequine",
		Preset = { "PastryDStraw" },
		MaxCosmetics = {
			MaxPatternsPerSlot = 4,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 4,
			AlwaysMax = true
		}
	},
	[100] = {
		Name = "SweetWingPotion",
		Amount = 1
	},
	[250] = {
		Species = "Pastrequine",
		Infertile = true,
		Origin = "Developer",
		Preset = {
			"Demon",
			"Nightmare",
			"Vampire",
			"Poison",
			"MoonL",
			"MoonD",
			"Morpho",
			"PlushNeapolitan",
			"PlushNeapolitan2",
			"PlushMatchaBoba",
			"PlushRainbowSherbet",
			"JewelBeetle"
		},
		MaxCosmetics = {
			MaxPatternsPerSlot = 4,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 4,
			AlwaysMax = true
		}
	}
}