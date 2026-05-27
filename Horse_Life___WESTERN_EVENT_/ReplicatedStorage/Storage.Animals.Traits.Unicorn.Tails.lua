-- https://lua.expert/
local t = {
	CurlTailFur = {
		P = 25,
		Strength = 25
	},
	WhispyTail = {
		P = 25,
		Strength = 25
	},
	HalfTailFur = {
		P = 25,
		Strength = 25
	},
	ShortCurlyTail = {
		P = 25,
		Strength = 25
	},
	ShortTuftTail = {
		P = 25,
		Strength = 25
	},
	RidgeTailTufts = {
		P = 25,
		Strength = 25
	},
	ElvenTail = {
		P = 15,
		Strength = 15
	},
	CurlyFullTail = {
		P = 10,
		Strength = 10
	},
	GloomyTail = {
		P = 25,
		Strength = 25
	},
	SparseTail = {
		P = 25,
		Strength = 25
	},
	ElysianTail = {
		P = 15,
		Strength = 15
	},
	WindSweptTail = {
		P = 15,
		Strength = 15
	},
	OkapiTail = {
		P = 5,
		Strength = 15
	},
	UFadedTail = {
		DisplayName = "FadedTail",
		P = 5,
		Strength = 15
	},
	CorruptedTail = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}