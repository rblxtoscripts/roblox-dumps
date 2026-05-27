-- https://lua.expert/
local t = {
	HollyMane = {
		P = 40,
		Strength = 40
	},
	PaintedRoachMane = {
		P = 40,
		Strength = 40
	},
	ToyMane = {
		P = 35,
		Strength = 35
	},
	CandycaneMane = {
		P = 35,
		Strength = 35
	},
	HeavyBellMane = {
		P = 35,
		Strength = 35
	},
	SnowfallMane = {
		P = 30,
		Strength = 30
	},
	BulbMane = {
		P = 25,
		Strength = 25
	},
	KrampusMane = {
		P = 25,
		Strength = 25
	},
	SnowingMane = {
		P = 30,
		Strength = 30
	},
	BorealisMane = {
		P = 30,
		Strength = 30
	},
	HFluffyMane = {
		DisplayName = "FluffyMane",
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}