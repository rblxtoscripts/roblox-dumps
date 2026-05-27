-- https://lua.expert/
local t = {
	CursedMane = {
		P = 10,
		Strength = 10
	},
	SLongMane = {
		DisplayName = "LongMane",
		P = 30,
		Strength = 30
	},
	DivineMane = {
		P = 15,
		Strength = 15
	},
	OracleMane = {
		P = 25,
		Strength = 25
	},
	TiedMane = {
		P = 25,
		Strength = 25
	},
	WatchfulMane = {
		P = 20,
		Strength = 20
	},
	DesolateMane = {
		P = 25,
		Strength = 25
	},
	EspiralMane = {
		P = 20,
		Strength = 20
	},
	AphroditeMane = {
		P = 15,
		Strength = 15
	},
	CutMane = {
		P = 25,
		Strength = 25
	},
	SRegalMane = {
		DisplayName = "RegalMane",
		P = 20,
		Strength = 20
	},
	WingedMane = {
		P = 15,
		Strength = 15
	},
	ShortWingedMane = {
		P = 15,
		Strength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}