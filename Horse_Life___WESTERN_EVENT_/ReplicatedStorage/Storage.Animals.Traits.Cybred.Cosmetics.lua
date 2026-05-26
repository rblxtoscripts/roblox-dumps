-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	PipesCosmetic = {
		P = 30,
		Strength = 40
	},
	WiresCosmetic = {
		P = 30,
		Strength = 40
	},
	ClovenHoofCover = {
		P = 25,
		Strength = 40
	},
	TechImplants = {
		P = 25,
		Strength = 40
	},
	SleekLimbArmor = {
		P = 25,
		Strength = 15
	},
	SleekUpperArmor = {
		P = 25,
		Strength = 15
	},
	SteampunkHoof = {
		P = 25,
		Strength = 15
	},
	SteampunkNeck = {
		P = 25,
		Strength = 15
	},
	SteampunkChest = {
		P = 25,
		Strength = 15
	},
	MechMask = {
		P = 25,
		Strength = 15
	},
	MechBody = {
		P = 25,
		Strength = 15
	},
	MechLimbs = {
		P = 25,
		Strength = 15
	},
	CyberFins = {
		P = 25,
		Strength = 15
	},
	SyntheticFeathering = {
		P = 25,
		Strength = 15
	},
	EnergyCables = {
		P = 25,
		Strength = 25
	},
	RadioactiveAnkleTubes = {
		P = 35,
		Strength = 35
	},
	RadioactiveBodyTubes = {
		P = 35,
		Strength = 35
	},
	ScorpioNeckArmour = {
		P = 25,
		Strength = 25
	},
	ScorpioBellyArmour = {
		P = 25,
		Strength = 25
	},
	ScorpioAnkleFur = {
		P = 30,
		Strength = 30
	},
	IceDragonChestSpikes = {
		P = 0,
		Strength = 10
	},
	IceDragonBackSpikes = {
		P = 0,
		Strength = 10
	},
	IceDragonClaws = {
		P = 0,
		Strength = 10
	},
	IceDragonFrontSpikes = {
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}