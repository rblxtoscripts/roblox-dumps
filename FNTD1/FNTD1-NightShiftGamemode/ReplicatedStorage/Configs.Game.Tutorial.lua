-- https://lua.expert/
return {
	Nights = {
		{
			StartingCash = 400,
			Boss = {
				Name = "Mangled Bonnie",
				Health = 1000,
				Spawn = 1
			},
			Rewards = {
				Tokens = {
					Easy = 100,
					Medium = 120,
					Hard = 140,
					Impossible = 160,
					Nightmare = 180
				}
			},
			Waves = {
				{
					Reward = 200,
					WaveTime = 20,
					Enemies = {
						["3"] = {
							Enemy = "Zombie Bonnie",
							Health = "50",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Spawn = 1
						}
					}
				},
				{
					Reward = 250,
					WaveTime = 30,
					Enemies = {
						["0"] = {
							Enemy = "Zombie Bonnie",
							Amount = 3,
							TimeBetweenSpawns = 1,
							Spawn = 1
						}
					}
				},
				{
					Reward = 300,
					WaveTime = 30,
					Enemies = {
						["0"] = {
							Enemy = "Zombie Bonnie",
							Amount = 6,
							TimeBetweenSpawns = 1,
							Spawn = 1
						}
					}
				},
				{
					Reward = 350,
					WaveTime = 30,
					Enemies = {
						["0.0"] = {
							Enemy = "Zombie Foxy",
							Amount = 1,
							TimeBetweenSpawns = 1,
							Spawn = 1
						}
					}
				}
			}
		}
	}
}