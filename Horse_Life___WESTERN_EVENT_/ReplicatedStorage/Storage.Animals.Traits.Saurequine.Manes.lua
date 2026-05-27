-- https://lua.expert/
local t = {
	Bald = {
		P = 35,
		Strength = 35
	},
	UtahMane = {
		P = 30,
		Strength = 30
	},
	RaptorMane = {
		P = 25,
		Strength = 25
	},
	SparseScaleMane = {
		P = 35,
		Strength = 35
	},
	LongFeatherMane = {
		P = 30,
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