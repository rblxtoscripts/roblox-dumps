-- https://lua.expert/
local t = {
	Nothing = {
		P = 5,
		Strength = 5
	},
	HeadFluff = {
		P = 10,
		Strength = 10
	},
	HOHindTuft = {
		DisplayName = "HindTuft",
		P = 20,
		Strength = 20
	},
	HOBellyFluff = {
		DisplayName = "BellyFluff",
		P = 10,
		Strength = 10
	},
	CheekFlower = {
		P = 15,
		Strength = 15
	},
	ShoulderFlowers = {
		P = 15,
		Strength = 15
	},
	HOLegSpikes = {
		DisplayName = "LegSpikes",
		P = 20,
		Strength = 20
	},
	HindPollenSock = {
		P = 15,
		Strength = 15
	},
	PollenShoulderSplash = {
		P = 20,
		Strength = 20
	},
	PollenTrails = {
		P = 10,
		Strength = 10
	},
	AntenaePollen = {
		DisplayName = "AntennaePollen",
		P = 15,
		Strength = 15
	},
	BombusSocks = {
		P = 15,
		Strength = 15
	},
	BombusCheekFluff = {
		P = 15,
		Strength = 15
	},
	HOBackFluff = {
		DisplayName = "BackFluff",
		P = 15,
		Strength = 15
	},
	HOThighFluff = {
		DisplayName = "ThighFluff",
		P = 15,
		Strength = 15
	},
	Mandibles = {
		P = 20,
		Strength = 20
	},
	BackPollenClumps = {
		P = 15,
		Strength = 15
	},
	BasketSocks = {
		P = 15,
		Strength = 15
	},
	HindPollenClumps = {
		P = 15,
		Strength = 15
	},
	FluffyEarTips = {
		P = 25,
		Strength = 25
	},
	FuzzyPollenLegs = {
		P = 10,
		Strength = 10
	},
	PollenCheektufts = {
		P = 25,
		Strength = 25
	},
	PowderedAntenae = {
		DisplayName = "PowderedAntennae",
		P = 20,
		Strength = 20
	},
	PowederedHooves = {
		DisplayName = "PowderedHooves",
		P = 20,
		Strength = 20
	},
	HoneyTippedAntennae = {
		P = 15,
		Strength = 15
	},
	HoneyUnderside = {
		P = 15,
		Strength = 15
	},
	RoyalJellySocks = {
		P = 20,
		Strength = 20
	},
	BlossomingAntennae = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}