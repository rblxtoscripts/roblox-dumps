-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	RapturedHorn = {
		P = 50,
		Strength = 50
	},
	SpiralHorn = {
		P = 75,
		Strength = 40
	},
	RidgeHorn = {
		P = 50,
		Strength = 50
	},
	BloodyHorns = {
		P = 50,
		Strength = 50
	},
	BunchedHorns = {
		P = 60,
		Strength = 60
	},
	CrossHorn = {
		P = 75,
		Strength = 40
	},
	FaceThorns = {
		P = 60,
		Strength = 60
	},
	PiercedHorns = {
		P = 75,
		Strength = 40
	},
	ReversedHorn = {
		P = 50,
		Strength = 50
	},
	SharpTripleHorn = {
		P = 60,
		Strength = 60
	},
	ImperialHorns = {
		P = 50,
		Strength = 50
	},
	EchoflareHorns = {
		P = 60,
		Strength = 60
	},
	UnderworldHorns = {
		P = 50,
		Strength = 50
	},
	FeralHorns = {
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