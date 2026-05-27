-- https://lua.expert/
local t = {
	DecoratedMane = {
		P = 30,
		Strength = 30
	},
	CStandardMane = {
		DisplayName = "StandardMane",
		P = 40,
		Strength = 40
	},
	FadedMane = {
		P = 20,
		Strength = 20
	},
	FriesianMane = {
		P = 20,
		Strength = 20
	},
	ThickMultiMane = {
		P = 20,
		Strength = 20
	},
	RoyalMane = {
		P = 20,
		Strength = 20
	},
	NeatlyTrimmedMane = {
		P = 20,
		Strength = 20
	},
	ShortMulicoloredMane = {
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