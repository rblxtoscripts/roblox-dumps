-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	AstroidBelt = {
		DisplayName = "AsteroidBelt",
		P = 35,
		Strength = 35
	},
	CelestialRingHalo = {
		P = 35,
		Strength = 35
	},
	CelestialRingNecklace = {
		P = 35,
		Strength = 35
	},
	CelestialRingSocks = {
		P = 35,
		Strength = 35
	},
	GalaxyCore = {
		P = 35,
		Strength = 35
	},
	GalaxyFeathering = {
		P = 35,
		Strength = 35
	},
	GalaxyNeckRing = {
		P = 35,
		Strength = 35
	},
	OrbCore = {
		P = 35,
		Strength = 35
	},
	PlanetaryCore = {
		P = 35,
		Strength = 35
	},
	SolarSystem1 = {
		DisplayName = "SolarSystem",
		P = 35,
		Strength = 35
	},
	StarfireFeathering = {
		P = 35,
		Strength = 35
	},
	PathOfStars = {
		P = 35,
		Strength = 35
	},
	PathOfStarsAnklet = {
		P = 35,
		Strength = 35
	},
	StarLitTears = {
		P = 35,
		Strength = 35
	},
	SleekAnkleFur = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}