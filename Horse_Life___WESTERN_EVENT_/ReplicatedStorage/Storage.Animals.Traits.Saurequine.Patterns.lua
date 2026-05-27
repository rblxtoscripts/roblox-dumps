-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	StegoPatching = {
		P = 25,
		Strength = 25
	},
	SmokePattern = {
		P = 30,
		Strength = 30
	},
	ParaSplotches = {
		P = 25,
		Strength = 25
	},
	PrehistoricStripe = {
		P = 30,
		Strength = 30
	},
	Rippled = {
		P = 35,
		Strength = 35
	},
	Plated = {
		P = 25,
		Strength = 25
	},
	PrehistoricMarbling = {
		P = 25,
		Strength = 25
	},
	SableStripes = {
		P = 25,
		Strength = 25
	},
	Plated = {
		P = 25,
		Strength = 25
	},
	VeilPattern = {
		P = 25,
		Strength = 25
	},
	BandedBack = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}