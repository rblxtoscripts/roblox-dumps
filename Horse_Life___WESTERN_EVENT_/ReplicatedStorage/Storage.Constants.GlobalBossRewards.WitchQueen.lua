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
		Theme = "WitchPotion",
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
		Name = "MushroomWitch",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "WitchHat",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "HarvestWitch",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "WitchBroom",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "LunarWitch",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "PossessedWitch",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "WitchesCauldron",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "OceanWitchHat",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "BoneWitchHat",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "WerewolfWitchHat",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "CandyWitchHat",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "CactalineNecromancerSaddle",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "CactalineNecromancerBridle",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "CactalineNecromancerSocks",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "PerytonRavenSaddle",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "PerytonRavenBridle",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "PerytonRavenSocks",
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
		Theme = "WitchPotion",
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
			Preset = { "GhoulBat", "HauntVoid" },
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