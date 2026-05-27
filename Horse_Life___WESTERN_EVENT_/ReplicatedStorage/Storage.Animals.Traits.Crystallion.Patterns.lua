-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 40
	},
	MalachitePattern = {
		P = 25,
		Strength = 25
	},
	PetrifiedCape = {
		P = 35,
		Strength = 35
	},
	BismuthSwirls = {
		P = 20,
		Strength = 20
	},
	GeodeBottomPattern = {
		P = 40,
		Strength = 40
	},
	GeodeTopPattern = {
		P = 40,
		Strength = 40
	},
	MarbeledPattern = {
		DisplayName = "MarbledPattern",
		P = 40,
		Strength = 40
	},
	OnyxBodyLooping = {
		P = 40,
		Strength = 40
	},
	CrystalButterflyPattern = {
		P = 40,
		Strength = 40
	},
	GeodeRoan = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}