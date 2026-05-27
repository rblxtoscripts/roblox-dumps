-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	RequiresBreedPermission = "AlcesBreedingLicense",
	Event = true,
	DiscoveryPreset = "AlcesIceSnap",
	Rarity = "Event",
	Strength = 2.5,
	PriceMultiplier = 1.75,
	Scale = 1.4,
	InSeasonStart = "December",
	InSeasonEnd = "February",
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://75674085083174",
			Volume = 0.4,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 5,
		Speed = 0.1,
		SprintSpeed = 36,
		WalkAnimationSpeed = 1.5,
		TrotAnimationSpeed = 1.25,
		CanterAnimationSpeed = 1.6,
		GallopAnimationSpeed = 1.7,
		RaceSprintAnimationSpeed = 1.575,
		JumpHeight = 1.05,
		GrowTime = 1500,
		Stamina = 175,
		StaminaRegen = 0.75,
		BreedCooldown = 126000,
		BreedWait = 86400,
		HarvestStrength = 1.5,
		FlyStaminaMultiplier = 1
	},
	CallSounds = {
		Whinny1 = {
			Id = "rbxassetid://76219858754747"
		},
		Neigh1 = {
			Id = "rbxassetid://76219858754747"
		},
		Neigh2 = {
			Id = "rbxassetid://75674085083174"
		},
		Neigh3 = {
			Id = "rbxassetid://127324530891327"
		},
		Snort1 = {
			Id = "rbxassetid://128631706043390"
		},
		Snort2 = {
			Id = "rbxassetid://128631706043390"
		},
		Snort3 = {
			Id = "rbxassetid://128631706043390"
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
		Walk = "rbxassetid://79763785266955",
		Trot = "rbxassetid://93811215528215",
		Canter = "rbxassetid://90467835210227",
		Gallop = "rbxassetid://80135315929660",
		RaceSprint = "rbxassetid://18135279123",
		Jump = "rbxassetid://17725570214",
		Fall = "rbxassetid://17725588482",
		JumpBuck = "rbxassetid://15743138561",
		ShortBuck = "rbxassetid://15743443276",
		RearKick = "rbxassetid://135737641620548",
		Rear = "rbxassetid://96928784415345",
		Collapse = "rbxassetid://16541638529",
		Lay = "rbxassetid://15841678580",
		Sit = "rbxassetid://15841722583",
		HappyStomp = "rbxassetid://15841882483",
		HeadShake = "rbxassetid://15853866224",
		Piaffe = "rbxassetid://17727301864",
		HoofDig = "rbxassetid://98791490900967",
		LegRest = "rbxassetid://16138403342",
		LiftedSit = "rbxassetid://16139256552",
		Blink = "rbxassetid://16142584742",
		FlyForward = "rbxassetid://16621455978",
		FlyIdle = "rbxassetid://16621573019",
		Dive = "rbxassetid://16621522365",
		Glide = "rbxassetid://16621608189"
	}
}