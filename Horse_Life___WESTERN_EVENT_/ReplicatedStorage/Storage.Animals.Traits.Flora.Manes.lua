-- https://lua.expert/
local t = {
	PetalMane = {
		P = 25,
		Strength = 40
	},
	DroopPetalMane = {
		P = 25,
		Strength = 40
	},
	BlossomingMane = {
		P = 25,
		Strength = 30
	},
	WildflowerMane = {
		P = 25,
		Strength = 20
	},
	FeatheredPetalMane = {
		P = 25,
		Strength = 20
	},
	SpottedMonsteraMane = {
		P = 20,
		Strength = 20
	},
	FloralButterflyMane = {
		P = 20,
		Strength = 20
	},
	RoseLadyMane = {
		P = 20,
		Strength = 20
	},
	CherryBlossomMane = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 20
	},
	ThornedRoseMane = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}