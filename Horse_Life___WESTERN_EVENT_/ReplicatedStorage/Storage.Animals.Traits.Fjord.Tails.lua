-- https://lua.expert/
local t = {
	FJScruffyTail = {
		DisplayName = "ScruffyTail",
		P = 30,
		Strength = 30
	},
	FJWhispyTail = {
		DisplayName = "WhispyTail",
		P = 30,
		Strength = 30
	},
	TippedTail = {
		P = 30,
		Strength = 30
	},
	FJSmallTail = {
		DisplayName = "SmallTail",
		P = 30,
		Strength = 30
	},
	LightLongTail = {
		P = 30,
		Strength = 30
	},
	LongDarkTail = {
		P = 30,
		Strength = 30
	},
	FJStandardTail = {
		DisplayName = "StandardTail",
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}