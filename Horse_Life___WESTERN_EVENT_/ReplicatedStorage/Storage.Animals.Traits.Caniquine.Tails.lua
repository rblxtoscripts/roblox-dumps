-- https://lua.expert/
local t = {
	MythosTail = {
		P = 25,
		Strength = 25
	},
	CAFlowyTail = {
		DisplayName = "FlowyTail",
		P = 25,
		Strength = 25
	},
	CAWildTail = {
		DisplayName = "WildTail",
		P = 25,
		Strength = 25
	},
	SweptTail = {
		P = 25,
		Strength = 25
	},
	CATwoTonedTail = {
		DisplayName = "TwoTonedTail",
		P = 25,
		Strength = 25
	},
	RoughCollieTail = {
		P = 25,
		Strength = 25
	},
	ThreeTails = {
		P = 10,
		Strength = 10
	},
	BarboryTail = {
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