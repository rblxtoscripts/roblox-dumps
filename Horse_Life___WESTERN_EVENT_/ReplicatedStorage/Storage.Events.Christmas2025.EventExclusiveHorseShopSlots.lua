-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("Constants")
local tbl = {
	{
		PriceMultiplier = 30,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Alces",
				Infertile = true,
				P = 35,
				MaxEyeRarity = 40,
				Preset = { "AlcesIceSnap", "AlcesWinter", "AlcesRedWhite", "AlcesFir", "PeryBGray", "BlackBlue", "WhiteBlue" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 4,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 4
				}
			}
		}
	},
	{
		PriceMultiplier = 30,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Hollyhoof",
				Infertile = true,
				P = 10,
				MaxEyeRarity = 40,
				Preset = { "AuroraBorealis", "AlcesFestive", "AlcesRedWhite", "AlcesIceSnap", "AlcesWinter", "AlcesFir" },
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
	v.SlotType = "ExclusiveEvent"
	if v.BreedingPair then
		v.BreedingPair.SlotType = "ExclusiveEvent"
	end
	if v.ProductId then
		v.ProductType = "HorseShopSlot"
	end
end
return tbl