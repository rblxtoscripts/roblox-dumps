-- https://lua.expert/
local tbl = {
	{
		PriceMultiplier = 1.25,
		Choices = {
			{
				Species = "Horse",
				NoMutations = true,
				P = 75,
				Preset = { "Brown", "DarkBrown", "LightBrown", "DarkDullBrown", "LightDullBrown", "Tan", "Cream", "Blonde" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 0,
					MaxCosmeticsPerSlot = 0
				}
			},
			{
				Species = "Pony",
				NoMutations = true,
				P = 40,
				Preset = { "Brown", "DarkBrown", "LightBrown", "DarkDullBrown", "LightDullBrown", "Tan", "Cream", "Blonde" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 0,
					MaxCosmeticsPerSlot = 0
				}
			},
			{
				Species = "Equus",
				NoMutations = true,
				P = 25,
				Preset = { "Brown", "DarkBrown", "LightBrown", "DarkDullBrown", "LightDullBrown", "Tan", "Cream", "Blonde" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 0,
					MaxCosmeticsPerSlot = 0
				}
			},
			{
				Species = "Bisorse",
				NoMutations = true,
				P = 10,
				Preset = { "Brown", "DarkBrown", "LightBrown", "DarkDullBrown", "LightDullBrown", "Tan", "Cream" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 0,
					MaxCosmeticsPerSlot = 0
				}
			}
		}
	},
	{
		PriceMultiplier = 1.75,
		Choices = {
			{
				Species = "Horse",
				NoMutations = true,
				P = 35,
				Preset = {
					"White",
					"LightGray",
					"DarkGray",
					"Black",
					"BlueRoan",
					"RedBrown",
					"LightRoan",
					"Blonde",
					"Mustang",
					"Arabian",
					"BlackWhite",
					"WhiteBlack",
					"BrownBlonde"
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			},
			{
				Species = "Pony",
				NoMutations = true,
				P = 35,
				Preset = {
					"White",
					"LightGray",
					"DarkGray",
					"Black",
					"BlueRoan",
					"RedBrown",
					"LightRoan",
					"Blonde",
					"Mustang",
					"Arabian",
					"BlackWhite",
					"WhiteBlack",
					"BrownBlonde"
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			},
			{
				Species = "Equus",
				NoMutations = true,
				P = 25,
				Preset = {
					"Brown",
					"DarkBrown",
					"LightBrown",
					"DarkDullBrown",
					"LightDullBrown",
					"Tan",
					"Cream",
					"Zebra",
					"ZebraRare",
					"Blonde",
					"BrownBlonde"
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			},
			{
				Species = "Bisorse",
				NoMutations = true,
				P = 15,
				Preset = {
					"Brown",
					"DarkBrown",
					"LightBrown",
					"DarkDullBrown",
					"LightDullBrown",
					"Black",
					"BrownBlonde",
					"Tan",
					"Cream"
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			},
			{
				Species = "Caprine",
				NoMutations = true,
				P = 35,
				Preset = {
					"White",
					"LightGray",
					"DarkGray",
					"Black",
					"BlueRoan",
					"RedBrown",
					"LightRoan",
					"Blonde",
					"Brown",
					"DarkBrown",
					"LightBrown",
					"DarkDullBrown",
					"LightDullBrown"
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			}
		}
	},
	{
		PriceMultiplier = 10,
		Choices = {
			{
				Species = "Unicorn",
				P = 10,
				MaxEyeRarity = 75,
				Preset = { "White", "LightGray", "Tan", "Cream", "Blonde", "ZebraRare" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2
				}
			},
			{
				Species = "Gargoyle",
				P = 10,
				MaxEyeRarity = 75,
				Preset = { "GargoyleBasic", "GargoyleMarble", "GargoyleRocky" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2
				}
			},
			{
				Species = "Kelpie",
				P = 10,
				MaxEyeRarity = 75,
				Preset = { "KelpieGrass", "KelpieVibrant", "KelpieSwamp", "KelpieDark", "KelpieKelp", "KelpieGreenBlue", "KelpieGold" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2
				}
			},
			{
				Species = "Peryton",
				P = 10,
				MaxEyeRarity = 75,
				Preset = {
					"OrangeGreen",
					"PeryDBrown",
					"PeryWBrown",
					"PeryCBrown",
					"PeryGBrown",
					"PeryWTan",
					"PeryLTan",
					"PeryBGray",
					"PeryGray",
					"PeryCream",
					"WhiteBlue"
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2
				}
			}
		}
	},
	{
		ProductId = 1774880073,
		Choices = {
			{
				Species = "Caprine",
				NoMutations = true,
				P = 75,
				MaxEyeRarity = 65,
				Preset = {
					"Tan",
					"Cream",
					"LightGray",
					"DarkGray",
					"Blonde",
					"White",
					"Black",
					"RedBrown",
					"BlueRoan"
				},
				MutationChances = {
					Wings = 25,
					Glow = 0
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 3,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 3
				}
			},
			{
				Species = "Unicorn",
				P = 50,
				MaxEyeRarity = 65,
				Preset = {
					"Black",
					"LightGray",
					"DarkGray",
					"LightRoan",
					"Tan",
					"Cream",
					"Blonde",
					"ZebraRare",
					"BlackWhite",
					"WhiteBlack"
				},
				MutationChances = {
					Wings = 25,
					Glow = 0
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 3,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 3
				}
			},
			{
				Species = "Gargoyle",
				P = 25,
				MaxEyeRarity = 65,
				Preset = { "GargoyleBasic", "GargoyleBlossom", "GargoyleBlack", "GargoyleRocky", "GargoyleMarble" },
				MutationChances = {
					Wings = 25,
					Glow = 0
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 3,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 3
				}
			},
			{
				Species = "Kelpie",
				P = 15,
				MaxEyeRarity = 65,
				Preset = {
					"KelpieGrass",
					"KelpieVibrant",
					"KelpieSwamp",
					"KelpieMint",
					"KelpieRedKelp",
					"KelpieDark",
					"KelpieKelp",
					"KelpieGreenBlue",
					"KelpieGold"
				},
				MutationChances = {
					Wings = 25,
					Glow = 0
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 3,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 3
				}
			},
			{
				Species = "Peryton",
				P = 15,
				MaxEyeRarity = 65,
				Preset = {
					"OrangeGreen",
					"PeryDBrown",
					"PeryWBrown",
					"PeryCBrown",
					"PeryGBrown",
					"PeryWTan",
					"PeryLTan",
					"PeryBGray",
					"PeryGray",
					"PeryCream",
					"WhiteBlue",
					"BrownGreen"
				},
				MutationChances = {
					Wings = 25,
					Glow = 0
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 3,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 3
				}
			}
		}
	},
	{
		ProductId = 1827086735,
		BreedingPair = {
			ProductId = 1857362243,
			Chance = 0.25
		},
		Choices = {
			{
				Species = "Unicorn",
				P = 45,
				MaxEyeRarity = 50,
				Preset = { "Black", "Blonde", "RedBrown", "BlueRoan" },
				BreedingPresetPairs = {
					{
						{ "Black", "WhiteBlack" },
						{ "White", "BlackWhite" }
					},
					{
						{ "RedBrown" },
						{ "VibrantRoan" }
					}
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
				},
				MutationChances = {
					Nothing = 0,
					Wings = 100
				},
				SkillLevels = {
					All = 0.5
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 4,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 4
				}
			},
			{
				Species = "Gargoyle",
				P = 35,
				MaxEyeRarity = 50,
				Preset = { "GargoyleBlossom", "GargoyleBlack" },
				BreedingPresetPairs = {
					{
						{ "GargoyleBlossom" },
						{ "GargoyleBlack" }
					}
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
				},
				MutationChances = {
					Nothing = 0,
					Wings = 100
				},
				SkillLevels = {
					All = 0.5
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 4,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 4
				}
			},
			{
				Species = "Kelpie",
				P = 25,
				MaxEyeRarity = 50,
				Preset = { "KelpieVibrant", "KelpieMint", "KelpieRedKelp", "KelpieDark", "KelpieGold", "KelpieGreenBlue" },
				BreedingPresetPairs = {
					{
						{ "KelpieMint" },
						{ "KelpieRedKelp" }
					},
					{
						{ "KelpieVibrant" },
						{ "KelpieRedKelp" }
					},
					{
						{ "KelpieGold" },
						{ "KelpieRedKelp" }
					},
					{
						{ "KelpieVibrant" },
						{ "KelpieGreenBlue" }
					},
					{
						{ "KelpieDark" },
						{ "KelpieMint" }
					},
					{
						{ "RedKelp" },
						{ "BlueKelp" }
					},
					{
						{ "Black", "WhiteBlack" },
						{ "White", "BlackWhite" }
					}
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
				},
				MutationChances = {
					Nothing = 0,
					Wings = 100
				},
				SkillLevels = {
					All = 0.5
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 4,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 4
				}
			},
			{
				Species = "Peryton",
				P = 25,
				MaxEyeRarity = 50,
				Preset = { "OrangeGreen", "WhiteBlue", "BlackBlue", "Green", "Macaw", "BrownGreen" },
				BreedingPresetPairs = {
					{
						{ "OrangeGreen", "BrownGreen", "Green" },
						{ "Green" }
					},
					{
						{ "Macaw" },
						{ "Macaw" }
					},
					{
						{ "Black" },
						{ "White" }
					},
					{
						{ "BlackBlue" },
						{ "WhiteBlue", "BlackBlue" }
					}
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
				},
				MutationChances = {
					Nothing = 0,
					Wings = 100
				},
				SkillLevels = {
					All = 0.5
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 4,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 4
				}
			}
		}
	}
}
for k, v in pairs(tbl) do
	v.Index = k
	if v.ProductId then
		v.ProductType = "HorseShopSlot"
	end
end
return tbl