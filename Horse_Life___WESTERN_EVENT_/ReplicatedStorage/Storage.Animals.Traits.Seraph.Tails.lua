-- https://lua.expert/
local t = {
	CursedTail = {
		P = 10,
		Strength = 10
	},
	SLongTail = {
		DisplayName = "LongTail",
		P = 25,
		Strength = 25
	},
	DivineTail = {
		P = 15,
		Strength = 15
	},
	WatchfulTail = {
		P = 20,
		Strength = 20
	},
	DesolateTail = {
		P = 15,
		Strength = 15
	},
	EspiralTail = {
		P = 20,
		Strength = 20
	},
	AphroditeTail = {
		P = 15,
		Strength = 15
	},
	CutTail = {
		P = 25,
		Strength = 25
	},
	SRegalTail = {
		DisplayName = "RegalTail",
		P = 20,
		Strength = 20
	},
	SFeatheredTail = {
		DisplayName = "FeatheredTail",
		P = 20,
		Strength = 20
	},
	ShortWingedTail = {
		DisplayName = "ShortWingedTail",
		P = 20,
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