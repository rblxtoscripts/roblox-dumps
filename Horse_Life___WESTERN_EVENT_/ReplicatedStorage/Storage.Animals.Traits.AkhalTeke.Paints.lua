-- https://lua.expert/
local t = {
	Nothing = {
		P = 20,
		Strength = 20
	},
	ATSabinoPaint = {
		DisplayName = "SabinoPaint",
		P = 40,
		Strength = 35
	},
	BaldFace = {
		P = 40,
		Strength = 35
	},
	BlazePaint = {
		P = 40,
		Strength = 35
	},
	FullbodyShine = {
		P = 30,
		Strength = 25
	},
	HeartGloss = {
		P = 30,
		Strength = 25
	},
	LargeShine = {
		P = 40,
		Strength = 35
	},
	LowerPaint = {
		P = 40,
		Strength = 35
	},
	ShinyStripes = {
		P = 40,
		Strength = 35
	},
	ShortSocks = {
		P = 40,
		Strength = 35
	},
	SnowyAppaloosa = {
		P = 20,
		Strength = 15
	},
	TallSocks = {
		P = 30,
		Strength = 25
	},
	BackBodyPinto = {
		P = 40,
		Strength = 35
	},
	FrontBodyPinto = {
		P = 20,
		Strength = 15
	},
	MiddleBodyPinto = {
		P = 30,
		Strength = 25
	},
	RibbonMask = {
		P = 30,
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