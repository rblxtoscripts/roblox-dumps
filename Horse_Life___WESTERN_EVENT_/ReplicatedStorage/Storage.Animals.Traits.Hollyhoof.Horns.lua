-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	TinyAntlers = {
		P = 50,
		Strength = 40
	},
	CandycaneHorn = {
		P = 40,
		Strength = 40
	},
	CandycaneAntlers = {
		P = 30,
		Strength = 30
	},
	LargeAntlers = {
		P = 35,
		Strength = 35
	},
	NubAntlers = {
		P = 50,
		Strength = 40
	},
	KrampusHorns = {
		P = 30,
		Strength = 30
	},
	AuroraHorn = {
		P = 30,
		Strength = 30
	},
	HollyHorn = {
		P = 30,
		Strength = 30
	},
	SwirledHorn = {
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