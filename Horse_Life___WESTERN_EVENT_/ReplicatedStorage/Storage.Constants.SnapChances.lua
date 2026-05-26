-- https://lua.expert/
return {
	Common = {
		Uncommon = 0.12,
		Rare = 0.24,
		Epic = 0.36,
		Legendary = 0.48,
		Exclusive = 0.6
	},
	Uncommon = {
		Rare = 0.12,
		Epic = 0.24,
		Legendary = 0.36,
		Exclusive = 0.48
	},
	Rare = {
		Epic = 0.12,
		Legendary = 0.24,
		Exclusive = 0.36
	},
	Epic = {
		Legendary = 0.12,
		Exclusive = 0.24
	},
	Legendary = {
		Exclusive = 0.12
	}
}