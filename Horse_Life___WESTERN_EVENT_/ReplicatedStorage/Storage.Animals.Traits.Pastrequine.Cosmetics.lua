-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ChinFluff = {
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	IcingMohawk = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	WaferCreamDollop = {
		P = 35,
		Strength = 20,
		Type = "Furs"
	},
	IcingMohawk = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	IcingTail = {
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	LegArmor = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	CreamLegFluff = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	CreamThighFluff = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	CreamUndersideFluff = {
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	FrontLegCream = {
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	CookieBack = {
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	SideFrosting = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	ChocolateChips = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	FrillyCream = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	ShoulderCreamRuffels = {
		DisplayName = "ShoulderCreamRuffles",
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	ThighCreamRuffels = {
		DisplayName = "ThighCreamRuffles",
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	GummyWorms = {
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	CheekWafers = {
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	FlowyCreamLegFluff = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	FlowyCreamNeckFluff = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	FlowyCreamThighFluff = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	PieCrust = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	EarTuftCream = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	CreamPuffCollar = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	FrostingSocks = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	IcingBeard = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	FreshCreamFlare = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	FreshCreamSprinkles = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	CookieFlare = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	Cookies = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	CookieSpine = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	TaiyakiCreamDollop = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	WeddingCakeCream = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	WeddingCakeFlowers = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}