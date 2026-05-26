-- https://lua.expert/
return {
	{
		Name = "Hollyhoof Helpers",
		UnlockDate = 1765227600,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame %s Hollyhoofs",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 11 ]]
					return p1 == "Hollyhoof"
				end
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete %s Event Minigames",
				Amount = 50
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "FrozenWingPotion"
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Frozen", "Candycane" }
			}
		}
	},
	{
		Name = "Frostborn Foals",
		UnlockDate = 1765832400,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame %s Alces",
				Amount = 50,
				Check = function(p1) --[[ Check | Line: 61 ]]
					return p1 == "Alces"
				end
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete %s Event Minigames",
				Amount = 50
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "AlcesBreedingLicense"
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Frozen", "Candycane" }
			}
		}
	},
	{
		Name = "Snowbound Spirits",
		UnlockDate = 1766606400,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "HarvestNode",
				Description = "Destroy %s Harvestables",
				Amount = 15
			},
			Mission2 = {
				Type = "BuyStable",
				Description = "Buy %s Winter Horses from the Winter Stables",
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
				Name = "FrostMutationPotion"
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Frozen", "Candycane" }
			}
		}
	},
	{
		Name = "Snowcrest Sentinels",
		UnlockDate = 1766865600,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame a Horse-species horse %s times",
				Amount = 15,
				Check = function(p1) --[[ Check | Line: 145 ]]
					return p1 == "Horse"
				end
			},
			Mission2 = {
				Type = "StatLevelUp",
				Amount = 20,
				Description = "Level up any horses agility skill %s times",
				Check = function(p1, p2) --[[ Check | Line: 155 ]]
					if p1 == "Agility" then
						return true
					end
				end
			},
			Mission3 = {
				Type = "HarvestNode",
				Description = "Destroy %s Harvestables",
				Amount = 20
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "NorthStarMutationPotion"
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Frozen", "Candycane" }
			}
		}
	},
	{
		Name = "Glaciermane Guardians",
		UnlockDate = 1767124800,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "Breed",
				Description = "Breed a Horse-species horse %s times",
				Amount = 25,
				Check = function(p1, p2) --[[ Check | Line: 192 ]]
					return if p1 == "Horse" then true else p2 == "Horse"
				end
			},
			Mission2 = {
				Type = "StatLevelUp",
				Amount = 20,
				Description = "Level up any horses agility skill %s times",
				Check = function(p1, p2) --[[ Check | Line: 202 ]]
					if p1 == "Agility" then
						return true
					end
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
				Name = "CozyTackLootbox"
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Frozen", "Candycane" }
			}
		}
	}
}