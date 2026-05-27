-- https://lua.expert/
return {
	{
		Reward = "Hearts",
		Amount = 100,
		P = 35
	},
	{
		Amount = 1,
		P = 10,
		Species = "Pastrequine",
		Preset = { "PastryDStraw" },
		MutationSlotChances = {
			{
				Amount = 0,
				P = 0
			},
			{
				Amount = 1,
				P = 0
			},
			{
				Amount = 2,
				P = 0
			},
			{
				Amount = 3,
				P = 1
			}
		},
		MaxCosmetics = {
			MaxPatternsPerSlot = 2,
			MaxPaintsPerSlot = 1,
			MaxCosmeticsPerSlot = 2
		}
	},
	{
		Amount = 1,
		P = 15,
		Species = "Pastrequine",
		Preset = {
			"White",
			"Blonde",
			"RedBrown",
			"Brown",
			"LightBrown",
			"DarkBrown",
			"Arabian",
			"BrownBlonde",
			"PeryWTan",
			"PeryCBrown",
			"PeryWBrown",
			"PeryWBrown"
		},
		MutationSlotChances = {
			{
				Amount = 0,
				P = 0
			},
			{
				Amount = 1,
				P = 0
			},
			{
				Amount = 2,
				P = 0
			},
			{
				Amount = 3,
				P = 1
			}
		},
		MaxCosmetics = {
			MaxPatternsPerSlot = 2,
			MaxPaintsPerSlot = 1,
			MaxCosmeticsPerSlot = 2
		}
	},
	{
		Reward = "RandomEquipment",
		Theme = "Mint",
		Amount = 1,
		P = 25
	},
	{
		Reward = "RandomEquipment",
		Theme = "Rose",
		Amount = 1,
		P = 25
	},
	{
		Amount = 1,
		P = 10,
		Reward = {
			"HeartKeeperKey",
			"EternalRose",
			"CupidsBow",
			"CupidStaff",
			"ValentinesFork",
			"CherubsMist",
			"HeartShades",
			"DarkCupidLantern",
			"HeartStaff",
			"CupidsHeadwings",
			"CupidsArrow",
			"HeartBox",
			"LovesickSycthe",
			"ValentinesArrow",
			"LovingBow",
			"StrawberryCake",
			"LovingTeddyBear",
			"LoveLetterBag",
			"CupidsRibbonBow",
			"ValentinesLantern",
			"LoveLetter",
			"HeartSickle",
			"SweetHeartPurse",
			"ValentinesPicnicBasket",
			"LovelyHeartBass",
			"PastrequineBasicBridle",
			"PastrequineBasicSaddle",
			"PastrequineBasicSocks"
		},
		Theme = { "Cookie", "Gold", "Galaxy", "Obsidian", "Nature", "Opal", "Thunder", "Clover" }
	},
	{
		Theme = "Random",
		Amount = 1,
		P = 25,
		Reward = { "MouthHeartLollipop", "CupidArrowEarring", "ValentinesEarring", "BrokenHeartEarring", "HeartEarTag", "HeartLollipopStaff" }
	}
}