-- https://lua.expert/
return {
	CompHub = {
		MissionDisplayName = "Unlock Competitive Hub!",
		Missions = {
			{
				Type = "Tame",
				Amount = 20,
				Description = "Tame any horses %s times",
				Reward = {
					Name = "Coins",
					Amount = 50
				}
			},
			{
				Type = "DefeatBoss",
				Amount = 1,
				Reward = {
					Name = "Coins",
					Amount = 50
				}
			},
			{
				Type = "HarvestPlant",
				Amount = 4,
				Reward = {
					Name = "Coins",
					Amount = 50
				}
			}
		}
	}
}