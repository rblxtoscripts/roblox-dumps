-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 35
	},
	CSabinoPaint = {
		DisplayName = "SabinoPaint",
		P = 25,
		Strength = 25
	},
	SimplePaint = {
		P = 40,
		Strength = 40
	},
	HollowRhomb = {
		P = 40,
		Strength = 40
	},
	SideStripes = {
		P = 35,
		Strength = 35
	},
	OrcaPaint = {
		P = 30,
		Strength = 30
	},
	Rabicano = {
		P = 25,
		Strength = 25
	},
	ShoulderPaint = {
		P = 35,
		Strength = 35
	},
	DorsalSplashPaint = {
		P = 25,
		Strength = 25
	},
	OveroPaint = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}