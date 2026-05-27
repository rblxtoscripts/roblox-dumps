-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("Constants")
local tbl = {
	{
		PriceMultiplier = 1.25,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				NoMutations = true,
				P = 75,
				Species = { "Crystallion" },
				Preset = { "PurpleGem", "VioletGem", "SeaGreenGem", "GreenMarble", "BlueLav", "RockyCrystal", "RedStone", "Amber" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			}
		}
	},
	{
		PriceMultiplier = 3,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				P = 35,
				Species = { "Crystallion" },
				Preset = { "PurpleGem", "VioletGem", "SeaGreenGem", "GreenMarble", "BlueLav", "RockyCrystal", "RedStone", "Amber" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2
				}
			}
		}
	},
	{
		PriceMultiplier = 15,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				P = 10,
				MaxEyeRarity = 75,
				Species = { "Crystallion" },
				Preset = { "PurpleGem", "VioletGem", "SeaGreenGem", "GreenMarble", "BlueLav", "RockyCrystal", "RedStone", "Amber" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 3,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 2
				}
			}
		}
	},
	{
		ProductId = 1942402534,
		Choices = {
			{
				P = 75,
				MaxEyeRarity = 65,
				Species = { "Crystallion" },
				Preset = { "PurpleGem", "VioletGem", "SeaGreenGem", "GreenMarble", "BlueLav", "RockyCrystal", "RedStone", "Amber" },
				MutationSlotChances = {
					{
						Amount = 0,
						P = 0
					}
				},
				MutationChances = {
					Nothing = 0,
					Wings = 25,
					Glow = 0
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 4,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 3
				}
			}
		}
	},
	{
		ProductId = 2673311553,
		BreedingPair = {
			ProductId = 2673311602,
			Chance = 0.25
		},
		Choices = {
			{
				Species = "Crystallion",
				Origin = "Developer",
				Infertile = true,
				P = 10,
				Preset = {
					"PlushNeapolitan",
					"PlushNeapolitan2",
					"PlushMatchaBoba",
					"PlushRainbowSherbet",
					"MoonL",
					"MoonD",
					"Demon",
					"Nightmare",
					"Vampire",
					"Poison",
					"Morpho",
					"LunarMoth",
					"DartFrog",
					"Vaporwave"
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
				MutationsToGuarantee = {},
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
			{
				P = 90,
				MaxEyeRarity = 50,
				Species = { "Crystallion" },
				Preset = { "PurpleGem", "VioletGem", "SeaGreenGem", "GreenMarble", "BlueLav", "RockyCrystal", "RedStone", "Amber" },
				BreedingPresetPairs = {
					{
						{ "PurpleGem" },
						{ "VioletGem", "SeaGreenGem", "GreenMarble", "BlueLav", "RockyCrystal", "Redstone", "Amber" }
					},
					{
						{ "SeaGreenGem" },
						{ "VioletGem", "PurpleGem", "GreenMarble", "BlueLav", "RockyCrystal", "RedStone", "Amber" }
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
					MaxCosmeticsPerSlot = 4,
					AlwaysMax = true
				}
			}
		}
	}
}
for k, v in pairs(tbl) do
	v.Index = k
	v.SlotType = "Event"
	if v.BreedingPair then
		v.BreedingPair.SlotType = "Event"
	end
	if v.ProductId then
		v.ProductType = "HorseShopSlot"
	end
end
return tbl