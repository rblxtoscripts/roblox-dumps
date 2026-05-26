-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 35
	},
	PetalheartPaint = {
		P = 40,
		Strength = 35
	},
	LovelyFacePaint = {
		P = 35,
		Strength = 35
	},
	LovelyPaint = {
		P = 35,
		Strength = 35
	},
	BrokenTearsPaint = {
		P = 30,
		Strength = 30
	},
	FrecklesPaint = {
		P = 30,
		Strength = 30
	},
	HeartBrokenPaint = {
		P = 25,
		Strength = 25
	},
	HeartBrokenTearsPaint = {
		P = 25,
		Strength = 25
	},
	WillowWindsPaint = {
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