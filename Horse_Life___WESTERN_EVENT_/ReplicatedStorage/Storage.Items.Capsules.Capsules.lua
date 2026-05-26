-- https://lua.expert/
local v0 = "Randomly roll through fertile Valentines horses using coins, find one you like and claim it!"
local v1 = "Randomly roll through fertile Christmas horses using coins, find one you like and claim it!"
local v2 = "Randomly roll through fertile horses using coins, find one you like and claim it!"
local v3 = "Randomly roll through fertile Stained Glass horses using coins, find one you like and claim it!"
return {
	DevHorseCapsule = {
		Rarity = "Exclusive",
		Image = 107750999697080,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through infertile devhorses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Species = "Random",
			Infertile = true,
			Origin = "Developer",
			Preset = {
				"PlushNeapolitan",
				"PlushNeapolitan2",
				"PlushMatchaBoba",
				"PlushRainbowSherbet",
				"MoonL",
				"MoonD",
				"Morpho",
				"LunarMoth",
				"Demon",
				"Nightmare",
				"Vampire",
				"Poison",
				"DartFrog",
				"PinkLemonade",
				"Vaporwave",
				"Magma",
				"JewelBeetle",
				"CottonCandy",
				"Dango"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	SakuraCapsule = {
		Rarity = "Exclusive",
		Image = 134866898750048,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile sakura horses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Species = "Random",
			MaxEyeRarity = 50,
			Origin = "Bought",
			Preset = { "LightPink", "Pink", "VividPink", "CherryBlossom", "BlossomTree", "RedVelvet", "PastrySakura" },
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
				Nothing = 0
			},
			MutationsToGuarantee = {
				SakuraWings = 100
			},
			SkillLevels = {
				All = 0.5
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	CactalineCapsule = {
		Rarity = "Exclusive",
		Image = 101155948867242,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile cactalines using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Cactaline" },
			Preset = { "CactusCholla", "CactusGreen", "CactusVibrant", "CactusSucculent", "CactusDefault" },
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	FelorseCapsule = {
		Rarity = "Exclusive",
		Image = 136990815485085,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile felorses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Felorse" },
			Preset = {
				"Brown",
				"DarkBrown",
				"LightBrown",
				"DarkDullBrown",
				"LightDullBrown",
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
				"BlackPaint",
				"White",
				"Black",
				"BlackWhite",
				"WhiteBlack",
				"LightRoan",
				"Mustang",
				"BrownBlonde",
				"BlueRoan",
				"LightGray",
				"DarkGray",
				"Zebra",
				"ZebraRare",
				"PeryLTan",
				"PeryBGray",
				"PeryCBrown",
				"PlushCalico"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	PlushCapsule = {
		Rarity = "Exclusive",
		Image = 130984984036134,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile plushes using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Plush" },
			Preset = {
				"PlushWhite",
				"PlushBlack",
				"PlushGreen",
				"PlushBlue",
				"PlushPurple",
				"PlushRed",
				"PlushOrchid",
				"PlushFox",
				"PlushMoon"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	CybredCapsule = {
		Rarity = "Exclusive",
		Image = 103233015938841,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile cybreds using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Cybred" },
			Preset = { "CybredSynth", "CybredBlue", "CybredDesert", "CybredSilver", "CybredCopper", "CybredSynthetic", "CybredRed", "CybredSteam" },
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	CelestialCapsule = {
		Rarity = "Exclusive",
		Image = 134349258403325,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile celestials using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Celestial" },
			Preset = { "CelestialVibrant", "CelestialPurple", "CelestialBlack", "CelestialWhite", "CelestialHorizon", "CelestialCerulian" },
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	SeraphCapsule = {
		Rarity = "Exclusive",
		Image = 121533256492435,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile seraphs using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Seraph" },
			Preset = { "SeraphGold", "SeraphLight", "SeraphFallen", "SeraphDark" },
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	SaurequineCapsule = {
		Rarity = "Exclusive",
		Image = 114871469486175,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile saurequines using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Saurequine" },
			Preset = {
				"SaurGreen",
				"SaurGreenYellow",
				"SaurTanBlue",
				"SaurBlack",
				"SaurTan",
				"SaurBrown",
				"SaurOrange",
				"HippoGreen",
				"HippoSilverfish",
				"GhoulSwamp"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	KirinCapsule = {
		Rarity = "Exclusive",
		Image = 128163573887319,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile kirins using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Kirin" },
			Preset = {
				"KirinSun",
				"KirinWinter",
				"KirinDark",
				"KirinBlue",
				"KirinVibrant",
				"KirinWhite",
				"KirinSunset",
				"KirinForest",
				"KirinDefault",
				"KirinWarm"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	FloraCapsule = {
		Rarity = "Exclusive",
		Image = 80214181982607,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile floras using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Flora" },
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	HippocampusCapsule = {
		Rarity = "Exclusive",
		Image = 95692294000937,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile hippocampus using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Hippocampus" },
			Preset = {
				"HippoYellow",
				"HippoRed",
				"HippoJelly",
				"HippoDefault",
				"HippoSilverfish",
				"HippoGreen",
				"GhoulSpectral",
				"GhoulBat",
				"GhoulStone"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	ClydesdaleCapsule = {
		Rarity = "Exclusive",
		Image = 109425203748888,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile clydesdales using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Clydesdale" },
			Preset = {
				"Brown",
				"DarkBrown",
				"LightBrown",
				"DarkDullBrown",
				"LightDullBrown",
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
				"BlackPaint",
				"White",
				"Black",
				"BlackWhite",
				"WhiteBlack",
				"LightRoan",
				"Mustang",
				"BrownBlonde",
				"BlueRoan",
				"LightGray",
				"DarkGray",
				"Zebra",
				"ZebraRare",
				"PeryLTan",
				"PeryBGray",
				"PeryCBrown",
				"PlushCalico"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	AkhalTekeCapsule = {
		Rarity = "Exclusive",
		Image = 103594234084600,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile akhal-tekes using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "AkhalTeke" },
			Preset = {
				"Brown",
				"DarkBrown",
				"LightBrown",
				"DarkDullBrown",
				"LightDullBrown",
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
				"BlackPaint",
				"White",
				"Black",
				"BlackWhite",
				"WhiteBlack",
				"LightRoan",
				"Mustang",
				"BrownBlonde",
				"BlueRoan",
				"LightGray",
				"DarkGray",
				"Zebra",
				"ZebraRare",
				"PeryLTan",
				"PeryBGray",
				"PeryCBrown",
				"PlushCalico",
				"AkhalBlack",
				"AkhalGold",
				"AkhalBrown"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	FriesianCapsule = {
		Rarity = "Exclusive",
		Image = 97159670056873,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile friesians using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Friesian" },
			Preset = {
				"Brown",
				"DarkBrown",
				"LightBrown",
				"DarkDullBrown",
				"LightDullBrown",
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
				"BlackPaint",
				"White",
				"Black",
				"BlackWhite",
				"WhiteBlack",
				"LightRoan",
				"Mustang",
				"BrownBlonde",
				"BlueRoan",
				"LightGray",
				"DarkGray",
				"Zebra",
				"ZebraRare",
				"PeryLTan",
				"PeryBGray",
				"PeryCBrown",
				"PlushCalico",
				"AkhalBlack",
				"AkhalGold",
				"AkhalBrown",
				"FriesianBlack",
				"FriesianBlackPaint",
				"FriesianDarkGray",
				"FriesianBlackBrown",
				"FriesianBrown",
				"FriesianDarkDullBrown",
				"FriesianLightDullBrown",
				"FriesianPeryGray",
				"FriesianPeryDBrown",
				"FriesianBlackWhite",
				"FriesianLightGray",
				"FriesianDarkGray"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	EquusCapsule = {
		Rarity = "Exclusive",
		Image = 71873372784476,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile equus using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Equus" },
			Preset = {
				"ZebraRare",
				"Zebra",
				"White",
				"WhiteBPaint",
				"WhiteBlack",
				"BlackWhite",
				"Blonde",
				"Arabian",
				"PeryLTan",
				"PeryBGray",
				"PeryCBrown",
				"AlcesTan",
				"PeryWTan",
				"PeryGray",
				"PeryDBrown",
				"PeryWBrown"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	BisorseCapsule = {
		Rarity = "Exclusive",
		Image = 101797695267298,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile bisorse using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Bisorse" },
			Preset = {
				"ZebraRare",
				"Zebra",
				"White",
				"WhiteBPaint",
				"WhiteBlack",
				"BlackWhite",
				"Blonde",
				"Arabian",
				"PeryLTan",
				"PeryBGray",
				"PeryCBrown",
				"AlcesTan",
				"PeryWTan",
				"PeryGray",
				"PeryDBrown",
				"PeryWBrown"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	AnticornCapsule = {
		Rarity = "Exclusive",
		Image = 94234083496554,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile anticorn using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Anticorn" },
			Preset = { "AnticornFire", "AnticornIce", "AnticornAsh" },
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	SpiritCapsule = {
		Rarity = "Exclusive",
		Image = 110698376194082,
		Price = 80,
		Tradelocked = true,
		Description = v2,
		SpeciesDropTable = {
			Species = "Random",
			Origin = "Spirit",
			Preset = {
				"Brown",
				"DarkBrown",
				"LightBrown",
				"DarkDullBrown",
				"LightDullBrown",
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
				"BlackPaint",
				"White",
				"Black",
				"BlackWhite",
				"WhiteBlack",
				"LightRoan",
				"Mustang",
				"BrownBlonde",
				"BlueRoan",
				"LightGray",
				"DarkGray",
				"Zebra",
				"ZebraRare",
				"PeryLTan",
				"PeryBGray",
				"PeryCBrown",
				"PlushCalico"
			},
			MutationSlotChances = {
				{
					Amount = 0,
					P = 0
				},
				{
					Amount = 1,
					P = 0.5
				},
				{
					Amount = 2,
					P = 0.25
				},
				{
					Amount = 3,
					P = 0.25
				}
			},
			MutationChances = {
				Nothing = 0,
				GlowPattern = 3,
				GlowHair = 3,
				GlowPaint = 3,
				GlowHoof = 4,
				GlowCosmetic = 4,
				GlowKeratin = 4,
				GlowingEyes = 4
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 2,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 2
			}
		}
	},
	SoulCapsule = {
		Rarity = "Exclusive",
		Image = 93508124950013,
		Price = 90,
		Tradelocked = true,
		Description = v2,
		SpeciesDropTable = {
			Species = "Random",
			Origin = "Spirit",
			Preset = {
				"CactusSucculent",
				"CactusGreen",
				"CactusCholla",
				"FaeGoldBirch",
				"FaeOakwood",
				"FaeWisteria",
				"FloraWhite",
				"FloraPink",
				"FloraTropic",
				"PlushOrchid",
				"PlushPurple",
				"PlushWhite",
				"PlushBlack",
				"GargoyleMarble",
				"GargoyleCanyon",
				"GargoyleBlossom"
			},
			MutationSlotChances = {
				{
					Amount = 0,
					P = 0
				},
				{
					Amount = 1,
					P = 0.5
				},
				{
					Amount = 2,
					P = 0.5
				},
				{
					Amount = 3,
					P = 0.25
				}
			},
			MutationChances = {
				Nothing = 0,
				GlowPattern = 3,
				GlowHair = 3,
				GlowPaint = 3,
				GlowHoof = 4,
				GlowCosmetic = 4,
				GlowKeratin = 4,
				GlowingEyes = 4
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 3,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 3
			}
		}
	},
	WardenCapsule = {
		Rarity = "Exclusive",
		Image = 135492083587957,
		Price = 100,
		Tradelocked = true,
		Description = v2,
		SpeciesDropTable = {
			Species = "Random",
			MutationChancesWhitelist = true,
			Origin = "Spirit",
			Preset = {
				"HippoJelly",
				"HippoSilverfish",
				"HippoRed",
				"SaurTanBlue",
				"SaurBlack",
				"SaurGreenYellow",
				"CybredSynth",
				"CybredSteam",
				"CybredBlue",
				"CelestialDefault",
				"CelestialBlack",
				"CelestialHorizon",
				"KirinWhite",
				"KirinForest",
				"KirinWinter"
			},
			MutationSlotChances = {
				{
					Amount = 0,
					P = 0
				},
				{
					Amount = 1,
					P = 0.5
				},
				{
					Amount = 2,
					P = 0.5
				},
				{
					Amount = 3,
					P = 0.5
				}
			},
			MutationChances = {
				Nothing = 0,
				GlowPattern = 3,
				GlowHair = 3,
				GlowPaint = 3,
				GlowHoof = 4,
				GlowCosmetic = 4,
				GlowKeratin = 4,
				GlowingEyes = 4
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4
			}
		}
	},
	AlienCapsule = {
		Rarity = "Exclusive",
		Image = 104095097339708,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile equenari using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Species = "Equenari",
			MaxEyeRarity = 50,
			Origin = "Bought",
			Preset = {
				"HippoJelly",
				"GhoulBat",
				"BlueLav",
				"GhoulStone",
				"BlueLav",
				"FloraBlack",
				"FloraWhite",
				"BlueKelp",
				"EquenOrange",
				"EquenPurple",
				"EquenSea",
				"EquenDust"
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
	},
	GhoulsteedCapsule = {
		Rarity = "Exclusive",
		Image = 108078915677858,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile ghoulsteeds using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Species = "Ghoulsteed",
			MaxEyeRarity = 50,
			Origin = "Bought",
			Preset = {
				"GhoulStone",
				"GhoulSwamp",
				"GhoulSpectral",
				"GhoulStone",
				"GhoulWere",
				"GhoulHell",
				"GhoulPumpkin",
				"GhoulUndead",
				"GhoulVampire",
				"GhoulBat",
				"Rotted"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	HauntmareCapsule = {
		Rarity = "Exclusive",
		Image = 107823995765559,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile hauntmares using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Species = "Hauntmare",
			MaxEyeRarity = 50,
			Origin = "Bought",
			Preset = { "Hauntbrown", "HauntVoid", "HauntCandy", "HauntGrey" },
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	SpookyCapsule = {
		Rarity = "Exclusive",
		Image = 138192295468538,
		Price = 100,
		Tradelocked = true,
		Description = "Randomly roll through fertile halloween horses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Origin = "Bought",
			Species = { "Ghoulsteed", "Hauntmare" },
			Preset = {
				"GhoulStone",
				"GhoulSwamp",
				"GhoulSpectral",
				"GhoulStone",
				"GhoulWere",
				"GhoulHell",
				"GhoulPumpkin",
				"GhoulUndead",
				"GhoulVampire",
				"GhoulBat",
				"Rotted",
				"Hauntbrown",
				"HauntVoid",
				"HauntCandy",
				"HauntGrey"
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4
			}
		}
	},
	FestiveCapsule = {
		Rarity = "Christmas",
		Image = 90959638458850,
		Price = 100,
		Tradelocked = true,
		Description = v1,
		SpeciesDropTable = {
			Origin = "Bought",
			Species = { "Hollyhoof", "Alces" },
			Preset = {
				"GhoulStone",
				"GhoulSwamp",
				"GhoulSpectral",
				"GhoulStone",
				"GhoulWere",
				"GhoulHell",
				"GhoulPumpkin",
				"GhoulUndead",
				"GhoulVampire",
				"GhoulBat",
				"Rotted",
				"Hauntbrown",
				"HauntVoid",
				"HauntCandy",
				"HauntGrey"
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	LovelyCapsule = {
		Rarity = "Valentines",
		Image = 80409742766194,
		Price = 100,
		Tradelocked = true,
		Description = v0,
		SpeciesDropTable = {
			Origin = "Bought",
			Species = { "Heartbane", "Pastrequine" },
			Preset = {
				"PastryChocRas",
				"PastryMint",
				"PastryBrown",
				"PastryCotton",
				"PastryOrange",
				"PastryMatcha",
				"HeartWood",
				"HeartPassion",
				"HeartLove",
				"HeartHurt"
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 2,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 2,
				AlwaysMax = true
			}
		}
	},
	EternalLoveCapsule = {
		Rarity = "Valentines",
		Image = 103665634583463,
		Price = 100,
		Tradelocked = true,
		Description = v0,
		SpeciesDropTable = {
			Origin = "Bought",
			Species = { "Heartbane", "Pastrequine" },
			Preset = { "HauntVoid", "EquenPurple", "PurpleGem", "CelestialPurple", "PastryPurple", "PlushPurple" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	FrozenCapsule = {
		Rarity = "Christmas",
		Image = 137592584379551,
		Price = 100,
		Tradelocked = true,
		Description = v1,
		SpeciesDropTable = {
			Origin = "Bought",
			Species = { "Hollyhoof", "Alces" },
			Preset = {
				"HollyBlueGold",
				"HollyCookie",
				"HollyChristmas",
				"HollySnow",
				"AlcesRedWhite",
				"AlcesFir",
				"AlcesFestive",
				"AlcesWinter",
				"AlcesIceSnap",
				"AlcesBlack",
				"AlcesWhite",
				"AlcesIce",
				"AlcesTan",
				"AlcesCream"
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = false
			}
		}
	},
	LovestruckCapsule = {
		Rarity = "Valentines",
		NotReleasedYet = true,
		Image = 120412254193742,
		Price = 0,
		Tradelocked = true,
		Description = "Randomly roll through fertile Heartbreak horses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Origin = "Bought",
			Species = {
				"AkhalTeke",
				"Anticorn",
				"Bisorse",
				"Cactaline",
				"Caprine",
				"Celestial",
				"Clydesdale",
				"Cybred",
				"Equus",
				"Fae",
				"Felorse",
				"Flora",
				"Friesian",
				"Gargoyle",
				"Hippocampus",
				"Kelpie",
				"Kirin",
				"Peryton",
				"Plush",
				"Pony",
				"Saurequine",
				"Seraph",
				"Unicorn",
				"Nephyrian",
				"Fjord",
				"Pastrequine",
				"Heartbane",
				"Caniquine"
			},
			Preset = { "PastrySakura", "Pink", "VividPink", "LightPink", "HeartLove" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 3,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 3,
				AlwaysMax = false
			}
		}
	},
	PastelCapsule = {
		Rarity = "Easter",
		NotReleasedYet = true,
		Image = 137489732355559,
		Price = 100,
		Tradelocked = true,
		Description = "Randomly roll through fertile Easter horses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Origin = "Bought",
			Species = {
				"AkhalTeke",
				"Anticorn",
				"Bisorse",
				"Cactaline",
				"Caprine",
				"Celestial",
				"Clydesdale",
				"Cybred",
				"Equus",
				"Fae",
				"Felorse",
				"Flora",
				"Friesian",
				"Gargoyle",
				"Hippocampus",
				"Kelpie",
				"Kirin",
				"Peryton",
				"Plush",
				"Pony",
				"Saurequine",
				"Seraph",
				"Unicorn",
				"Wolper",
				"Honeytrot",
				"Nephyrian",
				"Fjord",
				"Caniquine"
			},
			Preset = { "PastelYellow", "PastelSea", "PastelPurple", "PastelPeach" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = false
			}
		}
	},
	SanctumGlassCapsule = {
		Rarity = "Exclusive",
		NotReleasedYet = true,
		Image = 91617840612517,
		Price = 0,
		Tradelocked = true,
		Description = v3,
		SpeciesDropTable = {
			Origin = "Bought",
			Species = {
				"AkhalTeke",
				"Anticorn",
				"Bisorse",
				"Cactaline",
				"Caprine",
				"Celestial",
				"Clydesdale",
				"Cybred",
				"Equus",
				"Fae",
				"Felorse",
				"Flora",
				"Friesian",
				"Gargoyle",
				"Hippocampus",
				"Kelpie",
				"Kirin",
				"Peryton",
				"Plush",
				"Pony",
				"Saurequine",
				"Seraph",
				"Unicorn",
				"Nephyrian",
				"Fjord",
				"Caniquine"
			},
			Preset = { "CarouselWeathered", "HippoRed", "CybredRed" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 3,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 3,
				AlwaysMax = false
			}
		}
	},
	PrismlightCapsule = {
		Rarity = "Exclusive",
		NotReleasedYet = true,
		Image = 124749232128212,
		Price = 0,
		Tradelocked = true,
		Description = v3,
		SpeciesDropTable = {
			Origin = "Bought",
			Species = {
				"AkhalTeke",
				"Anticorn",
				"Bisorse",
				"Cactaline",
				"Caprine",
				"Celestial",
				"Clydesdale",
				"Cybred",
				"Equus",
				"Fae",
				"Felorse",
				"Flora",
				"Friesian",
				"Gargoyle",
				"Hippocampus",
				"Kelpie",
				"Kirin",
				"Peryton",
				"Plush",
				"Pony",
				"Saurequine",
				"Seraph",
				"Unicorn",
				"Nephyrian",
				"Fjord",
				"Caniquine"
			},
			Preset = { "BlueFriesian", "HollyBlueGold", "AnticornIce", "SeraphGold", "BlueLav" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 3,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 3,
				AlwaysMax = false
			}
		}
	},
	JellyBeanCapsule = {
		Rarity = "Easter",
		NotReleasedYet = true,
		Image = 84801916825499,
		Price = 0,
		Tradelocked = true,
		Description = "Randomly roll through fertile Jelly Bean horses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Origin = "Bought",
			Species = {
				"AkhalTeke",
				"Anticorn",
				"Bisorse",
				"Cactaline",
				"Caprine",
				"Celestial",
				"Clydesdale",
				"Cybred",
				"Equus",
				"Fae",
				"Felorse",
				"Flora",
				"Friesian",
				"Gargoyle",
				"Hippocampus",
				"Kelpie",
				"Kirin",
				"Peryton",
				"Plush",
				"Pony",
				"Saurequine",
				"Seraph",
				"Unicorn",
				"Wolper",
				"Honeytrot",
				"Nephyrian",
				"Fjord",
				"Caniquine"
			},
			Preset = { "SkyBlue", "LightBlue", "LightPink", "LightOrange", "SeaGreenGem" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 3,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 3,
				AlwaysMax = false
			}
		}
	},
	ArcanaCapsule = {
		Rarity = "Exclusive",
		NotReleasedYet = true,
		Image = 91766407373430,
		Price = 0,
		Tradelocked = true,
		Description = "Randomly roll through fertile Arcana horses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Origin = "Bought",
			Species = {
				"AkhalTeke",
				"Anticorn",
				"Bisorse",
				"Cactaline",
				"Caprine",
				"Celestial",
				"Clydesdale",
				"Cybred",
				"Equus",
				"Fae",
				"Felorse",
				"Flora",
				"Friesian",
				"Gargoyle",
				"Hippocampus",
				"Kelpie",
				"Kirin",
				"Peryton",
				"Plush",
				"Pony",
				"Saurequine",
				"Seraph",
				"Unicorn",
				"Nephyrian",
				"Fjord",
				"Caniquine"
			},
			Preset = { "KirinWhite", "CelestialWhite", "PlushWhite", "FloraWhite", "Albinoish" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 3,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 3,
				AlwaysMax = false
			}
		}
	},
	VegetableCapsule = {
		Rarity = "Easter",
		NotReleasedYet = true,
		Image = 95704454648441,
		Price = 100,
		Tradelocked = true,
		Description = "Randomly roll through fertile Vegetable horses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Origin = "Bought",
			Species = {
				"AkhalTeke",
				"Anticorn",
				"Bisorse",
				"Cactaline",
				"Caprine",
				"Celestial",
				"Clydesdale",
				"Cybred",
				"Equus",
				"Fae",
				"Felorse",
				"Flora",
				"Friesian",
				"Gargoyle",
				"Hippocampus",
				"Kelpie",
				"Kirin",
				"Peryton",
				"Plush",
				"Pony",
				"Saurequine",
				"Seraph",
				"Unicorn",
				"Wolper",
				"Honeytrot",
				"Caniquine",
				"Nephyrian",
				"Fjord"
			},
			Preset = { "RedStone", "OrangeCarrot", "Lettuce", "VegetableMedley" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 3,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 3,
				AlwaysMax = false
			}
		}
	},
	NephyrianCapsule = {
		Rarity = "Exclusive",
		Image = 81116611227786,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile Nephyrian using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Species = "Nephyrian",
			MaxEyeRarity = 50,
			Origin = "Bought",
			Preset = { "NephyStorm", "NephySnow", "NephySunny", "NephyNormal" },
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	CrystallineCapsule = {
		Rarity = "Exclusive",
		Image = 94143491806654,
		Price = 0,
		Tradelocked = true,
		Description = "Randomly roll through fertile crystal inspired horses, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = {
				"AkhalTeke",
				"Anticorn",
				"Bisorse",
				"Cactaline",
				"Caprine",
				"Celestial",
				"Clydesdale",
				"Cybred",
				"Equus",
				"Fae",
				"Felorse",
				"Flora",
				"Friesian",
				"Gargoyle",
				"Hippocampus",
				"Kelpie",
				"Kirin",
				"Peryton",
				"Plush",
				"Pony",
				"Saurequine",
				"Seraph",
				"Unicorn",
				"Fjord",
				"Crystallion",
				"Nephyrian",
				"Caniquine"
			},
			Preset = { "BlueLav", "VioletGlass", "PurpleDusk" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 3,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 3,
				AlwaysMax = false
			}
		}
	},
	RoyalSteedCapsule = {
		Rarity = "Exclusive",
		Image = 105173277008303,
		Price = 0,
		Tradelocked = true,
		Description = "Randomly roll through fertile purple and blue horses, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = {
				"AkhalTeke",
				"Anticorn",
				"Bisorse",
				"Cactaline",
				"Caprine",
				"Celestial",
				"Clydesdale",
				"Cybred",
				"Equus",
				"Fae",
				"Felorse",
				"Flora",
				"Friesian",
				"Gargoyle",
				"Hippocampus",
				"Kelpie",
				"Kirin",
				"Peryton",
				"Plush",
				"Pony",
				"Saurequine",
				"Seraph",
				"Unicorn",
				"Fjord",
				"Nephyrian",
				"Caniquine"
			},
			Preset = { "VioletArmor", "PurpleYellow", "PurpleKnight" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 3,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 3,
				AlwaysMax = false
			}
		}
	},
	ArcaneCapsule = {
		Rarity = "Exclusive",
		Image = 122038291553971,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile Arcane horses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Species = "Random",
			Infertile = false,
			Origin = "Bought",
			Preset = { "BlueArcana" },
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
				Nothing = 0
			},
			MutationGroupsToGuarantee = {
				{
					FeatheredArcaneWings = 50,
					FlutteringArcaneWings = 50
				}
			}
		},
		SkillLevels = {
			All = 0.5
		},
		MaxCosmetics = {
			MaxPatternsPerSlot = 4,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 4,
			AlwaysMax = true
		}
	},
	ArtisanCapsule = {
		Rarity = "Exclusive",
		Image = 95179792086018,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile Artisan inspired horses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Species = "Random",
			Origin = "Bought",
			Preset = { "OrangeArtisan", "GreenArtisan", "StockArtisan" },
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
			MaxCosmetics = {
				MaxPatternsPerSlot = 3,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 3,
				AlwaysMax = false
			}
		}
	},
	CaniquineCapsule = {
		Rarity = "Exclusive",
		Image = 125876944463682,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile Caniquine using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Species = "Caniquine",
			MaxEyeRarity = 50,
			Origin = "Bought",
			Preset = { "CaniManedWolf", "CaniSeaWolf", "CaniGrayWolf", "CaniAWD", "CaniArcticWolf" },
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	FertileDevHorseCapsule = {
		Rarity = "Exclusive",
		Image = 107750999697080,
		Price = 50,
		Tradelocked = true,
		Description = "Randomly roll through fertile devhorses using coins, find one you like and claim it!",
		SpeciesDropTable = {
			Species = "Random",
			Infertile = true,
			Origin = "Developer",
			Preset = {
				"PlushNeapolitan",
				"PlushNeapolitan2",
				"PlushMatchaBoba",
				"PlushRainbowSherbet",
				"MoonL",
				"MoonD",
				"Morpho",
				"LunarMoth",
				"Demon",
				"Nightmare",
				"Vampire",
				"Poison",
				"DartFrog",
				"PinkLemonade",
				"Vaporwave",
				"Magma",
				"JewelBeetle",
				"CottonCandy",
				"Dango"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	YeehawCapsule = {
		Rarity = "Exclusive",
		Image = 109425203748888,
		Price = 25,
		Tradelocked = true,
		Description = "Randomly roll through fertile Caniquines using coins, find one you like and claim it!",
		SpeciesDropTable = {
			MaxEyeRarity = 50,
			Origin = "Bought",
			Species = { "Caniquine" },
			Preset = {
				"Brown",
				"DarkBrown",
				"LightBrown",
				"DarkDullBrown",
				"LightDullBrown",
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
				"BlackPaint",
				"White",
				"Black",
				"BlackWhite",
				"WhiteBlack",
				"LightRoan",
				"Mustang",
				"BrownBlonde",
				"BlueRoan",
				"LightGray",
				"DarkGray",
				"Zebra",
				"ZebraRare",
				"PeryLTan",
				"PeryBGray",
				"PeryCBrown",
				"PlushCalico"
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
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	}
}