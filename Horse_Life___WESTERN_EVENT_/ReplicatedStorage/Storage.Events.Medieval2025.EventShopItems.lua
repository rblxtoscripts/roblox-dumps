-- https://lua.expert/
local tbl = {
	CakeLasso = 250,
	RedVelvetLasso = 300,
	PastrequineBasicSaddle = 2000,
	PastrequineBasicSocks = 1000,
	PastrequineBasicBridle = 750,
	SweetWingPotion = 25000,
	LoveMutationPotion = 15000,
	HeartKeeperKey = 2500,
	EternalRose = 5000,
	CupidsBow = 4000,
	CupidStaff = 3500,
	ValentinesFork = 4000,
	CherubsMist = 700,
	HeartShades = 200,
	DarkCupidLantern = 2000,
	HeartStaff = 2500,
	CupidsHeadwings = 300,
	CupidsArrow = 1250,
	HeartBox = 200,
	LovesickSycthe = 7500,
	ValentinesArrow = 250,
	LovingBow = 500,
	LovingTeddyBear = 500,
	LoveLetterBag = 1000,
	CupidsRibbonBow = 500,
	ValentinesLantern = 1000,
	LoveLetter = 250,
	HeartSickle = 500,
	SweetHeartPurse = 750,
	LovelyHeartBass = 2000,
	Cake = 5000,
	Candy = 5000,
	Adoration = 5000,
	Heartbreak = 5000,
	InLove = 2500,
	ChocolateHearts = 3500,
	ChocolatePinkHearts = 3500,
	LoveTrail = 2500
}
for k, v in pairs(tbl) do
	if type(v) == "table" then
		v.Name = k
	end
end
return tbl