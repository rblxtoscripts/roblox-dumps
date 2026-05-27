-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))
local tbl = {
	Common = {
		Index = 1,
		RichTextColor = "rgb(212, 212, 212)",
		TextColor = Color3.fromRGB(212, 212, 212),
		ItemStream = {
			BackgroundColor = Color3.fromRGB(45, 32, 26),
			TextColor = Color3.fromRGB(222, 191, 172),
			Sound = game.ReplicatedStorage.Storage.SFX.QuestIncrement
		}
	},
	Uncommon = {
		Index = 2,
		RichTextColor = "rgb(152, 255, 167)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(19, 85, 63),
			TextColor = Color3.fromRGB(152, 255, 167),
			Sound = game.ReplicatedStorage.Storage.SFX.QuestIncrement
		}
	},
	Rare = {
		Index = 3,
		RichTextColor = "rgb(123, 255, 255)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(20, 77, 112),
			TextColor = Color3.fromRGB(123, 255, 255),
			Sound = game.ReplicatedStorage.Storage.SFX.QuestIncrement
		}
	},
	Epic = {
		Index = 4,
		RichTextColor = "rgb(223, 160, 255)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(89, 42, 122),
			TextColor = Color3.fromRGB(223, 160, 255),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Legendary = {
		Index = 5,
		RichTextColor = "rgb(255, 204, 103)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(217, 104, 29),
			TextColor = Color3.fromRGB(255, 204, 103),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Exclusive = {
		Index = 6,
		RichTextColor = "rgb(138, 102, 255)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(118, 37, 217),
			TextColor = Color3.fromRGB(138, 102, 255),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Halloween = {
		Index = 7,
		RichTextColor = "rgb(213, 91, 9)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(255, 89, 33),
			TextColor = Color3.fromRGB(85, 85, 255),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Christmas = {
		Index = 8,
		RichTextColor = "rgb(213, 91, 9)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(88, 255, 107),
			TextColor = Color3.fromRGB(255, 65, 94),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Valentines = {
		Index = 9,
		RichTextColor = "rgb(213, 91, 9)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(255, 89, 241),
			TextColor = Color3.fromRGB(255, 83, 252),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Easter = {
		Index = 10,
		RichTextColor = "rgb(213, 91, 9)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(154, 221, 195),
			TextColor = Color3.fromRGB(77, 152, 153),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Carnival = {
		Index = 11,
		RichTextColor = "rgb(213, 91, 9)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(133, 117, 221),
			TextColor = Color3.fromRGB(87, 61, 153),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Event = {
		Index = 12,
		RichTextColor = "rgb(213, 91, 9)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(133, 117, 221),
			TextColor = Color3.fromRGB(87, 61, 153),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Royal = {
		Index = 13,
		RichTextColor = "rgb(213, 91, 9)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(154, 221, 195),
			TextColor = Color3.fromRGB(77, 152, 153),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Cosmic = {
		Index = 14,
		RichTextColor = "rgb(120, 0, 200)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(25, 10, 40),
			TextColor = Color3.fromRGB(200, 150, 255),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Autumn = {
		Index = 15,
		RichTextColor = "rgb(120, 0, 200)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(255, 85, 0),
			TextColor = Color3.fromRGB(255, 255, 0),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	NewYears = {
		Index = 7,
		RichTextColor = "rgb(213, 193, 63)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(213, 193, 63),
			TextColor = Color3.fromRGB(255, 234, 76),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	},
	Western = {
		Index = 16,
		RichTextColor = "rgb(176, 144, 88)",
		ItemStream = {
			BackgroundColor = Color3.fromRGB(176, 144, 88),
			TextColor = Color3.fromRGB(176, 144, 88),
			Sound = game.ReplicatedStorage.Storage.SFX.ItemStreamPickUp
		}
	}
}
for k, v in pairs(tbl) do
	v.Name = k
	v.TextColor = v.TextColor or v.ItemStream.TextColor
end
return tbl