-- https://lua.expert/
local t = {
	QuarterMane = {
		P = 25,
		Strength = 40
	},
	BisonMane = {
		P = 25,
		Strength = 40
	},
	BShaggyMane = {
		DisplayName = "ShaggyMane",
		P = 25,
		Strength = 40
	},
	BSparseMane = {
		DisplayName = "SparseMane",
		P = 25,
		Strength = 40
	},
	RoughCutMane = {
		P = 25,
		Strength = 25
	},
	WildBeastMane = {
		P = 25,
		Strength = 25
	},
	BIShaggyMane = {
		DisplayName = "DenseMane",
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