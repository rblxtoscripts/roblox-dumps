-- https://lua.expert/
local tbl = {
	ContentCreator = {
		Image = "rbxassetid://17514218413",
		Items = {
			PredictFoalPotion = 2,
			MovieClapper = {
				Amount = 4,
				Theme = "Random",
				SeedOffset = 1
			}
		}
	},
	Tester = {
		Image = "rbxassetid://17514218413",
		Items = {
			TesterWingPotion = 1,
			PredictFoalPotion = 2,
			TesterPillBug = {
				Amount = 4,
				Theme = "Random",
				SeedOffset = 1
			}
		}
	},
	Contributor = {
		Image = "rbxassetid://17514218413",
		Items = {
			MagicPaintbrush = {
				Amount = 4,
				Theme = "Random",
				SeedOffset = 1
			}
		}
	},
	Moderator = {
		Image = "rbxassetid://17514218413",
		Items = {
			ModeratorWingPotion = 1,
			PredictFoalPotion = 2,
			ModBanHammer = {
				Amount = 4,
				Theme = "Random",
				SeedOffset = 1
			}
		}
	},
	ContributingDeveloper = {
		Image = "rbxassetid://17514218413",
		Items = {
			PredictFoalPotion = 2,
			DevLightbulb = {
				Amount = 4,
				Theme = "Random",
				SeedOffset = 1
			}
		}
	},
	AlphaSupporter = {
		Image = "rbxassetid://115050023683614",
		Items = {
			RainbowSparkleTrail = 1,
			FantasyWingPotion = 1,
			DragonSkull = {
				Amount = 1,
				Theme = "Random"
			}
		}
	},
	BetaSupporter = {
		Image = "rbxassetid://94721386023070",
		Items = {
			MysticSparkleTrail = 1,
			FantasyWingPotion = 1,
			FaeHeadwings = {
				Amount = 1,
				Theme = "Random"
			}
		}
	},
	AlphaTester = {
		Image = "rbxassetid://98522978275548",
		Items = {
			GoldSparkleTrail = 1,
			BlossomingBranches = {
				Amount = 1,
				Theme = "Random"
			}
		}
	},
	BetaTester = {
		Image = "rbxassetid://84868521375070",
		Items = {
			DiamondSparkleTrail = 1,
			TeddyHat = {
				Amount = 1,
				Theme = "Random"
			}
		}
	}
}
for k, v in pairs(tbl) do
	v.Role = k
end
return tbl