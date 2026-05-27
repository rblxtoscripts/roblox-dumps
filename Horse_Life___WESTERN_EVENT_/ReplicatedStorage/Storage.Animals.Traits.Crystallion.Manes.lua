-- https://lua.expert/
local t = {
	GeodeMane = {
		P = 40,
		Strength = 40
	},
	SharpCrystalMane = {
		P = 25,
		Strength = 25
	},
	ShortCrystalMane = {
		P = 35,
		Strength = 35
	},
	CrystalGrowthMane = {
		P = 35,
		Strength = 35
	},
	LongCrystalMane = {
		P = 35,
		Strength = 35
	},
	QuartzMane = {
		P = 35,
		Strength = 35
	},
	CrystalButterflyMane = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}