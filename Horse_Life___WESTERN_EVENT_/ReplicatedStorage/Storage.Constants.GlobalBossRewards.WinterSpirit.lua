-- https://lua.expert/
local t = {
	{
		Name = "RandomFoal",
		Amount = 1,
		P = 35,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Amount = 1,
		P = 20,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "RandomEquipment",
		Amount = 1,
		P = 20,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "RandomEquipment",
		Amount = 1,
		P = 20,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "RandomEquipment",
		Amount = 1,
		P = 20,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "RandomEquipment",
		Amount = 1,
		P = 20,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "RandomEquipment",
		Amount = 1,
		P = 20,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "RandomEquipment",
		Amount = 1,
		P = 20,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "RandomEquipment",
		Amount = 1,
		P = 20,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "RandomEquipment",
		Amount = 1,
		P = 20,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "RandomEquipment",
		Amount = 1,
		P = 20,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "FrozenCapsule",
		Amount = 1,
		P = 5,
		DoNotRemove = true
	},
	{
		Name = "FestiveCapsule",
		Amount = 1,
		P = 5,
		DoNotRemove = true
	},
	{
		Name = "FrostMutationPotion",
		Amount = 1,
		P = 5,
		DoNotRemove = true
	},
	{
		Name = "NorthStarMutationPotion",
		Amount = 1,
		P = 5,
		DoNotRemove = true
	},
	{
		Name = "FestiveEyePotion",
		Amount = 1,
		P = 10,
		DoNotRemove = true
	},
	{
		Name = "HornGrowthPotion",
		Amount = 1,
		P = 10,
		DoNotRemove = true
	},
	{
		Name = "TwentysixNewYearsGlasses",
		Amount = 1,
		P = 10,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "NewYearsballoons",
		Amount = 1,
		P = 10,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "NewYearsPartyHat",
		Amount = 1,
		P = 10,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "Sparkler",
		Amount = 1,
		P = 10,
		DoNotRemove = true,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	},
	{
		Name = "NewYearsWingPotion",
		Amount = 1,
		P = 5,
		DoNotRemove = true
	}
}
for i, v in ipairs({
	"AlcesFestiveSaddle",
	"AlcesFestiveSocks",
	"AlcesFestiveBridle",
	"SaurequineFestiveBridle",
	"SaurequineFestiveSocks",
	"SaurequineFestiveSaddle",
	"UnicornFestiveBridle",
	"UnicornFestiveSaddle",
	"UnicornFestiveSocks",
	"HollyhoofFestivelightSaddle",
	"HollyhoofFestivelightSocks",
	"HollyhoofFestivelightBridle",
	"HollyhoofBasicSaddle",
	"HollyhoofBasicSocks",
	"HollyhoofBasicBridle",
	"GargoyleCozySaddle",
	"GargoyleCozySocks",
	"CactalineCozyBridle",
	"CactalineCozySocks",
	"CactalineCozySaddle",
	"FaeCozySaddle",
	"FaeCozySocks",
	"HollyhoofFestiveSaddle",
	"HollyhoofFestiveSocks",
	"HollyhoofFestiveBridle",
	"HollyhoofCozySaddle",
	"HollyhoofCozySocks",
	"SaurequineCozySocks",
	"SaurequineCozySaddle",
	"PolarPlush",
	"CandyCane",
	"StarWand",
	"SnowLantern",
	"IceScepter",
	"PeppermintEarclip",
	"HindGiftStack",
	"MouthStocking",
	"HindPresent",
	"WinterTiara",
	"IceCrown",
	"MistletoeEarclip",
	"SnowOwl",
	"KrampusPlush",
	"FrostbittenAxe",
	"IceboundSceptre",
	"FestiveSnowman",
	"FestiveTopHat",
	"FestiveScroll",
	"ChristmasGiftBag",
	"HollyWreath",
	"StarTopper",
	"SnowflakeBow",
	"PoinsettiaBow",
	"SnowmanSnowglobe",
	"SantaHat",
	"FestiveReindeerAntlers",
	"FestiveRibbonEarpiece",
	"FestiveBell",
	"FestiveTruck",
	"ReindeerPlush",
	"MistletoeMouthpiece",
	"OwlTiara",
	"SnowflakeTiara",
	"NorthStarTiara",
	"OwlAmulet",
	"SnowflakeAmulet",
	"NorthStarAmulet",
	"SnowflakeGuitar",
	"FestiveTeddyBear",
	"PoinsettiaBouquet",
	"ReindeerPlushy",
	"NorthernStarHorn",
	"BabyPenguinPlush",
	"ShatteredIceSychte"
}) do
	table.insert(t, {
		Amount = 1,
		P = 25,
		DoNotRemove = true,
		Name = v,
		Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" }
	})
end
return {
	Drops = t,
	Species = {
		{
			NoMutations = true,
			P = 75,
			Species = { "Alces", "Hollyhoof" },
			Preset = { "AlcesFir", "AlcesRedWhite", "AlcesIceSnap", "AlcesIce" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4
			}
		}
	},
	MutationChances = {
		Glow = 5
	}
}