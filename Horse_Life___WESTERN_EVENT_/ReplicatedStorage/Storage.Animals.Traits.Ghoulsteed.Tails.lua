-- https://lua.expert/
local t = {
	SpectralTail = {
		P = 35,
		Strength = 35
	},
	GreasyTail = {
		P = 40,
		Strength = 40
	},
	GChoppedTail = {
		DisplayName = "ChoppedTail",
		P = 40,
		Strength = 40
	},
	TatteredTail = {
		P = 30,
		Strength = 30
	},
	SkeletonTail = {
		P = 30,
		Strength = 30
	},
	ShortTail = {
		P = 40,
		Strength = 40
	},
	WeepingTail = {
		P = 25,
		Strength = 20
	},
	FeralTail = {
		P = 25,
		Strength = 25
	},
	SpinneretTail = {
		P = 15,
		Strength = 15
	},
	CloakedTail = {
		P = 25,
		Strength = 25
	},
	AncientLupineTail = {
		P = 15,
		Strength = 15
	},
	ZombieTail = {
		P = 25,
		Strength = 25
	},
	PoltergeistTail = {
		P = 15,
		Strength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}