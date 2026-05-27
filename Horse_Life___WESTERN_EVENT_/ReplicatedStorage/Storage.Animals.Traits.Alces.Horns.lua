-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	MooselyAntlers = {
		P = 40,
		Strength = 40
	},
	ElkishAntlers = {
		P = 35,
		Strength = 35
	},
	MoonAntlers = {
		P = 35,
		Strength = 35
	},
	SwirledAntlers = {
		P = 30,
		Strength = 30
	},
	ReindeerAntlers = {
		P = 25,
		Strength = 25
	},
	SnowyAntlers = {
		P = 20,
		Strength = 20
	},
	SharpAntlers = {
		P = 20,
		Strength = 20
	},
	RunicAntlers = {
		P = 15,
		Strength = 15
	},
	FrostBurnAntlers = {
		P = 15,
		Strength = 15
	},
	IvoryAntlers = {
		P = 15,
		Strength = 15
	},
	BifurcatedAntlers = {
		P = 15,
		Strength = 15
	},
	AlpineHorns = {
		P = 15,
		Strength = 15
	},
	DobleAntlers = {
		DisplayName = "DoubleAntlers",
		P = 15,
		Strength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}