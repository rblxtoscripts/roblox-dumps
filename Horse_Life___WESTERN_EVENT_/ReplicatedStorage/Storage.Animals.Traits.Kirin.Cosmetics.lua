-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 25
	},
	BackScales = {
		P = 30,
		Strength = 30
	},
	DraconicBeard = {
		P = 30,
		Strength = 30
	},
	KAnkleFur = {
		DisplayName = "AnkleFur",
		P = 30,
		Strength = 30
	},
	KChestFur = {
		DisplayName = "ChestFur",
		P = 35,
		Strength = 35
	},
	KThighFur = {
		DisplayName = "ThighFur",
		P = 40,
		Strength = 40
	},
	Headscales = {
		P = 40,
		Strength = 40
	},
	AncientBeard = {
		P = 40,
		Strength = 40
	},
	ChestScales = {
		P = 35,
		Strength = 35
	},
	LegScales = {
		P = 35,
		Strength = 35
	},
	RoundBackScales = {
		P = 20,
		Strength = 20
	},
	TuftedAnkleFur = {
		P = 40,
		Strength = 40
	},
	FierceCheekFur = {
		P = 40,
		Strength = 40
	},
	NoseRidges = {
		P = 40,
		Strength = 40
	},
	SleekNeckFur = {
		P = 35,
		Strength = 35
	},
	WindsweptAnkleFur = {
		P = 35,
		Strength = 35
	},
	EmperorSocks = {
		P = 35,
		Strength = 35
	},
	EasternDragonBackFur = {
		P = 35,
		Strength = 35
	},
	WindcharmMustache = {
		P = 35,
		Strength = 35
	},
	EasternDragonMustache = {
		P = 35,
		Strength = 35
	},
	SparseBackScales = {
		P = 35,
		Strength = 35
	},
	DraconicClaws = {
		P = 35,
		Strength = 35
	},
	BackHeartScales = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 30
	},
	PuffyAnkleTufts = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}