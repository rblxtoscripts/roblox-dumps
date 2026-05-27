-- https://lua.expert/
local tbl = {
	AlienLasso = 150,
	AlienWingPotion = 20000,
	EquenariBasicSaddle = 2500,
	EquenariBasicBridle = 2000,
	EquenariBasicSocks = 1500,
	ContingencyArmorSaddle = 3000,
	ContingencyArmorBridle = 2500,
	ContingencyArmorSocks = 2000,
	StarCommander = 1500,
	AlienHood = 1000,
	IntergalacticHeadset = 1500,
	AlienGrub = 1500,
	AlienCat = 1000,
	StarScythe = 2000,
	XenoreaperScythe = 2000,
	SwordOfSaturn = 1750,
	AlienRaygun = 1750,
	AlienAntennae = 1000,
	UFOAccessory = 1000,
	UFOHat = 1500,
	AlienShades = 1000,
	PlasmaSaber = 2000,
	SpaceWarp = 2000,
	SpaceSpill = 2000,
	WishingStar = 2000,
	AlienMutationPotion = 8000
}
for k, v in pairs(tbl) do
	if type(v) == "table" then
		v.Name = k
	end
end
return tbl