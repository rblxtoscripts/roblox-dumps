-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 25
	},
	FJStripedLegs = {
		DisplayName = "StripedLegs",
		P = 40,
		Strength = 25
	},
	FrontCover = {
		P = 40,
		Strength = 25
	},
	StandardLegs = {
		P = 40,
		Strength = 25
	},
	BellyDapples = {
		P = 40,
		Strength = 25
	},
	DarkLegs = {
		P = 40,
		Strength = 25
	},
	DarkLegs = {
		P = 40,
		Strength = 25
	},
	LegAccents = {
		P = 40,
		Strength = 25
	},
	FaceMask = {
		P = 40,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}