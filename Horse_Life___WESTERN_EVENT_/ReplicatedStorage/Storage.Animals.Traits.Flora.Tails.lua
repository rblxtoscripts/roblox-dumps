-- https://lua.expert/
local t = {
	ThickVineTail = {
		P = 25,
		Strength = 35
	},
	DroopPetalTail = {
		P = 25,
		Strength = 30
	},
	BlossomingTail = {
		P = 25,
		Strength = 40
	},
	WildflowerTail = {
		P = 25,
		Strength = 20
	},
	FeatheredPetalTail = {
		P = 30,
		Strength = 30
	},
	SpottedMonsteraTail = {
		P = 20,
		Strength = 20
	},
	RoseLadyTail = {
		P = 20,
		Strength = 20
	},
	FloralbutterflyTail = {
		DisplayName = "FloralButterflyTail",
		P = 20,
		Strength = 20
	},
	CherryBlossomTail = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 20
	},
	ThornedRoseTail = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}