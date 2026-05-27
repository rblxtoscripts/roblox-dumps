-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	DiscoveryPreset = "SaurGreenYellow",
	Rarity = "Exclusive",
	Strength = 0.75,
	PriceMultiplier = 1.5,
	Scale = 1.2,
	InSeasonStart = "August",
	InSeasonEnd = "September",
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://79170309620702",
			Volume = 1,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 4,
		Speed = 0.22,
		SprintSpeed = 30,
		WalkAnimationSpeed = 1.3,
		TrotAnimationSpeed = 1.25,
		CanterAnimationSpeed = 1,
		GallopAnimationSpeed = 0.8,
		RaceSprintAnimationSpeed = 1,
		JumpHeight = 1.05,
		GrowTime = 1500,
		Stamina = 150,
		StaminaRegen = 1,
		BreedCooldown = 64800,
		BreedWait = 129600,
		HarvestStrength = 1.5,
		FlyStaminaMultiplier = 1
	},
	WildWingWhitelist = {
		FluffyPterosaurWings = true,
		MicroraptorWings = true,
		AmberMothWings = true
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
			Id = "rbxassetid://79170309620702"
		},
		Neigh1 = {
			Id = "rbxassetid://72247683827055"
		},
		Neigh2 = {
			Id = "rbxassetid://123860324450671"
		},
		Neigh3 = {
			Id = "rbxassetid://75139543082966"
		},
		Snort1 = {
			Id = "rbxassetid://72247683827055"
		},
		Snort2 = {
			Id = "rbxassetid://123860324450671"
		},
		Snort3 = {
			Id = "rbxassetid://75139543082966"
		}
	},
	Animations = {
		Reverse = "rbxassetid://15740097756",
		Brake = "rbxassetid://15742189205",
		Idle = "rbxassetid://116953535770293",
		Walk = "rbxassetid://15740097756",
		Trot = "rbxassetid://17725498938",
		Canter = "rbxassetid://138262322957566",
		Gallop = "rbxassetid://95217646509688",
		RaceSprint = "rbxassetid://132582730486352",
		Jump = "rbxassetid://115496294363210",
		Fall = "rbxassetid://104576983439936",
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
		HoofDig = "rbxassetid://120376261111936",
		LegRest = "rbxassetid://16138403342",
		LiftedSit = "rbxassetid://16139256552",
		Blink = "rbxassetid://16142584742",
		FlyForward = "rbxassetid://16621455978",
		FlyIdle = "rbxassetid://16621573019",
		Dive = "rbxassetid://16621522365",
		Glide = "rbxassetid://16621608189"
	}
}