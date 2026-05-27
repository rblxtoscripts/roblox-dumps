-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	FaceFreckles = {
		P = 40,
		Strength = 40
	},
	FrontLacing = {
		P = 35,
		Strength = 35
	},
	FeatherMarkings = {
		P = 35,
		Strength = 35
	},
	Feathered = {
		P = 35,
		Strength = 35
	},
	Spew = {
		P = 35,
		Strength = 35
	},
	Stars = {
		P = 35,
		Strength = 35
	},
	Flowers = {
		P = 35,
		Strength = 35
	},
	SplottedSpots = {
		P = 30,
		Strength = 30
	},
	Brier = {
		P = 25,
		Strength = 25
	},
	CloudPattern = {
		P = 25,
		Strength = 25
	},
	PlumedCover = {
		P = 25,
		Strength = 25
	},
	WhiteTailSpots = {
		P = 25,
		Strength = 25
	},
	ScatteredChimera = {
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