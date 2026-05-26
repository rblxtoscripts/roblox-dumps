-- https://lua.expert/
local t = {
	FBasicMane = {
		DisplayName = "BasicMane",
		P = 30,
		Strength = 30
	},
	FBraidedMane = {
		DisplayName = "BraidedMane",
		P = 30,
		Strength = 30
	},
	ExtendedMane = {
		P = 30,
		Strength = 30
	},
	LeafedMane = {
		P = 20,
		Strength = 20
	},
	WavyMane = {
		P = 30,
		Strength = 30
	},
	WildFlowerMane = {
		P = 20,
		Strength = 20
	},
	BunMane = {
		P = 20,
		Strength = 20
	},
	FunRoseMane = {
		P = 20,
		Strength = 20
	},
	LargeCurlyMane = {
		P = 20,
		Strength = 20
	},
	EnchantedFlowerMane = {
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