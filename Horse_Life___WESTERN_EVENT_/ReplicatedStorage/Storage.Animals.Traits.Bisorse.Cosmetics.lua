-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 35
	},
	ChinBeard = {
		P = 25,
		Strength = 40
	},
	BUnderFur = {
		DisplayName = "UnderFur",
		P = 25,
		Strength = 40
	},
	BThighFluff = {
		DisplayName = "ThighFluff",
		P = 25,
		Strength = 40
	},
	BHoofFur = {
		DisplayName = "HoofFur",
		P = 25,
		Strength = 40
	},
	BackFurPatch = {
		P = 25,
		Strength = 30
	},
	HindFurPatch = {
		P = 25,
		Strength = 30
	},
	Bearded = {
		P = 25,
		Strength = 30
	},
	HeavyLargeHoofFur = {
		P = 25,
		Strength = 30
	},
	WildBeastBeard = {
		P = 25,
		Strength = 30
	},
	YakNeckFur = {
		P = 25,
		Strength = 30
	},
	YakUndercoat = {
		P = 25,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}