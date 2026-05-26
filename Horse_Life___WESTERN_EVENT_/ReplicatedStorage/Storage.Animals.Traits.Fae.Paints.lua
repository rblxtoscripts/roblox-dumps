-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 35
	},
	MaskedDroopMoss = {
		P = 40,
		Strength = 40
	},
	LowerCheekMoss = {
		P = 40,
		Strength = 40
	},
	HindDroopMoss = {
		P = 35,
		Strength = 35
	},
	LowerBodyMoss = {
		P = 25,
		Strength = 20
	},
	DandelionShawl = {
		P = 25,
		Strength = 20
	},
	PlantyGrowths = {
		P = 25,
		Strength = 20
	},
	HindClovers = {
		P = 25,
		Strength = 30
	},
	HindLeaves = {
		P = 25,
		Strength = 25
	},
	NeckLeaves = {
		P = 25,
		Strength = 25
	},
	Wildfire = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Kirin",
		CrossbreedStrength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}