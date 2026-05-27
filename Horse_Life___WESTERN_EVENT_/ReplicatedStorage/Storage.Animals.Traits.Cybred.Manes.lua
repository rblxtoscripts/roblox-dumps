-- https://lua.expert/
local t = {
	RochedMane = {
		DisplayName = "RoachedMane",
		P = 50,
		Strength = 50
	},
	SyntheticMane = {
		P = 40,
		Strength = 30
	},
	BoundCableMane = {
		P = 30,
		Strength = 20
	},
	CableMane = {
		P = 30,
		Strength = 20
	},
	PunkHairMane = {
		P = 30,
		Strength = 20
	},
	FauxMane = {
		P = 30,
		Strength = 20
	},
	ScorpioMane = {
		P = 30,
		Strength = 20
	},
	IceDragonMane = {
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}