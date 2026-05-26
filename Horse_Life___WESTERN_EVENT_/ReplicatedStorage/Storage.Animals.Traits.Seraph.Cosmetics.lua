-- https://lua.expert/
local t = {
	Nothing = {
		P = 5,
		Strength = 5
	},
	ChestFeathers = {
		P = 30,
		Strength = 30
	},
	SChinFeathers = {
		DisplayName = "ChinFeathers",
		P = 30,
		Strength = 30
	},
	HindEyeFeathers = {
		P = 25,
		Strength = 25
	},
	HindWingCover = {
		P = 20,
		Strength = 20
	},
	ShoulderEyeFeathers = {
		P = 25,
		Strength = 25
	},
	EyeStreak = {
		P = 20,
		Strength = 20
	},
	CryingEyes = {
		P = 15,
		Strength = 15
	},
	ExtraEyes = {
		P = 25,
		Strength = 25
	},
	FacialTuft = {
		P = 20,
		Strength = 20
	},
	SFeatheredEars = {
		DisplayName = "FeatheredEars",
		P = 25,
		Strength = 25
	},
	FeatheredEyebrows = {
		P = 25,
		Strength = 25
	},
	FrontTuft = {
		P = 20,
		Strength = 20
	},
	SHindTuft = {
		DisplayName = "HindTuft",
		P = 20,
		Strength = 20
	},
	DivineBodyWings = {
		P = 15,
		Strength = 15
	},
	DivineLegFur = {
		P = 20,
		Strength = 20
	},
	FalseHoofs = {
		DisplayName = "FalseHooves",
		P = 15,
		Strength = 15
	},
	FeatherCrest = {
		P = 25,
		Strength = 25
	},
	SHindFur = {
		DisplayName = "HindFur",
		P = 25,
		Strength = 25
	},
	HoofedSockFur = {
		P = 25,
		Strength = 25
	},
	DesolateLegHair = {
		P = 15,
		Strength = 15
	},
	FallenClaws = {
		P = 20,
		Strength = 20
	},
	FallenFangs = {
		P = 20,
		Strength = 20
	},
	ForeLegs = {
		P = 25,
		Strength = 25
	},
	GildedFangs = {
		P = 20,
		Strength = 20
	},
	ChainEyes = {
		P = 15,
		Strength = 15
	},
	GildedRibs = {
		P = 15,
		Strength = 15
	},
	VoidRift = {
		P = 15,
		Strength = 15
	},
	TearingEyes = {
		P = 20,
		Strength = 20
	},
	HindWings = {
		P = 15,
		Strength = 15
	},
	SideWings = {
		P = 15,
		Strength = 15
	},
	WingAnkles = {
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