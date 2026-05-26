-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))
local tbl = {
	Ghoulsteed = {
		Missions = {
			{
				Title = "Ghoul Saddle",
				Reward = {
					Name = "GhoulsteedBasicSaddle",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 3,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					}
				}
			},
			{
				Title = "Ghoul Socks",
				Reward = {
					Name = "GhoulsteedBasicSocks",
					Amount = 1
				},
				Missions = {
					{
						Type = "StatLevelUp",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "Souls"
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
							Name = "Souls"
						}
					}
				}
			},
			{
				Title = "Ghoul Bridle",
				Reward = {
					Name = "GhoulsteedBasicBridle",
					Amount = 1
				},
				Missions = {
					{
						Type = "Foal",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 6,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					}
				}
			},
			{
				Reward = {
					Name = "MedievalLance",
					Amount = 1
				},
				Missions = {
					{
						Type = "HarvestNode",
						Amount = 20,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 10,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					}
				}
			},
			{
				Reward = {
					Species = "Ghoulsteed",
					Preset = { "GhoulStone", "GhoulSwamp", "GhoulSpectral", "GhoulHell", "GhoulPumpkin", "GhoulVampire", "GhoulBat", "GhoulWere" }
				},
				RunOnComplete = function(p1) --[[ RunOnComplete | Line: 126 ]]
					local Ghoulsteed = p1.PlayerData.ExtraSpeciesUnlocks:FindFirstChild("Ghoulsteed")
					if not Ghoulsteed then
						return
					end
					Ghoulsteed.Value = true
				end,
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 1,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "GetItem",
						Amount = 250,
						Description = "Earn %s Souls",
						Check = function(p1) --[[ Check | Line: 144 ]]
							return p1 == "Souls"
						end,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "Tame",
						Amount = 25,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					}
				}
			},
			{
				MaxStock = 10000,
				StockId = "LimitedGhoulsteed",
				Reward = {
					Title = "Exclusive Ghoulsteed",
					ExclusiveStockTag = true,
					Species = "Ghoulsteed",
					Preset = { "Beetlejuice" },
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
					Name = "VampiricCrown",
					Amount = 1
				},
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 1,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "GetItem",
						Amount = 500,
						Description = "Earn %s Souls",
						Check = function(p1) --[[ Check | Line: 222 ]]
							return p1 == "Souls"
						end,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "Tame",
						Amount = 25,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					}
				}
			},
			{
				Reward = {
					Name = "GhoulsteedBreedingLicense",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 20,
						Description = "Tame %s Ghoulsteeds",
						Check = function(p1) --[[ Check | Line: 252 ]]
							if p1 == "Ghoulsteed" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "BuyStable",
						Description = "Buy %s Ghoulsteeds from the Spooky Stables",
						Amount = 5,
						Check = function(p1) --[[ Check | Line: 265 ]]
							return p1 == "Event"
						end,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					}
				}
			},
			{
				Reward = {
					Name = "SpookyWingPotion",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 5,
						Description = "Tame %s Ghoulsteeds",
						Check = function(p1) --[[ Check | Line: 286 ]]
							if p1 == "Ghoulsteed" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 10,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "BuyItem",
						Description = "Purchase %s item from the Event Gacha Shop",
						Amount = 1,
						Check = function(p1) --[[ Check | Line: 308 ]]
							return p1 == "EventGachaMachine"
						end,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					}
				}
			},
			{
				Reward = {
					Name = "HauntedMutationPotion",
					Amount = 1
				},
				Missions = {
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 10,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "BuyStable",
						Description = "Buy %s Ghoulsteeds from the Spooky Stables",
						Amount = 5,
						Check = function(p1) --[[ Check | Line: 338 ]]
							return p1 == "Event"
						end,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete the Corn Maze Minigame %s times",
						Amount = 3,
						Check = function(p1) --[[ Check | Line: 350 ]]
							return p1 == "Maze"
						end,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					}
				}
			},
			{
				MaxStock = 20000,
				StockId = "LimitedGhoulsteed-2",
				Reward = {
					Title = "Exclusive Ghoulsteed",
					ExclusiveStockTag = true,
					Species = "Ghoulsteed",
					Infertile = true,
					Preset = { "Halloween" },
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
					Name = "CrowsCrown",
					Theme = "Random",
					Amount = 1
				},
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 3,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 20,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					},
					{
						Type = "Tame",
						Amount = 10,
						Description = "Tame %s Ghoulsteeds",
						Check = function(p1) --[[ Check | Line: 430 ]]
							if p1 == "Ghoulsteed" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "Souls"
						}
					}
				}
			}
		}
	},
	SecondTrack = {
		CheckUnlocked = function() --[[ CheckUnlocked | Line: 446 ]] end,
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