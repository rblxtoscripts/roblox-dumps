-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 25
	},
	MacaronFilling = {
		P = 40,
		Strength = 40
	},
	Drizzle = {
		P = 40,
		Strength = 40
	},
	Sprinkling = {
		P = 30,
		Strength = 30
	},
	StrawberrySeeds = {
		P = 30,
		Strength = 30
	},
	PowderedSugar = {
		P = 30,
		Strength = 30
	},
	ChocolateSyrupPattern = {
		P = 30,
		Strength = 30
	},
	CookiesAndCreamPattern = {
		P = 30,
		Strength = 30
	},
	LatteStripes = {
		P = 20,
		Strength = 20
	},
	FondantSnowcap = {
		P = 30,
		Strength = 30
	},
	StrawberryPattern = {
		P = 25,
		Strength = 25
	},
	Melted = {
		P = 25,
		Strength = 25
	},
	SprinklesPattern = {
		P = 25,
		Strength = 25
	},
	CookieStripePattern = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}