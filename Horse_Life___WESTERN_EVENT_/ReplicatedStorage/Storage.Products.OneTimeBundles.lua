-- https://lua.expert/
local t = {}
local t2 = {
	DisplayOrder = 0,
	RotateItemImages = true,
	Tab = "Specials",
	ProductId = 3487463104,
	ProductType = "OneTimeBundles",
	Cost = 999,
	DisplayName = "Winter Holiday Bundle"
}
t2.SaleStarts = if game:GetService("RunService"):IsStudio() then DateTime.now().UnixTimestamp + 20 else DateTime.fromIsoDate("2025-12-25T08:00:00Z").UnixTimestamp
t2.SaleEnds = if game:GetService("RunService"):IsStudio() then DateTime.now().UnixTimestamp + 30 else DateTime.fromIsoDate("2025-12-26T08:00:00Z").UnixTimestamp
t2.Items = {
	FrostMutationPotion = {
		Amount = 1
	},
	NorthStarMutationPotion = {
		Amount = 1
	},
	FestiveCapsule = {
		Amount = 1
	},
	FrozenCapsule = {
		Amount = 1
	},
	ChristmasOrnament = {
		Amount = 1
	},
	Wreath = {
		Amount = 1
	},
	CozyMouse = {
		Amount = 1
	},
	Marshmellow = {
		Amount = 1
	}
}
t.WinterHolidayBundle = t2
t.WinterBreedersBundle = {
	DisplayOrder = 1,
	ProductId = 3482921826,
	ProductType = "OneTimeBundles",
	Cost = 999,
	DisplayName = "Winter Breeder\'s Bundle",
	SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00Z").UnixTimestamp,
	SaleEnds = DateTime.fromIsoDate("2025-12-23T08:00:00Z").UnixTimestamp,
	Items = {
		TraitBoostPotion = {
			Amount = 10
		},
		InstantFoalPotion = {
			Amount = 10
		},
		PredictFoalPotion = {
			Amount = 1
		},
		GenderSwapPotion = {
			Amount = 1
		},
		NorthStarMutationPotion = {
			Amount = 1
		}
	}
}
t.WinterPack = {
	DisplayOrder = 2,
	ProductId = 3482922135,
	ProductType = "OneTimeBundles",
	Cost = 499,
	DisplayName = "Winter Pack",
	SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00Z").UnixTimestamp,
	SaleEnds = DateTime.fromIsoDate("2025-12-23T08:00:00Z").UnixTimestamp,
	Items = {
		FrozenCapsule = {
			Amount = 1,
			SeedOffset = 1
		},
		FrozenWingPotion = {
			Amount = 1,
			SeedOffset = 2
		},
		HornGrowthPotion = {
			Amount = 1,
			SeedOffset = 3
		},
		MysticFeed = {
			Amount = 5,
			SeedOffset = 7
		},
		RandomFlair = {
			Amount = 3,
			SeedOffset = 7
		}
	}
}
t.StarterPack = {
	ProductId = 3595388024,
	DisplayOrder = 3,
	Cost = 249,
	ProductType = "OneTimeBundles",
	DisplayName = "Starter Pack",
	PurchaseLimit = 1,
	DisplayCheck = {
		PlaytimeMax = 336
	},
	SaleStarts = DateTime.fromIsoDate("2020-01-01T00:00:00Z").UnixTimestamp,
	SaleEnds = DateTime.fromIsoDate("2099-01-01T00:00:00Z").UnixTimestamp,
	Items = {
		BasicFeed = {
			Amount = 15
		},
		HorseBasicBridle = {
			Amount = 2
		},
		HorseBasicSaddle = {
			Amount = 2
		},
		HorseBoots = {
			Amount = 2
		},
		ColorDye = {
			Amount = 5
		},
		MasterLasso = {
			Amount = 10
		}
	}
}
for v3, v4 in t do
	v4.Name = v3
end
return t