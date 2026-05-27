-- https://lua.expert/
local t = {
	{
		ProductId = 3369710211,
		ProductName = "Common",
		Species = { "Horse", "Bisorse", "Equus" }
	},
	{
		ProductId = 3592894561,
		ProductName = "Uncommon",
		Species = { "Caprine", "Pony", "AkhalTeke", "Fjord" }
	},
	{
		ProductId = 3369710379,
		ProductName = "Rare",
		Species = { "Unicorn", "Plush", "Peryton", "Kelpie", "Gargoyle", "Flora" }
	},
	{
		ProductId = 3592894263,
		ProductName = "Epic",
		Species = { "Clydesdale", "Cactaline", "Fae", "Friesian", "Caniquine" }
	},
	{
		ProductId = 3369710538,
		ProductName = "Legendary",
		Species = { "Saurequine", "Celestial", "Cybred", "Kirin", "Hippocampus" }
	},
	{
		ProductId = 3592893965,
		ProductName = "Mythic",
		Species = { "Felorse", "Seraph", "Anticorn", "Nephyrian" }
	}
}
for v1, v2 in t do
	v2.ProductType = "TackProducts"
end
return t