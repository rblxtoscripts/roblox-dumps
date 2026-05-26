-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	MermaidHorn = {
		P = 40,
		Strength = 40
	},
	SeaAngelHorns = {
		P = 40,
		Strength = 40
	},
	SeahorseHorns = {
		P = 40,
		Strength = 40
	},
	UrchinSpines = {
		P = 40,
		Strength = 40
	},
	WavebreakerHorn = {
		P = 40,
		Strength = 40
	},
	ShellJawHorns = {
		P = 40,
		Strength = 40
	},
	ShellRamHorns = {
		P = 40,
		Strength = 40
	},
	SmallFrayedHorns = {
		P = 40,
		Strength = 40
	},
	FrayedHorns = {
		P = 40,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}