-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LeafletSprout = {
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	CheekBark = {
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	HeadBarkPlates = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	FootBranches = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	LegBark = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	MimosaSocks = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	AloftSocks = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	AnkleBarkPlates = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	ChestBranches = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	BodyBarkPlates = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	AnkleLeaves = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	FThighFluff = {
		DisplayName = "ThighFluff",
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	FChestFur = {
		DisplayName = "ChestFur",
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	TailLeafCover = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	Thorns = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	MossySocks = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	BranchRibcage = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 25,
		Type = "Furs"
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}