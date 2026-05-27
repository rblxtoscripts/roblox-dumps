-- https://lua.expert/
local t = {
	Nothing = {
		P = 0,
		Strength = 25
	},
	ThighPaint = {
		P = 25,
		Strength = 35
	},
	ShoulderPaintMarks = {
		P = 25,
		Strength = 35
	},
	StreakingPaint = {
		P = 25,
		Strength = 35
	},
	FullMaskPaint = {
		P = 25,
		Strength = 35
	},
	HeavyUnderbellyPaint = {
		P = 25,
		Strength = 35
	},
	RearSnowcap = {
		P = 25,
		Strength = 35
	},
	Overo = {
		P = 25,
		Strength = 35
	},
	Banded = {
		P = 25,
		Strength = 35
	},
	Tobiano = {
		P = 25,
		Strength = 35
	},
	FramedPaint = {
		P = 25,
		Strength = 35
	},
	SnipPaint = {
		P = 25,
		Strength = 40
	},
	BrokenStripePaint = {
		P = 25,
		Strength = 40
	},
	IrregularBlaze = {
		P = 25,
		Strength = 40
	},
	FramedFacePaint = {
		P = 25,
		Strength = 40
	},
	FrontBodyPaint = {
		P = 25,
		Strength = 35
	},
	BackLegPaint = {
		P = 25,
		Strength = 35
	},
	BadgerSplash = {
		P = 25,
		Strength = 35
	},
	ChimeraPaint = {
		P = 10,
		Strength = 25
	},
	NeckStrip = {
		P = 25,
		Strength = 35
	},
	Heart = {
		P = 25,
		Strength = 35
	},
	BellyPaint = {
		P = 25,
		Strength = 35
	},
	SprinkledPaint = {
		P = 25,
		Strength = 35
	},
	EyeStripes = {
		P = 25,
		Strength = 40
	},
	AsymmetricalFrontSock = {
		P = 25,
		Strength = 40
	},
	AsymmetricalBackSock = {
		P = 25,
		Strength = 40
	},
	UpperBodyPaint = {
		P = 25,
		Strength = 35
	},
	HeadStripe = {
		P = 25,
		Strength = 40
	},
	SmallHindPaint = {
		P = 25,
		Strength = 35
	},
	SabinoPaint = {
		P = 25,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}