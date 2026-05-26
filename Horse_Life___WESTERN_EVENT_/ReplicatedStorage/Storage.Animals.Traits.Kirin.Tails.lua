-- https://lua.expert/
local t = {
	SharpScaledTail = {
		P = 25,
		Strength = 25
	},
	RibbonTail = {
		P = 20,
		Strength = 20
	},
	RoundScaledTail = {
		P = 30,
		Strength = 30
	},
	TuffedTail = {
		P = 40,
		Strength = 40
	},
	KitsuneTail = {
		P = 30,
		Strength = 30
	},
	EmperorTail = {
		P = 30,
		Strength = 30
	},
	EasternDragonTail = {
		P = 30,
		Strength = 30
	},
	ZephyrTail = {
		P = 30,
		Strength = 30
	},
	HeartScaledTail = {
		EventName = "Valentines2026",
		P = 0,
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