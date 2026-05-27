-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 40
	},
	AloeAntlers = {
		P = 40,
		Strength = 40
	},
	AloeHorn = {
		P = 35,
		Strength = 35
	},
	CactiAntlers = {
		P = 20,
		Strength = 20
	},
	CactiPronghorns = {
		P = 40,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}