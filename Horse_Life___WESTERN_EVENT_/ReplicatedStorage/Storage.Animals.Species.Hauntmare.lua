-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	RequiresBreedPermission = "HauntmareBreedingLicense",
	Event = true,
	DiscoveryPreset = "HauntCandy",
	Rarity = "Event",
	Strength = 5,
	PriceMultiplier = 1.75,
	Scale = 1.2,
	InSeasonStart = "October",
	InSeasonEnd = "December",
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://72663232399243",
			Volume = 0.3,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 6,
		Speed = 0.22,
		SprintSpeed = 33,
		WalkAnimationSpeed = 1.3,
		TrotAnimationSpeed = 1.25,
		CanterAnimationSpeed = 1.5,
		GallopAnimationSpeed = 1,
		RaceSprintAnimationSpeed = 1.35,
		JumpHeight = 1.05,
		GrowTime = 1500,
		Stamina = 100,
		StaminaRegen = 1.5,
		BreedCooldown = 86400,
		BreedWait = 86400,
		HarvestStrength = 1.25,
		FlyStaminaMultiplier = 1
	},
	WildWingWhitelist = {
		SoulBirdWings = true,
		PhoenixGhostWings = true,
		SkeletonSpiderWings = true
	},
	CallSounds = {
		Whinny1 = {
			Id = "rbxassetid://78167525267058"
		},
		Neigh1 = {
			Id = "rbxassetid://72663232399243"
		},
		Neigh2 = {
			Id = "rbxassetid://81082186709026"
		},
		Neigh3 = {
			Id = "rbxassetid://102697858870447"
		},
		Snort1 = {
			Id = "rbxassetid://72663232399243"
		},
		Snort2 = {
			Id = "rbxassetid://78167525267058"
		},
		Snort3 = {
			Id = "rbxassetid://81082186709026"
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
		Reverse = "rbxassetid://125461673423377",
		Brake = "rbxassetid://15742189205",
		Idle = "rbxassetid://75156229308442",
		Walk = "rbxassetid://93902975902552",
		Trot = "rbxassetid://117087084593062",
		Canter = "rbxassetid://98656759550841",
		Gallop = "rbxassetid://99622817685696",
		RaceSprint = "rbxassetid://118567781078863",
		Jump = "rbxassetid://17725570214",
		Fall = "rbxassetid://17725588482",
		JumpBuck = "rbxassetid://15743138561",
		ShortBuck = "rbxassetid://15743443276",
		RearKick = "rbxassetid://135737641620548",
		Rear = "rbxassetid://94539862235960",
		Collapse = "rbxassetid://16541638529",
		Lay = "rbxassetid://95039993488464",
		Sit = "rbxassetid://78965035192206",
		HappyStomp = "rbxassetid://109851476715249",
		HeadShake = "rbxassetid://101098188333901",
		Piaffe = "rbxassetid://17727301864",
		HoofDig = "rbxassetid://98791490900967",
		LegRest = "rbxassetid://105003131376782",
		LiftedSit = "rbxassetid://108004450311744",
		Blink = "rbxassetid://16142584742",
		FlyForward = "rbxassetid://16621455978",
		FlyIdle = "rbxassetid://16621573019",
		Dive = "rbxassetid://16621522365",
		Glide = "rbxassetid://16621608189"
	}
}