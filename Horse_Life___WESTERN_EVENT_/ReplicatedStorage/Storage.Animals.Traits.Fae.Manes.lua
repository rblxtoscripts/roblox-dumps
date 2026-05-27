-- https://lua.expert/
local t = {
	FLongMane = {
		DisplayName = "LongMane",
		P = 40,
		Strength = 40
	},
	CurlyWisteriaMane = {
		P = 40,
		Strength = 40
	},
	WavyLeafMane = {
		P = 30,
		Strength = 30
	},
	VerdalithMane = {
		P = 30,
		Strength = 30
	},
	HeartleafMane = {
		P = 25,
		Strength = 25
	},
	WillowMane = {
		P = 30,
		Strength = 30
	},
	SpinyBranchMane = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}