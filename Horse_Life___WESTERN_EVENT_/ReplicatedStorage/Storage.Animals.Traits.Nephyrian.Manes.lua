-- https://lua.expert/
local t = {
	CelestialMane = {
		P = 30,
		Strength = 30
	},
	WhispyMane = {
		P = 30,
		Strength = 30
	},
	RollingCloudsMane = {
		P = 30,
		Strength = 30
	},
	DriftingMane = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}