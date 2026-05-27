-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("Constants")
local tbl = {
	{
		PriceMultiplier = 2,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Wolper",
				NoMutations = true,
				P = 75,
				Preset = { "White", "Blonde", "RedBrown", "Brown", "LightBrown", "DarkBrown", "Arabian", "BrownBlonde" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			}
		}
	},
	{
		PriceMultiplier = 4,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Honeytrot",
				NoMutations = true,
				P = 35,
				Preset = {
					"Honeybee",
					"Cream",
					"Blonde",
					"Arabian",
					"BrownBlonde",
					"LightGray",
					"Mustang",
					"Bumblebee",
					"Yellowjacket",
					"GardenFlower"
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
		PriceMultiplier = 15,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Wolper",
				P = 10,
				MaxEyeRarity = 75,
				Preset = { "WolpTricolor", "WolpBlackCalico", "WolpCalico", "WolpGray", "WolpPink" },
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
				Species = "Honeytrot",
				P = 75,
				MaxEyeRarity = 65,
				Preset = {
					"Honeybee",
					"Cream",
					"Blonde",
					"Arabian",
					"BrownBlonde",
					"LightGray",
					"Mustang",
					"Bumblebee",
					"Yellowjacket",
					"GardenFlower"
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
				Species = "Honeytrot",
				Origin = "Developer",
				Infertile = true,
				P = 25,
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
					"LunarMoth"
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
				Species = "Wolper",
				P = 75,
				MaxEyeRarity = 50,
				Preset = { "WolpTricolor", "WolpBlackCalico", "WolpCalico", "WolpGray", "WolpPink" },
				BreedingPresetPairs = {
					{
						{ "WolpTricolor" },
						{ "WolpBlackCalico", "WolpCalico", "WolpGray", "WolpPink" }
					},
					{
						{ "WolpCalico" },
						{ "WolpBlackCalico", "WolpGray", "WolpPink" }
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
	v.SlotType = "Event"
	if v.BreedingPair then
		v.BreedingPair.SlotType = "Event"
	end
	if v.ProductId then
		v.ProductType = "HorseShopSlot"
	end
end
return tbl