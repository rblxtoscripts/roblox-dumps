-- https://lua.expert/
return {
	DailyChests = {
		Description = "Unlock Daily Chests",
		Name = "Daily Chests",
		SpeciesRequired = "Pony",
		Upgrades = {
			{
				Name = "Upgrade1",
				Description = "+1 Reward",
				Cost = 500,
				Value = {
					ItemsAdded = 1
				}
			},
			{
				Name = "Upgrade2",
				Description = "+1 Reward",
				Cost = 1500,
				Value = {
					ItemsAdded = 1
				}
			},
			{
				Name = "Upgrade3",
				Description = "+1 Reward",
				Cost = 2500,
				Value = {
					ItemsAdded = 1
				}
			},
			{
				Name = "Upgrade4",
				Description = "25% More Coins",
				Cost = 3500,
				Value = {
					RewardAdded = 0.25
				}
			},
			{
				Name = "Upgrade5",
				Description = "50% More Coins",
				Cost = 4500,
				Value = {
					RewardAdded = 0.5
				}
			}
		},
		ViewportModel = game.ReplicatedStorage.Storage.Assets.ActivityModels.DailyChest
	}
}