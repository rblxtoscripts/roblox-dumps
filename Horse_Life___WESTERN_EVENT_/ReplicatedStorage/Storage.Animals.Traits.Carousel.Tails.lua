-- https://lua.expert/
local t = {
	RegalTail = {
		P = 25,
		Strength = 25
	},
	ElegantArrowTail = {
		P = 25,
		Strength = 25
	},
	ElegantFluffTail = {
		P = 35,
		Strength = 35
	},
	ElegantBraidedTail = {
		P = 35,
		Strength = 35
	},
	VintageTail = {
		P = 35,
		Strength = 35
	},
	WindingTail = {
		P = 30,
		Strength = 30
	},
	FloweryTail = {
		P = 30,
		Strength = 30
	},
	SubtlePearlTail = {
		P = 30,
		Strength = 30
	},
	CRibbonTail = {
		DisplayName = "RibbonTail",
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