-- https://lua.expert/
return {
	["1"] = {
		Nights = {
			{
				StartingCash = 400,
				Boss = {
					Name = "Mangled Bonnie",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 100,
						Medium = 120,
						Hard = 140,
						Impossible = 160,
						Nightmare = 180
					},
					Easy = {
						Item_Souls = {
							Chance = 25,
							Amount = { 1, 3 }
						},
						ClanPoints = {
							Chance = 100,
							Amount = 1
						},
						Item_Pizza = {
							Chance = 100,
							Amount = { 1, 3 }
						},
						Item_GoldenLock = {
							Chance = 2,
							Amount = 1
						}
					},
					Medium = {
						Item_Souls = {
							Chance = 25,
							Amount = { 1, 3 }
						},
						ClanPoints = {
							Chance = 100,
							Amount = 1
						},
						Item_Pizza = {
							Chance = 100,
							Amount = { 1, 3 }
						},
						Item_GoldenLock = {
							Chance = 2,
							Amount = 1
						}
					},
					Hard = {
						Item_Souls = {
							Chance = 25,
							Amount = { 1, 3 }
						},
						ClanPoints = {
							Chance = 100,
							Amount = 1
						},
						Item_Pizza = {
							Chance = 100,
							Amount = { 1, 3 }
						},
						Item_GoldenLock = {
							Chance = 2,
							Amount = 1
						}
					},
					Impossible = {
						Item_Souls = {
							Chance = 25,
							Amount = { 1, 3 }
						},
						ClanPoints = {
							Chance = 100,
							Amount = 1
						},
						Item_Pizza = {
							Chance = 100,
							Amount = { 1, 3 }
						},
						Item_GoldenLock = {
							Chance = 2,
							Amount = 1
						}
					},
					Nightmare = {
						Item_Souls = {
							Chance = 25,
							Amount = { 1, 3 }
						},
						ClanPoints = {
							Chance = 100,
							Amount = 1
						},
						Item_Pizza = {
							Chance = 100,
							Amount = { 1, 3 }
						},
						Item_GoldenLock = {
							Chance = 2,
							Amount = 1
						},
						Item_Balloon = {
							Chance = 15,
							Amount = 1
						}
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
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 8,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 8,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 6,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Foxy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Zombie Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 25,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					}
				}
			},
			{
				StartingCash = 600,
				Boss = {
					Name = "Inflated Cupcake",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 110,
						Medium = 130,
						Hard = 150,
						Impossible = 170,
						Nightmare = 190
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 1, 3 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Pizza = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 2,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
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
							},
							["0.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.03"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.02"] = {
								Enemy = "Zombie Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Foxy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 8,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 8,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Zombie Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Zombie Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.02"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 40,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 40,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 20,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 20,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 600,
				Boss = {
					Name = "Endo Freddy",
					Spawn = 2
				},
				Rewards = {
					Tokens = {
						Easy = 120,
						Medium = 140,
						Hard = 160,
						Impossible = 180,
						Nightmare = 200
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 1, 3 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Pizza = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 2,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 400,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0.0"] = {
								Enemy = "Zombie Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.01"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Bonnie",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.02"] = {
								Enemy = "Zombie Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.02"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.02"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.03"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["2.01"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.03"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					}
				}
			},
			{
				StartingCash = 1000,
				Boss = {
					Name = "Boatswain Foxy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 130,
						Medium = 150,
						Hard = 170,
						Impossible = 190,
						Nightmare = 210
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 1, 3 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Pizza = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 2,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Zombie Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0.0"] = {
								Enemy = "Zombie Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Zombie Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 6,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 6,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Foxy",
								Amount = 6,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 9,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 9,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 9,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Foxy",
								Amount = 20,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 20,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.02"] = {
								Enemy = "Zombie Foxy",
								Amount = 20,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.02"] = {
								Enemy = "Zombie Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.03"] = {
								Enemy = "Zombie Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 60,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.01"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["2.01"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.03"] = {
								Enemy = "Zombie Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					}
				}
			},
			{
				StartingCash = 1000,
				Boss = {
					Name = "Abandoned Chica",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 140,
						Medium = 160,
						Hard = 180,
						Impossible = 200,
						Nightmare = 220
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 1, 3 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Pizza = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 2,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["7.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["7.01"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0.0"] = {
								Enemy = "Zombie Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["7.01"] = {
								Enemy = "Zombie Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["7"] = {
								Enemy = "Zombie Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Zombie Foxy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["7.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["10"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["10.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["5.01"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5.03"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Zombie Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["7.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["10.01"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["10.02"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Chica",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["15.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["15.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.02"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Chica",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["3.03"] = {
								Enemy = "Zombie Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.02"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.03"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["1.04"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Zombie Endo",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.01"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Zombie Endo",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["2.01"] = {
								Enemy = "Zombie Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["3.03"] = {
								Enemy = "Zombie Endo",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					}
				}
			},
			{
				StartingCash = 1000,
				Boss = {
					Name = "Vengeful Gold Freddy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 150,
						Medium = 170,
						Hard = 190,
						Impossible = 210,
						Nightmare = 230
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 1, 3 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Pizza = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 2,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 500,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Bonnie",
								Health = "50",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 50,
						Enemies = {
							["0.0"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Foxy",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Foxy",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Zombie Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 60,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["10.02"] = {
								Enemy = "Zombie Chica",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 60,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 12,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["15.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 12,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 12,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 60,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Chica",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Chica",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Chica",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Chica",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 60,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Freddy",
								Amount = 6,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Freddy",
								Amount = 6,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.02"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Freddy",
								Amount = 6,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.03"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 60,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Endo",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Endo",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Endo",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 60,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Zombie Endo",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.01"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Zombie Endo",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Zombie Golden Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.03"] = {
								Enemy = "Zombie Endo",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					}
				}
			}
		}
	},
	["2"] = {
		Nights = {
			{
				StartingCash = 1500,
				Boss = {
					Name = "Salvaged Balloon Boy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 160,
						Medium = 180,
						Hard = 200,
						Impossible = 220,
						Nightmare = 240
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 2, 5 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Soul = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Withered Bonnie",
								Health = "100",
								Amount = 5,
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
								Enemy = "Withered Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Withered Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0.0"] = {
								Enemy = "Withered Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Withered Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Withered Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Withered Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Withered Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.02"] = {
								Enemy = "Withered Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.03"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Withered Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Withered Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Withered Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Withered Foxy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Withered Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Withered Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.01"] = {
								Enemy = "Withered Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Freddy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Withered Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.01"] = {
								Enemy = "Withered Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 2000,
				Boss = {
					Name = "Lobotomized Bonnie",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 170,
						Medium = 190,
						Hard = 210,
						Impossible = 230,
						Nightmare = 250
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 2, 5 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Soul = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0.0"] = {
								Enemy = "Withered Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Withered Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Withered Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Withered Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Withered Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Withered Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.02"] = {
								Enemy = "Withered Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["3"] = {
								Enemy = "Withered Chica",
								Amount = 15,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Puppet",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Puppet",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Puppet",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Withered Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Withered Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["5"] = {
								Enemy = "Withered Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					}
				}
			},
			{
				StartingCash = 3000,
				Boss = {
					Name = "Dreadful Chica",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 170,
						Medium = 190,
						Hard = 210,
						Impossible = 230,
						Nightmare = 250
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 2, 5 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Soul = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["5.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["8.03"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5.04"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.05"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["15.02"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["15.03"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["14.02"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["14.03"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["15.02"] = {
								Enemy = "Withered Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["15.03"] = {
								Enemy = "Withered Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Mangle",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["10"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Withered Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Withered Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["7.02"] = {
								Enemy = "Zombie Withered Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["7.03"] = {
								Enemy = "Zombie Withered Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["7.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["7.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.03"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["8.3"] = {
								Enemy = "Zombie Puppet",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["8.2"] = {
								Enemy = "Zombie Puppet",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["8.1"] = {
								Enemy = "Zombie Puppet",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["8.4"] = {
								Enemy = "Zombie Puppet",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.03"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 40,
						Enemies = {
							["3"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 50,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["7.3"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["7.2"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["7.1"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.02"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["7.4"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.03"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 40,
						Enemies = {
							["3"] = {
								Enemy = "Zombie Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Zombie Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Zombie Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.03"] = {
								Enemy = "Zombie Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["3.04"] = {
								Enemy = "Zombie Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 40,
						Enemies = {
							["10"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.02"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.03"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Withered Chica",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0"] = {
								Enemy = "Zombie Withered Chica",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					}
				}
			},
			{
				StartingCash = 3000,
				Boss = {
					Name = "Psycho Mangle",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 180,
						Medium = 200,
						Hard = 220,
						Impossible = 240,
						Nightmare = 260
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 2, 5 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Soul = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Withered Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["5.01"] = {
								Enemy = "Withered Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["8.03"] = {
								Enemy = "Withered Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5.04"] = {
								Enemy = "Withered Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.05"] = {
								Enemy = "Withered Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["4.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["5.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.03"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 800,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["5.02"] = {
								Enemy = "Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["5.03"] = {
								Enemy = "Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Withered Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.02"] = {
								Enemy = "Withered Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.03"] = {
								Enemy = "Withered Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Withered Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.02"] = {
								Enemy = "Zombie Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.03"] = {
								Enemy = "Zombie Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Zombie Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["1.02"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.03"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["1.04"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.01"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["5"] = {
								Enemy = "Withered Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5.01"] = {
								Enemy = "Withered Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 40,
						Enemies = {
							["3"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2"] = {
								Enemy = "Zombie Puppet",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Zombie Puppet",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0"] = {
								Enemy = "Zombie Puppet",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 50,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.02"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.03"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.04"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 40,
						Enemies = {
							["3"] = {
								Enemy = "Zombie Puppet",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Zombie Puppet",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Zombie Puppet",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.03"] = {
								Enemy = "Zombie Puppet",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["3.04"] = {
								Enemy = "Zombie Puppet",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 60,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.02"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.03"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Corrupted Soul Freddy",
					Spawn = 6
				},
				Rewards = {
					Tokens = {
						Easy = 190,
						Medium = 210,
						Hard = 230,
						Impossible = 250,
						Nightmare = 270
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 2, 5 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Soul = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 400,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.03"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.04"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.05"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.06"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["4.02"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.01"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 800,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["1.02"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.03"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.05"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.02"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.03"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.05"] = {
								Enemy = "Withered Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.02"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.01"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.03"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.03"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.05"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 6
							},
							["1"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["1.02"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.03"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["1.04"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.05"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.05"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.05"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 6
							},
							["1"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.02"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.03"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["1.04"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["1.05"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 6
							},
							["2"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["2.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.02"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["2.03"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2.04"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["2.05"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 40,
						Enemies = {
							["3"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["2"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["5"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["6"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 50,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.02"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.03"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.04"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.6"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 6
							},
							["0.05"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 40,
						Enemies = {
							["3"] = {
								Enemy = "Zombie Mangle",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Zombie Mangle",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Zombie Mangle",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.03"] = {
								Enemy = "Zombie Mangle",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["3.04"] = {
								Enemy = "Zombie Mangle",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["3.05"] = {
								Enemy = "Zombie Mangle",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 60,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.02"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.03"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.02"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 6
							},
							["1.03"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["20"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["20.02"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["20.03"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["21"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["21.02"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 6
							},
							["21.03"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Enraged Marionette",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 200,
						Medium = 220,
						Hard = 240,
						Impossible = 260,
						Nightmare = 280
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 2, 5 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Soul = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 400,
						WaveTime = 50,
						Enemies = {
							["0"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.03"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["4.02"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.01"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 800,
						WaveTime = 40,
						Enemies = {
							["0"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.02"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.03"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.04"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.05"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.04"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.05"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.02"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.01"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.03"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.04"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.05"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.03"] = {
								Enemy = "Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.04"] = {
								Enemy = "Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.05"] = {
								Enemy = "Withered Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.01"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.02"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["2"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 6,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["2.01"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 6,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.02"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 6,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 45,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 40,
						Enemies = {
							["3"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["2"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["6"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 50,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.01"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.02"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 40,
						Enemies = {
							["3"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 700,
						WaveTime = 60,
						Enemies = {
							["0"] = {
								Enemy = "Zombie Shadow Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5.02"] = {
								Enemy = "Zombie Shadow Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["8.03"] = {
								Enemy = "Zombie Toy Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["10.04"] = {
								Enemy = "Zombie Toy Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["12.05"] = {
								Enemy = "Zombie Toy Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["15.06"] = {
								Enemy = "Zombie Mangle",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["18.07"] = {
								Enemy = "Zombie Puppet",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["21.08"] = {
								Enemy = "Zombie Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["25.09"] = {
								Enemy = "Withered Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["28.1"] = {
								Enemy = "Withered Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["30.11"] = {
								Enemy = "Withered Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["32.12"] = {
								Enemy = "Withered Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["35.13"] = {
								Enemy = "Withered Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					}
				}
			}
		}
	},
	["3"] = {
		Nights = {
			{
				StartingCash = 3000,
				Boss = {
					Name = "Cadaver Endo",
					Spawn = 2
				},
				Rewards = {
					Tokens = {
						Easy = 200,
						Medium = 220,
						Hard = 240,
						Impossible = 260,
						Nightmare = 280
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 3, 7 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_OldTV = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 2,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.13"] = {
								Enemy = "Ignited Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.13"] = {
								Enemy = "Ignited Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["1"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["0.2"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.2"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.2"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					}
				}
			},
			{
				StartingCash = 4000,
				Boss = {
					Name = "Toxic CupCake",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 220,
						Medium = 240,
						Hard = 260,
						Impossible = 280,
						Nightmare = 300
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 3, 7 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_OldTV = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 2,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.13"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["0.13"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["2.13"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Ignited Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Ignited Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ignited Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ignited Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Cupcake",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Cupcake",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Cupcake",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Cupcake",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Cupcake",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Chica",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Cupcake",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Cupcake",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Cupcake",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.2"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.2"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.2"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.2"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					}
				}
			},
			{
				StartingCash = 4000,
				Boss = {
					Name = "Melted Balloon Boy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 240,
						Medium = 260,
						Hard = 280,
						Impossible = 300,
						Nightmare = 320
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 3, 7 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_OldTV = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 2,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Endo",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Endo",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.3"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 4000,
				Boss = {
					Name = "Scavenged Freddy",
					Spawn = 5
				},
				Rewards = {
					Tokens = {
						Easy = 250,
						Medium = 275,
						Hard = 300,
						Impossible = 325,
						Nightmare = 350
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 3, 7 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_OldTV = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 2,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ignited Chica",
								Health = "3000",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["4"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["5"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["4"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["4"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["5"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Ignited Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 6
							},
							["2"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 6
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Endo",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ignited Endo",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 6
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Ignited Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["2.1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 6
							},
							["2.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							},
							["0.3"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.3"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					}
				}
			},
			{
				StartingCash = 4000,
				Boss = {
					Name = "Discarded Puppet",
					Spawn = 2
				},
				Rewards = {
					Tokens = {
						Easy = 250,
						Medium = 275,
						Hard = 300,
						Impossible = 325,
						Nightmare = 350
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 3, 7 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_OldTV = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 2,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Cupcake",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Cupcake",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Cupcake",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Freddy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Puppet",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Endo",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Endo",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Endo",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Endo",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.3"] = {
								Enemy = "Ignited Endo",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.3"] = {
								Enemy = "Ignited Endo",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Binded SpringTrap",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 250,
						Medium = 275,
						Hard = 300,
						Impossible = 325,
						Nightmare = 350
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 3, 7 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_OldTV = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 2,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Cupcake",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Foxy",
								Amount = 10,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Foxy",
								Amount = 10,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Foxy",
								Amount = 10,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Foxy",
								Amount = 10,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Puppet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Golden Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Balloon Boy",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Rusting Endo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Rusting Endo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Rusting Endo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Rusting Endo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Rusting Endo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Rusting Endo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Rusting Endo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Rusting Endo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Rusting Endo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Ignited Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Ignited Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ignited Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ignited Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Endo",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Endo",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Endo",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Endo",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ignited Chica",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Ignited Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Ignited Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ignited Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ignited Freddy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.2"] = {
								Enemy = "Ignited Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["0.3"] = {
								Enemy = "Ignited Endo",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.3"] = {
								Enemy = "Ignited Endo",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					}
				}
			}
		}
	},
	["4"] = {
		Nights = {
			{
				StartingCash = 2000,
				Boss = {
					Name = "Carnage Bonnie",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 250,
						Medium = 275,
						Hard = 300,
						Impossible = 325,
						Nightmare = 350
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
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
								Enemy = "Cursed Bonnie",
								Amount = 2,
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
								Enemy = "Cursed Bonnie",
								Amount = 3,
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
								Enemy = "Cursed Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					}
				}
			},
			{
				StartingCash = 2000,
				Boss = {
					Name = "Apostle Freddy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 250,
						Medium = 275,
						Hard = 300,
						Impossible = 325,
						Nightmare = 350
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
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
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 10,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 3000,
				Boss = {
					Name = "Deadman Foxy",
					Spawn = 2
				},
				Rewards = {
					Tokens = {
						Easy = 250,
						Medium = 275,
						Hard = 300,
						Impossible = 325,
						Nightmare = 350
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["2.2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2.3"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.2"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["6"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["7"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["7"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["5.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					}
				}
			},
			{
				StartingCash = 3000,
				Boss = {
					Name = "Calamity NightMarionne",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 250,
						Medium = 275,
						Hard = 300,
						Impossible = 325,
						Nightmare = 350
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["2.2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2.3"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.2"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["6"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["7"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 7,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["7"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["5.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					}
				}
			},
			{
				StartingCash = 4000,
				Boss = {
					Name = "Tormented Fredbear",
					Spawn = 5
				},
				Rewards = {
					Tokens = {
						Easy = 250,
						Medium = 275,
						Hard = 300,
						Impossible = 325,
						Nightmare = 350
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 1,
								Spawn = 4
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["2.2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2.3"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["3.3"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.2"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2.3"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2.3"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["1.2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["1.2"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["1.2"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["5"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 3,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["1.2"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["6"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["7"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2.2"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Cursed Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2"] = {
								Enemy = "Cursed Freddy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["7"] = {
								Enemy = "Cursed Chica",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["5.01"] = {
								Enemy = "Cursed Foxy",
								Amount = 2,
								TimeBetweenSpawns = 1,
								Spawn = 4
							},
							["2.2"] = {
								Enemy = "Cursed Foxy",
								Amount = 5,
								TimeBetweenSpawns = 1,
								Spawn = 5
							}
						}
					}
				}
			},
			{
				StartingCash = 20000,
				Boss = {
					Name = "Nightmare\'s Gambit",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 250,
						Medium = 275,
						Hard = 300,
						Impossible = 325,
						Nightmare = 350
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.5"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Cursed Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Cursed Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Cursed Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Cursed Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Cursed Balloon Boy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Cursed Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Cursed Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Cursed Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Cursed Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Cursed Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Cursed Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Cursed Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Cursed Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Cursed Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Cursed Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Cursed Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Cursed Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Cursed Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Cursed Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Cursed Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Cursed Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Cursed Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Cursed Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.5"] = {
								Enemy = "Marionne\'s Gambit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					}
				}
			}
		}
	},
	["5"] = {
		Nights = {
			{
				StartingCash = 2000,
				Boss = {
					Name = "Critical Funtime Foxy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 275,
						Medium = 300,
						Hard = 325,
						Impossible = 350,
						Nightmare = 375
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.5"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.5"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.5"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 10,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["6"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 2500,
				Boss = {
					Name = "Mediafreak Lolbit",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 300,
						Medium = 325,
						Hard = 350,
						Impossible = 375,
						Nightmare = 400
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Ruined Lolbit",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.5"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.5"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.5"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["5"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					}
				}
			},
			{
				StartingCash = 2500,
				Boss = {
					Name = "Dismantled Ballora",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 325,
						Medium = 350,
						Hard = 375,
						Impossible = 400,
						Nightmare = 425
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 4,
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
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.4"] = {
								Enemy = "Ruined Funtime Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.3"] = {
								Enemy = "Ruined Funtime Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.2"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2.3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["6"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["7"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					}
				}
			},
			{
				StartingCash = 3500,
				Boss = {
					Name = "Hijacked Freddy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 350,
						Medium = 375,
						Hard = 400,
						Impossible = 425,
						Nightmare = 450
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Funtime Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Funtime Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Crazed Circus Baby",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 375,
						Medium = 400,
						Hard = 425,
						Impossible = 450,
						Nightmare = 475
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.35"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.45"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.45"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.2"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2.3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Lolbit",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Ruined Ballora",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["6"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["7"] = {
								Enemy = "Ruined Lolbit",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Ruined Ballora",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["7"] = {
								Enemy = "Ruined Lolbit",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["5.01"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					}
				}
			},
			{
				StartingCash = 27500,
				Boss = {
					Name = "Unforgiving Ennard",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 400,
						Medium = 425,
						Hard = 450,
						Impossible = 475,
						Nightmare = 500
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 4, 8 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Lolbit",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Ballora",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Ballora",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.4"] = {
								Enemy = "Ruined Ballora",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.3"] = {
								Enemy = "Ruined Ballora",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.4"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Lolbit",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Lolbit",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.4"] = {
								Enemy = "Ruined Lolbit",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Ballora",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Lolbit",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Lolbit",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Funtime Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Circus Baby",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Lolbit",
								Amount = 12,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					}
				}
			}
		}
	},
	["6"] = {
		Nights = {
			{
				StartingCash = 3000,
				Boss = {
					Name = "Decommissioned Bonnie",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 300,
						Medium = 325,
						Hard = 350,
						Impossible = 375,
						Nightmare = 400
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.5"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.5"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.5"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Haunted Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Haunted Chica",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["6"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 3500,
				Boss = {
					Name = "Remnant Freddy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 325,
						Medium = 350,
						Hard = 375,
						Impossible = 400,
						Nightmare = 425
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Haunted Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.5"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.5"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.5"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Haunted Chica",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 4000,
				Boss = {
					Name = "Forgotten ScrapTrap",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 350,
						Medium = 375,
						Hard = 400,
						Impossible = 425,
						Nightmare = 450
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 4,
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
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.4"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.3"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.2"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2.3"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.2"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2.1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Haunted Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["6"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["7"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Haunted Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Haunted Lefty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					}
				}
			},
			{
				StartingCash = 4000,
				Boss = {
					Name = "Revived Circus Baby",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 375,
						Medium = 400,
						Hard = 425,
						Impossible = 450,
						Nightmare = 475
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Haunted Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Chica",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Haunted Lefty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Controlled Lefty",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 400,
						Medium = 425,
						Hard = 450,
						Impossible = 475,
						Nightmare = 500
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.35"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Chica",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.45"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.45"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.2"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.3"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.2"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Haunted Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Lefty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Haunted Lefty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Haunted Lefty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Haunted Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["6"] = {
								Enemy = "Haunted Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Haunted Foxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Haunted Lefty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2"] = {
								Enemy = "Haunted Lefty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Haunted Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Haunted Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 35000,
				Boss = {
					Name = "Dismembered Freddy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 425,
						Medium = 450,
						Hard = 475,
						Impossible = 500,
						Nightmare = 525
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Haunted Foxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.4"] = {
								Enemy = "Haunted Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.3"] = {
								Enemy = "Haunted Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.4"] = {
								Enemy = "Haunted Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Foxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Haunted Foxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.4"] = {
								Enemy = "Haunted Foxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Haunted Foxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Chica",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Haunted Chica",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Chica",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Haunted Chica",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Haunted Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Lefty",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Haunted Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Haunted Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Haunted Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Lefty",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Haunted Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Haunted Chica",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Lefty",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Haunted Chica",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Haunted Foxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Lefty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Haunted Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Haunted Lefty",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Haunted Lefty",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Haunted Lefty",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Haunted Foxy",
								Amount = 12,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					}
				}
			}
		}
	},
	["7"] = {
		Nights = {
			{
				StartingCash = 5000,
				Boss = {
					Name = "Rogue Freddy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 350,
						Medium = 375,
						Hard = 400,
						Impossible = 425,
						Nightmare = 450
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
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
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.5"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.5"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.5"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 10,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Ruined Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Ruined Chica",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["6"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Hacked Chica",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 375,
						Medium = 400,
						Hard = 425,
						Impossible = 450,
						Nightmare = 475
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Ruined Roxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.5"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.5"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.5"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Ruined Chica",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Mad Roxy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 400,
						Medium = 425,
						Hard = 450,
						Impossible = 475,
						Nightmare = 500
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 4,
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
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Freddy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.4"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.3"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.2"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2.3"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.2"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2.1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Ruined Freddy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["6"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["7"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Freddy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Ruined Moondrop",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Deviant Monty",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 425,
						Medium = 450,
						Hard = 475,
						Impossible = 500,
						Nightmare = 525
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Freddy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Chica",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Ruined Moondrop",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 20000,
				Boss = {
					Name = "Insomniac Moondrop",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 450,
						Medium = 475,
						Hard = 500,
						Impossible = 525,
						Nightmare = 550
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Roxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Roxy",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Monty",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Ruined Monty",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Ruined Monty",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Ruined Chica",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Roxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Roxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Ruined Roxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Ruined Roxy",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Chica",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Chica",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Chica",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Moondrop",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Roxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Roxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Roxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Roxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Moondrop",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Roxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Chica",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Moondrop",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Chica",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Roxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Moondrop",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Ruined Moondrop",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Ruined Moondrop",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Ruined Roxy",
								Amount = 12,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Insane Music Man",
					Spawn = 9
				},
				Rewards = {
					Tokens = {
						Easy = 475,
						Medium = 500,
						Hard = 525,
						Impossible = 550,
						Nightmare = 575
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							},
							["0.35"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Ruined Chica",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 7
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.2"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 8
							},
							["0.45"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.2"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 7
							},
							["0.4"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.45"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							},
							["2"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 8
							},
							["0.1"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["1.1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.2"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 7
							},
							["2.3"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 8
							},
							["1.1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.2"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 7
							},
							["2"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							},
							["1"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 8
							},
							["0.1"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 7
							},
							["1.1"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 8
							},
							["0.1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Roxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Ruined Roxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 7
							},
							["0.1"] = {
								Enemy = "Ruined Roxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["1.1"] = {
								Enemy = "Ruined Roxy",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["1"] = {
								Enemy = "Ruined Moondrop",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 8
							},
							["3"] = {
								Enemy = "Ruined Moondrop",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Moondrop",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["3"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 7
							},
							["0.1"] = {
								Enemy = "Ruined Monty",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["3.1"] = {
								Enemy = "Ruined Chica",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 8
							},
							["1.1"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							},
							["3.02"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 8
							},
							["1"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 7
							},
							["4"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["4.02"] = {
								Enemy = "Ruined Monty",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							},
							["6"] = {
								Enemy = "Ruined Chica",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["7"] = {
								Enemy = "Ruined Roxy",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 8
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Moondrop",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["1"] = {
								Enemy = "Ruined Moondrop",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 7
							},
							["2"] = {
								Enemy = "Ruined Moondrop",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["3"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 8
							},
							["1"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 6
							},
							["2.01"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Ruined Monty",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 7
							},
							["5"] = {
								Enemy = "Ruined Roxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["4.01"] = {
								Enemy = "Ruined Chica",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["6"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			}
		}
	},
	["8"] = {
		Nights = {
			{
				StartingCash = 5000,
				Boss = {
					Name = "Tarnished Eclipse",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 375,
						Medium = 400,
						Hard = 425,
						Impossible = 450,
						Nightmare = 450
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.5"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.5"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.5"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 10,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["6"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Forgotten Bonnie",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 400,
						Medium = 425,
						Hard = 450,
						Impossible = 475,
						Nightmare = 475
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.5"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.5"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.5"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Candy T",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 425,
						Medium = 450,
						Hard = 475,
						Impossible = 500,
						Nightmare = 500
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 4,
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
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.2"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4.02"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["6"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["6"] = {
								Enemy = "Scrapped Mimic",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Corrupted STAFF Bot",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 450,
						Medium = 475,
						Hard = 500,
						Impossible = 525,
						Nightmare = 525
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Scrapped Bonnie",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Scrapped Mimic",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 20000,
				Boss = {
					Name = "Bloodlust Vanny",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 475,
						Medium = 500,
						Hard = 525,
						Impossible = 550,
						Nightmare = 550
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.35"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
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
								Enemy = "Scrapped Eclipse",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.45"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.4"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.45"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.2"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Mimic",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Scrapped Mimic",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Scrapped Mimic",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4.02"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["6"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Scrapped Mimic",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2"] = {
								Enemy = "Scrapped Mimic",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["5"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4.01"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Haunted Foxy",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 7000,
				Boss = {
					Name = "Forgotten Mimic",
					Spawn = 9
				},
				Rewards = {
					Tokens = {
						Easy = 500,
						Medium = 525,
						Hard = 550,
						Impossible = 575,
						Nightmare = 575
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.3"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped STAFF Bot",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Mimic",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Mimic",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Mimic",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Mimic",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped Eclipse",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Scrapped Mimic",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Scrapped Mimic",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Scrapped Mimic",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Scrapped Candy Cadet",
								Amount = 12,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					}
				}
			}
		}
	},
	["9"] = {
		Nights = {
			{
				StartingCash = 5000,
				Boss = {
					Name = "Dreadful Nedd Bear",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 375,
						Medium = 400,
						Hard = 425,
						Impossible = 450,
						Nightmare = 450
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.5"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.5"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.5"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 10,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["6"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Dreadful Orville",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 400,
						Medium = 425,
						Hard = 450,
						Impossible = 475,
						Nightmare = 475
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Forsaken XOR",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.5"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.5"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.5"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Dreadful Pig Patch",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 425,
						Medium = 450,
						Hard = 475,
						Impossible = 500,
						Nightmare = 500
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 4,
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
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.2"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["3.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["4.02"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["6"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["7"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["4.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["6"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 5000,
				Boss = {
					Name = "Dreadful El Chip",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 450,
						Medium = 475,
						Hard = 500,
						Impossible = 525,
						Nightmare = 525
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Forsaken Nedd Bear",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 15000,
				Boss = {
					Name = "Dreadful XOR",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 475,
						Medium = 500,
						Hard = 525,
						Impossible = 550,
						Nightmare = 550
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken XOR",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken XOR",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken El Chip",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Forsaken El Chip",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Forsaken El Chip",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken XOR",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken XOR",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Forsaken XOR",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Forsaken XOR",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken XOR",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken XOR",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken XOR",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken XOR",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken XOR",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken XOR",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Forsaken XOR",
								Amount = 12,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 20000,
				Boss = {
					Name = "Dreadful Mr Hippo",
					Spawn = 9
				},
				Rewards = {
					Tokens = {
						Easy = 500,
						Medium = 525,
						Hard = 550,
						Impossible = 575,
						Nightmare = 575
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 5, 10 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 15,
						Amount = 1
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.35"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
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
								Enemy = "Forsaken Pig Patch",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.45"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.4"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.45"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.2"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken XOR",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Forsaken XOR",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Forsaken XOR",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Forsaken XOR",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["3.1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["1"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["4.02"] = {
								Enemy = "Forsaken El Chip",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["6"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["7"] = {
								Enemy = "Forsaken XOR",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Forsaken El Chip",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Forsaken XOR",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["4.01"] = {
								Enemy = "Forsaken Pig Patch",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["6"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			}
		}
	},
	["10"] = {
		Nights = {
			{
				StartingCash = 3000,
				Boss = {
					Name = "Controlled Prototype Glamrock Freddy",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 400,
						Medium = 400,
						Hard = 425,
						Impossible = 450,
						Nightmare = 450
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 6, 11 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 0,
						Amount = 0
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.3"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.5"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.5"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.5"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 10,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Glitched Entity 03",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Glitched Entity 03",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["6"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 3000,
				Boss = {
					Name = "Anomalized Tiger Rock",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 425,
						Medium = 425,
						Hard = 450,
						Impossible = 475,
						Nightmare = 500
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 6, 11 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 0,
						Amount = 0
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.5"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.5"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.5"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.5"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.5"] = {
								Enemy = "Glitched Entity 03",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 3000,
				Boss = {
					Name = "Glitchstained JJ",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 450,
						Medium = 450,
						Hard = 475,
						Impossible = 500,
						Nightmare = 525
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 6, 11 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 0,
						Amount = 0
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 4,
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
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Glitched Entity 01",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.2"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3"] = {
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["2.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["3.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["4.02"] = {
								Enemy = "Glitched Entity 01",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["6"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["7"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["2"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Glitched Entity 01",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["4.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["6"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 6000,
				Boss = {
					Name = "Souless Carnie",
					Spawn = 1
				},
				Rewards = {
					Tokens = {
						Easy = 475,
						Medium = 475,
						Hard = 500,
						Impossible = 525,
						Nightmare = 550
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 6, 11 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_GoldenLock = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 0,
						Amount = 0
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Glitched Entity 01",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["3.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.02"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.02"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 7,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["5"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["4.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["6"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			},
			{
				StartingCash = 10000,
				Boss = {
					Name = "Megabab",
					Spawn = 3
				},
				Rewards = {
					Tokens = {
						Easy = 500,
						Medium = 500,
						Hard = 525,
						Impossible = 550,
						Nightmare = 575
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 6, 11 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 0,
						Amount = 0
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 04",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 250,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.2"] = {
								Enemy = "Glitched Entity 02",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.4"] = {
								Enemy = "Glitched Entity 02",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.3"] = {
								Enemy = "Glitched Entity 02",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.4"] = {
								Enemy = "Glitched Entity 03",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 04",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.2"] = {
								Enemy = "Glitched Entity 04",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Glitched Entity 04",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 5,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 8,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.2"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.3"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.3"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["0.3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							},
							["0.2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 5
							},
							["0.3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 12,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							}
						}
					}
				}
			},
			{
				StartingCash = 20000,
				Boss = {
					Name = "Error in the Matrix",
					Spawn = 9
				},
				Rewards = {
					Tokens = {
						Easy = 525,
						Medium = 525,
						Hard = 550,
						Impossible = 575,
						Nightmare = 600
					},
					Item_Souls = {
						Chance = 25,
						Amount = { 6, 11 }
					},
					ClanPoints = {
						Chance = 100,
						Amount = 1
					},
					Item_Flashlight = {
						Chance = 100,
						Amount = { 1, 3 }
					},
					Item_EternalGlass = {
						Chance = 3,
						Amount = 1
					},
					Item_Agony = {
						Chance = 1,
						Amount = 1
					},
					Item_Balloon = {
						Chance = 0,
						Amount = 0
					}
				},
				Waves = {
					{
						Reward = 200,
						WaveTime = 20,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.3"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.35"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
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
								Enemy = "Glitched Entity 03",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 300,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.2"] = {
								Enemy = "Glitched Entity 04",
								Amount = 4,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.4"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.45"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 350,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.2"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.4"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.45"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 400,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.2"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2.3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 450,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 500,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 550,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 3
							},
							["1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["0.1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1.1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 4
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["0.1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1.1"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3.02"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["1"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["5"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["4.02"] = {
								Enemy = "Glitched Entity 02",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["6"] = {
								Enemy = "Glitched Entity 03",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["7"] = {
								Enemy = "Glitched Entity 04",
								Amount = 1,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 6,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 3,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							}
						}
					},
					{
						Reward = 600,
						WaveTime = 30,
						Enemies = {
							["0"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["3"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["3.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["1"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["2"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["2.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4"] = {
								Enemy = "Glitched Entity 02",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							},
							["5"] = {
								Enemy = "Glitched Entity 04",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["4.01"] = {
								Enemy = "Glitched Entity 03",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 1
							},
							["6"] = {
								Enemy = "Forsaken Mr Hippo",
								Amount = 2,
								TimeBetweenSpawns = 0.5,
								Spawn = 2
							}
						}
					}
				}
			}
		}
	},
	["95"] = require(script.PowerMode),
	["98"] = require(script.Tutorial),
	["99"] = require(script.Endless)["99"],
	["1300"] = require(script.Events)["1300"],
	["1301"] = require(script.Events)["1301"],
	["1001"] = require(script.PVP)
}