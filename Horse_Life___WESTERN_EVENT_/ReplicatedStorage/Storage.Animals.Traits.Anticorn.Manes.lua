-- https://lua.expert/
local t = {
	GreyedMane = {
		P = 25,
		Strength = 25
	},
	RapturedMane = {
		P = 10,
		Strength = 10
	},
	AWildMane = {
		DisplayName = "WildMane",
		P = 20,
		Strength = 20
	},
	FlameMane = {
		P = 15,
		Strength = 15
	},
	ImperialMane = {
		P = 25,
		Strength = 25
	},
	EchoflareMane = {
		P = 25,
		Strength = 25
	},
	AFeralMane = {
		DisplayName = "FeralMane",
		P = 15,
		Strength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}