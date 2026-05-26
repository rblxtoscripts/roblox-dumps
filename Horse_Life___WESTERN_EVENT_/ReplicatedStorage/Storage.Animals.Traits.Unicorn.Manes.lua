-- https://lua.expert/
local t = {
	MessyMane = {
		P = 25,
		Strength = 25
	},
	LongWavyMane = {
		P = 25,
		Strength = 25
	},
	ShortFurMane = {
		P = 25,
		Strength = 25
	},
	ShortCurlyMane = {
		P = 25,
		Strength = 25
	},
	FullLongMane = {
		P = 25,
		Strength = 25
	},
	BushyNeckFur = {
		P = 15,
		Strength = 15
	},
	ElvenHair = {
		P = 15,
		Strength = 15
	},
	GloomyMane = {
		P = 15,
		Strength = 15
	},
	SparseMane = {
		P = 15,
		Strength = 15
	},
	WindSweptMane = {
		P = 15,
		Strength = 10
	},
	ElysianMane = {
		P = 15,
		Strength = 10
	},
	OkapiMane = {
		P = 5,
		Strength = 10
	},
	UFadedMane = {
		DisplayName = "FadedMane",
		P = 5,
		Strength = 10
	},
	CorruptedMane = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}