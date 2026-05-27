-- https://lua.expert/
local tbl = {
	TornLasso = 50,
	StringLasso = 70,
	WovenLasso = 90,
	BraidedLasso = 120,
	GoldLasso = 160,
	RainbowLasso = 200,
	WesternLasso = 90,
	VibrantLasso = 90,
	MagicalLasso = 120,
	CactiLasso = 120,
	OvergrownLasso = 120,
	KelpLasso = 120,
	MysticCloudLasso = 120,
	MysticWebLasso = 160,
	RoseLasso = 160,
	OceanLasso = 210,
	JungleLasso = 210,
	FairyNet = 500,
	MagicFairyNet = 750,
	PlushCoin = 5000,
	CarrotOnAStick = 1300,
	BasicFeed = 125,
	WaterBucket = 150,
	GoodFeed = 250,
	PremiumFeed = 500,
	ExclusiveFeed = 1000,
	MysticFeed = 2000,
	OatMuffin = 10,
	SugarMuffin = 25,
	MintMuffin = 50,
	CarrotMuffin = 100,
	AppleMuffin = 200,
	NameTag = 2000,
	ColorDye = 1500,
	MutationDeletePotion = 2500,
	RestingWingPotion = 2500,
	LiftedWingPotion = 5000,
	WingUpgradePotion = 2750,
	InfertilityPotion = 1000,
	Soap = 5,
	GoodSoap = 100,
	Brush = 10,
	GoodBrush = 200,
	Hose = 20,
	GoodHose = 500,
	Wood = 5,
	Stone = 10,
	Glass = 20,
	Fabric = 20,
	Nails = 10,
	ArcaneMutationPotion = {
		ProductType = "Items",
		ProductId = 3588737839
	},
	ArtisanMutationPotion = {
		ProductType = "Items",
		ProductId = 3592907458
	},
	MutationPotion = {
		ProductType = "Items",
		ProductId = 1860937786
	},
	GenderSwapPotion = {
		ProductType = "Items",
		ProductId = 1900029611
	},
	BigenderPotion = {
		ProductType = "Items",
		ProductId = 1902222321
	},
	MutationSlotPotion = {
		ProductType = "Items",
		ProductId = 1920610339
	}
}
for k, v in pairs(tbl) do
	if type(v) == "table" then
		v.Name = k
	end
end
return tbl