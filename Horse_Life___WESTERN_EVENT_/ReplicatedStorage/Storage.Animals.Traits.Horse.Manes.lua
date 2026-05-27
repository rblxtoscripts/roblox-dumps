-- https://lua.expert/
local t = {
	BasicMane = {
		P = 10,
		Strength = 25
	},
	WavyShortMane = {
		P = 10,
		Strength = 25
	},
	LongMane = {
		P = 10,
		Strength = 25
	},
	RoachedMane = {
		P = 10,
		Strength = 25
	},
	ShaggyMane = {
		P = 10,
		Strength = 25
	},
	WavyLongMane = {
		P = 10,
		Strength = 25
	},
	FluffyMane = {
		P = 10,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}