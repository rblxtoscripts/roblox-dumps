-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	Index = 12,
	DiscoveryPreset = "FelorseOrange",
	Rarity = "Legendary",
	Strength = 5,
	PriceMultiplier = 1.5,
	Scale = 1.1,
	Poses = {},
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://132981247783256",
			Volume = 0.2,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 4,
		Speed = 0.22,
		SprintSpeed = 30,
		WalkAnimationSpeed = 1.2,
		TrotAnimationSpeed = 1.25,
		CanterAnimationSpeed = 1.3,
		GallopAnimationSpeed = 0.8,
		RaceSprintAnimationSpeed = 1,
		JumpHeight = 1.05,
		GrowTime = 2100,
		Stamina = 150,
		StaminaRegen = 1,
		BreedCooldown = 57600,
		HarvestStrength = 1.5,
		FlyStaminaMultiplier = 1
	},
	WildWingWhitelist = {
		FierceWings = true,
		FelineWings = true,
		PlayfulWings = true
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
			Id = "rbxassetid://132981247783256"
		},
		Neigh1 = {
			Id = "rbxassetid://132981247783256"
		},
		Neigh2 = {
			Id = "rbxassetid://124280043750343"
		},
		Neigh3 = {
			Id = "rbxassetid://75276284947670"
		},
		Snort1 = {
			Id = "rbxassetid://124280043750343"
		},
		Snort2 = {
			Id = "rbxassetid://75276284947670"
		},
		Snort3 = {
			Id = "rbxassetid://91912129838980"
		}
	},
	Animations = {
		Reverse = "rbxassetid://77598542225227",
		Brake = "rbxassetid://15742189205",
		Idle = "rbxassetid://121312281963401",
		Walk = "rbxassetid://77598542225227",
		Trot = "rbxassetid://115558004054372",
		Canter = "rbxassetid://135641615926222",
		Gallop = "rbxassetid://76240924680109",
		RaceSprint = "rbxassetid://105553295971648",
		Jump = "rbxassetid://89703230184255",
		Fall = "rbxassetid://70446784293224",
		JumpBuck = "rbxassetid://15743233075",
		ShortBuck = "rbxassetid://15743443276",
		RearKick = "rbxassetid://15743138561",
		Rear = "rbxassetid://126736687680780",
		Collapse = "rbxassetid://16541638529",
		Lay = "rbxassetid://79009122256736",
		Sit = "rbxassetid://123257663923474",
		HappyStomp = "rbxassetid://97209549455624",
		HeadShake = "rbxassetid://97209549455624",
		Piaffe = "rbxassetid://97209549455624",
		HoofDig = "rbxassetid://15853934772",
		LegRest = "rbxassetid://16138403342",
		LiftedSit = "rbxassetid://123257663923474",
		Blink = "rbxassetid://16142584742",
		FlyForward = "rbxassetid://124835691142958",
		FlyIdle = "rbxassetid://16621573019",
		Dive = "rbxassetid://16621522365",
		Glide = "rbxassetid://124835691142958"
	}
}