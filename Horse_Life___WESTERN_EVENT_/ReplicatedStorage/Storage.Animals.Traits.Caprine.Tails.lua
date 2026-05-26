-- https://lua.expert/
local t = {
	TuftedTail = {
		P = 25,
		Strength = 25
	},
	UpturnedTail = {
		P = 25,
		Strength = 25
	},
	CurlyFluffTail = {
		P = 25,
		Strength = 25
	},
	LowTuftedTail = {
		P = 25,
		Strength = 25
	},
	SwoopedTail = {
		P = 25,
		Strength = 25
	},
	UpturnTuftTail = {
		P = 25,
		Strength = 25
	},
	LargePuffyTail = {
		P = 25,
		Strength = 25
	},
	CShortTail = {
		DisplayName = "ShortTail",
		P = 25,
		Strength = 25
	},
	AncientBraidedTail = {
		P = 20,
		Strength = 20
	},
	MysticTail = {
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