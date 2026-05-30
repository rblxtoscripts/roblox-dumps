-- https://lua.expert/
return {
	{
		StartingCash = 600,
		Boss = {
			Name = "NOTUSED",
			Spawn = 1
		},
		Rewards = {
			Tokens = {
				Easy = 100,
				Medium = 125,
				Hard = 150,
				Impossible = 175,
				Nightmare = 200
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
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 3
					}
				}
			},
			{
				Reward = 250,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
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
						Enemy = "Zombie Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Foxy",
						Amount = 1,
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
						Enemy = "Zombie Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Foxy",
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
						Enemy = "Zombie Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["1.01"] = {
						Enemy = "Zombie Bonnie",
						Amount = 3,
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
						Enemy = "Zombie Bonnie",
						Amount = 10,
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
						Enemy = "Zombie Chica",
						Amount = 1,
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
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Chica",
						Amount = 1,
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
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
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
						Enemy = "Mangled Bonnie",
						Health = "1000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Foxy",
						Amount = 9,
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
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["0.01"] = {
						Enemy = "Zombie Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Zombie Foxy",
						Amount = 10,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["4"] = {
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
						Enemy = "Zombie Foxy",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.02"] = {
						Enemy = "Zombie Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Zombie Chica",
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
						Enemy = "Zombie Bonnie",
						Amount = 15,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Foxy",
						Amount = 9,
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
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.01"] = {
						Enemy = "Mangled Bonnie Imp",
						Amount = 1,
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
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Chica",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Freddy",
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
						Enemy = "Zombie Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Zombie Chica",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.03"] = {
						Enemy = "Zombie Freddy",
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
					["3.03"] = {
						Enemy = "Zombie Freddy",
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
						Enemy = "Zombie Foxy",
						Amount = 12,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Chica",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.03"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.04"] = {
						Enemy = "Zombie Freddy",
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
						Enemy = "Inflated Cupcake",
						Health = "3000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
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
					["1"] = {
						Enemy = "Zombie Bonnie",
						Amount = 15,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Bonnie",
						Amount = 15,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Bonnie",
						Amount = 15,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Bonnie",
						Amount = 15,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Foxy",
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
						Enemy = "Zombie Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 5
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["3.03"] = {
						Enemy = "Zombie Chica",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Chica",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Chica",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Chica",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Chica",
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
					["3.03"] = {
						Enemy = "Mangled Bonnie Imp",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.02"] = {
						Enemy = "Mangled Bonnie Imp",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Mangled Bonnie Imp",
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
					["3.03"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 5
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["3.03"] = {
						Enemy = "Zombie Chica",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Chica",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Chica",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Chica",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Chica",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 5
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["3.03"] = {
						Enemy = "Zombie Chica",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Chica",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Chica",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Chica",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Chica",
						Amount = 4,
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
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Chica",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Chica",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Chica",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Chica",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Chica",
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
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Chica",
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
						Enemy = "Endo Freddy",
						Health = "7000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
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
					["1"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Chica",
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
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Foxy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
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
						Enemy = "Zombie Foxy",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Foxy",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Foxy",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Foxy",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Foxy",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Chica",
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
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Chica",
						Amount = 3,
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
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Freddy",
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
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Foxy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Freddy",
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
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
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
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Chica",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.13"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.12"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.11"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.14"] = {
						Enemy = "Zombie Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.15"] = {
						Enemy = "Zombie Freddy",
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
						Enemy = "Zombie Foxy",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Foxy",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Foxy",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Foxy",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Foxy",
						Amount = 6,
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
						Enemy = "Boatswain Foxy",
						Health = "13500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
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
					["1"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
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
						Enemy = "Zombie Freddy",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Freddy",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Freddy",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Freddy",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Freddy",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
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
						Enemy = "Zombie Freddy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Freddy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Freddy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Freddy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Freddy",
						Amount = 5,
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
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
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
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Golden Freddy",
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
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Golden Freddy",
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
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Foxy",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Foxy",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Foxy",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Foxy",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Foxy",
						Amount = 6,
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
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Foxy",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Foxy",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Foxy",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Foxy",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Foxy",
						Amount = 7,
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
						Enemy = "Zombie Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Foxy",
						Amount = 5,
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
						Enemy = "Abandoned Chica",
						Health = "20000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Endo",
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
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 1,
						Spawn = 5
					},
					["3.03"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Endo",
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
					["3.03"] = {
						Enemy = "Zombie Endo",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Endo",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Endo",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Endo",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Endo",
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
					["3.03"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["3.02"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["3.01"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3.04"] = {
						Enemy = "Zombie Endo",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["3.05"] = {
						Enemy = "Zombie Endo",
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
						Enemy = "Zombie Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Golden Freddy",
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
						Enemy = "Charged Foxy",
						Health = "1750",
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
						Enemy = "Zombie Golden Freddy",
						Health = "1750",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "1750",
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
						Enemy = "Zombie Golden Freddy",
						Health = "1750",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "1750",
						Amount = 3,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "1750",
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
						Enemy = "Zombie Golden Freddy",
						Health = "1750",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "1750",
						Amount = 2,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "1750",
						Amount = 4,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "1750",
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
						Enemy = "Vengeful Gold Freddy",
						Health = "30000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Endo",
						Health = "2750",
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
						Enemy = "Zombie Endo",
						Health = "2750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "2750",
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
						Enemy = "Zombie Endo",
						Health = "2750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "2750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "2750",
						Amount = 1,
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
						Enemy = "Zombie Endo",
						Health = "2750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "2750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "2750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "2750",
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
						Enemy = "Zombie Endo",
						Health = "2750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "2750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "2750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "2750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "2750",
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
						Enemy = "Zombie Endo",
						Health = "2850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "2850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "2850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "2850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "2850",
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
						Enemy = "Zombie Endo",
						Health = "2950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "2950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "2950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "2950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "2950",
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
						Enemy = "Zombie Endo",
						Health = "3050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "3050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "3050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "3050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "3050",
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
						Enemy = "Zombie Endo",
						Health = "3150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "3150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "3150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "3150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "3150",
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
						Enemy = "Mangled Bonnie",
						Health = "40000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Endo",
						Health = "3350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "3350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "3350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "3350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "3350",
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
						Enemy = "Zombie Endo",
						Health = "3450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "3450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "3450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "3450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "3450",
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
						Enemy = "Zombie Endo",
						Health = "3550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "3550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "3550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "3550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "3550",
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
						Enemy = "Zombie Endo",
						Health = "3650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "3650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "3650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "3650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "3650",
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
						Enemy = "Zombie Endo",
						Health = "3750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "3750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "3750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "3750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "3750",
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
						Enemy = "Zombie Endo",
						Health = "3850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "3850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "3850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "3850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "3850",
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
						Enemy = "Zombie Endo",
						Health = "3950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "3950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "3950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "3950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "3950",
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
						Enemy = "Zombie Endo",
						Health = "4050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "4050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "4050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "4050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "4050",
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
						Enemy = "Zombie Endo",
						Health = "4150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "4150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "4150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "4150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "4150",
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
						Enemy = "Inflated Cupcake",
						Health = "50000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Endo",
						Health = "4350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "4350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "4350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "4350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "4350",
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
						Enemy = "Zombie Endo",
						Health = "4450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "4450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "4450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "4450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "4450",
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
						Enemy = "Zombie Endo",
						Health = "4550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "4550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "4550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "4550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "4550",
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
						Enemy = "Zombie Endo",
						Health = "4650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "4650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "4650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "4650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "4650",
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
						Enemy = "Zombie Endo",
						Health = "4750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "4750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "4750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "4750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "4750",
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
						Enemy = "Zombie Endo",
						Health = "4850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "4850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "4850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "4850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "4850",
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
						Enemy = "Zombie Endo",
						Health = "4950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "4950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "4950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "4950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "4950",
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
						Enemy = "Zombie Endo",
						Health = "5050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "5050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "5050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "5050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "5050",
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
						Enemy = "Zombie Endo",
						Health = "5150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "5150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "5150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "5150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "5150",
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
						Enemy = "Endo Freddy",
						Health = "60000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Endo",
						Health = "5350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "5350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "5350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "5350",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "5350",
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
						Enemy = "Zombie Endo",
						Health = "5450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "5450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "5450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "5450",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "5450",
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
						Enemy = "Zombie Endo",
						Health = "5550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "5550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "5550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "5550",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "5550",
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
						Enemy = "Zombie Endo",
						Health = "5650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "5650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "5650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "5650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "5650",
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
						Enemy = "Zombie Endo",
						Health = "5750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "5750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "5750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "5750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "5750",
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
						Enemy = "Zombie Endo",
						Health = "5850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "5850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "5850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "5850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "5850",
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
						Enemy = "Zombie Endo",
						Health = "5950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "5950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "5950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "5950",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "5950",
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
						Enemy = "Zombie Endo",
						Health = "6050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "6050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "6050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "6050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "6050",
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
						Enemy = "Zombie Endo",
						Health = "6150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "6150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "6150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "6150",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "6150",
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
						Enemy = "Boatswain Foxy",
						Health = "70000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							},
							Present_Endo = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Charged Foxy",
						Health = "2000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "3500",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "5000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "2000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "5000",
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
						Enemy = "Charged Foxy",
						Health = "2200",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "2200",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "5500",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "2200",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "5500",
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
						Enemy = "Charged Foxy",
						Health = "2400",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "2400",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "6050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "2400",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "6050",
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
						Enemy = "Charged Foxy",
						Health = "2600",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "2600",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "6650",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "2600",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "6650",
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
						Enemy = "Charged Foxy",
						Health = "2800",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "2800",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "7320",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "2800",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "7320",
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
						Enemy = "Charged Foxy",
						Health = "3000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "3000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "8050",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "3000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "8050",
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
						Enemy = "Charged Foxy",
						Health = "3300",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "3300",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "8850",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "3300",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "8850",
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
						Enemy = "Charged Foxy",
						Health = "3600",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "3600",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "9730",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "3600",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "9730",
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
						Enemy = "Charged Foxy",
						Health = "3900",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "3900",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "10600",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "3900",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "10600",
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
						Enemy = "Abandoned Chica",
						Health = "100000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 20
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Charged Foxy",
						Health = "4500",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "4500",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "12750",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "4500",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "12750",
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
						Enemy = "Charged Foxy",
						Health = "4800",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "4800",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "13900",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "4800",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "13900",
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
						Enemy = "Charged Foxy",
						Health = "5100",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "5100",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "15130",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "5100",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "15130",
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
						Enemy = "Charged Foxy",
						Health = "5400",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "5400",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "16440",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "5400",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "16440",
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
						Enemy = "Charged Foxy",
						Health = "5700",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "5700",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "17840",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "5700",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "17840",
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
						Enemy = "Charged Foxy",
						Health = "6000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "6000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "19340",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "6000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "19340",
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
						Enemy = "Charged Foxy",
						Health = "6300",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "6300",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "20970",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "6300",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "20970",
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
						Enemy = "Charged Foxy",
						Health = "6600",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "6600",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "22710",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "6600",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "22710",
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
						Enemy = "Charged Foxy",
						Health = "6900",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Charged Foxy",
						Health = "6900",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Reborn Freddy",
						Health = "24640",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Charged Foxy",
						Health = "6900",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Reborn Freddy",
						Health = "24640",
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
						Enemy = "Vengeful Gold Freddy",
						Health = "100000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 20
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Overdrive Endo",
						Health = "30000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "30000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "30000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "30000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "30000",
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
						Enemy = "Overdrive Endo",
						Health = "31500",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "31500",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "31500",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "31500",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "31500",
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
						Enemy = "Overdrive Endo",
						Health = "33075",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "33075",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "33075",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "33075",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "33075",
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
						Enemy = "Overdrive Endo",
						Health = "34728",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "34728",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "34728",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "34728",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "34728",
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
						Enemy = "Overdrive Endo",
						Health = "36464",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "36464",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "36464",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "36464",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "36464",
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
						Enemy = "Overdrive Endo",
						Health = "38287",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "38287",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "38287",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "38287",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "38287",
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
						Enemy = "Overdrive Endo",
						Health = "40199",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "40199",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "40199",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "40199",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "40199",
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
						Enemy = "Overdrive Endo",
						Health = "42209",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "42209",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "42209",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "42209",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "42209",
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
						Enemy = "Overdrive Endo",
						Health = "44309",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "44309",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "44309",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "44309",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "44309",
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
						Enemy = "Mangled Bonnie",
						Health = "500000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 30
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Overdrive Endo",
						Health = "48955",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "48955",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "48955",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "48955",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "48955",
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
						Enemy = "Overdrive Endo",
						Health = "51302",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "51302",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "51302",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "51302",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "51302",
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
						Enemy = "Overdrive Endo",
						Health = "53767",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "53767",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "53767",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "53767",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "53767",
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
						Enemy = "Overdrive Endo",
						Health = "56455",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "56455",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "56455",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "56455",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "56455",
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
						Enemy = "Overdrive Endo",
						Health = "59278",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "59278",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "59278",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "59278",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "59278",
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
						Enemy = "Overdrive Endo",
						Health = "62242",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "62242",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "62242",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "62242",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "62242",
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
						Enemy = "Overdrive Endo",
						Health = "65354",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "65354",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "65354",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "65354",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "65354",
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
						Enemy = "Overdrive Endo",
						Health = "68672",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "68672",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "68672",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "68672",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "68672",
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
						Enemy = "Overdrive Endo",
						Health = "72105",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "72105",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "72105",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "72105",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "72105",
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
						Enemy = "Overdrive Endo",
						Health = "75699",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "75699",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "75699",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "75699",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "75699",
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
						Enemy = "Inflated Cupcake",
						Health = "1000000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 50
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 50
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Overdrive Endo",
						Health = "83253",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "83253",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "83253",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "83253",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "83253",
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
						Enemy = "Overdrive Endo",
						Health = "87316",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "87316",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "87316",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "87316",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "87316",
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
						Enemy = "Overdrive Endo",
						Health = "91582",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "91582",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "91582",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "91582",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "91582",
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
						Enemy = "Overdrive Endo",
						Health = "95961",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "95961",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "95961",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "95961",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "95961",
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
						Enemy = "Overdrive Endo",
						Health = "100959",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "100959",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "100959",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "100959",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "100959",
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
						Enemy = "Overdrive Endo",
						Health = "106007",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "106007",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "106007",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "106007",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "106007",
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
						Enemy = "Overdrive Endo",
						Health = "111307",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "111307",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "111307",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "111307",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "111307",
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
						Enemy = "Overdrive Endo",
						Health = "116872",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "116872",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "116872",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "116872",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "116872",
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
						Enemy = "Endo Freddy",
						Health = "1500000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Overdrive Endo",
						Health = "128852",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "128852",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "128852",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "128852",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "128852",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "135294",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "135294",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "135294",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "135294",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "135294",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "142059",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "142059",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "142059",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "142059",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "142059",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "149162",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "149162",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "149162",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "149162",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "149162",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "156620",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "156620",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "156620",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "156620",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "156620",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "164451",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "164451",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "164451",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "164451",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "164451",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "172673",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "172673",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "172673",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "172673",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "172673",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "181307",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "181307",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "181307",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "181307",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "181307",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "190371",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "190371",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "190371",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "190371",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "190371",
						Amount = 2,
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
						Enemy = "Boatswain Foxy",
						Health = "1500000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Overdrive Endo",
						Health = "209893",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "209893",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "209893",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "209893",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "209893",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "219932",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "219932",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "219932",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "219932",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "219932",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "230418",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "230418",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "230418",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "230418",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "230418",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "241371",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "241371",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "241371",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "241371",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "241371",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "252805",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "252805",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "252805",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "252805",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "252805",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "264739",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "264739",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "264739",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "264739",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "264739",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "277182",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "277182",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "277182",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "277182",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "277182",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "290153",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "290153",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "290153",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "290153",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "290153",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "303671",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "303671",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "303671",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "303671",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "303671",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "317777",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "317777",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "317777",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "317777",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "317777",
						Amount = 2,
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
						Enemy = "Overdrive Endo",
						Health = "317777",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Overdrive Endo",
						Health = "317777",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overdrive Endo",
						Health = "317777",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overdrive Endo",
						Health = "317777",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overdrive Endo",
						Health = "317777",
						Amount = 2,
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
						Enemy = "Zombie Endo",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "14000",
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
						Enemy = "Zombie Endo",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "14000",
						Amount = 1,
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
						Enemy = "Zombie Endo",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "14000",
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
						Enemy = "Zombie Endo",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Endo",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Endo",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Endo",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Endo",
						Health = "14000",
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
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
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
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
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
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
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
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
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
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Zombie Golden Freddy",
						Health = "14000",
						Amount = 1,
						TimeBetweenSpawns = 1,
						Spawn = 5
					}
				}
			}
		}
	},
	{
		StartingCash = 1000,
		Boss = {
			Name = "NOTUSED",
			Spawn = 3
		},
		Rewards = {
			Tokens = {
				Easy = 150,
				Medium = 175,
				Hard = 200,
				Impossible = 225,
				Nightmare = 250
			},
			Item_Souls = {
				Chance = 25,
				Amount = { 2, 5 }
			}
		},
		Waves = {
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Salvaged Balloon Boy",
						Health = "5000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 200
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Lobotomized Bonnie",
						Health = "10000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Chica",
						Health = "20000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Puppet",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Puppet",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Puppet",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Puppet",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Puppet",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Puppet",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Puppet",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Puppet",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Puppet",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Puppet",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Puppet",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Puppet",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Puppet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Puppet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Puppet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Puppet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Puppet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Puppet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Psycho Mangle",
						Health = "30000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Corrupted Soul Freddy",
						Health = "40000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Enraged Marionette",
						Health = "50000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Withered Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Withered Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Withered Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Withered Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.4"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.5"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.6"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Salvaged Balloon Boy",
						Health = "80000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.4"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.5"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.6"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.4"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.5"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.6"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.4"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.5"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.6"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.2"] = {
						Enemy = "Zombie Toy Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.3"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.4"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.5"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.6"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.1"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.2"] = {
						Enemy = "Zombie Toy Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.2"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.2"] = {
						Enemy = "Withered Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Withered Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Withered Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.2"] = {
						Enemy = "Withered Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.2"] = {
						Enemy = "Withered Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Withered Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Withered Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.2"] = {
						Enemy = "Withered Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.2"] = {
						Enemy = "Withered Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Withered Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Withered Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.2"] = {
						Enemy = "Withered Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.2"] = {
						Enemy = "Withered Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Withered Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Withered Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.2"] = {
						Enemy = "Withered Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.2"] = {
						Enemy = "Withered Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Lobotomized Bonnie",
						Health = "90000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Withered Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Withered Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.2"] = {
						Enemy = "Withered Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.2"] = {
						Enemy = "Withered Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Withered Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Withered Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.2"] = {
						Enemy = "Withered Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.2"] = {
						Enemy = "Withered Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Withered Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Withered Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.2"] = {
						Enemy = "Withered Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.2"] = {
						Enemy = "Withered Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Terror March Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.1"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.1"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.3"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.4"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.1"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.3"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.4"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.1"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.3"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.4"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.1"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.3"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.4"] = {
						Enemy = "Withered Golden Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Chica",
						Health = "100000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 1
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.2"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Zombie Mangle",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Mangle",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Mangle",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.2"] = {
						Enemy = "Zombie Mangle",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Zombie Mangle",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Mangle",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Mangle",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.2"] = {
						Enemy = "Zombie Mangle",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Zombie Mangle",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Mangle",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Mangle",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.2"] = {
						Enemy = "Zombie Mangle",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Zombie Mangle",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Mangle",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Mangle",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Zombie Mangle",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.2"] = {
						Enemy = "Zombie Mangle",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Zombie Mangle",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Shadow Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Shadow Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Zombie Shadow Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Zombie Shadow Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Zombie Shadow Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Zombie Shadow Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Psycho Mangle",
						Health = "110000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							},
							Present_Puppet = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "8000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "12500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "8000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "12500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "8000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "12500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "8400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "13125",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "8400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "13125",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "8400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "13125",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "8820",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "13781",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "8820",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "13781",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "8820",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "13781",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "9261",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "14470",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "9261",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "14470",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "9261",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "14470",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "9724",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "15294",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "9724",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "15294",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "9724",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "15294",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "10299",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "16089",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "10299",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "16089",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "10299",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "16089",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "10813",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "16993",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "10813",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "16993",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "10813",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "16993",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "11353",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "17992",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "11353",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "17992",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "11353",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "17992",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "11920",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "19092",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "11920",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "19092",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "11920",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "19092",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Corrupted Soul Freddy",
						Health = "150000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 25
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "13142",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "21511",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "13142",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "21511",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "13142",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "21511",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "13799",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "22796",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "13799",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "22796",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "13799",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "22796",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "14489",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "24136",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "14489",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "24136",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "14489",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "24136",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "15213",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "25543",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "15213",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "25543",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "15213",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "25543",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "15973",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "27020",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "15973",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "27020",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "15973",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "27020",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "16762",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "28571",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "16762",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "28571",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "16762",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "28571",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "17681",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "30193",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "17681",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "30193",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "17681",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "30193",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "18633",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "31900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "18633",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "31900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "18633",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "31900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Terror March Chica",
						Health = "19617",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "33796",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Terror March Chica",
						Health = "19617",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "33796",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Terror March Chica",
						Health = "19617",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Reborn Withered Freddy",
						Health = "33796",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Enraged Marionette",
						Health = "150000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 25
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "40000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "40000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "40000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "40000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "40000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "40000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "42000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "42000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "42000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "42000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "42000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "42000",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "44100",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "44100",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "44100",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "44100",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "44100",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "44100",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "46305",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "46305",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "46305",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "46305",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "46305",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "46305",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "48620",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "48620",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "48620",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "48620",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "48620",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "48620",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "51051",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "51051",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "51051",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "51051",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "51051",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "51051",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "53598",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "53598",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "53598",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "53598",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "53598",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "53598",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "56218",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "56218",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "56218",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "56218",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "56218",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "56218",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "59028",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "59028",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "59028",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "59028",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "59028",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "59028",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Enraged Marionette",
						Health = "300000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 50
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 50
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "65078",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "65078",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "65078",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "65078",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "65078",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "65078",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "68332",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "68332",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "68332",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "68332",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "68332",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "68332",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "71749",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "71749",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "71749",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "71749",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "71749",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "71749",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "75336",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "75336",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "75336",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "75336",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "75336",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "75336",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "79098",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "79098",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "79098",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "79098",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "79098",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "79098",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "83053",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "83053",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "83053",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "83053",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "83053",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "83053",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "87181",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "87181",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "87181",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "87181",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "87181",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "87181",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "91590",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "91590",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "91590",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "91590",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "91590",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "91590",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Awakened Puppet",
						Health = "96169",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Awakened Puppet",
						Health = "96169",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.1"] = {
						Enemy = "Awakened Puppet",
						Health = "96169",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.1"] = {
						Enemy = "Awakened Puppet",
						Health = "96169",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.2"] = {
						Enemy = "Awakened Puppet",
						Health = "96169",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.2"] = {
						Enemy = "Awakened Puppet",
						Health = "96169",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Enraged Marionette",
						Health = "400000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 225
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 50
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 50
							}
						}
					}
				}
			}
		}
	},
	{
		StartingCash = 3000,
		Boss = {
			Name = "NOTUSED",
			Spawn = 3
		},
		Rewards = {
			Tokens = {
				Easy = 150,
				Medium = 175,
				Hard = 200,
				Impossible = 225,
				Nightmare = 250
			},
			Item_Souls = {
				Chance = 25,
				Amount = { 2, 5 }
			}
		},
		Waves = {
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Cupcake",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Cupcake",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Cadaver Endo",
						Health = "50000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 3
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Cupcake",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Cupcake",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
				Reward = 400,
				WaveTime = 50,
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
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Toxic CupCake",
						Health = "75000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 3
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Melted Balloon Boy",
						Health = "100000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 3
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Discarded Puppet",
						Health = "125000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 3
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Shadow Step Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Shadow Step Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Shadow Step Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Shadow Step Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Cupcake",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Cupcake",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Cupcake",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Cupcake",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
				Reward = 400,
				WaveTime = 50,
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
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Cupcake",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Cupcake",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Cupcake",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Cupcake",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Cupcake",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Cupcake",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Cupcake",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Cupcake",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Cupcake",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Cupcake",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Cupcake",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Cupcake",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Cupcake",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Cupcake",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Cupcake",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Cupcake",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Scavenged Freddy",
						Health = "110000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 3
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Foxy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Foxy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Foxy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Foxy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Binded SpringTrap",
						Health = "120000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 3
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 3,
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
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
					},
					["0.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3.1"] = {
						Enemy = "Ignited Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Cadaver Endo",
						Health = "130000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 3
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Balloon Boy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Toxic CupCake",
						Health = "140000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Golden Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
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
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Discarded Puppet",
						Health = "145000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Freddy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ignited Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ignited Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ignited Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ignited Freddy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Rusting Endo",
						Health = "20000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Rusting Endo",
						Health = "20000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Rusting Endo",
						Health = "20000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Rusting Endo",
						Health = "20000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Rusting Endo",
						Health = "30000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Rusting Endo",
						Health = "30000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Rusting Endo",
						Health = "30000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Rusting Endo",
						Health = "30000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Rusting Endo",
						Health = "40000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Rusting Endo",
						Health = "40000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Rusting Endo",
						Health = "40000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Rusting Endo",
						Health = "40000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Scavenged Freddy",
						Health = "150000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							},
							Present_PhantomFreddy = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "60000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "100000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "60000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "100000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "63000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "105000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "63000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "105000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "66150",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "110250",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "66150",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "110250",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "69457",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "115762",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "69457",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "115762",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "72930",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "121550",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "72930",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "121550",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "76576",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "127627",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "76576",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "127627",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "80304",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "134008",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "80304",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "134008",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "84299",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "140708",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "84299",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "140708",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "88494",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "147746",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "88494",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "147746",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Binded SpringTrap",
						Health = "200000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 25
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 50
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "97494",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "162903",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "97494",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "162903",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "102719",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "170938",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "102719",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "170938",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "107855",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "179281",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "107855",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "179281",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "113248",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "187921",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "113248",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "187921",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "118911",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "196957",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "118911",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "196957",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "124855",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "206295",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "124855",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "206295",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "131084",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "215944",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "131084",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "215944",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "137602",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "225905",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "137602",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "225905",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "ShadowStep Foxy",
						Health = "144426",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "ReIgnited Chica",
						Health = "236187",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "ShadowStep Foxy",
						Health = "144426",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "ReIgnited Chica",
						Health = "236187",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Binded SpringTrap",
						Health = "300000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 50
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "62500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "62500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "62500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "62500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "65625",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "65625",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "65625",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "65625",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "68906",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "68906",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "68906",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "68906",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "72352",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "72352",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "72352",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "72352",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "75969",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "75969",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "75969",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "75969",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "79517",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "79517",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "79517",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "79517",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "83493",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "83493",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "83493",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "83493",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "87668",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "87668",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "87668",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "87668",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "92051",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "92051",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "92051",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "92051",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Binded SpringTrap",
						Health = "350000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "101486",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "101486",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "101486",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "101486",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "125000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "125000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "125000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "125000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "131250",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "131250",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "131250",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "131250",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "137812",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "137812",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "137812",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "137812",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "144703",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "144703",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "144703",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "144703",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "151938",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "151938",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "151938",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "151938",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "159034",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "159034",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "159034",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "159034",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "166986",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "166986",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "166986",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "166986",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "175335",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "175335",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "175335",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "175335",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Binded SpringTrap",
						Health = "400000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "193306",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "193306",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "193306",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "193306",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "202972",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "202972",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "202972",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "202972",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "212990",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "212990",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "212990",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "212990",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "223466",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "223466",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "223466",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "223466",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "234407",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "234407",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "234407",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "234407",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "245825",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "245825",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "245825",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "245825",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "257725",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "257725",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "257725",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "257725",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "270117",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "270117",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "270117",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "270117",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "283015",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "283015",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "283015",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "283015",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Binded SpringTrap",
						Health = "500000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 250
							},
							Item_Souls = {
								Amount = { 1, 3 }
							},
							Present_Endless1 = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 50
							}
						}
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "310373",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "310373",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "310373",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "310373",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Endo",
						Health = "324878",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Carnage Endo",
						Health = "324878",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Carnage Endo",
						Health = "324878",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Carnage Endo",
						Health = "324878",
						Amount = 2,
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
			Name = "NOTUSED",
			Spawn = 3
		},
		Rewards = {
			Tokens = {
				Easy = 150,
				Medium = 175,
				Hard = 200,
				Impossible = 225,
				Nightmare = 250
			},
			Item_Souls = {
				Chance = 25,
				Amount = { 2, 5 }
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
					["0.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 250,
				WaveTime = 25,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					}
				}
			},
			{
				Reward = 300,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["2"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 350,
				WaveTime = 35,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 40,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["2"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 450,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["2"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 500,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["2"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					}
				}
			},
			{
				Reward = 550,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 60,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["4"] = {
						Enemy = "Cursed Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Bonnie",
						Health = "70000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
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
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Cursed Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 35,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Cursed Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Cursed Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					}
				}
			},
			{
				Reward = 700,
				WaveTime = 40,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.5"] = {
						Enemy = "Cursed Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 750,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1.5"] = {
						Enemy = "Cursed Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3.5"] = {
						Enemy = "Cursed Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 800,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Cursed Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3.5"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 850,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3.5"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 900,
				WaveTime = 60,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3.5"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 950,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3.5"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 1000,
				WaveTime = 70,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3.5"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["4"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4.5"] = {
						Enemy = "Cursed Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 1050,
				WaveTime = 75,
				Enemies = {
					["0"] = {
						Enemy = "Apostle Freddy",
						Health = "107500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 1100,
				WaveTime = 80,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3.5"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1150,
				WaveTime = 85,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3.5"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1200,
				WaveTime = 90,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3.5"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 1250,
				WaveTime = 95,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3.5"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 1300,
				WaveTime = 100,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3.5"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 1350,
				WaveTime = 105,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3.5"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1400,
				WaveTime = 110,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3.5"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1450,
				WaveTime = 115,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3.5"] = {
						Enemy = "Cursed Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 1500,
				WaveTime = 120,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Cursed Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Cursed Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3.5"] = {
						Enemy = "Cursed Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 1550,
				WaveTime = 125,
				Enemies = {
					["0"] = {
						Enemy = "Deadman Foxy",
						Health = "172500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 1600,
				WaveTime = 130,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1650,
				WaveTime = 135,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1700,
				WaveTime = 140,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 1750,
				WaveTime = 145,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 1800,
				WaveTime = 150,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 1850,
				WaveTime = 155,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1900,
				WaveTime = 160,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1950,
				WaveTime = 165,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2000,
				WaveTime = 170,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 2050,
				WaveTime = 175,
				Enemies = {
					["0"] = {
						Enemy = "Calamity NightMarionne",
						Health = "251000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 2100,
				WaveTime = 180,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2150,
				WaveTime = 185,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2200,
				WaveTime = 190,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2250,
				WaveTime = 195,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 2300,
				WaveTime = 200,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2350,
				WaveTime = 205,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2400,
				WaveTime = 210,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2450,
				WaveTime = 215,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2500,
				WaveTime = 220,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 2550,
				WaveTime = 225,
				Enemies = {
					["0"] = {
						Enemy = "Tormented Fredbear",
						Health = "344000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 2600,
				WaveTime = 230,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2650,
				WaveTime = 235,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2700,
				WaveTime = 240,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2750,
				WaveTime = 245,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 2800,
				WaveTime = 250,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2850,
				WaveTime = 255,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2900,
				WaveTime = 260,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2950,
				WaveTime = 265,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3000,
				WaveTime = 270,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Cursed Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 3050,
				WaveTime = 275,
				Enemies = {
					["0"] = {
						Enemy = "Nightmare\'s Gambit",
						Health = "450000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 3100,
				WaveTime = 280,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "38000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "22800",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "45600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "38000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "22800",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "45600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3150,
				WaveTime = 285,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "38500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "23100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "46200",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "38500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "23100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "46200",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3200,
				WaveTime = 290,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "39000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "23400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "46800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "39000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "23400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "46800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3250,
				WaveTime = 295,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "39500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "23700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "47400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "39500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "23700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "47400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 3300,
				WaveTime = 300,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "40000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "24000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "48000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "40000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "24000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "48000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3350,
				WaveTime = 305,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "40500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "24300",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "48600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "40500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "24300",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "48600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 3400,
				WaveTime = 310,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "41000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "24600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "49200",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "41000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "24600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "49200",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3450,
				WaveTime = 315,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "41500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "24900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "49800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "41500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "24900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "49800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3500,
				WaveTime = 320,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "42000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "25200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "50400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "42000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "25200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "50400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3550,
				WaveTime = 325,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Bonnie",
						Health = "571600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 3600,
				WaveTime = 330,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "48100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "28900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "57700",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "48100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "28900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "57700",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3650,
				WaveTime = 335,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "48400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "29000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "58100",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "48400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "29000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "58100",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3700,
				WaveTime = 340,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "48700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "29200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "58400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "48700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "29200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "58400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3750,
				WaveTime = 345,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "49000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "29400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "58800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "49000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "29400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "58800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 3800,
				WaveTime = 350,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "49300",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "29600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "59200",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "49300",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "29600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "59200",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3850,
				WaveTime = 355,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "49600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "29800",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "59500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "49600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "29800",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "59500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 3900,
				WaveTime = 360,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "49900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "30000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "59900",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "49900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "30000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "59900",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3950,
				WaveTime = 365,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "50200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "30100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "60300",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "50200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "30100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "60300",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4000,
				WaveTime = 370,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "50500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "30300",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "60600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "50500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "30300",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "60600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4050,
				WaveTime = 375,
				Enemies = {
					["0"] = {
						Enemy = "Apostle Freddy",
						Health = "706400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 4100,
				WaveTime = 380,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "59200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "35500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "71000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "59200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "35500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "71000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4150,
				WaveTime = 385,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "59500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "35700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "71400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "59500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "35700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "71400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4200,
				WaveTime = 390,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "59800",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "35900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "71800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "59800",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "35900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "71800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4250,
				WaveTime = 395,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "60100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "36100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "72100",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "60100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "36100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "72100",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 4300,
				WaveTime = 400,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "60400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "36200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "72500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "60400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "36200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "72500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 4350,
				WaveTime = 405,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "60700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "36400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "72800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "60700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "36400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "72800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4400,
				WaveTime = 410,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "61000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "36600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "73200",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "61000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "36600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "73200",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4450,
				WaveTime = 415,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "61300",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "36800",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "73600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "61300",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "36800",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "73600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4500,
				WaveTime = 420,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "61600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "37000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "74000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "61600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "37000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "74000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4550,
				WaveTime = 425,
				Enemies = {
					["0"] = {
						Enemy = "Deadman Foxy",
						Health = "855200",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 4600,
				WaveTime = 430,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "71600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "85900",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "71600",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "85900",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4650,
				WaveTime = 435,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "71900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "86300",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "71900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "86300",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4700,
				WaveTime = 440,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "72200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43300",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "86600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "72200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43300",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "86600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4750,
				WaveTime = 445,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "72500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "87000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "72500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43500",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "87000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 4800,
				WaveTime = 450,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "72800",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "87400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "72800",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "87400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 4850,
				WaveTime = 455,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "73100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "87700",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "73100",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "43900",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "87700",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4900,
				WaveTime = 460,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "73400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "44000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "88100",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "73400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "44000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "88100",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4950,
				WaveTime = 465,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "73700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "44200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "88400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "73700",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "44200",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "88400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5000,
				WaveTime = 470,
				Enemies = {
					["0"] = {
						Enemy = "Cursed Freddy",
						Health = "74000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "44400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "88800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1.5"] = {
						Enemy = "Cursed Freddy",
						Health = "74000",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Cursed Balloon Boy",
						Health = "44400",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2.5"] = {
						Enemy = "Marionne\'s Gambit",
						Health = "88800",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4950,
				WaveTime = 465,
				Enemies = {
					["0"] = {
						Enemy = "Calamity NightMarionne",
						Health = "1000000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_PlushtrapPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 5000,
				WaveTime = 470,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "77385",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "46410",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "77385",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "46410",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "77385",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "46410",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5050,
				WaveTime = 475,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "81254",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "48730",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "81254",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "48730",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "81254",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "48730",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5100,
				WaveTime = 480,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "85317",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "51167",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "85317",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "51167",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "85317",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "51167",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5150,
				WaveTime = 485,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "89583",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "53725",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "89583",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "53725",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "89583",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "53725",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5200,
				WaveTime = 490,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "94062",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "56412",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "94062",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "56412",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "94062",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "56412",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5250,
				WaveTime = 495,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "98765",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "59232",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "98765",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "59232",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "98765",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "59232",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5300,
				WaveTime = 500,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "103703",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "62194",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "103703",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "62194",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "103703",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "62194",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5350,
				WaveTime = 505,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "108888",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "65304",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "108888",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "65304",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "108888",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "65304",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5400,
				WaveTime = 510,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "114333",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "68569",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "114333",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "68569",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "114333",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "68569",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5450,
				WaveTime = 515,
				Enemies = {
					["0"] = {
						Enemy = "Tormented Fredbear",
						Health = "1152282",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 5500,
				WaveTime = 520,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "120050",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "71997",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "120050",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "71997",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "120050",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "71997",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5550,
				WaveTime = 525,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "126052",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "75597",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "126052",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "75597",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "126052",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "75597",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5600,
				WaveTime = 530,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "132355",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "79377",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "132355",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "79377",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "132355",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "79377",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5650,
				WaveTime = 535,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "138973",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "83346",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "138973",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "83346",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "138973",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "83346",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5700,
				WaveTime = 540,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "145922",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "87513",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "145922",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "87513",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "145922",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "87513",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5750,
				WaveTime = 545,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "153218",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "91888",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "153218",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "91888",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "153218",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "91888",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5800,
				WaveTime = 550,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "160878",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "96483",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "160878",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "96483",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "160878",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "96483",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5850,
				WaveTime = 555,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "168922",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "101307",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "168922",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "101307",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "168922",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "101307",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5900,
				WaveTime = 560,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "177369",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "106372",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "177369",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "106372",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "177369",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "106372",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5950,
				WaveTime = 565,
				Enemies = {
					["0"] = {
						Enemy = "Nightmare\'s Gambit",
						Health = "1787568",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 6000,
				WaveTime = 570,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "186237",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "111691",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "186237",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "111691",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "186237",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "111691",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6050,
				WaveTime = 575,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "195549",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "117276",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "195549",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "117276",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "195549",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "117276",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6100,
				WaveTime = 580,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "205326",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "123139",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "205326",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "123139",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "205326",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "123139",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6150,
				WaveTime = 585,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "215593",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "129296",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "215593",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "129296",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "215593",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "129296",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6200,
				WaveTime = 590,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "226372",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "135761",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "226372",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "135761",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "226372",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "135761",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6250,
				WaveTime = 595,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "237691",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "142549",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "237691",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "142549",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "237691",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "142549",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6300,
				WaveTime = 600,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "249575",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "149677",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "249575",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "149677",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "249575",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "149677",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6350,
				WaveTime = 605,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "262054",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "157160",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "262054",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "157160",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "262054",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "157160",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6400,
				WaveTime = 610,
				Enemies = {
					["0"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "275157",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "165018",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "275157",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "165018",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "SpeedBlitz Balloon Boy",
						Health = "275157",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Reborn Cursed Bonnie",
						Health = "165018",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6450,
				WaveTime = 615,
				Enemies = {
					["0"] = {
						Enemy = "Carnage Bonnie",
						Health = "2773104",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 50
							}
						}
					}
				}
			},
			{
				Reward = 6500,
				WaveTime = 620,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "288915",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "288915",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "288915",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "288915",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "288915",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "288915",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6550,
				WaveTime = 625,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "303361",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "303361",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "303361",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "303361",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "303361",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "303361",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6600,
				WaveTime = 630,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "318529",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "318529",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "318529",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "318529",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "318529",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "318529",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6650,
				WaveTime = 635,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "334455",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "334455",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "334455",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "334455",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "334455",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "334455",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6700,
				WaveTime = 640,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "351178",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "351178",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "351178",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "351178",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "351178",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "351178",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6750,
				WaveTime = 645,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "368737",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "368737",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "368737",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "368737",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "368737",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "368737",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6800,
				WaveTime = 650,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "387174",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "387174",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "387174",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "387174",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "387174",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "387174",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6850,
				WaveTime = 655,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "406532",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "406532",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "406532",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "406532",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "406532",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "406532",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6900,
				WaveTime = 660,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "426859",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "426859",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "426859",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "426859",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "426859",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "426859",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 6950,
				WaveTime = 665,
				Enemies = {
					["0"] = {
						Enemy = "Apostle Freddy",
						Health = "5378424",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 7000,
				WaveTime = 670,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "448202",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "448202",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "448202",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "448202",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "448202",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "448202",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7050,
				WaveTime = 675,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "470612",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "470612",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "470612",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "470612",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "470612",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "470612",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7100,
				WaveTime = 680,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "494143",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "494143",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "494143",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "494143",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "494143",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "494143",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7150,
				WaveTime = 685,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "518850",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "518850",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "518850",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "518850",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "518850",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "518850",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7200,
				WaveTime = 690,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "544792",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "544792",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "544792",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "544792",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "544792",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "544792",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7250,
				WaveTime = 695,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "572032",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "572032",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "572032",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "572032",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "572032",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "572032",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7300,
				WaveTime = 700,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "600634",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "600634",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "600634",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "600634",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "600634",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "600634",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7350,
				WaveTime = 705,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "630665",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "630665",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "630665",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "630665",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "630665",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "630665",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7400,
				WaveTime = 710,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "662198",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "662198",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "662198",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "662198",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "662198",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "662198",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7450,
				WaveTime = 715,
				Enemies = {
					["0"] = {
						Enemy = "Deadman Foxy",
						Health = "12515544",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 7500,
				WaveTime = 720,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "695308",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "695308",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "695308",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "695308",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "695308",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "695308",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7550,
				WaveTime = 725,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "730073",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "730073",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "730073",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "730073",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "730073",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "730073",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7600,
				WaveTime = 730,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "766577",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "766577",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "766577",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "766577",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "766577",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "766577",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7650,
				WaveTime = 735,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "804906",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "804906",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "804906",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "804906",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "804906",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "804906",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7700,
				WaveTime = 740,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "845151",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "845151",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "845151",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "845151",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "845151",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "845151",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7750,
				WaveTime = 745,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "887409",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "887409",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "887409",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "887409",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "887409",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "887409",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7800,
				WaveTime = 750,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "931779",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "931779",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "931779",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "931779",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "931779",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "931779",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7850,
				WaveTime = 755,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "978368",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "978368",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "978368",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "978368",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "978368",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "978368",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7900,
				WaveTime = 760,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "1027287",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "1027287",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "1027287",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "1027287",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "1027287",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "1027287",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7950,
				WaveTime = 765,
				Enemies = {
					["0"] = {
						Enemy = "Calamity NightMarionne",
						Health = "19415718",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 8000,
				WaveTime = 770,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "1078651",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "1078651",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "1078651",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "1078651",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "1078651",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "1078651",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8050,
				WaveTime = 775,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "1132584",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "1132584",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "1132584",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "1132584",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "1132584",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "1132584",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8100,
				WaveTime = 780,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "1189213",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "1189213",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "1189213",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "1189213",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "1189213",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "1189213",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8150,
				WaveTime = 785,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "1248673",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "1248673",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "1248673",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "1248673",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "1248673",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "1248673",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8200,
				WaveTime = 790,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "1311107",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "1311107",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "1311107",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "1311107",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "1311107",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "1311107",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8250,
				WaveTime = 795,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "1376662",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "1376662",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "1376662",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "1376662",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "1376662",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "1376662",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8300,
				WaveTime = 800,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "1445496",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "1445496",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "1445496",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "1445496",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "1445496",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "1445496",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8350,
				WaveTime = 805,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "1517770",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "1517770",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "1517770",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "1517770",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "1517770",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "1517770",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8400,
				WaveTime = 810,
				Enemies = {
					["0"] = {
						Enemy = "Final Gambit",
						Health = "1593659",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 4
					},
					["0.5"] = {
						Enemy = "Final Gambit",
						Health = "1593659",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Final Gambit",
						Health = "1593659",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 3
					},
					["1.5"] = {
						Enemy = "Final Gambit",
						Health = "1593659",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Final Gambit",
						Health = "1593659",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Final Gambit",
						Health = "1593659",
						Amount = 3,
						TimeBetweenSpawns = 0.8,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8450,
				WaveTime = 815,
				Enemies = {
					["0"] = {
						Enemy = "Calamity NightMarionne",
						Health = "30120156",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 350
							},
							Item_Souls = {
								Amount = 3
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			}
		}
	},
	{
		StartingCash = 6000,
		Boss = {
			Name = "NOTUSED",
			Spawn = 3
		},
		Rewards = {
			Tokens = {
				Easy = 150,
				Medium = 175,
				Hard = 200,
				Impossible = 225,
				Nightmare = 250
			},
			Item_Souls = {
				Chance = 25,
				Amount = { 2, 5 }
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
					}
				}
			},
			{
				Reward = 250,
				WaveTime = 25,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Ballora",
						Amount = 3,
						TimeBetweenSpawns = 2,
						Spawn = 2
					}
				}
			},
			{
				Reward = 300,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Ballora",
						Amount = 4,
						TimeBetweenSpawns = 2,
						Spawn = 3
					}
				}
			},
			{
				Reward = 350,
				WaveTime = 35,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.5"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 1,
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
						Enemy = "Ruined Funtime Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2.5"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 450,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Funtime Lolbit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3.5"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 500,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 550,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 60,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Critical Funtime Foxy",
						Health = "70000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 12
							}
						}
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
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Ruined Ballora",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 35,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Ballora",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 700,
				WaveTime = 40,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Ballora",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 750,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Ballora",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Ballora",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 800,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Ballora",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 850,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 900,
				WaveTime = 60,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 950,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1000,
				WaveTime = 70,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1050,
				WaveTime = 75,
				Enemies = {
					["0"] = {
						Enemy = "Mediafreak Lolbit",
						Health = "107500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 12
							}
						}
					}
				}
			},
			{
				Reward = 1100,
				WaveTime = 80,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1150,
				WaveTime = 85,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1200,
				WaveTime = 90,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1250,
				WaveTime = 95,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1300,
				WaveTime = 100,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1350,
				WaveTime = 105,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1400,
				WaveTime = 110,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1450,
				WaveTime = 115,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1500,
				WaveTime = 120,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1550,
				WaveTime = 125,
				Enemies = {
					["0"] = {
						Enemy = "Dismantled Ballora",
						Health = "172500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 1600,
				WaveTime = 130,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1650,
				WaveTime = 135,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1700,
				WaveTime = 140,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1750,
				WaveTime = 145,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1800,
				WaveTime = 150,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1850,
				WaveTime = 155,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1900,
				WaveTime = 160,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1950,
				WaveTime = 165,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2000,
				WaveTime = 170,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2050,
				WaveTime = 175,
				Enemies = {
					["0"] = {
						Enemy = "Hijacked Freddy",
						Health = "251000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 12
							}
						}
					}
				}
			},
			{
				Reward = 2100,
				WaveTime = 180,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2150,
				WaveTime = 185,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2200,
				WaveTime = 190,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2250,
				WaveTime = 195,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2300,
				WaveTime = 200,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2350,
				WaveTime = 205,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2400,
				WaveTime = 210,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2450,
				WaveTime = 215,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2500,
				WaveTime = 220,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2550,
				WaveTime = 225,
				Enemies = {
					["0"] = {
						Enemy = "Crazed Circus Baby",
						Health = "344000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 2600,
				WaveTime = 230,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2650,
				WaveTime = 235,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2700,
				WaveTime = 240,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2750,
				WaveTime = 245,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2800,
				WaveTime = 250,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2850,
				WaveTime = 255,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2900,
				WaveTime = 260,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2950,
				WaveTime = 265,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3000,
				WaveTime = 270,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Ballora",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Funtime Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3050,
				WaveTime = 275,
				Enemies = {
					["0"] = {
						Enemy = "Unforgiving Ennard",
						Health = "450000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 12
							}
						}
					}
				}
			},
			{
				Reward = 3100,
				WaveTime = 280,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 49400,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 29640,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 49400,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 29640,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 59280,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3150,
				WaveTime = 285,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 50050,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 30030,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 50050,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 30030,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 60060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3200,
				WaveTime = 290,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 50700,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 30420,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 50700,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 30420,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 60840,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3250,
				WaveTime = 295,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 51350,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 30810,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 51350,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 30810,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 61620,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 3300,
				WaveTime = 300,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 52000,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 31200,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 52000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 31200,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 62400,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3350,
				WaveTime = 305,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 52650,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 31590,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 52650,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 31590,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 63180,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3400,
				WaveTime = 310,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 53300,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 31980,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 53300,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 31980,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 63960,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3450,
				WaveTime = 315,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 53950,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 32370,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 53950,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 32370,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 64740,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3500,
				WaveTime = 320,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 54600,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 32760,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 54600,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 32760,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 65520,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3550,
				WaveTime = 325,
				Enemies = {
					["0"] = {
						Enemy = "Critical Funtime Foxy",
						Health = "571600",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 12
							}
						}
					}
				}
			},
			{
				Reward = 3600,
				WaveTime = 330,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 62530,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 37570,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 62530,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 37570,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 75010,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3650,
				WaveTime = 335,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 62920,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 37700,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 62920,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 37700,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 75530,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3700,
				WaveTime = 340,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 63310,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 37960,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 63310,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 37960,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 75920,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3750,
				WaveTime = 345,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 63700,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 38220,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 63700,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 38220,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 76440,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 3800,
				WaveTime = 350,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 64090,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 38480,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 64090,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 38480,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 76960,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3850,
				WaveTime = 355,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 64480,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 38740,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 64480,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 38740,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 77350,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3900,
				WaveTime = 360,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 64870,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 39000,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 64870,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 39000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 77870,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3950,
				WaveTime = 365,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 65260,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 39130,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 65260,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 39130,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 78390,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4000,
				WaveTime = 370,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 65650,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 39390,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 65650,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 39390,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 78780,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4050,
				WaveTime = 375,
				Enemies = {
					["0"] = {
						Enemy = "Mediafreak Lolbit",
						Health = "706400",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 12
							}
						}
					}
				}
			},
			{
				Reward = 4100,
				WaveTime = 380,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 76960,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 46150,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 76960,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 46150,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 92300,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4150,
				WaveTime = 385,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 77350,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 46410,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 77350,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 46410,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 92820,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4200,
				WaveTime = 390,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 77740,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 46670,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 77740,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 46670,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 93340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4250,
				WaveTime = 395,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 78130,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 46930,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 78130,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 46930,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 93730,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 4300,
				WaveTime = 400,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 78520,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 47060,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 78520,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 47060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 94250,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 4350,
				WaveTime = 405,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 78910,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 47320,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 78910,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 47320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 94640,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4400,
				WaveTime = 410,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 79300,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 47580,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 79300,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 47580,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 95160,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4450,
				WaveTime = 415,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 79690,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 47840,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 79690,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 47840,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 95680,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4500,
				WaveTime = 420,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 80080,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 48100,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 80080,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 48100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 96200,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4550,
				WaveTime = 425,
				Enemies = {
					["0"] = {
						Enemy = "Dismantled Ballora",
						Health = "855200",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 12
							}
						}
					}
				}
			},
			{
				Reward = 4600,
				WaveTime = 430,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 93080,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 55900,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 93080,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 55900,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 111670,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4650,
				WaveTime = 435,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 93470,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 56030,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 93470,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 56030,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 112190,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4700,
				WaveTime = 440,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 93860,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 56290,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 93860,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 56290,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 112580,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4750,
				WaveTime = 445,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 94250,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 56550,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 94250,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 56550,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 113100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 4800,
				WaveTime = 450,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 94640,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 56810,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 94640,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 56810,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 113620,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 4850,
				WaveTime = 455,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 95030,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 57070,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 95030,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 57070,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 114010,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4900,
				WaveTime = 460,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 95420,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 57200,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 95420,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 57200,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 114530,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4950,
				WaveTime = 465,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 95810,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 57460,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 95810,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 57460,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 114920,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5000,
				WaveTime = 470,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Circus Baby",
						Health = 96200,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Lolbit",
						Health = 57720,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Circus Baby",
						Health = 96200,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Lolbit",
						Health = 57720,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 115440,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4950,
				WaveTime = 465,
				Enemies = {
					["0"] = {
						Enemy = "Hijacked Freddy",
						Health = "1000000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_BoomboxFoxyPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 5000,
				WaveTime = 470,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Lolbit",
						Health = 100601,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Ruined Funtime Freddy",
						Health = 60333,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Lolbit",
						Health = 100601,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Funtime Freddy",
						Health = 60333,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Ruined Lolbit",
						Health = 100601,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5050,
				WaveTime = 475,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 105630,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 63349,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 105630,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 63349,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 105630,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5100,
				WaveTime = 480,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 110912,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 66517,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 110912,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 66517,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 110912,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5150,
				WaveTime = 485,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 116458,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 69843,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 116458,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 69843,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 116458,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5200,
				WaveTime = 490,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 122281,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 73336,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 122281,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 73336,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 122281,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5250,
				WaveTime = 495,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 128395,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 77002,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 128395,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 77002,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 128395,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5300,
				WaveTime = 500,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 134814,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 80852,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 134814,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 80852,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 134814,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5350,
				WaveTime = 505,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 141554,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 84895,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 141554,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 84895,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 141554,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5400,
				WaveTime = 510,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 148633,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 89140,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 148633,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 89140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 148633,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5450,
				WaveTime = 515,
				Enemies = {
					["0"] = {
						Enemy = "Crazed Circus Baby",
						Health = "1152282",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 50
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 5500,
				WaveTime = 520,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 156065,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 93596,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 156065,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 93596,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 156065,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5550,
				WaveTime = 525,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 163868,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 98276,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 163868,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 98276,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 163868,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5600,
				WaveTime = 530,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 172062,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 103190,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 172062,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 103190,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 172062,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5650,
				WaveTime = 535,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 180665,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 108350,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 180665,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 108350,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 180665,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5700,
				WaveTime = 540,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 189699,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 113767,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 189699,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 113767,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 189699,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5750,
				WaveTime = 545,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 199183,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 119454,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 199183,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 119454,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 199183,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5800,
				WaveTime = 550,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 209141,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 125428,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 209141,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 125428,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 209141,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5850,
				WaveTime = 555,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 219599,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 131699,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 219599,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 131699,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 219599,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5900,
				WaveTime = 560,
				Enemies = {
					["0"] = {
						Enemy = "Voltage Circus Baby",
						Health = 230580,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Overclocked Freddy",
						Health = 138284,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Voltage Circus Baby",
						Health = 230580,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Overclocked Freddy",
						Health = 138284,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Voltage Circus Baby",
						Health = 230580,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5950,
				WaveTime = 565,
				Enemies = {
					["0"] = {
						Enemy = "Unforgiving Ennard",
						Health = "1787568",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 50
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 10
							}
						}
					}
				}
			},
			{
				Reward = 6000,
				WaveTime = 570,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 242108,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 242108,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 242108,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 242108,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 242108,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6050,
				WaveTime = 575,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 254214,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 254214,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 254214,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 254214,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 254214,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6100,
				WaveTime = 580,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 266924,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 266924,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 266924,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 266924,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 266924,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6150,
				WaveTime = 585,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 280271,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 280271,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 280271,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 280271,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 280271,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6200,
				WaveTime = 590,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 294284,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 294284,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 294284,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 294284,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 294284,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6250,
				WaveTime = 595,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 308998,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 308998,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 308998,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 308998,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 308998,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6300,
				WaveTime = 600,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 324448,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 324448,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 324448,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 324448,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 324448,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6350,
				WaveTime = 605,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 340670,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 340670,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 340670,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 340670,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 340670,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6400,
				WaveTime = 610,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 357704,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 357704,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 357704,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 357704,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 357704,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6450,
				WaveTime = 615,
				Enemies = {
					["0"] = {
						Enemy = "Critical Funtime Foxy",
						Health = "2773104",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 50
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 25
							}
						}
					}
				}
			},
			{
				Reward = 7000,
				WaveTime = 670,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 404993,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 404993,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 404993,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 404993,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 404993,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7050,
				WaveTime = 675,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 425242,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 425242,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 425242,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 425242,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 425242,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7100,
				WaveTime = 680,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 446505,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 446505,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 446505,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 446505,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 446505,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7150,
				WaveTime = 685,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 468830,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 468830,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 468830,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 468830,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 468830,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7200,
				WaveTime = 690,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 492272,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 492272,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 492272,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 492272,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 492272,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7250,
				WaveTime = 695,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 516885,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 516885,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 516885,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 516885,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 516885,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7300,
				WaveTime = 700,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 542729,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 542729,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 542729,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 542729,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 542729,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7350,
				WaveTime = 705,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 569866,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 569866,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 569866,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 569866,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 569866,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7400,
				WaveTime = 710,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 598359,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 598359,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 598359,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 598359,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 598359,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6950,
				WaveTime = 665,
				Enemies = {
					["0"] = {
						Enemy = "Mediafreak Lolbit",
						Health = "5378424",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 7450,
				WaveTime = 715,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 628277,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 628277,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 628277,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 628277,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 628277,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7500,
				WaveTime = 720,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 659691,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 659691,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 659691,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 659691,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 659691,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7550,
				WaveTime = 725,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 692675,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 692675,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 692675,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 692675,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 692675,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7600,
				WaveTime = 730,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 727309,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 727309,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 727309,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 727309,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 727309,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7650,
				WaveTime = 735,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 763674,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 763674,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 763674,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 763674,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 763674,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7700,
				WaveTime = 740,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 801858,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 801858,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 801858,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 801858,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 801858,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7750,
				WaveTime = 745,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 841951,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 841951,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 841951,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 841951,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 841951,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7800,
				WaveTime = 750,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 884048,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 884048,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 884048,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 884048,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 884048,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7850,
				WaveTime = 755,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 928251,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 928251,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 928251,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 928251,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 928251,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7450,
				WaveTime = 715,
				Enemies = {
					["0"] = {
						Enemy = "Dismantled Ballora",
						Health = "12515544",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 7950,
				WaveTime = 765,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 974663,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 974663,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 974663,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 974663,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 974663,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8000,
				WaveTime = 770,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1023396,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1023396,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1023396,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1023396,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1023396,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8050,
				WaveTime = 775,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1074566,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1074566,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1074566,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1074566,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1074566,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8100,
				WaveTime = 780,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1128294,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1128294,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1128294,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1128294,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1128294,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8150,
				WaveTime = 785,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1184709,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1184709,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1184709,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1184709,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1184709,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8200,
				WaveTime = 790,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1243944,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1243944,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1243944,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1243944,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1243944,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8250,
				WaveTime = 795,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1306141,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1306141,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1306141,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1306141,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1306141,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8300,
				WaveTime = 800,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1371448,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1371448,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1371448,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1371448,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1371448,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8350,
				WaveTime = 805,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1440021,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1440021,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1440021,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1440021,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1440021,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7950,
				WaveTime = 765,
				Enemies = {
					["0"] = {
						Enemy = "Hijacked Freddy",
						Health = "19415718",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 8450,
				WaveTime = 815,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1512022,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1512022,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1512022,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1512022,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1512022,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1587623,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1587623,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1587623,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1587623,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1587623,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8550,
				WaveTime = 825,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1667004,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1667004,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1667004,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1667004,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1667004,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8600,
				WaveTime = 830,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1750354,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1750354,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1750354,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1750354,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1750354,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8650,
				WaveTime = 835,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1837872,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1837872,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1837872,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1837872,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1837872,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8700,
				WaveTime = 840,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 1929765,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 1929765,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 1929765,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 1929765,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 1929765,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8750,
				WaveTime = 845,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 2026254,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 2026254,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 2026254,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 2026254,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 2026254,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8800,
				WaveTime = 850,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 2127566,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 2127566,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 2127566,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 2127566,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 2127566,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8850,
				WaveTime = 855,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 2233945,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 2233945,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 2233945,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 2233945,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 2233945,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8450,
				WaveTime = 815,
				Enemies = {
					["0"] = {
						Enemy = "Crazed Circus Baby",
						Health = "30120156",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			},
			{
				Reward = 8950,
				WaveTime = 865,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 2345642,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 2345642,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 2345642,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 2345642,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 2345642,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9000,
				WaveTime = 870,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 2462924,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 2462924,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 2462924,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 2462924,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 2462924,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9050,
				WaveTime = 875,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 2586070,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 2586070,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 2586070,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 2586070,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 2586070,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9100,
				WaveTime = 880,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 2715374,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 2715374,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 2715374,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 2715374,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 2715374,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9150,
				WaveTime = 885,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 2851142,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 2851142,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 2851142,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 2851142,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 2851142,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9200,
				WaveTime = 890,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 2993699,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 2993699,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 2993699,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 2993699,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 2993699,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9250,
				WaveTime = 895,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 3143384,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 3143384,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 3143384,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 3143384,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 3143384,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9300,
				WaveTime = 900,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 3300553,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 3300553,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 3300553,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 3300553,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 3300553,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9350,
				WaveTime = 905,
				Enemies = {
					["0"] = {
						Enemy = "L0LB1T",
						Health = 3465581,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "L0LB1T",
						Health = 3465581,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "L0LB1T",
						Health = 3465581,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "L0LB1T",
						Health = 3465581,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "L0LB1T",
						Health = 3465581,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8450,
				WaveTime = 815,
				Enemies = {
					["0"] = {
						Enemy = "Unforgiving Ennard",
						Health = "50120156",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 400
							},
							Item_Souls = {
								Amount = 4
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 10
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 100
							}
						}
					}
				}
			}
		}
	}
}