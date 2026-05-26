-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	Index = 14,
	RequiresBreedPermission = "WolperBreedingLicense",
	Event = true,
	DiscoveryPreset = "WolpTricolor",
	Rarity = "Event",
	Strength = 2.5,
	PriceMultiplier = 1.75,
	Scale = 1,
	InSeasonStart = "April",
	InSeasonEnd = "June",
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://98516599280860",
			Volume = 1,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 4,
		Speed = 0.22,
		SprintSpeed = 30,
		WalkAnimationSpeed = 1.6,
		TrotAnimationSpeed = 1.5,
		CanterAnimationSpeed = 1.15,
		GallopAnimationSpeed = 1.25,
		RaceSprintAnimationSpeed = 1.575,
		JumpHeight = 1.4,
		GrowTime = 1500,
		Stamina = 150,
		StaminaRegen = 1,
		BreedCooldown = 43200,
		BreedWait = 86400,
		HarvestStrength = 1.5,
		FlyStaminaMultiplier = 1
	},
	WildWingWhitelist = {
		EasterEggWings = true,
		PetalWings = true,
		SpringFairyWings = true
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
		Reverse = "rbxassetid://97913182728711",
		Brake = "rbxassetid://15742189205",
		Idle = "rbxassetid://81078355678365",
		Walk = "rbxassetid://97913182728711",
		Trot = "rbxassetid://72095892058626",
		Canter = "rbxassetid://125190210857556",
		Gallop = "rbxassetid://83898587276966",
		RaceSprint = "rbxassetid://83898587276966",
		Jump = "rbxassetid://17725570214",
		Fall = "rbxassetid://17725588482",
		JumpBuck = "rbxassetid://15743233075",
		ShortBuck = "rbxassetid://15743443276",
		RearKick = "rbxassetid://15743138561",
		Rear = "rbxassetid://96928784415345",
		Collapse = "rbxassetid://16541638529",
		Lay = "rbxassetid://15841678580",
		Sit = "rbxassetid://118945691166756",
		HappyStomp = "rbxassetid://15841882483",
		HeadShake = "rbxassetid://15853866224",
		Piaffe = "rbxassetid://17727301864",
		HoofDig = "rbxassetid://15853934772",
		LegRest = "rbxassetid://129502657061816",
		LiftedSit = "rbxassetid://16139256552",
		Blink = "rbxassetid://16142584742",
		FlyForward = "rbxassetid://16621455978",
		FlyIdle = "rbxassetid://16621573019",
		Dive = "rbxassetid://16621522365",
		Glide = "rbxassetid://16621608189"
	}
}