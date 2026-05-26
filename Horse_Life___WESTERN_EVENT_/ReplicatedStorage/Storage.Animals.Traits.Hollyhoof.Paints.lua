-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	SnowflakePaint = {
		P = 50,
		Strength = 40
	},
	HindSnowflakePaint = {
		P = 40,
		Strength = 40
	},
	HindSnowPaint = {
		P = 40,
		Strength = 40
	},
	SnowedCheeksPaint = {
		P = 40,
		Strength = 40
	},
	SnowPaint = {
		P = 50,
		Strength = 40
	},
	BlizzardPaint = {
		P = 30,
		Strength = 30
	},
	LongStripePaint = {
		P = 35,
		Strength = 35
	},
	SleighingPaint = {
		P = 35,
		Strength = 35
	},
	StarPaint = {
		P = 30,
		Strength = 30
	},
	PaintedAccentsPaint = {
		P = 40,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}