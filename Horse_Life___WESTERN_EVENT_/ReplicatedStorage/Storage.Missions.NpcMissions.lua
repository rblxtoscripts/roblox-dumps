-- https://lua.expert/
game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("LostItems", "Client")
local t = {}
local t2 = {
	{
		Description = "Hey there! I need you to tame a Gargoyle, Kelpie, Equus, and Bisorse for me!",
		Missions = {
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Gargoyle!",
				Check = function(p1) --[[ Check | Line: 16 ]]
					return p1 == "Gargoyle"
				end
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Kelpie!",
				Check = function(p1) --[[ Check | Line: 24 ]]
					return p1 == "Kelpie"
				end
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame an Equus!",
				Check = function(p1) --[[ Check | Line: 32 ]]
					return p1 == "Equus"
				end
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Bisorse!",
				Check = function(p1) --[[ Check | Line: 40 ]]
					return p1 == "Bisorse"
				end
			}
		},
		Rewards = {
			{
				Name = "Coins",
				Amount = 50
			}
		}
	}
}
local t3 = {
	Description = "Hey kiddo! I happened to be in some caves when I left behind some %ss, mind fetching them for me?",
	Missions = {
		{
			Type = "NpcLostItem",
			Amount = 5,
			Description = "Find Lost Items"
		}
	},
	Rewards = {
		{
			Name = "Coins",
			Amount = 50
		}
	},
	Choices = { "Ore", "Gemstone", "Artifact" }
}
t3.RunFunction = v1 and v1.New or nil
t2[2] = t3
t.Alex = t2
local t4 = {
	{
		Description = "Little one, I need you to tame a Unicorn, Peryton, and Caprine.",
		Missions = {
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Unicorn!",
				Check = function(p1) --[[ Check | Line: 88 ]]
					return p1 == "Unicorn"
				end
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Peryton!",
				Check = function(p1) --[[ Check | Line: 96 ]]
					return p1 == "Peryton"
				end
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Caprine!",
				Check = function(p1) --[[ Check | Line: 104 ]]
					return p1 == "Caprine"
				end
			}
		},
		Rewards = {
			{
				Name = "Coins",
				Amount = 50
			}
		}
	}
}
local t5 = {
	Description = "I seem to have misplaced my %ss while studying on the floating islands. Could you fly up there and grab them for me?",
	Missions = {
		{
			Type = "NpcLostItem",
			Amount = 5,
			Description = "Find Lost Items"
		}
	},
	Rewards = {
		{
			Name = "Coins",
			Amount = 50
		}
	},
	Choices = { "Potion", "Spellbook", "Ingredients" }
}
t5.RunFunction = v1 and v1.New or nil
t4[2] = t5
t.Aurelia = t4
local t6 = {
	{
		Description = "This might be a hard one... I need you to go tame a Fae, Pony, Horse, and Flora!",
		Missions = {
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Fae!",
				Check = function(p1) --[[ Check | Line: 150 ]]
					return p1 == "Fae"
				end
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Pony!",
				Check = function(p1) --[[ Check | Line: 158 ]]
					return p1 == "Pony"
				end
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Horse!",
				Check = function(p1) --[[ Check | Line: 166 ]]
					return p1 == "Horse"
				end
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Flora!",
				Check = function(p1) --[[ Check | Line: 174 ]]
					return p1 == "Flora"
				end
			}
		},
		Rewards = {
			{
				Name = "Coins",
				Amount = 50
			}
		}
	}
}
local t7 = {
	Description = "I was prancing around the field when I must have dropped my %s!! Help me find them, pretty please?",
	Missions = {
		{
			Type = "NpcLostItem",
			Amount = 5,
			Description = "Find Lost Items"
		}
	},
	Rewards = {
		{
			Name = "Coins",
			Amount = 50
		}
	},
	Choices = { "Fawnberry", "Pie", "Violin" }
}
t7.RunFunction = if v1 then v1.New or nil else nil
t6[2] = t7
t.Lyric = t6
t.Celeste = {
	{
		Description = "I need your help with something. There is a Clydesdale, a Gargoyle, a Fae, and a Flora out there that I have been keeping an eye on. Would you earn their trust for me?",
		Missions = {
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Clydesdale!",
				Check = function(p1) --[[ Check | Line: 220 ]]
					return p1 == "Clydesdale"
				end
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Gargoyle!",
				Check = function(p1) --[[ Check | Line: 228 ]]
					return p1 == "Gargoyle"
				end
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Fae!",
				Check = function(p1) --[[ Check | Line: 236 ]]
					return p1 == "Fae"
				end
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Flora!",
				Check = function(p1) --[[ Check | Line: 244 ]]
					return p1 == "Flora"
				end
			}
		},
		Rewards = {
			{
				Name = "MagicalLasso",
				Amount = 1,
				P = 30
			},
			{
				Name = "FairyNet",
				Amount = 1,
				P = 15
			},
			{
				Name = "GoodFeed",
				Amount = 1,
				P = 30
			},
			{
				Name = "Fabric",
				Amount = 1,
				P = 30
			}
		}
	},
	{
		Description = "There is one Nephyrian and two Fjord I would like to know more about. They are not easy to find, but I believe you can manage. Would you try?",
		Missions = {
			{
				Type = "Tame",
				Amount = 1,
				Description = "Go tame a Nephyrian!",
				Check = function(p1) --[[ Check | Line: 279 ]]
					return p1 == "Nephyrian"
				end
			},
			{
				Type = "Tame",
				Amount = 2,
				Description = "Go tame a Fjord!",
				Check = function(p1) --[[ Check | Line: 287 ]]
					return p1 == "Fjord"
				end
			}
		},
		Rewards = {
			{
				Name = "MagicalLasso",
				Amount = 1,
				P = 30
			},
			{
				Name = "FairyNet",
				Amount = 1,
				P = 15
			},
			{
				Name = "GoodFeed",
				Amount = 1,
				P = 30
			},
			{
				Name = "Fabric",
				Amount = 1,
				P = 30
			}
		}
	}
}
return t