-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35
	},
	NeckStripePaint = {
		P = 25,
		Strength = 35
	},
	BellyStreaksPaint = {
		P = 25,
		Strength = 35
	},
	UnderbellyPaint = {
		P = 25,
		Strength = 35
	},
	FacePaint = {
		P = 25,
		Strength = 35
	},
	Collie = {
		P = 25,
		Strength = 35
	},
	Snowcap = {
		P = 25,
		Strength = 35
	},
	CascadingDapple = {
		P = 25,
		Strength = 35
	},
	DawnSpots = {
		P = 25,
		Strength = 35
	},
	SweepPaint = {
		P = 25,
		Strength = 35
	},
	ReverseZebra = {
		P = 25,
		Strength = 35
	},
	StripeSocks = {
		P = 25,
		Strength = 35
	},
	ScarceChimeraPaint = {
		P = 25,
		Strength = 35
	},
	InvertedPrimal = {
		P = 25,
		Strength = 25
	},
	BongoPaint = {
		P = 25,
		Strength = 35
	},
	BongoPaintAnkles = {
		P = 25,
		Strength = 35
	},
	BongoPaintAnkles = {
		P = 25,
		Strength = 35
	},
	SpottedPoint = {
		P = 25,
		Strength = 35
	},
	Streamline = {
		P = 25,
		Strength = 35
	},
	BanditScratch = {
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