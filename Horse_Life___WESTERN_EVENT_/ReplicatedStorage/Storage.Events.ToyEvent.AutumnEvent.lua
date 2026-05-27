-- https://lua.expert/
return {
	{
		Name = "Autumn\'s Mission",
		Description = "Here you unlock your first LEGO\194\174 horse!",
		TotalRewards = 1,
		IsToyEvent = true,
		Missions = {
			{
				Type = "CompleteRace",
				Amount = 1,
				Description = "Complete the Dream Dash Parade %s times",
				Check = function(p1) --[[ Check | Line: 28 ]]
					return p1 == "ToyRace"
				end
			}
		},
		Rewards = {
			{
				Species = "Horlse",
				Infertile = true,
				NoMutations = true,
				P = 0.4,
				Preset = { "LegoBlue", "LegoBrown", "LegoPurple" }
			}
		}
	}
}