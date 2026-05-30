-- https://lua.expert/
return {
	Nights = {
		{
			StartingCash = 3000,
			Boss = {
				Name = "NOT USED",
				Health = "75000"
			},
			Rewards = {
				NoPresents = "DontShow",
				Tokens = {
					Easy = 200,
					Medium = 200,
					Hard = 200,
					Impossible = 200,
					Nightmare = 200
				},
				Present_PVPPresent1 = {
					Chance = 10,
					Amount = 1
				},
				Item_Souls = {
					Chance = 100,
					Amount = 8
				}
			},
			Waves = {
				{
					Reward = 150,
					WaveTime = 20,
					Enemies = {
						["0"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["2"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["4"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						}
					}
				},
				{
					Reward = 150,
					WaveTime = 25,
					Enemies = {
						["0"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["1.5"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["3"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["4.5"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						}
					}
				},
				{
					Reward = 150,
					WaveTime = 25,
					Enemies = {
						["0"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["2"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["4"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						}
					}
				},
				{
					Reward = 200,
					WaveTime = 25,
					Enemies = {
						["0"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["1.5"] = {
							Enemy = "Chica",
							Health = "2400",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["3"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 30,
					Enemies = {
						["0"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["1"] = {
							Enemy = "Chica",
							Health = "2400",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["2.5"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["3.5"] = {
							Enemy = "Chica",
							Health = "2400",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 30,
					Enemies = {
						["0"] = {
							Enemy = "Chica",
							Health = "2400",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["1.5"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["3"] = {
							Enemy = "Chica",
							Health = "2400",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["4.5"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 35,
					Enemies = {
						["0"] = {
							Enemy = "Chica",
							Health = "2400",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["1"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["2.5"] = {
							Enemy = "Foxy",
							Health = "3750",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["4"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 35,
					Enemies = {
						["0"] = {
							Enemy = "Foxy",
							Health = "3750",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["1.5"] = {
							Enemy = "Chica",
							Health = "2400",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["3"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["4"] = {
							Enemy = "Foxy",
							Health = "3750",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 35,
					Enemies = {
						["0"] = {
							Enemy = "Foxy",
							Health = "3750",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["1.5"] = {
							Enemy = "Chica",
							Health = "2400",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["3"] = {
							Enemy = "Bonnie",
							Health = "1200",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["4.5"] = {
							Enemy = "Chica",
							Health = "2400",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 40,
					Enemies = {
						["0"] = {
							Enemy = "Foxy",
							Health = "3750",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["1"] = {
							Enemy = "Chica",
							Health = "2400",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["2.5"] = {
							Enemy = "Mangle",
							Health = "6000",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						},
						["4"] = {
							Enemy = "Foxy",
							Health = "3750",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 40,
					Enemies = {
						["0"] = {
							Enemy = "Foxy",
							Health = "7500",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["1.5"] = {
							Enemy = "Chica",
							Health = "4800",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						},
						["3"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "14400",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						},
						["4.5"] = {
							Enemy = "Foxy",
							Health = "7500",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 45,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "12000",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						},
						["2"] = {
							Enemy = "Foxy",
							Health = "7500",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["4"] = {
							Enemy = "Chica",
							Health = "4800",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 45,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "12000",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						},
						["2"] = {
							Enemy = "Foxy",
							Health = "7500",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["4"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "14400",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 50,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "12000",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						},
						["2"] = {
							Enemy = "Foxy",
							Health = "7500",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["4"] = {
							Enemy = "Chica",
							Health = "4800",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 50,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "12000",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						},
						["2"] = {
							Enemy = "Foxy",
							Health = "7500",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["4"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "14400",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 55,
					Enemies = {
						["0"] = {
							Enemy = "Foxy",
							Health = "7500",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "12000",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						},
						["4"] = {
							Enemy = "Chica",
							Health = "4800",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 6
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 55,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "14400",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						},
						["2"] = {
							Enemy = "Foxy",
							Health = "7500",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "12000",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 65,
					Enemies = {
						["4"] = {
							Enemy = "Mangle",
							Health = "12000",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 65,
					Enemies = {
						["4"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "14400",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 65,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "12000",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						},
						["2"] = {
							Enemy = "Foxy",
							Health = "7500",
							Amount = 6,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "12000",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 8
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 60,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "15000",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 9
						},
						["2"] = {
							Enemy = "Foxy",
							Health = "9375",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 11
						},
						["4"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "36000",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 13
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 70,
					Enemies = {
						["0"] = {
							Enemy = "Freddy",
							Health = "37500",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 14
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "18750",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["4"] = {
							Enemy = "Foxy",
							Health = "11719",
							Amount = 6,
							TimeBetweenSpawns = 0.5,
							Speed = 12
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 70,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "56250",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 15
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "23438",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 11
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "46875",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 15
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 75,
					Enemies = {
						["0"] = {
							Enemy = "Freddy",
							Health = "58594",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 17
						},
						["2"] = {
							Enemy = "Foxy",
							Health = "14648",
							Amount = 7,
							TimeBetweenSpawns = 0.5,
							Speed = 12
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "29297",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 12
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 75,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "87890",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 19
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "36621",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 13
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "73242",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 19
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 80,
					Enemies = {
						["0"] = {
							Enemy = "Freddy",
							Health = "91553",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 21
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "45776",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 14
						},
						["4"] = {
							Enemy = "Foxy",
							Health = "18310",
							Amount = 8,
							TimeBetweenSpawns = 0.5,
							Speed = 13
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 80,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "137329",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 23
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "57220",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 15
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "114441",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 23
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 85,
					Enemies = {
						["0"] = {
							Enemy = "Freddy",
							Health = "143051",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 25
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "71526",
							Amount = 6,
							TimeBetweenSpawns = 0.5,
							Speed = 17
						},
						["4"] = {
							Enemy = "Foxy",
							Health = "22888",
							Amount = 8,
							TimeBetweenSpawns = 0.5,
							Speed = 14
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 85,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "214577",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 28
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "89407",
							Amount = 6,
							TimeBetweenSpawns = 0.5,
							Speed = 19
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "178814",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 28
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 90,
					Enemies = {
						["0"] = {
							Enemy = "Freddy",
							Health = "279396",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 12
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "139699",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 10
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "279396",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 12
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 90,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "419094",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 9
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "174623",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 12
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "349245",
							Amount = 1,
							TimeBetweenSpawns = 0.5,
							Speed = 14
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 90,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "218279",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 14
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "436556",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 16
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "218279",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 14
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 95,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "654834",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 11
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "272848",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 16
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "545695",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 18
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 95,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "341060",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 18
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "682119",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 21
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "341060",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 18
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 100,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "1023179",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 15
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "426325",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 21
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "852649",
							Amount = 2,
							TimeBetweenSpawns = 0.5,
							Speed = 24
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 100,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "532906",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 24
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "1065811",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 28
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "532906",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 24
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 105,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "1598716",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 15
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "666133",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 28
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "1332264",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 32
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 105,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "832665",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 32
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "1665330",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 37
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "832665",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 32
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 110,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "2497995",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 15
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "1040831",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 37
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "2081663",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 43
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 110,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "2997995",
							Amount = 3,
							TimeBetweenSpawns = 3,
							Speed = 15
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "1301039",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 43
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "2602078",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 49
						},
						["6"] = {
							Enemy = "Mangle",
							Health = "1301039",
							Amount = 4,
							TimeBetweenSpawns = 1,
							Speed = 43
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 110,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "3747494",
							Amount = 3,
							TimeBetweenSpawns = 3,
							Speed = 22
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "1626299",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 45
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "3252598",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 51
						},
						["6"] = {
							Enemy = "Mangle",
							Health = "1626299",
							Amount = 4,
							TimeBetweenSpawns = 1,
							Speed = 45
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 115,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "2032874",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 47
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "4065748",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 53
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "2032874",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 47
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 115,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "5848677",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 22
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "2541093",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 49
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "5082185",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 55
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 120,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "3176366",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 51
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "6352731",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 57
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "3176366",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 51
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 120,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "9132333",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 22
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "3970458",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 53
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "7940914",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 59
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 125,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "4963073",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 55
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "9926143",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 61
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "4963073",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 55
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 125,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "14269646",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 22
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "6203841",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 57
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "12407679",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 63
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 130,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "7754801",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 59
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "15509599",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 65
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "7754801",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 59
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 130,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "22296447",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 22
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "9693501",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 61
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "19387499",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 67
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 135,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "27870559",
							Amount = 3,
							TimeBetweenSpawns = 3,
							Speed = 22
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "12116876",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 63
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "24234374",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 69
						},
						["6"] = {
							Enemy = "Mangle",
							Health = "12116876",
							Amount = 4,
							TimeBetweenSpawns = 1,
							Speed = 63
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 135,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "15146095",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 65
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "30292968",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 71
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "15146095",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 65
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 140,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "43547074",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 22
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "18932619",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 67
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "37866210",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 73
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 140,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "23665774",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 69
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "47332763",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 75
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "23665774",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 69
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 145,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "68042178",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 44
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "29582218",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 71
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "59165954",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 77
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 145,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "36977773",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 73
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "73957443",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 79
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "36977773",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 73
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 150,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "106315903",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 46
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "46222216",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 75
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "92446804",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 81
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 150,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "57777770",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 77
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "115558505",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 83
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "57777770",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 77
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 155,
					Enemies = {
						["0"] = {
							Enemy = "Ultimatum",
							Large = true,
							Health = "166118598",
							Amount = 2,
							TimeBetweenSpawns = 1.5,
							Speed = 48
						},
						["2"] = {
							Enemy = "Mangle",
							Health = "72222213",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 79
						},
						["4"] = {
							Enemy = "Freddy",
							Health = "144448131",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 85
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 155,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "90277766",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 81
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "180560164",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 87
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "90277766",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 81
						}
					}
				},
				{
					Reward = 400,
					WaveTime = 155,
					Enemies = {
						["0"] = {
							Enemy = "Mangle",
							Health = "90277766",
							Amount = 5,
							TimeBetweenSpawns = 0.5,
							Speed = 81
						},
						["2"] = {
							Enemy = "Freddy",
							Health = "180560164",
							Amount = 3,
							TimeBetweenSpawns = 0.5,
							Speed = 87
						},
						["4"] = {
							Enemy = "Mangle",
							Health = "90277766",
							Amount = 4,
							TimeBetweenSpawns = 0.5,
							Speed = 81
						}
					}
				}
			}
		}
	}
}