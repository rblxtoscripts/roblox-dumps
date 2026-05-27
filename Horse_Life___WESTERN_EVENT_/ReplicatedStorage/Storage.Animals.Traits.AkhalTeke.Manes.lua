-- https://lua.expert/
local t = {
	ATElegantBraidedMane = {
		DisplayName = "ElegantBraidedMane",
		P = 15,
		Strength = 20
	},
	ATFlowingMane = {
		DisplayName = "FlowingMane",
		P = 20,
		Strength = 30
	},
	ATLongMane = {
		DisplayName = "LongMane",
		P = 20,
		Strength = 30
	},
	ATRoachedMane = {
		DisplayName = "RoachedMane",
		P = 25,
		Strength = 40
	},
	ATStandardMane = {
		DisplayName = "StandardMane",
		P = 25,
		Strength = 40
	},
	BraidedMane = {
		P = 20,
		Strength = 30
	},
	ButtonBraidsMane = {
		P = 25,
		Strength = 40
	},
	NeatlyChoppedMane = {
		P = 20,
		Strength = 30
	},
	SerenadeMane = {
		P = 15,
		Strength = 20
	},
	WinterMane = {
		P = 15,
		Strength = 20
	},
	UltraRoachedMane = {
		P = 25,
		Strength = 40
	},
	ElvenMane = {
		P = 25,
		Strength = 40
	},
	SleekBraidedMane = {
		P = 25,
		Strength = 40
	},
	ATSparseMane = {
		DisplayName = "SparseMane",
		P = 25,
		Strength = 40
	},
	HeartCurlsMane = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}