-- https://lua.expert/
local tbl = {
	{
		ProductId = 1913054047,
		BundleName = "StarterBundle",
		Infertile = false
	},
	{
		ProductId = 1913102023,
		BundleName = "BreedersBundle",
		Infertile = true
	},
	{
		ProductId = 3592818084,
		BundleName = "ArcaneBundle",
		Infertile = false
	},
	{
		ProductId = 1913676981,
		BundleName = "PinkBundle",
		Infertile = false
	},
	{
		ProductId = 3376948951,
		BundleName = "LassoBundle"
	},
	{
		ProductId = 3376968196,
		BundleName = "FoodBundle"
	},
	{
		ProductId = 2658284039,
		BundleName = "FloraBundle",
		Infertile = false
	},
	{
		ProductId = 3231182559,
		BundleName = "CelestialBundle",
		Infertile = false
	},
	{
		ProductId = 3250115435,
		BundleName = "SaurequineBundle",
		Infertile = false
	},
	{
		ProductId = 3290135825,
		BundleName = "KirinBundle",
		Infertile = false
	},
	{
		ProductId = 2668081852,
		BundleName = "FlightBundle",
		Infertile = false
	},
	{
		ProductId = 2420773611,
		BundleName = "PlushBundle",
		Infertile = false
	},
	{
		ProductId = 2701868016,
		BundleName = "CybredBundle",
		Infertile = false
	},
	{
		ProductId = 2677553379,
		BundleName = "SantaBundle",
		Infertile = false
	},
	{
		ProductId = 3278198116,
		BundleName = "HippoBundle",
		Infertile = false
	},
	{
		ProductId = 3316162375,
		BundleName = "CactalineBundle",
		Infertile = false
	},
	{
		ProductId = 1940806899,
		BundleName = "AccessoryBundle",
		Infertile = false
	},
	{
		ProductId = 3263122214,
		BundleName = "HauntedBundle",
		Infertile = false
	},
	{
		ProductId = 3263122370,
		BundleName = "HauntedItemBundle",
		Infertile = false
	},
	{
		ProductId = 1940806847,
		BundleName = "LimitedBundle",
		Infertile = false
	},
	{
		ProductId = 3559528572,
		BundleName = "SweetbondBundle",
		Infertile = false
	},
	{
		ProductId = 3559529117,
		BundleName = "EternalTie",
		Infertile = false
	}
}
for k, v in pairs(tbl) do
	if v.ProductId then
		v.ProductType = "Bundle"
	end
end
return tbl