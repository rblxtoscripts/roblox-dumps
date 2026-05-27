-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	Collared = {
		P = 20,
		Strength = 20
	},
	Muddy = {
		P = 35,
		Strength = 35
	},
	Scaled = {
		P = 35,
		Strength = 35
	},
	ScaledCape = {
		P = 30,
		Strength = 30
	},
	NettedScales = {
		P = 25,
		Strength = 25
	},
	ContourSmudges = {
		P = 25,
		Strength = 25
	},
	HeatStripes = {
		P = 25,
		Strength = 25
	},
	FireBreath = {
		P = 25,
		Strength = 25
	},
	EasternFire = {
		P = 25,
		Strength = 25
	},
	HeartSockPattern = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}