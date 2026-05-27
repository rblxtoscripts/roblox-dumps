-- https://lua.expert/
local tbl = {
	SpringLasso = 250,
	BunnyLasso = 300,
	EasterWingPotion = 30000,
	WolperBasicSocks = 500,
	WolperBasicBridle = 750,
	WolperBasicSaddle = 2200,
	DandelionScythe = 3000,
	CarrotLance = 2500,
	DecoratedEggs = 1500,
	ChocolateBunny = 2000,
	CarrotCake = 1750,
	BabyChick = 500,
	AprilShowersUmbrella = 3500,
	BunnyTopHat = 2750,
	WolperMask = 4000,
	SpringHeadBand = 1250,
	EasterEggHeadBand = 1000,
	BunnyBucketHat = 1500,
	EasterEggStaff = 2000,
	HoneyDipper = 2500,
	HoneyHive = 2500,
	DewyCloverLeaf = 1500,
	BeeSword = 4000,
	MilkChocolateBunny = 2000,
	EasterEggBasket = 2500,
	EasterBowStaff = 3000,
	CrackedEasterEgg = 1000,
	EasterBasket = 5000,
	PaintedEggs = 5000,
	FarmAnimals = 5000,
	PinkTulips = 2500,
	YellowTulips = 2500,
	PurpleTulips = 2500,
	Bunny = 3500,
	BabyCarrot = 3500,
	DyedEggs = 2500
}
for k, v in pairs(tbl) do
	if type(v) == "table" then
		v.Name = k
	end
end
return tbl