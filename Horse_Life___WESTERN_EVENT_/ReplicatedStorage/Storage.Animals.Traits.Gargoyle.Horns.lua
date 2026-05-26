-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	RamHorns = {
		P = 25,
		Strength = 35
	},
	SwoopedHorns = {
		P = 25,
		Strength = 35
	},
	ForwardsHorns = {
		DisplayName = "ForwardHorns",
		P = 25,
		Strength = 35
	},
	DraconicHorns = {
		P = 25,
		Strength = 35
	},
	TallHorns = {
		P = 25,
		Strength = 35
	},
	BullHorns = {
		P = 25,
		Strength = 35
	},
	HookedHorns = {
		P = 15,
		Strength = 25
	},
	TwistedHorns = {
		P = 15,
		Strength = 25
	},
	Rhino = {
		P = 25,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}