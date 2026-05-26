-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	GilaBanding = {
		P = 40,
		Strength = 40
	},
	LoopingRings = {
		P = 25,
		Strength = 25
	},
	SideScaling = {
		P = 30,
		Strength = 30
	},
	ScatteredFlecksPaint = {
		P = 30,
		Strength = 30
	},
	ThistlePaint = {
		P = 30,
		Strength = 30
	},
	ScalingPaint = {
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