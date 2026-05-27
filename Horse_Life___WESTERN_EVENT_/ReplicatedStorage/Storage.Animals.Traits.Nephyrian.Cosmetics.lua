-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 35
	},
	NeckVortex = {
		P = 10,
		Strength = 35
	},
	LegVortex = {
		P = 10,
		Strength = 35
	},
	StomachVortex = {
		P = 10,
		Strength = 35
	},
	FullCloudBeard = {
		P = 10,
		Strength = 35
	},
	FullCloudBelly = {
		P = 10,
		Strength = 35
	},
	FullCloudChest = {
		P = 10,
		Strength = 35
	},
	DriftingSock = {
		P = 10,
		Strength = 35
	},
	LegLightning = {
		P = 10,
		Strength = 15,
		WeatherWhitelist = { "Rain" }
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}