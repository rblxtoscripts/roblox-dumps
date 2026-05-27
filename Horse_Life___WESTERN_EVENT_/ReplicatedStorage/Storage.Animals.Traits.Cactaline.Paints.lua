-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 40
	},
	SerratedPaint = {
		P = 40,
		Strength = 40
	},
	DragonFruitSeeds = {
		P = 30,
		Strength = 30
	},
	PoisonCactus = {
		P = 30,
		Strength = 30
	},
	VultureMask = {
		P = 30,
		Strength = 30
	},
	LizardStreak = {
		P = 30,
		Strength = 30
	},
	Gravel = {
		P = 30,
		Strength = 30
	},
	CanyonPaint = {
		P = 30,
		Strength = 30
	},
	KestrelPaint = {
		P = 30,
		Strength = 30
	},
	MuddyMarkingsPaint = {
		DisplayName = "MuddyMarkings",
		P = 30,
		Strength = 30
	},
	PebblesPaint = {
		P = 30,
		Strength = 30
	},
	SandyStreakPaint = {
		DisplayName = "SandyStreak",
		P = 30,
		Strength = 30
	},
	SharpChestPaint = {
		P = 30,
		Strength = 30
	},
	SharpLeavesPaint = {
		DisplayName = "SharpLeaves",
		P = 30,
		Strength = 30
	},
	ThornStripesPaint = {
		DisplayName = "ThornStripes",
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}