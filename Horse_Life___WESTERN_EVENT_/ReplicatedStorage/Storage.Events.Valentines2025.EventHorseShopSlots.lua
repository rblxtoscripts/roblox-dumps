-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("Constants")
local tbl = {
	{
		PriceMultiplier = 1.25,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Pastrequine",
				NoMutations = true,
				P = 75,
				Preset = { "PastryChocRas", "PastryMint", "PastryBrown", "PastryCotton", "PastryOrange", "PastryMatcha" },
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
				Species = "Pastrequine",
				NoMutations = true,
				P = 35,
				Preset = { "PastryChocRas", "PastryMint", "PastryBrown", "PastryCotton", "PastryOrange", "PastryMatcha" },
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
				Species = "Pastrequine",
				P = 10,
				MaxEyeRarity = 75,
				Preset = { "PastryChocRas", "PastryMint", "PastryBrown", "PastryCotton", "PastryOrange", "PastryMatcha" },
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
				Species = "Pastrequine",
				P = 75,
				MaxEyeRarity = 65,
				Preset = { "PastryChocRas", "PastryMint", "PastryBrown", "PastryCotton", "PastryOrange", "PastryMatcha" },
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
				Species = "Pastrequine",
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
					"Poison"
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
				Species = "Pastrequine",
				P = 75,
				MaxEyeRarity = 50,
				Preset = { "PastryChocRas", "PastryMint", "PastryBrown", "PastryCotton", "PastryOrange", "PastryMatcha" },
				BreedingPresetPairs = {
					{
						{ "PastryChocRas" },
						{ "PastryMint" }
					},
					{
						{ "PastryOrange" },
						{ "PastryMatcha" }
					},
					{
						{ "PastryBrown" },
						{ "PastryCotton" }
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