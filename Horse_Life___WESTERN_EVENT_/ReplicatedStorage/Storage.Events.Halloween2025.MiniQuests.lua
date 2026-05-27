-- https://lua.expert/
return {
	{
		Name = "Neighmare",
		UnlockDate = 1760558400,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame %s Hauntmares",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 11 ]]
					return p1 == "Hauntmare"
				end
			},
			Mission2 = {
				Type = "Tame",
				Description = "Tame %s Ghoulsteeds",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 19 ]]
					return p1 == "Ghoulsteed"
				end
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete %s Event Minigames",
				Amount = 50
			},
			Mission4 = {
				Type = "HarvestNode",
				Description = "Destroy %s harvestables",
				Amount = 50
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "SpookyWingPotion"
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Pumpkin", "Ghoul", "WitchPotion" }
			}
		}
	},
	{
		Name = "Phantom Foals",
		UnlockDate = 1761163200,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame %s Ghoulsteeds",
				Amount = 50,
				Check = function(p1) --[[ Check | Line: 61 ]]
					return p1 == "Ghoulsteed"
				end
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete %s Event Minigames",
				Amount = 50
			},
			Mission4 = {
				Type = "HarvestNode",
				Description = "Destroy %s harvestables",
				Amount = 50
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "GhoulsteedBreedingLicense"
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Pumpkin", "Ghoul", "WitchPotion" }
			}
		}
	},
	{
		Name = "Spooktacular",
		UnlockDate = 1761768000,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "HarvestNode",
				Description = "Destroy %s Harvestables",
				Amount = 25
			},
			Mission2 = {
				Type = "BuyStable",
				Description = "Buy %s Halloween Horses from the Haunted Stables",
				Amount = 5,
				Check = function(p1) --[[ Check | Line: 110 ]]
					return p1 == "Event"
				end
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete %s Event Minigames",
				Amount = 15
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "HauntedMutationPotion"
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Pumpkin", "Ghoul", "WitchPotion" }
			}
		}
	}
}