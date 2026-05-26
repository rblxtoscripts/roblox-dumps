-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	ForcedDisplayName = "Serpentine",
	NotReleasedYet = true,
	DiscoveryPreset = "NephySnow",
	Rarity = "Legendary",
	Strength = 5,
	PriceMultiplier = 1.4,
	Scale = 1.1,
	DoNotMoveNeckWhenSitting = true,
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://77359628344093",
			Volume = 0.3,
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
		GallopAnimationSpeed = 0.6,
		RaceSprintAnimationSpeed = 1.2,
		JumpHeight = 1.35,
		GrowTime = 1500,
		Stamina = 150,
		StaminaRegen = 1,
		BreedCooldown = 129600,
		HarvestStrength = 1.5,
		FlyStaminaMultiplier = 1
	},
	WildWingWhitelist = {
		MantaRayWings = true,
		SeahorseWings = true,
		MermaidWings = true
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
		Reverse = "rbxassetid://103890278467930",
		Brake = "rbxassetid://15742189205",
		Idle = "rbxassetid://136676349459335",
		Walk = "rbxassetid://103890278467930",
		Trot = "rbxassetid://105433131273329",
		Canter = "rbxassetid://88780239771728",
		Gallop = "rbxassetid://129174779339858",
		RaceSprint = "rbxassetid://112767252146940",
		Jump = "rbxassetid://115496294363210",
		Fall = "rbxassetid://104576983439936",
		JumpBuck = "rbxassetid://15743233075",
		ShortBuck = "rbxassetid://15743443276",
		RearKick = "rbxassetid://15743138561",
		Rear = "rbxassetid://120637178763825",
		Collapse = "rbxassetid://16541638529",
		Lay = "rbxassetid://89720207135366",
		Sit = "rbxassetid://113405729728735",
		HappyStomp = "rbxassetid://93167299132964",
		HeadShake = "rbxassetid://15853866224",
		Piaffe = "rbxassetid://17727301864",
		HoofDig = "rbxassetid://120376261111936",
		LegRest = "rbxassetid://127586974435568",
		LiftedSit = "rbxassetid://95612175465168",
		Blink = "rbxassetid://16142584742",
		FlyForward = "rbxassetid://16621455978",
		FlyIdle = "rbxassetid://16621573019",
		Dive = "rbxassetid://16621522365",
		Glide = "rbxassetid://16621608189"
	}
}