-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	CloudRamHorns = {
		P = 75,
		Strength = 40
	},
	ElectricHorns = {
		P = 75,
		Strength = 40,
		WeatherWhitelist = { "Rain" }
	},
	SkyAntlers = {
		P = 75,
		Strength = 40,
		WeatherWhitelist = { "Sunny" }
	},
	WispyHorns = {
		P = 75,
		Strength = 40
	},
	CloudDragonHorns = {
		P = 75,
		Strength = 40
	},
	CloudHalo = {
		P = 75,
		Strength = 40
	},
	FloatingCloudHorns = {
		P = 75,
		Strength = 40
	},
	UniCloud = {
		P = 75,
		Strength = 40,
		WeatherWhitelist = { "Sunny" }
	},
	LightingHorn = {
		P = 30,
		Strength = 15,
		WeatherWhitelist = { "Rain" }
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}