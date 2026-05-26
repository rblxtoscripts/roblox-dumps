-- https://lua.expert/
local t = {
	MythosMane = {
		P = 20,
		Strength = 20
	},
	CAFlowyMane = {
		DisplayName = "FlowyMane",
		P = 30,
		Strength = 30
	},
	CAWildMane = {
		DisplayName = "WildMane",
		P = 30,
		Strength = 30
	},
	SweptMane = {
		P = 30,
		Strength = 30
	},
	CATwoTonedMane = {
		DisplayName = "TwoTonedMane",
		P = 30,
		Strength = 30
	},
	RoughCollieMane = {
		P = 30,
		Strength = 30
	},
	KitsuneBellMane = {
		P = 15,
		Strength = 15
	},
	BarboryMane = {
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