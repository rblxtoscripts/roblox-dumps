-- https://lua.expert/
local t = {
	FloraAntenna = {
		P = 75,
		Strength = 40
	},
	PlushPetalAntenna = {
		P = 75,
		Strength = 20
	},
	FernTuftAntenna = {
		P = 75,
		Strength = 30
	},
	LissomAntenna = {
		P = 75,
		Strength = 30
	},
	CherryBlossomAntennae = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}