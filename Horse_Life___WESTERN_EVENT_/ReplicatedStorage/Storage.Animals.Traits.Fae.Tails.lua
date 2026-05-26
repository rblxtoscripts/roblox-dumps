-- https://lua.expert/
local t = {
	FLongTail = {
		DisplayName = "LongTail",
		P = 40,
		Strength = 40
	},
	WavyLeafTail = {
		P = 30,
		Strength = 30
	},
	VerdalithTail = {
		P = 30,
		Strength = 30
	},
	HeartleafTail = {
		P = 25,
		Strength = 25
	},
	WillowTail = {
		P = 30,
		Strength = 30
	},
	SpinyBranchTail = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}