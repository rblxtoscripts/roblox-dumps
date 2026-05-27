-- https://lua.expert/
local t = {
	ATElegantBraidedTail = {
		DisplayName = "ElegantBraidedTail",
		P = 20,
		Strength = 30
	},
	ATFlowingTail = {
		DisplayName = "FlowingTail",
		P = 20,
		Strength = 30
	},
	ATStandardTail = {
		DisplayName = "StandardTail",
		P = 25,
		Strength = 40
	},
	BraidedTail = {
		P = 20,
		Strength = 30
	},
	LongBluntTail = {
		P = 15,
		Strength = 20
	},
	LongWavyTail = {
		P = 25,
		Strength = 40
	},
	NeatlyChoppedTail = {
		P = 20,
		Strength = 30
	},
	PinwheelBraidTail = {
		P = 25,
		Strength = 40
	},
	SerenadeTail = {
		P = 15,
		Strength = 20
	},
	WinterTail = {
		P = 15,
		Strength = 20
	},
	ATSparseTail = {
		DisplayName = "SparseTail",
		P = 20,
		Strength = 30
	},
	AElvenTail = {
		DisplayName = "BraidedFullTail",
		P = 20,
		Strength = 30
	},
	SleekBraidedTail = {
		P = 20,
		Strength = 30
	},
	ATUpturnedTail = {
		DisplayName = "UpturnedTail",
		P = 20,
		Strength = 30
	},
	HeartCurlsTail = {
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