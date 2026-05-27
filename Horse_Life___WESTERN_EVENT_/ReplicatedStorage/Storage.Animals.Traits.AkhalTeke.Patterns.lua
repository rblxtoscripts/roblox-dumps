-- https://lua.expert/
local t = {
	Nothing = {
		P = 20,
		Strength = 15
	},
	HeavyRabicanoPattern = {
		DisplayName = "HeavyRabicano",
		P = 25,
		Strength = 20
	},
	LightDapple = {
		P = 40,
		Strength = 25
	},
	LightFacePaint = {
		P = 30,
		Strength = 25
	},
	LightRibbicano = {
		DisplayName = "LightRabicano",
		P = 40,
		Strength = 25
	},
	SootyDappleBodyMarking = {
		P = 30,
		Strength = 25
	},
	UnderbellyDapple = {
		P = 40,
		Strength = 25
	},
	LeopardAppaloosa = {
		P = 20,
		Strength = 15
	},
	ThickSpotting = {
		P = 30,
		Strength = 25
	},
	BackBubbledSpotting = {
		P = 30,
		Strength = 25
	},
	FrontBubbledSpotting = {
		P = 40,
		Strength = 25
	},
	BackGreyDappling = {
		P = 30,
		Strength = 25
	},
	FrontGreyDappling = {
		P = 40,
		Strength = 25
	},
	MiddleGreyDappling = {
		P = 20,
		Strength = 15
	},
	FrontBlanketAppaloosa = {
		P = 30,
		Strength = 25
	},
	BackBlanketAppaloosa = {
		P = 40,
		Strength = 25
	},
	BackDappleSnowcap = {
		P = 30,
		Strength = 25
	},
	FrontDappleSnowcap = {
		P = 40,
		Strength = 25
	},
	MiddleDappleSnowcap = {
		P = 40,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}