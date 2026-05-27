-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ChestRibbon = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	StitchLining = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	WideLashes = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	Septum = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	LilFangs = {
		P = 25,
		Strength = 40
	},
	ChunkyAnkleFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	EarBow = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LiningFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	DragonBeard = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	DragonWhiskers = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	PlushSpikes = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	CottonWhispBelly = {
		P = 25,
		Strength = 30,
		Type = "Furs"
	},
	HeavyFeathering = {
		P = 25,
		Strength = 30,
		Type = "Furs"
	},
	HaySocks = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	CottonWhispAnkles = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	GyaruEyes = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ChestBow = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LegCords = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	LegBowRibbons = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	CordedBow = {
		P = 20,
		Strength = 20,
		Type = "Furs"
	},
	ZipperCosmetic = {
		P = 20,
		Strength = 20,
		Type = "Furs"
	},
	TailBow = {
		P = 20,
		Strength = 20,
		Type = "Furs"
	},
	LooseCottonCosmetic = {
		P = 20,
		Strength = 20,
		Type = "Furs"
	},
	LooseCottonSocks = {
		P = 20,
		Strength = 20,
		Type = "Furs"
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}