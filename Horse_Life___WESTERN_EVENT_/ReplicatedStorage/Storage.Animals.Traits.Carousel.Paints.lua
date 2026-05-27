-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35
	},
	DapplePaint = {
		P = 40,
		Strength = 40
	},
	HeavyCarouselPaint = {
		P = 25,
		Strength = 25
	},
	LowerCasingPaint = {
		P = 35,
		Strength = 35
	},
	FoldedWingsPaint = {
		P = 25,
		Strength = 25
	},
	ClownFacePaint = {
		P = 30,
		Strength = 30
	},
	Polkadots = {
		P = 20,
		Strength = 20
	},
	ChippedPaint = {
		P = 30,
		Strength = 30
	},
	LargePaintSplashes = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}