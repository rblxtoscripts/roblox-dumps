-- https://lua.expert/
local t = {
	GeodeTail = {
		P = 40,
		Strength = 40
	},
	SharpCrystalTail = {
		P = 25,
		Strength = 25
	},
	ShortCrystalTail = {
		P = 35,
		Strength = 35
	},
	QuartzTail = {
		P = 35,
		Strength = 35
	},
	CrystalGrowthTail = {
		P = 35,
		Strength = 35
	},
	LongCrystalTail = {
		P = 35,
		Strength = 35
	},
	CrystalButterflyTail = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}