-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 25
	},
	RearFlecks = {
		P = 40,
		Strength = 40
	},
	RoanMask = {
		P = 40,
		Strength = 40
	},
	RoanLegs = {
		P = 40,
		Strength = 40
	},
	HeartFreckles = {
		P = 40,
		Strength = 40
	},
	HindHeart = {
		P = 40,
		Strength = 40
	},
	SunflareStripes = {
		P = 35,
		Strength = 35
	},
	FaceSunflare = {
		P = 35,
		Strength = 35
	},
	HeartDappling = {
		P = 35,
		Strength = 35
	},
	FrameOvero = {
		P = 35,
		Strength = 35
	},
	Appaloosa = {
		P = 20,
		Strength = 20
	},
	HindSunflare = {
		P = 20,
		Strength = 20
	},
	LavaLamp = {
		P = 20,
		Strength = 20
	},
	ScruffyDapplePattern = {
		P = 20,
		Strength = 20
	},
	MoonbeamFaceMarkings = {
		P = 20,
		Strength = 20
	},
	MoonbeamPattern = {
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