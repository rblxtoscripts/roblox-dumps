-- https://lua.expert/
return {
	RiseOfTheHoneybee = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-17"),
		RequiredMissions = { "LicenseOfTheHivekeeper" },
		Rewards = {
			EasterEggHeadBand = 1,
			GoldEggs = 200
		},
		Tasks = {
			{
				Preset = "InspectAnyLore",
				Amount = 5
			},
			{
				Preset = "CompeteInSpecificContest",
				Amount = 1,
				Contest = "TamingContest",
				PointsRequired = 50,
				Description = function(p1, p2) --[[ Description | Line: 29 ]]
					return ("Compete in the %* and receive at least %* points!"):format(p2.TaskData.Contest, p2.TaskData.PointsRequired)
				end,
				Check = function(p1, p2, p3) --[[ Check | Line: 33 ]]
					local v1 = nil or true
					return (if v1 then if p3 == p2.TaskData.Contest then true else false else v1) and p2.TaskData.PointsRequired <= p1.TameContestData.Score.Value
				end
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 1
			},
			{
				Preset = "CompeteInSpecificContest",
				Contest = "CosmeticContest",
				Amount = 1
			}
		}
	},
	PetalsInTheWind = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 1,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-18"),
		RequiredMissions = { "RiseOfTheHoneybee" },
		Rewards = {
			EasterWingPotion = 1,
			GoldEggs = 150
		},
		Tasks = {
			{
				Preset = "TameAnySpecies",
				Amount = 15
			},
			{
				Preset = "LevelAnySpeciesAnySkill",
				Amount = 5
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 2
			},
			{
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 5
			}
		}
	},
	TackOfTheSeason = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		Category = "EventSpecialQuests",
		UnlockTime = DateTime.fromIsoDate("2026-04-18"),
		Rewards = {
			HoneytrotPollenHood = 1,
			HoneytrotPollenSaddle = 1,
			HoneytrotPollenSocks = 1,
			GoldEggs = 250
		},
		Tasks = {
			{
				Preset = "TameSpecificSpecies",
				Species = "Wolper",
				Amount = 15
			},
			{
				Preset = "BreedSpecificSpecies",
				Species = "Wolper",
				Amount = 15
			},
			{
				Preset = "FoalAnySpecies",
				Amount = 10
			},
			{
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 5
			}
		}
	},
	HiveHarmony = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		Category = "EventSpecialQuests",
		UnlockTime = DateTime.fromIsoDate("2026-04-18"),
		Rewards = {
			SakuraMutationPotion = 1,
			GoldEggs = 250
		},
		Tasks = {
			{
				Preset = "TameSpecificSpecies",
				Species = "Honeytrot",
				Amount = 15
			},
			{
				Preset = "FoalAnySpecies",
				Amount = 10
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 2
			},
			{
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 5
			}
		}
	}
}