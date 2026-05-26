-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	CAWildPattern = {
		DisplayName = "WildPattern",
		P = 25,
		Strength = 25
	},
	CAMaskedPattern = {
		DisplayName = "MaskedPattern",
		P = 25,
		Strength = 25
	},
	Whirl = {
		P = 25,
		Strength = 25
	},
	Merle = {
		P = 25,
		Strength = 25
	},
	CASpotted = {
		DisplayName = "Spotted",
		P = 25,
		Strength = 25
	},
	RoughCollieCap = {
		P = 25,
		Strength = 25
	},
	StreakingMarks = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}