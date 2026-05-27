-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	Infection = {
		P = 30,
		Strength = 30
	},
	AstralCore = {
		P = 40,
		Strength = 40
	},
	AstralFlameSocks = {
		P = 30,
		Strength = 30
	},
	DragonsBreath = {
		P = 35,
		Strength = 35
	},
	FlamingBelly = {
		P = 25,
		Strength = 25
	},
	Ghosts = {
		P = 20,
		Strength = 20
	},
	LimbFlares = {
		P = 30,
		Strength = 30
	},
	Drool = {
		P = 40,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}