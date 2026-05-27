-- https://lua.expert/
local t = {
	BuzzardCollar = {
		P = 30,
		Strength = 30
	},
	NightshadeMane = {
		P = 30,
		Strength = 30
	},
	GhoulishHair = {
		P = 40,
		Strength = 40
	},
	GhoulishMane = {
		P = 40,
		Strength = 40
	},
	RaggedyMane = {
		P = 25,
		Strength = 25
	},
	BeardedFace = {
		P = 30,
		Strength = 30
	},
	FlamedMane = {
		P = 20,
		Strength = 20
	},
	DecayingMane = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}