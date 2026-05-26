-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IsTestGame = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").IsTestGame
local t = {
	MaxSpeciesSpawned = 3,
	SpeciesToSpawn = {
		Clydesdale = 30,
		Felorse = 15,
		AkhalTeke = 35,
		Friesian = 20
	},
	Presets = {
		Clydesdale = {
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
		AkhalTeke = { "AkhalBlack", "AkhalGold", "AkhalBrown" },
		Felorse = {
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
		Friesian = {
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
		}
	},
	MaxCosmetics = {
		Clydesdale = {
			MaxPatternsPerSlot = 4,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 4
		},
		Felorse = {
			MaxPatternsPerSlot = 4,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 4
		},
		AkhalTeke = {
			MaxPatternsPerSlot = 4,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 4
		},
		Friesian = {
			MaxPatternsPerSlot = 4,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 4
		}
	}
}
t.ChanceToSpawn = if IsTestGame then 100 else 25
t.TimeToSpawn = if IsTestGame then 20 else 600
return t