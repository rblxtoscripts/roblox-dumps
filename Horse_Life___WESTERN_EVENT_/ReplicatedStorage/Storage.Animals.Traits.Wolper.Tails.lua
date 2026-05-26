-- https://lua.expert/
local t = {
	BandedTail = {
		P = 25,
		Strength = 40
	},
	SpringTideTail = {
		P = 25,
		Strength = 40
	},
	BrushTail = {
		P = 25,
		Strength = 40
	},
	LavishTail = {
		P = 25,
		Strength = 40
	},
	FeatheredTail = {
		P = 25,
		Strength = 40
	},
	CabbageTail = {
		P = 25,
		Strength = 40
	},
	SquirrelTail = {
		P = 25,
		Strength = 40
	},
	ThistletuftTail = {
		P = 25,
		Strength = 40
	},
	SkvaderTail = {
		P = 25,
		Strength = 40
	},
	MottledTail = {
		P = 25,
		Strength = 40
	},
	WildLettuceTail = {
		P = 25,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}