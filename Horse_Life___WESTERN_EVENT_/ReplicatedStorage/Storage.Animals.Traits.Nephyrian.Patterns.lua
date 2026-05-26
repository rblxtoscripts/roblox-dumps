-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	DropletPattern = {
		P = 25,
		Strength = 25
	},
	SpiralingStormPattern = {
		P = 15,
		Strength = 15,
		WeatherWhitelist = { "Rain" }
	},
	CirrocumulusPattern = {
		P = 25,
		Strength = 25
	},
	DropletSpecklePattern = {
		P = 25,
		Strength = 25
	},
	GaleRushPattern = {
		P = 25,
		Strength = 25
	},
	SoftBreezePattern = {
		P = 15,
		Strength = 15,
		WeatherWhitelist = { "Sunny" }
	},
	BlottedPattern = {
		P = 25,
		Strength = 25
	},
	CloudyBoaPattern = {
		P = 25,
		Strength = 25
	},
	CloudLining = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}