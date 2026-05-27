-- https://lua.expert/
local t = {
	RegalMane = {
		P = 35,
		Strength = 35
	},
	ElegantMane = {
		P = 25,
		Strength = 25
	},
	ElegantBraidedMane = {
		P = 35,
		Strength = 35
	},
	VintageMane = {
		P = 25,
		Strength = 25
	},
	WindingMane = {
		P = 30,
		Strength = 30
	},
	FloweryMane = {
		P = 30,
		Strength = 30
	},
	SubtlePearlMane = {
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