-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	FantailFacePaint = {
		P = 40,
		Strength = 40
	},
	WhispyPaint = {
		P = 35,
		Strength = 35
	},
	RunnerPaint = {
		P = 35,
		Strength = 35
	},
	LightPiebald = {
		P = 25,
		Strength = 25
	},
	Surf = {
		P = 25,
		Strength = 25
	},
	FireWisp = {
		P = 25,
		Strength = 25
	},
	SnowDapplePaint = {
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}