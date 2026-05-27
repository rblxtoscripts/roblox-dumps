-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("Constants")
local tbl = {
	{
		PriceMultiplier = 2.5,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				NoMutations = true,
				P = 75,
				Species = { "Hauntmare", "Ghoulsteed" },
				Preset = { "GhoulStone", "GhoulSwamp", "GhoulSpectral" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			}
		}
	},
	{
		PriceMultiplier = 5,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				P = 35,
				Species = { "Ghoulsteed", "Hauntmare" },
				Preset = { "GhoulStone", "GhoulSwamp", "GhoulSpectral", "GhoulHell", "GhoulWere" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2
				}
			}
		}
	},
	{
		PriceMultiplier = 10,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				P = 10,
				MaxEyeRarity = 75,
				Species = { "Ghoulsteed", "Hauntmare" },
				Preset = { "GhoulStone", "GhoulSwamp", "GhoulSpectral", "GhoulHell", "GhoulPumpkin", "GhoulWere", "GhoulUndead" },
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
				Species = { "Ghoulsteed", "Hauntmare" },
				Preset = {
					"GhoulStone",
					"GhoulSwamp",
					"GhoulSpectral",
					"GhoulHell",
					"GhoulPumpkin",
					"GhoulVampire",
					"GhoulBat",
					"GhoulWere",
					"GhoulUndead",
					"Rotted"
				},
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
				Origin = "Developer",
				Infertile = true,
				P = 10,
				Species = { "Ghoulsteed", "Hauntmare" },
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
					"Vaporwave",
					"Magma",
					"JewelBeetle"
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
				Species = { "Ghoulsteed", "Hauntmare" },
				Preset = {
					"GhoulStone",
					"GhoulSwamp",
					"GhoulSpectral",
					"GhoulHell",
					"GhoulPumpkin",
					"GhoulVampire",
					"GhoulBat",
					"GhoulWere",
					"GhoulUndead",
					"Rotted"
				},
				BreedingPresetPairs = {
					{
						{ "GhoulStone", "GhoulSpectral", "GhoulPumpkin", "GhoulBat", "GhoulUndead" },
						{ "GhoulSwamp", "GhoulHell", "GhoulPumpkin", "GhoulVampire", "GhoulWere", "Rotted" }
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