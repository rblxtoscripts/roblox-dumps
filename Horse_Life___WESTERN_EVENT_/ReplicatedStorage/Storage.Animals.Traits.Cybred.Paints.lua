-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	CircuitsPaint = {
		P = 40,
		Strength = 40
	},
	CyberAccentsPaint = {
		P = 40,
		Strength = 40
	},
	RunesPaint = {
		P = 35,
		Strength = 35
	},
	BattlePaint = {
		P = 25,
		Strength = 25
	},
	Fluents = {
		P = 20,
		Strength = 20
	},
	NeatCables = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}