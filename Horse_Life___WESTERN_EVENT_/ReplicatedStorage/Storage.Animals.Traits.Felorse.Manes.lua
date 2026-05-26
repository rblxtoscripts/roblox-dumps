-- https://lua.expert/
local t = {
	HunterMane = {
		P = 20,
		Strength = 20
	},
	CalicoMane = {
		P = 30,
		Strength = 30
	},
	FLionMane = {
		DisplayName = "LionMane",
		P = 35,
		Strength = 35
	},
	SlickMane = {
		P = 35,
		Strength = 35
	},
	ChaoticMane = {
		P = 20,
		Strength = 20
	},
	HalfColoredFelineMane = {
		P = 30,
		Strength = 30
	},
	TangledHair = {
		P = 30,
		Strength = 30
	},
	WildMane = {
		P = 30,
		Strength = 30
	},
	FabelMane = {
		DisplayName = "FableMane",
		P = 30,
		Strength = 30
	},
	FFadedMane = {
		DisplayName = "FadedMane",
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}