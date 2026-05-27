-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	Index = 2,
	DiscoveryPreset = "Blonde",
	Rarity = "Common",
	Strength = 85,
	PriceMultiplier = 1,
	Scale = 0.65,
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://609578817",
			Volume = 1,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 8,
		Speed = 0.5,
		SprintSpeed = 35,
		WalkAnimationSpeed = 1.75,
		TrotAnimationSpeed = 2.25,
		CanterAnimationSpeed = 2.25,
		GallopAnimationSpeed = 2.25,
		RaceSprintAnimationSpeed = 3,
		JumpHeight = 0.85,
		GrowTime = 900,
		Stamina = 100,
		StaminaRegen = 1,
		BreedCooldown = 14400,
		HarvestStrength = 1,
		FlyStaminaMultiplier = 1
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