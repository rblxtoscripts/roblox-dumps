-- https://lua.expert/
return {
	InfertilityPotion = {
		Rarity = "Epic",
		Image = 17210150322,
		Description = "\240\159\146\148 Makes your horse unable to breed <b>PERMANENTLY!</b>",
		ToolType = "Consumable",
		ConsumableType = "Infertility"
	},
	InstantFoalPotion = {
		Rarity = "Epic",
		Image = 17372998233,
		Description = "\226\140\155 Instantly reduce the birth time for your horse!",
		ToolType = "Consumable",
		ConsumableType = "InstantFoal"
	},
	PredictFoalPotion = {
		Rarity = "Legendary",
		Image = 17461086157,
		Tradelocked = true,
		Description = "\240\159\146\152 Allows you to claim a predicted breed outcome! \n<b>*\226\132\185\239\184\143</b><b><i> The female horse becomes pregnant with the prediction</i></b>"
	},
	GenderSwapPotion = {
		Rarity = "Legendary",
		Image = 18879024029,
		Tradelocked = true,
		Description = "\240\159\146\152 Allows you to swap a horse gender! \n<b>*\226\132\185\239\184\143</b><b><i> Female horses cannot have a foal when using this. </i></b>",
		ConsumableType = "GenderSwap",
		ToolType = "Consumable",
		DisplayName = "GenderPotion"
	},
	BigenderPotion = {
		Rarity = "Legendary",
		Image = 18879025727,
		Tradelocked = true,
		Description = "\240\159\146\152 Lets you use a horse in either gender slot! \n<b>*\226\132\185\239\184\143</b><b><i> Will have the same cooldown as Female horses. </i></b>",
		ConsumableType = "Bigender",
		ToolType = "Consumable",
		DisplayName = "BiGenderPotion"
	}
}