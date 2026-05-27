-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	HeadMoss = {
		P = 50,
		Strength = 40
	},
	BackMoss = {
		P = 50,
		Strength = 30
	},
	TopBodyMoss = {
		P = 50,
		Strength = 40
	},
	LegMoss = {
		P = 50,
		Strength = 40
	},
	BellyMoss = {
		P = 50,
		Strength = 35
	},
	HoofVines = {
		P = 35,
		Strength = 40
	},
	FaceVines = {
		P = 40,
		Strength = 40
	},
	LegVines = {
		P = 30,
		Strength = 35
	},
	BodyVines = {
		P = 25,
		Strength = 35
	},
	BodyLeaves = {
		P = 20,
		Strength = 25
	},
	LimbMoss = {
		P = 30,
		Strength = 35
	},
	FullBodyMoss = {
		P = 25,
		Strength = 30
	},
	FaceMoss = {
		P = 35,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}