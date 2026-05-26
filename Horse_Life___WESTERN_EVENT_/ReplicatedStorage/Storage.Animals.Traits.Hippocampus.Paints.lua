-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	MermaidPaint = {
		P = 40,
		Strength = 40
	},
	HLionfishStripes = {
		DisplayName = "LionfishStripes",
		P = 20,
		Strength = 20
	},
	Seabloom = {
		P = 35,
		Strength = 35
	},
	Dotrice = {
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