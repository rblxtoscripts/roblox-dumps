-- https://lua.expert/
local t = {
	Pony = {},
	Bisorse = {},
	Alces = {},
	AkhalTeke = {},
	Caprine = {},
	Clydesdale = {},
	Cactaline = {},
	Crystallion = {},
	Carousel = {},
	Celestial = {},
	Equus = {},
	Equenari = {},
	Fae = {},
	Felorse = {},
	Kirin = {},
	Flora = {},
	Gargoyle = {},
	Ghoulsteed = {},
	Kelpie = {},
	Hippocampus = {},
	Pastrequine = {},
	Peryton = {},
	Plush = {},
	Pony = {},
	Saurequine = {},
	Unicorn = {},
	Wolper = {},
	Cybred = {},
	Hauntmare = {},
	Seraph = {},
	Anticorn = {},
	Hollyhoof = {},
	Friesian = {},
	Horlse = {},
	Heartbane = {},
	Honeytrot = {},
	Caniquine = {},
	Serpentina = {},
	Nephyrian = {}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "SpeciesPatterns"
end
return {
	SpeciesPatterns = t
}