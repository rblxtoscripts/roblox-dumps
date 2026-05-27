-- https://lua.expert/
local t = {
	TallHorn = {
		P = 75,
		Strength = 100
	},
	CurvedHorn = {
		P = 35,
		Strength = 35
	},
	SmallHorn = {
		P = 35,
		Strength = 75
	},
	NarwhalHorn = {
		P = 25,
		Strength = 35
	},
	RhinoHorn = {
		P = 25,
		Strength = 25
	},
	CrookedHorn = {
		P = 35,
		Strength = 35
	},
	TwistedHorn = {
		P = 35,
		Strength = 25
	},
	ElysainHorn = {
		DisplayName = "ElysianHorn",
		P = 35,
		Strength = 25
	},
	ScytheHorn = {
		P = 25,
		Strength = 30
	},
	ElvenHorn = {
		P = 15,
		Strength = 15
	},
	SplinteredHorn = {
		P = 15,
		Strength = 15
	},
	CrackedHorn = {
		P = 25,
		Strength = 25
	},
	WaningMoonHorn = {
		P = 25,
		Strength = 25
	},
	BrokenHorn = {
		P = 15,
		Strength = 25
	},
	ElkHorn = {
		P = 10,
		Strength = 10
	},
	SerratedHorn = {
		P = 10,
		Strength = 10
	},
	SolarHorn = {
		P = 10,
		Strength = 10
	},
	FadedHorn = {
		P = 10,
		Strength = 10
	},
	CorruptedHorn = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}