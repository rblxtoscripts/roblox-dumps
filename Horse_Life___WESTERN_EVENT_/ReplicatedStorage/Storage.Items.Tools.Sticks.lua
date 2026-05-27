-- https://lua.expert/
local t = {
	"MermaidCrown",
	"StarfishEarClip",
	"CoralTiara",
	"SeaweedEarBow",
	"KelpCrown",
	"ClamEarClip",
	"HibiscusEarClip",
	"HibiscusFlowerCrown",
	"ManateePlush",
	"ShrimpPlush"
}
return {
	CarrotOnAStick = {
		Uses = 1,
		Rarity = "Common",
		ToolType = "FishingRod",
		Description = "A basic fishing rod used to catch basic kelpies and aquatic accessories",
		Image = 17735606725,
		Distance = 125,
		Cooldown = 0.75,
		Hit = 30,
		Points = 7,
		Choices = {
			{
				Species = "Kelpie",
				NoMutations = true,
				P = 98,
				Preset = { "KelpieSwamp", "KelpieKelp", "KelpieGrass", "KelpieDark" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			},
			{
				Themes = false,
				P = 2,
				Items = t
			}
		}
	},
	BerryOnAStick = {
		Uses = 1,
		Rarity = "Rare",
		ToolType = "FishingRod",
		Description = "An intermediate fishing rod used to catch unique kelpies and aquatic accessories",
		Image = 17735613173,
		Distance = 150,
		Cooldown = 0.75,
		Hit = 35,
		Points = 8,
		Choices = {
			{
				Species = "Kelpie",
				P = 90,
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
					Nothing = 50,
					Wings = 5,
					Glow = 0
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 3,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 3
				}
			},
			{
				Themes = true,
				P = 5,
				Items = t
			}
		}
	},
	GoldAppleOnAStick = {
		Uses = 1,
		Rarity = "Legendary",
		ToolType = "FishingRod",
		Image = 17735614204,
		Description = "A high quality fishing rod used to catch rare kelpies and aquatic accessories",
		Distance = 175,
		Cooldown = 0.5,
		Hit = 40,
		Points = 10,
		Choices = {
			{
				Species = "Kelpie",
				P = 92,
				Preset = {
					"KelpieGrass",
					"KelpieVibrant",
					"KelpieMint",
					"KelpieRedKelp",
					"KelpieDark",
					"KelpieDark",
					"KelpieGreenBlue",
					"KelpieGold",
					"RedKelp",
					"BlueKelp"
				},
				MutationChances = {
					Nothing = 25,
					Wings = 25,
					Glow = 0
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 4,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 4
				}
			},
			{
				Themes = true,
				P = 8,
				Items = t
			}
		}
	},
	MagnetOnAStick = {
		Uses = 1,
		Rarity = "Legendary",
		ToolType = "FishingRod",
		Image = 110065526471878,
		Description = "A high quality fishing rod used to catch aquatic accessories",
		Distance = 175,
		Cooldown = 0.5,
		Hit = 40,
		Points = 10,
		Choices = {
			{
				Species = "Kelpie",
				P = 20,
				Preset = { "Koi" },
				MutationChances = {
					Nothing = 25,
					Wings = 25,
					Glow = 0
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 4,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 4
				}
			},
			{
				Themes = true,
				P = 80,
				Items = t
			}
		}
	},
	AppleOnAStick = {
		Uses = 1,
		Rarity = "Common",
		ToolType = "FishingRod",
		Description = "A basic fishing rod used for Apple Bobbing!",
		Image = 134142061702129,
		Distance = 150,
		Cooldown = 0.5,
		Hit = 40,
		EventOnly = true,
		Cost = 0,
		Points = 1
	}
}