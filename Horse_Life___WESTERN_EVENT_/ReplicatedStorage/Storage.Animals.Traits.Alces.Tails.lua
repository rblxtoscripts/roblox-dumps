-- https://lua.expert/
local t = {
	IceBeastTail = {
		P = 25,
		Strength = 25
	},
	DirewolfTail = {
		P = 25,
		Strength = 40
	},
	PoofyTail = {
		P = 25,
		Strength = 40
	},
	GlacierTail = {
		P = 15,
		Strength = 20
	},
	LongFurTail = {
		P = 30,
		Strength = 30
	},
	MooseTail = {
		P = 40,
		Strength = 40
	},
	SnowflakeArmorTail = {
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