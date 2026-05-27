-- https://lua.expert/
local t = {
	LovestruckTail = {
		P = 30,
		Strength = 30
	},
	OverGrowthTail = {
		P = 30,
		Strength = 30
	},
	ThornyWillowTail = {
		P = 25,
		Strength = 25
	},
	HWeepingTail = {
		DisplayName = "WeepingTail",
		P = 25,
		Strength = 25
	},
	HWildTail = {
		DisplayName = "WildTail",
		P = 40,
		Strength = 40
	},
	GothicTail = {
		P = 25,
		Strength = 25
	},
	HBFluffyTail = {
		DisplayName = "FluffyTail",
		P = 30,
		Strength = 30
	},
	HWillowTail = {
		DisplayName = "WillowTail",
		P = 20,
		Strength = 20
	},
	BeastlyTail = {
		P = 40,
		Strength = 40
	},
	SecretHeartTail = {
		P = 40,
		Strength = 40
	},
	EnchantedTail = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}