-- https://lua.expert/
local t = {
	EelMane = {
		P = 30,
		Strength = 30
	},
	ArowanaMane = {
		P = 30,
		Strength = 30
	},
	MermaidMane = {
		P = 30,
		Strength = 30
	},
	StripedHeadMane = {
		P = 30,
		Strength = 30
	},
	SeahorseMane = {
		P = 30,
		Strength = 30
	},
	MermaidFairyMane = {
		P = 30,
		Strength = 30
	},
	BettaMane = {
		P = 30,
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