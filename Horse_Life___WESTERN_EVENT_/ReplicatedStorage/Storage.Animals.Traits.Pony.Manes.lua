-- https://lua.expert/
local t = {
	RegularMane = {
		P = 25,
		Strength = 40
	},
	VoluminousMane = {
		P = 25,
		Strength = 40
	},
	HalfPaintMane = {
		P = 25,
		Strength = 40
	},
	ShortChopMane = {
		P = 25,
		Strength = 40
	},
	ScruffyMane = {
		P = 25,
		Strength = 40
	},
	TuftyMane = {
		P = 25,
		Strength = 40
	},
	WildFluffyMane = {
		P = 25,
		Strength = 40
	},
	TwoTonedCurlMane = {
		P = 25,
		Strength = 40
	},
	PShaggyMane = {
		DisplayName = "ShaggyMane",
		P = 25,
		Strength = 40
	},
	MoonbeamMane = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}