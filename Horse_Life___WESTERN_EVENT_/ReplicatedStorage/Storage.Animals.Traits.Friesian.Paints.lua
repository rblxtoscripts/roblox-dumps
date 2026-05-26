-- https://lua.expert/
local t = {
	Nothing = {
		P = 20,
		Strength = 20
	},
	BoldShinePaint = {
		P = 20,
		Strength = 20
	},
	HeartMarkPaint = {
		P = 15,
		Strength = 15
	},
	HeavyShinePaint = {
		P = 15,
		Strength = 15
	},
	SleekShinePaint = {
		P = 15,
		Strength = 15
	},
	SleekShineSocksPaint = {
		P = 20,
		Strength = 20
	},
	SportSocksPaint = {
		P = 20,
		Strength = 20
	},
	StarMarkPaint = {
		P = 20,
		Strength = 20
	},
	FishedDapplePaint = {
		P = 10,
		Strength = 10
	},
	DelicateSakuraPaint = {
		P = 10,
		Strength = 10
	},
	PoisonSocksPaint = {
		P = 10,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}