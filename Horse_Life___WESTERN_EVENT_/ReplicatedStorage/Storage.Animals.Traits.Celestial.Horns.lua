-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	CelestialBullHorns = {
		P = 35,
		Strength = 35
	},
	CelestialDraconicHorns = {
		P = 35,
		Strength = 35
	},
	CelestialRamHorns = {
		P = 35,
		Strength = 35
	},
	CelestialUnicornHorn = {
		P = 35,
		Strength = 35
	},
	BlackholeHorns = {
		P = 35,
		Strength = 35
	},
	ChainedHorns = {
		P = 35,
		Strength = 35
	},
	JewledDragonHorns = {
		DisplayName = "JeweledDragonHorns",
		P = 35,
		Strength = 35
	},
	StarrySkeletonSkull = {
		P = 35,
		Strength = 35
	},
	StarryMoonHorn = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}