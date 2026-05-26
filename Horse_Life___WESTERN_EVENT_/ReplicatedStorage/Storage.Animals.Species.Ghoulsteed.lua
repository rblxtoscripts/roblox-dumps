-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	RequiresBreedPermission = "GhoulsteedBreedingLicense",
	Event = true,
	DiscoveryPreset = "GhoulSwamp",
	Rarity = "Event",
	Strength = 5,
	PriceMultiplier = 1.75,
	Scale = 1.2,
	InSeasonStart = "October",
	InSeasonEnd = "December",
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://138154860024252",
			Volume = 0.4,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 4,
		Speed = 0.22,
		SprintSpeed = 30,
		WalkAnimationSpeed = 1.3,
		TrotAnimationSpeed = 1.25,
		CanterAnimationSpeed = 1.5,
		GallopAnimationSpeed = 2,
		RaceSprintAnimationSpeed = 1.575,
		JumpHeight = 1.05,
		GrowTime = 1500,
		Stamina = 150,
		StaminaRegen = 1,
		BreedCooldown = 86400,
		BreedWait = 86400,
		HarvestStrength = 1.5,
		FlyStaminaMultiplier = 1
	},
	WildWingWhitelist = {
		SkeletalDragonWing = true,
		TornDragonWings = true,
		DemonWings = true,
		ReaperWings = true,
		SkeletonWings = true,
		CreatureWings = true
	},
	CallSounds = {
		Whinny1 = {
			Id = "rbxassetid://104924477414104"
		},
		Neigh1 = {
			Id = "rbxassetid://138154860024252"
		},
		Neigh2 = {
			Id = "rbxassetid://82476564194150"
		},
		Neigh3 = {
			Id = "rbxassetid://82476564194150"
		},
		Snort1 = {
			Id = "rbxassetid://99729772059582"
		},
		Snort2 = {
			Id = "rbxassetid://99729772059582"
		},
		Snort3 = {
			Id = "rbxassetid://99729772059582"
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
		Idle = "rbxassetid://83647883690128",
		Walk = "rbxassetid://15740097756",
		Trot = "rbxassetid://17725498938",
		Canter = "rbxassetid://18135224859",
		Gallop = "rbxassetid://121247030104994",
		RaceSprint = "rbxassetid://115966102550736",
		Jump = "rbxassetid://17725570214",
		Fall = "rbxassetid://17725588482",
		JumpBuck = "rbxassetid://15743138561",
		ShortBuck = "rbxassetid://15743443276",
		RearKick = "rbxassetid://135737641620548",
		Rear = "rbxassetid://96928784415345",
		Collapse = "rbxassetid://16541638529",
		Lay = "rbxassetid://92817319140518",
		Sit = "rbxassetid://83619239013567",
		HappyStomp = "rbxassetid://105144832990007",
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