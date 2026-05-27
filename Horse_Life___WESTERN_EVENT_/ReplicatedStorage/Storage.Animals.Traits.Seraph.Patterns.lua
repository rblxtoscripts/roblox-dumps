-- https://lua.expert/
local t = {
	Nothing = {
		P = 20,
		Strength = 20
	},
	GuildedPattern = {
		P = 15,
		Strength = 15
	},
	WispPattern = {
		P = 25,
		Strength = 25
	},
	SCloudPattern = {
		DisplayName = "CloudPattern",
		P = 30,
		Strength = 25
	},
	DivinePattern = {
		P = 15,
		Strength = 15
	},
	CrocodileTears = {
		P = 30,
		Strength = 30
	},
	WatcherPattern = {
		P = 20,
		Strength = 20
	},
	EspiralPattern = {
		P = 20,
		Strength = 20
	},
	BandedPattern = {
		P = 30,
		Strength = 30
	},
	ConcentricRingsPattern = {
		P = 20,
		Strength = 20
	},
	SCloudPattern = {
		DisplayName = "CloudPattern",
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}