-- https://lua.expert/
return {
	DisplayName = "Lost Memories",
	Stories = {
		{
			RewardAmount = 1,
			DisplayName = "Retracing Steps",
			Description = "I woke up in a strange place, without any memory. I don\226\128\153t know who I am or what my purpose is. Perhaps if I retrace my steps I may jog my memory?",
			Image = "rbxassetid://123030324530367",
			Rewards = {
				{
					Name = "RandomEquipment",
					Amount = 1,
					Theme = "Gold"
				},
				{
					Name = "HaloOfAetheris",
					Amount = 1,
					Theme = "Random"
				},
				{
					Name = "MagicMuffins",
					Amount = 5
				},
				{
					Name = "GoodBrush",
					Amount = 3
				}
			},
			Missions = {
				{
					Type = "FindClues",
					Amount = 4
				},
				{
					Type = "FindStatue",
					Amount = 3
				},
				{
					Type = "InspectFoal",
					Amount = 3
				},
				{
					Type = "TalkToHorse",
					Amount = 1
				},
				{
					Type = "FeedFoal",
					Amount = 1
				},
				{
					Type = "LocateAetheris",
					Amount = 1
				}
			}
		},
		{
			Locked = true,
			RewardAmount = 1,
			DisplayName = "Retracing Steps 2",
			Description = "I was crazy one......",
			Rewards = {
				{
					Name = "RandomEquipment",
					Amount = 1,
					Theme = "Random"
				},
				{
					Name = "Apple",
					Amount = 1
				}
			},
			Missions = {
				{
					Type = "FindStatue",
					Amount = 1
				},
				{
					Type = "FindStatue",
					Amount = 1
				},
				{
					Type = "FindStatue",
					Amount = 1
				}
			}
		}
	}
}