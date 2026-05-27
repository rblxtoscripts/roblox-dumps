-- https://lua.expert/
local t = {
	DecoratedTail = {
		P = 30,
		Strength = 30
	},
	CStandardTail = {
		DisplayName = "StandardTail",
		P = 30,
		Strength = 30
	},
	FadedTail = {
		P = 20,
		Strength = 20
	},
	FriesianTail = {
		P = 20,
		Strength = 20
	},
	ThickMultiTail = {
		P = 20,
		Strength = 20
	},
	CRoyalTail = {
		DisplayName = "RoyalTail",
		P = 20,
		Strength = 20
	},
	NeatlyTrimmedTail = {
		P = 20,
		Strength = 20
	},
	ShortMulticoloredTail = {
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