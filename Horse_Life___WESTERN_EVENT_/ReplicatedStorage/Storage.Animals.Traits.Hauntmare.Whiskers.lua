-- https://lua.expert/
local t = {
	Nothing = {
		P = 30,
		Strength = 30
	},
	DraconicHeadAura = {
		P = 40,
		Strength = 40
	},
	GhostlyHeadAura = {
		P = 50,
		Strength = 50
	},
	EquineHeadAura = {
		P = 40,
		Strength = 40
	},
	MawAura = {
		P = 45,
		Strength = 45
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Whiskers"
end
return {
	Whiskers = t
}