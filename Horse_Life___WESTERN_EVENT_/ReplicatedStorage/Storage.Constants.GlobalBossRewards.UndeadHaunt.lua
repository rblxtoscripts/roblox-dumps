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
		Theme = "Ghoul",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "HauntmareCapsule",
		Amount = 1,
		P = 10,
		DoNotRemove = true
	},
	{
		Name = "GhoulsteedCapsule",
		Amount = 1,
		P = 10,
		DoNotRemove = true
	},
	{
		Name = "SpookyWingPotion",
		Amount = 1,
		P = 15,
		DoNotRemove = true
	},
	{
		Name = "HauntedMutationPotion",
		Amount = 1,
		P = 15,
		DoNotRemove = true
	},
	{
		Name = "CandleFamiliar",
		Theme = "Random",
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
		Name = "CactalineNecromancerSocks",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "CactalineNecromancerSaddle",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "CactalineNecromancerBridle",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "FloatingCandleCrown",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "GhostFamiliar",
		Theme = "Random",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "Ghost",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "GhostTrail",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "Haunted",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "Possessed",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "Haunted",
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
		Theme = "Ghoul",
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
			Preset = { "GhoulUndead" },
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