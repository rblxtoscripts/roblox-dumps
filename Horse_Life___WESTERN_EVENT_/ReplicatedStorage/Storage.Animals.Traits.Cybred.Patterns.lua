-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	VentsPattern = {
		P = 40,
		Strength = 40
	},
	Outlines = {
		P = 35,
		Strength = 35
	},
	NeowavePattern = {
		P = 30,
		Strength = 30
	},
	RustPattern = {
		P = 30,
		Strength = 30
	},
	Digistream = {
		P = 30,
		Strength = 30
	},
	RadioactivePattern = {
		P = 25,
		Strength = 25
	},
	CyberStripes = {
		P = 25,
		Strength = 25
	},
	PaintSplotchesPattern = {
		P = 20,
		Strength = 20
	},
	FutureVisionPattern = {
		P = 20,
		Strength = 20
	},
	SigilismPattern = {
		P = 20,
		Strength = 20
	},
	ScorpioPattern = {
		P = 15,
		Strength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}