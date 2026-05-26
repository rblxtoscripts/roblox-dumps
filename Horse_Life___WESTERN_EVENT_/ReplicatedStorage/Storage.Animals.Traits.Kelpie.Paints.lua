-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	SeaUrchinFront = {
		P = 25,
		Strength = 25
	},
	FacialOysters = {
		P = 25,
		Strength = 25
	},
	SeaUrchinAnkles = {
		P = 25,
		Strength = 25
	},
	BodilyOysters = {
		P = 25,
		Strength = 25
	},
	OysterLimbCluster = {
		P = 25,
		Strength = 25
	},
	OysterAnkles = {
		P = 25,
		Strength = 25
	},
	SeaUrchinRear = {
		P = 25,
		Strength = 25
	},
	SeaUrchinFace = {
		P = 25,
		Strength = 25
	},
	BodyBarnacles = {
		P = 25,
		Strength = 25
	},
	FaceBarnacles = {
		P = 25,
		Strength = 25
	},
	JaggedPaint = {
		P = 25,
		Strength = 25
	},
	KoiPaint = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}