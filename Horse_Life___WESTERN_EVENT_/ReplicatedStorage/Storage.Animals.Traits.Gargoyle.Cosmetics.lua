-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 35
	},
	CurledBeard = {
		P = 25,
		Strength = 40
	},
	PointedBeard = {
		P = 25,
		Strength = 40
	},
	CurledChestFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	CurledAnkleFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	OversizedAnkleFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	NeckScutes = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	BellyScutes = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	NoseScutes = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	SlateFaceArmor = {
		P = 25,
		Strength = 40
	},
	SlateBodyArmor = {
		P = 25,
		Strength = 35
	},
	SlateLimbGuards = {
		P = 25,
		Strength = 40
	},
	JaggedAnkleRocks = {
		P = 25,
		Strength = 40
	},
	SlateHoofCover = {
		P = 25,
		Strength = 40
	},
	SpikedBeard = {
		P = 25,
		Strength = 40
	},
	SwirlRockFace = {
		P = 25,
		Strength = 40
	},
	SwirlRockBack = {
		P = 25,
		Strength = 40
	},
	SwirlRockLimbs = {
		P = 25,
		Strength = 40
	},
	SwirlRockAnkles = {
		P = 25,
		Strength = 40
	},
	JaggedLimbRocks = {
		P = 25,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}