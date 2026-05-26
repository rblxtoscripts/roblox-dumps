-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 40
	},
	AstralMarkings = {
		P = 25,
		Strength = 25
	},
	Constellations = {
		P = 25,
		Strength = 25
	},
	PointedStars = {
		P = 25,
		Strength = 25
	},
	BodyShadowNebula = {
		P = 25,
		Strength = 25
	},
	StarRunes = {
		P = 25,
		Strength = 25
	},
	SpaceEyes = {
		P = 25,
		Strength = 25
	},
	SwirlingFrame = {
		P = 25,
		Strength = 25
	},
	ThreeSisters = {
		P = 25,
		Strength = 25
	},
	BlackholeClouds = {
		P = 25,
		Strength = 25
	},
	TwinStars = {
		P = 25,
		Strength = 25
	},
	StarBody = {
		P = 25,
		Strength = 25
	},
	AriesRibcagePattern = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}