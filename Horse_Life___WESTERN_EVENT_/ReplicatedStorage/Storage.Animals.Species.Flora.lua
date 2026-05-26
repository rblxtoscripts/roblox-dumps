-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	Index = 12,
	DiscoveryPreset = "FloraMulti",
	Rarity = "Epic",
	Strength = 5,
	PriceMultiplier = 1.3,
	Scale = 1,
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://609578817",
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
		GrowTime = 1800,
		Stamina = 125,
		StaminaRegen = 1.5,
		BreedCooldown = 108000,
		HarvestStrength = 1,
		FlyStaminaMultiplier = 1
	},
	WildWingWhitelist = {
		CloverWings = true,
		LilyWings = true,
		PetalLeafWings = true,
		BloomingWings = true
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