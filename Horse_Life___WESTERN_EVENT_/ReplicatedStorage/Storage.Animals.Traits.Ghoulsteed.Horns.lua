-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	JaggedFangs = {
		P = 40,
		Strength = 40
	},
	HellHorn = {
		P = 25,
		Strength = 25
	},
	GOniFangs = {
		DisplayName = "OniFangs",
		P = 40,
		Strength = 40
	},
	DemonHorns = {
		P = 30,
		Strength = 30
	},
	CurledDevilHorns = {
		P = 30,
		Strength = 30
	},
	CurlingDemonHorns = {
		P = 25,
		Strength = 25
	},
	GoulishHorns = {
		DisplayName = "GhoulishHorns",
		P = 35,
		Strength = 35
	},
	CurledHorn = {
		P = 35,
		Strength = 35
	},
	SpikedHorn = {
		P = 35,
		Strength = 35
	},
	HornCrown = {
		P = 25,
		Strength = 25
	},
	HighDemonHorns = {
		P = 15,
		Strength = 15
	},
	ThinHorns = {
		P = 25,
		Strength = 25
	},
	MoonHorns = {
		P = 10,
		Strength = 10
	},
	GDraconicHorns = {
		DisplayName = "DraconicHorns",
		P = 40,
		Strength = 40
	},
	GGoatHorns = {
		DisplayName = "GoatHorns",
		P = 35,
		Strength = 35
	},
	GRamHorns = {
		DisplayName = "RamHorns",
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