-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 25
	},
	ChestPlates = {
		P = 40,
		Strength = 40
	},
	SpiderLily = {
		P = 40,
		Strength = 30
	},
	FloraBloom = {
		P = 40,
		Strength = 35
	},
	BlossomingHind = {
		P = 40,
		Strength = 25
	},
	Leafed = {
		P = 40,
		Strength = 30
	},
	DropPetals = {
		P = 40,
		Strength = 40
	},
	BackLeaves = {
		P = 40,
		Strength = 35
	},
	FernFace = {
		P = 40,
		Strength = 40
	},
	FaceWhisp = {
		P = 40,
		Strength = 40
	},
	Lycoris = {
		P = 40,
		Strength = 20
	},
	PetalDrape = {
		P = 40,
		Strength = 30
	},
	PlatedFlora = {
		P = 40,
		Strength = 35
	},
	ThornLegMark = {
		P = 40,
		Strength = 35
	},
	RoseLeaves = {
		P = 40,
		Strength = 40
	},
	Rose = {
		P = 40,
		Strength = 20
	},
	FlowingPetalPattern = {
		P = 25,
		Strength = 20
	},
	SakuraPattern = {
		P = 25,
		Strength = 20
	},
	RootedCape = {
		P = 25,
		Strength = 20
	},
	OrchidStripes = {
		P = 25,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}