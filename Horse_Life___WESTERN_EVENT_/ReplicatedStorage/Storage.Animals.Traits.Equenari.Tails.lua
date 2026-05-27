-- https://lua.expert/
local t = {
	FrilledTail = {
		P = 25,
		Strength = 25
	},
	SquidTail = {
		P = 25,
		Strength = 25
	},
	BranchingTail = {
		P = 40,
		Strength = 40
	},
	FinnedTail = {
		P = 40,
		Strength = 40
	},
	ExoskeletonTail = {
		P = 25,
		Strength = 25
	},
	RoyalTail = {
		P = 40,
		Strength = 40
	},
	PredatoryTail = {
		P = 25,
		Strength = 25
	},
	ArmouredTail = {
		P = 40,
		Strength = 40
	},
	EldritchTail = {
		P = 40,
		Strength = 40
	},
	HadelTail = {
		P = 25,
		Strength = 25
	},
	HoopTail = {
		P = 40,
		Strength = 40
	},
	SeradedTail = {
		DisplayName = "SerratedTail",
		P = 40,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}