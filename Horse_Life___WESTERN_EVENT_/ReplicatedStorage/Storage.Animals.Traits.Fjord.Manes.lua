-- https://lua.expert/
local t = {
	FJScruffyMane = {
		DisplayName = "ScruffyMane",
		P = 20,
		Strength = 20
	},
	FJSmoothMane = {
		DisplayName = "SmoothMane",
		P = 20,
		Strength = 20
	},
	CastleCut = {
		P = 30,
		Strength = 30
	},
	TriangleCut = {
		P = 30,
		Strength = 30
	},
	StandardCut = {
		P = 30,
		Strength = 30
	},
	DarkCutMane = {
		P = 30,
		Strength = 30
	},
	FuneralBand = {
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