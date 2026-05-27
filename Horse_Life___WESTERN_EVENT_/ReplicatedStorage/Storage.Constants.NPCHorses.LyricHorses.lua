-- https://lua.expert/
return {
	{
		Price = 5,
		Item = "Larvae",
		Choices = {
			{
				Age = 0,
				Species = "Fae",
				NoMutations = true,
				P = 75,
				Preset = { "FaeOakwood", "FaeMaple", "FaeAspen", "FaeRedwood" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 0,
					MaxCosmeticsPerSlot = 1
				}
			}
		}
	},
	{
		Price = 10,
		Item = "Larvae",
		Choices = {
			{
				Species = "Fae",
				NoMutations = true,
				P = 75,
				Preset = { "FaeOakwood", "FaeMaple", "FaeAspen", "FaeRedwood", "FaePoinciana" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				},
				MutationChances = {
					Wings = 25
				}
			}
		}
	},
	{
		Price = 3,
		Item = "RareLarvae",
		Choices = {
			{
				Species = "Fae",
				P = 75,
				Preset = { "FaeOakwood", "FaeMaple", "FaeAspen", "FaeRedwood", "FaeBirch" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2
				},
				MutationChances = {}
			}
		}
	},
	{
		Price = 7,
		Item = "RareLarvae",
		Choices = {
			{
				Species = "Fae",
				P = 75,
				Preset = { "FaeOakwood", "FaeMaple", "FaeAspen", "FaeRedwood", "FaeBirch", "FaeGoldBirch", "FaePoinciana" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 2
				},
				MutationChances = {
					Wings = 50
				}
			}
		}
	},
	{
		Price = 2,
		Item = "DivineLarvae",
		Choices = {
			{
				Species = "Fae",
				P = 75,
				MaxEyeRarity = 50,
				Preset = { "FaeOakwood", "FaeMaple", "FaeAspen", "FaeRedwood", "FaeBirch" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 3,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 3
				},
				MutationChances = {
					Nothing = 0
				},
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
						P = 0.5
					},
					{
						Amount = 3,
						P = 0.5
					}
				}
			}
		}
	},
	{
		Price = 5,
		Item = "DivineLarvae",
		Choices = {
			{
				Species = "Fae",
				P = 75,
				MaxEyeRarity = 40,
				Preset = {
					"FaeOakwood",
					"FaeMaple",
					"FaeAspen",
					"FaeRedwood",
					"FaeBirch",
					"FaeBlossom",
					"FaeGoldBirch",
					"FaePoinciana",
					"FaeWisteria"
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 4,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 4
				},
				MutationChances = {
					Nothing = 0,
					Wings = 100
				},
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
				}
			}
		}
	}
}