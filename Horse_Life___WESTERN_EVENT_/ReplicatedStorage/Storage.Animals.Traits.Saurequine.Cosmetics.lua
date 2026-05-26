-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 35
	},
	AnkyBodyPlating = {
		P = 35,
		Strength = 35
	},
	AnkyBackPlating = {
		P = 25,
		Strength = 25
	},
	StegoSpine = {
		P = 25,
		Strength = 25
	},
	BellyFurTuft = {
		P = 40,
		Strength = 40
	},
	BellyFur = {
		P = 30,
		Strength = 30
	},
	BottomSpikes = {
		P = 40,
		Strength = 40
	},
	ExtendedClaws = {
		P = 40,
		Strength = 40
	},
	UtahLegWings = {
		P = 20,
		Strength = 20
	},
	BackSpines = {
		P = 40,
		Strength = 40
	},
	AnkleFurFeathering = {
		P = 25,
		Strength = 25
	},
	BrontoSpines = {
		P = 35,
		Strength = 35
	},
	ThickBodyPlating = {
		P = 35,
		Strength = 35
	},
	ThickLimbPlating = {
		P = 35,
		Strength = 35
	},
	TheriAnkleFur = {
		P = 25,
		Strength = 25
	},
	FeatherCoat = {
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}