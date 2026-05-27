-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 35
	},
	BristleBeard = {
		P = 40,
		Strength = 40
	},
	CactiClusterArms = {
		P = 35,
		Strength = 35
	},
	CactiClusterSocks = {
		P = 40,
		Strength = 40
	},
	LegThorns = {
		P = 35,
		Strength = 35
	},
	SerratedArmPlates = {
		P = 30,
		Strength = 30
	},
	SerratedSocks = {
		P = 35,
		Strength = 35
	},
	Spinebuds = {
		P = 40,
		Strength = 40
	},
	SucculentLegFlowers = {
		P = 40,
		Strength = 40
	},
	SucculentFaceArmor = {
		P = 35,
		Strength = 35
	},
	SucculentArmor = {
		P = 25,
		Strength = 25
	},
	TangledCactusSocks = {
		P = 25,
		Strength = 25
	},
	LooseCactiGrowths = {
		P = 30,
		Strength = 30
	},
	HoyaKerriiVines = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}