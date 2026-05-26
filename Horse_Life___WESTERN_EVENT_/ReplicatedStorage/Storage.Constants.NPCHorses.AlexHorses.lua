-- https://lua.expert/
return {
	{
		Price = 1000,
		Choices = {
			{
				Age = 0,
				Species = "Gargoyle",
				NoMutations = true,
				P = 75,
				Preset = { "GargoyleCanyon", "GargoyleBasic", "GargoyleMarble", "GargoyleRocky" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 0,
					MaxCosmeticsPerSlot = 1
				}
			}
		}
	},
	{
		Price = 1500,
		Choices = {
			{
				Species = "Gargoyle",
				NoMutations = true,
				P = 75,
				Preset = { "GargoyleCanyon", "GargoyleBasic", "GargoyleMarble", "GargoyleRocky" },
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
		Price = 2500,
		Choices = {
			{
				Species = "Gargoyle",
				P = 75,
				Preset = { "GargoyleBlack", "GargoyleCanyon", "GargoyleBasic", "GargoyleMarble", "GargoyleRocky" },
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
		Price = 3500,
		Choices = {
			{
				Species = "Gargoyle",
				P = 75,
				Preset = { "GargoyleBlack", "GargoyleCanyon", "GargoyleBasic", "GargoyleMarble", "GargoyleRocky" },
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
		Price = 4000,
		Choices = {
			{
				Species = "Gargoyle",
				P = 75,
				MaxEyeRarity = 50,
				Preset = { "GargoyleBlossom", "GargoyleBlack", "GargoyleCanyon", "GargoyleBasic", "GargoyleMarble", "GargoyleRocky" },
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
		Price = 5000,
		Choices = {
			{
				Species = "Gargoyle",
				P = 75,
				MaxEyeRarity = 40,
				Preset = { "GargoyleBlossom", "GargoyleBlack", "GargoyleCanyon", "GargoyleBasic", "GargoyleMarble", "GargoyleRocky" },
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