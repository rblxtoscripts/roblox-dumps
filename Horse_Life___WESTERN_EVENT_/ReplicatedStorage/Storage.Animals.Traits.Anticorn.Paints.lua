-- https://lua.expert/
local t = {
	Nothing = {
		P = 30,
		Strength = 30
	},
	VeinsPaint = {
		P = 30,
		Strength = 30
	},
	CorruptSwirlsPaint = {
		P = 40,
		Strength = 40
	},
	MeteorShowerPaint = {
		P = 35,
		Strength = 35
	},
	BlightedPaint = {
		P = 30,
		Strength = 30
	},
	CorruptedEyePaint = {
		P = 35,
		Strength = 35
	},
	ACorruptedLegPaint = {
		DisplayName = "CorruptedLegPaint",
		P = 35,
		Strength = 35
	},
	ThunderstormPaint = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}