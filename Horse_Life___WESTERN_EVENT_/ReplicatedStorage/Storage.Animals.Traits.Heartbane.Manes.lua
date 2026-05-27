-- https://lua.expert/
local t = {
	LovestruckMane = {
		P = 30,
		Strength = 30
	},
	OverGrowthMane = {
		P = 30,
		Strength = 30
	},
	ThornyWillowMane = {
		P = 25,
		Strength = 25
	},
	HWeepingMane = {
		DisplayName = "WeepingMane",
		P = 25,
		Strength = 25
	},
	HWildMane = {
		DisplayName = "WildMane",
		P = 40,
		Strength = 40
	},
	GothicMane = {
		P = 25,
		Strength = 25
	},
	HBFluffyMane = {
		DisplayName = "FluffyMane",
		P = 30,
		Strength = 30
	},
	HWillowMane = {
		DisplayName = "WillowMane",
		P = 20,
		Strength = 20
	},
	BeastlyMane = {
		P = 30,
		Strength = 30
	},
	SecretHeartMane = {
		P = 20,
		Strength = 20
	},
	EnchantedMane = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}