-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	RequiresBreedPermission = "EquenariBreedingLicense",
	Event = true,
	DiscoveryPreset = "EquenSea",
	Rarity = "Event",
	Strength = 2.5,
	PriceMultiplier = 1.75,
	Scale = 1.1,
	InSeasonStart = "November",
	InSeasonEnd = "January",
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://77359628344093",
			Volume = 1,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		LassoTame = 10,
		TurnSpeed = 3.5,
		Speed = 0.1,
		SprintSpeed = 37,
		WalkAnimationSpeed = 1.325,
		TrotAnimationSpeed = 1.25,
		CanterAnimationSpeed = 1.75,
		GallopAnimationSpeed = 2,
		RaceSprintAnimationSpeed = 1.575,
		JumpHeight = 1,
		GrowTime = 1200,
		Stamina = 100,
		StaminaRegen = 1,
		BreedCooldown = 18000,
		BreedWait = 86400,
		HarvestStrength = 1,
		FlyStaminaMultiplier = 1
	},
	WildWingWhitelist = {
		ExtraterrestrialAnomalyWings = true,
		EldritchWings = true,
		MutatedTendrilWings = true,
		FishEyedWings = true
	},
	CallSounds = {
		Whinny1 = {
			Id = "rbxassetid://118853329887169"
		},
		Neigh1 = {
			Id = "rbxassetid://77359628344093"
		},
		Neigh2 = {
			Id = "rbxassetid://118853329887169"
		},
		Neigh3 = {
			Id = "rbxassetid://102935177043025"
		},
		Snort1 = {
			Id = "rbxassetid://102935177043025"
		},
		Snort2 = {
			Id = "rbxassetid://135850454843002"
		},
		Snort3 = {
			Id = "rbxassetid://135850454843002"
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
		Reverse = "rbxassetid://84586648612671",
		Brake = "rbxassetid://15742189205",
		Idle = "rbxassetid://73708523811420",
		Walk = "rbxassetid://84586648612671",
		Trot = "rbxassetid://88258834906306",
		Canter = "rbxassetid://18135224859",
		Gallop = "rbxassetid://18135183368",
		RaceSprint = "rbxassetid://18135279123",
		Jump = "rbxassetid://17725570214",
		Fall = "rbxassetid://17725588482",
		JumpBuck = "rbxassetid://15743233075",
		ShortBuck = "rbxassetid://15743443276",
		RearKick = "rbxassetid://15743138561",
		Rear = "rbxassetid://15742148491",
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