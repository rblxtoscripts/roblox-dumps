-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 50
	},
	StarryWhiskers = {
		P = 20,
		Strength = 20
	},
	CurlyWhiskers = {
		P = 20,
		Strength = 20
	},
	DroopyWhiskers = {
		P = 20,
		Strength = 20
	},
	LongWhiskers = {
		P = 20,
		Strength = 20
	},
	ShortWhiskers = {
		P = 20,
		Strength = 20
	},
	TwistedWhiskers = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Whiskers"
end
return {
	Whiskers = t
}