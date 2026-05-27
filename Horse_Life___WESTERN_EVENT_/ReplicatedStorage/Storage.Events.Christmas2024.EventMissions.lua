-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))
local tbl = {
	FirstTrack = {
		Missions = {
			{
				Title = "Alces Saddle",
				Reward = {
					Name = "AlcesBasicSaddle",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 3,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					}
				}
			},
			{
				Title = "Alces Socks",
				Reward = {
					Name = "AlcesBasicSocks",
					Amount = 1
				},
				Missions = {
					{
						Type = "StatLevelUp",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "BuyItem",
						Description = "Purchase %s items from the Event Shop",
						Amount = 2,
						Check = function(p1) --[[ Check | Line: 57 ]]
							return p1 == "EventShop"
						end,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					}
				}
			},
			{
				Title = "Alces Bridle",
				Reward = {
					Name = "AlcesBasicBridle",
					Amount = 1
				},
				Missions = {
					{
						Type = "Foal",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 6,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					}
				}
			},
			{
				Reward = {
					Name = "FrostbittenAxe",
					Amount = 1,
					Theme = { "Frozen", "Candycane" }
				},
				Missions = {
					{
						Type = "HarvestNode",
						Amount = 20,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 10,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					}
				}
			},
			{
				Reward = {
					Species = "Alces",
					Preset = { "AlcesTan", "AlcesCream", "AlcesWhite", "AlcesBlack", "AlcesIce" }
				},
				RunOnComplete = function(p1) --[[ RunOnComplete | Line: 127 ]]
					local Alces = p1.PlayerData.ExtraSpeciesUnlocks:FindFirstChild("Alces")
					if not Alces then
						return
					end
					Alces.Value = true
				end,
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 1,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "GetItem",
						Amount = 250,
						Description = "Earn %s Stars",
						Check = function(p1) --[[ Check | Line: 145 ]]
							return p1 == "Stars"
						end,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "Tame",
						Amount = 25,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					}
				}
			},
			{
				MaxStock = 15000,
				StockId = "LimitedAlces",
				Reward = {
					Title = "Exclusive Alces",
					ExclusiveStockTag = true,
					Species = "Alces",
					Infertile = true,
					Preset = { "AlcesFestive" },
					MutationChances = {
						Wings = 100,
						Glow = 0
					},
					MutationSlotChances = {
						{
							Amount = 0,
							P = 0
						},
						{
							Amount = 1,
							P = 0.75
						},
						{
							Amount = 2,
							P = 0.5
						},
						{
							Amount = 3,
							P = 0.25
						}
					},
					MutationsToGuarantee = {
						TornDragonWings = 100
					},
					MaxCosmetics = {
						MaxPatternsPerSlot = 4,
						MaxPaintsPerSlot = 2,
						MaxCosmeticsPerSlot = 4,
						AlwaysMax = true
					}
				},
				OutOfStockReward = {
					Name = "FrostbittenAxe",
					Amount = 1,
					Theme = { "Opal", "Thunder", "Galaxy", "Obsidian", "Nature", "Cookie", "Clover" }
				},
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 1,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "GetItem",
						Amount = 500,
						Description = "Earn %s Stars",
						Check = function(p1) --[[ Check | Line: 225 ]]
							return p1 == "Stars"
						end,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "Tame",
						Amount = 25,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					}
				}
			},
			{
				Reward = {
					Name = "AlcesBreedingLicense",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 20,
						Description = "Tame %s Alces",
						Check = function(p1) --[[ Check | Line: 255 ]]
							if p1 == "Alces" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "BuyStable",
						Description = "Buy %s Alces from the Snowy Stables",
						Amount = 5,
						Check = function(p1) --[[ Check | Line: 268 ]]
							return p1 == "Event"
						end,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					}
				}
			},
			{
				Reward = {
					Name = "FrozenWingPotion",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 5,
						Description = "Tame %s Alces",
						Check = function(p1) --[[ Check | Line: 289 ]]
							if p1 == "Alces" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 10,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "BuyItem",
						Description = "Purchase %s item from the Event Gacha Shop",
						Amount = 1,
						Check = function(p1) --[[ Check | Line: 311 ]]
							return p1 == "EventGachaMachine"
						end,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					}
				}
			},
			{
				Reward = {
					Name = "HornGrowthPotion",
					Amount = 1
				},
				Missions = {
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 10,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "BuyStable",
						Description = "Buy %s Alces",
						Amount = 5,
						Check = function(p1) --[[ Check | Line: 341 ]]
							return p1 == "Event"
						end,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete the Ice Maze Minigame %s times",
						Amount = 3,
						Check = function(p1) --[[ Check | Line: 353 ]]
							return p1 == "Maze"
						end,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					}
				}
			},
			{
				MaxStock = 20000,
				StockId = "LimitedAlces-2",
				Reward = {
					Title = "Exclusive Alces",
					ExclusiveStockTag = true,
					Species = "Alces",
					Infertile = true,
					Preset = { "AuroraBorealis" },
					MutationChances = {
						Wings = 100,
						Glow = 0
					},
					MutationSlotChances = {
						{
							Amount = 0,
							P = 0
						},
						{
							Amount = 1,
							P = 0.75
						},
						{
							Amount = 2,
							P = 0.5
						},
						{
							Amount = 3,
							P = 0.25
						}
					},
					MutationsToGuarantee = {},
					MaxCosmetics = {
						MaxPatternsPerSlot = 4,
						MaxPaintsPerSlot = 2,
						MaxCosmeticsPerSlot = 4,
						AlwaysMax = true
					}
				},
				OutOfStockReward = {
					Name = "SnowLeopardPlush",
					Theme = "Random",
					Amount = 1
				},
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 1,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 20,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					},
					{
						Type = "Tame",
						Amount = 20,
						Description = "Tame %s Alces",
						Check = function(p1) --[[ Check | Line: 433 ]]
							if p1 == "Alces" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "Stars"
						}
					}
				}
			}
		}
	},
	SecondTrack = {
		CheckUnlocked = function() --[[ CheckUnlocked | Line: 449 ]] end,
		Missions = {}
	}
}
for k, v in pairs(tbl) do
	for k2, v2 in pairs(v.Missions) do
		v2.Index = k2
		v2.Track = k
	end
end
return {
	Tracks = tbl
}