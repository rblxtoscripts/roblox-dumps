-- https://lua.expert/
local t = {}
local Debug = require(game.ReplicatedStorage:WaitForChild("Debug"))
local v1 = require(game.ReplicatedStorage:WaitForChild("Enums"))
require(game.ReplicatedStorage._AssetInfoTypes)
if v1.IsServer then
	for i, v in ipairs(workspace.Assets:GetChildren()) do
		v.Parent = script
	end
end
t.UniqueIdIndexedLibrary = {}
local t2 = {
	["822375776"] = {
		Price = 25,
		Name = "\226\157\132\239\184\143Cabin End Table",
		Category = "Tables",
		TableTopItem = true,
		ModelId = 98323547659111,
		AutoUnlocked = true,
		Season = "Winter",
		New = 1766702362
	},
	["252443633"] = {
		Price = 43,
		Name = "\226\157\132\239\184\143Cabin Fireplace",
		Category = "Lights",
		TableTopItem = true,
		ModelId = 95378907902651,
		AutoUnlocked = true,
		Season = "Winter",
		New = 1766702362
	},
	["545457187"] = {
		Price = 48,
		Name = "\226\157\132Cabin Couch",
		Category = "Seats",
		TableTopItem = true,
		ModelId = 88066118439116,
		AutoUnlocked = true,
		Season = "Winter",
		New = 1766702362
	},
	["143815541"] = {
		Price = 31,
		Name = "\226\157\132\239\184\143Cabin Coffee Table",
		Category = "Tables",
		TableTopItem = true,
		ModelId = 109822846381602,
		AutoUnlocked = true,
		Season = "Winter",
		New = 1766702362
	},
	["872540836"] = {
		Price = 34,
		Name = "\226\157\132\239\184\143Cabin Chair",
		Category = "Seats",
		TableTopItem = true,
		ModelId = 130866652708401,
		AutoUnlocked = true,
		Season = "Winter",
		New = 1766702362
	},
	["661617696"] = {
		Price = 33,
		Name = "\226\157\132\239\184\143Cabin Bookshelf",
		Category = "Decoration",
		TableTopItem = true,
		ModelId = 100017712324337,
		AutoUnlocked = true,
		Season = "Winter",
		New = 1766702362
	},
	["150389869"] = {
		Price = 10,
		Name = "Empty Plate",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		ModelId = 13021660644,
		New = 1684178728,
		AutoUnlocked = true
	},
	["383848838"] = {
		Price = 15,
		Name = "Breakfast Meal",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		ModelId = 13021611562,
		New = 1684178728,
		AutoUnlocked = true
	},
	["168109484"] = {
		Price = 15,
		Name = "Plate of Cookies",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		ModelId = 13021688332,
		New = 1684178728,
		AutoUnlocked = true
	},
	["895948943"] = {
		Price = 15,
		Name = "Lobster Meal",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		ModelId = 13021695761,
		New = 1684178728,
		AutoUnlocked = true
	},
	["672523523"] = {
		Price = 15,
		Name = "Cake",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		ModelId = 13021739166,
		New = 1684178728,
		AutoUnlocked = true
	},
	["150489844"] = {
		Price = 15,
		Name = "Spaghetti Meal",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		ModelId = 13021700930,
		New = 1684178728,
		AutoUnlocked = true
	},
	["495039283"] = {
		Price = 15,
		Name = "Fruit Bowl",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		ModelId = 13021710105,
		New = 1684178728,
		AutoUnlocked = true
	},
	["108498904"] = {
		Price = 15,
		Name = "Hamburger Meal",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		ModelId = 13021717566,
		New = 1684178728,
		AutoUnlocked = true
	},
	["867837294"] = {
		Price = 150,
		Name = "Wood Toilet",
		Category = "Kitchen/Bath",
		ModelId = 13021586669,
		New = 1684178728,
		AutoUnlocked = true
	},
	["118787494"] = {
		Price = 20,
		Name = "Cutting Board",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		ModelId = 13118567970,
		New = 1684178728,
		AutoUnlocked = true
	},
	["788359433"] = {
		Price = 25,
		Name = "Bathroom Trashcan",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		ModelId = 13021654785,
		New = 1684178728,
		AutoUnlocked = true
	},
	["199495784"] = {
		Price = 30,
		Name = "Towel Stack",
		Category = "Decoration",
		TableTopItem = true,
		ModelId = 13021624258,
		New = 1684178728,
		AutoUnlocked = true
	},
	["185809878"] = {
		Price = 25,
		Name = "Globe",
		Category = "Decoration",
		TableTopItem = true,
		ModelId = 13021648224,
		New = 1684178728,
		AutoUnlocked = true
	},
	["996858893"] = {
		Price = 35,
		Name = "Wall Mirror",
		Category = "Decoration",
		TableTopItem = true,
		ModelId = 13021668583,
		New = 1684178728,
		AutoUnlocked = true
	},
	["199848544"] = {
		Price = 45,
		Name = "World Map",
		Category = "Decoration",
		TableTopItem = true,
		ModelId = 13021679167,
		New = 1684178728,
		AutoUnlocked = true
	},
	["765898982"] = {
		Price = 18,
		Name = "Brass Coat Hanger",
		Category = "Decoration",
		TableTopItem = true,
		ModelId = 13021720729,
		New = 1684178728,
		AutoUnlocked = true
	},
	["158040848"] = {
		Price = 55,
		Name = "Ceiling Fan",
		Category = "Decoration",
		TableTopItem = true,
		ModelId = 13021725559,
		New = 1684178728,
		AutoUnlocked = true,
		PhysicsBlacklisted = true
	},
	["150949843"] = {
		Price = 19,
		Name = "Table Fan",
		Category = "Decoration",
		TableTopItem = true,
		ModelId = 13021729638,
		New = 1684178728,
		AutoUnlocked = true,
		PhysicsBlacklisted = true
	},
	["671814572"] = {
		Price = 590,
		Name = "Record Player",
		Category = "Customization",
		TableTopItem = true,
		ModelId = 13021752906,
		New = 1684178728,
		AutoUnlocked = true
	},
	["725535867"] = {
		Price = 35,
		Name = "Trash Can",
		Category = "Decoration",
		TableTopItem = true,
		ModelId = 13021765969,
		New = 1684178728,
		AutoUnlocked = true
	},
	["785656455"] = {
		Price = 21,
		Name = "Stack of Books",
		Category = "Decoration",
		TableTopItem = true,
		ModelId = 13021781192,
		New = 1684178728,
		AutoUnlocked = true
	},
	["898756599"] = {
		Price = 12,
		Name = "Pen and Paper",
		Category = "Decoration",
		TableTopItem = true,
		ModelId = 13021786288,
		New = 1684178728,
		AutoUnlocked = true
	},
	["6210084708"] = {
		Price = 41,
		Name = "Green Screen",
		Category = "Entertainment",
		Rarity = "Uncommon",
		PresentType = "Movie",
		Discontinued = true
	},
	["6210086257"] = {
		Price = 20,
		Name = "Movie Star Light",
		Category = "Lights",
		TableTopItem = true,
		Rarity = "Uncommon",
		PresentType = "Movie",
		Discontinued = true
	},
	["6210088454"] = {
		Price = 40,
		Name = "Movie Star Wardrobe",
		Category = "Decoration",
		TableTopItem = true,
		Rarity = "Uncommon",
		PresentType = "Movie",
		Discontinued = true
	},
	["6210089872"] = {
		Price = 25,
		Name = "Director\'s Chair",
		Category = "Seats",
		TableTopItem = true,
		Rarity = "Uncommon",
		PresentType = "Movie",
		Discontinued = true
	},
	["6210114379"] = {
		Price = 32,
		Name = "Stage Lights",
		Category = "Lights",
		TableTopItem = true,
		Rarity = "Uncommon",
		PresentType = "Movie",
		Discontinued = true
	},
	["6210091441"] = {
		Price = 28,
		Name = "Movie Star Camera",
		Category = "Entertainment",
		Rarity = "Uncommon",
		TableTopItem = true,
		PresentType = "Movie",
		Discontinued = true
	},
	["6210092834"] = {
		Price = 23,
		Name = "Theater Seat",
		Category = "Seats",
		Rarity = "Uncommon",
		PresentType = "Movie",
		Discontinued = true
	},
	["5777995616"] = {
		Price = 30,
		Name = "Mr Builder Plushie",
		Category = "Decoration",
		New = 1601045076,
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true
	},
	["5987434983"] = {
		Price = 30,
		Name = "Mia Plushie",
		Category = "Decoration",
		New = 1601045076,
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		ModelId = 15620071068
	},
	["5705863697"] = {
		Price = 41,
		Name = "Captain\'s Chest",
		Category = "Seats",
		New = 1601045076,
		AutoUnlocked = true,
		BannedInChina = true
	},
	["5705922839"] = {
		Price = 35,
		Name = "Captain\'s Wheel",
		Category = "Tables",
		New = 1601045076,
		AutoUnlocked = true,
		BannedInChina = true
	},
	["5706452164"] = {
		Price = 25,
		Name = "Palm Tree",
		Category = "Decoration",
		TableTopItem = true,
		New = 1601045076,
		AutoUnlocked = true,
		BannedInChina = true
	},
	["5706475486"] = {
		Price = 16,
		Name = "Captain\'s Barrel",
		Category = "Seats",
		TableTopItem = true,
		New = 1601045076,
		AutoUnlocked = true,
		BannedInChina = true
	},
	["5706846831"] = {
		Price = 55,
		Name = "Captain\'s Ship",
		Category = "Beds",
		New = 1601045076,
		AutoUnlocked = true,
		BannedInChina = true
	},
	["4537881197"] = {
		Price = 95,
		Name = "Traffic Light",
		Category = "Decoration",
		TableTopItem = true,
		Unsellable = true,
		Discontinued = true,
		Year = 2019
	},
	["4532074010"] = {
		Price = 95,
		Name = "The floor is lava!",
		Category = "Entertainment",
		TableTopItem = true,
		Unsellable = true,
		Discontinued = true,
		Year = 2019
	},
	["4521620501"] = {
		Price = 95,
		Name = "Connect 4",
		Category = "Entertainment",
		Discontinued = true,
		Unsellable = true,
		Year = 2019
	},
	["4531584703"] = {
		Price = 95,
		Name = "Noob Punching Bag",
		Discontinued = true,
		Category = "Entertainment",
		Unsellable = true,
		Year = 2019,
		PhysicsBlacklisted = true
	},
	["4524274899"] = {
		Price = 20,
		Name = "\240\159\142\132Holiday Tree",
		Category = "Seasonal",
		Holiday = "Christmas",
		AutoUnlocked = true
	},
	["4514966357"] = {
		Price = 25,
		Name = "\240\159\142\132Santa\'s Sleigh",
		Category = "Seasonal",
		TableTopItem = true,
		AutoUnlocked = true,
		Holiday = "Christmas",
		Memory = 0.2
	},
	["4514968449"] = {
		Price = 13,
		Name = "\240\159\142\132Nutcracker",
		Category = "Seasonal",
		TableTopItem = true,
		AutoUnlocked = true,
		Holiday = "Christmas",
		Memory = 0.2
	},
	["4514969391"] = {
		Price = 7,
		Name = "\240\159\142\132Stocking",
		Category = "Seasonal",
		TableTopItem = true,
		AutoUnlocked = true,
		Holiday = "Christmas",
		Memory = 0.2
	},
	["4514970446"] = {
		Price = 6,
		Name = "\240\159\142\132Christmas Bells",
		Category = "Seasonal",
		TableTopItem = true,
		AutoUnlocked = true,
		Holiday = "Christmas",
		Memory = 0.2
	},
	["4514970152"] = {
		Price = 9,
		Name = "\240\159\142\132Christmas Wreath",
		Category = "Seasonal",
		TableTopItem = true,
		AutoUnlocked = true,
		Holiday = "Christmas",
		Memory = 0.2
	},
	["4514970920"] = {
		Price = 5,
		Name = "\240\159\142\132Christmas Bowtie",
		Category = "Seasonal",
		TableTopItem = true,
		AutoUnlocked = true,
		Holiday = "Christmas",
		Memory = 0.2
	},
	["4514971325"] = {
		Price = 10,
		Name = "\240\159\142\132Christmas Lights",
		Category = "Seasonal",
		TableTopItem = true,
		AutoUnlocked = true,
		Holiday = "Christmas",
		New = 1639734831,
		Memory = 0.2
	},
	["4515182923"] = {
		Price = 9,
		Name = "\240\159\142\132Christmas Candles",
		Category = "Seasonal",
		TableTopItem = true,
		AutoUnlocked = true,
		Holiday = "Christmas",
		Memory = 0.2
	},
	["4514966830"] = {
		Price = 12,
		Name = "\240\159\142\132Wooden Wall Sleigh",
		Category = "Seasonal",
		TableTopItem = true,
		AutoUnlocked = true,
		Season = "Winter"
	},
	["4514968822"] = {
		Price = 14,
		Name = "\240\159\142\132Lil Snowman",
		Category = "Seasonal",
		TableTopItem = true,
		AutoUnlocked = true,
		Season = "Winter"
	},
	["8210943311"] = {
		Price = 15,
		Name = "\240\159\142\132Milk and Cookies",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Christmas",
		TableTopItem = true,
		Discontinued = true,
		Memory = 0.2
	},
	["8210945242"] = {
		Price = 21,
		Name = "\240\159\142\132Gingerbread House",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Christmas",
		TableTopItem = true,
		Discontinued = true,
		Memory = 0.2
	},
	["8210948203"] = {
		Price = 60,
		Name = "\240\159\142\132Santa\'s Throne",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Christmas",
		Discontinued = true
	},
	["8210949886"] = {
		Price = 25,
		Name = "\240\159\142\132Candy Canes",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Christmas",
		TableTopItem = true,
		Discontinued = true,
		Memory = 0.2
	},
	["8210951182"] = {
		Price = 80,
		Name = "\240\159\142\132Christmas Fireplace",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Christmas",
		Discontinued = true
	},
	["8210953382"] = {
		Price = 26,
		Name = "\240\159\142\132Snowglobe",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Christmas",
		TableTopItem = true,
		Discontinued = true,
		Memory = 0.2
	},
	["8210958121"] = {
		Price = 21,
		Name = "\240\159\142\132Gifts",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Christmas",
		TableTopItem = true,
		Discontinued = true,
		Memory = 0.2
	},
	["8210959928"] = {
		Price = 41,
		Name = "\240\159\142\132North Pole Lantern",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Christmas",
		TableTopItem = true,
		Discontinued = true
	},
	["8210961637"] = {
		Price = 75,
		Name = "\240\159\142\132Bell Christmas Tree",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Christmas",
		TableTopItem = true,
		Discontinued = true
	},
	["6024437213"] = {
		Price = 44,
		Name = "\240\159\142\132Santa\'s Couch",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2020,
		Discontinued = true
	},
	["6030759293"] = {
		Price = 35,
		Name = "\240\159\142\132Santa\'s Table",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2020,
		Discontinued = true
	},
	["6030762867"] = {
		Price = 21,
		Name = "\240\159\142\132Santa\'s Tv Stand",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2020,
		Discontinued = true
	},
	["6030818812"] = {
		Price = 19,
		Name = "\240\159\142\132Santa\'s Chair",
		Category = "Seasonal",
		TableTopItem = true,
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2020,
		Discontinued = true
	},
	["6030764085"] = {
		Price = 40,
		Name = "\240\159\142\132Santa\'s Desk",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2020,
		Discontinued = true
	},
	["6030798397"] = {
		Price = 52,
		Name = "\240\159\142\132Santa\'s Bed",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2020,
		Discontinued = true
	},
	["6030768718"] = {
		Price = 60,
		Name = "\240\159\142\132Santa\'s Piano",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2020,
		Discontinued = true
	},
	["8134238652"] = {
		Price = 20,
		Name = "\240\159\142\132Dessert Display",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		TableTopItem = true,
		Year = 2021,
		Discontinued = true
	},
	["8134242723"] = {
		Price = 25,
		Name = "\240\159\142\132Pizza Tree",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2021,
		Discontinued = true
	},
	["8134250541"] = {
		Price = 30,
		Name = "\240\159\142\132Reindeer Rug",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		TableTopItem = true,
		Year = 2021,
		Discontinued = true
	},
	["8134252078"] = {
		Price = 35,
		Name = "\240\159\142\132Present Bookshelf",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2021,
		Discontinued = true
	},
	["8134255477"] = {
		Price = 40,
		Name = "\240\159\142\132Frozen Chandelier",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2021,
		Discontinued = true
	},
	["8134258164"] = {
		Price = 45,
		Name = "\240\159\142\132Candy Cane Chair",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		TableTopItem = true,
		Year = 2021,
		Discontinued = true
	},
	["8134260503"] = {
		Price = 50,
		Name = "\240\159\142\132Festive Igloo",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2021,
		Discontinued = true
	},
	["715754356"] = {
		ModelId = 11703144600,
		Price = 20,
		Name = "\240\159\142\132Festive Tree",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		TableTopItem = true,
		Year = 2022,
		Discontinued = true,
		Unsellable = true
	},
	["173574928"] = {
		ModelId = 11703143967,
		Price = 20,
		Name = "\240\159\142\132Festive Lantern",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		TableTopItem = true,
		Year = 2022,
		Discontinued = true,
		Unsellable = true
	},
	["289356756"] = {
		ModelId = 11703143466,
		Price = 20,
		Name = "\240\159\142\132Festive Couch",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2022,
		Discontinued = true,
		Unsellable = true
	},
	["924676675"] = {
		ModelId = 11703142470,
		Price = 20,
		Name = "\240\159\142\132Festive Coco",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		TableTopItem = true,
		Year = 2022,
		Discontinued = true,
		Unsellable = true
	},
	["754895696"] = {
		ModelId = 11703141230,
		Price = 20,
		Name = "\240\159\142\132Festive Bed",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2022,
		Discontinued = true,
		Unsellable = true
	},
	["965916002"] = {
		ModelId = 11703141758,
		Price = 20,
		Name = "\240\159\142\132Festive Train",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		TableTopItem = true,
		Year = 2022,
		Discontinued = true,
		Unsellable = true
	},
	["289677564"] = {
		ModelId = 11703142899,
		Price = 20,
		Name = "\240\159\142\132Festive Fireplace",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Year = 2022,
		Discontinued = true,
		Unsellable = true
	},
	["736209484"] = {
		ModelId = 15475674024,
		Price = 20,
		Name = "\240\159\142\132Christmas Tree 2",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TableTopItem = true,
		Year = 2023,
		Unsellable = true
	},
	["946453536"] = {
		ModelId = 15475619675,
		Price = 20,
		Name = "\240\159\142\132Inflatable Santa",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		Year = 2023,
		Unsellable = true
	},
	["945675566"] = {
		ModelId = 15475624094,
		Price = 20,
		Name = "\240\159\142\132Gingerbread House Shrinker",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TableTopItem = true,
		Year = 2023,
		Unsellable = true
	},
	["935464576"] = {
		ModelId = 15475630405,
		Price = 20,
		Name = "Googly Boomba",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TableTopItem = true,
		Year = 2023,
		Unsellable = true
	},
	["394567456"] = {
		ModelId = 15475633930,
		Price = 20,
		Name = "\240\159\142\132Let it snow",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TableTopItem = true,
		Year = 2023,
		Unsellable = true
	},
	["678456323"] = {
		ModelId = 15475649611,
		Price = 20,
		Name = "Checkers",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		Year = 2023,
		Unsellable = true
	},
	["784521434"] = {
		ModelId = 127487570861331,
		Price = 20,
		Name = "\240\159\142\132Realistic Christmas Tree",
		Category = "Seasonal",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = true,
		Year = 2024,
		Unsellable = true
	},
	["675435768"] = {
		ModelId = 134705209772851,
		Price = 20,
		Name = "Telescope",
		Category = "Decoration",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = true,
		Year = 2024,
		Unsellable = true
	},
	["652534849"] = {
		ModelId = 133349841543664,
		Price = 20,
		Name = "Bounce Mushroom",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = true,
		Year = 2024,
		Unsellable = true,
		PhysicsBlacklisted = true
	},
	["293545652"] = {
		ModelId = 121410754171197,
		Price = 20,
		Name = "Pond",
		Category = "Decoration",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = true,
		Year = 2024,
		Unsellable = true
	},
	["767464647"] = {
		ModelId = 86426032483926,
		Price = 20,
		Name = "Bouncy Ball",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = true,
		Year = 2024,
		Unsellable = true,
		PhysicsBlacklisted = true
	},
	["582574955"] = {
		ModelId = 72442221998189,
		Price = 20,
		Name = "Secret Bookshelf",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		Year = 2024,
		Unsellable = true
	},
	["978970876"] = {
		ModelId = 78465083480550,
		Price = 20,
		Name = "Upright Piano",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = true,
		Year = 2024,
		Unsellable = true
	},
	["929787324"] = {
		ModelId = 84602359141665,
		Price = 20,
		Name = "Remote Cars Set",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = true,
		Year = 2025,
		Unsellable = true
	},
	["431438343"] = {
		ModelId = 86159259301876,
		Price = 20,
		Name = "Yeti Flow Soda Machine",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = false,
		Year = 2025,
		Unsellable = true
	},
	["419640094"] = {
		ModelId = 136168717017038,
		Price = 20,
		Name = "Icon Sliding Puzzle",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = true,
		Year = 2025,
		Unsellable = true
	},
	["489176716"] = {
		ModelId = 117602877249838,
		Price = 20,
		Name = "Punch Me Noob",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = true,
		Year = 2025,
		Unsellable = true,
		PhysicsBlacklisted = true
	},
	["510936419"] = {
		ModelId = 94878271188688,
		Price = 20,
		Name = "Retro Nostalgia TV",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = true,
		Year = 2025,
		Unsellable = true
	},
	["312184865"] = {
		ModelId = 104026069344608,
		Price = 20,
		Name = "Whac-A-Mole",
		Category = "Entertainment",
		DontSpawnAtDump = true,
		DontSpawnInPresents = true,
		Discontinued = true,
		TestItem = true,
		TableTopItem = true,
		Year = 2025,
		Unsellable = true
	},
	["4659387345"] = {
		ModelId = 17421788102,
		Price = 1500,
		Name = "Pizza Rain Block",
		Category = "Customization",
		TableTopItem = true,
		Rarity = "Legendary"
	},
	["6549839724"] = {
		ModelId = 17418271336,
		Price = 1500,
		Name = "Pizza Boy",
		Category = "Decoration",
		TableTopItem = true,
		Rarity = "Legendary"
	},
	["4514969796"] = {
		Price = 31,
		Name = "Victorian Street Lantern",
		Category = "Lights",
		TableTopItem = true,
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4323142037"] = {
		Price = 24,
		Name = "Victorian End Table",
		Category = "Tables",
		TableTopItem = true,
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4323138801"] = {
		Price = 21,
		Name = "Victorian Lamp Table",
		Category = "Tables",
		TableTopItem = true,
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4323124960"] = {
		Price = 27,
		Name = "Victorian Lamp",
		Category = "Lights",
		TableTopItem = true,
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4318181564"] = {
		Price = 42,
		Name = "Victorian Lounge Chair",
		Category = "Seats",
		TableTopItem = true,
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4318176323"] = {
		Price = 25,
		Name = "Victorian Dinner Seat",
		Category = "Seats",
		TableTopItem = true,
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4318172802"] = {
		Price = 35,
		Name = "Victorian Bookshelf",
		Category = "Decoration",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4318169979"] = {
		Price = 35,
		Name = "Victorian Wardrobe",
		Category = "Decoration",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4318162438"] = {
		Price = 13,
		Name = "Victorian Mounted Candles",
		Category = "Lights",
		TableTopItem = true,
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4318160008"] = {
		Price = 36,
		Name = "Victorian Dinner Table",
		Category = "Tables",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4318155367"] = {
		Price = 41,
		Name = "Victorian Marble Table",
		Category = "Tables",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4318153180"] = {
		Price = 43,
		Name = "Victorian Couch",
		Category = "Seats",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4318150819"] = {
		Price = 21,
		Name = "Victorian Dresser",
		Category = "Decoration",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4308435452"] = {
		Price = 47,
		Name = "Victorian Master Bed",
		Category = "Beds",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4515275986"] = {
		Price = 23,
		Name = "Victorian Marbled Countertop",
		Category = "Kitchen/Bath",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4515276339"] = {
		Price = 26,
		Name = "Victorian Wooden Stove",
		Category = "Kitchen/Bath",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4515276882"] = {
		Price = 34,
		Name = "Victorian Wooden Fridge",
		Category = "Kitchen/Bath",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4515277412"] = {
		Price = 22,
		Name = "Victorian Toilet",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4515279612"] = {
		Price = 27,
		Name = "Victorian Bath",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4515280446"] = {
		Price = 20,
		Name = "Victorian Bathroom Sink",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4515285461"] = {
		Price = 24,
		Name = "Victorian Marbled Sink",
		Category = "Kitchen/Bath",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4504309001"] = {
		Price = 58,
		Name = "Victorian Chandelier",
		Category = "Lights",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true
	},
	["4323871952"] = {
		Price = 20,
		Name = "Victorian Floral Wallpaper",
		Category = "Walls",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true,
		Discontinued = true
	},
	["4178103986"] = {
		Price = 17,
		Name = "Victorian Wooden Floor",
		Category = "Floors",
		Unsellable = true,
		GamepassId = "VictorianUnlimitedSet",
		AutoUnlocked = true,
		Discontinued = true
	},
	["734754645"] = {
		Price = 12,
		Name = "\240\159\141\130Autumn String Lights",
		Category = "Lights",
		GamepassId = "AutumnBundle",
		TableTopItem = true,
		ModelId = 126193261833072,
		AutoUnlocked = true
	},
	["729384734"] = {
		Price = 19,
		Name = "\240\159\141\130Autumn Lamp",
		Category = "Lights",
		GamepassId = "AutumnBundle",
		TableTopItem = true,
		ModelId = 120028085469017,
		AutoUnlocked = true
	},
	["672349085"] = {
		Price = 30,
		Name = "\240\159\141\130Autumn Coffee Table",
		Category = "Tables",
		GamepassId = "AutumnBundle",
		TableTopItem = true,
		ModelId = 133435599141400,
		AutoUnlocked = true
	},
	["968596735"] = {
		Price = 31,
		Name = "\240\159\141\130Autumn Bookshelf",
		Category = "Decoration",
		GamepassId = "AutumnBundle",
		ModelId = 83831861248548,
		AutoUnlocked = true
	},
	["940375667"] = {
		Price = 50,
		Name = "\240\159\141\130Autumn Couch",
		Category = "Seats",
		GamepassId = "AutumnBundle",
		ModelId = 94460422388049,
		AutoUnlocked = true
	},
	["519751974"] = {
		Price = 17,
		Name = "\240\159\141\130Autumn Small Coffee Table",
		Category = "Tables",
		GamepassId = "AutumnBundle",
		TableTopItem = true,
		ModelId = 84185074138238,
		AutoUnlocked = true
	},
	["930945680"] = {
		Price = 45,
		Name = "\240\159\141\130Autumn Leaf Rug",
		Category = "Decoration",
		GamepassId = "AutumnBundle",
		TableTopItem = true,
		ModelId = 80729612735442,
		AutoUnlocked = true
	},
	["789677676"] = {
		Price = 27,
		Name = "\240\159\141\130Autumn End Table",
		Category = "Tables",
		GamepassId = "AutumnBundle",
		TableTopItem = true,
		ModelId = 117850817433300,
		AutoUnlocked = true
	},
	["564583549"] = {
		Price = 28,
		Name = "\240\159\142\131Gothic Door",
		Category = "Doors",
		GamepassId = "HalloweenBundle",
		ModelId = 133052476504146,
		AutoUnlocked = true
	},
	["736734786"] = {
		Price = 36,
		Name = "\240\159\142\131Gothic Fireplace",
		Category = "Lights",
		GamepassId = "HalloweenBundle",
		ModelId = 134776537366115,
		AutoUnlocked = true
	},
	["634567878"] = {
		Price = 17,
		Name = "\240\159\142\131Gothic Bookshelf",
		Category = "Decoration",
		GamepassId = "HalloweenBundle",
		ModelId = 92442163150702,
		AutoUnlocked = true
	},
	["738357936"] = {
		Price = 27,
		Name = "\240\159\142\131Gothic Chandelier",
		Category = "Lights",
		TableTopItem = true,
		GamepassId = "HalloweenBundle",
		ModelId = 120855345730838,
		AutoUnlocked = true
	},
	["463838957"] = {
		Price = 21,
		Name = "\240\159\142\131Gothic Candelabra",
		Category = "Lights",
		TableTopItem = true,
		GamepassId = "HalloweenBundle",
		ModelId = 80433563991204,
		AutoUnlocked = true
	},
	["753783589"] = {
		Price = 23,
		Name = "\240\159\142\131Gothic Seat",
		Category = "Seats",
		TableTopItem = true,
		GamepassId = "HalloweenBundle",
		ModelId = 88471817308284,
		AutoUnlocked = true
	},
	["903743673"] = {
		Price = 27,
		Name = "\240\159\142\131Gothic Armchair",
		Category = "Seats",
		TableTopItem = true,
		GamepassId = "HalloweenBundle",
		ModelId = 116890603255421,
		AutoUnlocked = true
	},
	["367946745"] = {
		Price = 15,
		Name = "\240\159\142\131Gothic Serving Table",
		Category = "Tables",
		TableTopItem = true,
		GamepassId = "HalloweenBundle",
		ModelId = 123752633273678,
		AutoUnlocked = true
	},
	["923454630"] = {
		Price = 22,
		Name = "\240\159\142\131Gothic Desk",
		Category = "Tables",
		GamepassId = "HalloweenBundle",
		ModelId = 113283482050607,
		AutoUnlocked = true
	},
	["590496574"] = {
		Price = 18,
		Name = "\240\159\142\131Gothic Vanity",
		Category = "Decoration",
		TableTopItem = true,
		GamepassId = "HalloweenBundle",
		ModelId = 121722893449892,
		AutoUnlocked = true
	},
	["136713574"] = {
		Price = 16,
		Name = "\240\159\142\131Gothic Separator",
		Category = "Decoration",
		TableTopItem = true,
		GamepassId = "HalloweenBundle",
		ModelId = 101034796352263,
		AutoUnlocked = true
	},
	["889206850"] = {
		Price = 16,
		Name = "\240\159\142\132Christmas Sofa",
		Category = "Seats",
		TableTopItem = true,
		GamepassId = "Cabin",
		ModelId = 119752610166670,
		AutoUnlocked = true
	},
	["651191705"] = {
		Price = 16,
		Name = "\240\159\142\132Christmas Bed",
		Category = "Beds",
		TableTopItem = true,
		GamepassId = "Cabin",
		ModelId = 94053280915597,
		AutoUnlocked = true
	},
	["2505670244"] = {
		Price = 23,
		Name = "\240\159\142\131Tombstone",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Halloween",
		TableTopItem = true,
		BannedInChina = true,
		Discontinued = true
	},
	["2505809508"] = {
		Price = 40,
		Name = "\240\159\142\131Spider Bed",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Halloween",
		BannedInChina = true,
		Discontinued = true
	},
	["2506157527"] = {
		Price = 50,
		Name = "\240\159\142\131Coffin",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Halloween",
		Discontinued = true,
		BannedInChina = true
	},
	["2509212740"] = {
		Price = 23,
		Name = "\240\159\142\131Witch\'s Brew",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Halloween",
		BannedInChina = true,
		Discontinued = true
	},
	["2510414933"] = {
		Price = 20,
		Name = "\240\159\142\131Harmless Chair",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Halloween",
		BannedInChina = true,
		Discontinued = true
	},
	["5835662657"] = {
		Price = 40,
		Name = "\240\159\142\131Boo in The Box",
		Category = "Seasonal",
		Discontinued = true,
		BannedInChina = true,
		Unsellable = true,
		Year = 2020
	},
	["5835665154"] = {
		Price = 30,
		Name = "\240\159\142\131Mr. Skeleton",
		Category = "Seasonal",
		Discontinued = true,
		BannedInChina = true,
		Unsellable = true,
		Year = 2020
	},
	["5835680400"] = {
		Price = 10,
		Name = "\240\159\142\131Hanging Spiders",
		Category = "Seasonal",
		Discontinued = true,
		BannedInChina = true,
		Unsellable = true,
		TableTopItem = true,
		Year = 2020
	},
	["5835675259"] = {
		Price = 20,
		Name = "\240\159\142\131Demon Fan",
		Category = "Seasonal",
		Discontinued = true,
		BannedInChina = true,
		Unsellable = true,
		TableTopItem = true,
		Year = 2020,
		PhysicsBlacklisted = true
	},
	["5835704917"] = {
		Price = 20,
		Name = "\240\159\142\131Witch\'s Brewing Station",
		Category = "Seasonal",
		Discontinued = true,
		BannedInChina = true,
		Unsellable = true,
		Year = 2020
	},
	["7850791382"] = {
		Price = 23,
		Name = "\240\159\142\131Pumpkin Witch Lamp",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		Year = 2021
	},
	["7850797974"] = {
		Price = 23,
		Name = "\240\159\142\131Cyclops Couch",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		Year = 2021
	},
	["7850804212"] = {
		Price = 23,
		Name = "\240\159\142\131Ghostly Bed",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		Year = 2021
	},
	["7850828646"] = {
		Price = 23,
		Name = "\240\159\142\131Skeleton Chair",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		Year = 2021
	},
	["7850830091"] = {
		Price = 23,
		Name = "\240\159\142\131Skull Armchair",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		Year = 2021
	},
	["790258702"] = {
		ModelId = 11331317125,
		Price = 23,
		Name = "\240\159\142\131Cat Lamp",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Year = 2022
	},
	["118059804"] = {
		ModelId = 11331313855,
		Price = 23,
		Name = "\240\159\142\131Cat Couch",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		Year = 2022
	},
	["725098016"] = {
		ModelId = 11331315084,
		Price = 23,
		Name = "\240\159\142\131Cat Crystal Ball",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Year = 2022
	},
	["602980495"] = {
		ModelId = 11331312938,
		Price = 23,
		Name = "\240\159\142\131Cat Mirror",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		Year = 2022
	},
	["282098565"] = {
		ModelId = 11331317812,
		Price = 23,
		Name = "\240\159\142\131Cat TV",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		Year = 2022
	},
	["562829262"] = {
		ModelId = 11331310375,
		Price = 23,
		Name = "\240\159\142\131Cat Bed",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		Year = 2022
	},
	["945203984"] = {
		ModelId = 15069581999,
		Price = 23,
		Name = "\240\159\142\131Caramel Apples",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Year = 2023
	},
	["782920584"] = {
		ModelId = 15069591176,
		Price = 23,
		Name = "\240\159\142\131Festive Flowers",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Year = 2023
	},
	["528983494"] = {
		ModelId = 15069584441,
		Price = 23,
		Name = "\240\159\142\131Festive Candles",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Year = 2023
	},
	["274574562"] = {
		ModelId = 15069593812,
		Price = 23,
		Name = "\240\159\142\131Wizard Fish",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Year = 2023
	},
	["987467565"] = {
		ModelId = 15069596465,
		Price = 23,
		Name = "\240\159\142\131Gothic Chair",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Year = 2023
	},
	["289674535"] = {
		ModelId = 15069607548,
		Price = 23,
		Name = "\240\159\142\131Spider Table",
		Category = "Seasonal",
		BannedInChina = true,
		Discontinued = true,
		Unsellable = true,
		Year = 2023
	},
	["674645647"] = {
		ModelId = 88394254878803,
		Price = 23,
		Name = "\240\159\142\131Pumpkin Table",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2024,
		TableTopItem = true
	},
	["265094858"] = {
		ModelId = 135864527573674,
		Price = 23,
		Name = "\240\159\142\131Pumpkin Chair",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2024,
		TableTopItem = true
	},
	["457586754"] = {
		ModelId = 138870307446270,
		Price = 23,
		Name = "\240\159\142\131Vampire Couch",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2024,
		TableTopItem = true
	},
	["785763458"] = {
		ModelId = 108951716377478,
		Price = 23,
		Name = "\240\159\142\131Vampire Bookshelf",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2024,
		TableTopItem = true
	},
	["765673463"] = {
		ModelId = 93942239109052,
		Price = 23,
		Name = "\240\159\142\131Vampire Chandelier",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2024,
		TableTopItem = true
	},
	["374564563"] = {
		ModelId = 127219656723134,
		Price = 23,
		Name = "\240\159\142\131Vampire Bed",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2024,
		TableTopItem = true
	},
	["473369755"] = {
		ModelId = 90898246277118,
		Price = 23,
		Name = "\240\159\142\131Haunted Attic Door",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2025,
		TableTopItem = true,
		TestItem = true
	},
	["547204787"] = {
		ModelId = 97812051895223,
		Price = 23,
		Name = "\240\159\142\131Witches Brew Soda Machine",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2025,
		TableTopItem = false,
		TestItem = true
	},
	["760716529"] = {
		ModelId = 113145884878069,
		Price = 23,
		Name = "\240\159\142\131Skeletal Xylophone",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2025,
		TableTopItem = true,
		TestItem = true
	},
	["407937724"] = {
		ModelId = 120259856474202,
		Price = 23,
		Name = "\240\159\142\131Gourd Fireplace",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2025,
		TableTopItem = true,
		TestItem = true
	},
	["742667291"] = {
		ModelId = 114124596159744,
		Price = 23,
		Name = "\240\159\142\131Gourd Chair",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2025,
		TableTopItem = true,
		TestItem = true
	},
	["547503627"] = {
		ModelId = 101820154694337,
		Price = 23,
		Name = "\240\159\142\131Spider Web",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		Year = 2025,
		TableTopItem = true,
		TestItem = true
	},
	["187792383"] = {
		Price = 45,
		Name = "\240\159\166\131Turkey",
		Category = "Seasonal",
		Memory = 0.2,
		Holiday = "Thanksgiving",
		AutoUnlocked = true
	},
	["187792286"] = {
		Price = 40,
		Name = "\240\159\166\131Thanksgiving Table",
		Category = "Seasonal",
		Memory = 0.2,
		Holiday = "Thanksgiving",
		AutoUnlocked = true
	},
	["187792204"] = {
		Price = 36,
		Name = "\240\159\166\131Cooked Turkey",
		Category = "Seasonal",
		Memory = 0.2,
		Holiday = "Thanksgiving",
		AutoUnlocked = true
	},
	["190221433"] = {
		Price = 12,
		Name = "\240\159\142\132Wreath",
		Category = "Seasonal",
		Memory = 0.2,
		Holiday = "Christmas",
		AutoUnlocked = true
	},
	["190221245"] = {
		Price = 19,
		Name = "\240\159\142\132Snowman",
		Category = "Seasonal",
		Memory = 0.2,
		Holiday = "Christmas",
		AutoUnlocked = true
	},
	["190220906"] = {
		Price = 17,
		Name = "\240\159\142\132Hanukkah Candles",
		Category = "Seasonal",
		Memory = 0.2,
		Holiday = "Christmas",
		AutoUnlocked = true
	},
	["190220698"] = {
		Price = 14,
		Name = "\240\159\142\132Christmas Tree",
		Category = "Seasonal",
		Memory = 0.2,
		Holiday = "Christmas",
		AutoUnlocked = true
	},
	["305587034"] = {
		Price = 15,
		Name = "\240\159\142\131Treat Bowl",
		Category = "Seasonal",
		Memory = 0.2,
		Holiday = "Halloween",
		AutoUnlocked = true,
		BannedInChina = true
	},
	["305586703"] = {
		Price = 24,
		Name = "\240\159\142\131Jack-O-Lantern",
		Category = "Seasonal",
		Memory = 0.2,
		Holiday = "Halloween",
		AutoUnlocked = true,
		BannedInChina = true
	},
	["4433899977"] = {
		Price = 30,
		Name = "\240\159\166\131Turkey Ceiling Fan",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Thanksgiving",
		Discontinued = true,
		PhysicsBlacklisted = true
	},
	["4434016846"] = {
		Price = 31,
		Name = "\240\159\166\131Turkey\'s Head Lamp",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		PresentType = "Thanksgiving",
		Discontinued = true
	},
	["4434136274"] = {
		Price = 21,
		Name = "\240\159\166\131The Big Turkey",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Thanksgiving",
		Discontinued = true
	},
	["4434198404"] = {
		Price = 20,
		Name = "\240\159\166\131Turkey Dinner",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Thanksgiving",
		TableTopItem = true,
		Discontinued = true
	},
	["4435055322"] = {
		Price = 30,
		Name = "\240\159\166\131Pumpkin Juice",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		PresentType = "Thanksgiving",
		Discontinued = true
	},
	["4447232194"] = {
		Price = 45,
		Name = "\240\159\166\131Candelabra",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Thanksgiving",
		TableTopItem = true,
		Discontinued = true
	},
	["4441239464"] = {
		Price = 95,
		Name = "\240\159\166\131Comfy Pie",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Thanksgiving",
		Discontinued = true
	},
	["4441275069"] = {
		Price = 11,
		Name = "\240\159\166\131Soft Turkey Bed",
		Category = "Seasonal",
		Rarity = "Common",
		PresentType = "Thanksgiving",
		Discontinued = true
	},
	["4095739884"] = {
		Price = 190,
		Name = "\240\159\142\131Frankenbed",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		BannedInChina = true,
		Year = 2019
	},
	["4095742807"] = {
		Price = 30,
		Name = "\240\159\142\131Handy Candy",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		BannedInChina = true,
		Year = 2019
	},
	["4095713152"] = {
		Price = 70,
		Name = "\240\159\142\131Skeleton Coffin Table",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		BannedInChina = true,
		Year = 2019
	},
	["4102858746"] = {
		Price = 40,
		Name = "\240\159\142\131Web Bed",
		Category = "Seasonal",
		Discontinued = true,
		Unsellable = true,
		BannedInChina = true,
		Year = 2019
	},
	["4100884937"] = {
		Price = 60,
		Name = "\240\159\142\131Monsterous Mouth Doorway",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4095751449"] = {
		Price = 75,
		Name = "\240\159\142\131Boo\'s Cauldron",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Halloween",
		TableTopItem = true,
		BannedInChina = true
	},
	["4095707381"] = {
		Price = 45,
		Name = "\240\159\142\131Boo\'s Chair",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4095710227"] = {
		Price = 85,
		Name = "\240\159\142\131Boo\'s Couch",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4100742810"] = {
		Price = 35,
		Name = "\240\159\142\131Boo\'s Table",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4095697741"] = {
		Price = 80,
		Name = "\240\159\142\131Skeleton Table",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4103913941"] = {
		Price = 45,
		Name = "\240\159\142\131Jack o Stack",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4095722059"] = {
		Price = 25,
		Name = "\240\159\142\131Jack o Lantern",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4100744972"] = {
		Price = 20,
		Name = "\240\159\142\131Boo\'s Rug",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4095735392"] = {
		Price = 50,
		Name = "\240\159\142\131Skeleton Hand Candle",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4095728535"] = {
		Price = 40,
		Name = "\240\159\142\131Skeleton Head Candle",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4100755743"] = {
		Price = 110,
		Name = "\240\159\142\131Haunted Tree",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4095725517"] = {
		Price = 40,
		Name = "\240\159\142\131Batty",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4095715861"] = {
		Price = 45,
		Name = "\240\159\142\131Boo the Ghost",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		Discontinued = true,
		PresentType = "Halloween",
		BannedInChina = true
	},
	["4095763453"] = {
		Price = 5,
		Name = "Cemetery Fence",
		Category = "Decoration",
		BannedInChina = true
	},
	["4037260169"] = {
		Price = 40,
		Name = "\240\159\141\130Scarecrow",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Fall"
	},
	["4037253034"] = {
		Price = 35,
		Name = "\240\159\141\130Fall Bench",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Fall"
	},
	["4037258452"] = {
		Price = 35,
		Name = "\240\159\141\130Hay Ride Bed",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Fall"
	},
	["4037261765"] = {
		Price = 40,
		Name = "\240\159\141\130Hay Couch",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Fall"
	},
	["4039951162"] = {
		Price = 35,
		Name = "\240\159\141\130Pumpkin TV",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		Discontinued = true,
		PresentType = "Fall"
	},
	["4037264114"] = {
		Price = 25,
		Name = "\240\159\141\130Tree Stump Table",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Fall",
		TableTopItem = true
	},
	["4037268527"] = {
		Price = 23,
		Name = "\240\159\141\130Hay",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Fall",
		TableTopItem = true
	},
	["4037271785"] = {
		Price = 15,
		Name = "\240\159\141\130Candle",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		Discontinued = true,
		PresentType = "Fall"
	},
	["4037254808"] = {
		Price = 25,
		Name = "\240\159\141\130Leaf Shower",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		PresentType = "Fall"
	},
	["4045214829"] = {
		Price = 40,
		Name = "\240\159\141\130Apple Bobbing",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		Discontinued = true,
		PresentType = "Fall"
	},
	["4037267253"] = {
		Price = 30,
		Name = "\240\159\141\130Pumpkin",
		Category = "Seasonal",
		Rarity = "Common",
		TableTopItem = true,
		Discontinued = true,
		PresentType = "Fall"
	},
	["4037265943"] = {
		Price = 20,
		Name = "\240\159\141\130Wooden Rocking Chair",
		Category = "Seasonal",
		Rarity = "Common",
		Discontinued = true,
		TableTopItem = true,
		PresentType = "Fall"
	},
	["3980752382"] = {
		Price = 90,
		Name = "Card Couch",
		Category = "Seats",
		Rarity = "Common",
		BannedInChina = true
	},
	["3980760750"] = {
		Price = 11,
		Name = "Card Bed",
		Category = "Beds",
		Rarity = "Common",
		BannedInChina = true
	},
	["3980766510"] = {
		Price = 80,
		Name = "Card Ceiling Lamp",
		Category = "Lights",
		Rarity = "Common",
		BannedInChina = true
	},
	["3980757510"] = {
		Price = 70,
		Name = "Card Table",
		Category = "Tables",
		Rarity = "Common",
		BannedInChina = true
	},
	["3980775908"] = {
		Price = 75,
		Name = "Card Nightstand",
		Category = "Tables",
		Rarity = "Common",
		TableTopItem = true,
		BannedInChina = true
	},
	["3980763971"] = {
		Price = 95,
		Name = "Card Cabnet",
		Category = "Decoration",
		Rarity = "Common",
		BannedInChina = true
	},
	["3980772653"] = {
		Price = 70,
		Name = "Card Chair",
		Category = "Seats",
		Rarity = "Common",
		TableTopItem = true,
		BannedInChina = true
	},
	["3980784837"] = {
		Price = 15,
		Name = "Hotdog Couch",
		Category = "Seats",
		Rarity = "Common"
	},
	["3980778658"] = {
		Price = 12,
		Name = "Egg Chair",
		Category = "Seats",
		Rarity = "Common"
	},
	["3980781915"] = {
		Price = 15,
		Name = "Pineapple Bed",
		Category = "Beds",
		Rarity = "Common"
	},
	["3980791634"] = {
		Price = 550,
		Name = "Bowling Pin Ceiling Fan",
		Category = "Decoration",
		Rarity = "Rare",
		PhysicsBlacklisted = true
	},
	["3980787466"] = {
		Price = 490,
		Name = "Hand Chair",
		Category = "Seats",
		Rarity = "Rare"
	},
	["3980806383"] = {
		Price = 460,
		Name = "Post Apocalyptic Sleeping Pod",
		Category = "Beds",
		Rarity = "Rare"
	},
	["3980796139"] = {
		Price = 720,
		Name = "Bowling Pin Punching Bag",
		Category = "Entertainment",
		Rarity = "Rare",
		PhysicsBlacklisted = true
	},
	["3992376687"] = {
		Price = 450,
		Name = "Bowling Pin Lamp",
		Category = "Lights",
		Rarity = "Rare",
		TableTopItem = true
	},
	["3798161295"] = {
		Price = 40,
		Name = "Dojo Bed",
		Category = "Beds",
		NewShopItem = 1568133931
	},
	["3799588484"] = {
		Price = 65,
		Name = "Bonsai Tree",
		Category = "Decoration",
		NewShopItem = 1568133931
	},
	["3805777854"] = {
		Price = 60,
		Name = "Dojo Drum",
		Category = "Entertainment",
		TableTopItem = true,
		NewShopItem = 1568133931
	},
	["3800255387"] = {
		Price = 32,
		Name = "Dojo Towel Rack",
		Category = "Decoration",
		TableTopItem = true,
		NewShopItem = 1568133931
	},
	["3813024757"] = {
		Price = 30,
		Name = "Dojo Shelf",
		Category = "Decoration",
		TableTopItem = true,
		NewShopItem = 1568133931
	},
	["3800654789"] = {
		Price = 75,
		Name = "Dojo Ceiling Lantern",
		Category = "Lights",
		NewShopItem = 1568133931
	},
	["3806984414"] = {
		Price = 90,
		Name = "Dojo Punching Bag",
		Category = "Entertainment",
		NewShopItem = 1568133931,
		PhysicsBlacklisted = true
	},
	["3813503161"] = {
		Price = 50,
		Name = "Katana",
		Category = "Gear",
		NewShopItem = 1568133931,
		AutoUnlocked = true
	},
	["7253453454"] = {
		Price = 1000000,
		Name = "Supply Truck",
		Category = "Trucks",
		Discontinued = true,
		Unsellable = true,
		ModelId = 15641343735
	},
	["8326766544"] = {
		Price = 1000000,
		Name = "Pontoon Boat",
		Category = "Boats",
		Discontinued = true,
		Unsellable = true,
		ModelId = 15640324053
	},
	["7564733867"] = {
		Price = 1000000,
		Name = "Tempest Pro",
		Category = "Boats",
		Discontinued = true,
		Unsellable = true,
		ModelId = 97549634306635,
		GamepassId = "HalloweenBundle"
	},
	["875435676"] = {
		Price = 1000000,
		Name = "Cozy Cabin Boat",
		Category = "Boats",
		Discontinued = true,
		Unsellable = true,
		ModelId = 15692900672,
		Year = 2023
	},
	["6520938584"] = {
		Price = 1000000,
		Name = "Delivery Car",
		Category = "Cars",
		Discontinued = true,
		Unsellable = true,
		ModelId = 15641350554
	},
	["4989837495"] = {
		Price = 1000000,
		Name = "Jeep",
		Category = "Cars",
		Discontinued = true,
		Unsellable = true,
		ModelId = 15633700884
	},
	["5304958253"] = {
		Price = 1000000,
		Name = "Pickup Truck",
		Category = "Cars",
		Discontinued = true,
		Unsellable = true,
		ModelId = 15692891733
	},
	["694587485"] = {
		Price = 1000000,
		Name = "Christmas Truck",
		Category = "Cars",
		Discontinued = true,
		Unsellable = true,
		ModelId = 15692894255,
		Year = 2023
	},
	["579483941"] = {
		Price = 1000000,
		Name = "Banmobile",
		Category = "Cars",
		Discontinued = true,
		Unsellable = true,
		ModelId = 15811304359
	},
	["395845983"] = {
		Price = 1000000,
		Name = "Autumn Jeep",
		Category = "Cars",
		Discontinued = true,
		Unsellable = true,
		ModelId = 115304358377072,
		GamepassId = "AutumnBundle",
		TestItem = true
	},
	["745625715"] = {
		Price = 1000000,
		Name = "Phantom",
		Category = "Cars",
		Discontinued = true,
		Unsellable = true,
		ModelId = 130459954652669,
		TestItem = true,
		GamepassId = "HalloweenBundle"
	},
	["3259308808"] = {
		Price = 3400,
		Name = "Shark Tank",
		Category = "Decoration",
		Rarity = "Legendary"
	},
	["3263707708"] = {
		Price = 2800,
		Name = "Punching Bag",
		Category = "Entertainment",
		Rarity = "Legendary",
		PhysicsBlacklisted = true
	},
	["3263706792"] = {
		Price = 2400,
		Name = "MLG TV",
		Category = "Entertainment",
		Rarity = "Legendary"
	},
	["3263714728"] = {
		Price = 3333.3,
		Name = "Mini Fusion Reactor",
		Category = "Entertainment",
		Rarity = "Legendary",
		ConflictSeed = 583545
	},
	["3263709862"] = {
		Price = 5000,
		Name = "Orb of Confusion",
		Category = "Entertainment",
		Rarity = "Legendary"
	},
	["3763074716"] = {
		Price = 25,
		Name = "Coin Chest",
		Category = "Decoration",
		Unsellable = true,
		AutoUnlocked = true
	},
	["3338520452"] = {
		Price = 50,
		Name = "Coffee Maker",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		Creator = "Yozoh"
	},
	["3338518987"] = {
		Price = 35,
		Name = "Blender",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		Creator = "Yozoh"
	},
	["3338515900"] = {
		Price = 25,
		Name = "Toaster",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		Creator = "Yozoh"
	},
	["3334537114"] = {
		Price = 25,
		Name = "Ban Button",
		Category = "Customization",
		AutoUnlocked = true
	},
	["3263754702"] = {
		Price = 30,
		Name = "VIP Rope",
		Category = "Decoration",
		VIP = true,
		TableTopItem = true
	},
	["3263716541"] = {
		Price = 100,
		Name = "VIP Door",
		Category = "Doors",
		VIP = true
	},
	["8218651923"] = {
		Price = 20,
		Name = "Starlight",
		Category = "Decoration",
		AutoUnlocked = true,
		TableTopItem = true,
		New = 1639734831
	},
	["3272991497"] = {
		Price = 9,
		Name = "Bamboo Fence",
		Category = "Decoration",
		TableTopItem = true,
		Creator = "Yozoh"
	},
	["3272990346"] = {
		Price = 110,
		Name = "Bamboo Fountain",
		Category = "Decoration",
		Creator = "Yozoh"
	},
	["3272976300"] = {
		Price = 22,
		Name = "Outdoor Table",
		Category = "Decoration",
		TableTopItem = true,
		Creator = "Yozoh"
	},
	["3272974919"] = {
		Price = 70,
		Name = "Grill",
		Category = "Decoration",
		ConflictSeed = 509823,
		Creator = "Yozoh"
	},
	["3272973748"] = {
		Price = 41,
		Name = "Outdoor Chair",
		Category = "Seats",
		Creator = "Yozoh"
	},
	["3272972751"] = {
		Price = 19,
		Name = "Tiki Torch",
		Category = "Lights",
		TableTopItem = true,
		Creator = "Yozoh"
	},
	["3272970909"] = {
		Price = 20,
		Name = "Sandbox",
		Category = "Decoration"
	},
	["3287994805"] = {
		Price = 36,
		Name = "Towel",
		Category = "Kitchen/Bath",
		TableTopItem = true
	},
	["3287996875"] = {
		Price = 15,
		Name = "Toilet Paper",
		Category = "Kitchen/Bath",
		TableTopItem = true
	},
	["3288048392"] = {
		Price = 25,
		Name = "Lid Pot",
		Category = "Kitchen/Bath",
		TableTopItem = true
	},
	["3288075671"] = {
		Price = 60,
		Name = "Sunburst Light",
		Category = "Lights"
	},
	["3288042954"] = {
		Price = 55,
		Name = "Leggy Lamp",
		Category = "Lights"
	},
	["3288039839"] = {
		Price = 40,
		Name = "Lampshade Ceiling Light",
		Category = "Lights"
	},
	["3288007071"] = {
		Price = 29,
		Name = "Wall Lamp",
		Category = "Lights",
		TableTopItem = true
	},
	["3287989820"] = {
		Price = 40,
		Name = "Hanging Bulb Light",
		Category = "Lights"
	},
	["3288056333"] = {
		Price = 50,
		Name = "60s Desk",
		Category = "Tables"
	},
	["3288005191"] = {
		Price = 60,
		Name = "Elegant Table",
		Category = "Tables"
	},
	["3287991142"] = {
		Price = 119,
		Name = "Shelf Bed",
		Category = "Beds"
	},
	["3288071060"] = {
		Price = 80,
		Name = "Baby Bean",
		Category = "Decoration",
		TableTopItem = true,
		Rarity = "Common",
		ConflictSeed = 957987293
	},
	["3288069078"] = {
		Price = 38,
		Name = "Dracaena Plant",
		Category = "Decoration",
		TableTopItem = true,
		ConflictSeed = 5027039482
	},
	["3288060975"] = {
		Price = 20,
		Name = "Toy Rocket",
		Category = "Decoration",
		TableTopItem = true,
		Rarity = "Common"
	},
	["3288045339"] = {
		Price = 25,
		Name = "Cactus",
		Category = "Decoration",
		TableTopItem = true
	},
	["3287987543"] = {
		Price = 43,
		Name = "Tree Bookshelf",
		Category = "Decoration"
	},
	["3289342613"] = {
		Price = 35,
		Name = "Printer",
		Category = "Decoration",
		TableTopItem = true
	},
	["4095746724"] = {
		Price = 26,
		Name = "Candle Stand",
		Category = "Lights",
		TableTopItem = true,
		AutoUnlocked = true
	},
	["3289900089"] = {
		Price = 65,
		Name = "60s Armchair",
		Category = "Seats"
	},
	["3289902270"] = {
		Price = 57,
		Name = "Low-Back Armchair",
		Category = "Seats"
	},
	["3289898469"] = {
		Price = 90,
		Name = "Sectional Couch",
		Category = "Seats"
	},
	["3289896526"] = {
		Price = 60,
		Name = "Bear Couch",
		Category = "Seats",
		Rarity = "Common"
	},
	["3289906247"] = {
		Price = 35,
		Name = "Modern Desk Clock",
		Category = "Decoration",
		TableTopItem = true
	},
	["3289909117"] = {
		Price = 185,
		Name = "Zeitaku Screen",
		Category = "Decoration",
		TableTopItem = true
	},
	["3289911293"] = {
		Price = 15,
		Name = "Balloons",
		Category = "Decoration",
		TableTopItem = true
	},
	["3289915823"] = {
		Price = 67,
		Name = "Zeitaku Plant",
		Category = "Decoration"
	},
	["3289917953"] = {
		Price = 125,
		Name = "Zeitaku Mirror",
		Category = "Decoration",
		TableTopItem = true
	},
	["3289919632"] = {
		Price = 384,
		Name = "Zeitaku Bed",
		Category = "Beds"
	},
	["3289948709"] = {
		Price = 390,
		Name = "Zeitaku Lamp",
		Category = "Lights",
		Rarity = "Rare"
	},
	["3289946446"] = {
		Price = 160,
		Name = "Sleek Lamp",
		Category = "Lights",
		TableTopItem = true
	},
	["3289938633"] = {
		Price = 29,
		Name = "50s Lamp",
		Category = "Lights",
		TableTopItem = true
	},
	["3289936305"] = {
		Price = 91,
		Name = "Zeitaku Light",
		Category = "Lights"
	},
	["3289930350"] = {
		Price = 430,
		Name = "Ramen Shower",
		Category = "Kitchen/Bath",
		Rarity = "Rare"
	},
	["3289904023"] = {
		Price = 55,
		Name = "Wood Coffee Table",
		Category = "Tables",
		TableTopItem = true
	},
	["3298037474"] = {
		Price = 300,
		Name = "Streaming Chandelier",
		Category = "Lights",
		Rarity = "Uncommon"
	},
	["3298035698"] = {
		Price = 9,
		Name = "String Lights",
		Category = "Lights",
		ConflictSeed = 1574983,
		TableTopItem = true
	},
	["3298041491"] = {
		Price = 43,
		Name = "Futuristic Coffee Table",
		Category = "Tables",
		TableTopItem = true
	},
	["3298045857"] = {
		Price = 67,
		Name = "Wall Squares",
		Category = "Decoration",
		TableTopItem = true
	},
	["3298042916"] = {
		Price = 52,
		Name = "Cluttered Shelf",
		Category = "Decoration",
		TableTopItem = true
	},
	["3298039838"] = {
		Price = 27,
		Name = "Water Boiler",
		Category = "Kitchen/Bath",
		TableTopItem = true
	},
	["3298038763"] = {
		Price = 42,
		Name = "Mixer",
		Category = "Kitchen/Bath",
		TableTopItem = true,
		AutoUnlocked = true
	},
	["860395229"] = {
		Price = 0,
		Name = "No Hat",
		Category = "PetHats",
		Unsellable = true,
		Discontinued = true
	},
	["10911990"] = {
		Price = 40,
		Name = "Propeller Beanie",
		Category = "PetHats",
		Unsellable = true
	},
	["860339357"] = {
		Price = 50,
		Name = "Chef\'s Hat",
		Category = "PetHats",
		Unsellable = true
	},
	["860293883"] = {
		Price = 70,
		Name = "Animal Hoodie",
		Category = "PetHats",
		Unsellable = true
	},
	["2609624667"] = {
		Price = 75,
		Name = "Santa Hat",
		Category = "PetHats",
		Unsellable = true
	},
	["1948983984"] = {
		Price = 75,
		Name = "Elf Hat",
		Category = "PetHats",
		Unsellable = true,
		Discontinued = false,
		ModelId = 121194358899495,
		GamepassId = "Cabin"
	},
	["273967011"] = {
		Price = 90,
		Name = "Pizza Face",
		Category = "PetHats",
		Unsellable = true
	},
	["2512600385"] = {
		Price = 95,
		Name = "Pumpkin Head",
		Category = "PetHats",
		Unsellable = true,
		Holiday = "Halloween",
		BannedInChina = true
	},
	["860355820"] = {
		Price = 100,
		Name = "Whipped cream",
		Category = "PetHats",
		Unsellable = true
	},
	["860358597"] = {
		Price = 110,
		Name = "Narwhal",
		Category = "PetHats",
		Unsellable = true
	},
	["89615321"] = {
		Price = 130,
		Name = "Hungry Dino",
		Category = "PetHats",
		Unsellable = true
	},
	["553892446"] = {
		Price = 150,
		Name = "Mint Hair",
		Category = "PetHats",
		Unsellable = true
	},
	["158066137"] = {
		Price = 160,
		Name = "Beard",
		Category = "PetHats",
		Unsellable = true
	},
	["244159564"] = {
		Price = 170,
		Name = "Cat Headphones",
		Category = "PetHats",
		Unsellable = true
	},
	["321570597"] = {
		Price = 181,
		Name = "Rainbow Hair",
		Category = "PetHats",
		Unsellable = true
	},
	["860294537"] = {
		Price = 195,
		Name = "Doge Face",
		Category = "PetHats",
		Unsellable = true
	},
	["11884330"] = {
		Price = 180,
		Name = "Glasses",
		Category = "PetHats",
		Unsellable = true
	},
	["14128456"] = {
		Price = 185,
		Name = "Lei",
		Category = "PetHats",
		Unsellable = true,
		Season = "Spring"
	},
	["20642008"] = {
		Price = 200,
		Name = "Bandana",
		Category = "PetHats",
		Unsellable = true
	},
	["1029025"] = {
		Price = 210,
		Name = "Fedora",
		Category = "PetHats",
		Unsellable = true
	},
	["280658439"] = {
		Price = 215,
		Name = "Pink Hair",
		Category = "PetHats",
		Unsellable = true
	},
	["51245241"] = {
		Price = 230,
		Name = "Sleek Shades",
		Category = "PetHats",
		Unsellable = true
	},
	["4765718"] = {
		Price = 260,
		Name = "Skull",
		Category = "PetHats",
		Unsellable = true,
		BannedInChina = true
	},
	["300409223"] = {
		Price = 275,
		Name = "Wings Of Autumn",
		Category = "PetHats",
		Unsellable = true,
		Season = "Fall"
	},
	["6552812"] = {
		Price = 350,
		Name = "Bling Bling",
		Category = "PetHats",
		Unsellable = true
	},
	["215719598"] = {
		Price = 450,
		Name = "Dark Wings",
		Category = "PetHats",
		Unsellable = true
	},
	["860359815"] = {
		Price = 450,
		Name = "Light Wings",
		Category = "PetHats",
		Unsellable = true
	},
	["323419219"] = {
		Price = 680,
		Name = "Crazy Blue Hair",
		Category = "PetHats",
		Unsellable = true
	},
	["204162039"] = {
		Price = 1800,
		Name = "King\'s Crown",
		Category = "PetHats",
		Unsellable = true
	},
	["675483345"] = {
		Price = 80,
		Name = "Autumn Hat",
		Category = "PetHats",
		Discontinued = true,
		Unsellable = true,
		ModelId = 93163731953336,
		GamepassId = "AutumnBundle"
	},
	["2603500468"] = {
		Price = 9,
		Name = "Lettering Present",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true
	},
	["2603500875"] = {
		Price = 9,
		Name = "Sweater Present",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true
	},
	["2603501501"] = {
		Price = 9,
		Name = "Builderman Present",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true
	},
	["2603502194"] = {
		Price = 9,
		Name = "Candy Cane Present",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true
	},
	["2603502988"] = {
		Price = 9,
		Name = "Striped Present",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true
	},
	["2603503783"] = {
		Price = 9,
		Name = "Santa Present",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		ConflictSeed = 883747342
	},
	["2603505012"] = {
		Price = 9,
		Name = "Premium Present",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true
	},
	["5000000001"] = {
		Year = 2025,
		ModelId = 117947010360978,
		Price = 9,
		Name = "Shiny Blue Gift of Niceness",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		CantPlaceOutside = true
	},
	["5000000002"] = {
		Year = 2025,
		ModelId = 111005058180211,
		Price = 9,
		Name = "Black Iron Gift of Pwnage",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		CantPlaceOutside = true
	},
	["5000000003"] = {
		Year = 2025,
		ModelId = 70878470250927,
		Price = 9,
		Name = "Azure Gift of Builder",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		CantPlaceOutside = true
	},
	["5000000004"] = {
		Year = 2025,
		ModelId = 120210157080069,
		Price = 9,
		Name = "Agonizingly Ugly Gift of Full Inbox",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		CantPlaceOutside = true
	},
	["5000000005"] = {
		Year = 2025,
		ModelId = 100705338295269,
		Price = 9,
		Name = "Bombastic Gift of Awesome",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		CantPlaceOutside = true
	},
	["5000000006"] = {
		Year = 2025,
		ModelId = 115018898278094,
		Price = 9,
		Name = "Inscrutable White Gift of the Primes",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		CantPlaceOutside = true
	},
	["5000000007"] = {
		Year = 2025,
		ModelId = 130754909206559,
		Price = 9,
		Name = "Glittering Gold Gift of Fame",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		CantPlaceOutside = true
	},
	["2672163711"] = {
		Price = 10,
		Name = "Smartphone",
		Category = "Gear"
	},
	["2672159217"] = {
		Price = 200,
		Name = "Aquarium",
		Category = "Decoration",
		Rarity = "Uncommon"
	},
	["2672160337"] = {
		Price = 250,
		Name = "Fidget-Go-Round",
		Category = "Entertainment",
		TableTopItem = true,
		Rarity = "Uncommon",
		PhysicsBlacklisted = true
	},
	["2672161654"] = {
		Price = 210,
		Name = "Tire Swing",
		Category = "Entertainment",
		Rarity = "Uncommon",
		PhysicsBlacklisted = true
	},
	["2627432266"] = {
		Price = 180,
		Name = "Tic-Tac-Toe",
		Category = "Entertainment",
		TableTopItem = true,
		Rarity = "Uncommon"
	},
	["2672158108"] = {
		Price = 250,
		Name = "Igloo",
		Category = "Entertainment",
		Rarity = "Uncommon"
	},
	["5429358495"] = {
		Price = 9,
		Name = "Bug Finder Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15619648636
	},
	["5646364569"] = {
		Price = 9,
		Name = "Moderator Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15624266914
	},
	["6374764361"] = {
		Price = 9,
		Name = "QA Tester Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15624253376
	},
	["7509846543"] = {
		Price = 9,
		Name = "Content Creator Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15811548745
	},
	["1559686945"] = {
		Price = 9,
		Name = "Pizza Cake",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		Year = 2018
	},
	["1559689401"] = {
		Price = 9,
		Name = "Anniversary Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		Year = 2018
	},
	["2643128528"] = {
		Price = 9,
		Name = "Delivery Bike Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2
	},
	["2644096580"] = {
		Price = 9,
		Name = "Delivery Bike Trophy Item",
		Category = "Gear",
		Discontinued = true,
		Unsellable = true,
		Memory = 0.2
	},
	["2520121408"] = {
		Price = 9,
		Name = "Halloween 2018 Trophy Item",
		Category = "Gear",
		Discontinued = true,
		Unsellable = true,
		BannedInChina = true,
		Memory = 0.2
	},
	["2520094253"] = {
		Price = 9,
		Name = "Halloween 2018 Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		BannedInChina = true,
		Memory = 0.2,
		Year = 2018
	},
	["2672177804"] = {
		Price = 1,
		Name = "Christmas 2018 Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		Year = 2018
	},
	["4041932351"] = {
		Price = 9,
		Name = "Autumn 2019 Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		Year = 2019
	},
	["4047630259"] = {
		Price = 9,
		Name = "Autumn 2019 Trophy Item",
		Category = "Gear",
		Discontinued = true,
		Unsellable = true,
		Memory = 0.2,
		Year = 2019
	},
	["4203390554"] = {
		Price = 9,
		Name = "Halloween 2019 Maze Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		BannedInChina = true,
		Memory = 0.2,
		Year = 2019
	},
	["4209318248"] = {
		Price = 9,
		Name = "Halloween 2019 Maze Trophy Item",
		Category = "Gear",
		Discontinued = true,
		Unsellable = true,
		BannedInChina = true,
		Memory = 0.2
	},
	["4462141186"] = {
		Price = 9,
		Name = "2019 Thanksgiving Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		Year = 2019
	},
	["4535072906"] = {
		Price = 9,
		Name = "2019 Christmas Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		Year = 2019
	},
	["4537452518"] = {
		Price = 9,
		Name = "2019 Christmas Trophy Item",
		Category = "Gear",
		Discontinued = true,
		Unsellable = true,
		Memory = 0.2
	},
	["5772898278"] = {
		Price = 9,
		Name = "2020 Autumn Trophy Item",
		Category = "Gear",
		Discontinued = true,
		Unsellable = true,
		Memory = 0.2
	},
	["5772893489"] = {
		Price = 9,
		Name = "2020 Autumn Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		Year = 2020
	},
	["5849526535"] = {
		Price = 9,
		Name = "Artist Trophy",
		Category = "Decoration",
		TableTopItem = true,
		Discontinued = true,
		Unsellable = true,
		Memory = 0.2
	},
	["5864232111"] = {
		Price = 9,
		Name = "2020 Halloween Maze Trophy",
		Category = "Decoration",
		TableTopItem = true,
		Discontinued = true,
		Unsellable = true,
		BannedInChina = true,
		Memory = 0.2,
		Year = 2020
	},
	["5864256069"] = {
		Price = 9,
		Name = "2020 Halloween Maze Trophy Item",
		Category = "Gear",
		Discontinued = true,
		Unsellable = true,
		BannedInChina = true,
		Memory = 0.2
	},
	["6033112954"] = {
		Price = 9,
		Name = "2020 Christmas Trophy",
		Category = "Decoration",
		TableTopItem = true,
		Discontinued = true,
		Unsellable = true,
		Memory = 0.2,
		Year = 2020
	},
	["7546170404"] = {
		Price = 9,
		Name = "2021 Autumn Trophy Item",
		Category = "Gear",
		Discontinued = true,
		Unsellable = true,
		Memory = 0.2
	},
	["7546169061"] = {
		Price = 9,
		Name = "2021 Autumn Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		Year = 2021
	},
	["8199290141"] = {
		Price = 9,
		Name = "2021 Christmas Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		Year = 2021
	},
	["8218409414"] = {
		Price = 9,
		Name = "2021 Christmas Trophy Item",
		Category = "Gear",
		Discontinued = true,
		Unsellable = true,
		Memory = 0.2
	},
	["7957073869"] = {
		Price = 9,
		Name = "2022 Autumn Trophy Item",
		Category = "Gear",
		Discontinued = true,
		Unsellable = true,
		Memory = 0.2,
		ModelId = 11088239235
	},
	["5928747458"] = {
		Price = 9,
		Name = "2022 Autumn Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 11088278640,
		Year = 2022
	},
	["7887432934"] = {
		Price = 9,
		Name = "2023 Autumn Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 14899292798,
		Year = 2023
	},
	["5849854983"] = {
		Price = 9,
		Name = "2024 Autumn Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 14899294440,
		Year = 2024
	},
	["2709849584"] = {
		Price = 9,
		Name = "2025 Autumn Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 14899296149,
		Year = 2025
	},
	["4098350989"] = {
		Price = 9,
		Name = "2023 Christmas Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15475644018,
		Year = 2023
	},
	["7605984935"] = {
		Price = 9,
		Name = "2024 Christmas Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15475640305,
		Year = 2024
	},
	["6209845342"] = {
		Price = 9,
		Name = "2025 Christmas Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15475637016,
		Year = 2025
	},
	["6543606755"] = {
		Price = 9,
		Name = "2024 Halloween Maze Trophy",
		Category = "Decoration",
		TableTopItem = true,
		Discontinued = true,
		Unsellable = true,
		BannedInChina = true,
		Memory = 0.2,
		Year = 2024,
		ModelId = 86375328633962
	},
	["8340688435"] = {
		Price = 9,
		Name = "2025 Halloween Maze Trophy",
		Category = "Decoration",
		TableTopItem = true,
		Discontinued = true,
		Unsellable = true,
		BannedInChina = true,
		Memory = 0.2,
		Year = 2025,
		ModelId = 101843988599146
	},
	["783564647"] = {
		Price = 9,
		Name = "Bronze Streak Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15293809286
	},
	["739678967"] = {
		Price = 9,
		Name = "Silver Streak Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15293827639
	},
	["957765753"] = {
		Price = 9,
		Name = "Gold Streak Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15293835450
	},
	["490567345"] = {
		Price = 9,
		Name = "Diamond Streak Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15293846185
	},
	["694759837"] = {
		Price = 9,
		Name = "Bronze Inviter Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15429777410
	},
	["719549938"] = {
		Price = 9,
		Name = "Silver Inviter Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15429772861
	},
	["810298453"] = {
		Price = 9,
		Name = "Gold Inviter Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 15429767725
	},
	["101010101"] = {
		Price = 9,
		Name = "Rat Trophy",
		Category = "Decoration",
		Discontinued = true,
		Unsellable = true,
		TableTopItem = true,
		Memory = 0.2,
		ModelId = 10002086171
	}
}
local t3 = {
	Price = 50,
	Name = "Paint Bucket",
	Category = "Gear",
	Unsellable = true,
	VideoId = 15423208071,
	TestItem = true
}
t3.ProductId = if v1.IsTestPlace then 21007466 else 18473377
t2["495886176"] = t3
t2["495315981"] = {
	Price = 0,
	Name = "MoneyBag",
	Category = "Gear",
	Discontinued = true,
	Unsellable = true
}
t2["497501382"] = {
	Price = 0,
	Name = "HangGlider",
	Category = "Gear",
	Discontinued = true,
	Unsellable = true
}
t2["497502431"] = {
	Price = 0,
	Name = "DeliveryBike",
	Category = "Gear",
	Discontinued = true,
	Unsellable = true
}
t2["499900783"] = {
	Price = 5,
	Name = "Chef Hat",
	Category = "None",
	Deleted = true,
	Discontinued = true,
	Unsellable = true
}
t2["499900058"] = {
	Price = 5,
	Name = "Work Visor",
	Category = "None",
	Deleted = true,
	Discontinued = true,
	Unsellable = true
}
t2["197236349"] = {
	Price = 23,
	Name = "Medieval Spikes",
	Category = "Entertainment"
}
t2["197233903"] = {
	Price = 55,
	Name = "Medieval Fountain",
	Category = "Decoration",
	ConflictSeed = 6183847302
}
t2["197232814"] = {
	Price = 50,
	Name = "Medieval Pillar",
	Category = "Decoration"
}
t2["197232634"] = {
	Price = 200,
	Name = "Medieval Throne",
	Category = "Seats"
}
t2["197231399"] = {
	Price = 45,
	Name = "Medieval Lantern",
	Category = "Lights"
}
t2["676560376"] = {
	Price = 1500,
	Name = "Scarf Kid",
	Category = "Decoration",
	TableTopItem = true,
	Rarity = "Legendary"
}
t2["677459420"] = {
	Price = 1200,
	Name = "Blink Poster",
	Category = "Decoration",
	TableTopItem = true,
	Discontinued = true,
	Rarity = "Legendary",
	Limited = true
}
t2["677578722"] = {
	Price = 3500,
	Name = "Cannon",
	Category = "Entertainment",
	Rarity = "Legendary"
}
t2["2327242153"] = {
	Price = 100,
	Name = "Full Collection",
	Category = "Decoration",
	Memory = 0.1,
	Unsellable = true,
	Discontinued = true,
	TableTopItem = true
}
t2["392734001"] = {
	Price = 9,
	Name = "Prison Bars",
	Category = "Decoration",
	Memory = 0.3
}
t2["197235278"] = {
	Price = 170,
	Name = "Workout Treadmill",
	Category = "Entertainment",
	AutoUnlocked = true
}
t2["197235123"] = {
	Price = 65,
	Name = "Workout Dumbbells",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["197234892"] = {
	Price = 15,
	Name = "Conveyor",
	Category = "Entertainment",
	Memory = 0.3
}
t2["197234296"] = {
	Price = 30,
	Name = "Bleachers",
	Category = "Seats"
}
t2["197233764"] = {
	Price = 170,
	Name = "Disco Floor",
	Category = "Entertainment",
	AutoUnlocked = true
}
t2["197233066"] = {
	Price = 17,
	Name = "Stain Glass Window",
	Category = "Decoration",
	Memory = 1,
	AutoUnlocked = true
}
t2["197231751"] = {
	Price = 13,
	Name = "Fence",
	Category = "Decoration",
	Memory = 0.1,
	AutoUnlocked = true
}
t2["197232238"] = {
	Price = 14,
	Name = "Fence Corner",
	Category = "Decoration",
	Memory = 0.1,
	AutoUnlocked = true
}
t2["197231156"] = {
	Price = 31,
	Name = "Floor Lamp",
	Category = "Lights",
	ConflictSeed = 363737252,
	AutoUnlocked = true
}
t2["197230959"] = {
	Price = 46,
	Name = "Office Chair",
	Category = "Seats",
	Memory = 2,
	AutoUnlocked = true
}
t2["197230649"] = {
	Price = 25,
	Name = "Small Plant",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["197230496"] = {
	Price = 73,
	Name = "Workout Barbell Bench",
	Category = "Beds",
	AutoUnlocked = true
}
t2["200224096"] = {
	Price = 21,
	Name = "Truss",
	Category = "Decoration",
	Memory = 0.2,
	AutoUnlocked = true
}
t2["200220390"] = {
	Price = 98,
	Name = "Pear Computer",
	Category = "Entertainment",
	TableTopItem = true,
	Memory = 3,
	AutoUnlocked = true
}
t2["200219980"] = {
	Price = 85,
	Name = "PearBook",
	Category = "Entertainment",
	TableTopItem = true,
	Memory = 3,
	AutoUnlocked = true
}
t2["200219323"] = {
	Price = 860,
	Name = "DJ Set",
	Category = "Entertainment",
	Memory = 2,
	AutoUnlocked = true,
	BannedInChina = true
}
t2["200586032"] = {
	Price = 120,
	Name = "Microphone",
	Category = "Entertainment"
}
t2["143933181"] = {
	Price = 20,
	Name = "Ham Table",
	Category = "Tables",
	Memory = 2
}
t2["143958490"] = {
	Price = 20,
	Name = "Spotlight",
	Category = "Lights",
	TableTopItem = true,
	Memory = 0.2,
	AutoUnlocked = true
}
t2["1515739007"] = {
	Price = 70,
	Name = "Lovely Chair",
	Category = "Seats",
	TableTopItem = true,
	Gender = "Girl",
	Creator = "Yozoh",
	AutoUnlocked = true
}
t2["1515740843"] = {
	Price = 70,
	Name = "Lovely Lamp",
	Category = "Lights",
	TableTopItem = true,
	Gender = "Girl",
	Creator = "Yozoh",
	AutoUnlocked = true
}
t2["1515742237"] = {
	Price = 77,
	Name = "Lovely Shelf",
	Category = "Decoration",
	Gender = "Girl",
	Creator = "Yozoh",
	AutoUnlocked = true
}
t2["1515737451"] = {
	Price = 79,
	Name = "Lovely Desk",
	Category = "Tables",
	Gender = "Girl",
	Creator = "Yozoh",
	AutoUnlocked = true
}
t2["1515743657"] = {
	Price = 85,
	Name = "Lovely Bed",
	Category = "Beds",
	Gender = "Girl",
	ConflictSeed = 520854948,
	Creator = "Yozoh",
	AutoUnlocked = true
}
t2["1568723219"] = {
	Discontinued = true,
	Price = 60,
	Name = "\240\159\144\176Easter Bed",
	Category = "Beds",
	Season = "Spring",
	AutoUnlocked = true,
	New = 1776009600
}
t2["1568729315"] = {
	Discontinued = true,
	Price = 30,
	Name = "\240\159\144\176Easter Chair",
	Category = "Seats",
	Season = "Spring",
	AutoUnlocked = true,
	New = 1776009600
}
t2["1568733292"] = {
	Discontinued = true,
	Price = 20,
	Name = "\240\159\144\176Easter Basket",
	Category = "Decoration",
	TableTopItem = true,
	Season = "Spring",
	AutoUnlocked = true,
	New = 1776009600
}
t2["1568726095"] = {
	Discontinued = true,
	Price = 50,
	Name = "\240\159\144\176Easter Garden",
	Category = "Decoration",
	Season = "Spring",
	AutoUnlocked = true,
	New = 1776009600
}
t2["1568731552"] = {
	Discontinued = true,
	Price = 25,
	Name = "\240\159\144\176Easter Sign",
	Category = "Decoration",
	Season = "Spring",
	AutoUnlocked = true,
	New = 1776009600
}
t2["143094882"] = {
	Price = 30,
	Name = "Antler Armchair",
	Category = "Seats",
	AutoUnlocked = true
}
t2["143094653"] = {
	Price = 28,
	Name = "Antler Couch",
	Category = "Seats",
	AutoUnlocked = true
}
t2["143095936"] = {
	Price = 44,
	Name = "Antler Fireplace",
	Category = "Lights",
	AutoUnlocked = true
}
t2["143095437"] = {
	Price = 31,
	Name = "Antler TV",
	Category = "Entertainment",
	AutoUnlocked = true,
	BannedInChina = true
}
t2["143093384"] = {
	Price = 37,
	Name = "Antler Table",
	Category = "Tables",
	AutoUnlocked = true
}
t2["143093157"] = {
	Price = 20,
	Name = "Antler Chair",
	Category = "Seats",
	AutoUnlocked = true
}
t2["143095252"] = {
	Price = 35,
	Name = "Antler Shelf",
	Category = "Tables",
	ConflictSeed = 297298755,
	AutoUnlocked = true
}
t2["141793584"] = {
	Price = 35,
	Name = "Antler Bed",
	Category = "Beds",
	AutoUnlocked = true
}
t2["142181882"] = {
	Price = 25,
	Name = "Antler Lamp",
	Category = "Lights",
	TableTopItem = true,
	AutoUnlocked = true
}
t2["392735993"] = {
	Price = 55,
	Name = "Antler Bunk Bed",
	Category = "Beds",
	AutoUnlocked = true
}
t2["392736620"] = {
	Price = 50,
	Name = "Antler Chandelier",
	Category = "Lights",
	AutoUnlocked = true
}
t2["143386594"] = {
	Price = 35,
	Name = "Outdoors Tent",
	Category = "Beds",
	AutoUnlocked = true
}
t2["143385042"] = {
	Price = 26,
	Name = "Outdoors Log Table",
	Category = "Tables",
	AutoUnlocked = true
}
t2["143385613"] = {
	Price = 28,
	Name = "Outdoors Log Bench",
	Category = "Seats",
	AutoUnlocked = true
}
t2["143385166"] = {
	Price = 26,
	Name = "Outdoors Campfire",
	Category = "Lights",
	AutoUnlocked = true
}
t2["143386529"] = {
	Price = 60,
	Name = "Outdoors Kayak",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["143386703"] = {
	Price = 32,
	Name = "Outdoors Tree",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["143664531"] = {
	Price = 12,
	Name = "Cloud",
	Category = "Decoration"
}
t2["143665860"] = {
	Price = 14,
	Name = "Cloud Rug",
	Category = "Decoration"
}
t2["143664453"] = {
	Price = 22,
	Name = "Cloud Seat",
	Category = "Seats"
}
t2["143671199"] = {
	Price = 23,
	Name = "Cloud Table",
	Category = "Tables"
}
t2["143664240"] = {
	Price = 26,
	Name = "Cloud Bed",
	Category = "Beds"
}
t2["143669382"] = {
	Price = 18,
	Name = "Cloud TV",
	Category = "Entertainment",
	BannedInChina = true
}
t2["143666014"] = {
	Price = 14,
	Name = "Cloud Chair",
	Category = "Seats"
}
t2["143665462"] = {
	Price = 48,
	Name = "Model Plane",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["143667331"] = {
	Price = 29,
	Name = "Sun Light",
	Category = "Lights",
	AutoUnlocked = true
}
t2["143838201"] = {
	Price = 20,
	Name = "Church Podium",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["143838333"] = {
	Price = 32,
	Name = "Church Window",
	Category = "Lights",
	AutoUnlocked = true
}
t2["143838524"] = {
	Price = 26,
	Name = "Church Pew",
	Category = "Seats",
	AutoUnlocked = true
}
t2["143761910"] = {
	Price = 38,
	Name = "Tot Slide",
	Category = "Entertainment",
	AutoUnlocked = true
}
t2["143761687"] = {
	Price = 56,
	Name = "Tot Swing",
	Category = "Entertainment",
	AutoUnlocked = true,
	PhysicsBlacklisted = true
}
t2["143761495"] = {
	Price = 25,
	Name = "Tot Ceiling Light",
	Category = "Lights",
	AutoUnlocked = true
}
t2["143761064"] = {
	Price = 20,
	Name = "Tot Bed",
	Category = "Beds",
	AutoUnlocked = true
}
t2["143760789"] = {
	Price = 16,
	Name = "Tot Lamp",
	Category = "Lights",
	AutoUnlocked = true
}
t2["143760560"] = {
	Price = 35,
	Name = "Tot Couch",
	Category = "Seats",
	AutoUnlocked = true
}
t2["143760415"] = {
	Price = 12,
	Name = "Tot Chair",
	Category = "Seats",
	AutoUnlocked = true
}
t2["143760169"] = {
	Price = 19,
	Name = "Tot Table",
	Category = "Tables",
	AutoUnlocked = true
}
t2["143759884"] = {
	Price = 17,
	Name = "Tot TV",
	Category = "Entertainment",
	AutoUnlocked = true,
	BannedInChina = true
}
t2["143768047"] = {
	Price = 12,
	Name = "Tot Dresser",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["143759133"] = {
	Price = 20,
	Name = "Tot Bookshelf",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["143758961"] = {
	Price = 44,
	Name = "Tot Trampoline",
	Category = "Entertainment",
	AutoUnlocked = true
}
t2["179717188"] = {
	Price = 123,
	Name = "Tot Bounce Castle",
	Category = "Entertainment",
	AutoUnlocked = true,
	PhysicsBlacklisted = true
}
t2["143758655"] = {
	Price = 60,
	Name = "Modern TV",
	Category = "Entertainment",
	AutoUnlocked = true,
	BannedInChina = true
}
t2["143758332"] = {
	Price = 68,
	Name = "Modern Bed",
	Category = "Beds",
	AutoUnlocked = true
}
t2["143758189"] = {
	Price = 60,
	Name = "Modern Sculpture",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["143758058"] = {
	Price = 61,
	Name = "Modern Art",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["143757684"] = {
	Price = 58,
	Name = "Modern Table",
	Category = "Tables",
	AutoUnlocked = true
}
t2["143757629"] = {
	Price = 42,
	Name = "Modern Coffee Table",
	Category = "Tables",
	AutoUnlocked = true
}
t2["143757426"] = {
	Price = 33,
	Name = "Modern Chair",
	Category = "Seats",
	ConflictSeed = 60858029,
	AutoUnlocked = true
}
t2["143757061"] = {
	Price = 59,
	Name = "Modern Couch",
	Category = "Seats",
	AutoUnlocked = true
}
t2["143842715"] = {
	Price = 41,
	Name = "Modern Ceiling Light",
	Category = "Lights",
	AutoUnlocked = true
}
t2["142182087"] = {
	Price = 56,
	Name = "Modern Lamp",
	Category = "Lights",
	AutoUnlocked = true
}
t2["282210538"] = {
	Price = 60,
	Name = "Modern Dresser",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["282212547"] = {
	Price = 58,
	Name = "Modern Clock",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["282204753"] = {
	Price = 62,
	Name = "Modern Bookshelf",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["282209821"] = {
	Price = 72,
	Name = "Modern Armchair",
	Category = "Seats",
	AutoUnlocked = true
}
t2["282207719"] = {
	Price = 79,
	Name = "Modern Fireplace",
	Category = "Lights",
	AutoUnlocked = true
}
t2["198159778"] = {
	Price = 31,
	Name = "Patio Chair",
	Category = "Seats",
	AutoUnlocked = true
}
t2["198152370"] = {
	Price = 88,
	Name = "Patio End Table",
	Category = "Tables",
	AutoUnlocked = true
}
t2["198152010"] = {
	Price = 85,
	Name = "Patio Table",
	Category = "Tables",
	AutoUnlocked = true
}
t2["198151722"] = {
	Price = 89,
	Name = "Patio Couch",
	Category = "Seats",
	AutoUnlocked = true
}
t2["198151516"] = {
	Price = 82,
	Name = "Patio Armchair",
	Category = "Seats",
	AutoUnlocked = true
}
t2["198150881"] = {
	Price = 78,
	Name = "Patio Coffee Table",
	Category = "Tables",
	AutoUnlocked = true
}
t2["198150519"] = {
	Price = 85,
	Name = "Patio Chaise",
	Category = "Seats",
	AutoUnlocked = true
}
t2["197228065"] = {
	Price = 270,
	Name = "Patio Jacuzzi",
	Category = "Entertainment"
}
t2["200221440"] = {
	Price = 340,
	Name = "Patio Pool",
	Category = "Entertainment",
	AutoUnlocked = true
}
t2["392747929"] = {
	Price = 87,
	Name = "Patio Umbrella",
	Category = "Decoration"
}
t2["143835312"] = {
	Price = 189,
	Name = "Varknox Bed",
	Category = "Beds",
	AutoUnlocked = true
}
t2["143835421"] = {
	Price = 154,
	Name = "Varknox Wall",
	Category = "Decoration",
	ConflictSeed = 9882984,
	AutoUnlocked = true
}
t2["143835549"] = {
	Price = 193,
	Name = "Varknox Bubble",
	Category = "Decoration",
	PhysicsBlacklisted = true
}
t2["143835664"] = {
	Price = 110,
	Name = "Varknox Chair",
	Category = "Seats",
	AutoUnlocked = true
}
t2["143835997"] = {
	Price = 199,
	Name = "Varknox Couch",
	Category = "Seats"
}
t2["143836165"] = {
	Price = 167,
	Name = "Varknox Table",
	Category = "Tables"
}
t2["143836314"] = {
	Price = 155,
	Name = "Varknox Lamp",
	Category = "Lights",
	ConflictSeed = 962526262
}
t2["143836512"] = {
	Price = 186,
	Name = "Varknox TV",
	Category = "Entertainment",
	BannedInChina = true
}
t2["143839223"] = {
	Price = 13,
	Name = "Princess Ceiling Light",
	Category = "Lights",
	Gender = "Girl",
	Discontinued = true,
	AutoUnlocked = true
}
t2["143836854"] = {
	Price = 25,
	Name = "Princess Vanity",
	Category = "Decoration",
	Gender = "Girl",
	Discontinued = true,
	AutoUnlocked = true
}
t2["143836956"] = {
	Price = 14,
	Name = "Princess Chair",
	Category = "Seats",
	Gender = "Girl",
	Discontinued = true,
	AutoUnlocked = true
}
t2["143837111"] = {
	Price = 28,
	Name = "Princess Bed",
	Category = "Beds",
	Gender = "Girl",
	Discontinued = true,
	AutoUnlocked = true
}
t2["143837372"] = {
	Price = 13,
	Name = "Princess Tea Set",
	Category = "Decoration",
	TableTopItem = true,
	Gender = "Girl",
	Discontinued = true,
	AutoUnlocked = true
}
t2["143837463"] = {
	Price = 18,
	Name = "Princess Table",
	Category = "Tables",
	Gender = "Girl",
	Discontinued = true,
	AutoUnlocked = true
}
t2["143837994"] = {
	Price = 19,
	Name = "Princess Lamp",
	Category = "Lights",
	Gender = "Girl",
	Discontinued = true,
	AutoUnlocked = true
}
t2["179723976"] = {
	Price = 35,
	Name = "Sky World Table",
	Category = "Tables"
}
t2["179724975"] = {
	Price = 37,
	Name = "Sky World Couch",
	Category = "Seats",
	AutoUnlocked = true
}
t2["179726887"] = {
	Price = 30,
	Name = "Sky World Lamp",
	Category = "Lights"
}
t2["179727070"] = {
	Price = 34,
	Name = "Sky World Coffee Table",
	Category = "Tables"
}
t2["179727161"] = {
	Price = 20,
	Name = "Sky World Chair",
	Category = "Seats"
}
t2["179727311"] = {
	Price = 42,
	Name = "Sky World TV",
	Category = "Entertainment",
	ConflictSeed = 3843248242,
	BannedInChina = true
}
t2["179727375"] = {
	Price = 19,
	Name = "Sky World Pillar",
	Category = "Decoration",
	AutoUnlocked = true
}
t2["179727470"] = {
	Price = 36,
	Name = "Sky World Bed",
	Category = "Beds",
	AutoUnlocked = true
}
t2["179727700"] = {
	Price = 30,
	Name = "Sky World Armchair",
	Category = "Seats",
	AutoUnlocked = true
}
t2["1381168779"] = {
	Price = 210,
	Name = "Zeitaku Toilet",
	Category = "Kitchen/Bath",
	AutoUnlocked = true
}
t2["1799502169"] = {
	Price = 320,
	Name = "Zeitaku Shower",
	Category = "Kitchen/Bath",
	ConflictSeed = 51534534537
}
t2["1799502938"] = {
	Price = 190,
	Name = "Zeitaku Sink",
	Category = "Kitchen/Bath"
}
t2["1799503869"] = {
	Price = 280,
	Name = "Zeitaku Bathtub",
	Category = "Kitchen/Bath",
	ConflictSeed = 12257743
}
t2["2444192993"] = {
	Price = 100,
	Name = "Zeitaku Tile",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true
}
t2["1381134159"] = {
	Price = 110,
	Name = "Pizza Bed",
	Category = "Beds",
	ReleaseDate = 1517573959,
	Rarity = "Common"
}
t2["143929921"] = {
	Price = 52,
	Name = "Gumball Machine",
	Category = "Entertainment",
	Memory = 5
}
t2["143930650"] = {
	Price = 64,
	Name = "Cotton Candy Machine",
	Category = "Entertainment"
}
t2["143932424"] = {
	Price = 64,
	Name = "Popcorn Machine",
	Category = "Entertainment"
}
t2["143920685"] = {
	Price = 37,
	Name = "Mariachi Guitar",
	Category = "Entertainment",
	Memory = 3
}
t2["143920846"] = {
	Price = 39,
	Name = "Banjo",
	Category = "Entertainment",
	Memory = 3
}
t2["143920987"] = {
	Price = 70,
	Name = "Grand Piano",
	Category = "Entertainment",
	Memory = 3
}
t2["143921098"] = {
	Price = 55,
	Name = "Bass Drum",
	Category = "Entertainment",
	Memory = 3
}
t2["143921200"] = {
	Price = 90,
	Name = "Drum Set",
	Category = "Entertainment",
	Memory = 3
}
t2["282205443"] = {
	Price = 80,
	Name = "Floor Piano",
	Category = "Entertainment",
	Memory = 3,
	PhysicsBlacklisted = true
}
t2["143927276"] = {
	Price = 35,
	Name = "Turtle",
	Category = "Entertainment",
	Memory = 2
}
t2["143927375"] = {
	Price = 26,
	Name = "Snake",
	Category = "Entertainment",
	Memory = 2
}
t2["143836647"] = {
	Price = 40,
	Name = "Princess Pony",
	Category = "Entertainment",
	Memory = 2,
	PhysicsBlacklisted = true
}
t2["143958301"] = {
	Price = 35,
	Name = "Soccer Goal",
	Category = "Entertainment"
}
t2["143958391"] = {
	Price = 45,
	Name = "Soccer Ball",
	Category = "Entertainment",
	Memory = 2,
	PhysicsBlacklisted = true
}
t2["143927780"] = {
	Price = 58,
	Name = "Putt-Putt Golf Hole #1",
	Category = "Entertainment",
	Discontinued = true
}
t2["143927941"] = {
	Price = 58,
	Name = "Putt-Putt Golf Hole #2",
	Category = "Entertainment",
	Discontinued = true
}
t2["143928424"] = {
	Price = 190,
	Name = "Bowling",
	Category = "Entertainment",
	Memory = 3,
	AutoUnlocked = true,
	PhysicsBlacklisted = true,
	CantPlaceOutside = true
}
t2["143927564"] = {
	Price = 60,
	Name = "Billiards",
	Category = "Entertainment"
}
t2["316671452"] = {
	Price = 120,
	Name = "Soda Machine",
	Category = "Entertainment",
	Memory = 3
}
t2["282209168"] = {
	Price = 5,
	Name = "Bush",
	Category = "Decoration",
	Memory = 0.1,
	AutoUnlocked = true
}
t2["282208723"] = {
	Price = 4,
	Name = "Cobblestone Path",
	Category = "Decoration",
	Memory = 0.1,
	AutoUnlocked = true
}
t2["282211423"] = {
	Price = 10,
	Name = "Blue Flowers",
	Category = "Decoration",
	Memory = 0.2,
	AutoUnlocked = true
}
t2["282211900"] = {
	Price = 10,
	Name = "Pink Flowers",
	Category = "Decoration",
	Memory = 0.2,
	AutoUnlocked = true
}
t2["143932326"] = {
	Price = 64,
	Name = "Stainless Sink",
	Category = "Kitchen/Bath",
	AutoUnlocked = true
}
t2["143932184"] = {
	Price = 48,
	Name = "Stainless Microwave",
	Category = "Kitchen/Bath",
	TableTopItem = true,
	AutoUnlocked = true
}
t2["143931927"] = {
	Price = 27,
	Name = "Stainless Toaster",
	Category = "Kitchen/Bath",
	TableTopItem = true,
	AutoUnlocked = true
}
t2["143932047"] = {
	Price = 76,
	Name = "Stainless Counter",
	Category = "Kitchen/Bath",
	AutoUnlocked = true
}
t2["143931829"] = {
	Price = 72,
	Name = "Stainless Refrigerator",
	Category = "Kitchen/Bath",
	AutoUnlocked = true
}
t2["282211079"] = {
	Price = 72,
	Name = "Stainless Cabinet",
	Category = "Kitchen/Bath",
	AutoUnlocked = true
}
t2["282210212"] = {
	Price = 85,
	Name = "Stainless Stove",
	Category = "Kitchen/Bath",
	AutoUnlocked = true
}
t2["143930784"] = {
	Price = 45,
	Name = "Pink Stove",
	Category = "Kitchen/Bath",
	Gender = "Girl",
	Discontinued = true
}
t2["143930920"] = {
	Price = 54,
	Name = "Pink Sink",
	Category = "Kitchen/Bath",
	Gender = "Girl",
	Discontinued = true
}
t2["143931023"] = {
	Price = 48,
	Name = "Pink Microwave",
	Category = "Kitchen/Bath",
	TableTopItem = true,
	Gender = "Girl",
	Discontinued = true
}
t2["143931189"] = {
	Price = 51,
	Name = "Pink Toaster",
	Category = "Kitchen/Bath",
	TableTopItem = true,
	Gender = "Girl",
	Discontinued = true
}
t2["143931316"] = {
	Price = 56,
	Name = "Pink Counter",
	Category = "Kitchen/Bath",
	Gender = "Girl",
	Discontinued = true
}
t2["143931593"] = {
	Price = 72,
	Name = "Pink Refrigerator",
	Category = "Kitchen/Bath",
	Gender = "Girl",
	Discontinued = true
}
t2["143932557"] = {
	Price = 80,
	Name = "Bathroom Shower",
	Category = "Kitchen/Bath",
	AutoUnlocked = true
}
t2["143932883"] = {
	Price = 70,
	Name = "Bathroom Toilet",
	Category = "Kitchen/Bath",
	AutoUnlocked = true
}
t2["143932985"] = {
	Price = 50,
	Name = "Bathroom Sink",
	Category = "Kitchen/Bath",
	AutoUnlocked = true
}
t2["143933513"] = {
	Price = 40,
	Name = "Robot",
	Category = "Decoration",
	Memory = 2,
	Rarity = "Common"
}
t2["143933635"] = {
	Price = 35,
	Name = "Stuffed Dragon",
	Category = "Decoration",
	Memory = 2,
	Rarity = "Common"
}
t2["143933708"] = {
	Price = 35,
	Name = "Stuffed Lion",
	Category = "Decoration",
	Memory = 2,
	Rarity = "Common"
}
t2["143933816"] = {
	Price = 35,
	Name = "Stuffed Tiger",
	Category = "Decoration",
	Memory = 2,
	Rarity = "Common"
}
t2["143933983"] = {
	Price = 35,
	Name = "Stuffed Polar Bear",
	Category = "Decoration",
	Memory = 2,
	Rarity = "Common"
}
t2["141601229"] = {
	Price = 200,
	Name = "The Scream",
	Category = "Decoration",
	Rarity = "Uncommon"
}
t2["141601189"] = {
	Price = 200,
	Name = "The Persistance of Memory",
	Category = "Decoration",
	Rarity = "Uncommon"
}
t2["141601156"] = {
	Price = 200,
	Name = "The Ninth Wave",
	Category = "Decoration",
	Rarity = "Uncommon"
}
t2["141601110"] = {
	Price = 200,
	Name = "Sunday Afternoon",
	Category = "Decoration",
	Rarity = "Uncommon"
}
t2["141601045"] = {
	Price = 200,
	Name = "Starry Night",
	Category = "Decoration",
	Rarity = "Uncommon"
}
t2["141601017"] = {
	Price = 200,
	Name = "Nympheaus",
	Category = "Decoration",
	Rarity = "Uncommon"
}
t2["141600992"] = {
	Price = 200,
	Name = "Mona Lisa",
	Category = "Decoration",
	Rarity = "Uncommon"
}
t2["141600523"] = {
	Price = 200,
	Name = "Cypresses",
	Category = "Decoration",
	Rarity = "Uncommon"
}
t2["141600508"] = {
	Price = 200,
	Name = "Cafe Terrance at Night",
	Category = "Decoration",
	Rarity = "Uncommon"
}
t2["141599507"] = {
	Price = 200,
	Name = "American Gothic",
	Category = "Decoration",
	Rarity = "Uncommon"
}
t2["453460360"] = {
	Price = 9,
	Name = "The Hatch Poster",
	Category = "Decoration",
	TableTopItem = true,
	Discontinued = true,
	Year = "The Hatch",
	ModelId = 109026694895905
}
t2["1532385"] = {
	Price = 80,
	Name = "Cracked Egg of Pwnage",
	Category = "PetHats",
	Discontinued = true,
	Unsellable = true,
	Year = "The Hatch"
}
t2["822107525"] = {
	Price = 9,
	Name = "The Takeover Poster",
	Category = "Decoration",
	TableTopItem = true,
	Discontinued = true,
	Unsellable = true,
	Year = "The Takeover",
	ModelId = 86198864372842
}
t2["26011378"] = {
	Price = 80,
	Name = "): Star Tailslide",
	Category = "PetHats",
	Discontinued = true,
	Unsellable = true,
	Year = "The Takeover"
}
t2["177623842"] = {
	Price = 30,
	Name = "Takeover Skateboard",
	Category = "Gear",
	Discontinued = true,
	Unsellable = true,
	Year = "The Takeover",
	ModelId = 104869929871804
}
t2["175205527"] = {
	Price = 95,
	Name = "c00lkidd Punching Bag",
	Discontinued = true,
	Category = "Entertainment",
	Unsellable = true,
	Year = "The Takeover",
	ModelId = 123519045036574,
	PhysicsBlacklisted = true
}
t2["8199693419"] = {
	Price = 80,
	Name = "Valiant Top Hat of Testing",
	Category = "PetHats",
	Discontinued = true,
	Unsellable = true
}
t2["142751224"] = {
	Price = 5,
	Name = "None",
	Category = "Walls",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	UseMaterialOnly = true
}
t2["316650821"] = {
	Price = 40,
	Name = "Traditional Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["188774338"] = {
	Price = 45,
	Name = "Candy Cane Wall",
	Category = "Walls",
	Holiday = "Christmas",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["188735389"] = {
	Price = 45,
	Name = "Snowflake Wall",
	Category = "Walls",
	Season = "Winter",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["142981160"] = {
	Price = 48,
	Name = "Aquarium Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["142981503"] = {
	Price = 40,
	Name = "Polka Wall",
	Category = "Walls",
	ConflictSeed = 3433636,
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["142988390"] = {
	Price = 50,
	Name = "Marble Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["142981169"] = {
	Price = 50,
	Name = "Fruity Wall",
	Category = "Walls",
	ConflictSeed = 14950835,
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["187726462"] = {
	Price = 53,
	Name = "Acorn Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["142985767"] = {
	Price = 35,
	Name = "Turkey Leg Wall\240\159\166\131",
	Category = "Walls",
	Holiday = "Thanksgiving",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["140915921"] = {
	Price = 47,
	Name = "Tot Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["3501220"] = {
	Price = 38,
	Name = "Rock Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["140127298"] = {
	Price = 35,
	Name = "Antler Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["141535417"] = {
	Price = 25,
	Name = "Princess Wall",
	Category = "Walls",
	Gender = "Girl",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["140191658"] = {
	Price = 60,
	Name = "Modern Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["141561887"] = {
	Price = 162,
	Name = "Varknox Wall",
	Category = "Walls",
	ConflictSeed = 51548997765,
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["142995302"] = {
	Price = 50,
	Name = "Void Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["305574531"] = {
	Price = 30,
	Name = "Halloween Wall",
	Category = "Walls",
	Holiday = "Halloween",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["304316862"] = {
	Price = 30,
	Name = "Jack Wall",
	Category = "Walls",
	Holiday = "Halloween",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["304316868"] = {
	Price = 35,
	Name = "Aquascape Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["305594019"] = {
	Price = 25,
	Name = "Forest Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["316654528"] = {
	Price = 68,
	Name = "Library Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["316654495"] = {
	Price = 55,
	Name = "Bamboo Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["316646023"] = {
	Price = 75,
	Name = "Palm Tree Wall",
	Category = "Walls",
	Season = "Summer",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["316645953"] = {
	Price = 25,
	Name = "Monster Wall",
	Category = "Walls",
	ConflictSeed = 578324242,
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["1518579994"] = {
	Price = 45,
	Name = "Lovely Wall",
	Category = "Walls",
	Gender = "Girl",
	Creator = "Yozoh",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["3806106418"] = {
	Price = 45,
	Name = "Dojo Wall",
	Category = "Walls",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["4104967215"] = {
	Price = 30,
	Name = "Ghost Wall",
	Category = "Walls",
	Holiday = "Halloween",
	AutoUnlocked = true,
	BannedInChina = true,
	Discontinued = true,
	Unsellable = true
}
t2["2506594647"] = {
	Price = 40,
	Name = "Candy Wall",
	Category = "Walls",
	Holiday = "Halloween",
	AutoUnlocked = true,
	BannedInChina = true,
	Discontinued = true,
	Unsellable = true
}
t2["7851072129"] = {
	Price = 40,
	Name = "Evil Jack Wall",
	Category = "Walls",
	Holiday = "Halloween",
	BannedInChina = true,
	Unsellable = true,
	Discontinued = true
}
t2["5834868053"] = {
	Price = 60,
	Name = "\240\159\142\131Spooky Forest",
	Category = "Walls",
	BannedInChina = true,
	Unsellable = true,
	Discontinued = true
}
t2["8035666853"] = {
	Price = 45,
	Name = "Fall Floral Wall",
	Category = "Walls",
	AutoUnlocked = true,
	New = 1637871151,
	Discontinued = true,
	Unsellable = true
}
t2["8035666721"] = {
	Price = 90,
	Name = "Fancy Wall",
	Category = "Walls",
	AutoUnlocked = true,
	New = 1637871151,
	Discontinued = true,
	Unsellable = true
}
t2["8035666491"] = {
	Price = 30,
	Name = "Ornament Wall",
	Category = "Walls",
	Holiday = "Christmas",
	AutoUnlocked = true,
	Discontinued = true,
	Unsellable = true
}
t2["8035667075"] = {
	Price = 35,
	Name = "Billow Wall",
	Category = "Walls",
	AutoUnlocked = true,
	New = 1637871151,
	Discontinued = true,
	Unsellable = true
}
t2["8035666392"] = {
	Price = 45,
	Name = "Retro Modern Wall",
	Category = "Walls",
	AutoUnlocked = true,
	New = 1637871151,
	Discontinued = true,
	Unsellable = true
}
t2["8035666240"] = {
	Price = 100,
	Name = "Zeitaku Wall",
	Category = "Walls",
	AutoUnlocked = true,
	New = 1637871151,
	Discontinued = true,
	Unsellable = true
}
t2["8035666995"] = {
	Price = 42,
	Name = "Pastel Diamond Wall",
	Category = "Walls",
	AutoUnlocked = true,
	New = 1637871151,
	Discontinued = true,
	Unsellable = true
}
t2["8035666635"] = {
	Price = 360,
	Name = "Junk Food Wall",
	Category = "Walls",
	Discontinued = true,
	Unsellable = true
}
t2["123435689"] = {
	Price = 10,
	Name = "Cement",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	UseMaterialOnly = true
}
t2["142263417"] = {
	Price = 10,
	Name = "Hardwood",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	UseMaterialOnly = true,
	AutoUnlocked = true
}
t2["190244134"] = {
	Price = 26,
	Name = "Overlay Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["142999362"] = {
	Price = 15,
	Name = "Blue Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	UseMaterialOnly = true
}
t2["142998844"] = {
	Price = 15,
	Name = "Yellow Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	UseMaterialOnly = true
}
t2["142998003"] = {
	Price = 15,
	Name = "Red Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	UseMaterialOnly = true
}
t2["142995520"] = {
	Price = 15,
	Name = "Green Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	UseMaterialOnly = true
}
t2["142995494"] = {
	Price = 15,
	Name = "Brown Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	UseMaterialOnly = true
}
t2["142995534"] = {
	Price = 25,
	Name = "Ice Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	UseMaterialOnly = true
}
t2["142995484"] = {
	Price = 26,
	Name = "Sand Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	UseMaterialOnly = true
}
t2["142996420"] = {
	Price = 46,
	Name = "Marble Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	UseMaterialOnly = true
}
t2["142998324"] = {
	Price = 30,
	Name = "Uhglay Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	UseMaterialOnly = true
}
t2["142995736"] = {
	Price = 16,
	Name = "Industrial Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["190245059"] = {
	Price = 35,
	Name = "Inlaid Parquet Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["142985807"] = {
	Price = 25,
	Name = "Aquarium Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["142985797"] = {
	Price = 30,
	Name = "Lilly Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["142981133"] = {
	Price = 30,
	Name = "Stitch Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["142956350"] = {
	Price = 24,
	Name = "Polka Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["142956286"] = {
	Price = 26,
	Name = "Jig Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["142956243"] = {
	Price = 27,
	Name = "Plainsawn Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["142998479"] = {
	Price = 50,
	Name = "Void Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["140913922"] = {
	Price = 18,
	Name = "Tot Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	ConflictSeed = 2757298333,
	AutoUnlocked = true
}
t2["141568602"] = {
	Price = 40,
	Name = "Outdoors Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["140107853"] = {
	Price = 30,
	Name = "Antler Rug",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["140191046"] = {
	Price = 78,
	Name = "Modern Tile",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["141535632"] = {
	Price = 19,
	Name = "Princess Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	Gender = "Girl",
	AutoUnlocked = true
}
t2["179728796"] = {
	Price = 70,
	Name = "Sky World Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["190231424"] = {
	Price = 75,
	Name = "Gold Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["142998700"] = {
	Price = 100,
	Name = "Varknox Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["4045253580"] = {
	Price = 20,
	Name = "\240\159\141\130Fall Flooring",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	Season = "Fall"
}
t2["5828629373"] = {
	Price = 20,
	Name = "\240\159\141\130Autumn Flooring",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	Season = "Fall"
}
t2["4515247228"] = {
	Price = 30,
	Name = "\240\159\142\132Snow Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	Season = "Winter"
}
t2["305573676"] = {
	Price = 25,
	Name = "Jack Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	Holiday = "Halloween",
	AutoUnlocked = true
}
t2["304307028"] = {
	Price = 46,
	Name = "X Tile Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["304313444"] = {
	Price = 62,
	Name = "Blue Polly Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["316654650"] = {
	Price = 44,
	Name = "Wood Parquet Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["316645814"] = {
	Price = 36,
	Name = "Pinwheel Stone Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["316645741"] = {
	Price = 48,
	Name = "Blackwood Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["316645696"] = {
	Price = 46,
	Name = "Groovy Rug",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["316645804"] = {
	Price = 50,
	Name = "Tile",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["1518579642"] = {
	Price = 100,
	Name = "Lovely Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	Gender = "Girl",
	Creator = "Yozoh",
	AutoUnlocked = true
}
t2["1009993511"] = {
	Price = 105,
	Name = "Neon Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	VIP = true,
	AutoUnlocked = true,
	UseMaterialOnly = true
}
t2["3806922949"] = {
	Price = 32,
	Name = "Dojo Mat",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true
}
t2["8035753475"] = {
	Price = 22,
	Name = "Water Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	New = 1637871151
}
t2["8035754201"] = {
	Price = 20,
	Name = "Grass Weave Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	New = 1637871151
}
t2["8035753981"] = {
	Price = 30,
	Name = "Haunted Wood Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	New = 1637871151
}
t2["8035753828"] = {
	Price = 25,
	Name = "Neutral Carpet",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	New = 1637871151
}
t2["8035754843"] = {
	Price = 20,
	Name = "Circular Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	New = 1637871151
}
t2["8035754628"] = {
	Price = 20,
	Name = "Clove Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	AutoUnlocked = true,
	New = 1637871151
}
t2["8035753728"] = {
	Price = 120,
	Name = "Road Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	Rarity = "Uncommon"
}
t2["8035754413"] = {
	Price = 150,
	Name = "Forest Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	Rarity = "Uncommon"
}
t2["8035754923"] = {
	Price = 170,
	Name = "Unsafe Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	Rarity = "Uncommon"
}
t2["8035753623"] = {
	Price = 340,
	Name = "Steampunk Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true
}
t2["8035755017"] = {
	Price = 320,
	Name = "Arcade Floor",
	Category = "Floors",
	Discontinued = true,
	Unsellable = true,
	Rarity = "Rare"
}
t2["142269326"] = {
	Price = 4,
	Name = "Small Wall",
	Category = "Customization",
	Memory = 0.1,
	AutoUnlocked = true
}
t2["318876288"] = {
	Price = 4,
	Name = "Platform Wall",
	Category = "Customization",
	Memory = 0.1,
	AutoUnlocked = true
}
t2["198245133"] = {
	Price = 25,
	Name = "Fake Small Wall",
	Category = "Customization",
	Memory = 0.1,
	AutoUnlocked = true
}
t2["142269444"] = {
	Price = 9,
	Name = "Large Wall",
	Category = "Customization",
	Memory = 0.2,
	AutoUnlocked = true
}
t2["1677953972"] = {
	Price = 13,
	Name = "Extra Large Wall",
	Category = "Customization",
	Memory = 0.3,
	AutoUnlocked = true
}
t2["142269399"] = {
	Price = 9,
	Name = "Stairs",
	Category = "Customization",
	Memory = 0.1,
	AutoUnlocked = true
}
t2["157751266"] = {
	Price = 21,
	Name = "Door",
	Category = "Doors",
	Memory = 0.3,
	AutoUnlocked = true
}
t2["157751189"] = {
	Price = 45,
	Name = "Friend Door",
	Category = "Doors",
	Memory = 0.3,
	AutoUnlocked = true
}
t2["240481988"] = {
	Price = 40,
	Name = "Owner Door",
	Category = "Doors",
	Memory = 0.3,
	ConflictSeed = 1044933,
	AutoUnlocked = true
}
t2["157744805"] = {
	Price = 490,
	Name = "Music Player",
	Category = "Customization",
	Memory = 0.5,
	AutoUnlocked = true
}
t2["157972883"] = {
	Price = 25,
	Name = "Multi Light",
	Category = "Customization",
	AutoUnlocked = true
}
t2["157972955"] = {
	Price = 25,
	Name = "Sign",
	Category = "Customization",
	TableTopItem = true,
	Memory = 0.3,
	AutoUnlocked = true,
	BannedInChina = true
}
t2["157973341"] = {
	Price = 40,
	Name = "Poster",
	Category = "Customization",
	TableTopItem = true,
	Memory = 0.2,
	ConflictSeed = 820832084,
	AutoUnlocked = true,
	BannedInChina = true
}
t2["659485453"] = {
	Price = 40,
	Name = "Small Poster",
	Category = "Customization",
	TableTopItem = true,
	Memory = 0.1,
	AutoUnlocked = true,
	BannedInChina = true,
	ModelId = 17801328967,
	VIP = true,
	New = 1718589801,
	TestItem = true
}
t2["529348734"] = {
	Price = 7,
	Name = "Wedge",
	Category = "Customization",
	Memory = 0.1,
	ModelId = 83770432842979,
	AutoUnlocked = true,
	New = 1732572665
}
t2["234989734"] = {
	Price = 8,
	Name = "Wedge Corner",
	Category = "Customization",
	Memory = 0.1,
	ModelId = 125687715336785,
	AutoUnlocked = true,
	New = 1732572665
}
t2["875663655"] = {
	Price = 8,
	Name = "Wedge Corner 2",
	Category = "Customization",
	Memory = 0.1,
	ModelId = 97727474817887,
	AutoUnlocked = true,
	New = 1732572665
}
t2["732556266"] = {
	Price = 10,
	Name = "Stairs Corner",
	Category = "Customization",
	Memory = 0.1,
	ModelId = 113145401604348,
	AutoUnlocked = true,
	New = 1732572665
}
t2["157978401"] = {
	Price = 40,
	Name = "Shirt Display",
	Category = "Customization",
	BannedInChina = true,
	AutoUnlocked = true
}
t2["157978740"] = {
	Price = 40,
	Name = "Pants Display",
	Category = "Customization",
	BannedInChina = true,
	AutoUnlocked = true
}
t2["7979068624"] = {
	Price = 35,
	Name = "Face Display",
	Category = "Customization",
	BannedInChina = true,
	AutoUnlocked = true,
	TableTopItem = true,
	New = 1637871151,
	CantPlaceOutside = true
}
t2["7978968210"] = {
	Price = 35,
	Name = "Head Accessory Display",
	Category = "Customization",
	BannedInChina = true,
	AutoUnlocked = true,
	TableTopItem = true,
	New = 1637871151,
	CantPlaceOutside = true
}
t2["912780197"] = {
	Price = 50,
	Name = "Accessory Display",
	Category = "Customization",
	BannedInChina = true,
	AutoUnlocked = true
}
t2["240481814"] = {
	Price = 250,
	Name = "Kick Button",
	Category = "Customization",
	AutoUnlocked = true
}
t2["1007861463"] = {
	Price = 260,
	Name = "Party Inviter",
	Category = "Customization",
	VIP = true,
	AutoUnlocked = true
}
t2["157973470"] = {
	Price = 50,
	Name = "Place Portal",
	Category = "Customization",
	TableTopItem = true,
	AutoUnlocked = true,
	BannedInChina = true
}
t2["282231144"] = {
	Price = 35,
	Name = "Robloxian Poster",
	Category = "Customization",
	TableTopItem = true,
	Memory = 2,
	AutoUnlocked = true,
	BannedInChina = true
}
t2["637813231"] = {
	Price = 19,
	Name = "Pixel Art Canvas",
	Category = "Customization",
	DisabledOnConsole = true,
	TableTopItem = true,
	Memory = 0.3,
	AutoUnlocked = true,
	BannedInChina = true
}
t2["1371732689"] = {
	Price = 80,
	Name = "Like Button",
	Category = "Customization",
	AutoUnlocked = true,
	CantPlaceOutside = true
}
t2["6092454598"] = {
	Price = 30,
	Name = "Streak Counter",
	Category = "Customization",
	ModelId = 15084192103,
	AutoUnlocked = true,
	New = 1698027709
}
t2["567633476"] = {
	Price = 45,
	Name = "Castle Glass Door",
	Category = "Doors",
	ModelId = 80260398979945,
	AutoUnlocked = true,
	New = 1732572665
}
t2["876348756"] = {
	Price = 50,
	Name = "Modern Double Doors",
	Category = "Doors",
	ModelId = 101526909074777,
	AutoUnlocked = true,
	New = 1732572665
}
t2["496795776"] = {
	Price = 70,
	Name = "Castle Double Doors",
	Category = "Doors",
	ModelId = 130350505063698,
	AutoUnlocked = true,
	New = 1732572665
}
t2["875374745"] = {
	Price = 30,
	Name = "Standard Door",
	Category = "Doors",
	ModelId = 80962142472810,
	AutoUnlocked = true,
	New = 1732572665
}
t2["787528455"] = {
	Price = 30,
	Name = "Standard Door 2",
	Category = "Doors",
	ModelId = 136358248499552,
	AutoUnlocked = true,
	New = 1732572665
}
t2["898365656"] = {
	Price = 30,
	Name = "Standard Door 3",
	Category = "Doors",
	ModelId = 132555589980071,
	AutoUnlocked = true,
	New = 1732572665
}
t2["678765636"] = {
	Price = 30,
	Name = "Standard Door 4",
	Category = "Doors",
	ModelId = 70861618927511,
	AutoUnlocked = true,
	New = 1732572665
}
t2["856767654"] = {
	Price = 35,
	Name = "Modern Door",
	Category = "Doors",
	ModelId = 135131784853284,
	AutoUnlocked = true,
	New = 1732572665
}
t2["867676679"] = {
	Price = 35,
	Name = "Modern Door 2",
	Category = "Doors",
	ModelId = 115399632083446,
	AutoUnlocked = true,
	New = 1732572665
}
t2["235467686"] = {
	Price = 35,
	Name = "Modern Glass Door",
	Category = "Doors",
	ModelId = 98507149613921,
	AutoUnlocked = true,
	New = 1732572665
}
t2["664739337"] = {
	Price = 35,
	Name = "Modern Glass Door 2",
	Category = "Doors",
	ModelId = 74030597811046,
	AutoUnlocked = true,
	New = 1732572665
}
t2["876766755"] = {
	Price = 35,
	Name = "Hole Door",
	Category = "Doors",
	ModelId = 116202855155085,
	AutoUnlocked = true,
	New = 1732572665
}
t2["80576967"] = {
	Price = 50,
	Name = "Spray Paint",
	Category = "Gear",
	DisabledOnConsole = true,
	Discontinued = true,
	Unsellable = true,
	Refund = true
}
t2["163350265"] = {
	Price = 150,
	Name = "Fire Breath",
	Category = "Gear"
}
t2["31314931"] = {
	Price = 90,
	Name = "Epic Sauce",
	Category = "Gear"
}
t2["27494652"] = {
	Price = 75,
	Name = "Green Balloon",
	Category = "Gear"
}
t2["27133214"] = {
	Price = 90,
	Name = "Binoculray",
	Category = "Gear",
	DisabledOnConsole = true
}
local t4 = {
	Price = 580,
	Name = "Grapple Hook",
	Category = "Gear",
	VideoId = 15423577595
}
t4.ProductId = if v1.IsTestPlace then 30393855 else 22265334
t2["30393548"] = t4
t2["116040770"] = {
	Price = 50,
	Name = "Flashlight",
	Category = "Gear"
}
t2["193771176"] = {
	Price = 100,
	Name = "Rockin\' Pink Guitar",
	Discontinued = true,
	Category = "Gear",
	DisabledOnConsole = true,
	Refund = true
}
t2["163348987"] = {
	Price = 100,
	Name = "Cymbals",
	Category = "Gear"
}
t2["20373160"] = {
	Price = 90,
	Name = "Cowbell",
	Category = "Gear"
}
t2["45094376"] = {
	Price = 130,
	Name = "Saxophone",
	Category = "Gear"
}
t2["16688968"] = {
	Price = 250,
	Name = "Gravity Coil",
	Category = "Gear"
}
t2["21392199"] = {
	Price = 45,
	Name = "Chocolate Milk",
	Category = "Gear"
}
t2["172248941"] = {
	Price = 300,
	Name = "Penguin Power Pet",
	Category = "Gear",
	ConflictSeed = 825725,
	Refund = true,
	Discontinued = true
}
t2["84012460"] = {
	Price = 150,
	Name = "Fluffy Unicorn",
	Category = "Gear",
	Refund = true,
	Discontinued = true
}
t2["58574445"] = {
	Price = 110,
	Name = "ROBLOX Portable Game System",
	Category = "Gear",
	Refund = true,
	Discontinued = true,
	DisabledOnConsole = true
}
t2["22596452"] = {
	Price = 45,
	Name = "Pepperoni Pizza",
	Category = "Gear"
}
t2["26419811"] = {
	Price = 50,
	Name = "BANG!",
	Category = "Gear",
	ConflictSeed = 8885252
}
t2["66426103"] = {
	Price = 120,
	Name = "Gamaboi",
	Category = "Gear",
	DisabledOnConsole = true,
	Refund = true,
	Discontinued = true
}
t2["12547976"] = {
	Price = 45,
	Name = "Space Sandwich",
	Category = "Gear"
}
t2["15177716"] = {
	Price = 55,
	Name = "Taco",
	Category = "Gear"
}
t2["60357989"] = {
	Price = 80,
	Name = "Silly Stilts",
	Category = "Gear"
}
t2["57229357"] = {
	Price = 80,
	Name = "Paper Sword",
	Category = "Gear"
}
t2["31839411"] = {
	Price = 60,
	Name = "Fire Extinguisher",
	Category = "Gear"
}
t2["78367424"] = {
	Price = 40,
	Name = "Tiger Friend",
	Category = "Gear"
}
t2["16726030"] = {
	Price = 50,
	Name = "Cheezburger",
	Category = "Gear"
}
t2["46846115"] = {
	Price = 110,
	Name = "Ninja Jump Potion",
	Category = "Gear"
}
t2["90242059"] = {
	Price = 130,
	Name = "Adventure Island",
	Category = "Gear",
	Refund = true,
	Discontinued = true,
	DisabledOnConsole = true
}
t2["29939404"] = {
	Price = 50,
	Name = "Hot Dog",
	Category = "Gear",
	DisabledOnConsole = true
}
t2["46846246"] = {
	Price = 45,
	Name = "Panda Friend",
	Category = "Gear",
	BannedInChina = true
}
t2["25974222"] = {
	Price = 20,
	Name = "Beach Ball",
	Category = "Gear",
	Refund = true,
	Discontinued = true
}
t2["176087597"] = {
	Price = 25,
	Name = "ROBLOX U Frisbee",
	Category = "Gear"
}
t2["13477890"] = {
	Price = 60,
	Name = "Pirate Juice",
	Category = "Gear",
	BannedInChina = true
}
t2["85145662"] = {
	Price = 190,
	Name = "Lunar Lander 2D Game",
	Category = "Gear",
	DisabledOnConsole = true
}
t2["22960435"] = {
	Price = 40,
	Name = "Protest Sign: Noobs",
	Category = "Gear"
}
t2["73829202"] = {
	Price = 170,
	Name = "RoMaze",
	Category = "Gear",
	DisabledOnConsole = true,
	Refund = true,
	Discontinued = true
}
t2["81330766"] = {
	Price = 400,
	Name = "Time Watch",
	Category = "Gear"
}
t2["99254437"] = {
	Price = 100,
	Name = "Ipad",
	Category = "Gear"
}
t2["76170545"] = {
	Price = 160,
	Name = "Race the Sunset",
	Category = "Gear",
	DisabledOnConsole = true,
	Refund = true,
	Discontinued = true
}
t2["22787248"] = {
	Price = 55,
	Name = "Watermelon",
	Category = "Gear"
}
t2["76170471"] = {
	Price = 75,
	Name = "Hedgehog Friend",
	Category = "Gear"
}
t2["28672001"] = {
	Price = 75,
	Name = "Goala Cola",
	Category = "Gear"
}
t2["18426536"] = {
	Price = 120,
	Name = "Apple Pie",
	Category = "Gear",
	Refund = true,
	Discontinued = true
}
t2["12848902"] = {
	Price = 60,
	Name = "Teddy Bloxpin",
	Category = "Gear"
}
t2["19328185"] = {
	Price = 20,
	Name = "Snowball",
	Category = "Gear",
	DisabledOnConsole = true
}
t2["125013769"] = {
	Price = 75,
	Name = "Linked Sword",
	Category = "Gear"
}
t2["11895536"] = {
	Price = 50,
	Name = "Bloxilicious Bubble Gum",
	Category = "Gear",
	Discontinued = true,
	Refund = true
}
t2["27902303"] = {
	Price = 400,
	Name = "ROBLOX Skateboard",
	Category = "Gear",
	DisabledOnConsole = true,
	Discontinued = true,
	Refund = true
}
t2["44116233"] = {
	Discontinued = true,
	Price = 300,
	Name = "Megaphone",
	Category = "Gear",
	Refund = true
}
t2["18479357"] = {
	Discontinued = true,
	Price = 220,
	Name = "Boomerang",
	Category = "Gear",
	Refund = true
}
t2["55301897"] = {
	Discontinued = true,
	Price = 140,
	Name = "Baseball Bat",
	Category = "Gear",
	Refund = true
}
t2["18210455"] = {
	Discontinued = true,
	Price = 190,
	Name = "Four-In-A-Row",
	Category = "Gear",
	Refund = true
}
t2["16924676"] = {
	Discontinued = true,
	Price = 210,
	Name = "Tic Tac Toe Board",
	Category = "Gear",
	Refund = true,
	ConflictSeed = 598076533
}
t2["27471379"] = {
	Discontinued = true,
	Price = 200,
	Name = "Battle Wagons!",
	Category = "Gear",
	Refund = true
}
t2["29532138"] = {
	Discontinued = true,
	Price = 65,
	Name = "Bloxxy Radar",
	Category = "Gear",
	Refund = true
}
t2["201756469"] = {
	Discontinued = true,
	Price = 120,
	Name = "Smashing Guitar",
	Category = "Gear",
	Refund = true
}
t2["4537885522"] = {
	Price = 30,
	Name = "Gauntlet",
	Category = "Gear",
	Discontinued = true,
	Unsellable = true,
	Year = 2019
}
t2["4527786585"] = {
	Price = 30,
	Name = "Pogo Stick",
	Category = "Gear",
	Discontinued = true,
	Unsellable = true,
	Year = 2019
}
t2["4525515040"] = {
	Price = 30,
	Name = "Skateboard",
	Category = "Gear",
	Discontinued = true,
	Unsellable = true,
	Year = 2019
}
t2["3915954682"] = {
	Price = 30,
	Name = "Cooler",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3942287578"] = {
	Price = 20,
	Name = "Frisbee",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959222357"] = {
	Price = 35,
	Name = "Tennis Racquet",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959243003"] = {
	Price = 60,
	Name = "Weight",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959235495"] = {
	Price = 35,
	Name = "Slugger",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959273565"] = {
	Price = 20,
	Name = "Axe",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959294111"] = {
	Price = 40,
	Name = "Blowup Hammer",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959312276"] = {
	Price = 30,
	Name = "Foldable Chair",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959315812"] = {
	Price = 25,
	Name = "Hair dryer",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959318754"] = {
	Price = 20,
	Name = "Marshmellow on a Stick",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959320994"] = {
	Price = 80,
	Name = "Tent",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959324140"] = {
	Price = 20,
	Name = "Hammer",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959329264"] = {
	Price = 25,
	Name = "Pen and Paper",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959334673"] = {
	Price = 25,
	Name = "Wrench",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959340651"] = {
	Price = 40,
	Name = "Campfire",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959343237"] = {
	Price = 20,
	Name = "Bongos",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959347601"] = {
	Price = 10,
	Name = "Cone",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959410419"] = {
	Price = 15,
	Name = "Lantern",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959415241"] = {
	Price = 100,
	Name = "Watergun",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959421514"] = {
	Price = 150,
	Name = "Flamethrower",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959423785"] = {
	Price = 5,
	Name = "Icecream",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959427066"] = {
	Price = 45,
	Name = "Leafblower",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959429055"] = {
	Price = 35,
	Name = "Mic",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959435859"] = {
	Price = 10,
	Name = "Pillow",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959438531"] = {
	Price = 25,
	Name = "Whoopie",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959444008"] = {
	Price = 10,
	Name = "Cup",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959449686"] = {
	Price = 45,
	Name = "Spyglass",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959453138"] = {
	Price = 15,
	Name = "Cereal",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959456065"] = {
	Price = 35,
	Name = "Suitcase",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959460506"] = {
	Price = 10,
	Name = "Key",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959484684"] = {
	Price = 75,
	Name = "Sleeping Bag",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3959239370"] = {
	Price = 50,
	Name = "Trampoline",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear",
	PhysicsBlacklisted = true
}
t2["3959245165"] = {
	Price = 25,
	Name = "Football",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["3964475739"] = {
	Price = 15,
	Name = "Drill",
	Category = "Gear",
	Discontinued = true,
	PresentType = "Gear"
}
t2["2506610512"] = {
	Price = 30,
	Name = "Broomstick",
	Category = "Gear",
	Discontinued = true,
	Unsellable = true
}
t2["78730532"] = {
	Price = 30,
	Name = "Body Swap Potion",
	Category = "Gear",
	Discontinued = true,
	Unsellable = true
}
t2["946756757"] = {
	ModelId = 81197350829196,
	Price = 0,
	Name = "Silver Mailbox",
	Category = "Mailboxes",
	Discontinued = true,
	Unsellable = true,
	TestItem = true
}
t2["667346345"] = {
	ModelId = 120719487322105,
	Price = 0,
	Name = "Autumn Mailbox",
	Category = "Mailboxes",
	GamepassId = "AutumnBundle",
	Discontinued = true,
	Unsellable = true,
	TestItem = true
}
t2["903646767"] = {
	ModelId = 113056852076575,
	Price = 250,
	Name = "Brick Mailbox",
	Category = "Mailboxes",
	Unsellable = true,
	TestItem = true
}
t2["653645746"] = {
	ModelId = 86469678499881,
	Price = 0,
	Name = "Gothic Mailbox",
	Category = "Mailboxes",
	GamepassId = "HalloweenBundle",
	Unsellable = true,
	TestItem = true
}
t2["705297287"] = {
	ModelId = 105141512150349,
	Price = 0,
	Name = "Christmas Mailbox",
	Category = "Mailboxes",
	GamepassId = "Cabin",
	Unsellable = true,
	TestItem = true
}
t.AssetLibrary = t2
local function removeEmojis(p1) --[[ removeEmojis | Line: 1522 ]]
	local t = {
		{ 128512, 128591 },
		{ 127744, 128511 },
		{ 128640, 128767 },
		{ 9728, 9983 },
		{ 9984, 10175 },
		{ 65024, 65039 },
		{ 129280, 129535 },
		{ 127462, 127487 }
	}
	local function isEmoji(p1) --[[ isEmoji | Line: 1535 | Upvalues: t (copy) ]]
		local v1 = utf8.codepoint(p1)
		for i, v in ipairs(t) do
			if v[1] <= v1 and v1 <= v[2] then
				return true
			end
		end
		return false
	end
	local t2 = {}
	for v1, v2 in utf8.codes(p1) do
		if not isEmoji(utf8.char(v2)) then
			table.insert(t2, utf8.char(v2))
		end
	end
	return table.concat(t2)
end
function t.Initialize() --[[ Initialize | Line: 1556 | Upvalues: t (copy), removeEmojis (copy), Debug (copy) ]]
	local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
	local v2 = require(game.ReplicatedStorage:WaitForChild("Enums"))
	t.SmallKeyToLargeKey = {}
	local v3 = game:GetService("CollectionService"):GetTagged("PetHat")
	if v2.IsServer then
		for i, v in ipairs(workspace.PetHats:GetDescendants()) do
			if v.Name == "HatModel" then
				local Hat = v1:GetNearestPart(v.Body, v3)
				v.Name = Hat.Name
				local HatAttachment = Instance.new("Attachment")
				HatAttachment.CFrame = Hat.CFrame:ToObjectSpace(v.Body.HatAttachment.WorldCFrame)
				HatAttachment.Name = "HatAttachment"
				HatAttachment.Parent = Hat
				Hat.Name = "Hat"
				Hat.Parent = v
			end
		end
		workspace.NewPets.Parent = game.ReplicatedStorage.PetObjects
		workspace.PetHats.Parent = game.ReplicatedStorage.PetObjects
		workspace.PetEyeColors.Parent = game.ReplicatedStorage.PetObjects
	end
	for k, v in pairs(t.AssetLibrary) do
		local v7 = tonumber((string.sub(k, string.len(k) - 5, (string.len(k)))))
		t.SmallKeyToLargeKey[v7] = tonumber(k)
		for k2, v8 in pairs(t.AssetLibrary) do
			if k2 ~= k and v7 == tonumber((string.sub(k2, string.len(k2) - 5, (string.len(k2))))) then
				error("ID compression conflict between " .. v.Name .. " and " .. v8.Name .. ". Both items have the same last 5 digits in their id. Need to republish one of them")
			end
		end
	end
	local v11 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("BitBuffer"):Create()
	local count = 0
	for k, v in pairs(t.AssetLibrary) do
		count = count + 1
		if v.Category ~= "None" then
			if v.PresentType and (v.Unsellable and game["Run Service"]:IsServer()) then
				warn((("Unobtainable Present Item: Asset \'%*\' (%*) is in the %* present list, but is unsellable."):format(v.Name, k, v.PresentType)))
			end
			local v12 = script[v.Category]:FindFirstChild(removeEmojis(v.Name)) or script[v.Category]:FindFirstChild(v.Name)
			if v12 then
				if v.Category == "Walls" or v.Category == "Floors" then
					if not v12:IsA("Part") then
						error(v.Name .. " is a " .. v12.ClassName .. " when it should be a Part")
					end
				elseif v.Category == "Gear" then
					if not v12:IsA("Tool") then
						error(v.Name .. " is a " .. v12.ClassName .. " when it should be a Tool")
					end
				elseif v.Category == "PetHats" then
					if not v12:IsA("SpecialMesh") then
						error(v.Name .. " is a " .. v12.ClassName .. " when it should be a Tool")
					end
				elseif not v12:IsA("Model") then
					error(v.Name .. " is a " .. v12.ClassName .. " when it should be a Model" .. v.Category)
				end
				v12.Name = v.Name
				if v.Category ~= "PetHats" and (v.Category ~= "Gear" and (v.Category ~= "Walls" and v.Category ~= "Floors")) then
					v12.Parent = script[v.Category]
				end
			end
			if v.Category ~= "Gear" or not v.Refund then
				if not script[v.Category] then
					error("Category \'" .. v.Category .. "\' does not exist for " .. v.Name)
				end
				if not v12 then
					error(v.Name .. " does not have an object associated with it. Maybe misspelled?")
				end
			end
			game:GetService("CollectionService"):AddTag(v12, "Furniture")
			v11:WriteUnsigned(33, (tonumber(k)))
			t.AssetLibrary[k].Object = v12
			t.AssetLibrary[k].AutoUnlocked = true
			t.AssetLibrary[k].AssetId = k
			t.AssetLibrary[k].ModelId = t.AssetLibrary[k].ModelId or k
			if v12 then
				v12:SetAttribute("AssetId", (tonumber(k)))
			end
			if v12 and v12:FindFirstChild("Config") then
				local StartConfig = Instance.new("RemoteEvent")
				StartConfig.Name = "StartConfig"
				StartConfig.Parent = v12
			end
			if Debug.Enabled and Debug.UnlockAllFurniture or Debug.EnabledOnline and Debug.EverythingUnlocked then
				v.AutoUnlocked = true
			end
			if v.Category == "PetHats" and v.Name ~= "No Hat" then
				for i, v4 in ipairs({ "Baby", "Adult", "Teen", "Legacy" }) do
					local v13 = game.ReplicatedStorage.PetObjects.PetHats[v4]:FindFirstChild(removeEmojis(v.Name))
					if not (v13 and v13:FindFirstChild("Hat")) then
						error("Pet hat is missing: " .. v4 .. " " .. v.Name)
					end
				end
			end
			if v.TableTopItem then
				local TableTopItem = Instance.new("IntValue")
				TableTopItem.Name = "TableTopItem"
				TableTopItem.Parent = v.Object
			end
			if game.PlaceId == v2.PizzaPlaceTestId and (v2.IsOnline and (v.New and v.New > tick())) then
				t.AssetLibrary[k].Price = 1
				continue
			end
			local v14 = t.AssetLibrary[k]
			v14.Price = v14.Price * 10
		end
	end
	function FindAndDestroyCamera(p1) --[[ FindAndDestroyCamera | Line: 1785 ]]
		if p1:IsA("Camera") then
			p1:Destroy()
			return
		end
		for i, v in ipairs(p1:GetChildren()) do
			if v:IsA("BasePart") and not (v:IsA("VehicleSeat") or v:IsA("Seat")) then
				v.Locked = true
			end
			FindAndDestroyCamera(v)
		end
	end
	FindAndDestroyCamera(script)
	function round(p1, p2) --[[ round | Line: 1803 ]]
		return math.floor(p1 / p2 + 0.5) * p2
	end
	function roundUp(p1, p2) --[[ roundUp | Line: 1807 ]]
		if p1 - math.floor(p1) < 0.1 then
			return round(p1, p2)
		else
			return math.ceil(p1 / p2) * p2
		end
	end
	local function AddBorder(p1, p2, p3) --[[ AddBorder | Line: 1815 | Upvalues: v1 (copy) ]]
		if p1:FindFirstChild("Border") then
			p1.PrimaryPart = p1.Border
			local BorderPointer = Instance.new("ObjectValue")
			BorderPointer.Name = "BorderPointer"
			BorderPointer.Value = p1.Border
			BorderPointer.Parent = p1
			p1.Border.CanCollide = false
			local SelectionBox = Instance.new("SelectionBox")
			SelectionBox.Adornee = p1.Border
			SelectionBox.LineThickness = 0.001
			SelectionBox.Color3 = Color3.new(255/255, 255/255, 255/255)
			SelectionBox.Parent = p1.Border
			game:GetService("CollectionService"):AddTag(p1.Border, "Border")
		else
			local v12, v2 = v1:GetModelGlobalSizeAndPosition(p1)
			local Border = Instance.new("Part")
			Border.Anchored = true
			Border.Transparency = 1
			Border.Name = "Border"
			Border.CanCollide = false
			Border.FormFactor = 0
			Border.Locked = true
			local v3 = roundUp(v12.x, p3)
			local v4 = roundUp(v12.y, p3)
			local v5 = roundUp
			Border.Size = Vector3.new(v3, v4, v5(v12.z, p3))
			local v6 = CFrame.new(v2)
			Border.CFrame = v6 + Vector3.new(0, (roundUp(v12.y, p3) - v12.y) / 2, 0)
			Border.Parent = p1
			p1.PrimaryPart = Border
			game:GetService("CollectionService"):AddTag(Border, "Border")
			local BorderPointer = Instance.new("ObjectValue")
			BorderPointer.Name = "BorderPointer"
			BorderPointer.Value = Border
			BorderPointer.Parent = p1
			local SelectionBox = Instance.new("SelectionBox")
			SelectionBox.Adornee = Border
			SelectionBox.LineThickness = 0.001
			SelectionBox.Color3 = Color3.new(255/255, 255/255, 255/255)
			SelectionBox.Parent = Border
		end
	end
	if not v2.IsServer then
		return
	end
	for k, v in pairs(t.AssetLibrary) do
		local Object = v.Object
		if Object and (Object:IsA("Model") and (not Object:IsA("Tool") and v.Category ~= "Mailboxes")) then
			if v.TableTopItem then
				AddBorder(Object, v, 1)
			else
				AddBorder(Object, v, 4)
			end
			for i, v4 in ipairs(Object:GetChildren()) do
				if v4:IsA("BasePart") then
					v4.Locked = true
				end
			end
		end
	end
end
return t