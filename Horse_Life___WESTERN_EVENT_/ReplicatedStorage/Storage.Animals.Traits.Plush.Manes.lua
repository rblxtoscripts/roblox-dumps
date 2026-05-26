-- https://lua.expert/
local t = {
	SilkyMane = {
		P = 25,
		Strength = 40
	},
	SimpleMane = {
		P = 40,
		Strength = 40
	},
	CottonPuffMane = {
		P = 35,
		Strength = 35
	},
	PZebraMane = {
		DisplayName = "ZebraMane",
		P = 35,
		Strength = 35
	},
	YarnMane = {
		P = 35,
		Strength = 35
	},
	TuftedMohawkMane = {
		P = 30,
		Strength = 30
	},
	HayMane = {
		P = 30,
		Strength = 30
	},
	StuffedMane = {
		P = 25,
		Strength = 25
	},
	StreakedMane = {
		P = 25,
		Strength = 25
	},
	LongFurMane = {
		P = 25,
		Strength = 15
	},
	BeadedMane = {
		P = 25,
		Strength = 25
	},
	ReindeerMane = {
		P = 10,
		Strength = 20
	},
	LooseCottonMane = {
		P = 10,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}