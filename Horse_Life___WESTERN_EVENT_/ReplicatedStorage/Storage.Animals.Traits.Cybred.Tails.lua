-- https://lua.expert/
local t = {
	SyntheticTail = {
		P = 40,
		Strength = 40
	},
	ElectricPlugTail = {
		P = 40,
		Strength = 40
	},
	CableTail = {
		P = 15,
		Strength = 15
	},
	BoundCableTail = {
		P = 35,
		Strength = 35
	},
	LooseCordTail = {
		P = 30,
		Strength = 30
	},
	FauxTail = {
		P = 30,
		Strength = 20
	},
	DoubleCableTail = {
		P = 30,
		Strength = 20
	},
	CyberSharkTail = {
		P = 30,
		Strength = 20
	},
	ScorpioTail = {
		P = 15,
		Strength = 15
	},
	IceDragonTail = {
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}