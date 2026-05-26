-- https://lua.expert/
local t = {
	RegularTail = {
		P = 25,
		Strength = 40
	},
	VoluminousTail = {
		P = 25,
		Strength = 40
	},
	HalfPaintTail = {
		P = 25,
		Strength = 40
	},
	PShortChopTail = {
		DisplayName = "ShortChopTail",
		P = 25,
		Strength = 40
	},
	ScruffyTail = {
		P = 25,
		Strength = 40
	},
	TuftyTail = {
		P = 25,
		Strength = 40
	},
	TwoTonedCurlTail = {
		P = 25,
		Strength = 40
	},
	PShaggyTail = {
		DisplayName = "ShaggyTail",
		P = 25,
		Strength = 40
	},
	MoonbeamTail = {
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