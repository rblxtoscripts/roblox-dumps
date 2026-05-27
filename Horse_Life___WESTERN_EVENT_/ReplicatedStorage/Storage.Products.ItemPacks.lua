-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))("Constants")
return {
	TutorialStarterPack = {
		Name = "TutorialStarterPack",
		ProductType = "ItemPacks",
		ProductId = 1888508369,
		Items = {
			Coins = 2500,
			MasterLasso = 20,
			GoodFeed = 20,
			AppleMuffin = 20
		}
	},
	MediumPotionBundle = {
		Name = "MediumPotionBundle",
		ProductType = "ItemPacks",
		ProductId = 2707037857,
		PercentOff = 5,
		Items = {
			MutationPotion = 10
		}
	},
	LargePotionBundle = {
		Name = "LargePotionBundle",
		ProductType = "ItemPacks",
		ProductId = 2707037984,
		PercentOff = 10,
		Items = {
			MutationPotion = 25
		}
	},
	MasterLassoBundle = {
		Name = "MasterLassoBundle",
		ProductType = "ItemPacks",
		ProductId = 3306199808,
		PercentOff = 20,
		Items = {
			MasterLasso = 20
		}
	},
	BigMasterLassoBundle = {
		Name = "BigMasterLassoBundle",
		ProductType = "ItemPacks",
		ProductId = 3306199957,
		PercentOff = 40,
		Items = {
			MasterLasso = 40
		}
	}
}