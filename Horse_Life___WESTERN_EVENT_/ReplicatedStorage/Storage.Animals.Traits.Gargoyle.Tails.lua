-- https://lua.expert/
local t = {
	LongDroopTail = {
		P = 25,
		Strength = 40
	},
	ChoppedTail = {
		P = 25,
		Strength = 40
	},
	SleekTail = {
		P = 25,
		Strength = 40
	},
	ImpTail = {
		P = 25,
		Strength = 40
	},
	PlatedTail = {
		P = 25,
		Strength = 40
	},
	ScutedTail = {
		P = 25,
		Strength = 40
	},
	SceneSpikedTail = {
		P = 25,
		Strength = 40
	},
	MulticolorTail = {
		P = 30,
		Strength = 30
	},
	BelovedTail = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}