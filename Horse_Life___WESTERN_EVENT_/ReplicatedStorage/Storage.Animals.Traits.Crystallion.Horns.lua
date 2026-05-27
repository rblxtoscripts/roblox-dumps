-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 75
	},
	CrystalKuduHorns = {
		P = 25,
		Strength = 25
	},
	JadeHelm = {
		P = 40,
		Strength = 40
	},
	ObsidianHorn = {
		P = 35,
		Strength = 35
	},
	OpalHorns = {
		P = 30,
		Strength = 30
	},
	PyriteAntlers = {
		P = 25,
		Strength = 25
	},
	SharpCrystalHorn = {
		P = 40,
		Strength = 40
	},
	StalaciteCrown = {
		P = 20,
		Strength = 20
	},
	CrystalHornCrown = {
		P = 20,
		Strength = 20
	},
	BentCrystalHorn = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}