-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 40
	},
	RaggedLegs = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Equus",
		CrossbreedStrength = 10
	},
	FullBodyStripe = {
		P = 25,
		Strength = 35
	},
	CFrontPatch = {
		DisplayName = "FrontPatch",
		P = 25,
		Strength = 40
	},
	CDeerSpots = {
		P = 25,
		DisplayName = "DeerSpots",
		Strength = 40
	},
	HeadFreckles = {
		P = 25,
		Strength = 40
	},
	CNoseFreckles = {
		DisplayName = "NoseFreckles",
		P = 25,
		Strength = 40
	},
	BodySplotches = {
		P = 25,
		Strength = 40
	},
	LimbSplotches = {
		P = 25,
		Strength = 40
	},
	FrontFreckling = {
		P = 25,
		Strength = 40
	},
	HindFreckling = {
		P = 25,
		Strength = 40
	},
	AnkleFreckling = {
		P = 25,
		Strength = 40
	},
	TatteredStripes = {
		P = 25,
		Strength = 25
	},
	Streamlined = {
		P = 25,
		Strength = 30
	},
	WhispPattern = {
		P = 25,
		Strength = 30
	},
	WoodSwirls = {
		P = 25,
		Strength = 30
	},
	JaggedShoulderPattern = {
		P = 25,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}