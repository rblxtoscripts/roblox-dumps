-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("Constants")
local tbl = {
	{
		PriceMultiplier = 1.8,
		Currency = v1.EventCurrencyName,
		{
			{
				Species = "Ghoulsteed",
				NoMutations = true,
				P = 75,
				Preset = { "GhoulStone", "GhoulSwamp", "GhoulSpectral" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 1,
					MaxPaintsPerSlot = 0,
					MaxCosmeticsPerSlot = 0
				}
			}
		}
	},
	{
		PriceMultiplier = 2,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Ghoulsteed",
				NoMutations = true,
				P = 35,
				Preset = { "GhoulStone", "GhoulSwamp", "GhoulSpectral", "GhoulHell", "GhoulWere" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 1
				}
			}
		}
	},
	{
		PriceMultiplier = 2.25,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Ghoulsteed",
				P = 10,
				MaxEyeRarity = 75,
				Preset = { "GhoulStone", "GhoulSwamp", "GhoulSpectral", "GhoulHell", "GhoulPumpkin", "GhoulWere", "GhoulUndead" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2
				}
			}
		}
	},
	{
		ProductId = 1942402534,
		Choices = {
			{
				Species = "Ghoulsteed",
				P = 75,
				MaxEyeRarity = 65,
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
					Wings = 100,
					Glow = 0
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 3,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 3
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