-- https://lua.expert/
local tbl = {
	CrystalLasso = 150,
	RoyalWingPotion = 30000,
	CrystallionBasicSaddle = 5000,
	CrystallionBasicBridle = 4000,
	CrystallionBasicSocks = 3000,
	StarrySkirt = 1500,
	ElegantCrystalScythe = 5000,
	ElegantCrystalLantern = 4000,
	PrincessTiara = 1500,
	KingsCrown = 2000,
	RoyalScythe = 3000,
	QueensCrown = 2000,
	DelicateFan = 750,
	RoyalViolin = 3000,
	KingsSword = 2000,
	KnightLongsword = 1000,
	RoyalTeapot = 750,
	PrincessBackBow = 1000,
	DelicateParasol = 2500,
	CrystalScepter = 2000,
	FancyFrillsHat = 1500,
	CrystalEarclip = 1000,
	SillyMustache = 500,
	CuteRibbonsParasol = 5000,
	RoyalBackBow = 3000,
	PrincessHat = 1500,
	QueensScepter = 2500,
	RoyalInsignia = 750,
	SharpCrystalScythe = 4000,
	AfternoonTea = 5000,
	RoyalBall = 5000,
	OpalGlow = 5000,
	FloatingCrowns = 3000,
	FloatingGeodes = 3000,
	RoyalMutationPotion = 15000
}
for k, v in pairs(tbl) do
	if type(v) == "table" then
		v.Name = k
	end
end
return tbl