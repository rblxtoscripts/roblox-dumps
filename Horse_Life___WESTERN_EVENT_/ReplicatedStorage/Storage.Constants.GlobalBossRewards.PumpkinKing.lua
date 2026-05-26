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
		Theme = "Pumpkin",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "SpookyCapsule",
		Amount = 1,
		P = 20,
		DoNotRemove = true
	},
	{
		Name = "PumpkinPlush",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "CandledPumpkin",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "GhoulsteedPumpkinSocks",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "GhoulsteedPumpkinSaddle",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "GhoulsteedPumpkinBridle",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "HindPumpkin",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "ScaryPumpkin",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "SillyPumpkin",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "HonsePumpkinpail",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "FloatingPumpkins",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	}
}
for i, v in ipairs({
	"GhoulsteedBasicSaddle",
	"GhoulsteedBasicSocks",
	"GhoulsteedBasicBridle",
	"MedievalLance",
	"ScaryPumpkin",
	"SillyPumpkin",
	"OwlPlush",
	"MushroomWitch",
	"WitchHat",
	"HarvestWitch",
	"BatPlush",
	"PumpkinPlush",
	"SunflowerCrown",
	"FloatingCandleCrown",
	"PoisonApple",
	"CaramelApple",
	"VampireScythe",
	"MageStaff",
	"WitchBroom",
	"DeathScythe",
	"Scarecrow",
	"SpiderPlush",
	"LunarWitch",
	"BowBatEarClip",
	"CrossboneEarClip",
	"CrowFamiliar",
	"CrowPlush",
	"VampiricAmulet",
	"MagicPotion",
	"WretchedTree",
	"MapleLeaf",
	"PossessedWitch",
	"EyeBat",
	"CoffinEarClip",
	"BatWingHeadband",
	"WitchesCauldron",
	"CatFamiliar",
	"CandleFamiliar",
	"CandledPumpkin",
	"GhostFamiliar",
	"HonsePumpkinpail",
	"OceanWitchHat",
	"HindPumpkin",
	"BoneWitchHat",
	"WerewolfWitchHat",
	"CandyWitchHat"
}) do
	table.insert(t, {
		Theme = "Pumpkin",
		Amount = 1,
		P = 25,
		DoNotRemove = true,
		Name = v
	})
end
return {
	Drops = t,
	Species = {
		{
			NoMutations = true,
			P = 75,
			Species = { "Hauntmare", "Ghoulsteed" },
			Preset = { "GhoulPumpkin", "OrangeGreen" },
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