-- https://lua.expert/
local t = {
	Nothing = {
		P = 30,
		Strength = 30
	},
	DraconicHoofAura = {
		P = 20,
		Strength = 20
	},
	EquineLegAura = {
		P = 30,
		Strength = 30
	},
	FlamingEyeAura = {
		P = 40,
		Strength = 40
	},
	FlamingHoofAura = {
		P = 40,
		Strength = 40
	},
	GhostlyHoofAura = {
		P = 35,
		Strength = 35
	},
	MohawkAura = {
		P = 40,
		Strength = 40
	},
	PhoenixHeadAura = {
		P = 30,
		Strength = 30
	},
	PhoenixHoofAura = {
		P = 20,
		Strength = 20
	},
	PhoenixNeckAura = {
		P = 35,
		Strength = 35
	},
	ChestAura = {
		P = 35,
		Strength = 35
	},
	EyeAura = {
		P = 40,
		Strength = 40
	},
	HindAura = {
		P = 35,
		Strength = 35
	},
	FlameAura = {
		P = 35,
		Strength = 35
	},
	OccularAura = {
		DisplayName = "OcularAura",
		P = 30,
		Strength = 30
	},
	SpikedCollarAura = {
		P = 30,
		Strength = 30
	},
	EvilGrinAura = {
		P = 25,
		Strength = 25
	},
	EldritchAura = {
		P = 35,
		Strength = 35
	},
	FallingFeathersAura = {
		P = 30,
		Strength = 30
	},
	SpikeAura = {
		P = 25,
		Strength = 25
	},
	HauntingKatana = {
		P = 30,
		Strength = 30
	},
	SpectralSword = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}