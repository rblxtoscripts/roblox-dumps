-- https://lua.expert/
local tbl = {
	UnicornHorn = 850,
	Cap = 700,
	OliveGreenCap = 700,
	Sunglasses = 550,
	HeartBow = 950,
	Crown = 950,
	Broom = 200,
	Flower = 850,
	FlowerCrown = 950,
	WhiteFlowerCrown = 950,
	Fedora = 950,
	RainHat = 850,
	AlienAntenna = 950,
	LPartyHat = 850,
	BrightPinkLPartyHat = 850,
	TopHat = 750,
	BlackTopHat = 750,
	HeartClip = 950,
	CoolYellowHeartClip = 950,
	Propeller = 850,
	Antler = 950,
	Rosette1 = 950,
	Rosette2 = 750
}
for k, v in pairs(tbl) do
	if type(v) == "table" then
		v.Name = k
	end
end
return tbl