-- https://lua.expert/
local ServerStorage = game:GetService("ServerStorage")
local v1 = game:GetService("RunService"):IsServer()
local v2 = if v1 then ServerStorage:WaitForChild("ObjectModels") else v1
local tbl = {
	FallenTree = {
		Respawn = 120,
		Value = 25,
		Image = "rbxassetid://15020968482",
		StrengthXP = 20,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Wood",
				Amount = 1,
				P = 75
			},
			{
				Name = "GroundLitter",
				Amount = 1,
				P = 25
			}
		}
	},
	StoneDeposit = {
		Respawn = 120,
		Value = 50,
		Image = "rbxassetid://15020968482",
		StrengthXP = 25,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Stone",
				Amount = 1,
				P = 100
			}
		}
	},
	Treasure = {
		Respawn = 420,
		Value = 50,
		Image = "rbxassetid://15020968482",
		StrengthXP = 15,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Coins",
				Amount = 50,
				P = 95
			},
			{
				Name = "StringLasso",
				Amount = 1,
				P = 50
			},
			{
				Name = "WovenLasso",
				Amount = 1,
				P = 25
			}
		}
	},
	CandyBox = {
		Respawn = 240,
		Value = 50,
		Image = "rbxassetid://15020968482",
		StrengthXP = 20,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Strawberry",
				Amount = 1,
				P = 25
			},
			{
				Name = "Pineberry",
				Amount = 1,
				P = 10
			},
			{
				Name = "Meadowsweet",
				Amount = 1,
				P = 30
			},
			{
				Name = "ChocolateCookie",
				Amount = 1,
				P = 10
			},
			{
				Name = "PeppermintCookie",
				Amount = 1,
				P = 5
			}
		}
	},
	Presents = {
		Respawn = 240,
		Value = 50,
		Image = "rbxassetid://15020968482",
		StrengthXP = 20,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Peppermint",
				Amount = 1,
				P = 50
			},
			{
				Name = "Mints",
				Amount = 1,
				P = 75
			},
			{
				Name = "Candycanes",
				Amount = 1,
				P = 25
			},
			{
				Name = "ChocolateCookie",
				Amount = 1,
				P = 10
			},
			{
				Name = "PeppermintCookie",
				Amount = 1,
				P = 5
			},
			{
				Name = "YetiPlush",
				Amount = 1,
				Theme = "Random",
				P = 2.5
			},
			{
				Name = "ArcticFoxPlush",
				Amount = 1,
				Theme = "Random",
				P = 1
			},
			{
				Name = "SnowLasso",
				Amount = 1,
				P = 2.5
			}
		}
	},
	Stump = {
		Respawn = 180,
		Value = 35,
		Image = "rbxassetid://15020968482",
		StrengthXP = 20,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Peppermint",
				Amount = 1,
				P = 50
			},
			{
				Name = "Strawberry",
				Amount = 1,
				P = 25
			},
			{
				Name = "Pineberry",
				Amount = 1,
				P = 10
			},
			{
				Name = "Carrot",
				Amount = 1,
				P = 50
			},
			{
				Name = "WhiteCarrot",
				Amount = 1,
				P = 25
			}
		}
	},
	FoodPallet = {
		Respawn = 180,
		Value = 10,
		Image = "rbxassetid://15020968482",
		StrengthXP = 15,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Apple",
				Amount = 1,
				P = 75
			},
			{
				Name = "Mints",
				Amount = 1,
				P = 75
			},
			{
				Name = "Carrot",
				Amount = 1,
				P = 50
			},
			{
				Name = "WhiteCarrot",
				Amount = 1,
				P = 25
			},
			{
				Name = "OatTreats",
				Amount = 1,
				P = 10
			},
			{
				Name = "SugarCubes",
				Amount = 1,
				P = 50
			},
			{
				Name = "AlfalfaCubes",
				Amount = 1,
				P = 25
			},
			{
				Name = "HayCubes",
				Amount = 1,
				P = 50
			},
			{
				Name = "Peach",
				Amount = 1,
				P = 10
			},
			{
				Name = "WhitePeach",
				Amount = 1,
				P = 5
			}
		}
	},
	AppleBarrel = {
		Respawn = 60,
		Value = 5,
		Image = "rbxassetid://15020968482",
		StrengthXP = 5,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Apple",
				Amount = 1,
				P = 75
			},
			{
				Name = "GreenApple",
				Amount = 1,
				P = 25
			},
			{
				Name = "PinkPrincessApple",
				Amount = 1,
				P = 10
			},
			{
				Name = "AppleBarrel",
				Amount = 1,
				Theme = "Random",
				P = 0.25
			}
		}
	},
	Infection = {
		Respawn = 120,
		Value = 150,
		Image = "rbxassetid://15020968482",
		StrengthXP = 6,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Plasma",
				Amount = 4,
				P = 100
			}
		}
	},
	InfectionEgg = {
		Respawn = 240,
		Value = 275,
		Image = "rbxassetid://15020968482",
		StrengthXP = 5,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Plasma",
				Amount = 7,
				P = 85
			},
			{
				Name = "AlienLasso",
				Amount = 1,
				P = 15
			},
			{
				Name = "AlienCapsule",
				Amount = 1,
				P = 1
			}
		}
	},
	HalloweenBag = {
		Respawn = 300,
		Value = 275,
		Image = "rbxassetid://15020968482",
		StrengthXP = 5,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Souls",
				Amount = 5,
				P = 90
			},
			{
				Name = "UndeadLasso",
				Amount = 1,
				P = 10
			},
			{
				Name = "SpookyCapsule",
				Amount = 1,
				P = 1
			}
		}
	},
	BerryBush = {
		Respawn = 180,
		Value = 20,
		Image = "rbxassetid://15020968482",
		StrengthXP = 10,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Strawberry",
				Amount = 1,
				P = 25
			},
			{
				Name = "Peach",
				Amount = 1,
				P = 10
			},
			{
				Name = "WhitePeach",
				Amount = 1,
				P = 5
			},
			{
				Name = "Pineberry",
				Amount = 1,
				P = 10
			},
			{
				Name = "Daylilies",
				Amount = 1,
				P = 75
			},
			{
				Name = "Pansies",
				Amount = 1,
				P = 75
			},
			{
				Name = "BrightPansies",
				Amount = 1,
				P = 10
			},
			{
				Name = "Peppermint",
				Amount = 1,
				P = 50
			},
			{
				Name = "VibrantDaylilies",
				Amount = 1,
				P = 25
			}
		}
	},
	CactusFruit = {
		Respawn = 360,
		Value = 60,
		Image = "rbxassetid://15020968482",
		StrengthXP = 25,
		Color = Color3.fromRGB(81, 0, 255),
		Drops = {
			{
				Name = "Strawberry",
				Amount = 1,
				P = 25
			},
			{
				Name = "Pineberry",
				Amount = 1,
				P = 10
			},
			{
				Name = "Daylilies",
				Amount = 1,
				P = 75
			},
			{
				Name = "Pansies",
				Amount = 1,
				P = 75
			},
			{
				Name = "BrightPansies",
				Amount = 1,
				P = 10
			},
			{
				Name = "VibrantDaylilies",
				Amount = 1,
				P = 25
			}
		}
	},
	SilkBush = {
		Respawn = 360,
		Value = 200,
		Image = "rbxassetid://15020968482",
		StrengthXP = 25,
		Color = Color3.fromRGB(81, 0, 255),
		Drops = {
			{
				Name = "Peppermint",
				Amount = 1,
				P = 50
			},
			{
				Name = "Meadowsweet",
				Amount = 1,
				P = 30
			},
			{
				Name = "Larvae",
				Amount = 1,
				P = 40
			},
			{
				Name = "RareLarvae",
				Amount = 1,
				P = 5
			},
			{
				Name = "DivineLarvae",
				Amount = 1,
				P = 1
			}
		}
	},
	LargeBerryBush = {
		Respawn = 240,
		Value = 75,
		Image = "rbxassetid://15020968482",
		StrengthXP = 25,
		Color = Color3.fromRGB(81, 0, 255),
		Drops = {
			{
				Name = "Peach",
				Amount = 1,
				P = 7.5
			},
			{
				Name = "WhitePeach",
				Amount = 1,
				P = 3.5
			},
			{
				Name = "Strawberry",
				Amount = 1,
				P = 15
			},
			{
				Name = "Pineberry",
				Amount = 1,
				P = 10
			},
			{
				Name = "Daylilies",
				Amount = 1,
				P = 30
			},
			{
				Name = "Pansies",
				Amount = 1,
				P = 30
			},
			{
				Name = "BrightPansies",
				Amount = 1,
				P = 10
			},
			{
				Name = "Peppermint",
				Amount = 1,
				P = 20
			},
			{
				Name = "VibrantDaylilies",
				Amount = 1,
				P = 15
			}
		}
	},
	DailyChest = {
		Respawn = 360,
		Value = 200,
		Image = "rbxassetid://15020968482",
		StrengthXP = 25,
		DisplayName = "DailyChest",
		DefaultScale = 2.5,
		HoverScale = 3,
		Color = Color3.fromRGB(81, 0, 255)
	},
	DiggingNodes = {
		Respawn = 360,
		Value = 20,
		Image = "rbxassetid://15020968482",
		StrengthXP = 25,
		DisplayName = "Shovel",
		DefaultScale = 1.5,
		HoverScale = 2,
		Color = Color3.fromRGB(81, 0, 255)
	},
	CaveWall = {
		Respawn = 360,
		Value = 100,
		Image = "rbxassetid://15020968482",
		StrengthXP = 25,
		DefaultScale = 1.159,
		HoverScale = 1.2,
		NoModel = true,
		Color = Color3.fromRGB(81, 0, 255)
	},
	Clue = {
		Respawn = 360,
		Value = 21,
		Image = "rbxassetid://15020968482",
		StrengthXP = 25,
		DefaultScale = 2.587,
		HoverScale = 2.7,
		Color = Color3.fromRGB(81, 0, 255)
	},
	Cobweb = {
		Respawn = 360,
		Value = 50,
		Image = "rbxassetid://15020968482",
		StrengthXP = 25,
		DisplayName = "Cobweb",
		DefaultScale = 1,
		HoverScale = 1.2,
		Color = Color3.fromRGB(81, 0, 255)
	},
	CarrotPatch = {
		Respawn = 180,
		Value = 50,
		Image = "rbxassetid://15020968482",
		StrengthXP = 25,
		Color = Color3.fromRGB(255, 81, 0),
		Drops = {
			{
				Name = "Carrot",
				Amount = 1,
				P = 25
			},
			{
				Name = "PurpleCarrot",
				Amount = 1,
				P = 5
			},
			{
				Name = "WhiteCarrot",
				Amount = 1,
				P = 20
			}
		}
	}
}
for k, v in pairs(tbl) do
	if v1 and not v.NoModel then
		v.Model = v2.Resource:FindFirstChild(k, true)
		if not v.Model then
			warn("Resource Model not found for", k)
		end
	end
end
return tbl