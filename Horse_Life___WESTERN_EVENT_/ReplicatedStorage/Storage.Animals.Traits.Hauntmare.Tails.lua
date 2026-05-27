-- https://lua.expert/
local t = {
	DraconicTail = {
		P = 30,
		Strength = 30
	},
	GhostlyTail = {
		P = 35,
		Strength = 35
	},
	EquineTail = {
		P = 40,
		Strength = 40
	},
	Macetail = {
		P = 40,
		Strength = 40
	},
	PhoenixTail = {
		P = 25,
		Strength = 35
	},
	FlameTail = {
		P = 25,
		Strength = 35
	},
	HMEldritchTail = {
		DisplayName = "EldritchTail",
		P = 40,
		Strength = 40
	},
	CurledBoneTail = {
		P = 30,
		Strength = 30
	},
	DecayingTail = {
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