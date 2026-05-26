-- https://lua.expert/
local t = {
	SpectralHair = {
		P = 35,
		Strength = 35
	},
	GreasyMane = {
		P = 40,
		Strength = 40
	},
	ChoppedMohawk = {
		P = 30,
		Strength = 30
	},
	TatteredMane = {
		P = 25,
		Strength = 25
	},
	GShortMane = {
		DisplayName = "ShortMane",
		P = 40,
		Strength = 40
	},
	GWeepingMane = {
		DisplayName = "WeepingMane",
		P = 20,
		Strength = 20
	},
	FeralMane = {
		P = 20,
		Strength = 20
	},
	SpinneretMane = {
		P = 15,
		Strength = 15
	},
	CloakedMane = {
		P = 30,
		Strength = 30
	},
	LupineMane = {
		P = 15,
		Strength = 15
	},
	ZombieMane = {
		P = 30,
		Strength = 30
	},
	PoltergeistMane = {
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