-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 50
	},
	DivineBodyHalo = {
		P = 15,
		Strength = 15
	},
	RadientNeckRing = {
		DisplayName = "RadiantNeckRing",
		P = 25,
		Strength = 25
	},
	RadientHaloHead = {
		DisplayName = "RadiantHaloHead",
		P = 25,
		Strength = 25
	},
	NeckRings = {
		P = 15,
		Strength = 15
	},
	PiercingEyeHalo = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Whiskers"
end
return {
	Whiskers = t
}