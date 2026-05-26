-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	LovelyHorns = {
		P = 60,
		Strength = 60
	},
	TwistedWoodHorn = {
		P = 50,
		Strength = 50
	},
	MossyHeartHorns = {
		P = 60,
		Strength = 60
	},
	CurloveHorns = {
		P = 50,
		Strength = 50
	},
	CurvedHeartAntlers = {
		P = 50,
		Strength = 50
	},
	WillowHorns = {
		P = 45,
		Strength = 45
	},
	BeastlyHorns = {
		P = 60,
		Strength = 60
	},
	SecretHeartHorns = {
		P = 60,
		Strength = 60
	},
	EnchantedAntlers = {
		P = 50,
		Strength = 50
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}