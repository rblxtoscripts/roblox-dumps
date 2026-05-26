-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	HOHindStripes = {
		DisplayName = "HindStripes",
		P = 25,
		Strength = 25
	},
	PollenSpots = {
		P = 25,
		Strength = 25
	},
	Beeline = {
		P = 25,
		Strength = 25
	},
	Sunburst = {
		P = 15,
		Strength = 15
	},
	WoolCarderStripes = {
		P = 15,
		Strength = 15
	},
	CollectorsBuzz = {
		P = 25,
		Strength = 25
	},
	HOScutesPattern = {
		DisplayName = "ScutesPattern",
		P = 25,
		Strength = 25
	},
	RoyalDrizzlePattern = {
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