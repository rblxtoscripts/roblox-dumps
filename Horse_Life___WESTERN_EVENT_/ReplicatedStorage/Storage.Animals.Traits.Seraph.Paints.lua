-- https://lua.expert/
local t = {
	Nothing = {
		P = 20,
		Strength = 20
	},
	ImpactPaint = {
		P = 15,
		Strength = 15
	},
	FacePointPaint = {
		DisplayName = "PointPaint",
		P = 25,
		Strength = 25
	},
	PointPaint = {
		DisplayName = "FacePointPaint",
		P = 20,
		Strength = 20
	},
	CorruptedLegPaint = {
		P = 15,
		Strength = 15
	},
	CorruptedFrontPaint = {
		P = 25,
		Strength = 25
	},
	DivineStripesPaint = {
		P = 20,
		Strength = 20
	},
	FeatherPaint = {
		P = 20,
		Strength = 20
	},
	OracleChevronPaint = {
		P = 20,
		Strength = 20
	},
	CorruptedTear = {
		P = 20,
		Strength = 20
	},
	DesolateFacePaint = {
		P = 15,
		Strength = 15
	},
	DesolateSocksPaint = {
		P = 15,
		Strength = 15
	},
	SunrayPaint = {
		P = 15,
		Strength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}