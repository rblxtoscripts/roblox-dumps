-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 40
	},
	ENebula = {
		DisplayName = "Nebula",
		P = 40,
		Strength = 40
	},
	WebbedStripes = {
		P = 30,
		Strength = 30
	},
	AsteroidBeltPattern = {
		P = 40,
		Strength = 40
	},
	WarpedPattern = {
		P = 30,
		Strength = 30
	},
	ThickStripes = {
		P = 40,
		Strength = 40
	},
	HadelPattern = {
		P = 20,
		Strength = 20
	},
	HoopPattern = {
		P = 50,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}