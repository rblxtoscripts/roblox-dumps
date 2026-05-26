-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	Bubbled = {
		P = 35,
		Strength = 35
	},
	MeteorShower = {
		P = 25,
		Strength = 25
	},
	ScatteredSpecklePaint = {
		P = 35,
		Strength = 35
	},
	WarpedStars = {
		P = 35,
		Strength = 35
	},
	ThickBlotches = {
		P = 25,
		Strength = 25
	},
	ThickPaintSplatter = {
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