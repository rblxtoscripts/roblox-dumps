-- https://lua.expert/
local tbl = {
	GlowHoof = {
		Type = "Glow",
		P = 0,
		Material = "Neon",
		Strength = 2,
		Targets = { "Hoof" }
	},
	GlowPattern = {
		Type = "Glow",
		P = 0,
		Material = "Neon",
		Strength = 2,
		Targets = { "Pattern" }
	},
	GlowCosmetic = {
		DisplayName = "GlowSock",
		Type = "Glow",
		P = 0,
		Material = "Neon",
		Strength = 2,
		Targets = { "Sock" }
	},
	GlowPaint = {
		Type = "Glow",
		P = 0,
		Material = "Neon",
		Strength = 2,
		Targets = { "Paint" }
	},
	GlowHair = {
		Type = "Glow",
		P = 0,
		Material = "Neon",
		Strength = 2,
		Targets = { "Hair" }
	},
	GlowKeratin = {
		Type = "Glow",
		P = 0,
		Strength = 2,
		Material = "Neon",
		Targets = { "Keratin" }
	},
	GlowingEyes = {
		Type = "Glow",
		P = 0,
		Strength = 2,
		Material = "Neon",
		Texture = "",
		Targets = { "Eye" }
	}
}
for k, v in pairs(tbl) do
	v.Name = k
	v.Priority = 0
	v.Material = "Neon"
end
return tbl