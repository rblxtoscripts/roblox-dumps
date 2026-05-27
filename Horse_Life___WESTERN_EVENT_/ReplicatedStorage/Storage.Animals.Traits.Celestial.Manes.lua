-- https://lua.expert/
local t = {
	CelestialWavyMane = {
		P = 40,
		Strength = 40
	},
	StarryMane = {
		P = 40,
		Strength = 40
	},
	WindsweptMane = {
		P = 40,
		Strength = 40
	},
	LunarMane = {
		P = 25,
		Strength = 25
	},
	StarfireMane = {
		P = 35,
		Strength = 35
	},
	CSleekMane = {
		DisplayName = "SleekMane",
		P = 30,
		Strength = 30
	},
	StarrySkeletonMane = {
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