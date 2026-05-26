-- https://lua.expert/
return {
	Mailbox = {
		Image = "98063774783566",
		PlacementLimit = 1,
		Crafting = {
			Wood = 10
		}
	},
	FoodTrough = {
		Image = "139607150996676",
		InteractionType = "FoodTrough",
		PlacementLimit = 1,
		Crafting = {
			Wood = 10,
			AlfalfaCubes = 10,
			HayCubes = 10,
			BasicFeed = 10
		}
	},
	FarmingPlot = {
		Image = "95425520030298",
		InteractionType = "FarmingPlot",
		PlacementLimit = 4,
		Crafting = {
			Wood = 5,
			GroundLitter = 10
		}
	},
	HoneyMaker = {
		Image = "78479169722337",
		PlacementLimit = 2,
		InteractionType = "InputOutput",
		ProccessTime = 480,
		StackLimit = 20,
		InputAmount = 3,
		Crafting = {
			Wood = 10,
			Meadowsweet = 10,
			VibrantDaylilies = 10,
			BrightPansies = 10
		},
		InputItems = { "Meadowsweet", "Pansies", "BrightPansies", "Helianthus", "Daylilies", "VibrantDaylilies" },
		OutputItems = {
			Common = "RawHoney",
			Uncommon = "AmberHoney",
			Rare = "SunHoney",
			Epic = "RoyalHoney",
			Legendary = "CelestialHoney"
		}
	},
	JamMaker = {
		Image = "128996997161923",
		PlacementLimit = 2,
		InteractionType = "InputOutput",
		ProccessTime = 480,
		StackLimit = 20,
		InputAmount = 3,
		Crafting = {
			Wood = 5,
			Stone = 5,
			Fawnberry = 10,
			GoldApple = 10
		},
		InputItems = {
			"Fawnberry",
			"Pineberry",
			"Strawberry",
			"Pineberry",
			"GoldApple",
			"PinkPrincessApple",
			"GreenApple",
			"Apple",
			"Peach",
			"WhitePeach"
		},
		OutputItems = {
			Common = "BasicJam",
			Uncommon = "SweetJam",
			Rare = "LushJam",
			Epic = "RichJam",
			Legendary = "EtherealJam"
		}
	}
}