-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	ArchHorns = {
		P = 35,
		Strength = 35
	},
	TendrilAntlers = {
		P = 35,
		Strength = 35
	},
	BranchingAntlers = {
		P = 25,
		Strength = 25
	},
	ExoskeletonAntlers = {
		P = 20,
		Strength = 20
	},
	RoyalAntlers = {
		P = 30,
		Strength = 30
	},
	PredatoryHorns = {
		P = 20,
		Strength = 20
	},
	HoopAntlers = {
		P = 35,
		Strength = 35
	},
	SeradedAntlers = {
		DisplayName = "SerratedAntlers",
		P = 35,
		Strength = 35
	},
	SeradedHorn = {
		DisplayName = "SerratedHorn",
		P = 35,
		Strength = 35
	},
	DoubleHorns = {
		P = 20,
		Strength = 20
	},
	EerieHorns = {
		P = 30,
		Strength = 30
	},
	ETwistedHorns = {
		DisplayName = "TwistedHorns",
		P = 20,
		Strength = 20
	},
	SoftAntlers = {
		P = 35,
		Strength = 35
	},
	DevilishHorns = {
		P = 35,
		Strength = 35
	},
	BulkyAntlers = {
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