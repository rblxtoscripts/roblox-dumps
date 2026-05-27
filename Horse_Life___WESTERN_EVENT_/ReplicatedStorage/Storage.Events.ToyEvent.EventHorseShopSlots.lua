-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("Constants")
local tbl = {
	{
		PriceMultiplier = 6,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Horlse",
				NoMutations = true,
				P = 75,
				Preset = { "LegoBlue", "LegoPurple", "LegoSky" }
			}
		}
	},
	{
		PriceMultiplier = 7,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Horlse",
				NoMutations = true,
				P = 75,
				Preset = { "LegoBlue", "LegoBrown", "LegoBlackYellow", "LegoLemonade", "LegoViolet" }
			}
		}
	},
	{
		PriceMultiplier = 10,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Horlse",
				NoMutations = true,
				P = 75,
				Preset = { "LegoBlackViolet", "LegoBlackNougat", "LegoBlackViolet", "LegoAzurePink", "LegoWhitePink" }
			}
		}
	},
	{
		PriceMultiplier = 9,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Horlse",
				NoMutations = true,
				P = 75,
				Preset = { "LegoOlive", "LegoYellow", "LegoBlackAzure", "LegoSpringGreenWhite" }
			}
		}
	},
	{
		PriceMultiplier = 10,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Horlse",
				NoMutations = true,
				P = 75,
				Preset = { "LegoYellow", "LegoHoney", "LegoBlackYellow", "LegoBlackWhite" }
			}
		}
	},
	{
		PriceMultiplier = 10,
		Currency = v1.EventCurrencyName,
		Choices = {
			{
				Species = "Horlse",
				NoMutations = true,
				P = 75,
				Preset = { "LegoHoney", "LegoBlue", "LegoCoolYellowWhite" }
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