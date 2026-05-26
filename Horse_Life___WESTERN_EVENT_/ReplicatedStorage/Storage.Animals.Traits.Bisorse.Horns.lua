-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 40
	},
	LonghornHorns = {
		P = 50,
		Strength = 35
	},
	BBullHorns = {
		DisplayName = "BullHorns",
		P = 50,
		Strength = 35
	},
	BuffaloHorns = {
		P = 50,
		Strength = 35
	},
	SharpNubHorns = {
		P = 50,
		Strength = 35
	},
	ForwardPointHorns = {
		P = 50,
		Strength = 35
	},
	BRamHorns = {
		DisplayName = "RamHorns",
		P = 25,
		Strength = 35
	},
	ElegantHorns = {
		P = 25,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}