-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	SpiderLilyChest = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	SpiderLilyAnkles = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ChestPetals = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ThightPetals = {
		DisplayName = "ThighPetals",
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	TuftedAnkles = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	BackPetals = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	PetalAnkleFluff = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LayeredPetalAnkles = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ThistleSocks = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	BlossomWhiskers = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	FloralButterflyBodyFrills = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	FloralButterflyLegFrills = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	FloralButterflyAnteana = {
		DisplayName = "Floral Butterfly Antennae",
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LargeCascadingPetals = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	SmallCascadingPetals = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	PetalMask = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	BodyVinedFlowers = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LegVinedFlowers = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	RoseLadyLegFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	FaceFlowers = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	CherryBlossomFacePetals = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 35,
		Type = "Furs"
	},
	CherryBlossomSocks = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 35,
		Type = "Furs"
	},
	CherryBlossomsSideFlowers = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 35,
		Type = "Furs"
	},
	LovelyPetalCape = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 35,
		Type = "Furs"
	},
	ThornedSocks = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 35,
		Type = "Furs"
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}