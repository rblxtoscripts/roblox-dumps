-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))
local tbl = {
	FirstTrack = {
		Missions = {
			{
				Reward = {
					Name = "PastrequineBasicSaddle",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 3,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					}
				}
			},
			{
				Reward = {
					Name = "PastrequineBasicSocks",
					Amount = 1
				},
				Missions = {
					{
						Type = "StatLevelUp",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "Hearts"
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
							Name = "Hearts"
						}
					}
				}
			},
			{
				Reward = {
					Name = "PastrequineBasicBridle",
					Amount = 1
				},
				Missions = {
					{
						Type = "Foal",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 6,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					}
				}
			},
			{
				Reward = {
					Name = "StrawberryCake",
					Amount = 1
				},
				Missions = {
					{
						Type = "HarvestNode",
						Amount = 20,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 10,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					}
				}
			},
			{
				Reward = {
					Species = "Pastrequine",
					Preset = { "PastryChocRas", "PastryMint", "PastryBrown", "PastryCotton", "PastryOrange", "PastryMatcha" }
				},
				RunOnComplete = function(p1) --[[ RunOnComplete | Line: 126 ]]
					local Pastrequine = p1.PlayerData.ExtraSpeciesUnlocks:FindFirstChild("Pastrequine")
					if not Pastrequine then
						return
					end
					Pastrequine.Value = true
				end,
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 1,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "GetItem",
						Amount = 250,
						Description = "Earn %s Hearts",
						Check = function(p1) --[[ Check | Line: 144 ]]
							return p1 == "Hearts"
						end,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "Tame",
						Amount = 25,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					}
				}
			},
			{
				MaxStock = 15000,
				StockId = "LimitedPastrequine",
				Reward = {
					Title = "Exclusive Pastrequine",
					ExclusiveStockTag = true,
					Species = "Pastrequine",
					Infertile = true,
					Preset = { "PastryPurple" },
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
					Name = "StrawberryCake",
					Amount = 1,
					Theme = { "Opal", "Thunder", "Galaxy", "Obsidian", "Nature", "Cookie", "Clover" }
				},
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 1,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "GetItem",
						Amount = 500,
						Description = "Earn %s Hearts",
						Check = function(p1) --[[ Check | Line: 224 ]]
							return p1 == "Hearts"
						end,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "Tame",
						Amount = 25,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					}
				}
			},
			{
				Reward = {
					Name = "PastrequineBreedingLicense",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 20,
						Description = "Tame %s Pastrequines",
						Check = function(p1) --[[ Check | Line: 254 ]]
							if p1 == "Pastrequine" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "BuyStable",
						Description = "Buy %s Pastrequines from the Love Stables",
						Amount = 5,
						Check = function(p1) --[[ Check | Line: 267 ]]
							return p1 == "Event"
						end,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					}
				}
			},
			{
				Reward = {
					Name = "SweetWingPotion",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 5,
						Description = "Tame %s Pastrequines",
						Check = function(p1) --[[ Check | Line: 288 ]]
							if p1 == "Pastrequine" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 10,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "BuyItem",
						Description = "Purchase %s item from the Event Gacha Shop",
						Amount = 1,
						Check = function(p1) --[[ Check | Line: 310 ]]
							return p1 == "EventGachaMachine"
						end,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					}
				}
			},
			{
				Reward = {
					Name = "LoveMutationPotion",
					Amount = 1
				},
				Missions = {
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 10,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "BuyStable",
						Description = "Buy %s Pastrequines",
						Amount = 5,
						Check = function(p1) --[[ Check | Line: 340 ]]
							return p1 == "Event"
						end,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete the Rose Maze Minigame %s times",
						Amount = 3,
						Check = function(p1) --[[ Check | Line: 352 ]]
							return p1 == "Maze"
						end,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					}
				}
			},
			{
				MaxStock = 20000,
				StockId = "LimitedPastrequine-2",
				Reward = {
					Title = "Exclusive Pastrequine",
					ExclusiveStockTag = true,
					Species = "Pastrequine",
					Infertile = true,
					Preset = { "PastrySakura" },
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
					Name = "ValentinesPicnicBasket",
					Amount = 1,
					Theme = { "Random", "Opal", "Thunder", "Galaxy", "Obsidian", "Nature", "Cookie", "Clover" }
				},
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 1,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 20,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					},
					{
						Type = "Tame",
						Amount = 20,
						Description = "Tame %s Pastrequines",
						Check = function(p1) --[[ Check | Line: 432 ]]
							if p1 == "Pastrequine" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "Hearts"
						}
					}
				}
			}
		}
	},
	SecondTrack = {
		CheckUnlocked = function() --[[ CheckUnlocked | Line: 448 ]] end,
		Missions = {}
	}
}
for k, v in pairs(tbl) do
	for k2, v2 in pairs(v.Missions) do
		v2.DisplayName = k2
		v2.Index = k2
		v2.Track = k
	end
end
return {
	Tracks = tbl
}