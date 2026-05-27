-- https://lua.expert/
local t = {
	ShortCurledMane = {
		P = 40,
		Strength = 40
	},
	ChoppedMane = {
		P = 40,
		Strength = 40
	},
	GLongMane = {
		DisplayName = "LongMane",
		P = 30,
		Strength = 30
	},
	Mohawk = {
		P = 30,
		Strength = 30
	},
	WeepingMane = {
		P = 30,
		Strength = 30
	},
	MulticolorMane = {
		P = 30,
		Strength = 30
	},
	BelovedMane = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}