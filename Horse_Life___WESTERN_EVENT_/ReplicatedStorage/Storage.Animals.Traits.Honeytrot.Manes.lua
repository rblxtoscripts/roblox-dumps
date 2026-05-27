-- https://lua.expert/
local t = {
	HOFluffyMane = {
		DisplayName = "FluffyMane",
		P = 40,
		Strength = 40
	},
	HOSleekMane = {
		DisplayName = "SleekMane",
		P = 40,
		Strength = 40
	},
	BombusMane = {
		P = 35,
		Strength = 35
	},
	HOShortStripedMane = {
		DisplayName = "ShortStripedMane",
		P = 25,
		Strength = 25
	},
	PollenMane = {
		P = 30,
		Strength = 30
	},
	SpringMane = {
		P = 25,
		Strength = 25
	},
	RoyalJellyMane = {
		P = 20,
		Strength = 20
	},
	HOBlossomingMane = {
		DisplayName = "BlossomingMane",
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}