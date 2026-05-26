-- https://lua.expert/
local t = {
	Nothing = {
		P = 15,
		Strength = 15
	},
	DelicatePole = {
		P = 35,
		Strength = 35
	},
	SimplePole = {
		P = 40,
		Strength = 40
	},
	BejeweledSword = {
		P = 25,
		Strength = 25
	},
	KeyPole = {
		P = 25,
		Strength = 25
	},
	WesternShowPole = {
		P = 30,
		Strength = 30
	},
	BejeweledPole = {
		P = 25,
		Strength = 25
	},
	WindUpKey = {
		P = 35,
		Strength = 35
	},
	CrescentPole = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}