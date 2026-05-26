-- https://lua.expert/
local t = {
	HunterTail = {
		P = 35,
		Strength = 35
	},
	LeopardTail = {
		P = 30,
		Strength = 30
	},
	SaberToothCatTail = {
		P = 30,
		Strength = 30
	},
	LionTail = {
		P = 40,
		Strength = 40
	},
	CalicoTail = {
		P = 25,
		Strength = 25
	},
	TripleTail = {
		P = 15,
		Strength = 15
	},
	ChaoticTail = {
		P = 25,
		Strength = 25
	},
	FluffyStripedTail = {
		P = 25,
		Strength = 25
	},
	TangledTail = {
		P = 25,
		Strength = 25
	},
	LynxTail = {
		P = 25,
		Strength = 25
	},
	WildTail = {
		P = 25,
		Strength = 25
	},
	FabelTail = {
		DisplayName = "FableTail",
		P = 25,
		Strength = 25
	},
	FFadedTail = {
		DisplayName = "FadedTail",
		P = 20,
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