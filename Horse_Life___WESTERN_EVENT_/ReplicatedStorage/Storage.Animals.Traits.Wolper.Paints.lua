-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	CheekSpot = {
		P = 35,
		Strength = 35
	},
	MuddyPawsPaint = {
		P = 35,
		Strength = 35
	},
	SpringtideEtchings = {
		P = 35,
		Strength = 35
	},
	SideSpotsPaint = {
		P = 35,
		Strength = 35
	},
	SeedyPaint = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}