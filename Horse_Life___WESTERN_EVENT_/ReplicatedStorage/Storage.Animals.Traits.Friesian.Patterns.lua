-- https://lua.expert/
local t = {
	Nothing = {
		P = 20,
		Strength = 20
	},
	DelicateBlazePattern = {
		P = 20,
		Strength = 20
	},
	FrontBaldPintoPattern = {
		P = 20,
		Strength = 20
	},
	HindBaldPintoPattern = {
		P = 20,
		Strength = 20
	},
	HindSpotsPattern = {
		P = 20,
		Strength = 20
	},
	MessyBacklAppaloosaPattern = {
		DisplayName = "MessyBackAppaloosaPattern",
		P = 15,
		Strength = 15
	},
	MessyFrontAppaloosaPattern = {
		P = 15,
		Strength = 15
	},
	SportFrontalPattern = {
		P = 15,
		Strength = 15
	},
	SportHindPattern = {
		P = 15,
		Strength = 15
	},
	HeavySnowCapPattern = {
		P = 10,
		Strength = 10
	},
	GrullaBackStripe = {
		DisplayName = "GrullaBackStripePattern",
		P = 10,
		Strength = 10
	},
	GrullaLegStripes = {
		DisplayName = "GrullaLegStripesPattern",
		P = 10,
		Strength = 10
	},
	SakuraLegPattern = {
		P = 10,
		Strength = 10
	},
	ShaggyPattern = {
		P = 10,
		Strength = 10
	},
	PoisonFlowerPattern = {
		P = 10,
		Strength = 10
	},
	PoisonPetalFacePattern = {
		P = 10,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}