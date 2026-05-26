-- https://lua.expert/
return {
	NeutralMarbles = {
		Rarity = "Uncommon",
		Image = 91605913392358,
		Description = "Gives plush brown tone eyes",
		MaterialType = "EyeColor",
		EyeColor = {
			"Brown",
			"DullBrown",
			"DarkBrown",
			"VibrantDarkBrown",
			"TanBrown",
			"Truffle",
			"RedBrown",
			"Gold",
			"Olive",
			"Hazel"
		}
	},
	VibrantMarbles = {
		Rarity = "Rare",
		Image = 114834862664712,
		Description = "Gives plush green or blue tone eyes",
		MaterialType = "EyeColor",
		EyeColor = {
			"Blue",
			"Green",
			"DarkGreen",
			"OliveGreen",
			"LightGreen",
			"LimeGreen",
			"Ocean",
			"CrystalBlue",
			"DarkBlue",
			"DeepBlue"
		}
	},
	UnusualMarbles = {
		Rarity = "Epic",
		Image = 111854941692213,
		Description = "Gives plush pink, purple eyes",
		MaterialType = "EyeColor",
		EyeColor = { "Purple", "Pink", "Magenta", "LightPink", "LightPurple", "DarkPurple", "Sunset" }
	},
	EvilMarbles = {
		Rarity = "Legendary",
		Image = 127249780460339,
		Description = "Gives  evil tone eyes",
		MaterialType = "EyeColor",
		EyeColor = { "Black", "White", "Yellow", "PaleYellow", "Amber", "Red", "Blood", "Sun" }
	},
	SmallPattern = {
		Rarity = "Epic",
		Image = 96550562689035,
		Description = "Teacup, teeny, tiny, and small sizes",
		MaterialType = "Size",
		Sizes = { "Small", "Tiny", "Teeny", "Teacup" }
	},
	NormalPattern = {
		Rarity = "Rare",
		Image = 93663603611525,
		Description = "Big, normal, and little sizes",
		MaterialType = "Size",
		Sizes = { "Big", "Normal", "Little" }
	},
	LargePattern = {
		Rarity = "Epic",
		Image = 116253252637985,
		Description = "Mammoth, draft, giant, and huge sizes",
		MaterialType = "Size",
		Sizes = { "Mammoth", "Draft", "Giant", "Huge" }
	},
	WornNeedle = {
		Rarity = "Epic",
		Image = 99820614268266,
		Description = "\240\159\167\170 Guarantees 1 patterns, 1 cosmetics, and 1 paints",
		MaterialType = "Cosmetic",
		MaxCosmetics = {
			MaxPatternsPerSlot = 1,
			MaxPaintsPerSlot = 1,
			MaxCosmeticsPerSlot = 1,
			AlwaysMax = true
		}
	},
	GlassNeedle = {
		Rarity = "Epic",
		Image = 135801197923241,
		Description = "\240\159\167\170 Guarantees 2 patterns, 2 cosmetics, and 1 paints",
		MutationType = "Default",
		MaterialType = "Cosmetic",
		MaxCosmetics = {
			MaxPatternsPerSlot = 2,
			MaxPaintsPerSlot = 1,
			MaxCosmeticsPerSlot = 2,
			AlwaysMax = true
		}
	},
	GoldenNeedle = {
		Rarity = "Epic",
		Image = 78539478618809,
		Description = "\240\159\167\170 Guarantees 3 patterns, 3 cosmetics, and 1 paints",
		MaterialType = "Cosmetic",
		MaxCosmetics = {
			MaxPatternsPerSlot = 3,
			MaxPaintsPerSlot = 1,
			MaxCosmeticsPerSlot = 3,
			AlwaysMax = true
		}
	},
	GalacticNeedle = {
		Rarity = "Epic",
		Image = 129719396311474,
		Description = "\240\159\167\170 Guarantees 4 patterns, 4 cosmetics, and 2 paints",
		MaterialType = "Cosmetic",
		MaxCosmetics = {
			MaxPatternsPerSlot = 4,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 4,
			AlwaysMax = true
		}
	},
	FemaleCharm = {
		Rarity = "Epic",
		Image = 124202610405759,
		DescriptionType = "PlushMachineMaterial",
		Gender = "Female",
		MaterialType = "Gender"
	},
	MaleCharm = {
		Rarity = "Uncommon",
		Image = 80859635094228,
		DescriptionType = "PlushMachineMaterial",
		Gender = "Male",
		MaterialType = "Gender"
	},
	WingCharm = {
		Rarity = "Epic",
		Image = 104034231891950,
		DescriptionType = "PlushMachineMaterial",
		MaterialType = "WingMutation"
	},
	HornCharm = {
		Rarity = "Epic",
		Image = 86135098019402,
		DescriptionType = "PlushMachineMaterial",
		MaterialType = "Horn"
	},
	MutationCharm = {
		Rarity = "Epic",
		Image = 138295006293717,
		DescriptionType = "PlushMachineMaterial",
		MaterialType = "Mutation"
	},
	WhiteDye = {
		Rarity = "Epic",
		Image = 103173026265218,
		DescriptionType = "PlushMachineMaterial",
		MaterialType = "Dye",
		Preset = { "White", "WhiteBlack" }
	},
	BlackDye = {
		Rarity = "Epic",
		Image = 70682018631566,
		DescriptionType = "PlushMachineMaterial",
		MaterialType = "Dye",
		Preset = { "BlackBrown", "Black", "BlackWhite" }
	},
	FaeDye = {
		Rarity = "Epic",
		Image = 127073349336722,
		DescriptionType = "PlushMachineMaterial",
		MaterialType = "Dye",
		Preset = { "FaeOakwood", "FaeAspen", "FaeMaple", "FaeBirch", "FaeBlossom", "FaeGoldBirch", "FaePoinciana", "FaeWisteria" }
	},
	KelpDye = {
		Rarity = "Epic",
		Image = 119449317891948,
		DescriptionType = "PlushMachineMaterial",
		MaterialType = "Dye",
		Preset = {
			"KelpieSwamp",
			"KelpieKelp",
			"KelpieGrass",
			"KelpieDark",
			"KelpieVibrant",
			"KelpieGreenBlue",
			"KelpieMint",
			"KelpieGold",
			"KelpieRedKelp"
		}
	},
	PeryDye = {
		Rarity = "Epic",
		Image = 87417777804160,
		DescriptionType = "PlushMachineMaterial",
		MaterialType = "Dye",
		Preset = {
			"Macaw",
			"Green",
			"BlackBlue",
			"BrownGreen",
			"WhiteBlue",
			"PeryCream",
			"PeryGray",
			"PeryBGray",
			"PeryLTan",
			"PeryWTan",
			"PeryGBrown",
			"PeryCBrown",
			"PeryWBrown",
			"PeryDBrown"
		}
	},
	PlushDye = {
		Rarity = "Epic",
		Image = 132477325941386,
		DescriptionType = "PlushMachineMaterial",
		MaterialType = "Dye",
		Preset = { "PlushWhite", "PlushBlack", "PlushGreen", "PlushBlue", "PlushPurple", "PlushRed" }
	},
	FloraDye = {
		Rarity = "Legendary",
		Image = 75719448525955,
		DescriptionType = "PlushMachineMaterial",
		MaterialType = "Dye",
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
		}
	},
	FestiveDye = {
		Rarity = "Christmas",
		Image = 75719448525955,
		DescriptionType = "PlushMachineMaterial",
		MaterialType = "Dye",
		Preset = { "AlcesTan", "AlcesCream", "AlcesWhite", "AlcesBlack", "AlcesIce", "AlcesIceSnap", "AlcesWinter" }
	}
}