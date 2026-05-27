-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 70
	},
	BruteHorn = {
		P = 30,
		Strength = 30
	},
	KElkHorn = {
		DisplayName = "ElkHorn",
		P = 25,
		Strength = 25
	},
	WoodlandHorns = {
		P = 30,
		Strength = 30
	},
	TwigHorns = {
		P = 35,
		Strength = 35
	},
	TwigHorns = {
		P = 35,
		Strength = 35
	},
	KPronghorn = {
		DisplayName = "Pronghorn",
		P = 45,
		Strength = 45
	},
	DraconicHeartHorns = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}