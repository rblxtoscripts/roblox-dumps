-- https://lua.expert/
local t = {
	GiantMane = {
		P = 30,
		Strength = 30
	},
	RidgedMane = {
		P = 40,
		Strength = 40
	},
	LionMane = {
		P = 35,
		Strength = 35
	},
	KSleekMane = {
		DisplayName = "SleekMane",
		P = 40,
		Strength = 40
	},
	DraconicMane = {
		P = 35,
		Strength = 35
	},
	RibbonMane = {
		P = 20,
		Strength = 20
	},
	KitsuneMane = {
		P = 20,
		Strength = 20
	},
	EmperorMane = {
		P = 20,
		Strength = 20
	},
	EasternDragonMane = {
		P = 20,
		Strength = 20
	},
	ZephyrMane = {
		P = 20,
		Strength = 20
	},
	ValentinesMane = {
		DisplayName = "HeartMane",
		EventName = "Valentines2026",
		P = 0,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}