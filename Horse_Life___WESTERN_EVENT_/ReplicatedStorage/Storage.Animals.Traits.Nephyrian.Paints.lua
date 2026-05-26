-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	FogRoanPaint = {
		P = 35,
		Strength = 35
	},
	LightingPaint = {
		P = 20,
		Strength = 15,
		WeatherWhitelist = { "Rain" }
	},
	OvercastPaint = {
		P = 35,
		Strength = 35
	},
	SnowSpotsPaint = {
		P = 20,
		Strength = 15,
		WeatherWhitelist = { "Snow" }
	},
	SparseRainPaint = {
		P = 35,
		Strength = 35
	},
	SwirlingCloudPaint = {
		P = 35,
		Strength = 35
	},
	SnowySpillPaint = {
		P = 20,
		Strength = 15,
		WeatherWhitelist = { "Snow" }
	},
	SpottyRoanPaint = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}