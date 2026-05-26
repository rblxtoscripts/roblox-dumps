-- https://lua.expert/
local t = {
	Nothing = {
		P = 30,
		Strength = 30
	},
	FrightfulHorn = {
		P = 50,
		Strength = 50
	},
	GhastlyTusks = {
		P = 40,
		Strength = 40
	},
	NoseSpine = {
		P = 50,
		Strength = 50
	},
	SharpHorns = {
		P = 40,
		Strength = 40
	},
	FlameHorns = {
		P = 30,
		Strength = 30
	},
	HMChainedHorns = {
		DisplayName = "ChainedHorns",
		P = 40,
		Strength = 40
	},
	EldritchAntlers = {
		P = 45,
		Strength = 45
	},
	FourWayAntlers = {
		P = 40,
		Strength = 40
	},
	ShatteredHorn = {
		P = 30,
		Strength = 30
	},
	MaskedBrokenWings = {
		P = 30,
		Strength = 30
	},
	DragonHorns = {
		P = 50,
		Strength = 50
	},
	PetrudingHorns = {
		DisplayName = "ProtrudingHorns",
		P = 30,
		Strength = 30
	},
	DecayingHorns = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}