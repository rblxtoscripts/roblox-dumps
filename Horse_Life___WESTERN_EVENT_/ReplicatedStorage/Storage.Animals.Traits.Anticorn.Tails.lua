-- https://lua.expert/
local t = {
	GreyedTail = {
		P = 25,
		Strength = 25
	},
	RapturedTail = {
		P = 10,
		Strength = 10
	},
	AWildTail = {
		DisplayName = "WildTail",
		P = 20,
		Strength = 20
	},
	AFlameTail = {
		DisplayName = "FlameTail",
		P = 15,
		Strength = 15
	},
	ImperialTail = {
		P = 25,
		Strength = 25
	},
	EchoflareTail = {
		P = 25,
		Strength = 25
	},
	AFeralTail = {
		DisplayName = "FeralTail",
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