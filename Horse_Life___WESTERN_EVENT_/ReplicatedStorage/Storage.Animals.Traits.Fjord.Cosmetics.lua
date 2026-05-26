-- https://lua.expert/
local t = {
	Nothing = {
		P = 0,
		Strength = 35
	},
	FJBodyFluff = {
		DisplayName = "BodyFluff",
		P = 25,
		Strength = 35
	},
	FJFluffyBeard = {
		DisplayName = "FluffyBeard",
		P = 25,
		Strength = 35
	},
	FJFluffyFeathers = {
		DisplayName = "FluffyFeathers",
		P = 25,
		Strength = 35
	},
	FJLegFluff = {
		DisplayName = "LegFluff",
		P = 25,
		Strength = 35
	},
	FJNeckFluff = {
		DisplayName = "NeckFluff",
		P = 25,
		Strength = 35
	},
	DarkHoofFur = {
		P = 25,
		Strength = 35
	},
	HoofFur = {
		P = 25,
		Strength = 35
	},
	TriColourLegFluff = {
		P = 25,
		Strength = 35
	},
	FJEarFluff = {
		DisplayName = "EarFluff",
		P = 25,
		Strength = 35
	},
	FJCheekFur = {
		DisplayName = "CheekFur",
		P = 25,
		Strength = 35
	},
	FJChestFur = {
		DisplayName = "ChestFur",
		P = 25,
		Strength = 35
	},
	FJDorsalFur = {
		DisplayName = "DorsalFur",
		P = 25,
		Strength = 35
	},
	BackCoat = {
		P = 25,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}