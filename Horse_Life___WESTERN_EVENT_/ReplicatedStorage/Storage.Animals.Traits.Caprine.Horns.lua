-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 50
	},
	IbexHorns = {
		P = 50,
		Strength = 50
	},
	GoatHorns = {
		P = 50,
		Strength = 50
	},
	KuduHorns = {
		P = 50,
		Strength = 50
	},
	CRamHorns = {
		DisplayName = "RamHorns",
		P = 50,
		Strength = 50
	},
	JacobsHorns = {
		P = 50,
		Strength = 50
	},
	EarCurlHorns = {
		P = 50,
		Strength = 50
	},
	ShortHorns = {
		P = 50,
		Strength = 50
	},
	SylvanHorns = {
		P = 50,
		Strength = 50
	},
	LargeMysticHorn = {
		P = 50,
		Strength = 50
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}