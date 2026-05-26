-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	CrscentFace = {
		DisplayName = "CrescentFace",
		P = 40,
		Strength = 40
	},
	BoundCiphers = {
		P = 35,
		Strength = 35
	},
	ArcaneSigil = {
		P = 30,
		Strength = 30
	},
	Whisp = {
		P = 30,
		Strength = 30
	},
	AncientRunes = {
		P = 25,
		Strength = 25
	},
	VampireCape = {
		P = 35,
		Strength = 35
	},
	Poisoned = {
		P = 25,
		Strength = 25
	},
	SharpRunes = {
		P = 30,
		Strength = 30
	},
	SpiralRunes = {
		P = 30,
		Strength = 30
	},
	TatteredSocks = {
		P = 30,
		Strength = 30
	},
	IntricateGlyphs = {
		P = 35,
		Strength = 35
	},
	NecroBands = {
		P = 25,
		Strength = 25
	},
	CorruptedVision = {
		P = 25,
		Strength = 20
	},
	Spectre = {
		P = 30,
		Strength = 30
	},
	AbyssalRifts = {
		P = 30,
		Strength = 30
	},
	WeepingFace = {
		P = 30,
		Strength = 30
	},
	CorruptedStripes = {
		P = 25,
		Strength = 25
	},
	WeepingSouls = {
		P = 25,
		Strength = 25
	},
	ZombieBackPatches = {
		P = 25,
		Strength = 25
	},
	ZombieFrontPatches = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}