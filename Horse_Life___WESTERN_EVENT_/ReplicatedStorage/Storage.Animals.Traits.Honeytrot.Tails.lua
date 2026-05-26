-- https://lua.expert/
local t = {
	FluffyHoneybeeTail = {
		P = 25,
		Strength = 25
	},
	HOSleekTail = {
		DisplayName = "SleekTail",
		P = 30,
		Strength = 30
	},
	BombusTail = {
		P = 35,
		Strength = 35
	},
	ScutedStingerTail = {
		P = 25,
		Strength = 25
	},
	PollenTail = {
		P = 30,
		Strength = 30
	},
	SpringTail = {
		P = 30,
		Strength = 30
	},
	HOBlossomingTail = {
		DisplayName = "BlossomingTail",
		P = 30,
		Strength = 30
	},
	RoyalJellyTail = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}