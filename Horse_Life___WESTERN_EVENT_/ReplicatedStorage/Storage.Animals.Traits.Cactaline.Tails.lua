-- https://lua.expert/
local t = {
	ThornlashTail = {
		P = 25,
		Strength = 25
	},
	SpikeyTail = {
		P = 35,
		Strength = 35
	},
	FennecTail = {
		P = 30,
		Strength = 30
	},
	ScorpionTail = {
		P = 15,
		Strength = 15
	},
	TangledCactusTail = {
		P = 20,
		Strength = 20
	},
	LongCactiTail = {
		P = 30,
		Strength = 30
	},
	DrylandsTail = {
		P = 35,
		Strength = 35
	},
	CoarseCactiTail = {
		P = 20,
		Strength = 20
	},
	LooseTail = {
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