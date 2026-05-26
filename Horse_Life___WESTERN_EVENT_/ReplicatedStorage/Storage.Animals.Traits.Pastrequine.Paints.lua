-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 35
	},
	EarBlueberries = {
		P = 40,
		Strength = 35
	},
	JammyCheek = {
		P = 30,
		Strength = 25
	},
	JammyHind = {
		P = 30,
		Strength = 25
	},
	CherryNose = {
		P = 35,
		Strength = 35
	},
	JammyBelly = {
		P = 25,
		Strength = 20
	},
	Strawberries = {
		P = 25,
		Strength = 20
	},
	Blueberries = {
		P = 25,
		Strength = 20
	},
	CitrusSides = {
		P = 30,
		Strength = 30
	},
	BananaSlices = {
		P = 25,
		Strength = 25
	},
	JammyVeil = {
		P = 30,
		Strength = 30
	},
	CitrusNose = {
		P = 35,
		Strength = 35
	},
	CrumblePaint = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}