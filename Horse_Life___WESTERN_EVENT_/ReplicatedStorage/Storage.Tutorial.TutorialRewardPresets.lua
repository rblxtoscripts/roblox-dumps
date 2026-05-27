-- https://lua.expert/
return {
	{
		Image = nil,
		Title = "Rare Horse",
		Species = "Peryton",
		Presets = { "Macaw" },
		MaxCosmetics = {
			MaxPatternsPerSlot = 3,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 3
		},
		MutationSlotChances = {
			{
				Amount = 0,
				P = 0
			},
			{
				Amount = 1,
				P = 1
			},
			{
				Amount = 2,
				P = 0
			},
			{
				Amount = 3,
				P = 0
			}
		},
		MutationChances = {
			Nothing = 0,
			Wings = 100
		}
	},
	{
		Title = "Winged Horse",
		Species = "Peryton",
		Presets = { "Macaw" },
		MaxCosmetics = {
			MaxPatternsPerSlot = 3,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 3
		},
		MutationSlotChances = {
			{
				Amount = 0,
				P = 0
			},
			{
				Amount = 1,
				P = 1
			},
			{
				Amount = 2,
				P = 0
			},
			{
				Amount = 3,
				P = 0
			}
		},
		MutationChances = {
			Nothing = 0,
			Wings = 100
		}
	}
}