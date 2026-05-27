-- https://lua.expert/
local t = {
	BarrelEars = {
		P = 35,
		Strength = 35
	},
	BloomingEars = {
		P = 25,
		Strength = 25
	},
	BristleEars = {
		P = 40,
		Strength = 40
	},
	ChollaEars = {
		P = 30,
		Strength = 30
	},
	PrickeledEars = {
		P = 30,
		Strength = 30
	},
	SerratedEars = {
		P = 40,
		Strength = 40
	},
	SucculentEars = {
		P = 40,
		Strength = 40
	},
	FennecEar = {
		P = 25,
		Strength = 25
	},
	ThistleEars = {
		P = 25,
		Strength = 25
	},
	SturdyBloomEars = {
		P = 25,
		Strength = 25
	},
	ShortBloomEars = {
		P = 25,
		Strength = 25
	},
	PaddleThornEars = {
		P = 25,
		Strength = 25
	},
	MarbledEars = {
		P = 25,
		Strength = 25
	},
	RougeEars = {
		P = 25,
		Strength = 25
	},
	CABasicEar = {
		DisplayName = "BasicEar",
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Ears"
end
return {
	Ears = t
}