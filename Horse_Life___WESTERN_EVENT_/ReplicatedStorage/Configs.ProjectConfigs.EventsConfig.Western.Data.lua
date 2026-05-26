-- https://lua.expert/
return {
	EventCurrencyName = "GoldCoins",
	EventCurrencyImage = "rbxassetid://111683903644694",
	StartTime = DateTime.fromIsoDate("2026-05-19"),
	EndTime = DateTime.fromIsoDate("2026-05-27"),
	EventActivities = {
		{
			Name = "Spirit Boss",
			Description = "Challenge powerful bosses across different tiers.\nHigher tiers are harder but reward more Gold Coins!",
			Image = "rbxassetid://85082992864898",
			Duration = 300
		},
		{
			Name = "Western Maze",
			Description = "Navigate your way through the canyon maze to earn Gold Coins in this minigame!",
			Image = "rbxassetid://102371004800534",
			Duration = 300
		},
		{
			Name = "Costume Contest",
			Description = "Style your horse to match the costume prompt in this minigame!\nPlace higher in the contest to earn more Gold Coins.",
			Image = "rbxassetid://89205592564295",
			Duration = 180
		},
		{
			Name = "Races & Trails",
			Description = "Finish races and trails to earn Gold Coins!",
			Image = "rbxassetid://139626656665621",
			Duration = 180
		},
		{
			Name = "Ore Bobbing",
			Description = "In this minigame, use your rod to collect valuable ores!\nRocks, silver ore, and gold ore will give Gold Coins!",
			Image = "rbxassetid://79810391514630",
			Duration = 180
		}
	},
	DropSets = {
		OversizedCowboyHat = { "OversizedCowboyHat" },
		WesternBootEarring = { "WesternBootEarring" },
		AceOfSpades = { "AceOfSpades" }
	}
}