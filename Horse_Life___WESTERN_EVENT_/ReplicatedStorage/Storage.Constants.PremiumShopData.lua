-- https://lua.expert/
local t = {
	Specials = {
		LayoutOrder = -1,
		ProductTypes = { "OneTimeBundles" }
	},
	Featured = {
		LayoutOrder = 0,
		Products = {
			{
				Name = "StarterPack",
				LayoutOrder = -1,
				Type = "OneTimeBundles"
			},
			{
				Name = "BreedersBundle",
				LayoutOrder = 1,
				Type = "BundleInfo"
			},
			{
				Name = "FlightBundle",
				LayoutOrder = 2,
				Type = "BundleInfo"
			},
			{
				Name = "ArcaneBundle",
				LayoutOrder = 3,
				Type = "BundleInfo"
			},
			{
				Name = "PinkBundle",
				LayoutOrder = 4,
				Type = "BundleInfo"
			}
		}
	},
	Bundles = {
		LayoutOrder = 3,
		ProductTypes = { "TackProducts" }
	},
	Coins = {
		LayoutOrder = 1,
		ProductTypes = { "Coins" }
	},
	ClubTokens = {
		LayoutOrder = 2,
		ProductTypes = { "ClubTokens" }
	},
	Embryos = {
		LayoutOrder = 3,
		ProductTypes = { "CapsuleProducts" }
	},
	Items = {
		LayoutOrder = 4,
		Products = {
			{
				Name = "MutationPotion",
				LayoutOrder = 10,
				Type = "MutationPotions"
			},
			{
				Name = "MutationSlotPotion",
				LayoutOrder = 15,
				Type = "MutationPotions"
			},
			{
				Name = "GenderSwapPotion",
				LayoutOrder = 20,
				Type = "BreedPotions"
			},
			{
				Name = "BigenderPotion",
				LayoutOrder = 25,
				Type = "BreedPotions"
			},
			{
				Name = "MediumPotionBundle",
				LayoutOrder = 30,
				Type = "ItemPacks"
			},
			{
				Name = "LargePotionBundle",
				LayoutOrder = 35,
				Type = "ItemPacks"
			},
			{
				Name = "MasterLassoBundle",
				LayoutOrder = 40,
				Type = "ItemPacks"
			},
			{
				Name = "BigMasterLassoBundle",
				LayoutOrder = 45,
				Type = "ItemPacks"
			},
			{
				Name = "ArtisanMutationPotion",
				LayoutOrder = 50,
				Type = "MutationPotions",
				BackgroundColor = Color3.fromRGB(255, 225, 0)
			}
		}
	},
	ItemBundles = {
		LayoutOrder = 5,
		Products = {
			{
				Name = "LassoBundle",
				LayoutOrder = 0,
				Type = "BundleInfo"
			},
			{
				Name = "FoodBundle",
				LayoutOrder = 1,
				Type = "BundleInfo"
			}
		}
	},
	Merch = {
		LayoutOrder = 6,
		ProductTypes = { "MerchBundles" }
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return t