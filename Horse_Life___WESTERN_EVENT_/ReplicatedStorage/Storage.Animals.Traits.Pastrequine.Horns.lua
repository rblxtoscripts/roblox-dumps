-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	CandleHorn = {
		P = 25,
		Strength = 25
	},
	GummyHorn = {
		P = 40,
		Strength = 40
	},
	MeltedCandleHorn = {
		P = 35,
		Strength = 35
	},
	WaffleConeHorn = {
		P = 30,
		Strength = 30
	},
	StrawHorn = {
		P = 35,
		Strength = 35
	},
	DangoHorns = {
		P = 25,
		Strength = 25
	},
	WarpedCandycaneAntlers = {
		P = 25,
		Strength = 25
	},
	CakepopsAntlers = {
		P = 35,
		Strength = 35
	},
	GummyAntlers = {
		P = 25,
		Strength = 25
	},
	DonutHorn = {
		P = 35,
		Strength = 35
	},
	CroissantAntlers = {
		P = 35,
		Strength = 35
	},
	BananaAntlers = {
		P = 25,
		Strength = 25
	},
	FreshCreamHorn = {
		P = 35,
		Strength = 35
	},
	TaiyakiHorn = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}