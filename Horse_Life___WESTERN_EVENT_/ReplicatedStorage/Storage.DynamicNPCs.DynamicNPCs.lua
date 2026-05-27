-- https://lua.expert/
local tbl = {
	Lyric = {
		RequiredSpecies = "Pony",
		BondPointsForFull = 500,
		BaseGiftChance = 0,
		Animations = {
			Idle = 17333204605
		},
		Gifts = {
			{
				Name = "OatMuffin",
				Amount = 3,
				P = 15
			},
			{
				Name = "SugarMuffin",
				Amount = 3,
				Bond = 10,
				P = 15
			},
			{
				Name = "BasicFeed",
				Amount = 1,
				P = 15
			},
			{
				Name = "RandomEquipment",
				Theme = "Nature",
				Amount = 1,
				Bond = 25,
				P = 15
			},
			{
				Amount = 1,
				Bond = 25,
				P = 15,
				Name = { "FlowerAntlers", "RoseCrown", "DelicateFlowerCrown", "BeadedNecklace", "WoodenMask", "GatherersBasket", "FlowerTailRibbon" },
				Theme = { "Nature", "Galaxy", "Obsidian" }
			},
			{
				Name = "GoodFeed",
				Amount = 1,
				Bond = 25,
				P = 15
			},
			{
				Name = "PremiumFeed",
				Amount = 1,
				Bond = 50,
				P = 15
			},
			{
				Name = "GoodBrush",
				Amount = 2,
				Bond = 50,
				P = 15
			},
			{
				Name = "ExclusiveFeed",
				Amount = 1,
				Bond = 75,
				P = 25
			},
			{
				Name = "MysticFeed",
				Amount = 1,
				Bond = 100,
				P = 35
			}
		},
		FavoriteGifts = {
			"OatMuffin",
			"BrightPansies",
			"Pansies",
			"Daylilies",
			"BasicFeed",
			"WovenLasso",
			"Larvae",
			"RareLarvae",
			"DivineLarvae",
			"Fawnberry"
		},
		BondUnlocks = {
			Shop = 25
		}
	},
	Alex = {
		RequiredSpecies = "Bisorse",
		BondPointsForFull = 800,
		BaseGiftChance = 0,
		Animations = {
			Idle = 616111295
		},
		Gifts = {
			{
				Name = "MintMuffin",
				Amount = 3,
				P = 15
			},
			{
				Name = "CarrotMuffin",
				Amount = 3,
				Bond = 15,
				P = 15
			},
			{
				Name = "BasicFeed",
				Amount = 1,
				P = 15
			},
			{
				Name = "RandomEquipment",
				Theme = "Obsidian",
				Amount = 1,
				Bond = 25,
				P = 15
			},
			{
				Amount = 1,
				Bond = 25,
				P = 15,
				Name = { "SunEarClip", "MysticStoneEarClip", "RareAmulet", "TailCrossBones", "GeodeCrown", "MiningPickaxe", "ExplorersPack" },
				Theme = { "Nature", "Galaxy", "Obsidian" }
			},
			{
				Name = "GoodFeed",
				Amount = 1,
				Bond = 25,
				P = 15
			},
			{
				Name = "GoodSoap",
				Amount = 2,
				Bond = 25,
				P = 15
			},
			{
				Name = "PremiumFeed",
				Amount = 1,
				Bond = 50,
				P = 15
			},
			{
				Name = "ExclusiveFeed",
				Amount = 1,
				Bond = 75,
				P = 25
			},
			{
				Name = "MysticFeed",
				Amount = 1,
				Bond = 100,
				P = 35
			}
		},
		FavoriteGifts = { "OatMuffin", "AppleMuffin", "CarrotMuffin", "GoodFeed", "WesternLasso", "GoodBrush", "Brush", "RopeLasso" },
		BondUnlocks = {
			Shop = 25
		}
	},
	Aurelia = {
		RequiredSpecies = "Unicorn",
		BondPointsForFull = 2200,
		BaseGiftChance = 0,
		Animations = {
			Idle = 17332877411
		},
		Gifts = {
			{
				Name = "CarrotMuffin",
				Amount = 4,
				P = 15
			},
			{
				Name = "AppleMuffin",
				Amount = 4,
				Bond = 15,
				P = 15
			},
			{
				Name = "BasicFeed",
				Amount = 1,
				P = 15
			},
			{
				Name = "GoodFeed",
				Amount = 1,
				Bond = 25,
				P = 15
			},
			{
				Name = "RandomEquipment",
				Theme = "Galaxy",
				Amount = 1,
				Bond = 25,
				P = 15
			},
			{
				Amount = 1,
				Bond = 25,
				P = 15,
				Name = { "MoonEarClip", "StarryEarClip", "HeartEarClip", "DarkSwordHalo", "HeroSwordHalo" },
				Theme = { "Nature", "Galaxy", "Obsidian" }
			},
			{
				Name = "GoodHose",
				Amount = 2,
				Bond = 25,
				P = 15
			},
			{
				Name = "PremiumFeed",
				Amount = 1,
				Bond = 50,
				P = 15
			},
			{
				Name = "ExclusiveFeed",
				Amount = 1,
				Bond = 75,
				P = 25
			},
			{
				Name = "MysticFeed",
				Amount = 1,
				Bond = 100,
				P = 35
			}
		},
		FavoriteGifts = { "Peppermint", "SugarCubes", "InfertilityPotion", "WingUpgradePotion", "ExclusiveFeed", "MagicalLasso", "VibrantLasso" },
		BondUnlocks = {
			Shop = 25
		}
	},
	Orion = {
		BondPointsForFull = 5000,
		BaseGiftChance = 0,
		Animations = {
			Idle = 17365450096
		},
		Gifts = {
			{
				Name = "Mints",
				Amount = 2,
				P = 40
			},
			{
				Name = "Peppermint",
				Amount = 2,
				Bond = 25,
				P = 30
			}
		},
		FavoriteGifts = {},
		BondUnlocks = {
			Shop = 25
		}
	},
	Aetheris = {
		Animations = {
			Idle = 17365450096
		}
	},
	EventGuide = {
		BondPointsForFull = 5000,
		NoMissions = true,
		HasShop = false,
		Animations = {
			Idle = 616111295
		},
		Gifts = {
			{
				Name = "Stars",
				Amount = 150,
				P = 40
			}
		}
	},
	Celeste = {
		BondPointsForFull = 5000,
		Animations = {
			Idle = 616111295
		},
		FavoriteGifts = { "TraitBoostPotion", "WhitePeach", "WesternLasso" },
		BondUnlocks = {
			Shop = 25
		},
		Gifts = {
			{
				Name = "Stars",
				Amount = 150,
				P = 40
			}
		}
	}
}
local Dialog = script.Parent.Dialog
local t = { "HowAreYou", "TellMePersonal", "TellMeHistory" }
for k, v in pairs(tbl) do
	v.Name = k
	local v1 = game.ReplicatedStorage.Storage.DynamicNPCs.Models:WaitForChild(k)
	v.Model = v1
	local v2 = v1.NPC:Clone()
	v2:PivotTo(CFrame.new(0, 0, 0) * CFrame.Angles(0, 0.7853981633974483, 0))
	v.CharacterModel = v2
	v.Dialog = {}
	local v3 = Dialog:FindFirstChild(k)
	if v3 then
		v.Dialog.Intro = require(v3:FindFirstChild("Intro"))
		v.Dialog.Gift = require(v3:FindFirstChild("Gift"))
		local ShopRespones = v3:FindFirstChild("ShopRespones")
		if ShopRespones then
			v.Dialog.ShopRespones = require(ShopRespones)
		end
		local Chat = v3:FindFirstChild("Chat")
		if Chat then
			v.Dialog.Chat = {}
			for k2, v4 in pairs(Chat:GetChildren()) do
				v.Dialog.Chat[table.find(t, v4.Name)] = require(v4)
			end
		end
	end
end
return {
	Interactions = {
		Chat = 5,
		Quest = 10,
		Gift = {
			Common = 1,
			Uncommon = 2,
			Rare = 3,
			Epic = 4,
			Legendary = 5
		}
	},
	NPCs = tbl
}