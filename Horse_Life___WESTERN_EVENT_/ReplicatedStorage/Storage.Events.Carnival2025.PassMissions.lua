-- https://lua.expert/
return {
	Preset1 = {
		Bonus = false,
		MissionName = "Get Carousels",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame %s Carousel",
				Amount = 10,
				Check = function(p1) --[[ Check | Line: 6 ]]
					return p1 == "Carousel"
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Type = "BuyStable",
				Description = "Buy %s Carousels from the Carnival Stables",
				Amount = 5,
				Check = function(p1) --[[ Check | Line: 23 ]]
					return p1 == "Event"
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset2 = {
		Bonus = false,
		MissionName = "Play Minigames",
		Missions = {
			Mission1 = {
				Type = "CompleteEventMinigame",
				Description = "Play %s Bowling",
				Amount = 10,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				},
				Check = function(p1) --[[ Check | Line: 58 ]]
					return p1 == "BowlingMinigame"
				end
			},
			Mission2 = {
				Type = "CompleteEventMinigame",
				Description = "Play %s Popcorn Catch",
				Amount = 10,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				},
				Check = function(p1) --[[ Check | Line: 73 ]]
					return p1 == "PopcornMinigame"
				end
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset3 = {
		Bonus = false,
		MissionName = "Circus Races",
		Missions = {
			Mission1 = {
				Type = "CompleteEventMinigame",
				Description = "Complete the circus show %s times",
				Amount = 10,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				},
				Check = function(p1) --[[ Check | Line: 104 ]]
					return p1 == "CircusShow"
				end
			},
			Mission2 = {
				Type = "CompleteEventMinigame",
				Amount = 10,
				Description = "Complete the carnival trail %s times",
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				},
				Check = function(p1) --[[ Check | Line: 119 ]]
					return p1 == "EventRace"
				end
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset4 = {
		Bonus = false,
		MissionName = "Earn Tickets",
		Missions = {
			Mission1 = {
				Type = "GetItem",
				Amount = 2500,
				Description = "Earn %s Tickets",
				Check = function(p1) --[[ Check | Line: 143 ]]
					return p1 == "Tickets"
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Type = "CompleteEventMinigame",
				Description = "Play any %s Minigames",
				Amount = 20,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset13 = {
		Bonus = false,
		MissionName = "More Carousels",
		Missions = {
			Mission1 = {
				Type = "CompleteEventMinigame",
				Description = "Wish %s times from Fountain",
				Amount = 3,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				},
				Check = function(p1) --[[ Check | Line: 193 ]]
					return p1 == "WishingWell"
				end
			},
			Mission2 = {
				Type = "Sell",
				Description = "Sell %s Carousels",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 201 ]]
					warn(p1)
					return p1 == "Carousel"
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset6 = {
		Bonus = false,
		MissionName = "Explore & Harvest",
		Missions = {
			Mission1 = {
				Type = "InteractWorldLore",
				Amount = 5,
				Description = "Interact with world lore %s times",
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Type = "HarvestNode",
				Description = "Harvest %s Times",
				Amount = 20,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset7 = {
		Bonus = false,
		MissionName = "Jump and Foal",
		Missions = {
			Mission1 = {
				Type = "JumpObstacle",
				Description = "Jump %s obstacles",
				Amount = 20,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Type = "Breed",
				Description = "Breed %s Horses",
				Amount = 15,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset8 = {
		Bonus = false,
		MissionName = "Bond & Level",
		Missions = {
			Mission1 = {
				Type = "StatLevelUp",
				Description = "Level any skills, %s Times",
				Amount = 20,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Type = "StatLevelUp",
				Description = "Level bond %s Times",
				Amount = 10,
				Check = function(p1, p2) --[[ Check | Line: 324 ]]
					if p1 == "Bond" then
						return true
					end
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset9 = {
		Bonus = false,
		MissionName = "Catch & Foal",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame %s of any horse",
				Amount = 50,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Type = "Foal",
				Description = "Foal %s of any horse",
				Amount = 25,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset14 = {
		Bonus = false,
		MissionName = "Find Rare Horses",
		Missions = {
			Mission1 = {
				Type = "TameWings",
				Description = "Tame %s of any horse with wings",
				Amount = 2,
				Check = function() --[[ Check | Line: 396 ]]
					return true
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Type = "Tame",
				Description = "Tame 5 horses with a Mutation",
				Amount = 5,
				Check = function(p1, p2) --[[ Check | Line: 412 ]]
					if not p2 then
						return
					end
					local count = 0
					for v1, v2 in p2.Mutations:GetChildren() do
						if v2.Value ~= "Nothing" then
							count = count + 1
						end
					end
					return count >= 1
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset11 = {
		Bonus = false,
		MissionName = "Care for Carousels",
		Missions = {
			Mission1 = {
				Type = "GrowMax",
				Description = "Grow %s Carousels",
				Amount = 10,
				Check = function(p1) --[[ Check | Line: 452 ]]
					return p1 == "Carousel"
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Type = "Foal",
				Description = "Foal %s Horse",
				Amount = 50,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset12 = {
		Bonus = false,
		MissionName = "Horse Training",
		Missions = {
			Mission1 = {
				Description = "Level agility %s Times",
				Type = "StatLevelUp",
				Amount = 10,
				Check = function(p1, p2) --[[ Check | Line: 495 ]]
					if p1 == "Agility" then
						return true
					end
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Description = "Level jump %s Times",
				Type = "StatLevelUp",
				Amount = 10,
				Check = function(p1, p2) --[[ Check | Line: 511 ]]
					if p1 == "Jump" then
						return true
					end
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 25,
				Name = "Tickets"
			}
		}
	},
	Preset5 = {
		Bonus = true,
		PointsNeeded = 5,
		MissionName = "Enjoy the Carnival Event",
		Missions = {
			Mission1 = {
				Type = "Sell",
				Description = "Sell %s Carousels",
				Amount = 3,
				Check = function(p1) --[[ Check | Line: 544 ]]
					warn(p1)
					return p1 == "Carousel"
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Type = "Foal",
				Description = "Foal %s Carousel",
				Amount = 50,
				Check = function(p1) --[[ Check | Line: 559 ]]
					return p1 == "Carousel"
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 5,
				Name = "SillyLasso"
			}
		}
	},
	Preset10 = {
		Bonus = true,
		PointsNeeded = 8,
		MissionName = "Spend & Find a Carnival Horse",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame %s Carousel",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 591 ]]
					return p1 == "Carousel"
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Type = "Foal",
				Description = "Foal %s Carousel",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 606 ]]
					return p1 == "Carousel"
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 5,
				Name = "SillyLasso"
			}
		}
	},
	Preset15 = {
		Bonus = true,
		PointsNeeded = 10,
		MissionName = "Carnival Missions & Dye",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame %s Carousel",
				Amount = 50,
				Check = function(p1) --[[ Check | Line: 637 ]]
					return p1 == "Carousel"
				end,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			},
			Mission2 = {
				Type = "DyeEquipment",
				Description = "Dye %s accessories",
				Amount = 10,
				Rewards = {
					{
						Amount = 25,
						Name = "Tickets"
					}
				}
			}
		},
		Rewards = {
			{
				Amount = 5,
				Name = "SillyLasso"
			}
		}
	}
}