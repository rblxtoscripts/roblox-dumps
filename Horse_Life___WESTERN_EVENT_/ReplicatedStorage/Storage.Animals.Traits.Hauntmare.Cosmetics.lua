-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 10
	},
	BellySpikes = {
		P = 40,
		Strength = 40
	},
	DraconicBodyGrowth = {
		P = 40,
		Strength = 40
	},
	DraconicBodyPlates = {
		P = 30,
		Strength = 30
	},
	DraconicNeckSpikes = {
		P = 20,
		Strength = 20
	},
	DraconicRibs = {
		P = 30,
		Strength = 30
	},
	NeckSpikes = {
		P = 40,
		Strength = 40
	},
	PhoenixBeak = {
		P = 40,
		Strength = 40
	},
	PhoenixChestFeathers = {
		P = 30,
		Strength = 30
	},
	ShoulderSpines = {
		P = 20,
		Strength = 20
	},
	SpinedBack = {
		P = 30,
		Strength = 30
	},
	SpinedHead = {
		P = 30,
		Strength = 30
	},
	SpinedLegs = {
		P = 30,
		Strength = 30
	},
	SpinedSides = {
		P = 30,
		Strength = 30
	},
	LimbTeeth = {
		P = 20,
		Strength = 20
	},
	HeadBoneOverGrowth = {
		P = 30,
		Strength = 30
	},
	JawBoneOverGrowth = {
		P = 30,
		Strength = 30
	},
	LegBoneOverGrowth = {
		P = 40,
		Strength = 40
	},
	NeckBoneOverGrowth = {
		P = 40,
		Strength = 40
	},
	SideBoneOverGrowth = {
		P = 30,
		Strength = 30
	},
	AngryEyebrows = {
		P = 20,
		Strength = 20
	},
	FlameHoofs = {
		DisplayName = "FlameHooves",
		P = 15,
		Strength = 15
	},
	FlamedBack = {
		P = 15,
		Strength = 15
	},
	UpperFlameSpikes = {
		P = 15,
		Strength = 15
	},
	SplitFace = {
		P = 20,
		Strength = 20
	},
	HMTusks = {
		DisplayName = "Tusks",
		P = 20,
		Strength = 20
	},
	FacialPiercing = {
		P = 25,
		Strength = 25
	},
	FurredShoulders = {
		P = 30,
		Strength = 30
	},
	FurredThighs = {
		P = 30,
		Strength = 30
	},
	PetrudingRibSpikes = {
		DisplayName = "ProtrudingRibSpikes",
		P = 20,
		Strength = 20
	},
	DecayingCape = {
		P = 20,
		Strength = 20
	},
	DecayingFace = {
		P = 20,
		Strength = 20
	},
	DecayingSpikes = {
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