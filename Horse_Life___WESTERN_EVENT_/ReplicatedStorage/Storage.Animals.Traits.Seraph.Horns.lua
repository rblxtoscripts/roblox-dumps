-- https://lua.expert/
local t = {
	Nothing = {
		P = 30,
		Strength = 30
	},
	GuildedHorn = {
		P = 15,
		Strength = 15
	},
	SharpHorn = {
		P = 20,
		Strength = 20
	},
	CursedHorn = {
		P = 10,
		Strength = 10
	},
	SCorruptedHorn = {
		DisplayName = "CorruptedHorn",
		P = 15,
		Strength = 15
	},
	DemonicHorns = {
		P = 15,
		Strength = 15
	},
	GildedHorn = {
		P = 20,
		Strength = 20
	},
	LeakingHorn = {
		P = 10,
		Strength = 10
	},
	LunarisHorn = {
		P = 20,
		Strength = 20
	},
	StellarisHorn = {
		P = 10,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}