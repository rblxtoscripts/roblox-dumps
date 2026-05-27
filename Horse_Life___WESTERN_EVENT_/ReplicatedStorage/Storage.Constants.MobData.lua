-- https://lua.expert/
local tbl = {
	Fairy = {
		MoveSpeed = 30,
		AggroDistance = 65,
		CalmTimer = 1,
		TamingMaxPoints = 20,
		Flier = true,
		MaxDistanceFromSpawn = 100,
		RequiredLasso = { "FairyNet", "MagicFairyNet" }
	},
	Horse = {
		MoveSpeed = 18,
		AggroDistance = 32,
		PreferredFoodRarity = "Common",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Cactaline = {
		MoveSpeed = 25,
		AggroDistance = 32,
		TamingMaxPoints = 12,
		PreferredFoodRarity = "Rare",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35,
		RequiredLasso = { "CactiLasso" }
	},
	Clydesdale = {
		MoveSpeed = 20,
		AggroDistance = 32,
		TamingMaxPoints = 12,
		PreferredFoodRarity = "Rare",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Heartbane = {
		MoveSpeed = 20,
		AggroDistance = 32,
		TamingMaxPoints = 12,
		PreferredFoodRarity = "Rare",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35,
		RequiredLasso = { "RedVelvetLasso" }
	},
	AkhalTeke = {
		MoveSpeed = 20,
		AggroDistance = 32,
		TamingMaxPoints = 12,
		PreferredFoodRarity = "Uncommon",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Cybred = {
		MoveSpeed = 20,
		AggroDistance = 32,
		TamingMaxPoints = 20,
		PreferredFoodRarity = "Common",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Pastrequine = {
		MoveSpeed = 20,
		AggroDistance = 32,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Rare",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35,
		RequiredLasso = { "CakeLasso", "RedVelvetLasso" }
	},
	Celestial = {
		MoveSpeed = 20,
		AggroDistance = 32,
		TamingMaxPoints = 20,
		PreferredFoodRarity = "Common",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Saurequine = {
		MoveSpeed = 20,
		AggroDistance = 32,
		TamingMaxPoints = 20,
		PreferredFoodRarity = "Common",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Wolper = {
		MoveSpeed = 40,
		AggroDistance = 32,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Epic",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35,
		RequiredLasso = { "SpringLasso", "BunnyLasso" }
	},
	Plush = {
		MoveSpeed = 20,
		AggroDistance = 32,
		TamingMaxPoints = 12,
		PreferredFoodRarity = "Common",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Alces = {
		MoveSpeed = 37,
		AggroDistance = 32,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Epic",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35,
		RequiredLasso = { "SnowLasso", "IceLasso" }
	},
	Carousel = {
		MoveSpeed = 37,
		AggroDistance = 32,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Epic",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35,
		RequiredLasso = { "SillyLasso" }
	},
	Ghoulsteed = {
		Ragdolls = true,
		CalmTimer = 3,
		MoveSpeed = 40,
		AggroDistance = 50,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Legendary",
		TamingNeedleSpeed = 200,
		TamingSmallRegionChance = 0.75,
		TamingFailDistance = 70,
		NoiseMultiplier = 2,
		RequiredLasso = { "GhostLasso", "UndeadLasso" }
	},
	Equenari = {
		Charges = true,
		Ragdolls = true,
		CalmTimer = 3,
		MoveSpeed = 40,
		AggroDistance = 50,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Legendary",
		TamingNeedleSpeed = 200,
		TamingSmallRegionChance = 0.75,
		TamingFailDistance = 70,
		NoiseMultiplier = 2,
		RequiredLasso = { "AlienLasso" }
	},
	Crystallion = {
		MoveSpeed = 20,
		AggroDistance = 32,
		TamingMaxPoints = 12,
		PreferredFoodRarity = "Common",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35,
		RequiredLasso = { "CrystalLasso" }
	},
	Pony = {
		MoveSpeed = 42,
		AggroDistance = 40,
		TamingMaxPoints = 6,
		TamingNeedleSpeed = 190,
		TamingSmallRegionChance = 0.25,
		TamingNeedleReverseChance = 1,
		TamingNeedleLastHeartSpeed = 1.5,
		PreferredFoodRarity = "Uncommon"
	},
	Equus = {
		MoveSpeed = 26,
		AggroDistance = 50,
		TamingMaxPoints = 10,
		TamingNeedleSpeed = 200,
		TamingSmallRegionChance = 0.35,
		TamingNeedleReverseChance = 1,
		TamingNeedleLastHeartSpeed = 1.5,
		PreferredFoodRarity = "Uncommon"
	},
	Bisorse = {
		Ragdolls = true,
		MoveSpeed = 30,
		AggroDistance = 65,
		TamingMaxPoints = 10,
		TamingNeedleSpeed = 230,
		TamingSmallRegionChance = 0.35,
		TamingNeedleReverseChance = 1,
		TamingNeedleLastHeartSpeed = 1.5,
		PreferredFoodRarity = "Uncommon",
		RequiredLasso = { "RopeLasso", "WesternLasso" }
	},
	Caprine = {
		Charges = true,
		Ragdolls = true,
		MoveSpeed = 25,
		AggroDistance = 40,
		TamingMaxPoints = 10,
		TamingNeedleSpeed = 240,
		PreferredFoodRarity = "Rare",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35,
		RequiredLasso = { "BrightLasso", "VibrantLasso" }
	},
	Felorse = {
		Charges = true,
		Ragdolls = true,
		MoveSpeed = 40,
		AggroDistance = 50,
		TamingMaxPoints = 10,
		TamingNeedleSpeed = 240,
		PreferredFoodRarity = "Epic",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35,
		RequiredLasso = { "JungleLasso" }
	},
	Unicorn = {
		MoveSpeed = 27,
		AggroDistance = 35,
		TamingMaxPoints = 12,
		TamingNeedleSpeed = 250,
		TamingNeedleLastHeartSpeed = 1.5,
		TamingSmallRegionChance = 0.4,
		TamingNeedleReverseChance = 0.35,
		PreferredFoodRarity = "Rare",
		RequiredLasso = { "WeakMagicLasso", "MagicalLasso" }
	},
	Peryton = {
		MoveSpeed = 27,
		AggroDistance = 40,
		TamingMaxPoints = 12,
		TamingNeedleSpeed = 275,
		TamingSmallRegionChance = 0.5,
		TamingNeedleReverseChance = 0.65,
		TamingNeedleLastHeartSpeed = 1.5,
		PreferredFoodRarity = "Epic",
		Flier = true,
		MaxDistanceFromSpawn = 100,
		RequiredLasso = { "CloudLasso", "MysticCloudLasso" }
	},
	Gargoyle = {
		MoveSpeed = 27,
		AggroDistance = 40,
		TamingMaxPoints = 12,
		TamingNeedleSpeed = 275,
		TamingSmallRegionChance = 0.5,
		TamingNeedleReverseChance = 0.65,
		TamingNeedleLastHeartSpeed = 1.5,
		PreferredFoodRarity = "Epic",
		RequiredLasso = { "StoneLasso", "OvergrownLasso" }
	},
	Kelpie = {
		Ragdolls = true,
		CalmTimer = 1.5,
		MoveSpeed = 40,
		AggroDistance = 50,
		TamingMaxPoints = 12,
		TamingNeedleSpeed = 200,
		TamingSmallRegionChance = 0.75,
		TamingNeedleReverseChance = 0.75,
		TamingNeedleLastHeartSpeed = 1.5,
		PreferredFoodRarity = "Epic",
		RequiredLasso = { "KelpLasso" }
	},
	Kirin = {
		MoveSpeed = 26,
		AggroDistance = 32,
		TamingMaxPoints = 20,
		RequiredLasso = {}
	},
	Fae = {
		CalmTimer = 4,
		MoveSpeed = 65,
		AggroDistance = 100,
		TamingMaxPoints = 15,
		PreferredFoodRarity = "Rare",
		TamingNeedleSpeed = 250,
		TamingSmallRegionChance = 0.75,
		TamingNeedleReverseChance = 1,
		TamingNeedleLastHeartSpeed = 1.5,
		TamingFailDistance = 70,
		NoiseMultiplier = 3,
		AttackSpeed = 90,
		RequiredLasso = { "WebLasso", "MysticWebLasso" }
	},
	Hippocampus = {
		CalmTimer = 4,
		MoveSpeed = 65,
		AggroDistance = 100,
		TamingMaxPoints = 18,
		PreferredFoodRarity = "Rare",
		TamingNeedleSpeed = 250,
		TamingSmallRegionChance = 0.75,
		TamingNeedleReverseChance = 1,
		TamingNeedleLastHeartSpeed = 1.5,
		TamingFailDistance = 70,
		NoiseMultiplier = 3,
		AttackSpeed = 90,
		RequiredLasso = { "WaterLasso", "OceanLasso" }
	},
	Flora = {
		CalmTimer = 3,
		MoveSpeed = 20,
		AggroDistance = 32,
		TamingMaxPoints = 15,
		PreferredFoodRarity = "Epic",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35,
		RequiredLasso = { "FlowerLasso", "RoseLasso" }
	},
	Hauntmare = {
		Charges = true,
		Ragdolls = true,
		CalmTimer = 3,
		MoveSpeed = 40,
		AggroDistance = 50,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Legendary",
		TamingNeedleSpeed = 200,
		TamingSmallRegionChance = 0.75,
		TamingFailDistance = 70,
		NoiseMultiplier = 2,
		RequiredLasso = { "GhostLasso", "UndeadLasso" }
	},
	Seraph = {
		Charges = true,
		Ragdolls = true,
		CalmTimer = 3,
		MoveSpeed = 40,
		AggroDistance = 50,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Legendary",
		TamingNeedleSpeed = 200,
		TamingSmallRegionChance = 0.75,
		TamingFailDistance = 70,
		NoiseMultiplier = 2
	},
	Nephyrian = {
		Charges = true,
		Ragdolls = true,
		CalmTimer = 3,
		MoveSpeed = 40,
		AggroDistance = 50,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Legendary",
		TamingNeedleSpeed = 200,
		TamingSmallRegionChance = 0.75,
		TamingFailDistance = 70,
		NoiseMultiplier = 2
	},
	Anticorn = {
		Charges = true,
		Ragdolls = true,
		CalmTimer = 3,
		MoveSpeed = 37,
		AggroDistance = 40,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Legendary",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Hollyhoof = {
		CalmTimer = 3,
		MoveSpeed = 40,
		AggroDistance = 40,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Legendary",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Horlse = {
		CalmTimer = 3,
		MoveSpeed = 40,
		AggroDistance = 40,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Legendary",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Friesian = {
		CalmTimer = 3,
		MoveSpeed = 40,
		AggroDistance = 40,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Epic",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Fjord = {
		CalmTimer = 3,
		MoveSpeed = 40,
		AggroDistance = 40,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Epic",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Honeytrot = {
		CalmTimer = 3,
		MoveSpeed = 40,
		AggroDistance = 40,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Legendary",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Caniquine = {
		CalmTimer = 3,
		MoveSpeed = 40,
		AggroDistance = 40,
		TamingMaxPoints = 25,
		PreferredFoodRarity = "Epic",
		TamingNeedleReverseChance = 0,
		TamingNeedleLastHeartSpeed = 1.35
	},
	Horse_Boss = {
		Charges = true,
		Ragdolls = true,
		MoveSpeed = 45,
		AggroDistance = 100,
		TamingMaxPoints = 2,
		Attacks = { "Slam", "Meteor", "Jump", "Fireball", "Spin", "SpikeSpawn" }
	}
}
local t = {
	AwakeMaxRange = 300,
	AsleepMinRange = 250,
	MoveSpeed = 16,
	AggroDistance = 32,
	CalmTimer = 5,
	TamingMaxPoints = 5,
	TamingStartPoints = 1,
	TamingTimer = 180,
	TamingNeedleSpeed = 180,
	TamingSmallRegionChance = 0.25,
	TamingNeedleReverseChance = 0.25,
	TamingNeedleLastHeartSpeed = 1.5
}
for k, v in pairs(tbl) do
	setmetatable(v, {
		__index = t
	})
	v.Name = k
end
setmetatable(tbl, {
	__index = function(p1) --[[ __index | Line: 528 | Upvalues: tbl (copy), t (copy) ]]
		return rawget(tbl, p1) or t
	end
})
return tbl