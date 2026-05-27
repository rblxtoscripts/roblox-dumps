-- https://lua.expert/
local t = {
	SwirledMane = {
		P = 35,
		Strength = 35
	},
	FrostingMane = {
		P = 35,
		Strength = 35
	},
	DippedMane = {
		P = 25,
		Strength = 25
	},
	GummyWormMane = {
		P = 25,
		Strength = 25
	},
	WildCherryMane = {
		P = 25,
		Strength = 25
	},
	MilkTeaMane = {
		P = 25,
		Strength = 25
	},
	CinnaSwirlMane = {
		P = 20,
		Strength = 20
	},
	FreshCreamMane = {
		P = 25,
		Strength = 25
	},
	CrumbleMane = {
		P = 25,
		Strength = 25
	},
	WeddingCakeMane = {
		P = 25,
		Strength = 25
	},
	TaiyakiMane = {
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