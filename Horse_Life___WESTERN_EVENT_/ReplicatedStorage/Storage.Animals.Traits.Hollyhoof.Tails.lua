-- https://lua.expert/
local t = {
	HollyTail = {
		P = 25,
		Strength = 25
	},
	HRibbonTail = {
		DisplayName = "RibbonTail",
		P = 15,
		Strength = 15
	},
	PaintedTail = {
		P = 25,
		Strength = 25
	},
	ToyTail = {
		P = 25,
		Strength = 25
	},
	CandycaneTail = {
		P = 20,
		Strength = 20
	},
	HeavyBellTail = {
		P = 20,
		Strength = 20
	},
	SnowfallTail = {
		P = 15,
		Strength = 15
	},
	BulbTail = {
		P = 15,
		Strength = 15
	},
	KrampusTail = {
		P = 15,
		Strength = 15
	},
	SnowingTail = {
		P = 20,
		Strength = 20
	},
	BorealisTail = {
		P = 20,
		Strength = 20
	},
	FluffyTail = {
		P = 15,
		Strength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}