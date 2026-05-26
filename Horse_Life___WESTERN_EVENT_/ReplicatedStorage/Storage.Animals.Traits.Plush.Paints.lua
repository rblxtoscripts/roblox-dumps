-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 35
	},
	MaskPaint = {
		P = 40,
		Strength = 40
	},
	PHindSplash = {
		DisplayName = "HindSplash",
		P = 35,
		Strength = 35
	},
	StarRivets = {
		P = 35,
		Strength = 35
	},
	SewingPins = {
		P = 30,
		Strength = 30
	},
	Earrings = {
		P = 30,
		Strength = 30
	},
	ButtonEyes = {
		P = 30,
		Strength = 30
	},
	LunarSplash = {
		P = 25,
		Strength = 25
	},
	SpikedCollar = {
		P = 25,
		Strength = 30
	},
	SpikedAnklets = {
		P = 25,
		Strength = 30
	},
	WingPaint = {
		P = 25,
		Strength = 30
	},
	LimbButtons = {
		P = 25,
		Strength = 25
	},
	DazedPaint = {
		P = 25,
		Strength = 25
	},
	ReindeerPaint = {
		P = 10,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}