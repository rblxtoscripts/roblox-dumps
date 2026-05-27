-- https://lua.expert/
return {
	{
		Type = "HarvestNode",
		Amount = NumberRange.new(10, 15),
		Reward = {
			{
				Amount = 150,
				Name = "CupidTokens"
			},
			{
				Amount = 1,
				Name = "RedVelvetLasso"
			}
		}
	},
	{
		Type = "Tame",
		Amount = NumberRange.new(10, 15),
		Reward = {
			{
				Amount = 150,
				Name = "CupidTokens"
			},
			{
				Amount = 1,
				Name = "RedVelvetLasso"
			}
		}
	},
	{
		Type = "StatLevelUp",
		Amount = NumberRange.new(5, 10),
		Reward = {
			{
				Amount = 150,
				Name = "CupidTokens"
			},
			{
				Amount = 1,
				Name = "RedVelvetLasso"
			}
		}
	},
	{
		Type = "JumpObstacle",
		Amount = NumberRange.new(10, 15),
		Reward = {
			{
				Amount = 150,
				Name = "CupidTokens"
			},
			{
				Amount = 1,
				Name = "RedVelvetLasso"
			}
		}
	},
	{
		Type = "CompleteEventMinigame",
		Description = "Complete ANY Event Minigame once!",
		Amount = NumberRange.new(1, 1),
		Reward = {
			{
				Amount = 150,
				Name = "CupidTokens"
			},
			{
				Amount = 1,
				Name = "RedVelvetLasso"
			}
		}
	}
}