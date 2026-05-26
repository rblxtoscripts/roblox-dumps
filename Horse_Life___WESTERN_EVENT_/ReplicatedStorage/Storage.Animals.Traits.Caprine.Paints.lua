-- https://lua.expert/
local t = {
	Nothing = {
		P = 0,
		Strength = 25
	},
	ThighSplashPaint = {
		P = 25,
		Strength = 40
	},
	SplashBodyPaint = {
		P = 25,
		Strength = 35
	},
	StreakFacePaint = {
		P = 25,
		Strength = 40
	},
	BadgerFacePaint = {
		P = 25,
		Strength = 40
	},
	MoonSpots = {
		P = 25,
		Strength = 40
	},
	BrokenFrontalPaint = {
		P = 25,
		Strength = 30
	},
	UnderbellySplotches = {
		P = 25,
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