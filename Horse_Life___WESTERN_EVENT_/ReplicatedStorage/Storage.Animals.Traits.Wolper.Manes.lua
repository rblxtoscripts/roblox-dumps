-- https://lua.expert/
local t = {
	BandedMane = {
		P = 40,
		Strength = 40
	},
	SpringTideMane = {
		P = 40,
		Strength = 40
	},
	LavishMane = {
		P = 25,
		Strength = 25
	},
	CabbageMane = {
		P = 25,
		Strength = 25
	},
	WhisperfurMane = {
		P = 25,
		Strength = 25
	},
	SkvaderFeatherMane = {
		P = 25,
		Strength = 25
	},
	MottledMane = {
		P = 25,
		Strength = 25
	},
	WildLettuceMane = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}