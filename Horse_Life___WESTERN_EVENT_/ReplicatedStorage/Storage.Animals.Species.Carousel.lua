-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	RequiresBreedPermission = "CarouselBreedingLicense",
	Event = true,
	Index = 22,
	DiscoveryPreset = "CarouselToy",
	Rarity = "Event",
	Strength = 2.5,
	PriceMultiplier = 1.75,
	Scale = 1.1,
	InSeasonStart = "August",
	InSeasonEnd = "October",
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://609578817",
			Volume = 1,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 3,
		Speed = 0.22,
		SprintSpeed = 33,
		WalkAnimationSpeed = 1,
		TrotAnimationSpeed = 1.25,
		CanterAnimationSpeed = 1.75,
		GallopAnimationSpeed = 1.25,
		RaceSprintAnimationSpeed = 1.575,
		JumpHeight = 1,
		GrowTime = 1500,
		Stamina = 80,
		StaminaRegen = 1,
		BreedCooldown = 86400,
		BreedWait = 86400,
		HarvestStrength = 1.25,
		FlyStaminaMultiplier = 1
	},
	WildWingWhitelist = {
		ElegantScrollWings = true,
		CarnivalWings = true,
		JesterWings = true,
		CircusTentWings = true
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
		Reverse = "rbxassetid://130780188123146",
		Brake = "rbxassetid://15742189205",
		Idle = "rbxassetid://128882890908429",
		Walk = "rbxassetid://130780188123146",
		Trot = "rbxassetid://89686014089860",
		Canter = "rbxassetid://18135224859",
		Gallop = "rbxassetid://131232577036392",
		RaceSprint = "rbxassetid://18135279123",
		Jump = "rbxassetid://17725570214",
		Fall = "rbxassetid://17725588482",
		JumpBuck = "rbxassetid://15743233075",
		ShortBuck = "rbxassetid://15743443276",
		RearKick = "rbxassetid://15743138561",
		Rear = "rbxassetid://71604025597495",
		Collapse = "rbxassetid://16541638529",
		Lay = "rbxassetid://15841678580",
		Sit = "rbxassetid://15841722583",
		HappyStomp = "rbxassetid://15841882483",
		HeadShake = "rbxassetid://15853866224",
		Piaffe = "rbxassetid://17727301864",
		HoofDig = "rbxassetid://89849671964003",
		LegRest = "rbxassetid://16138403342",
		LiftedSit = "rbxassetid://16139256552",
		Blink = "rbxassetid://16142584742",
		FlyForward = "rbxassetid://16621455978",
		FlyIdle = "rbxassetid://16621573019",
		Dive = "rbxassetid://16621522365",
		Glide = "rbxassetid://16621608189"
	}
}