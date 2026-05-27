-- https://lua.expert/
local t = { "Blossom", "StrawberryEarBow", "SakuraBlossomBow", "SakuraTrail", "SakuraBlossomCrown", "StrawberryBasket", "StrawberryMilk" }
local t2 = { "ArcaneBottle", "ArcaneCards", "ArcaneChainedBook", "ArcaneDragon", "ArcaneEarring", "ArcaneHat", "ArcaneStaff" }
return {
	StarterBundle = {
		DisplayOrder = 0,
		ProductId = 3595388024,
		Cost = 249,
		DisplayName = "Starter Bundle",
		BundleArt = "rbxassetid://91995449515522",
		DisplayCheck = {
			PlaytimeMax = 336
		},
		Items = {
			BasicFeed = {
				Amount = 15,
				SeedOffset = 1
			},
			HorseBasicBridle = {
				Amount = 2,
				SeedOffset = 1
			},
			HorseBasicSaddle = {
				Amount = 2,
				SeedOffset = 1
			},
			HorseBoots = {
				Amount = 2,
				SeedOffset = 1
			},
			ColorDye = {
				Amount = 5,
				SeedOffset = 1
			},
			MasterLasso = {
				Amount = 10,
				SeedOffset = 1
			}
		},
		BackgroundColor = Color3.fromRGB(255, 106, 0),
		BarColor = Color3.fromRGB(255, 198, 55),
		CornerColors = Color3.fromRGB(255, 198, 55)
	},
	BreedersBundle = {
		DisplayOrder = 2,
		ProductId = 1913102023,
		Cost = 1000,
		DisplayName = "Breeders Bundle",
		Split = true,
		BundleArt = "rbxassetid://97985297026323",
		PercentOff = 7,
		SaleStarts = 1774551538,
		SaleEnds = 1774915200,
		FeaturedItem = "PredictFoalPotion",
		BackgroundColor = Color3.fromRGB(0, 81, 151),
		BarColor = Color3.fromRGB(73, 209, 236),
		CornerColors = Color3.fromRGB(73, 209, 236),
		Items = {
			InstantFoalPotion = {
				Amount = 10,
				SeedOffset = 1
			},
			TraitBoostPotion = {
				Amount = 10,
				SeedOffset = 2
			},
			PredictFoalPotion = {
				Amount = 1,
				SeedOffset = 3
			},
			GenderSwapPotion = {
				Amount = 1,
				SeedOffset = 4
			},
			BasicFeed = {
				Amount = 50,
				SeedOffset = 5
			},
			MysticFeed = {
				Amount = 10,
				SeedOffset = 7
			}
		}
	},
	ArcaneBundle = {
		DisplayOrder = 4,
		ProductId = 3592818084,
		Cost = 1449,
		DisplayName = "Arcane Bundle",
		Split = true,
		FeaturedItem = "ArcaneMutationPotion",
		CanvasBackgroundColor = Color3.fromRGB(255, 225, 0),
		BackgroundColor = Color3.fromRGB(250, 248, 230),
		BarColor = Color3.fromRGB(255, 203, 164),
		CornerColors = Color3.fromRGB(200, 225, 255),
		Items = {
			ArcaneWingPotion = {
				Amount = 1,
				SeedOffset = 1
			},
			ArcaneCapsule = {
				Amount = 1,
				SeedOffset = 2
			},
			ArcaneMutationPotion = {
				Amount = 1,
				SeedOffset = 3
			},
			RandomDrop1 = {
				Amount = 2,
				SeedOffset = 4,
				Theme = "Random",
				ThemeChance = 0.5,
				PullTable = t2
			},
			RandomDrop2 = {
				Amount = 2,
				SeedOffset = 5,
				Theme = "Random",
				ThemeChance = 0.5,
				PullTable = t2
			},
			RandomDrop3 = {
				Amount = 2,
				SeedOffset = 6,
				Theme = "Random",
				ThemeChance = 0.5,
				PullTable = t2
			}
		}
	},
	FlightBundle = {
		DisplayName = "Flight Bundle",
		DisplayOrder = 3,
		ProductId = 2668081852,
		Cost = 599,
		BundleArt = "rbxassetid://123491615849312",
		Split = true,
		PercentOff = 5,
		SaleStarts = 1774551538,
		SaleEnds = 1774915200,
		CustomCellSize = UDim2.new(0.33, 0, 1, 0),
		BackgroundColor = Color3.fromRGB(125, 199, 255),
		BarColor = Color3.fromRGB(73, 138, 236),
		CornerColors = Color3.fromRGB(81, 130, 236),
		Items = {
			RandomWingPotion = {
				Amount = 5,
				SeedOffset = 1
			},
			RandomDrop1 = {
				Amount = 5,
				SeedOffset = 2,
				PullTable = {
					"PlushWingPotion",
					"FloraWingPotion",
					"PeryWingPotion",
					"FaeWingPotion",
					"CybredWingPotion",
					"CelestialWingPotion",
					"SaurequineWingPotion",
					"HippoWingPotion",
					"KirinWingPotion",
					"CactusWingPotion",
					"FelorseWingPotion",
					"AnticornWingPotion",
					"NephyrianWingPotion",
					"CaniquineWingPotion"
				}
			},
			WingUpgradePotion = {
				Amount = 10,
				SeedOffset = 3
			}
		}
	},
	LassoBundle = {
		DisplayOrder = 2,
		ProductId = 3376948951,
		Cost = 249,
		DisplayName = "Lasso Bundle",
		Split = true,
		BundleArt = "rbxassetid://97985297026323",
		BackgroundColor = Color3.fromRGB(0, 81, 151),
		BarColor = Color3.fromRGB(73, 209, 236),
		CornerColors = Color3.fromRGB(73, 209, 236),
		Items = {
			WovenLasso = {
				Amount = 35,
				SeedOffset = 1
			},
			BraidedLasso = {
				Amount = 20,
				SeedOffset = 2
			},
			RainbowLasso = {
				Amount = 15,
				SeedOffset = 3
			},
			MasterLasso = {
				Amount = 5,
				SeedOffset = 4
			},
			RandomDrop1 = {
				Amount = 10,
				SeedOffset = 2,
				PullTable = {
					"CactiLasso",
					"OceanLasso",
					"RoseLasso",
					"MysticWebLasso",
					"KelpLasso",
					"MysticCloudLasso",
					"OvergrownLasso",
					"MagicalLasso",
					"VibrantLasso",
					"WesternLasso",
					"JungleLasso"
				}
			}
		}
	},
	FoodBundle = {
		DisplayOrder = 2,
		ProductId = 3376968196,
		Cost = 249,
		DisplayName = "Food Bundle",
		Split = true,
		BundleArt = "rbxassetid://97985297026323",
		BackgroundColor = Color3.fromRGB(0, 81, 151),
		BarColor = Color3.fromRGB(73, 209, 236),
		CornerColors = Color3.fromRGB(73, 209, 236),
		Items = {
			BasicFeed = {
				Amount = 25,
				SeedOffset = 1
			},
			GoodFeed = {
				Amount = 20,
				SeedOffset = 2
			},
			PremiumFeed = {
				Amount = 15,
				SeedOffset = 3
			},
			ExclusiveFeed = {
				Amount = 10,
				SeedOffset = 4
			},
			MysticFeed = {
				Amount = 5,
				SeedOffset = 4
			},
			RandomDrop1 = {
				Amount = 10,
				SeedOffset = 2,
				PullTable = { "EtherealJam", "CelestialHoney" }
			}
		}
	},
	PinkBundle = {
		DisplayName = "Blossom Bundle",
		DisplayOrder = 3,
		ProductId = 1913676981,
		BundleArt = "rbxassetid://93620472636696",
		SaleStarts = 1765562400,
		SaleEnds = 1766174400,
		FeaturedItem = "SakuraCapsule",
		BackgroundColor = Color3.fromRGB(255, 114, 133),
		BarColor = Color3.fromRGB(255, 153, 155),
		CornerColors = Color3.fromRGB(255, 153, 155),
		Items = {
			SakuraWingPotion = {
				Amount = 2,
				SeedOffset = 1
			},
			SakuraCapsule = {
				Amount = 1,
				SeedOffset = 2
			},
			RandomDrop1 = {
				Amount = 2,
				SeedOffset = 3,
				Theme = "Random",
				ThemeChance = 0.5,
				PullTable = t
			},
			RandomDrop2 = {
				Amount = 2,
				SeedOffset = 4,
				Theme = "Random",
				ThemeChance = 0.5,
				PullTable = t
			},
			RandomDrop3 = {
				Amount = 2,
				SeedOffset = 5,
				Theme = "Random",
				ThemeChance = 0.5,
				PullTable = t
			},
			RandomDrop4 = {
				Amount = 2,
				SeedOffset = 6,
				Theme = "Random",
				ThemeChance = 0.5,
				PullTable = t
			}
		}
	}
}