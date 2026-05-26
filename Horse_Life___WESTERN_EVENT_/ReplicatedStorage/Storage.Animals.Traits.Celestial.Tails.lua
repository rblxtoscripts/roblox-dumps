-- https://lua.expert/
local t = {
	CelestialWavyTail = {
		P = 25,
		Strength = 25
	},
	StarryTail = {
		P = 25,
		Strength = 25
	},
	WindsweptTail = {
		P = 25,
		Strength = 25
	},
	LunarTail = {
		P = 25,
		Strength = 25
	},
	StarfireTail = {
		P = 25,
		Strength = 25
	},
	StarrySkeletonTail = {
		P = 25,
		Strength = 25
	},
	BlackholeCrecentTail = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}