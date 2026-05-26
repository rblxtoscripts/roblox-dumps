-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 50
	},
	Unihorn = {
		P = 20,
		Strength = 20
	},
	IndustrialHorns = {
		P = 30,
		Strength = 30
	},
	WiredHorns = {
		P = 25,
		Strength = 25
	},
	TrikeBullHorns = {
		P = 15,
		Strength = 15
	},
	SaberFangs = {
		P = 15,
		Strength = 15
	},
	GearRamHorns = {
		P = 15,
		Strength = 15
	},
	IceDragonHorn = {
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