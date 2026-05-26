-- https://lua.expert/
local t = {
	LongWhispTail = {
		P = 25,
		Strength = 40
	},
	ZebraTail = {
		P = 25,
		Strength = 40
	},
	StandardTail = {
		P = 25,
		Strength = 40
	},
	FuneralBandTail = {
		P = 25,
		Strength = 40
	},
	ShortTailFur = {
		P = 25,
		Strength = 40
	},
	CurledTail = {
		P = 25,
		Strength = 40
	},
	LongHeavyTail = {
		P = 25,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}