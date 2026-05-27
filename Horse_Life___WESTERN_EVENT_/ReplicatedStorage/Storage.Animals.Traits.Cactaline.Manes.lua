-- https://lua.expert/
local t = {
	BristleMane = {
		P = 40,
		Strength = 40
	},
	SucculentMane = {
		P = 30,
		Strength = 30
	},
	TangledCactusMane = {
		P = 25,
		Strength = 25
	},
	LongCactiMane = {
		P = 30,
		Strength = 30
	},
	CoarseCactiMane = {
		P = 20,
		Strength = 20
	},
	DrylandsMane = {
		P = 35,
		Strength = 35
	},
	LooseMane = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}