-- https://lua.expert/
return {
	MaxPlayers = 8,
	MinimumPlayers = 1,
	CooldownToStart = 30,
	Laps = 2,
	TeleportBack = true,
	DisplayName = "Dream Dash Parade",
	IsToyRace = true,
	Rewards = {
		{
			Position = 1,
			TotalRewards = 1,
			Rewards = {
				{
					Name = "LEGOBricks",
					Amount = 200,
					P = 0.35
				}
			}
		},
		{
			TotalRewards = 1,
			Position = NumberRange.new(2, 3),
			Rewards = {
				{
					Name = "LEGOBricks",
					Amount = 100,
					P = 0.35
				}
			}
		},
		{
			TotalRewards = 1,
			Position = NumberRange.new(4, 8),
			Rewards = {
				{
					Name = "LEGOBricks",
					Amount = 50,
					P = 0.35
				}
			}
		}
	},
	SoloRewards = {
		{
			TotalRewards = 1,
			Rewards = {
				{
					Name = "LEGOBricks",
					Amount = 50,
					P = 0.35
				}
			}
		}
	}
}