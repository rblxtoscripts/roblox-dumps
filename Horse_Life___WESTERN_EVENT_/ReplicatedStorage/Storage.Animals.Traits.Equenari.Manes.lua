-- https://lua.expert/
local t = {
	FrilledMane = {
		P = 30,
		Strength = 30
	},
	LongTendrilMane = {
		P = 40,
		Strength = 40
	},
	SquidShellMane = {
		P = 40,
		Strength = 40
	},
	TendrilMane = {
		P = 30,
		Strength = 30
	},
	BranchingMane = {
		P = 40,
		Strength = 40
	},
	FinnedMane = {
		P = 25,
		Strength = 25
	},
	RoyalNeckFrills = {
		P = 40,
		Strength = 40
	},
	PredatoryMane = {
		P = 40,
		Strength = 40
	},
	ArmouredMane = {
		P = 40,
		Strength = 40
	},
	EldritchMane = {
		P = 20,
		Strength = 20
	},
	HadelMane = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}