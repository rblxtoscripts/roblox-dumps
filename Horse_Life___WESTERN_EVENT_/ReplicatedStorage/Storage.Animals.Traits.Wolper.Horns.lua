-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	LeekAntlers = {
		P = 35,
		Strength = 25
	},
	BigAsparagusHorns = {
		P = 35,
		Strength = 25
	},
	BitterGourdHorns = {
		P = 35,
		Strength = 25
	},
	BrusselSproutHorns = {
		P = 35,
		Strength = 25
	},
	GingerRootHorns = {
		P = 35,
		Strength = 25
	},
	WinterRadishHorns = {
		P = 35,
		Strength = 25
	},
	LettuceAntlers = {
		P = 35,
		Strength = 25
	},
	LargeBunnyAntlers = {
		P = 35,
		Strength = 25
	},
	CarrotHorn = {
		P = 35,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}