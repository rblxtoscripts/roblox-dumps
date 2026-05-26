-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	AnkyHorns = {
		P = 40,
		Strength = 40
	},
	ParaHorn = {
		P = 35,
		Strength = 35
	},
	PachyCrest = {
		P = 40,
		Strength = 40
	},
	StyracoCrest = {
		P = 30,
		Strength = 30
	},
	LambeoCrest = {
		P = 30,
		Strength = 30
	},
	EyeCrest = {
		P = 40,
		Strength = 40
	},
	GigaCrest = {
		P = 30,
		Strength = 30
	},
	NoseCrest = {
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