-- https://lua.expert/
local tbl = {
	{
		PriceMultiplier = 1.25,
		Choices = {
			{
				Species = "Horse",
				NoMutations = true,
				P = 15,
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
				P = 15,
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
				P = 15,
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
				P = 15,
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
				P = 15,
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
				P = 15,
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
				P = 15,
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
				P = 15,
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
			},
			{
				Species = "Unicorn",
				NoMutations = true,
				P = 15,
				Preset = { "White", "LightGray", "Tan", "Cream", "Blonde", "ZebraRare" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			},
			{
				Species = "Gargoyle",
				NoMutations = true,
				P = 15,
				Preset = { "GargoyleBasic", "GargoyleMarble", "GargoyleRocky" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			},
			{
				Species = "Kelpie",
				NoMutations = true,
				P = 15,
				Preset = { "KelpieGrass", "KelpieVibrant", "KelpieSwamp", "KelpieDark", "KelpieKelp" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			},
			{
				Species = "Peryton",
				NoMutations = true,
				P = 15,
				Preset = { "PeryDBrown", "PeryWBrown", "PeryCBrown", "PeryGBrown", "PeryWTan", "PeryLTan", "PeryGray", "PeryCream" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			},
			{
				Species = "Fae",
				NoMutations = true,
				P = 15,
				Preset = { "FaeOakwood", "FaeMaple", "FaeAspen", "FaeRedwood" },
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
				P = 15,
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
				P = 15,
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
				P = 15,
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
				P = 15,
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
			},
			{
				Species = "Fae",
				P = 15,
				MaxEyeRarity = 75,
				Preset = { "FaeOakwood", "FaeMaple", "FaeAspen", "FaeRedwood" },
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
				P = 15,
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
				Species = "Felorse",
				P = 50,
				MaxEyeRarity = 65,
				Preset = {
					"White",
					"Black",
					"LightGray",
					"DarkGray",
					"LightRoan",
					"Tan",
					"Cream",
					"Blonde",
					"Arabian",
					"AlcesTan",
					"PeryWTan",
					"PeryGray",
					"PeryDBrown",
					"PeryWBrown",
					"PeryCream",
					"BlackPaint"
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
				Species = "Anticorn",
				P = 50,
				MaxEyeRarity = 65,
				Preset = { "AnticornIce", "AnticornFire", "AnticornAsh" },
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
				Species = "Clydesdale",
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
					"WhiteBlack",
					"Arabian",
					"AlcesTan",
					"PeryWTan",
					"PeryGray",
					"PeryDBrown",
					"PeryWBrown",
					"PeryCream",
					"BlackPaint"
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
				Species = "AkhalTeke",
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
					"WhiteBlack",
					"Arabian",
					"AlcesTan",
					"PeryWTan",
					"PeryGray",
					"PeryDBrown",
					"PeryWBrown",
					"PeryCream",
					"BlackPaint"
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
				Species = "Flora",
				P = 50,
				MaxEyeRarity = 65,
				Preset = { "FloraTropic", "FloraSun", "FloraHyd", "FloraLav", "FloraPurple", "FloraRed", "FloraYellow" },
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
				Species = "Cactaline",
				P = 50,
				MaxEyeRarity = 65,
				Preset = { "CactusVibrant", "CactusSucculent", "CactusDefault", "CactusCholla", "CactusGreen" },
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
				Species = "Hippocampus",
				P = 50,
				MaxEyeRarity = 65,
				Preset = { "Koi", "HippoYellow", "HippoRed", "HippoJelly", "HippoDefault", "HippoSilverfish", "HippoGreen" },
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
				P = 25,
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
					"WhiteBlack",
					"Calico"
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
				P = 25,
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
				P = 25,
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
			},
			{
				Species = "Fae",
				P = 25,
				MaxEyeRarity = 65,
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
				Species = "Clydesdale",
				P = 45,
				MaxEyeRarity = 50,
				Preset = {
					"White",
					"Black",
					"LightGray",
					"DarkGray",
					"LightRoan",
					"Tan",
					"Cream",
					"Blonde",
					"Arabian",
					"AlcesTan",
					"PeryWTan",
					"PeryGray",
					"PeryDBrown",
					"PeryWBrown",
					"PeryCream",
					"BlackPaint"
				},
				BreedingPresetPairs = {
					{
						{ "Black", "WhiteBlack" },
						{ "White", "BlackWhite" }
					},
					{
						{ "AlcesTan", "PeryDBrown", "PeryCream" },
						{ "PeryWTan", "PeryWBrown", "Arabian" }
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
				Species = "Unicorn",
				P = 45,
				MaxEyeRarity = 40,
				Preset = { "Black", "Blonde", "RedBrown", "BlueRoan", "Calico" },
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
				MaxEyeRarity = 40,
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
				Species = "Cactaline",
				P = 25,
				MaxEyeRarity = 40,
				Preset = { "CactusVibrant", "CactusSucculent", "CactusDefault", "CactusCholla", "CactusGreen" },
				BreedingPresetPairs = {
					{
						{ "CactusVibrant" },
						{ "CactusSucculent", "CactusDefault", "CactusGreen" }
					},
					{
						{ "CactusSucculent" },
						{ "CactusDefault", "CactusCholla", "CactusGreen" }
					},
					{
						{ "CactusCholla" },
						{ "CactusGreen" }
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
				Species = "Flora",
				P = 25,
				MaxEyeRarity = 40,
				Preset = { "FloraTropic", "FloraSun", "FloraHyd", "FloraLav", "FloraPurple", "FloraRed", "FloraYellow" },
				BreedingPresetPairs = {
					{
						{ "FloraTropic" },
						{ "FloraSun", "FloraHyd", "FloraLav", "FloraPurple", "FloraRed", "FloraYellow" }
					},
					{
						{ "FloraSun" },
						{ "FloraHyd", "FloraLav", "FloraPurple", "FloraRed", "FloraYellow" }
					},
					{
						{ "FloraHyd" },
						{ "FloraLav", "FloraPurple", "FloraRed", "FloraYellow" }
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
				Species = "Hippocampus",
				P = 25,
				MaxEyeRarity = 40,
				Preset = { "Koi", "HippoYellow", "HippoRed", "HippoJelly", "HippoDefault", "HippoSilverfish", "HippoGreen" },
				BreedingPresetPairs = {
					{
						{ "Koi" },
						{ "HippoYellow", "HippoRed", "HippoJelly", "HippoDefault", "HippoSilverfish", "HippoGreen" }
					},
					{
						{ "HippoYellow" },
						{ "HippoRed", "HippoJelly", "HippoDefault", "HippoSilverfish", "HippoGreen" }
					},
					{
						{ "HippoRed" },
						{ "HippoJelly", "HippoDefault", "HippoSilverfish", "HippoGreen" }
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
				MaxEyeRarity = 40,
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
				MaxEyeRarity = 40,
				Preset = { "OrangeGreen", "WhiteBlue", "BlackBlue", "Green", "Macaw", "BrownGreen", "Calico" },
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
						{ "Black", "WhiteBlack" },
						{ "White", "BlackWhite" }
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
			},
			{
				Species = "Fae",
				P = 25,
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
				BreedingPresetPairs = {
					{
						{ "FaeGoldBirch" },
						{ "FaeBirch" }
					},
					{
						{ "FaeMaple" },
						{ "FaePoinciana" }
					},
					{
						{ "FaeBlossom" },
						{ "FaeWisteria" }
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
				Species = "Flora",
				P = 75,
				MaxEyeRarity = 40,
				Preset = {
					"FloraTropic",
					"FloraSun",
					"FloraWhite",
					"FloraBlack",
					"FloraHyd",
					"FloraLav",
					"FloraPurple",
					"FloraRed",
					"FloraYellow"
				},
				BreedingPresetPairs = {
					{
						{ "FloraWhite" },
						{ "FloraBlack" }
					},
					{
						{ "FloraPurple" },
						{ "FloraLav" }
					},
					{
						{ "FloraHyd" },
						{ "FloraYellow" }
					},
					{
						{ "FloraRed" },
						{ "FloraTropic" }
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
				Species = "Seraph",
				P = 75,
				MaxEyeRarity = 40,
				Preset = { "SeraphGold", "SeraphLight", "SeraphFallen", "SeraphDark" },
				BreedingPresetPairs = {
					{
						{ "SeraphLight", "SeraphGold" },
						{ "SeraphFallen", "SeraphDark" }
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