-- https://lua.expert/
local t = {
	StegoTail = {
		P = 25,
		Strength = 25
	},
	AnkyTail = {
		P = 30,
		Strength = 30
	},
	UtahTail = {
		P = 35,
		Strength = 35
	},
	RaptorTail = {
		P = 30,
		Strength = 30
	},
	ParaTail = {
		P = 25,
		Strength = 25
	},
	FurTipTail = {
		P = 35,
		Strength = 35
	},
	BrontoTail = {
		P = 35,
		Strength = 35
	},
	SplotchedTail = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}