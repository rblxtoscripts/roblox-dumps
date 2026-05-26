-- https://lua.expert/
local t = {
	IceBeastMane = {
		P = 25,
		Strength = 25
	},
	DirewolfMane = {
		P = 25,
		Strength = 40
	},
	PoofyMane = {
		P = 25,
		Strength = 40
	},
	GlacierMane = {
		P = 15,
		Strength = 20
	},
	ThickFurMane = {
		P = 35,
		Strength = 35
	},
	MooseMane = {
		P = 40,
		Strength = 40
	},
	SnowflakeArmorMane = {
		P = 20,
		Strength = 20
	},
	OldNeckMane = {
		P = 20,
		Strength = 20
	},
	AlpineMane = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}