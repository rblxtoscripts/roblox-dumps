-- https://lua.expert/
return {
	[6] = {
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
						Enemy = "Haunted Freddy",
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
						Enemy = "Haunted Freddy",
						Amount = 3,
						TimeBetweenSpawns = 2,
						Spawn = 7
					}
				}
			},
			{
				Reward = 300,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Freddy",
						Amount = 4,
						TimeBetweenSpawns = 2,
						Spawn = 11
					}
				}
			},
			{
				Reward = 350,
				WaveTime = 35,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1.5"] = {
						Enemy = "Haunted Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Haunted Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 40,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Haunted Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["2"] = {
						Enemy = "Haunted Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Haunted Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					}
				}
			},
			{
				Reward = 450,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3.5"] = {
						Enemy = "Haunted Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					}
				}
			},
			{
				Reward = 500,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Haunted Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["4"] = {
						Enemy = "Haunted Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					}
				}
			},
			{
				Reward = 550,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Haunted Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["4"] = {
						Enemy = "Haunted Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 60,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Haunted Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Decommissioned Bonnie",
						Health = "150k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Haunted Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["1"] = {
						Enemy = "Haunted Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 35,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["1"] = {
						Enemy = "Haunted Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Haunted Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Haunted Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 700,
				WaveTime = 40,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Haunted Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Lefty",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["4"] = {
						Enemy = "Haunted Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 750,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Haunted Lefty",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 800,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Haunted Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					}
				}
			},
			{
				Reward = 850,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 900,
				WaveTime = 60,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 950,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 1000,
				WaveTime = 70,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					}
				}
			},
			{
				Reward = 1050,
				WaveTime = 75,
				Enemies = {
					["0"] = {
						Enemy = "Remnant Freddy",
						Health = "200k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Haunted Lefty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 1150,
				WaveTime = 85,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 1200,
				WaveTime = 90,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 1250,
				WaveTime = 95,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1300,
				WaveTime = 100,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					}
				}
			},
			{
				Reward = 1350,
				WaveTime = 105,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1400,
				WaveTime = 110,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 1450,
				WaveTime = 115,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 1500,
				WaveTime = 120,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1550,
				WaveTime = 125,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten ScrapTrap",
						Health = "250k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Haunted Lefty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					}
				}
			},
			{
				Reward = 1650,
				WaveTime = 135,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 1700,
				WaveTime = 140,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1750,
				WaveTime = 145,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 1800,
				WaveTime = 150,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 1850,
				WaveTime = 155,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 1900,
				WaveTime = 160,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1950,
				WaveTime = 165,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 2000,
				WaveTime = 170,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2050,
				WaveTime = 175,
				Enemies = {
					["0"] = {
						Enemy = "Revived Circus Baby",
						Health = "300k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Haunted Lefty",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2150,
				WaveTime = 185,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2200,
				WaveTime = 190,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 2250,
				WaveTime = 195,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2300,
				WaveTime = 200,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 2350,
				WaveTime = 205,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2400,
				WaveTime = 210,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 2450,
				WaveTime = 215,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 7,
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
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 2550,
				WaveTime = 225,
				Enemies = {
					["0"] = {
						Enemy = "Controlled Lefty",
						Health = "400k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2650,
				WaveTime = 235,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 2700,
				WaveTime = 240,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2750,
				WaveTime = 245,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 2800,
				WaveTime = 250,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2850,
				WaveTime = 255,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 2900,
				WaveTime = 260,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2950,
				WaveTime = 265,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 3000,
				WaveTime = 270,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3050,
				WaveTime = 275,
				Enemies = {
					["0"] = {
						Enemy = "Dismembered Freddy",
						Health = "500k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Haunted Lefty",
						Health = 61750,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 37050,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 61750,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 37050,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 74100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3150,
				WaveTime = 285,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 62563,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 37538,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 62563,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 37538,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 75075,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3200,
				WaveTime = 290,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 63375,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 38025,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 63375,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 38025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 76050,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 3250,
				WaveTime = 295,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 64188,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 38513,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 64188,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 38513,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 77025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3300,
				WaveTime = 300,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 65000,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 39000,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 65000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 39000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 78000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 3350,
				WaveTime = 305,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 65813,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 39488,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 65813,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 39488,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 78975,
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
						Enemy = "Haunted Lefty",
						Health = 66625,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 39975,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 66625,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 39975,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 79950,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 3450,
				WaveTime = 315,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 67438,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 40463,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 67438,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 40463,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 80925,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3500,
				WaveTime = 320,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 68250,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 40950,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 68250,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 40950,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 81900,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 3550,
				WaveTime = 325,
				Enemies = {
					["0"] = {
						Enemy = "Decommissioned Bonnie",
						Health = "714500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Haunted Lefty",
						Health = 78163,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 46963,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 78163,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 46963,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 93763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3650,
				WaveTime = 335,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 78650,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 47125,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 78650,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 47125,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 94413,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3700,
				WaveTime = 340,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 79138,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 47450,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 79138,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 47450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 94900,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 3750,
				WaveTime = 345,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 79625,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 47775,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 79625,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 47775,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 95550,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3800,
				WaveTime = 350,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 80113,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 48100,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 80113,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 48100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 96200,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 3850,
				WaveTime = 355,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 80600,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 48425,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 80600,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 48425,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 96688,
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
						Enemy = "Haunted Lefty",
						Health = 81088,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 48750,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 81088,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 48750,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 97338,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 3950,
				WaveTime = 365,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 81575,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 48913,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 81575,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 48913,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 97988,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4000,
				WaveTime = 370,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 82063,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 49238,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 82063,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 49238,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 98475,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 4050,
				WaveTime = 375,
				Enemies = {
					["0"] = {
						Enemy = "Remnant Freddy",
						Health = "883000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Haunted Lefty",
						Health = 96200,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 57688,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 96200,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 57688,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 115375,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4150,
				WaveTime = 385,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 96688,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 58013,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 96688,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 58013,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 116025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4200,
				WaveTime = 390,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 97175,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 58338,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 97175,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 58338,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 116675,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 4250,
				WaveTime = 395,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 97663,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 58663,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 97663,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 58663,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 117163,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4300,
				WaveTime = 400,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 98150,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 58825,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 98150,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 58825,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 117813,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 4350,
				WaveTime = 405,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 98638,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 59150,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 98638,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 59150,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 118300,
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
						Enemy = "Haunted Lefty",
						Health = 99125,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 59475,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 99125,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 59475,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 118950,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 4450,
				WaveTime = 415,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 99613,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 59800,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 99613,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 59800,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 119600,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4500,
				WaveTime = 420,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 100100,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 60125,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 100100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 60125,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 120250,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 4550,
				WaveTime = 425,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten ScrapTrap",
						Health = "1069000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Haunted Lefty",
						Health = 116350,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 69875,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 116350,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 69875,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 139588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4650,
				WaveTime = 435,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 116838,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 70038,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 116838,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 70038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 140238,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4700,
				WaveTime = 440,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 117325,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 70363,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 117325,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 70363,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 140725,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 4750,
				WaveTime = 445,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 117813,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 70688,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 117813,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 70688,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 141375,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4800,
				WaveTime = 450,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 118300,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 71013,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 118300,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 71013,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 142025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 4850,
				WaveTime = 455,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 118788,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 71338,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 118788,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 71338,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 142513,
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
						Enemy = "Haunted Lefty",
						Health = 119275,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 71500,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 119275,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 71500,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 143163,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 4950,
				WaveTime = 465,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 119763,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 71825,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 119763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 71825,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 143650,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 5000,
				WaveTime = 470,
				Enemies = {
					["0"] = {
						Enemy = "Haunted Lefty",
						Health = 120250,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Foxy",
						Health = 72150,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Haunted Lefty",
						Health = 120250,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Haunted Foxy",
						Health = 72150,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 144300,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 4950,
				WaveTime = 465,
				Enemies = {
					["0"] = {
						Enemy = "Revived Circus Baby",
						Health = "1250000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
							Present_MrCanDo = {
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
						Enemy = "Haunted Foxy",
						Health = 125751,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Haunted Bonnie",
						Health = 75416,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Haunted Foxy",
						Health = 125751,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Haunted Bonnie",
						Health = 75416,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Haunted Foxy",
						Health = 125751,
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
						Enemy = "Overclocked Foxy",
						Health = 132038,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 79186,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 132038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 79186,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 132038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 5100,
				WaveTime = 480,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 138640,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 83146,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 138640,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 83146,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 138640,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 5150,
				WaveTime = 485,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 145573,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 87304,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 145573,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 87304,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 145573,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 5200,
				WaveTime = 490,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 152851,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 91670,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 152851,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 91670,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 152851,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 5250,
				WaveTime = 495,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 160494,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 96253,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 160494,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 96253,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 160494,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 5300,
				WaveTime = 500,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 168518,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 101065,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 168518,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 101065,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 168518,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 5350,
				WaveTime = 505,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 176943,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 106119,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 176943,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 106119,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 176943,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 5400,
				WaveTime = 510,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 185791,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 111425,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 185791,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 111425,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 185791,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 5450,
				WaveTime = 515,
				Enemies = {
					["0"] = {
						Enemy = "Controlled Lefty",
						Health = "1440353",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Overclocked Foxy",
						Health = 195081,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 116995,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 195081,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 116995,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 195081,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 5550,
				WaveTime = 525,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 204835,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 122845,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 204835,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 122845,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 204835,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					}
				}
			},
			{
				Reward = 5600,
				WaveTime = 530,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 214577,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 128888,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 214577,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 128888,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 214577,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 5650,
				WaveTime = 535,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 225306,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 135438,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 225306,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 135438,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 225306,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 5700,
				WaveTime = 540,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 236572,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 142209,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 236572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 142209,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 236572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 5750,
				WaveTime = 545,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 248401,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 149318,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 248401,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 149318,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 248401,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 5800,
				WaveTime = 550,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 260821,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 156785,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 260821,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 156785,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 260821,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 5850,
				WaveTime = 555,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 273863,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 164624,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 273863,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 164624,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 273863,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 5900,
				WaveTime = 560,
				Enemies = {
					["0"] = {
						Enemy = "Overclocked Foxy",
						Health = 287556,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Reanimated Bonnie",
						Health = 172856,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["2"] = {
						Enemy = "Overclocked Foxy",
						Health = 287556,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["3"] = {
						Enemy = "Reanimated Bonnie",
						Health = 172856,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["4"] = {
						Enemy = "Overclocked Foxy",
						Health = 287556,
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
						Enemy = "Dismembered Freddy",
						Health = "2234460",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Puppeteered Lefty",
						Health = 302635,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 302635,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 302635,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 302635,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 302635,
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
						Enemy = "Puppeteered Lefty",
						Health = 317768,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 317768,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 317768,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 317768,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 317768,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 6100,
				WaveTime = 580,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 333655,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 333655,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 333655,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 333655,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 333655,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 6150,
				WaveTime = 585,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 350339,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 350339,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 350339,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 350339,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 350339,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 6200,
				WaveTime = 590,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 367855,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 367855,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 367855,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 367855,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 367855,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 6250,
				WaveTime = 595,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 386248,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 386248,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 386248,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 386248,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 386248,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 6300,
				WaveTime = 600,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 405560,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 405560,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 405560,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 405560,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 405560,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 6350,
				WaveTime = 605,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 425838,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 425838,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 425838,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 425838,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 425838,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 6400,
				WaveTime = 610,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 447130,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 447130,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 447130,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 447130,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 447130,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 6450,
				WaveTime = 615,
				Enemies = {
					["0"] = {
						Enemy = "Decommissioned Bonnie",
						Health = "3466380",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Puppeteered Lefty",
						Health = 506241,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 506241,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 506241,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 506241,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 506241,
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
						Enemy = "Puppeteered Lefty",
						Health = 531553,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 531553,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 531553,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 531553,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 531553,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 7100,
				WaveTime = 680,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 558131,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 558131,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 558131,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 558131,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 558131,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 7150,
				WaveTime = 685,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 586038,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 586038,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 586038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 586038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 586038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 7200,
				WaveTime = 690,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 615340,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 615340,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 615340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 615340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 615340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 7250,
				WaveTime = 695,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 646106,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 646106,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 646106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 646106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 646106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 7300,
				WaveTime = 700,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 678411,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 678411,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 678411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 678411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 678411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 7350,
				WaveTime = 705,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 712333,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 7
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 712333,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 12
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 712333,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 712333,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 10
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 712333,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 7400,
				WaveTime = 710,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 747949,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 8
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 747949,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 747949,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 11
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 747949,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 747949,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 9
					}
				}
			},
			{
				Reward = 6950,
				WaveTime = 665,
				Enemies = {
					["0"] = {
						Enemy = "Remnant Freddy",
						Health = "6723030",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Puppeteered Lefty",
						Health = 785346,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 785346,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 785346,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 785346,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 785346,
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
						Enemy = "Puppeteered Lefty",
						Health = 824614,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 824614,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 824614,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 824614,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 824614,
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
						Enemy = "Puppeteered Lefty",
						Health = 865844,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 865844,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 865844,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 865844,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 865844,
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
						Enemy = "Puppeteered Lefty",
						Health = 909136,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 909136,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 909136,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 909136,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 909136,
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
						Enemy = "Puppeteered Lefty",
						Health = 954593,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 954593,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 954593,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 954593,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 954593,
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
						Enemy = "Puppeteered Lefty",
						Health = 1002323,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1002323,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1002323,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1002323,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1002323,
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
						Enemy = "Puppeteered Lefty",
						Health = 1052439,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1052439,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1052439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1052439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1052439,
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
						Enemy = "Puppeteered Lefty",
						Health = 1105060,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1105060,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1105060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1105060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1105060,
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
						Enemy = "Puppeteered Lefty",
						Health = 1160314,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1160314,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1160314,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1160314,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1160314,
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
						Enemy = "Forgotten ScrapTrap",
						Health = "15644430",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Puppeteered Lefty",
						Health = 1218329,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1218329,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1218329,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1218329,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1218329,
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
						Enemy = "Puppeteered Lefty",
						Health = 1279245,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1279245,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1279245,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1279245,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1279245,
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
						Enemy = "Puppeteered Lefty",
						Health = 1343208,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1343208,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1343208,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1343208,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1343208,
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
						Enemy = "Puppeteered Lefty",
						Health = 1410368,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1410368,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1410368,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1410368,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1410368,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{},
			{
				Reward = 8200,
				WaveTime = 790,
				Enemies = {
					["0"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1554930,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1554930,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1554930,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1554930,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1554930,
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
						Enemy = "Puppeteered Lefty",
						Health = 1632676,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1632676,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1632676,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1632676,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1632676,
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
						Enemy = "Puppeteered Lefty",
						Health = 1714310,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1714310,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1714310,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1714310,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1714310,
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
						Enemy = "Puppeteered Lefty",
						Health = 1800026,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1800026,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1800026,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1800026,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1800026,
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
						Enemy = "Revived Circus Baby",
						Health = "24269648",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
						Enemy = "Puppeteered Lefty",
						Health = 1890028,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1890028,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1890028,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1890028,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1890028,
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
						Enemy = "Puppeteered Lefty",
						Health = 1984529,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1984529,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1984529,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1984529,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 1984529,
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
						Enemy = "Puppeteered Lefty",
						Health = 2083755,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2083755,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2083755,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2083755,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2083755,
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
						Enemy = "Puppeteered Lefty",
						Health = 2187943,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2187943,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2187943,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2187943,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2187943,
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
						Enemy = "Puppeteered Lefty",
						Health = 2297340,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2297340,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2297340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2297340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2297340,
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
						Enemy = "Puppeteered Lefty",
						Health = 2412206,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2412206,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2412206,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2412206,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2412206,
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
						Enemy = "Puppeteered Lefty",
						Health = 2532818,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2532818,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2532818,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2532818,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2532818,
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
						Enemy = "Puppeteered Lefty",
						Health = 2659458,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2659458,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2659458,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2659458,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2659458,
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
						Enemy = "Puppeteered Lefty",
						Health = 2792431,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2792431,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2792431,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2792431,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Puppeteered Lefty",
						Health = 2792431,
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
						Enemy = "Controlled Lefty",
						Health = "37650195",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
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
			}
		}
	},
	[7] = {
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
						Enemy = "Ruined Monty",
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
						Enemy = "Ruined Monty",
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
						Enemy = "Ruined Monty",
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
						Enemy = "Ruined Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1.5"] = {
						Enemy = "Ruined Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Ruined Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 40,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Ruined Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 450,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3.5"] = {
						Enemy = "Ruined Freddy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 500,
				WaveTime = 50,
				Enemies = {
					["0"] = {
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
						Enemy = "Ruined Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Chica",
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
						Enemy = "Ruined Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
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
						Enemy = "Ruined Chica",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 60,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Freddy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
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
						Enemy = "Ruined Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy",
						Health = "150k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Monty",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 35,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Monty",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Chica",
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
						Enemy = "Ruined Monty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Moondrop",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Chica",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 750,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Monty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Moondrop",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 800,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 850,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 2,
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
						Enemy = "Ruined Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 900,
				WaveTime = 60,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 950,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1000,
				WaveTime = 70,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
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
						Enemy = "Hacked Chica",
						Health = "200k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 1100,
				WaveTime = 80,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1150,
				WaveTime = 85,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
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
						Enemy = "Ruined Moondrop",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1250,
				WaveTime = 95,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1300,
				WaveTime = 100,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1350,
				WaveTime = 105,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1400,
				WaveTime = 110,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
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
						Enemy = "Ruined Moondrop",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1500,
				WaveTime = 120,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1550,
				WaveTime = 125,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy",
						Health = "250k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 25
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
						Enemy = "Ruined Moondrop",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1650,
				WaveTime = 135,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
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
						Enemy = "Ruined Moondrop",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1750,
				WaveTime = 145,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
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
						Enemy = "Ruined Moondrop",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1850,
				WaveTime = 155,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1900,
				WaveTime = 160,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1950,
				WaveTime = 165,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
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
						Enemy = "Ruined Moondrop",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2050,
				WaveTime = 175,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty",
						Health = "300k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 2100,
				WaveTime = 180,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2150,
				WaveTime = 185,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2200,
				WaveTime = 190,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2250,
				WaveTime = 195,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2300,
				WaveTime = 200,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2350,
				WaveTime = 205,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2400,
				WaveTime = 210,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2450,
				WaveTime = 215,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2500,
				WaveTime = 220,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2550,
				WaveTime = 225,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop",
						Health = "400k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 25
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
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2650,
				WaveTime = 235,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
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
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2750,
				WaveTime = 245,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
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
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2850,
				WaveTime = 255,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2900,
				WaveTime = 260,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2950,
				WaveTime = 265,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
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
						Enemy = "Ruined Moondrop",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Monty",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Chica",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Freddy",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3050,
				WaveTime = 275,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy",
						Health = "500k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 3100,
				WaveTime = 280,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 138938,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 55575,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 92625,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 55575,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 111150,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3150,
				WaveTime = 285,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 93845,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 56307,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 93845,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 56307,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 112613,
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
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 142595,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 57038,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 95063,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 57038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 114075,
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
						Enemy = "Ruined Moondrop",
						Health = 96282,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 57770,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 96282,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 57770,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 115538,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3300,
				WaveTime = 300,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 146250,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 58500,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 97500,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 58500,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 117000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3350,
				WaveTime = 305,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 98720,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 59232,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 98720,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 59232,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 118463,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3400,
				WaveTime = 310,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 149907,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 59963,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 99938,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 59963,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 119925,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3450,
				WaveTime = 315,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 101157,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 60695,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 101157,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 60695,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 121388,
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
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 153563,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 61425,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 102375,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 61425,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 122850,
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
						Enemy = "Hacked Chica",
						Health = "1071750",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 3600,
				WaveTime = 330,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 175868,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 70445,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 117245,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 70445,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 140645,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3650,
				WaveTime = 335,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 117975,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 70688,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 117975,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 70688,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 141620,
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
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 178061,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 71175,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 118707,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 71175,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 142350,
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
						Enemy = "Ruined Moondrop",
						Health = 119438,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 71663,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 119438,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 71663,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 143325,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3800,
				WaveTime = 350,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 180255,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 72150,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 120170,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 72150,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 144300,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3850,
				WaveTime = 355,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 120900,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 72638,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 120900,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 72638,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 145032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3900,
				WaveTime = 360,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 182448,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 73125,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 121632,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 73125,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 146007,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3950,
				WaveTime = 365,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 122363,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 73370,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 122363,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 73370,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 146982,
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
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 184643,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 73857,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 123095,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 73857,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 147713,
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
						Enemy = "Mad Roxy",
						Health = "1324500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 4100,
				WaveTime = 380,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 259595,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 86532,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 144300,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 86532,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 173063,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4150,
				WaveTime = 385,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 145032,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 87020,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 145032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 87020,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 174038,
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
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 261405,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 87507,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 145763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 87507,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 175013,
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
						Enemy = "Ruined Moondrop",
						Health = 146495,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 87995,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 146495,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 87995,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 175745,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4300,
				WaveTime = 400,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 264270,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 88238,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 147225,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 88238,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 176720,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4350,
				WaveTime = 405,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 147957,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 88725,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 147957,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 88725,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 177450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4400,
				WaveTime = 410,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 267143,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 89213,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 148688,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 89213,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 178425,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4450,
				WaveTime = 415,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 149420,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 89700,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 149420,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 89700,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 179400,
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
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 270563,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 90188,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 150150,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 90188,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 180375,
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
						Enemy = "Deviant Monty",
						Health = "1603500",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 4600,
				WaveTime = 430,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 314073,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 104813,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 174525,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 104813,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 209382,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4650,
				WaveTime = 435,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 175257,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 105057,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 175257,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 105057,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 210357,
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
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 316088,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 105545,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 175988,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 105545,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 211088,
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
						Enemy = "Ruined Moondrop",
						Health = 176720,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 106032,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 176720,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 106032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 212063,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4800,
				WaveTime = 450,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 318095,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 106520,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 177450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 106520,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 213038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4850,
				WaveTime = 455,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 178182,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 107007,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 178182,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 107007,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 213770,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4900,
				WaveTime = 460,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 320745,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 107250,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 178913,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 107250,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 214745,
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
						Enemy = "Ruined Moondrop",
						Health = 179645,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 107738,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 179645,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 107738,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 215475,
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
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 323213,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 108225,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 180375,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 108225,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 216450,
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
						Enemy = "Insomniac Moondrop",
						Health = "1875000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_GlamrockEndo = {
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
				Reward = 5050,
				WaveTime = 475,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 357954,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 119318,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 198863,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 119318,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 238636,
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
						Enemy = "Ruined Moondrop",
						Health = 208807,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 125284,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 208807,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 125284,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 250568,
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
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 394644,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 131548,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 219247,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 131548,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 263096,
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
						Enemy = "Ruined Moondrop",
						Health = 230209,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 138126,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 230209,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 138126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 276251,
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
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 435096,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 145032,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 241720,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 145032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 290064,
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
						Enemy = "Ruined Moondrop",
						Health = 253806,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 152284,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 253806,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 152284,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 304567,
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
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 456851,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 159898,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 266496,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 159898,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 319796,
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
						Enemy = "Ruined Moondrop",
						Health = 279821,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 167893,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 279821,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 167893,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 335786,
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
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 503679,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 176288,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 293812,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 176288,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Roxy",
						Health = 335786,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5500,
				WaveTime = 520,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy",
						Health = "2100000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 5550,
				WaveTime = 525,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 528863,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 185102,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 308503,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 185102,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 352575,
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
						Enemy = "Ruined Moondrop",
						Health = 323928,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 194358,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 323928,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 194358,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 370204,
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
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 583071,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 204075,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 340124,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 204075,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 388714,
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
						Enemy = "Ruined Moondrop",
						Health = 357130,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 214279,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 357130,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 214279,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 408150,
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
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 642836,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 224993,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 374987,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 224993,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 428557,
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
						Enemy = "Ruined Moondrop",
						Health = 393736,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 236243,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 393736,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 236243,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 449985,
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
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 674978,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 248055,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 413423,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 248055,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 449985,
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
						Enemy = "Ruined Moondrop",
						Health = 434094,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 260458,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 434094,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 260458,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 472484,
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
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 708726,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 273481,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 455799,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 273481,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 472484,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6000,
				WaveTime = 570,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica",
						Health = "2250000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 6050,
				WaveTime = 575,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 744162,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 287155,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 478589,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 287155,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 496108,
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
						Enemy = "Ruined Moondrop",
						Health = 502518,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 301513,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 502518,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 301513,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 520914,
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
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 820439,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 316588,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 527644,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 316588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 546959,
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
						Enemy = "Ruined Moondrop",
						Health = 554027,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 332418,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 554027,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 332418,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 574307,
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
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 904535,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 349039,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 581728,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 349039,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 603023,
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
						Enemy = "Ruined Moondrop",
						Health = 610814,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 366491,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 610814,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 366491,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 633174,
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
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 949761,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 384816,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 641355,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 384816,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 664833,
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
						Enemy = "Ruined Moondrop",
						Health = 673423,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 404057,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 673423,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 404057,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 698075,
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
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 1047113,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 424260,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 707094,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 424260,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 732979,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6500,
				WaveTime = 620,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy",
						Health = "2400000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 6550,
				WaveTime = 625,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 1154442,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 445473,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 742449,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 445473,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 769628,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6600,
				WaveTime = 630,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 779571,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 467747,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 779571,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 467747,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 808109,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6650,
				WaveTime = 635,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 1272773,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 491134,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 818550,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 491134,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 848515,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6700,
				WaveTime = 640,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 859477,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 515691,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 859477,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 515691,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 890941,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6750,
				WaveTime = 645,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 1403232,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 541475,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 902451,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 541475,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 935488,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6800,
				WaveTime = 650,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 947574,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 568549,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 947574,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 568549,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 982262,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6850,
				WaveTime = 655,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 1473393,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 596976,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 994953,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 596976,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1031375,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6900,
				WaveTime = 660,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 1044701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 626825,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1044701,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 626825,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1082944,
						Amount = 1,
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
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 1624416,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 658166,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1096936,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 658166,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1137091,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7000,
				WaveTime = 670,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty",
						Health = "2550000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 7050,
				WaveTime = 675,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 1790919,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 691074,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1151783,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 691074,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1193946,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 1209372,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 725628,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1209372,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 725628,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1253643,
						Amount = 1,
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
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 1974488,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 761909,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1269841,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 761909,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1316325,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 1333333,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 800005,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1333333,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 800005,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1382141,
						Amount = 1,
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
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 2176872,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 840005,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1399999,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 840005,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1451248,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 1469999,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 882005,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1469999,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 882005,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1523810,
						Amount = 1,
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
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 2285715,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 926105,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1543499,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 926105,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1600000,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 1620674,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 972410,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1620674,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 972410,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1680000,
						Amount = 1,
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
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 2520000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1021031,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1701708,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1021031,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1764000,
						Amount = 1,
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
						Enemy = "Insomniac Moondrop",
						Health = "2700000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1500
							},
							Item_Souls = {
								Amount = 15
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
				Reward = 7550,
				WaveTime = 725,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 2778300,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1072083,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1786793,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1072083,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1852200,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 1876133,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1125687,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1876133,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1125687,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1944810,
						Amount = 1,
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
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 3063077,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1181971,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1969940,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1181971,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2042051,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 2068437,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1241070,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2068437,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1241070,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2144153,
						Amount = 1,
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
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 3377042,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1303123,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2171859,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1303123,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2251361,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 2280452,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1368279,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2280452,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1368279,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2363929,
						Amount = 1,
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
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 3545894,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1436693,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2394475,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1436693,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2482125,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7900,
				WaveTime = 760,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 2514199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1508528,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2514199,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1508528,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2606231,
						Amount = 1,
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
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 3909347,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1583954,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2639909,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1583954,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2736543,
						Amount = 1,
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
						Enemy = "Rogue Freddy",
						Health = "4691216",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 8050,
				WaveTime = 775,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 4310055,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1663152,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2771904,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1663152,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2873370,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 2910500,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1746309,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2910500,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1746309,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 3017039,
						Amount = 1,
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
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 4751837,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1833625,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 3056025,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1833625,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 3167891,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 3208826,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1925306,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 3208826,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1925306,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 3326285,
						Amount = 1,
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
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 5238899,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 2021571,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 3369267,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 2021571,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 3492599,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 3537730,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 2122650,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 3537730,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 2122650,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 3667229,
						Amount = 1,
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
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 5500844,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 2228782,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 3714617,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 2228782,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 3850590,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8400,
				WaveTime = 810,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 3900348,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 2340221,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 3900348,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 2340221,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 4043120,
						Amount = 1,
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
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 6064680,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 2457232,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 4095365,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 2457232,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 4245276,
						Amount = 1,
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
						Enemy = "Hacked Chica",
						Health = "7277616",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 8550,
				WaveTime = 825,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 6686310,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 2580094,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 4300133,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 2580094,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 4457540,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 4515140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 2709098,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 4515140,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 2709098,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 4680417,
						Amount = 1,
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
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 7371657,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 2844553,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 4740897,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 2844553,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 4914438,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 4977942,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 2986781,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 4977942,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 2986781,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 5160160,
						Amount = 1,
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
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 8127251,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 3136120,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 5226839,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 3136120,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 5418167,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 5488181,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 3292926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 5488181,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 3292926,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 5689075,
						Amount = 1,
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
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 8533613,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 3457572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 5762590,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 3457572,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 5973529,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8900,
				WaveTime = 860,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 6050720,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 3630451,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 6050720,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 3630451,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 6272205,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8950,
				WaveTime = 865,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 9408308,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 3811973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 6353256,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 3811973,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 6585815,
						Amount = 1,
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
						Enemy = "Mad Roxy",
						Health = "11289969",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 9050,
				WaveTime = 875,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 10372659,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 4002572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 6670919,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 4002572,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 6915106,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 7004465,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 4202700,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 7004465,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 4202700,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 7260861,
						Amount = 1,
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
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 11435856,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 4412835,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 7354688,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 4412835,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 7623904,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 7722422,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 4633477,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 7722422,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 4633477,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 8005099,
						Amount = 1,
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
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 12608031,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 4865151,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 8108543,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 4865151,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 8405354,
						Amount = 1,
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
						Enemy = "Ruined Moondrop",
						Health = 8513970,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 5108408,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 8513970,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 5108408,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 8825622,
						Amount = 1,
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
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 13238433,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 5363829,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 8939669,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 5363829,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 9266903,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9400,
				WaveTime = 910,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 9386652,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 5632020,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 9386652,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 5632020,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 9730248,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9450,
				WaveTime = 915,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 14595372,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 5913621,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 9855985,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 5913621,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 10216760,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9500,
				WaveTime = 920,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty",
						Health = "17514446",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 9550,
				WaveTime = 925,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 16091397,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 6209302,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 10348784,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 6209302,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 10727598,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9600,
				WaveTime = 930,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 10866223,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 6519767,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 10866223,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 6519767,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 11263978,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9650,
				WaveTime = 935,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 17740766,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 6845756,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 11409535,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 6845756,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 11827177,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9700,
				WaveTime = 940,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 11980011,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 7188043,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 11980011,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 7188043,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 12418536,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9750,
				WaveTime = 945,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 19559193,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 7547445,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 12579012,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 7547445,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 13039462,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9800,
				WaveTime = 950,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 13207963,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 7924817,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 13207963,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 7924817,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 13691435,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9850,
				WaveTime = 955,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 20537153,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 8321058,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 13868361,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 8321058,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 14376007,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9900,
				WaveTime = 960,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 14561779,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 8737111,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 14561779,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 8737111,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 15094807,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9950,
				WaveTime = 965,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 22642211,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 9173966,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 15289868,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 9173966,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 15849547,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10000,
				WaveTime = 970,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop",
						Health = "27170653",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 2500
							},
							Item_Souls = {
								Amount = 25
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
				Reward = 10050,
				WaveTime = 975,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 24963036,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 9632664,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 16054361,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 9632664,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 16642024,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10100,
				WaveTime = 980,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 16857079,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 10114298,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 16857079,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 10114298,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 17474126,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10150,
				WaveTime = 985,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 27521748,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 10620012,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 17699933,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 10620012,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 18347832,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10200,
				WaveTime = 990,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 18584930,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 11151013,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 18584930,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 11151013,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 19265223,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10250,
				WaveTime = 995,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 30342728,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 11708564,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 19514177,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 11708564,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 20228485,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10300,
				WaveTime = 1000,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 20489886,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 12293992,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 20489886,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 12293992,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 21239909,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10350,
				WaveTime = 1005,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 31859864,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 12908691,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 21514380,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 12908691,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 22301904,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10400,
				WaveTime = 1010,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 22590099,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 13554126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 22590099,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 13554126,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 23416999,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10450,
				WaveTime = 1015,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 35125499,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 14231832,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 23719604,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 14231832,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 24587849,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10500,
				WaveTime = 1020,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy",
						Health = "42150598",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 10550,
				WaveTime = 1025,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 38725862,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 14943424,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 24905584,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 14943424,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 25817241,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10600,
				WaveTime = 1030,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 26150863,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 15690595,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 26150863,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 15690595,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 27108104,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10650,
				WaveTime = 1035,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 42695264,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 16475125,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 27458407,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 16475125,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 28463509,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10700,
				WaveTime = 1040,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 28831327,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 17298881,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 28831327,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 17298881,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 29886684,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10750,
				WaveTime = 1045,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 47071527,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 18163825,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 30272893,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 18163825,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 31381018,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10800,
				WaveTime = 1050,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 31786538,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 19072016,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 31786538,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 19072016,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 32950069,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10850,
				WaveTime = 1055,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 49425104,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 20025617,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 33375865,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 20025617,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 34597572,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10900,
				WaveTime = 1060,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 35044658,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 21026898,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 35044658,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 21026898,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 36327451,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10950,
				WaveTime = 1065,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 54491177,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 22078243,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 36796891,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 22078243,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 38143824,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11000,
				WaveTime = 1070,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica",
						Health = "65389412",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 11050,
				WaveTime = 1075,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 60076523,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 23182155,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 38636736,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 23182155,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 40051015,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11100,
				WaveTime = 1080,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 40568572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 24341263,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 40568572,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 24341263,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 42053566,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11150,
				WaveTime = 1085,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 66234366,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 25558326,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 42597001,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 25558326,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 44156244,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11200,
				WaveTime = 1090,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 44726851,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 26836242,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 44726851,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 26836242,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 46364056,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11250,
				WaveTime = 1095,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 73023389,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 28178054,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 46963194,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 28178054,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 48682259,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11300,
				WaveTime = 1100,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 49311354,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 29586957,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 49311354,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 29586957,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 51116372,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11350,
				WaveTime = 1105,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 76674558,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 31066305,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 51776922,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 31066305,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 53672191,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11400,
				WaveTime = 1110,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 54365768,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 32619620,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 54365768,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 32619620,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 56355800,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11450,
				WaveTime = 1115,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 84533700,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 34250601,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 57084056,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 34250601,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 59173590,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11500,
				WaveTime = 1120,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy",
						Health = "101440440",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 11550,
				WaveTime = 1125,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 93198405,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 35963131,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 59938259,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 35963131,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 62132270,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11600,
				WaveTime = 1130,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 62935172,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 37761288,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 62935172,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 37761288,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 65238883,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11650,
				WaveTime = 1135,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 102751241,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 39649352,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 66081930,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 39649352,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 68500827,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11700,
				WaveTime = 1140,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 69386027,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 41631820,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 69386027,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 41631820,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 71925868,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11750,
				WaveTime = 1145,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 113283243,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 43713411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 72855328,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 43713411,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 75522162,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11800,
				WaveTime = 1150,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 76498094,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 45899082,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 76498094,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 45899082,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 79298270,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11850,
				WaveTime = 1155,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 118947405,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 48194036,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 80322999,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 48194036,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 83263183,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11900,
				WaveTime = 1160,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 84339149,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 50603738,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 84339149,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 50603738,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 87426342,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11950,
				WaveTime = 1165,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy Imp",
						Large = true,
						Health = 131139513,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 53133925,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 88556106,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 53133925,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 91797659,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12000,
				WaveTime = 1170,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty",
						Health = "157367415",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 12050,
				WaveTime = 1175,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 144581313,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 55790621,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 92983911,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 55790621,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 96387542,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12100,
				WaveTime = 1180,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 97633107,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 58580152,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 97633107,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 58580152,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 101206919,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12150,
				WaveTime = 1185,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 159400898,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 61509160,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 102514762,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 61509160,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 106267265,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12200,
				WaveTime = 1190,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 107640500,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 64584618,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 107640500,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 64584618,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 111580628,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12250,
				WaveTime = 1195,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 175739490,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 67813849,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 113022525,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 67813849,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 117159660,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12300,
				WaveTime = 1200,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 118673651,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 71204541,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 118673651,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 71204541,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 123017643,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12350,
				WaveTime = 1205,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 184526465,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 74764768,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 124607334,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 74764768,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 129168525,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12400,
				WaveTime = 1210,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 130837701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 78503006,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 130837701,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 78503006,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 135626951,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12450,
				WaveTime = 1215,
				Enemies = {
					["0"] = {
						Enemy = "Deviant Monty Imp",
						Large = true,
						Health = 203440427,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 82428156,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 137379586,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 82428156,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 142408299,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12500,
				WaveTime = 1220,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop",
						Health = "243440427",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 3500
							},
							Item_Souls = {
								Amount = 30
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
				Reward = 12550,
				WaveTime = 1225,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 224293071,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 86549564,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 144248565,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 86549564,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 149528714,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12600,
				WaveTime = 1230,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 151460994,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 90877042,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 151460994,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 90877042,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 157005150,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12650,
				WaveTime = 1235,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 247283111,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 95420894,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 159034043,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 95420894,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 164855407,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12700,
				WaveTime = 1240,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 166985745,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 100191939,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 166985745,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 100191939,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 173098177,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12750,
				WaveTime = 1245,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 272629629,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 105201536,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 175335033,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 105201536,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 181753086,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12800,
				WaveTime = 1250,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 184101785,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 110461613,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 184101785,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 110461613,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 190840740,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12850,
				WaveTime = 1255,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 286261110,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 115984694,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 193306874,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 115984694,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 200382777,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12900,
				WaveTime = 1260,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 202972218,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 121783929,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 202972218,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 121783929,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 210401916,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12950,
				WaveTime = 1265,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 315602874,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 127873125,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 213120829,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 127873125,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 220922012,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13000,
				WaveTime = 1270,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy",
						Health = "355602874",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 13050,
				WaveTime = 1275,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 347952170,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 134266781,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 223776870,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 134266781,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 231968113,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13100,
				WaveTime = 1280,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 234965714,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 140980120,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 234965714,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 140980120,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 243566518,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13150,
				WaveTime = 1285,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 383617266,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 148029126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 246714000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 148029126,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 255744844,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13200,
				WaveTime = 1290,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 259049700,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 155430583,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 259049700,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 155430583,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 268532086,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13250,
				WaveTime = 1295,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 422938037,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 163202112,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 272002185,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 163202112,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 281958691,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13300,
				WaveTime = 1300,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 285602294,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 171362218,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 285602294,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 171362218,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 296056626,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13350,
				WaveTime = 1305,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 444084939,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 179930329,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 299882409,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 179930329,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 310859457,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13400,
				WaveTime = 1310,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 314876529,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 188926845,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 314876529,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 188926845,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 326402430,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13450,
				WaveTime = 1315,
				Enemies = {
					["0"] = {
						Enemy = "Rogue Freddy Imp",
						Large = true,
						Health = 489603645,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 198373187,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 330620356,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 198373187,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 342722552,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13500,
				WaveTime = 1320,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica",
						Health = "529603645",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 13550,
				WaveTime = 1325,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 539788020,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 208291846,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 347151374,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 208291846,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 359858680,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13600,
				WaveTime = 1330,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 364508942,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 218706439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 364508942,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 218706439,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 377851614,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13650,
				WaveTime = 1335,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 595116291,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 229641761,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 382734390,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 229641761,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 396744194,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13700,
				WaveTime = 1340,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 401871109,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 241123849,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 401871109,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 241123849,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 416581404,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13750,
				WaveTime = 1345,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 656115711,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 253180041,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 421964665,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 253180041,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 437410474,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13800,
				WaveTime = 1350,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 443062898,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 265839043,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 443062898,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 265839043,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 459280998,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13850,
				WaveTime = 1355,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 688921497,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 279130995,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 465216043,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 279130995,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 482245048,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13900,
				WaveTime = 1360,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 488476845,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 293087545,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 488476845,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 293087545,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 506357300,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13950,
				WaveTime = 1365,
				Enemies = {
					["0"] = {
						Enemy = "Hacked Chica Imp",
						Large = true,
						Health = 759535950,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 307741922,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 512900687,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 307741922,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 531675165,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14000,
				WaveTime = 1370,
				Enemies = {
					["0"] = {
						Enemy = "Mad Roxy",
						Health = "859535950",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 14050,
				WaveTime = 1375,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 797512748,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 323129018,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 538545721,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 323129018,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 558258923,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14100,
				WaveTime = 1380,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 565473007,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 339285469,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 565473007,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 339285469,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 586171869,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14150,
				WaveTime = 1385,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 879257804,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 356249742,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 593746657,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 356249742,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 615480462,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14200,
				WaveTime = 1390,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 623433990,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 374062229,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 623433990,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 374062229,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 646254485,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14250,
				WaveTime = 1395,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 969381729,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 392765340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 654605690,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 392765340,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 678567209,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14300,
				WaveTime = 1400,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 687335975,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 412403607,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 687335975,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 412403607,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 712495569,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14350,
				WaveTime = 1405,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 1068743356,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 433023787,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 721702774,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 433023787,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 748120347,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14400,
				WaveTime = 1410,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 757787913,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 454674976,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 757787913,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 454674976,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 785526364,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14450,
				WaveTime = 1415,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 1178289550,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 477408725,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 795677309,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 477408725,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 824802682,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14500,
				WaveTime = 1420,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop",
						Health = "1278289550",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 14550,
				WaveTime = 1425,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 1237204028,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 501279161,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 835461174,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 501279161,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 866042816,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14600,
				WaveTime = 1430,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 877234233,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 526343119,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 877234233,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 526343119,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 909344957,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14650,
				WaveTime = 1435,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 1364017440,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 552660275,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 921095945,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 552660275,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 954812205,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14700,
				WaveTime = 1440,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 967150742,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 580293289,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 967150742,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 580293289,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1002552815,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14750,
				WaveTime = 1445,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 1503829228,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 609307953,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1015508279,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 609307953,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1052680456,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14800,
				WaveTime = 1450,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 1066283693,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 639773351,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1066283693,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 639773351,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1105314479,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14850,
				WaveTime = 1455,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 1657971723,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 671762019,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1119597878,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 671762019,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1160580203,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14900,
				WaveTime = 1460,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 1175577772,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 705350120,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1175577772,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 705350120,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1218609213,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 14950,
				WaveTime = 1465,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 1827913824,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 740617626,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1234356661,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 740617626,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1279539674,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15000,
				WaveTime = 1470,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop",
						Health = "1827913824",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 5000
							},
							Item_Souls = {
								Amount = 50
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
				Reward = 15050,
				WaveTime = 1475,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 1919309515,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 777648507,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1296074494,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 777648507,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1343516658,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15100,
				WaveTime = 1480,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 1360878219,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 816530932,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1360878219,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 816530932,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1410692491,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15150,
				WaveTime = 1485,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 2116038741,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 857357479,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1428922130,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 857357479,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1481227116,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15200,
				WaveTime = 1490,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 1500368237,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 900225353,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1500368237,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 900225353,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1555288472,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15250,
				WaveTime = 1495,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 2332932712,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 945236621,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1575386649,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 945236621,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1633052896,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15300,
				WaveTime = 1500,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 1654155981,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 992498452,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1654155981,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 992498452,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1714705541,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15350,
				WaveTime = 1505,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 2572058315,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1042123375,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1736863780,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1042123375,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1800440818,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15400,
				WaveTime = 1510,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 1823706969,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1094229544,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1823706969,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1094229544,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1890462859,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15450,
				WaveTime = 1515,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 2835694293,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1148941021,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 1914892317,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1148941021,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 1984986002,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15500,
				WaveTime = 1520,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop",
						Health = "1827913824",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
				Reward = 15550,
				WaveTime = 1525,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 2977479008,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1206388072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2010636933,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1206388072,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2084235302,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15600,
				WaveTime = 1530,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 2111168780,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1266707476,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2111168780,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1266707476,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2188447067,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15650,
				WaveTime = 1535,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 3282670606,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1330042850,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2216727219,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1330042850,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2297869420,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15700,
				WaveTime = 1540,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 2327563580,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1396544993,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2327563580,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1396544993,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2412762891,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15750,
				WaveTime = 1545,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 3619144343,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1466372243,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2443941759,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1466372243,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2533401036,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15800,
				WaveTime = 1550,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 2566138847,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1539690855,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2566138847,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1539690855,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2660071088,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15850,
				WaveTime = 1555,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 3990106638,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1616675398,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2694445789,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1616675398,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2793074642,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15900,
				WaveTime = 1560,
				Enemies = {
					["0"] = {
						Enemy = "Ruined Moondrop",
						Health = 2829168078,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1697509168,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2829168078,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1697509168,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 2932728374,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 15950,
				WaveTime = 1565,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop Imp",
						Large = true,
						Health = 4399092569,
						Amount = 2,
						TimeBetweenSpawns = 5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Ruined Roxy",
						Health = 1782384626,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Ruined Moondrop",
						Health = 2970626482,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Ruined Roxy",
						Health = 1782384626,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Ruined Monty",
						Health = 3079364793,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 16000,
				WaveTime = 1570,
				Enemies = {
					["0"] = {
						Enemy = "Insomniac Moondrop",
						Health = "1827913824",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 500
							},
							Item_Souls = {
								Amount = 5
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
			}
		}
	},
	[8] = {
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
						Enemy = "Scrapped STAFF Bot",
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
						Enemy = "Scrapped STAFF Bot",
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
						Enemy = "Scrapped STAFF Bot",
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
						Enemy = "Scrapped Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.5"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 40,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2.5"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 450,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3.5"] = {
						Enemy = "Scrapped Bonnie",
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
						Enemy = "Scrapped Eclipse",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 550,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped Eclipse",
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
						Enemy = "Scrapped Eclipse",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
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
						Enemy = "Scrapped Eclipse",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Tarnished Eclipse",
						Health = "200k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 35,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 700,
				WaveTime = 40,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Mimic",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 750,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Mimic",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 800,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 850,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
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
						Enemy = "Scrapped Mimic",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 7,
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
				Reward = 950,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1000,
				WaveTime = 70,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
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
						Enemy = "Forgotten Bonnie",
						Health = "250k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 1100,
				WaveTime = 80,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1150,
				WaveTime = 85,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1200,
				WaveTime = 90,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 1250,
				WaveTime = 95,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
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
						Enemy = "Scrapped Eclipse",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 1300,
				WaveTime = 100,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1350,
				WaveTime = 105,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1400,
				WaveTime = 110,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1450,
				WaveTime = 115,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1500,
				WaveTime = 120,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 1550,
				WaveTime = 125,
				Enemies = {
					["0"] = {
						Enemy = "Candy T",
						Health = "300k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
						Enemy = "Scrapped Mimic",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1650,
				WaveTime = 135,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1700,
				WaveTime = 140,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 1750,
				WaveTime = 145,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 1800,
				WaveTime = 150,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1850,
				WaveTime = 155,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1900,
				WaveTime = 160,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1950,
				WaveTime = 165,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2000,
				WaveTime = 170,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 2050,
				WaveTime = 175,
				Enemies = {
					["0"] = {
						Enemy = "Corrupted STAFF Bot",
						Health = "400k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 2100,
				WaveTime = 180,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2150,
				WaveTime = 185,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2200,
				WaveTime = 190,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 2250,
				WaveTime = 195,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2300,
				WaveTime = 200,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2350,
				WaveTime = 205,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2400,
				WaveTime = 210,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2450,
				WaveTime = 215,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2500,
				WaveTime = 220,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 2550,
				WaveTime = 225,
				Enemies = {
					["0"] = {
						Enemy = "Bloodlust Vanny",
						Health = "500k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2650,
				WaveTime = 235,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2700,
				WaveTime = 240,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 2750,
				WaveTime = 245,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2800,
				WaveTime = 250,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2850,
				WaveTime = 255,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2900,
				WaveTime = 260,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2950,
				WaveTime = 265,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3000,
				WaveTime = 270,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped STAFF Bot",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Eclipse",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Bonnie",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 3050,
				WaveTime = 275,
				Enemies = {
					["0"] = {
						Enemy = "Tarnished Eclipse",
						Health = "600k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 3100,
				WaveTime = 280,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 180619,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 72248,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 120413,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 72248,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 144495,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3150,
				WaveTime = 285,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 121999,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 73199,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 121999,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 73199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 146397,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3200,
				WaveTime = 290,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 185374,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 74149,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 123582,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 74149,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 148298,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 3250,
				WaveTime = 295,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 125167,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 75101,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 125167,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 75101,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 150199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3300,
				WaveTime = 300,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 190125,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 76050,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 126750,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 76050,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 152100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 3350,
				WaveTime = 305,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 128336,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 77002,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 128336,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 77002,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 154002,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3400,
				WaveTime = 310,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 194879,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 77952,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 129919,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 77952,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 155903,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3450,
				WaveTime = 315,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 131504,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 78904,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 131504,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 78904,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 157804,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3500,
				WaveTime = 320,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 199632,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 79853,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 133088,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 79853,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 159705,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 3550,
				WaveTime = 325,
				Enemies = {
					["0"] = {
						Enemy = "Tarnished Eclipse",
						Health = "1M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 3600,
				WaveTime = 330,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 228628,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 91579,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 152419,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 91579,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 182839,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3650,
				WaveTime = 335,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 153368,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 91894,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 153368,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 91894,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 184106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3700,
				WaveTime = 340,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 231479,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 92528,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 154319,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 92528,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 185055,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 3750,
				WaveTime = 345,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 155269,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 93162,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 155269,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 93162,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 186323,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3800,
				WaveTime = 350,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 234332,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 93795,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 156221,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 93795,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 187590,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 3850,
				WaveTime = 355,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 157170,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 94429,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 157170,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 94429,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 188542,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3900,
				WaveTime = 360,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 237182,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 95063,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 158122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 95063,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 189809,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3950,
				WaveTime = 365,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 159072,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 95381,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 159072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 95381,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 191077,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4000,
				WaveTime = 370,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 240036,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 96014,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 160024,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 96014,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 192027,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4050,
				WaveTime = 375,
				Enemies = {
					["0"] = {
						Enemy = "Candy T",
						Health = "1.5M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 4100,
				WaveTime = 380,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 337474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 112492,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 187590,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 112492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 224982,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4150,
				WaveTime = 385,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 188542,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 113126,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 188542,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 113126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 226249,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4200,
				WaveTime = 390,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 339827,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 113759,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 189492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 113759,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 227517,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4250,
				WaveTime = 395,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 190444,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 114394,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 190444,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 114394,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 228469,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4300,
				WaveTime = 400,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 343551,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 114709,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 191393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 114709,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 229736,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 4350,
				WaveTime = 405,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 192344,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 115343,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 192344,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 115343,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 230685,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 4400,
				WaveTime = 410,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 347286,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 115977,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 193294,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 115977,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 231953,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4450,
				WaveTime = 415,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 194246,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 116610,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 194246,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 116610,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 233220,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4500,
				WaveTime = 420,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 351732,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 117244,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 195195,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 117244,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 234488,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4550,
				WaveTime = 425,
				Enemies = {
					["0"] = {
						Enemy = "Corrupted STAFF Bot",
						Health = "2M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 4600,
				WaveTime = 430,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 408295,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 136257,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 226883,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 136257,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 272197,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4650,
				WaveTime = 435,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 227834,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 136574,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 227834,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 136574,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 273464,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4700,
				WaveTime = 440,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 410914,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 137209,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 228784,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 137209,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 274414,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4750,
				WaveTime = 445,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 229736,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 137842,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 229736,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 137842,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 275682,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4800,
				WaveTime = 450,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 413524,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 138476,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 230685,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 138476,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 276949,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 4850,
				WaveTime = 455,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 231637,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 139109,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 231637,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 139109,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 277901,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 4900,
				WaveTime = 460,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 416969,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 139425,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 232587,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 139425,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 279169,
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
						Enemy = "Scrapped Mimic",
						Health = 233539,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 140059,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 233539,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 140059,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 280118,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5000,
				WaveTime = 470,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 420177,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 140693,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 234488,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 140693,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 281385,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4950,
				WaveTime = 465,
				Enemies = {
					["0"] = {
						Enemy = "Bloodlust Vanny",
						Health = "3M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 2000
							},
							Item_Souls = {
								Amount = 25
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ThePrincess = {
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
				Reward = 5050,
				WaveTime = 475,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 465340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 155113,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 258522,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 155113,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 310227,
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
						Enemy = "Scrapped Mimic",
						Health = 271449,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 162869,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 271449,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 162869,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 325738,
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
						Enemy = "Scrapped Mimic",
						Health = 513037,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 171012,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 285021,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 171012,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 342025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 5200,
				WaveTime = 490,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 299272,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 179564,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 299272,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 179564,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 359126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 5250,
				WaveTime = 495,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 565625,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 188542,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 314236,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 188542,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 377083,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 5300,
				WaveTime = 500,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 329948,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 197969,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 329948,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 197969,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 395937,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 5350,
				WaveTime = 505,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 593906,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 207867,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 346445,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 207867,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 415735,
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
						Enemy = "Scrapped Mimic",
						Health = 363767,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 218261,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 363767,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 218261,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 436522,
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
						Enemy = "Scrapped Mimic",
						Health = 654783,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 229174,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 381956,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 229174,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 436522,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 5500,
				WaveTime = 520,
				Enemies = {
					["0"] = {
						Enemy = "Tarnished Eclipse",
						Health = "4.5M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 5550,
				WaveTime = 525,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 687522,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 240633,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 401054,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 240633,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 458348,
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
						Enemy = "Scrapped Mimic",
						Health = 421106,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 252665,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 421106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 252665,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 481265,
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
						Enemy = "Scrapped Mimic",
						Health = 757992,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 265298,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 442161,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 265298,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 505328,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 5700,
				WaveTime = 540,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 464269,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 278563,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 464269,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 278563,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 530595,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 5750,
				WaveTime = 545,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 835687,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 292491,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 487483,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 292491,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 557124,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 5800,
				WaveTime = 550,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 511857,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 307116,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 511857,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 307116,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 584981,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 5850,
				WaveTime = 555,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 877471,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 322472,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 537450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 322472,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 584981,
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
						Enemy = "Scrapped Mimic",
						Health = 564322,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 338595,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 564322,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 338595,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 614229,
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
						Enemy = "Scrapped Mimic",
						Health = 921344,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 355525,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 592539,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 355525,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 614229,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 6000,
				WaveTime = 570,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = "5M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 6050,
				WaveTime = 575,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 967411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 373302,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 622166,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 373302,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 644940,
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
						Enemy = "Scrapped Mimic",
						Health = 653273,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 391967,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 653273,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 391967,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 677188,
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
						Enemy = "Scrapped Mimic",
						Health = 1066571,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 411564,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 685937,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 411564,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 711047,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 6200,
				WaveTime = 590,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 720235,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 432143,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 720235,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 432143,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 746599,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 6250,
				WaveTime = 595,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1175896,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 453751,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 756246,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 453751,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 783930,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 6300,
				WaveTime = 600,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 794058,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 476438,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 794058,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 476438,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 823126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 6350,
				WaveTime = 605,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1234689,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 500261,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 833762,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 500261,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 864283,
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
						Enemy = "Scrapped Mimic",
						Health = 875450,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 525274,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 875450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 525274,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 907498,
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
						Enemy = "Scrapped Mimic",
						Health = 1361247,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 551538,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 919222,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 551538,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 952873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 6500,
				WaveTime = 620,
				Enemies = {
					["0"] = {
						Enemy = "Candy T",
						Health = "7M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 6550,
				WaveTime = 625,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1500775,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 579115,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 965184,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 579115,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1000516,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6600,
				WaveTime = 630,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1013442,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 608071,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1013442,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 608071,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1050542,
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
						Enemy = "Scrapped Mimic",
						Health = 1654605,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 638474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1064115,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 638474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1103070,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 6700,
				WaveTime = 640,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1117320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 670398,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1117320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 670398,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1158223,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 6750,
				WaveTime = 645,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1824202,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 703918,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1173186,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 703918,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1216134,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 6800,
				WaveTime = 650,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1231846,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 739114,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1231846,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 739114,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1276941,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 6850,
				WaveTime = 655,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1915411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 776069,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1293439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 776069,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1340788,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6900,
				WaveTime = 660,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1358111,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 814873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1358111,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 814873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1407827,
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
						Enemy = "Scrapped Mimic",
						Health = 2111741,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 855616,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1426017,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 855616,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1478218,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 7000,
				WaveTime = 670,
				Enemies = {
					["0"] = {
						Enemy = "Corrupted STAFF Bot",
						Health = "8M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 7050,
				WaveTime = 675,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 2328195,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 898396,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1497318,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 898396,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1552130,
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
						Enemy = "Scrapped Mimic",
						Health = 1572184,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 943316,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1572184,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 943316,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1629736,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7150,
				WaveTime = 685,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 2566834,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 990482,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1650793,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 990482,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1711223,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 7200,
				WaveTime = 690,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1733333,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1040007,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1733333,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1040007,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1796783,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 7250,
				WaveTime = 695,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 2829934,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1092007,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1819999,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1092007,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1886622,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 7300,
				WaveTime = 700,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1910999,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1146607,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 1910999,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1146607,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 1980953,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 7350,
				WaveTime = 705,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 2971430,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1203937,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 2006549,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1203937,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 2080000,
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
						Enemy = "Scrapped Mimic",
						Health = 2106876,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1264133,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 2106876,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1264133,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 2184000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7450,
				WaveTime = 715,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 3276000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1327340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 2212220,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1327340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 2293200,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 7500,
				WaveTime = 720,
				Enemies = {
					["0"] = {
						Enemy = "Bloodlust Vanny",
						Health = "9M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 2500
							},
							Item_Souls = {
								Amount = 25
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
				Reward = 7550,
				WaveTime = 725,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 3611790,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1393708,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 2322831,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1393708,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 2407860,
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
						Enemy = "Scrapped Mimic",
						Health = 2438973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1463393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 2438973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1463393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 2528253,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7650,
				WaveTime = 735,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 3982000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1536562,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 2560922,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1536562,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 2654666,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 7700,
				WaveTime = 740,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 2688968,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1613391,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 2688968,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1613391,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 2787399,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 7750,
				WaveTime = 745,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 4390155,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1694060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 2823417,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1694060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 2926769,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 7800,
				WaveTime = 750,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 2964588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1778763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 2964588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1778763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 3073108,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 7850,
				WaveTime = 755,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 4609662,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1867701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 3112818,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1867701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 3226763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7900,
				WaveTime = 760,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 3268459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1961086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 3268459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 1961086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 3388100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7950,
				WaveTime = 765,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 5082151,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2059140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 3431882,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2059140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 3557506,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 8000,
				WaveTime = 770,
				Enemies = {
					["0"] = {
						Enemy = "Tarnished Eclipse",
						Health = "10M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 8050,
				WaveTime = 775,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 5603072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2162098,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 3603475,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2162098,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 3735381,
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
						Enemy = "Scrapped Mimic",
						Health = 5883226,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2270202,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 3783833,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2383712,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 3922259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8150,
				WaveTime = 785,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 6177387,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2502897,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 3972975,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2502897,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 4118371,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 8200,
				WaveTime = 790,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 4380041,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2628042,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 4380041,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2628042,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 4540379,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 8250,
				WaveTime = 795,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 6810597,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2759444,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 4599049,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2759444,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 4767398,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8300,
				WaveTime = 800,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 5129552,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2897416,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 5129552,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 2897416,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 5005768,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8350,
				WaveTime = 805,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 7151102,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3042287,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 5380499,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3042287,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 5256056,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8400,
				WaveTime = 810,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 5634025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3194402,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 5634025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3194402,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 5518859,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8450,
				WaveTime = 815,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 7884292,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3354122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 5916126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3354122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 5794702,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 12500000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 8550,
				WaveTime = 825,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 8278706,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3521928,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 5961933,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3521928,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 6084437,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 8600,
				WaveTime = 830,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 8692541,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3698024,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 6260030,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3698024,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 6388659,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8650,
				WaveTime = 835,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 9127168,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3882926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 6573032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 3882926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 6708092,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8700,
				WaveTime = 840,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 9583526,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 4077072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 6901684,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 4077072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 7043496,
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
						Enemy = "Scrapped Mimic",
						Health = 10062702,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 4280926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 7246768,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 4280926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 7395671,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8800,
				WaveTime = 850,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 10565837,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 4494972,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 7609106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 4494972,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 7765455,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 8850,
				WaveTime = 855,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 11094129,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 4719721,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 7989461,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 4719721,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 8153728,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 8900,
				WaveTime = 860,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 11648836,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 4955707,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 8388934,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 4955707,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 8561414,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8950,
				WaveTime = 865,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 12231278,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 5203492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 8808381,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 5203492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 8989485,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 55000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 9050,
				WaveTime = 875,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 13484986,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 5736850,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 9711240,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 5736850,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 9910908,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 9100,
				WaveTime = 880,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 14159236,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 6023693,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 10196802,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 6023693,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 10406453,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 9150,
				WaveTime = 885,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 14867198,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 6324878,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 10706642,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 6324878,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 10926775,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 9200,
				WaveTime = 890,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 15610558,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 6641122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 11241924,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 6641122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 11473114,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 9250,
				WaveTime = 895,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 16391086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 6973178,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 11804020,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 6973178,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 12046770,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 9300,
				WaveTime = 900,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 17210641,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 7321837,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 12394221,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 7321837,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 12649109,
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
						Enemy = "Scrapped Mimic",
						Health = 18071173,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 7687929,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 13013932,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 7687929,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 13281564,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 9400,
				WaveTime = 910,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 18974732,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 8072325,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 13664628,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 8072325,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 13945642,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 9450,
				WaveTime = 915,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 19923468,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 8475942,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 14347860,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 8475942,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 14642424,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 55000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 9550,
				WaveTime = 925,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 21965624,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 9344726,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 15818016,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 9344726,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 16143273,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 9600,
				WaveTime = 930,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 23063905,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 9811962,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 16608917,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 9811962,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 16950437,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9650,
				WaveTime = 935,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 24217100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 10302160,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 17439363,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 10302160,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 17797959,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 9700,
				WaveTime = 940,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 25427955,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 10817268,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 18311331,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 10817268,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 18687857,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 9750,
				WaveTime = 945,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 26699353,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 11358131,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 19226898,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 11358131,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 19622250,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 9800,
				WaveTime = 950,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 28034320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 11926038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 20188243,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 11926038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 20603362,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 9850,
				WaveTime = 955,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 29436037,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 12522340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 21197655,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 12522340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 21633529,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 9900,
				WaveTime = 960,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 30907838,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 13148457,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 22257538,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 13148457,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 22715205,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9950,
				WaveTime = 965,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 32453230,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 13805880,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 23370416,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 13805880,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 23850965,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 85000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 10050,
				WaveTime = 975,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 35779686,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 15220983,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 25765884,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 15220983,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 26295689,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 10100,
				WaveTime = 980,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 37568670,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 15982032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 27054178,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 15982032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 27610474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10150,
				WaveTime = 985,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 39447104,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 16781134,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 28406437,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 16781134,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 28990997,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 10200,
				WaveTime = 990,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 41419459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 17620190,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 29826759,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 17620190,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 30440547,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10250,
				WaveTime = 995,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 43490432,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 18501199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 31318197,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 18501199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 31962574,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 10300,
				WaveTime = 1000,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 45664954,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 19426259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 32884057,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 19426259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 33560700,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 10350,
				WaveTime = 1005,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 47948201,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 20397572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 34528260,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 20397572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 35238735,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 10400,
				WaveTime = 1010,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 50345661,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 21417450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 36254673,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 21417450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 37000622,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10450,
				WaveTime = 1015,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 52862944,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 22488323,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 38067406,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 22488323,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 38850653,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 115000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 10550,
				WaveTime = 1025,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 58281714,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 24793376,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 41969315,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 24793376,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 42832871,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 10600,
				WaveTime = 1030,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 61195800,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 26033045,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 44067281,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 26033045,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 44974514,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10650,
				WaveTime = 1035,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 64255590,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 27334697,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 46270645,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 27334697,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 47223240,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 10700,
				WaveTime = 1040,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 67468370,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 28701532,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 48584177,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 28701532,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 49584402,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10750,
				WaveTime = 1045,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 70841788,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 30136609,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 51013386,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 30136609,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 52063622,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 10800,
				WaveTime = 1050,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 74383877,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 31643439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 53564056,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 31643439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 54666803,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 10850,
				WaveTime = 1055,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 78103071,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 33225611,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 56242259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 33225611,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 57400144,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 10900,
				WaveTime = 1060,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 82008225,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 34886892,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 59054371,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 34886892,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 60270151,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10950,
				WaveTime = 1065,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 86108636,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 36631237,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 62007090,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 36631237,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 63283658,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 170000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 11000,
				WaveTime = 1070,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 90414068,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 38462799,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 65107444,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 38462799,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 66447841,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 11050,
				WaveTime = 1075,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 94934771,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 40385939,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 68362817,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 40385939,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 69770233,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 11100,
				WaveTime = 1080,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 99681609,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 42405236,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 71780958,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 42405236,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 73258745,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 11150,
				WaveTime = 1085,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 104665689,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 44525498,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 75370006,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 44525498,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 76921682,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11200,
				WaveTime = 1090,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 109898974,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 46751773,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 79138506,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 46751773,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 80767761,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 11250,
				WaveTime = 1095,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 115393923,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 49089361,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 83095431,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 49089361,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 84806150,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 11300,
				WaveTime = 1100,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 121163619,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 51543829,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 87250203,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 51543829,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 89046445,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 11350,
				WaveTime = 1105,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 127221700,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 54121021,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 91612713,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 54121021,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 93398777,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 11400,
				WaveTime = 1110,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 133582785,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 56827072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 96193349,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 56827072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 98068716,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 250000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 11450,
				WaveTime = 1115,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 140261942,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 59668425,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 101003416,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 59668425,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 102972152,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 11500,
				WaveTime = 1120,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 147275049,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 62651847,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 106053583,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 62651847,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 108120809,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 11550,
				WaveTime = 1125,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 154638802,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 65784439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 111356262,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 65784439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 113526850,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 11600,
				WaveTime = 1130,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 162370742,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 69073661,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 116924075,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 69073661,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 119203219,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11650,
				WaveTime = 1135,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 170489279,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 72527344,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 122770279,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 72527344,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 125163387,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 11700,
				WaveTime = 1140,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 178963721,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 76153711,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 128908793,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 76153711,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 131421556,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 11750,
				WaveTime = 1145,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 187911907,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 79961397,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 135354233,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 79961397,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 137992633,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 11800,
				WaveTime = 1150,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 197307502,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 83959467,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 142121945,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 83959467,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 144892264,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 11850,
				WaveTime = 1155,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 207172877,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 88157440,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 149228042,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 88157440,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 152136887,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 370000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 11900,
				WaveTime = 1160,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 217531521,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 92565312,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 156689444,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 92565312,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 159743732,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 11950,
				WaveTime = 1165,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 228408098,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 97193578,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 164823916,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 97193578,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 167730920,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 12000,
				WaveTime = 1170,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 239828500,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 102053256,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 173065112,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 102053256,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 176117466,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 12050,
				WaveTime = 1175,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 251819925,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 107155919,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 181718367,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 107155919,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 184923339,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12100,
				WaveTime = 1180,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 264411017,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 112513715,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 190804235,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 112513715,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 194169506,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 12150,
				WaveTime = 1185,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 277631572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 118139401,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 200344447,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 118139401,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 203878481,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 12200,
				WaveTime = 1190,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 291513155,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 124046371,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 210361670,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 124046371,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 214072405,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 12250,
				WaveTime = 1195,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 306088813,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 130248689,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 220879753,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 130248689,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 224775703,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 12300,
				WaveTime = 1200,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 321393254,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 136761124,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 231923741,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 136761124,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 236014488,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 550000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 12350,
				WaveTime = 1205,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 337462917,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 143599180,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 243519928,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 143599180,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 247815212,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 12400,
				WaveTime = 1210,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 354336106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 150679139,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 255695925,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 150679139,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 260205973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 12450,
				WaveTime = 1215,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 372053262,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 158213095,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 268480721,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 158213095,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 273216272,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 12500,
				WaveTime = 1220,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 390655592,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 166123760,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 281904757,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 166123760,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 286876986,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12550,
				WaveTime = 1225,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 410188372,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 174429948,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 296000000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 174429948,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 301221385,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 12600,
				WaveTime = 1230,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 430697791,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 183151445,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 310800000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 183151445,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 316282454,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 12650,
				WaveTime = 1235,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 452232681,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 192309022,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 326340000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 192309022,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 332096567,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 12700,
				WaveTime = 1240,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 474844352,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 201924473,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 342657000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 201924473,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 348701395,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 12750,
				WaveTime = 1245,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 498586674,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 212020697,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 359789850,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 212020697,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 366136465,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 820000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 12800,
				WaveTime = 1250,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 523516008,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 222621732,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 377778842,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 222621732,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 384443288,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 12850,
				WaveTime = 1255,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 549691809,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 233752811,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 396667734,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 233752811,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 403665453,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 12900,
				WaveTime = 1260,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 577176399,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 245440445,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 416501121,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 245440445,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 423848726,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 12950,
				WaveTime = 1265,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 606035170,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 257712467,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 437326177,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 257712467,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 445041612,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13000,
				WaveTime = 1270,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 636336928,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 270598090,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 459192486,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 270598090,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 467293692,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 13050,
				WaveTime = 1275,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 668153775,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 284127995,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 482152060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 284127995,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 490658377,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 13100,
				WaveTime = 1280,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 701561664,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 298334395,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 506259763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 298334395,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 515191296,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 13150,
				WaveTime = 1285,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 736639747,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 313251615,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 531572751,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 313251615,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 540950861,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 13200,
				WaveTime = 1290,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 773471734,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 328914196,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 558151439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 328914196,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 568498404,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 1220000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 13250,
				WaveTime = 1295,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 812145331,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 345359606,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 586058961,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 345359606,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 596923324,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 13300,
				WaveTime = 1300,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 852752598,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 362627536,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 615361909,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 362627536,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 626769490,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 13350,
				WaveTime = 1305,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 895390222,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 380758913,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 646129999,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 380758913,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 658107965,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 13400,
				WaveTime = 1310,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 940159733,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 399796859,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 678436549,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 399796859,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 691013354,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13450,
				WaveTime = 1315,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 987167720,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 419786701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 712358377,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 419786701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 725564021,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 13500,
				WaveTime = 1320,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1036526158,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 440776136,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 747976296,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 440776136,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 761842222,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 13550,
				WaveTime = 1325,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1088352446,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 462814743,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 785375011,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 462814743,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 799934333,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 13600,
				WaveTime = 1330,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1142770068,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 486455480,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 824643761,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 486455480,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 839931100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 13650,
				WaveTime = 1335,
				Enemies = {
					["0"] = {
						Enemy = "Scrapped Mimic",
						Health = 1199908571,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 510778254,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Scrapped Mimic",
						Health = 865875749,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Scrapped Candy Cadet",
						Health = 510778254,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Scrapped STAFF Bot",
						Health = 882427655,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Forgotten Bonnie",
						Health = 1820000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			}
		}
	},
	[9] = {
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
						Enemy = "Forsaken El Chip",
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
						Enemy = "Forsaken El Chip",
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
						Enemy = "Forsaken El Chip",
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
						Enemy = "Forsaken Nedd Bear",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1.5"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2.5"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 40,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2.5"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 450,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3.5"] = {
						Enemy = "Forsaken Nedd Bear",
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
						Enemy = "Forsaken Pig Patch",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 550,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken Pig Patch",
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
						Enemy = "Forsaken Pig Patch",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
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
						Enemy = "Forsaken Pig Patch",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Nedd Bear",
						Health = "300k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken El Chip",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 35,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken El Chip",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 700,
				WaveTime = 40,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken El Chip",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 750,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken El Chip",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 800,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 850,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken XOR",
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
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 950,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1000,
				WaveTime = 70,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
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
						Enemy = "Dreadful Pig Patch",
						Health = "400k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 1100,
				WaveTime = 80,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1150,
				WaveTime = 85,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1200,
				WaveTime = 90,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 1250,
				WaveTime = 95,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
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
						Enemy = "Forsaken Pig Patch",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 1300,
				WaveTime = 100,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1350,
				WaveTime = 105,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1400,
				WaveTime = 110,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1450,
				WaveTime = 115,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1500,
				WaveTime = 120,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 1550,
				WaveTime = 125,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful El Chip",
						Health = "600k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1650,
				WaveTime = 135,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1700,
				WaveTime = 140,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 1750,
				WaveTime = 145,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 1800,
				WaveTime = 150,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1850,
				WaveTime = 155,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1900,
				WaveTime = 160,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1950,
				WaveTime = 165,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2000,
				WaveTime = 170,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 2050,
				WaveTime = 175,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful XOR",
						Health = "900k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 2100,
				WaveTime = 180,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2150,
				WaveTime = 185,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2200,
				WaveTime = 190,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 2250,
				WaveTime = 195,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2300,
				WaveTime = 200,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2350,
				WaveTime = 205,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2400,
				WaveTime = 210,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2450,
				WaveTime = 215,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2500,
				WaveTime = 220,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 2550,
				WaveTime = 225,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Mr Hippo",
						Health = "1.2M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2650,
				WaveTime = 235,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2700,
				WaveTime = 240,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 2750,
				WaveTime = 245,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 2800,
				WaveTime = 250,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2850,
				WaveTime = 255,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2900,
				WaveTime = 260,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2950,
				WaveTime = 265,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3000,
				WaveTime = 270,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken El Chip",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Pig Patch",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken Nedd Bear",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 3050,
				WaveTime = 275,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Nedd Bear",
						Health = "1.5M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 3100,
				WaveTime = 280,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 180619,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 72248,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 120413,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 72248,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 144495,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3150,
				WaveTime = 285,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 121999,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 73199,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 121999,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 73199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 146397,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3200,
				WaveTime = 290,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 185374,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 74149,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 123582,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 74149,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 148298,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 3250,
				WaveTime = 295,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 125167,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 75101,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 125167,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 75101,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 150199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3300,
				WaveTime = 300,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 190125,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 76050,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 126750,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 76050,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 152100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 3350,
				WaveTime = 305,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 128336,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 77002,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 128336,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 77002,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 154002,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3400,
				WaveTime = 310,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 194879,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 77952,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 129919,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 77952,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 155903,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3450,
				WaveTime = 315,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 131504,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 78904,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 131504,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 78904,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 157804,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3500,
				WaveTime = 320,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 199632,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 79853,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 133088,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 79853,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 159705,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 3550,
				WaveTime = 325,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Pig Patch",
						Health = "1.7M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 3600,
				WaveTime = 330,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 228628,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 91579,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 152419,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 91579,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 182839,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3650,
				WaveTime = 335,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 153368,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 91894,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 153368,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 91894,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 184106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3700,
				WaveTime = 340,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 231479,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 92528,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 154319,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 92528,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 185055,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 3750,
				WaveTime = 345,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 155269,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 93162,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 155269,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 93162,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 186323,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 3800,
				WaveTime = 350,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 234332,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 93795,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 156221,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 93795,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 187590,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 3850,
				WaveTime = 355,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 157170,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 94429,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 157170,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 94429,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 188542,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3900,
				WaveTime = 360,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 237182,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 95063,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 158122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 95063,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 189809,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3950,
				WaveTime = 365,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 159072,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 95381,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 159072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 95381,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 191077,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4000,
				WaveTime = 370,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 240036,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 96014,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 160024,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 96014,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 192027,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4050,
				WaveTime = 375,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful El Chip",
						Health = "2M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 4100,
				WaveTime = 380,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 337474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 112492,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 187590,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 112492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 224982,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4150,
				WaveTime = 385,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 188542,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 113126,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 188542,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 113126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 226249,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4200,
				WaveTime = 390,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 339827,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 113759,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 189492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 113759,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 227517,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4250,
				WaveTime = 395,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 190444,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 114394,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 190444,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 114394,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 228469,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4300,
				WaveTime = 400,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 343551,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 114709,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 191393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 114709,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 229736,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 4350,
				WaveTime = 405,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 192344,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 115343,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 192344,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 115343,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 230685,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 4400,
				WaveTime = 410,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 347286,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 115977,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 193294,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 115977,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 231953,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4450,
				WaveTime = 415,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 194246,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 116610,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 194246,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 116610,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 233220,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4500,
				WaveTime = 420,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 351732,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 117244,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 195195,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 117244,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 234488,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4550,
				WaveTime = 425,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful XOR",
						Health = "2.5M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 4600,
				WaveTime = 430,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 408295,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 136257,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 226883,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 136257,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 272197,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4650,
				WaveTime = 435,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 227834,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 136574,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 227834,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 136574,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 273464,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4700,
				WaveTime = 440,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 410914,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 137209,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 228784,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 137209,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 274414,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4750,
				WaveTime = 445,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 229736,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 137842,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 229736,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 137842,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 275682,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 4800,
				WaveTime = 450,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 413524,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 138476,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 230685,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 138476,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 276949,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 4850,
				WaveTime = 455,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 231637,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 139109,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 231637,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 139109,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 277901,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 4900,
				WaveTime = 460,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 416969,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 139425,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 232587,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 139425,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 279169,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 233539,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 140059,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 233539,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 140059,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 280118,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5000,
				WaveTime = 470,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 420177,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 140693,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 234488,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 140693,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 281385,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 4950,
				WaveTime = 465,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Mr Hippo",
						Health = "4M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 2000
							},
							Item_Souls = {
								Amount = 25
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_HappyFrog = {
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
				Reward = 5050,
				WaveTime = 475,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 465340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 155113,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 258522,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 155113,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 310227,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 271449,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 162869,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 271449,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 162869,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 325738,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 513037,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 171012,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 285021,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 171012,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 342025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 5200,
				WaveTime = 490,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 299272,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 179564,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 299272,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 179564,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 359126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 5250,
				WaveTime = 495,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 565625,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 188542,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 314236,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 188542,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 377083,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 5300,
				WaveTime = 500,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 329948,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 197969,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 329948,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 197969,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 395937,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 5350,
				WaveTime = 505,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 593906,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 207867,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 346445,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 207867,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 415735,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 363767,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 218261,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 363767,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 218261,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 436522,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 654783,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 229174,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 381956,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 229174,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken XOR",
						Health = 436522,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 5500,
				WaveTime = 520,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Nedd Bear",
						Health = "6M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 5550,
				WaveTime = 525,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 687522,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 240633,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 401054,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 240633,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 458348,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 421106,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 252665,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 421106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 252665,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 481265,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 757992,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 265298,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 442161,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 265298,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 505328,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 5700,
				WaveTime = 540,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 464269,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 278563,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 464269,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 278563,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 530595,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 5750,
				WaveTime = 545,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 835687,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 292491,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 487483,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 292491,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 557124,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 5800,
				WaveTime = 550,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 511857,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 307116,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 511857,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 307116,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 584981,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 5850,
				WaveTime = 555,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 877471,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 322472,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 537450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 322472,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 584981,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 564322,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 338595,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 564322,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 338595,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 614229,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 921344,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 355525,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 592539,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 355525,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 614229,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 6000,
				WaveTime = 570,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Pig Patch",
						Health = "7M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 6050,
				WaveTime = 575,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 967411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 373302,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 622166,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 373302,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 644940,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 653273,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 391967,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 653273,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 391967,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 677188,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 1066571,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 411564,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 685937,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 411564,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 711047,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 6200,
				WaveTime = 590,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 720235,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 432143,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 720235,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 432143,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 746599,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 6250,
				WaveTime = 595,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1175896,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 453751,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 756246,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 453751,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 783930,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 6300,
				WaveTime = 600,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 794058,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 476438,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 794058,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 476438,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 823126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 6350,
				WaveTime = 605,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1234689,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 500261,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 833762,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 500261,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 864283,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 875450,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 525274,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 875450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 525274,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 907498,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 1361247,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 551538,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 919222,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 551538,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 952873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 6500,
				WaveTime = 620,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful El Chip",
						Health = "10M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 6550,
				WaveTime = 625,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1500775,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 579115,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 965184,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 579115,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1000516,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6600,
				WaveTime = 630,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1013442,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 608071,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1013442,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 608071,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1050542,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 1654605,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 638474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1064115,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 638474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1103070,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 6700,
				WaveTime = 640,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1117320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 670398,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1117320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 670398,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1158223,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 6750,
				WaveTime = 645,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1824202,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 703918,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1173186,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 703918,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1216134,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 6800,
				WaveTime = 650,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1231846,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 739114,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1231846,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 739114,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1276941,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 6850,
				WaveTime = 655,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1915411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 776069,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1293439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 776069,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1340788,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6900,
				WaveTime = 660,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1358111,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 814873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1358111,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 814873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1407827,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 2111741,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 855616,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1426017,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 855616,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1478218,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 7000,
				WaveTime = 670,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful XOR",
						Health = "14M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 7550,
				WaveTime = 725,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3611790,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1393708,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2322831,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1393708,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2407860,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 2438973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1463393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2438973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1463393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2528253,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7650,
				WaveTime = 735,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3982000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1536562,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2560922,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1536562,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2654666,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 7700,
				WaveTime = 740,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2688968,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1613391,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2688968,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1613391,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2787399,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 7750,
				WaveTime = 745,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4390155,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1694060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2823417,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1694060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2926769,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 7800,
				WaveTime = 750,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2964588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1778763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2964588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1778763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 3073108,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 7850,
				WaveTime = 755,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4609662,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1867701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3112818,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1867701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 3226763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7900,
				WaveTime = 760,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3268459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1961086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3268459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1961086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 3388100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7950,
				WaveTime = 765,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5082151,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 2059140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3431882,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 2059140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 3557506,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 8000,
				WaveTime = 770,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Pig Patch",
						Health = "20M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 7550,
				WaveTime = 725,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3611790,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1393708,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2322831,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1393708,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2407860,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 2438973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1463393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2438973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1463393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2528253,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7650,
				WaveTime = 735,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3982000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1536562,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2560922,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1536562,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2654666,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 7700,
				WaveTime = 740,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2688968,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1613391,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2688968,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1613391,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2787399,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 7750,
				WaveTime = 745,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4390155,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1694060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2823417,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1694060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2926769,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 7800,
				WaveTime = 750,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2964588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1778763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2964588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1778763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 3073108,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 7850,
				WaveTime = 755,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4609662,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1867701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3112818,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1867701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 3226763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7900,
				WaveTime = 760,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3268459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1961086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3268459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1961086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 3388100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7950,
				WaveTime = 765,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5082151,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 2059140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3431882,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 2059140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 3557506,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 8000,
				WaveTime = 770,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Nedd Bear",
						Health = "20M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 8050,
				WaveTime = 775,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5603072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 2162098,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3603475,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 2162098,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 3735381,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 5883226,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 2270202,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3783833,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 2383712,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 3922259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8150,
				WaveTime = 785,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6177387,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 2502897,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3972975,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 2502897,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 4118371,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 8200,
				WaveTime = 790,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4380041,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 2628042,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4380041,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 2628042,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 4540379,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 8250,
				WaveTime = 795,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6810597,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 2759444,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4599049,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 2759444,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 4767398,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8300,
				WaveTime = 800,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5129552,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 2897416,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5129552,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 2897416,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 5005768,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8350,
				WaveTime = 805,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7151102,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 3042287,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5380499,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 3042287,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 5256056,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8400,
				WaveTime = 810,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5634025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 3194402,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5634025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 3194402,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 5518859,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8450,
				WaveTime = 815,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7884292,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 3354122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5916126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 3354122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 5794702,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Pig Patch",
						Health = "30M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 8550,
				WaveTime = 825,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8278706,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 3521928,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5961933,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 3521928,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 6084437,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 8600,
				WaveTime = 830,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8692541,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 3698024,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6260030,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 3698024,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 6388659,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8650,
				WaveTime = 835,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 9127168,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 3882926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6573032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 3882926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 6708092,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8700,
				WaveTime = 840,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 9583526,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 4077072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6901684,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 4077072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 7043496,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 10062702,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 4280926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7246768,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 4280926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 7395671,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8800,
				WaveTime = 850,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 10565837,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 4494972,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7609106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 4494972,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 7765455,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 8850,
				WaveTime = 855,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 11094129,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 4719721,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7989461,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 4719721,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 8153728,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 8900,
				WaveTime = 860,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 11648836,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 4955707,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8388934,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 4955707,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 8561414,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8950,
				WaveTime = 865,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 12231278,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 5203492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8808381,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 5203492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 8989485,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful El Chip",
						Health = "70M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 9050,
				WaveTime = 875,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 13484986,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 5736850,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 9711240,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 5736850,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 9910908,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 9100,
				WaveTime = 880,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 14159236,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 6023693,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 10196802,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 6023693,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 10406453,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 9150,
				WaveTime = 885,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 14867198,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 6324878,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 10706642,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 6324878,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 10926775,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 9200,
				WaveTime = 890,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 15610558,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 6641122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 11241924,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 6641122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 11473114,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 9250,
				WaveTime = 895,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 16391086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 6973178,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 11804020,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 6973178,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 12046770,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 9300,
				WaveTime = 900,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 17210641,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 7321837,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 12394221,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 7321837,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 12649109,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 18071173,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 7687929,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 13013932,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 7687929,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 13281564,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 9400,
				WaveTime = 910,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 18974732,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 8072325,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 13664628,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 8072325,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 13945642,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 9450,
				WaveTime = 915,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 19923468,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 8475942,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 14347860,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 8475942,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 14642424,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful XOR",
						Health = "55000000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 9550,
				WaveTime = 925,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 21965624,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 9344726,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 15818016,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 9344726,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 16143273,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 9600,
				WaveTime = 930,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 23063905,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 9811962,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 16608917,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 9811962,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 16950437,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9650,
				WaveTime = 935,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 24217100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 10302160,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 17439363,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 10302160,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 17797959,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 9700,
				WaveTime = 940,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 25427955,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 10817268,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 18311331,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 10817268,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 18687857,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 9750,
				WaveTime = 945,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 26699353,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 11358131,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 19226898,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 11358131,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 19622250,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 9800,
				WaveTime = 950,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 28034320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 11926038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 20188243,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 11926038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 20603362,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 9850,
				WaveTime = 955,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 29436037,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 12522340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 21197655,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 12522340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 21633529,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 9900,
				WaveTime = 960,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 30907838,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 13148457,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 22257538,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 13148457,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 22715205,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9950,
				WaveTime = 965,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 32453230,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 13805880,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 23370416,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 13805880,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 23850965,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Mr Hippo",
						Health = 85000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 10050,
				WaveTime = 975,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 35779686,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 15220983,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 25765884,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 15220983,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 26295689,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 10100,
				WaveTime = 980,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 37568670,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 15982032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 27054178,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 15982032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 27610474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10150,
				WaveTime = 985,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 39447104,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 16781134,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 28406437,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 16781134,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 28990997,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 10200,
				WaveTime = 990,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 41419459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 17620190,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 29826759,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 17620190,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 30440547,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10250,
				WaveTime = 995,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 43490432,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 18501199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 31318197,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 18501199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 31962574,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 10300,
				WaveTime = 1000,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 45664954,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 19426259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 32884057,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 19426259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 33560700,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 10350,
				WaveTime = 1005,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 47948201,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 20397572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 34528260,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 20397572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 35238735,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 10400,
				WaveTime = 1010,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 50345661,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 21417450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 36254673,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 21417450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 37000622,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10450,
				WaveTime = 1015,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 52862944,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 22488323,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 38067406,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 22488323,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 38850653,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Nedd Bear",
						Health = 115000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 10550,
				WaveTime = 1025,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 58281714,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 24793376,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 41969315,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 24793376,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 42832871,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 10600,
				WaveTime = 1030,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 61195800,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 26033045,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 44067281,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 26033045,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 44974514,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10650,
				WaveTime = 1035,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 64255590,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 27334697,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 46270645,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 27334697,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 47223240,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 10700,
				WaveTime = 1040,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 67468370,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 28701532,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 48584177,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 28701532,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 49584402,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10750,
				WaveTime = 1045,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 70841788,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 30136609,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 51013386,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 30136609,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 52063622,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 10800,
				WaveTime = 1050,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 74383877,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 31643439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 53564056,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 31643439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 54666803,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 10850,
				WaveTime = 1055,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 78103071,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 33225611,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 56242259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 33225611,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 57400144,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 10900,
				WaveTime = 1060,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 82008225,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 34886892,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 59054371,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 34886892,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 60270151,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10950,
				WaveTime = 1065,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 86108636,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 36631237,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 62007090,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 36631237,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 63283658,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Pig Patch",
						Health = 170000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 11050,
				WaveTime = 1075,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 90629339,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 38554377,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 65262462,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 38554377,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 66606050,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 11100,
				WaveTime = 1080,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 95613953,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 40674868,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 68851897,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 40674868,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 70269383,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 11150,
				WaveTime = 1085,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 101111755,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 43013673,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 72810881,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 43013673,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 74309873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 11200,
				WaveTime = 1090,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 107178460,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 45594493,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 77179534,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 45594493,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 78768465,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 11250,
				WaveTime = 1095,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 113877114,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 48444149,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 82003255,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 48444149,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 83691494,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11300,
				WaveTime = 1100,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 121279126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 51593019,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 87333467,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 51593019,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 89131441,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 11350,
				WaveTime = 1105,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 129465467,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 55075548,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 93228476,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 55075548,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 95147813,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 11400,
				WaveTime = 1110,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 138528050,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 58930836,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 99754469,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 58930836,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 101808160,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 11450,
				WaveTime = 1115,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 148571334,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 63203322,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 106986668,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 63203322,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 109189252,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Orville",
						Health = "400M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 11550,
				WaveTime = 1125,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 160085612,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 68101579,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 115278135,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 68101579,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 117651419,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11600,
				WaveTime = 1130,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 172892461,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 73549705,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 124500386,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 73549705,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 127063533,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 11650,
				WaveTime = 1135,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 187156089,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 79617556,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 134771668,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 79617556,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 137546274,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 11700,
				WaveTime = 1140,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 203064357,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 86385048,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 146227260,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 86385048,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 149237707,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 11750,
				WaveTime = 1145,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 220832488,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 93943740,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 159022145,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 93943740,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 162296006,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 11800,
				WaveTime = 1150,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 240707412,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 102398677,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 173334138,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 102398677,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 176902647,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 11850,
				WaveTime = 1155,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 262972848,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 111870555,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 189367546,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 111870555,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 193266142,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11900,
				WaveTime = 1160,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 287955269,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 122498258,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 207357463,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 122498258,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 211626425,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 11950,
				WaveTime = 1165,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 316030908,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 134441838,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 227574816,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 134441838,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 232260001,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful El Chip",
						Health = "500M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 12050,
				WaveTime = 1175,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 348424076,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 148222126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 250901235,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 148222126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 256066651,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 12100,
				WaveTime = 1180,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 385008604,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 163785449,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 277245865,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 163785449,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 282953649,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 12150,
				WaveTime = 1185,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 426397029,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 181392385,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 307049795,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 181392385,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 313371166,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12200,
				WaveTime = 1190,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 473300702,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 201345547,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 340825272,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 201345547,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 347841994,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 12250,
				WaveTime = 1195,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 526547031,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 223996921,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 379168115,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 223996921,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 386974218,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 12300,
				WaveTime = 1200,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 587099940,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 249756567,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 422772448,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 249756567,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 431476253,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 12350,
				WaveTime = 1205,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 656084183,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 279102964,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 472448211,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 279102964,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 482174713,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 12400,
				WaveTime = 1210,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 734814285,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 312595320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 529141996,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 312595320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 540035679,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 12450,
				WaveTime = 1215,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 824829035,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 350888247,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 593961891,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 350888247,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 606190050,
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
						Enemy = "Dreadful Mr Hippo",
						Health = "1B",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 12550,
				WaveTime = 1225,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 929994737,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 395626498,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 669692032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 395626498,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 683479281,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 12600,
				WaveTime = 1230,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1050894053,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 447057943,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 756751996,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 447057943,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 772331588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 12650,
				WaveTime = 1235,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1190137515,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 506293120,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 857021635,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 506293120,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 874665523,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 12700,
				WaveTime = 1240,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1350806080,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 574642691,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 972719556,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 574642691,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 992745369,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 12750,
				WaveTime = 1245,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1536541916,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 653656061,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1106468495,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 653656061,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1129247857,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12800,
				WaveTime = 1250,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1751657784,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 745167910,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1261374084,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 745167910,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1287342557,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 12850,
				WaveTime = 1255,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2001269018,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 851354337,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1441119891,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 851354337,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1470788871,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 12900,
				WaveTime = 1260,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2291453026,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 974800716,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1650082275,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 974800716,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1684053257,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 12950,
				WaveTime = 1265,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2629442347,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1118583822,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1893469411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1118583822,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 1932451112,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful XOR",
						Health = "2B",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 13050,
				WaveTime = 1275,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3030432305,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1289167855,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2182223496,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1289167855,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2227149907,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13100,
				WaveTime = 1280,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3500149312,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1488988873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2520468138,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1488988873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2572358143,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 13150,
				WaveTime = 1285,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4051422829,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1723504620,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2917441870,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1723504620,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 2977504551,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 13200,
				WaveTime = 1290,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4699650482,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 1999265359,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3384232569,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 1999265359,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 3453905279,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 13250,
				WaveTime = 1295,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5463343685,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 2324145980,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3934170361,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 2324145980,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 4015164887,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 13300,
				WaveTime = 1300,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6364795393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 2707630067,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4583308471,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 2707630067,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 4677667093,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 13350,
				WaveTime = 1305,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7430898621,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 3161158103,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5351012640,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 3161158103,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 5461176331,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13400,
				WaveTime = 1310,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8694151387,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 3698554981,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6260684789,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 3698554981,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 6389576307,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 13450,
				WaveTime = 1315,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 10193892501,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 4336555715,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7340652915,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 4336555715,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 7491778220,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Dreadful Nedd Bear",
						Health = "3B",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 13550,
				WaveTime = 1325,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 12003308420,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 5106294354,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8643618807,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 5106294354,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 8821568854,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 13600,
				WaveTime = 1330,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 14163903936,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 6025427338,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 10199470192,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 6025427338,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 10409451248,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 13650,
				WaveTime = 1335,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 16748816404,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 7125067827,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 12060873502,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 7125067827,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 12309176101,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13700,
				WaveTime = 1340,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 19847347439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 8443205375,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 14292135100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 8443205375,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 14586373680,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 13750,
				WaveTime = 1345,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 23568725084,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 10026306383,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 16971910431,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 10026306383,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 17321318745,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 13800,
				WaveTime = 1350,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 28046782850,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 11931304596,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 20196573413,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 11931304596,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 20612369307,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					}
				}
			},
			{
				Reward = 13850,
				WaveTime = 1355,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 33445788549,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 14228080731,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 24084413795,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 14228080731,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 24580250399,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					}
				}
			},
			{
				Reward = 13900,
				WaveTime = 1360,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 39967717316,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 17002556474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 28780874485,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 17002556474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 29373399227,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 13950,
				WaveTime = 1365,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 47861341486,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Forsaken XOR",
						Health = 20360561378,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 5
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 34465097196,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 6
					},
					["3"] = {
						Enemy = "Forsaken XOR",
						Health = 20360561378,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Forsaken El Chip",
						Health = 35174645574,
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
						Enemy = "Dreadful Orville",
						Health = "4B",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 6,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1000
							},
							Item_Souls = {
								Amount = 10
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			}
		}
	},
	[10] = {
		StartingCash = 20000,
		Boss = {
			Name = "NOTUSED",
			Spawn = 3
		},
		Rewards = {
			Tokens = {
				Easy = 200,
				Medium = 175,
				Hard = 200,
				Impossible = 225,
				Nightmare = 300
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
						Enemy = "Glitched Entity 02",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 200,
				WaveTime = 20,
				Enemies = {
					["0"] = {
						Enemy = "Glitched Entity 02",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 200,
				WaveTime = 20,
				Enemies = {
					["0"] = {
						Enemy = "Glitched Entity 02",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 200,
				WaveTime = 20,
				Enemies = {
					["0"] = {
						Enemy = "Glitched Entity 02",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 400,
				WaveTime = 40,
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
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 01",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2.5"] = {
						Enemy = "Glitched Entity 03",
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
						Enemy = "Glitched Entity 01",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 01",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 03",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3.5"] = {
						Enemy = "Glitched Entity 01",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 500,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Glitched Entity 03",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 01",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 03",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 550,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Glitched Entity 03",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 01",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 03",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 600,
				WaveTime = 60,
				Enemies = {
					["0"] = {
						Enemy = "Glitched Entity 03",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 01",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 03",
						Amount = 2,
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
						Enemy = "Controlled Prototype Glamrock Freddy",
						Health = "300k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 600,
				WaveTime = 30,
				Enemies = {
					["0"] = {
						Enemy = "Glitched Entity 01",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 03",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 02",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 03",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 650,
				WaveTime = 35,
				Enemies = {
					["0"] = {
						Enemy = "Glitched Entity 01",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 03",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 02",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 03",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 700,
				WaveTime = 40,
				Enemies = {
					["0"] = {
						Enemy = "Glitched Entity 02",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 03",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 01",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 03",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 750,
				WaveTime = 45,
				Enemies = {
					["0"] = {
						Enemy = "Glitched Entity 02",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 03",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 01",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
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
				Reward = 800,
				WaveTime = 50,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
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
				Reward = 850,
				WaveTime = 55,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 900,
				WaveTime = 60,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
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
						Enemy = "Glitched Entity 03",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 950,
				WaveTime = 65,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1000,
				WaveTime = 70,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1050,
				WaveTime = 75,
				Enemies = {
					["0"] = {
						Enemy = "Glitchstained JJ",
						Health = "400k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 20
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
				Reward = 1100,
				WaveTime = 80,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1150,
				WaveTime = 85,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1200,
				WaveTime = 90,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1250,
				WaveTime = 95,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
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
						Enemy = "Glitched Entity 03",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1300,
				WaveTime = 100,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1350,
				WaveTime = 105,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1400,
				WaveTime = 110,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1450,
				WaveTime = 115,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1500,
				WaveTime = 120,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1550,
				WaveTime = 125,
				Enemies = {
					["0"] = {
						Enemy = "Souless Carnie",
						Health = "600k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 20
							},
							Present_ExclusivePack9 = {
								Amount = 2,
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
						Enemy = "Forsaken Mr Hippo",
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1650,
				WaveTime = 135,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1700,
				WaveTime = 140,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1750,
				WaveTime = 145,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 1800,
				WaveTime = 150,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 1850,
				WaveTime = 155,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 3,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 1900,
				WaveTime = 160,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 1950,
				WaveTime = 165,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2000,
				WaveTime = 170,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2050,
				WaveTime = 175,
				Enemies = {
					["0"] = {
						Enemy = "Megabab",
						Health = "900k",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_ExclusivePack9 = {
								Amount = 2,
								Chance = 20
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
						Enemy = "Forsaken Mr Hippo",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2150,
				WaveTime = 185,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 5,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 9,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2200,
				WaveTime = 190,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2250,
				WaveTime = 195,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2300,
				WaveTime = 200,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2350,
				WaveTime = 205,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 6,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2400,
				WaveTime = 210,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2450,
				WaveTime = 215,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2500,
				WaveTime = 220,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2550,
				WaveTime = 225,
				Enemies = {
					["0"] = {
						Enemy = "Error in the Matrix",
						Health = "1.2M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 20
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
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 7,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2650,
				WaveTime = 235,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2700,
				WaveTime = 240,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2750,
				WaveTime = 245,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 2800,
				WaveTime = 250,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 2850,
				WaveTime = 255,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 2900,
				WaveTime = 260,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 2950,
				WaveTime = 265,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 10,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3000,
				WaveTime = 270,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 02",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Glitched Entity 03",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 01",
						Amount = 8,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Amount = 11,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3050,
				WaveTime = 275,
				Enemies = {
					["0"] = {
						Enemy = "Controlled Prototype Glamrock Freddy",
						Health = "1.5M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 3100,
				WaveTime = 280,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 180619,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 72248,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 120413,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 72248,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 144495,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3150,
				WaveTime = 285,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 121999,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 73199,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 121999,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 73199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 146397,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3200,
				WaveTime = 290,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 185374,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 74149,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 123582,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 74149,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 148298,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 125167,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 75101,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 125167,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 75101,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 150199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3300,
				WaveTime = 300,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 190125,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 76050,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 126750,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 76050,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 152100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 3350,
				WaveTime = 305,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 128336,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 77002,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 128336,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 77002,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 154002,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3400,
				WaveTime = 310,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 194879,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 77952,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 129919,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 77952,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 155903,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3450,
				WaveTime = 315,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 131504,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 78904,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 131504,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 78904,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 157804,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3500,
				WaveTime = 320,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 199632,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 79853,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 133088,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 79853,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 159705,
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
						Enemy = "Glitchstained JJ",
						Health = "1.7M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 3600,
				WaveTime = 330,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 228628,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 91579,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 152419,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 91579,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 182839,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 3650,
				WaveTime = 335,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 153368,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 91894,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 153368,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 91894,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 184106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3700,
				WaveTime = 340,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 231479,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 92528,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 154319,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 92528,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 185055,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 155269,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 93162,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 155269,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 93162,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 186323,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 3800,
				WaveTime = 350,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 234332,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 93795,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 156221,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 93795,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 187590,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 3850,
				WaveTime = 355,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 157170,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 94429,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 157170,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 94429,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 188542,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 3900,
				WaveTime = 360,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 237182,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 95063,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 158122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 95063,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 189809,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 3950,
				WaveTime = 365,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 159072,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 95381,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 159072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 95381,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 191077,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4000,
				WaveTime = 370,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 240036,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 96014,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 160024,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 96014,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 192027,
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
						Enemy = "Souless Carnie",
						Health = "2M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 4100,
				WaveTime = 380,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 337474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 112492,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 187590,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 112492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 224982,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4150,
				WaveTime = 385,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 188542,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 113126,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 188542,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 113126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 226249,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4200,
				WaveTime = 390,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 339827,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 113759,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 189492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 113759,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 227517,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 190444,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 114394,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 190444,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 114394,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 228469,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4300,
				WaveTime = 400,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 343551,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 114709,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 191393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 114709,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 229736,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 4350,
				WaveTime = 405,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 192344,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 115343,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 192344,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 115343,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 230685,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 4400,
				WaveTime = 410,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 347286,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 115977,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 193294,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 115977,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 231953,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4450,
				WaveTime = 415,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 194246,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 116610,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 194246,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 116610,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 233220,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4500,
				WaveTime = 420,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 351732,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 117244,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 195195,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 117244,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 234488,
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
						Enemy = "Megabab",
						Health = "2.5M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 4600,
				WaveTime = 430,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 408295,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 136257,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 226883,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 136257,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 272197,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 4650,
				WaveTime = 435,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 227834,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 136574,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 227834,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 136574,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 273464,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4700,
				WaveTime = 440,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 410914,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 137209,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 228784,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 137209,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 274414,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 229736,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 137842,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 229736,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 137842,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 275682,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 4800,
				WaveTime = 450,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 413524,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 138476,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 230685,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 138476,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 276949,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 4850,
				WaveTime = 455,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 231637,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 139109,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 231637,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 139109,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 277901,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 4900,
				WaveTime = 460,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 416969,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 139425,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 232587,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 139425,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 279169,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 233539,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 140059,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 233539,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 140059,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 280118,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 5000,
				WaveTime = 470,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 420177,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 140693,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 234488,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 140693,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 281385,
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
						Enemy = "Error in the Matrix",
						Health = "4M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 2000
							},
							Item_Souls = {
								Amount = 25
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 100
							},
							Present_JJPresent = {
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
				Reward = 5050,
				WaveTime = 475,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 465340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 155113,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 258522,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 155113,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 310227,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 271449,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 162869,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 271449,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 162869,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 325738,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 513037,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 171012,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 285021,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 171012,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 342025,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 299272,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 179564,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 299272,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 179564,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 359126,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 565625,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 188542,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 314236,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 188542,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 377083,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 5300,
				WaveTime = 500,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 329948,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 197969,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 329948,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 197969,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 395937,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 5350,
				WaveTime = 505,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 593906,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 207867,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 346445,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 207867,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 415735,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 363767,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 218261,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 363767,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 218261,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 436522,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 654783,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 229174,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 381956,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 229174,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 04",
						Health = 436522,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 5500,
				WaveTime = 520,
				Enemies = {
					["0"] = {
						Enemy = "Controlled Prototype Glamrock Freddy",
						Health = "6M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 5550,
				WaveTime = 525,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 687522,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 240633,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 401054,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 240633,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 458348,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 421106,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 252665,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 421106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 252665,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 481265,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 757992,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 265298,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 442161,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 265298,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 505328,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 464269,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 278563,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 464269,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 278563,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 530595,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 835687,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 292491,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 487483,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 292491,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 557124,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 5800,
				WaveTime = 550,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 511857,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 307116,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 511857,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 307116,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 584981,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 5850,
				WaveTime = 555,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 877471,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 322472,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 537450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 322472,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 584981,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 564322,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 338595,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 564322,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 338595,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 614229,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 921344,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 355525,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 592539,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 355525,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 614229,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6000,
				WaveTime = 570,
				Enemies = {
					["0"] = {
						Enemy = "Glitchstained JJ",
						Health = "7M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 6050,
				WaveTime = 575,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 967411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 373302,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 622166,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 373302,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 644940,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 6100,
				WaveTime = 580,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 653273,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 391967,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 653273,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 391967,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 677188,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 1066571,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 411564,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 685937,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 411564,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 711047,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 720235,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 432143,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 720235,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 432143,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 746599,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 1175896,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 453751,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 756246,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 453751,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 783930,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 6300,
				WaveTime = 600,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 794058,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 476438,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 794058,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 476438,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 823126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 6350,
				WaveTime = 605,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1234689,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 500261,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 833762,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 500261,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 864283,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 875450,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 525274,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 875450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 525274,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 907498,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 1361247,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 551538,
						Amount = 4,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 919222,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 551538,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 952873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6500,
				WaveTime = 620,
				Enemies = {
					["0"] = {
						Enemy = "Souless Carnie",
						Health = "10M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 6550,
				WaveTime = 625,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1500775,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 579115,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 965184,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 579115,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1000516,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6600,
				WaveTime = 630,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1013442,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 608071,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1013442,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 608071,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1050542,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 1654605,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 638474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1064115,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 638474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1103070,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6700,
				WaveTime = 640,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1117320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 670398,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1117320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 670398,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1158223,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 1824202,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 703918,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1173186,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 703918,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1216134,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 6800,
				WaveTime = 650,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1231846,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 739114,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1231846,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 739114,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1276941,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 6850,
				WaveTime = 655,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1915411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 776069,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1293439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 776069,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1340788,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 6900,
				WaveTime = 660,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1358111,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 814873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1358111,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 814873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1407827,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 2111741,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 855616,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1426017,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 855616,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1478218,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7000,
				WaveTime = 670,
				Enemies = {
					["0"] = {
						Enemy = "Megabab",
						Health = "14M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 7550,
				WaveTime = 725,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3611790,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1393708,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2322831,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1393708,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2407860,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 2438973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1463393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2438973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1463393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2528253,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7650,
				WaveTime = 735,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3982000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1536562,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2560922,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1536562,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2654666,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 2688968,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1613391,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2688968,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1613391,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2787399,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7750,
				WaveTime = 745,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4390155,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1694060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2823417,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1694060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2926769,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 7800,
				WaveTime = 750,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2964588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1778763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2964588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1778763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 3073108,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 7850,
				WaveTime = 755,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4609662,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1867701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3112818,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1867701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 3226763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7900,
				WaveTime = 760,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3268459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1961086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3268459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1961086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 3388100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7950,
				WaveTime = 765,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5082151,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 2059140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3431882,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 2059140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 3557506,
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
						Enemy = "Glitchstained JJ",
						Health = "20M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 2500
							},
							Item_Souls = {
								Amount = 25
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
				Reward = 7550,
				WaveTime = 725,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3611790,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1393708,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2322831,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1393708,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2407860,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 2438973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1463393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2438973,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1463393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2528253,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7650,
				WaveTime = 735,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3982000,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1536562,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2560922,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1536562,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2654666,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 2688968,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1613391,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2688968,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1613391,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2787399,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7750,
				WaveTime = 745,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4390155,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1694060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2823417,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1694060,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2926769,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 7800,
				WaveTime = 750,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2964588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1778763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2964588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1778763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 3073108,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 7850,
				WaveTime = 755,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4609662,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1867701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3112818,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1867701,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 3226763,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 7900,
				WaveTime = 760,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3268459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1961086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3268459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1961086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 3388100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 7950,
				WaveTime = 765,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5082151,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 2059140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3431882,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 2059140,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 3557506,
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
						Enemy = "Controlled Prototype Glamrock Freddy",
						Health = "20M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 8050,
				WaveTime = 775,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5603072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 2162098,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3603475,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 2162098,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 3735381,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 5883226,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 2270202,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3783833,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 2383712,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 3922259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8150,
				WaveTime = 785,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6177387,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 2502897,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3972975,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 2502897,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 4118371,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 4380041,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 2628042,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4380041,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 2628042,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 4540379,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8250,
				WaveTime = 795,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6810597,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 2759444,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4599049,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 2759444,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 4767398,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8300,
				WaveTime = 800,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5129552,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 2897416,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5129552,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 2897416,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 5005768,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8350,
				WaveTime = 805,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7151102,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 3042287,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5380499,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 3042287,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 5256056,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 8400,
				WaveTime = 810,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5634025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 3194402,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5634025,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 3194402,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 5518859,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8450,
				WaveTime = 815,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7884292,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 3354122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5916126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 3354122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 5794702,
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
						Enemy = "Glitchstained JJ",
						Health = "30M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 8550,
				WaveTime = 825,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8278706,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 3521928,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5961933,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 3521928,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 6084437,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8600,
				WaveTime = 830,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8692541,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 3698024,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6260030,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 3698024,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 6388659,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8650,
				WaveTime = 835,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 9127168,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 3882926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6573032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 3882926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 6708092,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8700,
				WaveTime = 840,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 9583526,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 4077072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6901684,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 4077072,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 7043496,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 10062702,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 4280926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7246768,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 4280926,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 7395671,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8800,
				WaveTime = 850,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 10565837,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 4494972,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7609106,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 4494972,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 7765455,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 11094129,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 4719721,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7989461,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 4719721,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 8153728,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8900,
				WaveTime = 860,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 11648836,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 4955707,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8388934,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 4955707,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 8561414,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8950,
				WaveTime = 865,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 12231278,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 5203492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8808381,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 5203492,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 8989485,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Souless Carnie",
						Health = "70M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 9050,
				WaveTime = 875,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 13484986,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 5736850,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 9711240,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 5736850,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 9910908,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 9100,
				WaveTime = 880,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 14159236,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 6023693,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 10196802,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 6023693,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 10406453,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 14867198,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 6324878,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 10706642,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 6324878,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 10926775,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 9200,
				WaveTime = 890,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 15610558,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 6641122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 11241924,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 6641122,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 11473114,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 9250,
				WaveTime = 895,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 16391086,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 6973178,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 11804020,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 6973178,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 12046770,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 9300,
				WaveTime = 900,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 17210641,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 7321837,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 12394221,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 7321837,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 12649109,
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
						Enemy = "Forsaken Mr Hippo",
						Health = 18071173,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 7687929,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 13013932,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 7687929,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 13281564,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 9400,
				WaveTime = 910,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 18974732,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 8072325,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 13664628,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 8072325,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 13945642,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9450,
				WaveTime = 915,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 19923468,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 8475942,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 14347860,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 8475942,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 14642424,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Megabab",
						Health = "75000000",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 9550,
				WaveTime = 925,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 21965624,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 9344726,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 15818016,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 9344726,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 16143273,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 9600,
				WaveTime = 930,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 23063905,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 9811962,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 16608917,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 9811962,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 16950437,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9650,
				WaveTime = 935,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 24217100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 10302160,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 17439363,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 10302160,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 17797959,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 9700,
				WaveTime = 940,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 25427955,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 10817268,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 18311331,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 10817268,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 18687857,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9750,
				WaveTime = 945,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 26699353,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 11358131,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 19226898,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 11358131,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 19622250,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 9800,
				WaveTime = 950,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 28034320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 11926038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 20188243,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 11926038,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 20603362,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 9850,
				WaveTime = 955,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 29436037,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 12522340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 21197655,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 12522340,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 21633529,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 9900,
				WaveTime = 960,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 30907838,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 13148457,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 22257538,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 13148457,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 22715205,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 9950,
				WaveTime = 965,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 32453230,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 13805880,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 23370416,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 13805880,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 23850965,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Error in the Matrix",
						Health = 105000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 2500
							},
							Item_Souls = {
								Amount = 25
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
				Reward = 10050,
				WaveTime = 975,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 35779686,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 15220983,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 25765884,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 15220983,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 26295689,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 10100,
				WaveTime = 980,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 37568670,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 15982032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 27054178,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 15982032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 27610474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10150,
				WaveTime = 985,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 39447104,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 16781134,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 28406437,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 16781134,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 28990997,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 10200,
				WaveTime = 990,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 41419459,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 17620190,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 29826759,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 17620190,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 30440547,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10250,
				WaveTime = 995,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 43490432,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 18501199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 31318197,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 18501199,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 31962574,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 10300,
				WaveTime = 1000,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 45664954,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 19426259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 32884057,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 19426259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 33560700,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10350,
				WaveTime = 1005,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 47948201,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 20397572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 34528260,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 20397572,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 35238735,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 10400,
				WaveTime = 1010,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 50345661,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 21417450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 36254673,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 21417450,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 37000622,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10450,
				WaveTime = 1015,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 52862944,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 22488323,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 38067406,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 22488323,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 38850653,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Controlled Prototype Glamrock Freddy",
						Health = 215000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 10550,
				WaveTime = 1025,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 58281714,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 24793376,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 41969315,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 24793376,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 42832871,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 10600,
				WaveTime = 1030,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 61195800,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 26033045,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 44067281,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 26033045,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 44974514,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10650,
				WaveTime = 1035,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 64255590,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 27334697,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 46270645,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 27334697,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 47223240,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 10700,
				WaveTime = 1040,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 67468370,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 28701532,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 48584177,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 28701532,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 49584402,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10750,
				WaveTime = 1045,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 70841788,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 30136609,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 51013386,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 30136609,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 52063622,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 10800,
				WaveTime = 1050,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 74383877,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 31643439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 53564056,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 31643439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 54666803,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 10850,
				WaveTime = 1055,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 78103071,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 33225611,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 56242259,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 33225611,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 57400144,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 10900,
				WaveTime = 1060,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 82008225,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 34886892,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 59054371,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 34886892,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 60270151,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 10950,
				WaveTime = 1065,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 86108636,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 36631237,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 62007090,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 36631237,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 63283658,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Glitchstained JJ",
						Health = 370000000,
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 11050,
				WaveTime = 1075,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 90629339,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 38554377,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 65262462,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 38554377,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 66606050,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 11100,
				WaveTime = 1080,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 95613953,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 40674868,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 68851897,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 40674868,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 70269383,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 11150,
				WaveTime = 1085,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 101111755,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 43013673,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 72810881,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 43013673,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 74309873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11200,
				WaveTime = 1090,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 107178460,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 45594493,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 77179534,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 45594493,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 78768465,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 11250,
				WaveTime = 1095,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 113877114,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 48444149,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 82003255,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 48444149,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 83691494,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11300,
				WaveTime = 1100,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 121279126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 51593019,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 87333467,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 51593019,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 89131441,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 11350,
				WaveTime = 1105,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 129465467,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 55075548,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 93228476,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 55075548,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 95147813,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 11400,
				WaveTime = 1110,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 138528050,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 58930836,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 99754469,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 58930836,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 101808160,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 11450,
				WaveTime = 1115,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 148571334,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 63203322,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 106986668,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 63203322,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 109189252,
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
						Enemy = "Anomalized Tiger Rock",
						Health = "600M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 15
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 11550,
				WaveTime = 1125,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 160085612,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 68101579,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 115278135,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 68101579,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 117651419,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11600,
				WaveTime = 1130,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 172892461,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 73549705,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 124500386,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 73549705,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 127063533,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 11650,
				WaveTime = 1135,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 187156089,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 79617556,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 134771668,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 79617556,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 137546274,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 11700,
				WaveTime = 1140,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 203064357,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 86385048,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 146227260,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 86385048,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 149237707,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 11750,
				WaveTime = 1145,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 220832488,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 93943740,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 159022145,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 93943740,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 162296006,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11800,
				WaveTime = 1150,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 240707412,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 102398677,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 173334138,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 102398677,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 176902647,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 11850,
				WaveTime = 1155,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 262972848,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 111870555,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 189367546,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 111870555,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 193266142,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 11900,
				WaveTime = 1160,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 287955269,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 122498258,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 207357463,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 122498258,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 211626425,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 11950,
				WaveTime = 1165,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 316030908,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 134441838,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 227574816,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 134441838,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 232260001,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Souless Carnie",
						Health = "700M",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 12050,
				WaveTime = 1175,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 348424076,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 148222126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 250901235,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 148222126,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 256066651,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12100,
				WaveTime = 1180,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 385008604,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 163785449,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 277245865,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 163785449,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 282953649,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 12150,
				WaveTime = 1185,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 426397029,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 181392385,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 307049795,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 181392385,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 313371166,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12200,
				WaveTime = 1190,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 473300702,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 201345547,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 340825272,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 201345547,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 347841994,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 12250,
				WaveTime = 1195,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 526547031,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 223996921,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 379168115,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 223996921,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 386974218,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 12300,
				WaveTime = 1200,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 587099940,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 249756567,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 422772448,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 249756567,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 431476253,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 12350,
				WaveTime = 1205,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 656084183,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 279102964,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 472448211,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 279102964,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 482174713,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12400,
				WaveTime = 1210,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 734814285,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 312595320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 529141996,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 312595320,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 540035679,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 12450,
				WaveTime = 1215,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 824829035,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 350888247,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 593961891,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 350888247,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 606190050,
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
						Enemy = "Error in the Matrix",
						Health = "1.2B",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 2500
							},
							Item_Souls = {
								Amount = 25
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
				Reward = 12550,
				WaveTime = 1225,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 929994737,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 395626498,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 669692032,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 395626498,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 683479281,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 12600,
				WaveTime = 1230,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1050894053,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 447057943,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 756751996,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 447057943,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 772331588,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 12650,
				WaveTime = 1235,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1190137515,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 506293120,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 857021635,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 506293120,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 874665523,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12700,
				WaveTime = 1240,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1350806080,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 574642691,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 972719556,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 574642691,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 992745369,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 12750,
				WaveTime = 1245,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1536541916,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 653656061,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1106468495,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 653656061,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1129247857,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 12800,
				WaveTime = 1250,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1751657784,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 745167910,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1261374084,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 745167910,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1287342557,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 12850,
				WaveTime = 1255,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2001269018,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 851354337,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1441119891,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 851354337,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1470788871,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 12900,
				WaveTime = 1260,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2291453026,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 974800716,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1650082275,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 974800716,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1684053257,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 12950,
				WaveTime = 1265,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2629442347,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1118583822,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 1893469411,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1118583822,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 1932451112,
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
						Enemy = "Megabab",
						Health = "2.2B",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 13050,
				WaveTime = 1275,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3030432305,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1289167855,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2182223496,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1289167855,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2227149907,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13100,
				WaveTime = 1280,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3500149312,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1488988873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2520468138,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1488988873,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2572358143,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 13150,
				WaveTime = 1285,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4051422829,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1723504620,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 2917441870,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1723504620,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 2977504551,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 13200,
				WaveTime = 1290,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4699650482,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 1999265359,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3384232569,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 1999265359,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 3453905279,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 13250,
				WaveTime = 1295,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5463343685,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 2324145980,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 3934170361,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 2324145980,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 4015164887,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13300,
				WaveTime = 1300,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6364795393,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 2707630067,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 4583308471,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 2707630067,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 4677667093,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 13350,
				WaveTime = 1305,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7430898621,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 3161158103,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 5351012640,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 3161158103,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 5461176331,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13400,
				WaveTime = 1310,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8694151387,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 3698554981,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 6260684789,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 3698554981,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 6389576307,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 13450,
				WaveTime = 1315,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 10193892501,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 4336555715,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 7340652915,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 4336555715,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 7491778220,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 8500,
				WaveTime = 820,
				Enemies = {
					["0"] = {
						Enemy = "Controlled Prototype Glamrock Freddy",
						Health = "3.2B",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 1,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
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
				Reward = 13550,
				WaveTime = 1325,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 12003308420,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 5106294354,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 8643618807,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 5106294354,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 8821568854,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13600,
				WaveTime = 1330,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 14163903936,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 6025427338,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 10199470192,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 6025427338,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 10409451248,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 13650,
				WaveTime = 1335,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 16748816404,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 7125067827,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 12060873502,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 7125067827,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 12309176101,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13700,
				WaveTime = 1340,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 19847347439,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 8443205375,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 14292135100,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 8443205375,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 14586373680,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					}
				}
			},
			{
				Reward = 13750,
				WaveTime = 1345,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 23568725084,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 10026306383,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 16971910431,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 10026306383,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 17321318745,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					}
				}
			},
			{
				Reward = 13800,
				WaveTime = 1350,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 28046782850,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 11931304596,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 20196573413,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 11931304596,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 20612369307,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 13850,
				WaveTime = 1355,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 33445788549,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 14228080731,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 24084413795,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 14228080731,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 24580250399,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					}
				}
			},
			{
				Reward = 13900,
				WaveTime = 1360,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 39967717316,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 17002556474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 28780874485,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 17002556474,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 29373399227,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					}
				}
			},
			{
				Reward = 13950,
				WaveTime = 1365,
				Enemies = {
					["0"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 47861341486,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 4
					},
					["1"] = {
						Enemy = "Glitched Entity 04",
						Health = 20360561378,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 2
					},
					["2"] = {
						Enemy = "Forsaken Mr Hippo",
						Health = 34465097196,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 3
					},
					["3"] = {
						Enemy = "Glitched Entity 04",
						Health = 20360561378,
						Amount = 2,
						TimeBetweenSpawns = 0.5,
						Spawn = 1
					},
					["4"] = {
						Enemy = "Glitched Entity 02",
						Health = 35174645574,
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
						Enemy = "Anomalized Tiger Rock",
						Health = "4.2B",
						Amount = 1,
						TimeBetweenSpawns = 0.5,
						Spawn = 4,
						Boss = true,
						Rewards = {
							Tokens = {
								Amount = 1200
							},
							Item_Souls = {
								Amount = 12
							},
							Present_TitanicPresent = {
								Amount = 1,
								Chance = 15
							},
							Present_ExclusivePack9 = {
								Amount = 1,
								Chance = 15
							}
						}
					}
				}
			}
		}
	}
}