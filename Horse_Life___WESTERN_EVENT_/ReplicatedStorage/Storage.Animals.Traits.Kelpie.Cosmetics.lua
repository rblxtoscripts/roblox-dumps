-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	HeadFins = {
		P = 40,
		Strength = 40
	},
	LimbFins = {
		P = 40,
		Strength = 40
	},
	DownwardAnkleFins = {
		P = 40,
		Strength = 40
	},
	SwampFeathering = {
		P = 40,
		Strength = 40
	},
	ChinFin = {
		P = 40,
		Strength = 40
	},
	UnderbellyAlgae = {
		P = 40,
		Strength = 40
	},
	CheekAlgae = {
		P = 40,
		Strength = 40
	},
	Chestfins = {
		P = 35,
		Strength = 35
	},
	ShoulderAlgae = {
		P = 35,
		Strength = 35
	},
	MossyHind = {
		P = 35,
		Strength = 35
	},
	DroopyHeadAlgae = {
		P = 35,
		Strength = 35
	},
	FeatherAlgaeSocks = {
		P = 35,
		Strength = 35
	},
	HindAlgae = {
		P = 25,
		Strength = 25
	},
	ThighFins = {
		P = 25,
		Strength = 25
	},
	ChestFin = {
		P = 25,
		Strength = 25
	},
	DroopyBodyAlgae = {
		P = 15,
		Strength = 15
	},
	AlgeaFeathering = {
		DisplayName = "AlgaeFeathering",
		P = 15,
		Strength = 15
	},
	KelpCover = {
		P = 15,
		Strength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}