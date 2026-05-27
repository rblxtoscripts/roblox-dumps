-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EventName = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").EventName
local v1 = setmetatable({
	Main = {
		AspectRatio = 1.238068377170363,
		Image = "rbxassetid://112211904361031",
		xMin = -2333,
		xMax = 3153,
		zTop = -3512,
		zBottom = 919,
		PlaceIds = { 15696848933, 16727629658, 16618922530 }
	},
	Market = {
		AspectRatio = 1.193,
		Image = "rbxassetid://98368627729853",
		xMin = -416.5,
		xMax = 776.3,
		zTop = -425.6,
		zBottom = 573.1,
		PlaceIds = { 17561507982, 17769565541 }
	},
	Winter = {
		AspectRatio = 1.048,
		Image = "rbxassetid://102331260542882",
		xMin = -1477.1,
		xMax = 1289.3,
		zTop = -1480.7,
		zBottom = 1158.8,
		PlaceIds = { 79117382356363, 92892362986432 }
	},
	Valentines = {
		AspectRatio = 0.8247678018575851,
		Image = "rbxassetid://88505262169759",
		xMin = -1581,
		xMax = 1083,
		zTop = -1288,
		zBottom = 1942,
		PlaceIds = { 123063406055708, 110057451883641 }
	},
	CompetitorHub = {
		AspectRatio = 1.097968183965979,
		Image = "rbxassetid://103516584885745",
		xMin = -2676,
		xMax = 4294,
		zTop = -3292,
		zBottom = 3058,
		PlaceIds = { 98827123238121, 101224150419293 }
	}
}, {
	__index = function(p1, p2) --[[ __index | Line: 68 ]]
		local Main = p1.Main
		for v1, v2 in p1 do
			if table.find(v2.PlaceIds, game.PlaceId) then
				Main = v2
				break
			end
		end
		return Main[p2]
	end
})
local t2 = {}
t2[1] = if EventName then {
	Name = "Event",
	Items = {
		{
			Content = "rbxassetid://87548991610204",
			Name = "CostumeContest",
			ImageColor = Color3.new(255/255, 255/255, 255/255)
		},
		{
			Content = "rbxassetid://72178328790685",
			Name = "TastyFishing",
			ImageColor = Color3.new(255/255, 255/255, 255/255)
		},
		{
			Content = "rbxassetid://72178328790685",
			Name = "CrossCountrySprint",
			ImageColor = Color3.new(255/255, 255/255, 255/255)
		},
		{
			Content = "rbxassetid://72178328790685",
			Name = "LovingTrail",
			ImageColor = Color3.new(255/255, 255/255, 255/255)
		},
		{
			Content = "rbxassetid://72178328790685",
			Name = "WesternMaze",
			ImageColor = Color3.new(255/255, 255/255, 255/255)
		},
		{
			Content = "rbxassetid://72178328790685",
			Name = "CrimsonLoop",
			ImageColor = Color3.new(255/255, 255/255, 255/255)
		}
	}
} else nil
t2[2] = {
	Name = "NPCs",
	Items = {
		{
			Content = "rbxassetid://126294915699376",
			Name = "Alex",
			NonEvent = true
		},
		{
			Content = "rbxassetid://101491665978269",
			Name = "Aurelia",
			NonEvent = true
		},
		{
			Content = "rbxassetid://78904967956844",
			Name = "Lyric",
			NonEvent = true
		},
		{
			Content = "rbxassetid://128963503899057",
			Name = "Celeste",
			NonEvent = true
		}
	}
}
t2[3] = {
	Name = "Buildings",
	Items = {
		{
			Content = "rbxassetid://112236276326665",
			Name = "Help",
			NonEvent = true
		},
		{
			Content = "rbxassetid://140256161876672",
			Name = "Academy",
			NonEvent = true
		},
		{
			Content = "rbxassetid://127191361018752",
			DisplayName = "Celeste\'s House",
			Name = "CelestesHouse",
			NonEvent = true
		},
		{
			Content = "rbxassetid://86997656353317",
			Name = "Stables",
			NonEvent = true
		},
		{
			Content = "rbxassetid://118520585095174",
			DisplayName = "Celeste\'s Stables",
			Name = "CelestesStable",
			NonEvent = true
		},
		{
			Content = "rbxassetid://114871446156492",
			Name = "TrainingArea",
			NonEvent = true
		},
		{
			Content = "rbxassetid://130457400492377",
			DisplayName = "Celeste\'s Training Area",
			Name = "CelestesTrainingArea",
			NonEvent = true
		},
		{
			Content = "rbxassetid://121629562065216",
			Name = "StableOffice",
			NonEvent = true
		},
		{
			Content = "rbxassetid://16550454602",
			Name = "Shop",
			NonEvent = true
		},
		{
			Content = "rbxassetid://88187435491810",
			Name = "TrailsShop",
			NonEvent = true
		},
		{
			Content = "rbxassetid://73096408972674",
			DisplayName = "Home",
			Name = "PlotMarker",
			NonEvent = true
		},
		{
			Content = "rbxassetid://125969494066975",
			Name = "AchievementHall",
			NonEvent = true
		},
		{
			Content = "rbxassetid://72553944570470",
			Name = "CareCenter",
			NonEvent = true
		},
		{
			Content = "rbxassetid://121022085770586",
			Name = "HorseShrine"
		}
	}
}
t2[4] = {
	Name = "Areas",
	Items = {
		{
			Content = "rbxassetid://73096408972674",
			Name = "Town"
		},
		{
			Content = "rbxassetid://87560366299279",
			Name = "CompetitionHub"
		},
		{
			Name = "Farming",
			Content = "rbxassetid://88198615411050"
		},
		{
			Content = "rbxassetid://117012117476992",
			Name = "BossArena",
			NonEvent = true
		},
		{
			Content = "rbxassetid://85778156819986",
			Name = "RaceTrack",
			NonEvent = true
		},
		{
			Content = "rbxassetid://126420672644199",
			Name = "DigSite",
			NonEvent = true
		},
		{
			Content = "rbxassetid://130417109116464",
			Name = "Dungeon",
			NonEvent = true
		},
		{
			Content = "rbxassetid://124585570899691",
			Name = "Fishing",
			NonEvent = true
		},
		{
			Content = "rbxassetid://119445264499782",
			Name = "Easter",
			NonEvent = true
		}
	}
}
t2[5] = {
	Name = "Miscellaneous",
	Items = {
		{
			Content = "rbxassetid://121977563255751",
			Name = "TamingContest"
		},
		{
			Content = "rbxassetid://120601115530919",
			Name = "CosmeticContest"
		},
		{
			Content = "rbxassetid://16190542177",
			Name = "HorseSpawn"
		},
		{
			Content = "rbxassetid://121280625886070",
			Name = "Minigame"
		},
		{
			Content = "rbxassetid://112236276326665",
			Name = "LostItem",
			NonEvent = true
		},
		{
			Content = "rbxassetid://17671738177",
			Name = "Story",
			NonEvent = true
		},
		{
			Content = "rbxassetid://81484667060908",
			DisplayName = "Marker",
			Name = "MinimapMarker"
		},
		{
			Content = "rbxassetid://85778156819986",
			DisplayName = "Race Queue",
			Name = "Race"
		},
		{
			Content = "rbxassetid://85778156819986",
			DisplayName = "Trail",
			Name = "Trail"
		},
		{
			Content = "rbxassetid://87290534976941",
			DisplayName = "LEGO\194\174",
			Name = "LEGO"
		},
		{
			Content = "rbxassetid://119445264499782",
			DisplayName = "Egg",
			Name = "Egg"
		}
	}
}
return {
	Data = v1,
	Legend = t2
}