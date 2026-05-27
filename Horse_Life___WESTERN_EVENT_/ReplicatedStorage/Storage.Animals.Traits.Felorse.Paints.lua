-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	LionSpots = {
		P = 35,
		Strength = 35
	},
	Calico = {
		P = 20,
		Strength = 20
	},
	OvercastCapePaint = {
		P = 30,
		Strength = 30
	},
	SparseMarksPaint = {
		P = 40,
		Strength = 40
	},
	SwathePaint = {
		P = 25,
		Strength = 25
	},
	VantaPeltPaint = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}