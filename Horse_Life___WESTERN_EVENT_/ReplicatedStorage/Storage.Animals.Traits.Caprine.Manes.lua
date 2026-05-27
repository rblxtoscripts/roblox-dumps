-- https://lua.expert/
local t = {
	PartialBodyMane = {
		P = 25,
		Strength = 25
	},
	HalfTuftMane = {
		P = 25,
		Strength = 25
	},
	LargePuffyMane = {
		P = 25,
		Strength = 25
	},
	CShortMane = {
		DisplayName = "ShortMane",
		P = 25,
		Strength = 25
	},
	AncientBraidedMane = {
		P = 20,
		Strength = 20
	},
	MysticMane = {
		P = 25,
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