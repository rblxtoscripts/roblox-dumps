-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 40
	},
	KitsuneWhiskers = {
		P = 25,
		Strength = 25
	},
	RibbonWhiskers = {
		P = 35,
		Strength = 35
	},
	ThinWhiskers = {
		P = 50,
		Strength = 50
	},
	WindcharmWhiskers = {
		P = 35,
		Strength = 35
	},
	EmperorWhiskers = {
		P = 35,
		Strength = 35
	},
	EasternDragonWhiskers = {
		P = 35,
		Strength = 35
	},
	ThickFurryWhiskers = {
		P = 35,
		Strength = 35
	},
	HeartWhiskers = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Whiskers"
end
return {
	Whiskers = t
}