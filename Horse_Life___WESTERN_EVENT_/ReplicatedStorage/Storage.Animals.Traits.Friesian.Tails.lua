-- https://lua.expert/
local t = {
	BasicTail = {
		P = 30,
		Strength = 30
	},
	FBraidedTail = {
		DisplayName = "BraidedTail",
		P = 30,
		Strength = 30
	},
	ExtendedTail = {
		P = 30,
		Strength = 30
	},
	LeafedTail = {
		P = 20,
		Strength = 20
	},
	WavyTail = {
		P = 30,
		Strength = 30
	},
	WildFlowerTail = {
		P = 20,
		Strength = 20
	},
	BunTail = {
		P = 30,
		Strength = 30
	},
	FunRoseTail = {
		P = 20,
		Strength = 30
	},
	LargeCurlyTail = {
		P = 20,
		Strength = 30
	},
	EnchantedFlowerTail = {
		P = 20,
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