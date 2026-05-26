-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 35
	},
	Downfleece = {
		P = 10,
		Strength = 35
	},
	BunnyFur = {
		P = 10,
		Strength = 35
	},
	LowerBodyWings = {
		P = 10,
		Strength = 35
	},
	MidBodyWings = {
		P = 10,
		Strength = 35
	},
	Stiltfluff = {
		P = 10,
		Strength = 35
	},
	SkvaderFauxWings = {
		P = 10,
		Strength = 35
	},
	SkvaderFeatherSocks = {
		P = 10,
		Strength = 35
	},
	SkvaderHipSpikes = {
		P = 15,
		Strength = 35
	},
	SkvaderLegSpikes = {
		P = 15,
		Strength = 35
	},
	MottledBrindleUnderfluff = {
		P = 15,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}