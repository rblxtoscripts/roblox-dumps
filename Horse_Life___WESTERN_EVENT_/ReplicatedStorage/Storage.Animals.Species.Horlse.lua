-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	DisplayName = "LEGO\194\174Horse",
	ForcedDisplayName = "LEGO\194\174Horse",
	DiscoveryPreset = "LegoBrown",
	ToyHorse = true,
	Infertile = true,
	Rarity = "Exclusive",
	Strength = 85,
	PriceMultiplier = 1.25,
	Scale = 1,
	SearchTerms = { "LEGO" },
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://609578817",
			Volume = 1,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 4,
		Speed = 0.22,
		SprintSpeed = 30,
		WalkAnimationSpeed = 1.25,
		TrotAnimationSpeed = 1.25,
		CanterAnimationSpeed = 1.75,
		GallopAnimationSpeed = 1.25,
		RaceSprintAnimationSpeed = 1,
		JumpHeight = 1.05,
		GrowTime = 1500,
		Stamina = 150,
		StaminaRegen = 1.25,
		BreedCooldown = 43200,
		BreedWait = 600,
		HarvestStrength = 1.5,
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
		Idle = "rbxassetid://98256952607274",
		Walk = "rbxassetid://89449465750228",
		Trot = "rbxassetid://98305160674574",
		Canter = "rbxassetid://79172008371051",
		Gallop = "rbxassetid://93653691736955",
		RaceSprint = "rbxassetid://106742332672776",
		Jump = "rbxassetid://17725570214",
		Fall = "rbxassetid://96042216256435",
		JumpBuck = "rbxassetid://119448778987437",
		ShortBuck = "rbxassetid://119448778987437",
		RearKick = "rbxassetid://119448778987437",
		Rear = "rbxassetid://119448778987437",
		Collapse = "rbxassetid://119448778987437",
		Lay = "rbxassetid://98256952607274",
		Sit = "rbxassetid://98256952607274",
		HappyStomp = "rbxassetid://98256952607274",
		HeadShake = "rbxassetid://101113996870118",
		Piaffe = "rbxassetid://101113996870118",
		HoofDig = "rbxassetid://101113996870118",
		LegRest = "rbxassetid://101113996870118",
		LiftedSit = "rbxassetid://98256952607274",
		FlyForward = "rbxassetid://16621455978",
		FlyIdle = "rbxassetid://77751814432930",
		Dive = "rbxassetid://16621522365",
		Glide = "rbxassetid://16621608189"
	},
	MaxTraits = {
		Paint = 1,
		Pattern = 1
	}
}