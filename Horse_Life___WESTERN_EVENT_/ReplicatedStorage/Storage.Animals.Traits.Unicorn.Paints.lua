-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35
	},
	OkapiPaint = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Equus",
		CrossbreedStrength = 10
	},
	SwirledHindPaint = {
		P = 25,
		Strength = 35
	},
	StarBackPaint = {
		P = 25,
		Strength = 35
	},
	NoseHeart = {
		P = 25,
		Strength = 35
	},
	HindStar = {
		P = 25,
		Strength = 35
	},
	StripedPaint = {
		P = 25,
		Strength = 35
	},
	SnowcapPaint = {
		P = 25,
		Strength = 35
	},
	MottledMask = {
		P = 25,
		Strength = 35
	},
	MottledCape = {
		P = 25,
		Strength = 25
	},
	WhirlPaint = {
		P = 25,
		Strength = 20
	},
	LunarMarkings = {
		P = 25,
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