-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 35
	},
	FJTobiano = {
		DisplayName = "Tobiano",
		P = 40,
		Strength = 35
	},
	FJAppaloosa = {
		DisplayName = "Appaloosa",
		P = 40,
		Strength = 35
	},
	FJWildFur = {
		DisplayName = "WildFur",
		P = 40,
		Strength = 35
	},
	FJFramed = {
		DisplayName = "Framed",
		P = 40,
		Strength = 35
	},
	FJSabino = {
		DisplayName = "Sabino",
		P = 40,
		Strength = 35
	},
	FJSnowPeak = {
		DisplayName = "SnowPeak",
		P = 40,
		Strength = 35
	},
	FJSnowcap = {
		DisplayName = "Snowcap",
		P = 40,
		Strength = 35
	},
	FJOvero = {
		DisplayName = "Overo",
		P = 40,
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