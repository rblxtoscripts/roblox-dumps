-- https://lua.expert/
local t = {
	Nothing = {
		P = 30,
		Strength = 30
	},
	TiftedPattern = {
		P = 20,
		Strength = 20
	},
	WildPattern = {
		P = 30,
		Strength = 30
	},
	TornMistPattern = {
		P = 30,
		Strength = 30
	},
	GloomyVergePattern = {
		P = 40,
		Strength = 25
	},
	ImperialPattern = {
		P = 40,
		Strength = 40
	},
	AbyssalPattern = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}