-- https://lua.expert/
local t = {
	Nothing = {
		P = 90,
		Strength = 40
	},
	BranchAntlers = {
		P = 40,
		Strength = 40
	},
	TwistedBranch = {
		P = 30,
		Strength = 30
	},
	FDeerAntlers = {
		DisplayName = "DeerAntlers",
		P = 30,
		Strength = 30
	},
	OldenBarkHorn = {
		P = 30,
		Strength = 30
	},
	HeadBranches = {
		P = 25,
		Strength = 25
	},
	MossyAntlers = {
		P = 10,
		Strength = 15
	},
	ParasiticHorn = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}