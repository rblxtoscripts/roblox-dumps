-- https://lua.expert/
local t = {
	SilkyTail = {
		P = 40,
		Strength = 40
	},
	SimpleTail = {
		P = 40,
		Strength = 40
	},
	CottonPuffTail = {
		P = 35,
		Strength = 35
	},
	YarnTail = {
		P = 35,
		Strength = 35
	},
	HayTail = {
		P = 35,
		Strength = 35
	},
	PZebraTail = {
		DisplayName = "ZebraTail",
		P = 35,
		Strength = 35
	},
	PTuftedTail = {
		DisplayName = "TuftedTail",
		P = 30,
		Strength = 30
	},
	StuffedTail = {
		P = 25,
		Strength = 25
	},
	StreakedTail = {
		P = 25,
		Strength = 25
	},
	BeadedTail = {
		P = 25,
		Strength = 25
	},
	DinoTail = {
		P = 15,
		Strength = 15
	},
	ReindeerTail = {
		P = 10,
		Strength = 20
	},
	LooseCottonTail = {
		P = 10,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}