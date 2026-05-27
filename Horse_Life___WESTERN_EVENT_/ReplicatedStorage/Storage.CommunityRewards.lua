-- https://lua.expert/
return {
	FavoritedGame = {
		Debounce = 20,
		ValueBase = "FavoritedGame",
		Mutations = {},
		Rewards = {
			{
				Name = "MasterLasso",
				Amount = 5
			}
		}
	},
	JoinCommunity = {
		Debounce = 60,
		ValueBase = "InCommunity",
		Mutations = {},
		Rewards = {
			{
				Name = "InstantFoalPotion",
				Amount = 1
			}
		}
	},
	JoinGroup = {
		Debounce = 20,
		ValueBase = "InGroup",
		Mutations = {},
		Rewards = {
			{
				Name = "MutationPotion",
				Amount = 1
			}
		}
	}
}