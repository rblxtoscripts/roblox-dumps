-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))
local tbl = {
	FirstTrack = {
		Missions = {
			{
				Title = "Wolper Saddle",
				Reward = {
					Name = "WolperBasicSaddle",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 3,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					}
				}
			},
			{
				Title = "Wolper Socks",
				Reward = {
					Name = "WolperBasicSocks",
					Amount = 1
				},
				Missions = {
					{
						Type = "StatLevelUp",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
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
							Name = "GoldEggs"
						}
					}
				}
			},
			{
				Title = "Wolper Bridle",
				Reward = {
					Name = "WolperBasicBridle",
					Amount = 1
				},
				Missions = {
					{
						Type = "Foal",
						Amount = 5,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 6,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					}
				}
			},
			{
				Reward = {
					Name = "CarrotLance",
					Amount = 1,
					Theme = { "Dyed", "Tulip" }
				},
				Missions = {
					{
						Type = "HarvestNode",
						Amount = 20,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 10,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					}
				}
			},
			{
				Reward = {
					Species = "Wolper",
					Age = 100,
					Preset = {
						"White",
						"Blonde",
						"RedBrown",
						"Brown",
						"LightBrown",
						"DarkBrown",
						"Arabian",
						"BrownBlonde",
						"PeryWTan",
						"PeryCBrown",
						"PeryWBrown",
						"PeryWBrown"
					}
				},
				RunOnComplete = function(p1) --[[ RunOnComplete | Line: 128 ]]
					local Wolper = p1.PlayerData.ExtraSpeciesUnlocks:FindFirstChild("Wolper")
					if not Wolper then
						return
					end
					Wolper.Value = true
				end,
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 1,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "GetItem",
						Amount = 250,
						Description = "Earn %s Gold Eggs",
						Check = function(p1) --[[ Check | Line: 146 ]]
							return p1 == "GoldEggs"
						end,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "Tame",
						Amount = 25,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					}
				}
			},
			{
				MaxStock = 15000,
				StockId = "LimitedWolper",
				Reward = {
					Title = "Exclusive Wolper",
					ExclusiveStockTag = true,
					Species = "Wolper",
					Infertile = true,
					Age = 100,
					Preset = { "Porcelain" },
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
					Name = "BunnyBucketHat",
					Amount = 1,
					Theme = { "Opal", "Thunder", "Galaxy", "Obsidian", "Nature", "Cookie", "Clover" }
				},
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 1,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "GetItem",
						Amount = 500,
						Description = "Earn %s Gold Eggs",
						Check = function(p1) --[[ Check | Line: 227 ]]
							return p1 == "GoldEggs"
						end,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "Tame",
						Amount = 25,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					}
				}
			},
			{
				Reward = {
					Name = "WolperBreedingLicense",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 20,
						Description = "Tame %s Wolper",
						Check = function(p1) --[[ Check | Line: 257 ]]
							if p1 == "Wolper" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "BuyStable",
						Description = "Buy %s Wolper from the Easter Stables",
						Amount = 5,
						Check = function(p1) --[[ Check | Line: 270 ]]
							return p1 == "Event"
						end,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					}
				}
			},
			{
				Reward = {
					Name = "EasterWingPotion",
					Amount = 1
				},
				Missions = {
					{
						Type = "Tame",
						Amount = 5,
						Description = "Tame %s Wolper",
						Check = function(p1) --[[ Check | Line: 291 ]]
							if p1 == "Wolper" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 10,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "BuyItem",
						Description = "Purchase %s item from the Event Gacha Shop",
						Amount = 1,
						Check = function(p1) --[[ Check | Line: 313 ]]
							return p1 == "EventGachaMachine"
						end,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					}
				}
			},
			{
				MaxStock = 7500,
				StockId = "LimitedWolper-2",
				Reward = {
					Title = "Exclusive Wolper",
					ExclusiveStockTag = true,
					Species = "Wolper",
					Infertile = true,
					Preset = { "CarrotCake" },
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
					Name = "EasterMarshmallows",
					Amount = 1,
					Theme = {
						"Random",
						"Opal",
						"Thunder",
						"Galaxy",
						"Obsidian",
						"Nature",
						"Cookie",
						"Clover",
						"Tulip",
						"Dyed"
					}
				},
				Missions = {
					{
						Type = "DefeatBoss",
						Amount = 1,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "CompleteEventMinigame",
						Description = "Complete %s Event Minigames",
						Amount = 20,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					},
					{
						Type = "Tame",
						Amount = 20,
						Description = "Tame %s Wolpers",
						Check = function(p1) --[[ Check | Line: 393 ]]
							if p1 == "Wolper" then
								return true
							end
						end,
						Reward = {
							Amount = 25,
							Name = "GoldEggs"
						}
					}
				}
			}
		}
	},
	SecondTrack = {
		CheckUnlocked = function() --[[ CheckUnlocked | Line: 409 ]] end,
		Missions = {}
	}
}
for k, v in pairs(tbl) do
	for k2, v2 in pairs(v.Missions) do
		v2.Index = k2
		v2.Track = k
		v2.DisplayName = k2
	end
end
return {
	Tracks = tbl
}