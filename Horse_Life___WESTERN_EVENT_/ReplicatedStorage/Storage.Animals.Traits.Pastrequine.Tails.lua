-- https://lua.expert/
local t = {
	SwirledTail = {
		P = 40,
		Strength = 35
	},
	FrostingTail = {
		P = 40,
		Strength = 35
	},
	DippedTail = {
		P = 30,
		Strength = 25
	},
	GummyWormTail = {
		P = 30,
		Strength = 25
	},
	WildCherryTail = {
		P = 25,
		Strength = 25
	},
	MilkTeaTail = {
		P = 25,
		Strength = 25
	},
	CinnaSwirlTail = {
		P = 25,
		Strength = 20
	},
	WeddingCakeTail = {
		P = 30,
		Strength = 25
	},
	TaiyakiTail = {
		P = 25,
		Strength = 25
	},
	CrumbleTail = {
		P = 25,
		Strength = 25
	},
	FreshCreamTail = {
		P = 25,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}