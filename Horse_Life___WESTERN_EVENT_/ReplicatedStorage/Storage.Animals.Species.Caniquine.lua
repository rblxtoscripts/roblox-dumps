-- https://lua.expert/
local UpgradeStats = require(game.ReplicatedStorage.Storage.Stats.UpgradeStats)
return {
	DiscoveryPreset = "CaniGrayWolf",
	Rarity = "Epic",
	Strength = 5,
	PriceMultiplier = 1.5,
	Scale = 1.07,
	Vocals = {
		Rear = {
			SoundId = "rbxassetid://127037711379278",
			Volume = 0.1,
			PlaybackSpeed = 1
		}
	},
	Stats = {
		TurnSpeed = 3.5,
		Speed = 0.22,
		SprintSpeed = 33,
		WalkAnimationSpeed = 1.2,
		TrotAnimationSpeed = 0.8,
		CanterAnimationSpeed = 1.5,
		GallopAnimationSpeed = 2,
		RaceSprintAnimationSpeed = 1.575,
		JumpHeight = 1.05,
		GrowTime = 1800,
		Stamina = 175,
		StaminaRegen = 1,
		BreedCooldown = 86400,
		HarvestStrength = 1.3,
		FlyStaminaMultiplier = 1
	},
	CallSounds = {
		Whinny1 = {
			Id = "rbxassetid://96565488583072"
		},
		Neigh1 = {
			Id = "rbxassetid://127037711379278"
		},
		Neigh2 = {
			Id = "rbxassetid://111410102821890"
		},
		Neigh3 = {
			Id = "rbxassetid://116292114810451"
		},
		Snort1 = {
			Id = "rbxassetid://127037711379278"
		},
		Snort2 = {
			Id = "rbxassetid://111410102821890"
		},
		Snort3 = {
			Id = "rbxassetid://116292114810451"
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
		Reverse = "rbxassetid://91471163407306",
		Brake = "rbxassetid://15742189205",
		Idle = "rbxassetid://107745897766081",
		Walk = "rbxassetid://91471163407306",
		Trot = "rbxassetid://107948484797339",
		Canter = "rbxassetid://18135224859",
		Gallop = "rbxassetid://121247030104994",
		RaceSprint = "rbxassetid://115966102550736",
		Jump = "rbxassetid://17725570214",
		Fall = "rbxassetid://17725588482",
		JumpBuck = "rbxassetid://15743138561",
		ShortBuck = "rbxassetid://15743443276",
		RearKick = "rbxassetid://135737641620548",
		Rear = "rbxassetid://114268293504644",
		Collapse = "rbxassetid://16541638529",
		Lay = "rbxassetid://137333459756182",
		Sit = "rbxassetid://124571708358478",
		HappyStomp = "rbxassetid://112446582021459",
		HeadShake = "rbxassetid://112446582021459",
		Piaffe = "rbxassetid://17727301864",
		HoofDig = "rbxassetid://102798681896278",
		LegRest = "rbxassetid://112446582021459",
		LiftedSit = "rbxassetid://107032974687986",
		Blink = "rbxassetid://16142584742",
		FlyForward = "rbxassetid://16621455978",
		FlyIdle = "rbxassetid://16621573019",
		Dive = "rbxassetid://16621522365",
		Glide = "rbxassetid://16621608189"
	}
}