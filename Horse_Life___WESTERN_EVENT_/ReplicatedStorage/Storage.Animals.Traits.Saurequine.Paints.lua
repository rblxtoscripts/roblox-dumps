-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	LowerLegPaint = {
		P = 30,
		Strength = 30
	},
	HalfbodyPiebaldPaint = {
		P = 25,
		Strength = 25
	},
	FleckPaint = {
		P = 40,
		Strength = 40
	},
	TribalMask = {
		P = 35,
		Strength = 35
	},
	Tracking = {
		P = 35,
		Strength = 35
	},
	SOvero = {
		DisplayName = "Overo",
		P = 35,
		Strength = 35
	},
	KyptoPaint = {
		P = 35,
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