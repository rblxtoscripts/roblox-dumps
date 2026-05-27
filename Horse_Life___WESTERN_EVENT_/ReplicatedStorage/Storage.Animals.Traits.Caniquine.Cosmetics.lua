-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 35
	},
	CAEarTuft = {
		DisplayName = "EarTuft",
		P = 15,
		Strength = 15
	},
	CASweptFeathers = {
		DisplayName = "SweptFeathers",
		P = 15,
		Strength = 15
	},
	CACheekFur = {
		DisplayName = "CheekFur",
		P = 15,
		Strength = 15
	},
	CALegFur = {
		DisplayName = "LegFur",
		P = 15,
		Strength = 15
	},
	CAThighFur = {
		DisplayName = "ThighFur",
		P = 15,
		Strength = 15
	},
	CAUnderbellyFur = {
		DisplayName = "UnderbellyFur",
		P = 15,
		Strength = 15
	},
	PointedCheekFur = {
		P = 15,
		Strength = 15
	},
	CABellyTuft = {
		DisplayName = "BellyTuft",
		P = 15,
		Strength = 15
	},
	CAShortCheekFur = {
		DisplayName = "ShortCheekFur",
		P = 15,
		Strength = 15
	},
	FlowyFeathers = {
		P = 15,
		Strength = 15
	},
	FlowyThighFur = {
		P = 15,
		Strength = 15
	},
	FlowyCheekFur = {
		P = 15,
		Strength = 15
	},
	RoughCollieCheekFur = {
		P = 25,
		Strength = 35
	},
	RoughCollieEarFur = {
		P = 25,
		Strength = 35
	},
	RoughCollieLegFur = {
		P = 25,
		Strength = 35
	},
	FlameAnkleTufts = {
		P = 15,
		Strength = 15
	},
	FlameEarTuft = {
		P = 20,
		Strength = 20
	},
	FlameLimbTufts = {
		P = 20,
		Strength = 20
	},
	KitsuneCheekFluff = {
		P = 20,
		Strength = 20
	},
	BarboryLegFluff = {
		P = 20,
		Strength = 20
	},
	BarboryFaceFluff = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}