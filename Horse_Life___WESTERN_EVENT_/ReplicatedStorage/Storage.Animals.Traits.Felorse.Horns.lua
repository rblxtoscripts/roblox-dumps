-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 50
	},
	CappedCanines = {
		P = 20,
		Strength = 20
	},
	LongCanines = {
		P = 25,
		Strength = 25
	},
	BrokenSaberTooth = {
		P = 35,
		Strength = 35
	},
	MultiFang = {
		P = 30,
		Strength = 30
	},
	TinyTeeth = {
		P = 45,
		Strength = 45
	},
	WildTeeth = {
		P = 45,
		Strength = 45
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}