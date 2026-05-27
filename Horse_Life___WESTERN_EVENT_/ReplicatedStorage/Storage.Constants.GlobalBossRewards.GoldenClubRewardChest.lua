-- https://lua.expert/
local t = {
	{
		Name = "RandomEquipment",
		Theme = "Random",
		Amount = 1,
		P = 50,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Random",
		Amount = 1,
		P = 50,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Random",
		Amount = 1,
		P = 50,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Random",
		Amount = 1,
		P = 50,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Random",
		Amount = 1,
		P = 50,
		DoNotRemove = true
	},
	{
		Name = "GoodBrush",
		Amount = 2,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "Soap",
		Amount = 2,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "BasicFeed",
		Amount = 3,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "PremiumFeed",
		Amount = 3,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "ExclusiveFeed",
		Amount = 3,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "WovenLasso",
		Amount = 3,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "StringLasso",
		Amount = 3,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "StringLasso",
		Amount = 3,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "BraidedLasso",
		Amount = 3,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "GoldLasso",
		Amount = 3,
		P = 25,
		DoNotRemove = true
	}
}
for i, v in ipairs({
	"BookStackYellow",
	"DecorativeHornYellow",
	"EnchantedScrollYellow",
	"MagicGrimoireYellow",
	"NobleBrowbandYellow",
	"QuiltedBagYellow",
	"ScholarsSatchelYellow",
	"ValkyrieHelmetYellow",
	"WingedPendantYellow",
	"BookStackPink",
	"DecorativeHornPink",
	"EnchantedScrollPink",
	"MagicGrimoirePink",
	"NobleBrowbandPink",
	"QuiltedBagPink",
	"ScholarsSatchelPink",
	"ValkyrieHelmetPink",
	"WingedPendantPink",
	"BookStackBlue",
	"DecorativeHornBlue",
	"EnchantedScrollBlue",
	"MagicGrimoireBlue",
	"NobleBrowbandBlue",
	"QuiltedBagBlue",
	"ScholarsSatchelBlue",
	"ValkyrieHelmetBlue",
	"WingedPendantBlue",
	"BookStackPurple",
	"DecorativeHornPurple",
	"EnchantedScrollPurple",
	"MagicGrimoirePurple",
	"NobleBrowbandPurple",
	"QuiltedBagPurple",
	"ScholarsSatchelPurple",
	"ValkyrieHelmetPurple",
	"WingedPendantPurple"
}) do
	table.insert(t, {
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true,
		Name = v
	})
end
return {
	Drops = t
}