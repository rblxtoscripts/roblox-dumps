-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 35
	},
	BackPlates = {
		P = 25,
		Strength = 25
	},
	Claws = {
		P = 40,
		Strength = 40
	},
	BackSpikes = {
		P = 30,
		Strength = 30
	},
	BackSpikes = {
		P = 30,
		Strength = 30
	},
	MangyBackPatch = {
		P = 25,
		Strength = 25
	},
	BatEars = {
		P = 20,
		Strength = 20
	},
	MessyAnkleFur = {
		P = 25,
		Strength = 25
	},
	SporadicBones = {
		P = 25,
		Strength = 25
	},
	Stitches = {
		P = 30,
		Strength = 30
	},
	FaceBoneSpikes = {
		P = 35,
		Strength = 35
	},
	NeckSpineBones = {
		P = 30,
		Strength = 30
	},
	AnkleSpikes = {
		P = 40,
		Strength = 40
	},
	RibcageSpikes = {
		P = 40,
		Strength = 40
	},
	LimbSpikes = {
		P = 35,
		Strength = 35
	},
	TuftedFur = {
		P = 30,
		Strength = 30
	},
	MangyFur = {
		P = 30,
		Strength = 30
	},
	DecayingAnkles = {
		P = 40,
		Strength = 40
	},
	DecayingFlesh = {
		P = 30,
		Strength = 30
	},
	ExternalBones = {
		P = 15,
		Strength = 15
	},
	LupinEars = {
		DisplayName = "LupineEars",
		P = 35,
		Strength = 35
	},
	LupineAnkleFur = {
		P = 30,
		Strength = 30
	},
	LupineBeard = {
		P = 30,
		Strength = 30
	},
	LupineNose = {
		P = 40,
		Strength = 40
	},
	ZombieAnkleFur = {
		P = 30,
		Strength = 30
	},
	ZombieSplits = {
		P = 15,
		Strength = 15
	},
	PoltergeistFur = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}