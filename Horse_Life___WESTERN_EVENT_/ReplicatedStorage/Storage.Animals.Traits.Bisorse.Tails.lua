-- https://lua.expert/
local t = {
	BWhispyTail = {
		DisplayName = "WhispyTail",
		P = 25,
		Strength = 40
	},
	BisonTail = {
		P = 25,
		Strength = 40
	},
	ShaggyTail = {
		P = 25,
		Strength = 40
	},
	BSparseTail = {
		DisplayName = "SparseTail",
		P = 25,
		Strength = 40
	},
	SleekCutTail = {
		P = 25,
		Strength = 25
	},
	YakTail = {
		P = 25,
		Strength = 25
	},
	BIShaggyTail = {
		DisplayName = "DenseTail",
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