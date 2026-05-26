-- https://lua.expert/
local t = {
	LongChoppyMane = {
		P = 25,
		Strength = 40
	},
	ZebraMane = {
		P = 35,
		Strength = 35
	},
	StandardMane = {
		P = 40,
		Strength = 40
	},
	FuneralBandMane = {
		P = 35,
		Strength = 35
	},
	EShortMane = {
		DisplayName = "Short Mane",
		P = 25,
		Strength = 40
	},
	UnkeptMane = {
		P = 30,
		Strength = 30
	},
	CurledMane = {
		P = 30,
		Strength = 30
	},
	LongHeavyMane = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}