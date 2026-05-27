-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	FanFiligreePattern = {
		P = 40,
		Strength = 40
	},
	FloralFiligreePattern = {
		P = 40,
		Strength = 40
	},
	DashedPattern = {
		P = 50,
		Strength = 50
	},
	FestivePattern = {
		P = 40,
		Strength = 40
	},
	HollyFiligreePattern = {
		P = 30,
		Strength = 30
	},
	FloralBandingPattern = {
		P = 30,
		Strength = 30
	},
	DottedAccentsPattern = {
		P = 50,
		Strength = 50
	},
	FacePorcelainPattern = {
		P = 50,
		Strength = 50
	},
	FestiveAccentsPattern = {
		P = 40,
		Strength = 40
	},
	FloralAccentsPattern = {
		P = 30,
		Strength = 30
	},
	PorcelainPattern = {
		P = 30,
		Strength = 30
	},
	AuroraPattern = {
		P = 30,
		Strength = 30
	},
	SwirlPattern = {
		P = 40,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}