-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 25
	},
	AnkleFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	HeavyHoofFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	WavyHoofFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	Eyelashes = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	ThighFloof = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	FluffyEars = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	FluffyLegs = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ShortBellyFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LayeredHoofFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ShortAnkleFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	WideAnkleFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	WhispyAnkleFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ShortBeard = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	FullBeard = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	FeatheredFurAnkles = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	NeckFur = {
		P = 25,
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