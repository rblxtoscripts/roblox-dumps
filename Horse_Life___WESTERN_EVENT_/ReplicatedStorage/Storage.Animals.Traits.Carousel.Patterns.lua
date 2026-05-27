-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	AppaloosaRoan = {
		P = 25,
		Strength = 25
	},
	LeopardSpreadPattern = {
		P = 35,
		Strength = 35
	},
	SnowcapWrapping = {
		P = 35,
		Strength = 35
	},
	LargeCracks = {
		P = 30,
		Strength = 30
	},
	LargeTobianoPattern = {
		P = 30,
		Strength = 30
	},
	NightSky = {
		P = 35,
		Strength = 35
	},
	CircusRings = {
		P = 25,
		Strength = 25
	},
	Checkers = {
		P = 20,
		Strength = 20
	},
	Checkers = {
		P = 20,
		Strength = 20
	},
	DeckOfCards = {
		P = 30,
		Strength = 30
	},
	Spotlight = {
		P = 25,
		Strength = 25
	},
	JesterPattern = {
		P = 25,
		Strength = 25
	},
	HindStarWisp = {
		P = 25,
		Strength = 25
	},
	TornLegChips = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}