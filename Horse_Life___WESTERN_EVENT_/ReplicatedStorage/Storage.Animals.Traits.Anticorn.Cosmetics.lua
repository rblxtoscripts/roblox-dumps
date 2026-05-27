-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	BeardFur = {
		P = 25,
		Strength = 25
	},
	AChestFur = {
		DisplayName = "ChestFur",
		P = 25,
		Strength = 25
	},
	LegFur = {
		P = 25,
		Strength = 25
	},
	FacialFracture = {
		P = 15,
		Strength = 15
	},
	RapturedBody = {
		P = 10,
		Strength = 10
	},
	SideFracture = {
		P = 15,
		Strength = 15
	},
	SmokingTrails = {
		P = 20,
		Strength = 20
	},
	AFacialTuft = {
		DisplayName = "FacialTuft",
		P = 25,
		Strength = 25
	},
	LongFeathers = {
		P = 25,
		Strength = 35
	},
	SideTuft = {
		P = 25,
		Strength = 35
	},
	FlamedAnkles = {
		P = 20,
		Strength = 20
	},
	ImperialCrest = {
		P = 15,
		Strength = 15
	},
	CorruptionLegSpikes = {
		P = 20,
		Strength = 20
	},
	EchoflareNeckTufts = {
		P = 25,
		Strength = 35
	},
	KingsNeckCrown = {
		P = 15,
		Strength = 15
	},
	UnderworldSpikes = {
		P = 20,
		Strength = 20
	},
	FeralSideFur = {
		P = 15,
		Strength = 15
	},
	FeralCheekFur = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}