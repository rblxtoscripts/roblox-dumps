-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 35
	},
	KoiFishFins = {
		P = 35,
		Strength = 35
	},
	MermaidFaceFins = {
		P = 35,
		Strength = 35
	},
	MermaidFins = {
		P = 35,
		Strength = 35
	},
	MermaidNeckFins = {
		P = 35,
		Strength = 35
	},
	ArowanaBackFins = {
		P = 35,
		Strength = 35
	},
	ArowanaFrontFins = {
		P = 35,
		Strength = 35
	},
	SeahorseBackFins = {
		P = 35,
		Strength = 35
	},
	SmallOrcaFins = {
		P = 40,
		Strength = 40
	},
	OrcaFin = {
		P = 30,
		Strength = 30
	},
	SeahorseBodyFins = {
		P = 35,
		Strength = 35
	},
	SeahorseFaceFins = {
		P = 35,
		Strength = 35
	},
	SeahorseLegFins = {
		P = 35,
		Strength = 35
	},
	MermaidFairyBackFins = {
		P = 35,
		Strength = 35
	},
	MermaidFairyBodyFins = {
		P = 35,
		Strength = 35
	},
	MermaidFairyFaceFins = {
		P = 35,
		Strength = 35
	},
	MermaidFairyLegFins = {
		P = 35,
		Strength = 35
	},
	MermaidFairySideFins = {
		P = 35,
		Strength = 35
	},
	BettaChestFins = {
		P = 40,
		Strength = 40
	},
	BettaLegFins = {
		P = 35,
		Strength = 35
	},
	BettaShoulderFins = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}