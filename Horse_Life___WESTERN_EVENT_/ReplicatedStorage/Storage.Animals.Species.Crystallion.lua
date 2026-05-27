-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	RequiresBreedPermission = "CrystallionBreedingLicense",
	Reflectance = true,
	DiscoveryPreset = "PurpleGem",
	Event = true,
	Rarity = "Event",
	Strength = 0.75,
	PriceMultiplier = 1.75,
	Scale = 1.1,
	InSeasonStart = "September",
	InSeasonEnd = "November",
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://98516599280860",
			Volume = 0.3,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 4,
		Speed = 0.22,
		SprintSpeed = 38,
		WalkAnimationSpeed = 1.3,
		TrotAnimationSpeed = 1.25,
		CanterAnimationSpeed = 1.75,
		GallopAnimationSpeed = 1.1,
		RaceSprintAnimationSpeed = 1.575,
		JumpHeight = 1.05,
		GrowTime = 1500,
		Stamina = 175,
		StaminaRegen = 1,
		BreedCooldown = 72000,
		BreedWait = 86400,
		HarvestStrength = 1.25,
		FlyStaminaMultiplier = 1
	},
	WildWingWhitelist = {
		LookingGlassWings = true,
		AdornedWings = true,
		GeodeWings = true,
		ChandelierWings = true
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
	CallSounds = {
		Whinny1 = {
			Id = "rbxassetid://98516599280860"
		},
		Neigh1 = {
			Id = "rbxassetid://98516599280860"
		},
		Neigh2 = {
			Id = "rbxassetid://92284323725388"
		},
		Neigh3 = {
			Id = "rbxassetid://102505405474091"
		},
		Snort1 = {
			Id = "rbxassetid://92284323725388"
		},
		Snort2 = {
			Id = "rbxassetid://75885222848148"
		},
		Snort3 = {
			Id = "rbxassetid://102505405474091"
		}
	},
	Animations = {
		Reverse = "rbxassetid://78328029039731",
		Brake = "rbxassetid://15742189205",
		Idle = "rbxassetid://15707335363",
		Walk = "rbxassetid://78328029039731",
		Trot = "rbxassetid://90076003307824",
		Canter = "rbxassetid://18135224859",
		Gallop = "rbxassetid://125658942428932",
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
		HeadShake = "rbxassetid://15853866224",
		Piaffe = "rbxassetid://17727301864",
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