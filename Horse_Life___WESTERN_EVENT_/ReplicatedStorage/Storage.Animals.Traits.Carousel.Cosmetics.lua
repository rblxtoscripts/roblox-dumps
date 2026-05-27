-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 35
	},
	MessyFurTuft = {
		P = 40,
		Strength = 40
	},
	MessyHoofTufts = {
		P = 35,
		Strength = 35
	},
	CurlingHoofFur = {
		P = 25,
		Strength = 25
	},
	CurledLash = {
		P = 40,
		Strength = 40
	},
	DaintyRibbons = {
		P = 35,
		Strength = 35
	},
	HeartGem = {
		P = 35,
		Strength = 35
	},
	PearlAnkles = {
		P = 35,
		Strength = 35
	},
	FurryNeck = {
		P = 25,
		Strength = 25
	},
	TasselBeard = {
		P = 40,
		Strength = 40
	},
	TasselLining = {
		P = 30,
		Strength = 30
	},
	WhispyThighFur = {
		P = 30,
		Strength = 30
	},
	AthensEarFur = {
		P = 30,
		Strength = 30
	},
	PartyBanners = {
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