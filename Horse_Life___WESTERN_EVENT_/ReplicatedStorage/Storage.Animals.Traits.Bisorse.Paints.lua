-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35
	},
	BBellyPaint = {
		DisplayName = "BellyPaint",
		P = 25,
		Strength = 35
	},
	BeltedPaint = {
		P = 25,
		Strength = 35
	},
	StreakPaint = {
		P = 25,
		Strength = 35
	},
	CattlePaint = {
		P = 25,
		Strength = 35
	},
	MoilSideSpotting = {
		P = 25,
		Strength = 35
	},
	CattleSpots = {
		P = 25,
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