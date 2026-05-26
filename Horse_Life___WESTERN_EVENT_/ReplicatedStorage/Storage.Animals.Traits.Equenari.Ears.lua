-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 40
	},
	DroopedTentacleEars = {
		P = 40,
		Strength = 40
	},
	ArmouredHeadFins = {
		P = 40,
		Strength = 40
	},
	HoopEars = {
		P = 40,
		Strength = 40
	},
	SeradedEars = {
		DisplayName = "SerratedEars",
		P = 40,
		Strength = 40
	},
	WebbedEars = {
		P = 40,
		Strength = 40
	},
	DroopyEars = {
		P = 40,
		Strength = 40
	},
	FrilledEars = {
		P = 40,
		Strength = 40
	},
	SplitTentacleEars = {
		P = 40,
		Strength = 40
	},
	CurvedEars = {
		P = 40,
		Strength = 40
	},
	DoubleEars = {
		P = 40,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Ears"
end
return {
	Ears = t
}