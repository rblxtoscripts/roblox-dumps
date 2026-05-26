-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 35
	},
	FreckleStars = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Unicorn",
		CrossbreedStrength = 15
	},
	StreakingStars = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Unicorn",
		CrossbreedStrength = 10
	},
	ArmpitPaint = {
		P = 40,
		Strength = 40
	},
	HindSplash = {
		P = 40,
		Strength = 40
	},
	FaceSplash = {
		P = 40,
		Strength = 40
	},
	ForeheadHeart = {
		P = 40,
		Strength = 40
	},
	TabianoPaint = {
		DisplayName = "TobianoPaint",
		P = 25,
		Strength = 35
	},
	PSabinoPaint = {
		DisplayName = "SabinoPaint",
		P = 25,
		Strength = 35
	},
	HeadPaint = {
		P = 40,
		Strength = 40
	},
	HeartPaint = {
		P = 30,
		Strength = 30
	},
	LavaLampPaint = {
		P = 15,
		Strength = 15
	},
	CalicoPatch = {
		P = 15,
		Strength = 15
	},
	ScruffyDapplePaint = {
		P = 15,
		Strength = 15
	},
	BlotchyMask = {
		P = 15,
		Strength = 15
	},
	CloudDapplingPaint = {
		P = 0,
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