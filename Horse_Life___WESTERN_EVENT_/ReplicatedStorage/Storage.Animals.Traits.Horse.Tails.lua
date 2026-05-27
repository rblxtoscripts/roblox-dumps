-- https://lua.expert/
local t = {
	FlowingTail = {
		P = 10,
		Strength = 25
	},
	LongChopTail = {
		P = 10,
		Strength = 25
	},
	SleekStraightTail = {
		P = 10,
		Strength = 25
	},
	ShortChopTail = {
		P = 10,
		Strength = 25
	},
	MediumTail = {
		P = 10,
		Strength = 25
	},
	WavyLongTail = {
		P = 10,
		Strength = 25
	},
	WavyShortTail = {
		P = 10,
		Strength = 25
	},
	HShaggyTail = {
		DisplayName = "ShaggyTail",
		P = 10,
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