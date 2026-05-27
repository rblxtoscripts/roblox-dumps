-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 50
	},
	Antlers = {
		P = 40,
		Strength = 40
	},
	Antlers = {
		P = 40,
		Strength = 40
	},
	TallAntlers = {
		P = 35,
		Strength = 35
	},
	PuduHorns = {
		P = 35,
		Strength = 35
	},
	ThinElkAntlers = {
		P = 30,
		Strength = 30
	},
	CrookedAntlers = {
		P = 25,
		Strength = 25
	},
	ProminentAntlers = {
		P = 25,
		Strength = 25
	},
	ElkAntlers = {
		P = 15,
		Strength = 15
	},
	MooseAntlers = {
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