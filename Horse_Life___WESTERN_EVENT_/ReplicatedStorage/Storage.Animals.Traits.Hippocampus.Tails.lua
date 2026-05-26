-- https://lua.expert/
local t = {
	FishTail = {
		P = 25,
		Strength = 25
	},
	KoiTail = {
		P = 25,
		Strength = 25
	},
	OrcaTail = {
		P = 25,
		Strength = 25
	},
	TigerSharkTail = {
		P = 25,
		Strength = 25
	},
	MermaidTail = {
		P = 25,
		Strength = 25
	},
	ArowanaTail = {
		P = 25,
		Strength = 25
	},
	EelTail = {
		P = 25,
		Strength = 25
	},
	MermaidFairyTail = {
		P = 25,
		Strength = 25
	},
	SeahorseTail = {
		P = 25,
		Strength = 25
	},
	HibiscusTail = {
		P = 25,
		Strength = 25
	},
	FishBoneTail = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 25
	},
	BettaTail = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}