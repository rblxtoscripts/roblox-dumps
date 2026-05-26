-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	Index = 13,
	DiscoveryPreset = "CybredRed",
	Rarity = "Exclusive",
	Strength = 2,
	PriceMultiplier = 1.5,
	Scale = 1,
	InSeasonStart = "November",
	InSeasonEnd = "December",
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://72398037358765",
			Volume = 0.4,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 3,
		Speed = 0.25,
		SprintSpeed = 39,
		WalkAnimationSpeed = 1.3,
		TrotAnimationSpeed = 1.25,
		CanterAnimationSpeed = 1.75,
		GallopAnimationSpeed = 2,
		RaceSprintAnimationSpeed = 1.575,
		JumpHeight = 1,
		GrowTime = 2100,
		Stamina = 75,
		StaminaRegen = 1,
		BreedCooldown = 43200,
		BreedWait = 43200,
		HarvestStrength = 1,
		FlyStaminaMultiplier = 1
	},
	WildWingWhitelist = {
		SteampunkBatWings = true,
		FuturisticWings = true,
		CyberWings = true,
		AeroFlapWings = true
	},
	CallSounds = {
		Whinny1 = {
			Id = "rbxassetid://105110552322001"
		},
		Neigh1 = {
			Id = "rbxassetid://72398037358765"
		},
		Neigh2 = {
			Id = "rbxassetid://96013214678111"
		},
		Neigh3 = {
			Id = "rbxassetid://92764252513912"
		},
		Snort1 = {
			Id = "rbxassetid://105110552322001"
		},
		Snort2 = {
			Id = "rbxassetid://96013214678111"
		},
		Snort3 = {
			Id = "rbxassetid://72398037358765"
		}
	},
	Upgrades = {
		Agility = {
			Increment = 0.25 / UpgradeStats.Agility.MaxLevel,
			TurnSpeed = {
				Increment = 0.25 / UpgradeStats.Agility.MaxLevel * 0.1
			}
		},
		Fertility = {
			Increment = -(0.35 / UpgradeStats.Fertility.MaxLevel)
		},
		Jump = {
			Increment = 0.25 / UpgradeStats.Jump.MaxLevel
		},
		Strength = {
			Increment = 10 / UpgradeStats.Strength.MaxLevel
		}
	},
	Animations = {
		Reverse = "rbxassetid://15740097756",
		Brake = "rbxassetid://15742189205",
		Idle = "rbxassetid://15707335363",
		Walk = "rbxassetid://15740097756",
		Trot = "rbxassetid://17725498938",
		Canter = "rbxassetid://18135224859",
		Gallop = "rbxassetid://18135183368",
		RaceSprint = "rbxassetid://18135279123",
		Jump = "rbxassetid://17725570214",
		Fall = "rbxassetid://17725588482",
		JumpBuck = "rbxassetid://15743233075",
		ShortBuck = "rbxassetid://15743443276",
		RearKick = "rbxassetid://15743138561",
		Rear = "rbxassetid://96928784415345",
		Collapse = "rbxassetid://16541638529",
		Lay = "rbxassetid://15841678580",
		Sit = "rbxassetid://15841722583",
		HappyStomp = "rbxassetid://15841882483",
		Piaffe = "rbxassetid://17727301864",
		HeadShake = "rbxassetid://15853866224",
		HoofDig = "rbxassetid://15853934772",
		LegRest = "rbxassetid://16138403342",
		LiftedSit = "rbxassetid://16139256552",
		Blink = "rbxassetid://16142584742",
		FlyForward = "rbxassetid://16621455978",
		FlyIdle = "rbxassetid://16621573019",
		Dive = "rbxassetid://16621522365",
		Glide = "rbxassetid://16621608189"
	}
}