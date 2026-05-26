-- https://lua.expert/
local t = {
	CabbageEars = {
		P = 25,
		Strength = 25
	},
	FuzzyEars = {
		P = 35,
		Strength = 25
	},
	FeatheredEars = {
		P = 35,
		Strength = 25
	},
	JackrabbitEars = {
		P = 35,
		Strength = 25
	},
	FloppyEars = {
		P = 35,
		Strength = 25
	},
	FoldedBackEars = {
		P = 35,
		Strength = 25
	},
	SquirrelEar = {
		P = 35,
		Strength = 25
	},
	VulpineEars = {
		P = 35,
		Strength = 25
	},
	SkyreacherEars = {
		P = 35,
		Strength = 25
	},
	SkvaderEars = {
		P = 25,
		Strength = 25
	},
	MottledEars = {
		P = 25,
		Strength = 25
	},
	AngoraEars = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Ears"
end
return {
	Ears = t
}