-- https://lua.expert/
local t = {
	Nothing = {
		P = 15,
		Strength = 15
	},
	FAnkleTufts = {
		DisplayName = "AnkleTufts",
		P = 15,
		Strength = 15
	},
	ChestTufts = {
		P = 15,
		Strength = 15
	},
	ExtendedHoofFur = {
		P = 15,
		Strength = 15
	},
	LeafedAnkleFur = {
		P = 10,
		Strength = 10
	},
	LongAnkleTufts = {
		P = 10,
		Strength = 10
	},
	NeckTufts = {
		P = 10,
		Strength = 10
	},
	ThighTufts = {
		P = 10,
		Strength = 10
	},
	FunRoseAnkles = {
		P = 10,
		Strength = 10
	},
	LargeCurlySockHair = {
		P = 10,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}