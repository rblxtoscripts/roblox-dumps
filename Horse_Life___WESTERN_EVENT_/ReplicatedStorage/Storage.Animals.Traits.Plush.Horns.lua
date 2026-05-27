-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	JellyHorns = {
		P = 10,
		Strength = 40
	},
	UniHorn = {
		P = 10,
		Strength = 40
	},
	TinyDemonHorns = {
		P = 10,
		Strength = 40
	},
	TeenyHorns = {
		P = 10,
		Strength = 40
	},
	SheepHorns = {
		P = 10,
		Strength = 40
	},
	PGoatHorns = {
		DisplayName = "GoatHorns",
		P = 10,
		Strength = 40
	},
	DeerHorns = {
		P = 10,
		Strength = 40
	},
	CowHorns = {
		P = 10,
		Strength = 40
	},
	CurvedAntlers = {
		P = 10,
		Strength = 30
	},
	PCurvedHorn = {
		DisplayName = "CurvedHorn",
		P = 10,
		Strength = 40
	},
	PElkAntlers = {
		DisplayName = "ElkAntlers",
		P = 10,
		Strength = 20
	},
	TrikeHorns = {
		P = 10,
		Strength = 20
	},
	Pronghorns = {
		P = 10,
		Strength = 40
	},
	ReindeerPlushAntlers = {
		P = 10,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}