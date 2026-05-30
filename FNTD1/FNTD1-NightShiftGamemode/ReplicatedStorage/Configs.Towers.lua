-- https://lua.expert/
local t = {
	Towers = {
		Freddy = {
			Type = "Single",
			Rarity = "Uncommon",
			Image = "rbxassetid://16620053009",
			PlacePrice = 300,
			Range = 10,
			Damage = 15,
			Cooldown = 1,
			TowerStats = {
				Damage = "20-30",
				Cooldown = "1-0.75",
				Range = "10-15"
			}
		},
		Chica = {
			Type = "Explosion",
			Rarity = "Uncommon",
			Image = "rbxassetid://16620303027",
			PlacePrice = 500,
			Damage = 25,
			Range = 10,
			Cooldown = 2,
			TowerStats = {
				Damage = "25-30",
				Cooldown = "2-1.5",
				Range = "10-14"
			}
		},
		Foxy = {
			Type = "Melee",
			Rarity = "Rare",
			Image = "rbxassetid://16620218689",
			PlacePrice = 600,
			Damage = 30,
			Range = 7,
			Cooldown = 1,
			AnimationOffset = 0.4,
			TowerStats = {
				Damage = "30-50",
				Cooldown = "1-0.75",
				Range = "7-10"
			}
		},
		Bonnie = {
			Type = "Continuous",
			Rarity = "Mythic",
			Image = "rbxassetid://16620268084",
			PlacePrice = 7500,
			Damage = 10,
			Range = 18,
			Cooldown = 0.05,
			TowerStats = {
				Damage = "10-25",
				Cooldown = "0.05",
				Range = "18-25"
			}
		},
		["Withered Chica"] = {
			Type = "Single",
			Rarity = "Rare",
			Image = "rbxassetid://16632209265",
			PlacePrice = 800,
			Damage = 50,
			Range = 10,
			Cooldown = 1,
			TowerStats = {
				Damage = "50-125",
				Cooldown = "1-0.9",
				Range = "10-15"
			}
		},
		["Withered Foxy"] = {
			Type = "Dual",
			Rarity = "Epic",
			Image = "rbxassetid://16632135968",
			PlacePrice = 1200,
			Damage = 50,
			Range = 15,
			Cooldown = 1,
			AnimationOffset = 0.8,
			TowerStats = {
				Damage = "50-150",
				Cooldown = "1-0.75",
				Range = "15-20"
			}
		},
		["Withered Freddy"] = {
			Type = "Continuous",
			Rarity = "Mythic",
			Image = "rbxassetid://16632239120",
			PlacePrice = 5000,
			Damage = 14,
			Range = 15,
			Cooldown = 0.05,
			TowerStats = {
				Damage = "14-30",
				Cooldown = "0.05",
				Range = "15-20"
			}
		},
		["Withered Bonnie"] = {
			Type = "Continuous",
			Rarity = "Secret",
			Image = "rbxassetid://16632217188",
			PlacePrice = 20000,
			Damage = 25,
			Range = 22,
			Cooldown = 0.05,
			TowerStats = {
				Damage = "25-50",
				Cooldown = "0.05",
				Range = "22-35"
			}
		},
		["Shadow Bonnie"] = {
			Type = "AOE",
			Rarity = "Nightmare",
			Image = "rbxassetid://16781197179",
			PlacePrice = 25000,
			Damage = 30,
			Range = 10,
			Cooldown = 0.05,
			TowerStats = {
				Damage = "30-65",
				Cooldown = "0.05",
				Range = "10-20"
			}
		},
		["Toy Bonnie"] = {
			Type = "Continuous",
			Rarity = "Epic",
			Image = "rbxassetid://16780983603",
			PlacePrice = 1000,
			Damage = 50,
			Range = 15,
			Cooldown = 1,
			AnimationOffset = -0.4,
			TowerStats = {
				Damage = "40-75",
				Cooldown = "1-0.75",
				Range = "12-20"
			}
		},
		["Toy Freddy"] = {
			Type = "Single",
			Rarity = "Rare",
			Image = "rbxassetid://16781095520",
			PlacePrice = 800,
			Damage = 40,
			Range = 10,
			Cooldown = 2,
			TowerStats = {
				Damage = "40-100",
				Cooldown = "2-1.5",
				Range = "10-15"
			}
		},
		["Toy Chica"] = {
			Type = "Explosion",
			Rarity = "Epic",
			Image = "rbxassetid://16781017510",
			PlacePrice = 1250,
			Damage = 100,
			Range = 12,
			Cooldown = 3,
			AnimationOffset = -0.5,
			TowerStats = {
				Damage = "100-150",
				Cooldown = "3-1.5",
				Range = "12-17"
			}
		},
		Mangle = {
			Type = "Explosion",
			Rarity = "Secret",
			Image = "rbxassetid://16781119726",
			PlacePrice = 12500,
			Damage = 100,
			Range = 10,
			Cooldown = 1,
			AnimationOffset = -0.7,
			TowerStats = {
				Damage = "100-250",
				Cooldown = "1.5-0.75",
				Range = "15-20"
			}
		},
		["Shadow Freddy"] = {
			Type = "AOE",
			Rarity = "Secret",
			Image = "rbxassetid://17270065249",
			PlacePrice = 15000,
			Damage = 20,
			Range = 14,
			Cooldown = 0.05,
			TowerStats = {
				Damage = "10-18",
				Cooldown = "0.05",
				Range = "12-18"
			}
		},
		["Balloon Boy"] = {
			Type = "Explosion",
			Rarity = "Mythic",
			Image = "rbxassetid://16781077553",
			PlacePrice = 5000,
			Damage = 200,
			Range = 12,
			Cooldown = 5,
			AnimationOffset = -9,
			TowerStats = {
				Damage = "200-350",
				Cooldown = "5-4",
				Range = "12-25"
			}
		},
		["Withered Golden Freddy"] = {
			Type = "Single",
			Rarity = "Secret",
			Image = "rbxassetid://16781122207",
			PlacePrice = 3000,
			Damage = 75,
			Range = 15,
			Cooldown = 1,
			TowerStats = {
				Damage = "300-750",
				Cooldown = "1.5-1",
				Range = "15-20"
			}
		},
		["Golden Freddy"] = {
			Type = "Single",
			Rarity = "Mythic",
			Image = "rbxassetid://17629034232",
			PlacePrice = 4000,
			Damage = 75,
			Range = 15,
			Cooldown = 1,
			AnimationOffset = -1.2,
			TowerStats = {
				Damage = "125-250",
				Cooldown = "1.5-1",
				Range = "15-20"
			}
		},
		Puppet = {
			Type = "Pierce",
			Rarity = "Secret",
			Image = "rbxassetid://17802016570",
			PlacePrice = 10000,
			Damage = 300,
			Range = 25,
			Cooldown = 10,
			TowerStats = {
				Damage = "500-1250",
				Cooldown = "10-7",
				Range = "25-35"
			}
		},
		Endo = {
			Type = "Single",
			Rarity = "Secret",
			Image = "rbxassetid://17851638702",
			PlacePrice = 1000,
			Damage = 15,
			Range = 10,
			Cooldown = 1,
			TowerStats = {
				Damage = "0",
				Cooldown = "0",
				Range = "10-20",
				DamageBoost = "1-1.24"
			}
		},
		["Endo 02"] = {
			Type = "Single",
			Rarity = "Secret",
			Image = "rbxassetid://17690383931",
			PlacePrice = 600,
			Damage = 30,
			Range = 15,
			Cooldown = 0.3,
			TowerStats = {
				Damage = "30-60",
				Cooldown = "0.3",
				Range = "15-25"
			}
		},
		["Plane Boy"] = {
			Type = "Continuous",
			Rarity = "Secret",
			Image = "rbxassetid://17689713814",
			PlacePrice = 20000,
			Damage = 30,
			Range = 25,
			Cooldown = 0.05,
			TowerStats = {
				Damage = "30-60",
				Cooldown = "0.05",
				Range = "25-40"
			}
		},
		["Rockin Bonnie"] = {
			Type = "AOE",
			Rarity = "Secret",
			Image = "rbxassetid://17689695988",
			PlacePrice = 500,
			Damage = 4,
			Range = 15,
			Cooldown = 0.75,
			TowerStats = {
				Damage = "5-14",
				Cooldown = "0.75",
				Range = "15-20"
			}
		},
		["Pirate Withered Foxy"] = {
			Type = "Single",
			Rarity = "Secret",
			Image = "rbxassetid://17851205149",
			PlacePrice = 500,
			Damage = 50,
			Range = 15,
			Cooldown = 0.75,
			TowerStats = {
				Damage = "25-50",
				Cooldown = "0.5-0.3",
				Range = "15-20"
			}
		},
		["Marionette\'s Puppeteer"] = {
			Type = "AOE",
			Rarity = "Nightmare",
			Image = "rbxassetid://18151575297",
			PlacePrice = 10000,
			Damage = 400,
			Range = 15,
			Cooldown = 2,
			TowerStats = {
				Damage = "400-1200",
				Cooldown = "2-1.5",
				Range = "15-21"
			}
		},
		["Blighted Endo Freddy"] = {
			Type = "AOE",
			Rarity = "Nightmare",
			Image = "rbxassetid://18151573285",
			PlacePrice = 20000,
			Damage = 15,
			Range = 15,
			Cooldown = 0.05,
			TowerStats = {
				Damage = "15-40",
				Cooldown = "0.05",
				Range = "15-25"
			}
		},
		["Baker Toy Chica"] = {
			Type = "Explosion",
			Rarity = "Epic",
			Image = "rbxassetid://18161347460",
			PlacePrice = 800,
			Damage = 30,
			Range = 15,
			Cooldown = 1,
			TowerStats = {
				Damage = "40-75",
				Cooldown = "1-0.8",
				Range = "15-25"
			}
		},
		["Summer Toy Bonnie"] = {
			Type = "Slow",
			Rarity = "Rare",
			Image = "rbxassetid://18255590026",
			PlacePrice = 800,
			Damage = 20,
			Range = 15,
			Cooldown = 1,
			TowerStats = {
				Damage = "20-30",
				Cooldown = "1",
				Range = "15-18"
			}
		},
		["Coco Boy"] = {
			Type = "Explosion",
			Rarity = "Mythic",
			Image = "rbxassetid://18256042312",
			PlacePrice = 6000,
			Damage = 225,
			Range = 12,
			Cooldown = 1,
			TowerStats = {
				Damage = "225-400",
				Cooldown = "4-3",
				Range = "12-25"
			}
		},
		["Vendor Toy Chica"] = {
			Type = "Explosion",
			Rarity = "Epic",
			Image = "rbxassetid://18256363652",
			PlacePrice = 1000,
			Damage = 200,
			Range = 15,
			Cooldown = 1,
			TowerStats = {
				Damage = "200-300",
				Cooldown = "5-3",
				Range = "17-25"
			}
		},
		["Seven Seas Foxy"] = {
			Type = "Pierce",
			Rarity = "Secret",
			Image = "rbxassetid://18255813345",
			PlacePrice = 7000,
			Damage = 30,
			Range = 15,
			Cooldown = 1,
			TowerStats = {
				Damage = "150-400",
				Cooldown = "3-2",
				Range = "25-30"
			}
		},
		["Algae FredBear"] = {
			Type = "Single",
			Rarity = "Secret",
			Image = "rbxassetid://18255264349",
			PlacePrice = 3000,
			Damage = 150,
			Range = 15,
			Cooldown = 2,
			TowerStats = {
				Damage = "250-650",
				Cooldown = "2-1",
				Range = "15-25"
			}
		},
		["Hawaii Endo 02"] = {
			Type = "Support",
			Rarity = "Epic",
			Image = "rbxassetid://18255863130",
			PlacePrice = 800,
			Damage = 0,
			Range = 15,
			Cooldown = 1,
			TowerStats = {
				Damage = "0",
				Cooldown = "1",
				Range = "15",
				RangeBoost = "1.05-1.2"
			}
		},
		["Rad Freddy"] = {
			Type = "Single",
			Rarity = "Secret",
			Image = "rbxassetid://18258392627",
			PlacePrice = 800,
			Damage = 150,
			Range = 30,
			Cooldown = 3,
			TowerStats = {
				Damage = "150-500",
				Cooldown = "3-2",
				Range = "25-45"
			}
		},
		["Leviathan Mangle"] = {
			Type = "Pierce",
			Rarity = "Nightmare",
			Image = "rbxassetid://18256011276",
			PlacePrice = 10000,
			Damage = 150,
			Range = 12,
			Cooldown = 2,
			TowerStats = {
				Damage = "400-750",
				Cooldown = "2-1",
				Range = "12-20"
			}
		},
		["Patriot Freddy"] = {
			Type = "Explosion",
			Rarity = "Secret",
			Image = "rbxassetid://18326604996",
			PlacePrice = 300,
			Damage = 150,
			Range = 12,
			Cooldown = 2,
			TowerStats = {
				Damage = "100-250",
				Cooldown = "4-3.5",
				Range = "15-22"
			}
		},
		SpringTrap = {
			Type = "Pierce",
			Rarity = "Nightmare",
			Image = "rbxassetid://18356146630",
			PlacePrice = 300,
			Damage = 150,
			Range = 12,
			Cooldown = 2,
			TowerStats = {
				Damage = "100-250",
				Cooldown = "4-3.5",
				Range = "15-22"
			}
		},
		["Endo 03"] = {
			Type = "Single",
			Rarity = "Epic",
			Image = "rbxassetid://18363471703",
			PlacePrice = 2000,
			Damage = 70,
			Range = 15,
			Cooldown = 1,
			TowerStats = {
				Damage = "70-220",
				Cooldown = "1-0.75",
				Range = "15-20"
			}
		},
		["Phantom Foxy"] = {
			Type = "Single",
			Rarity = "Rare",
			Image = "rbxassetid://18356274992",
			PlacePrice = 800,
			Damage = 60,
			Range = 12,
			Cooldown = 1,
			TowerStats = {
				Damage = "60-200",
				Cooldown = "1-0.75",
				Range = "15-20"
			}
		},
		["Phantom Chica"] = {
			Type = "Explosion",
			Rarity = "Secret",
			Image = "rbxassetid://18356356760",
			PlacePrice = 15000,
			Damage = 150,
			Range = 15,
			Cooldown = 1.5,
			TowerStats = {
				Damage = "150-500",
				Cooldown = "1.5-0.75",
				Range = "15-20"
			}
		},
		["Phantom Freddy"] = {
			Type = "Continuous",
			Rarity = "Secret",
			Image = "rbxassetid://18363498934",
			PlacePrice = 15000,
			Damage = 17,
			Range = 20,
			Cooldown = 1,
			TowerStats = {
				Damage = "17-35",
				Cooldown = "0.05-0.05",
				Range = "20-30"
			}
		},
		["Phantom Balloon Boy"] = {
			Type = "Nuke",
			Rarity = "Secret",
			Image = "rbxassetid://18356472602",
			PlacePrice = 7500,
			Damage = 500,
			Range = 15,
			Cooldown = 4,
			TowerStats = {
				Damage = "600-1000",
				Cooldown = "4-3",
				Range = "15-25"
			}
		},
		["Phantom Gold Freddy"] = {
			Type = "Single",
			Rarity = "Mythic",
			Image = "rbxassetid://18363517791",
			PlacePrice = 3000,
			Damage = 200,
			Range = 15,
			Cooldown = 1.5,
			TowerStats = {
				Damage = "200-550",
				Cooldown = "1.5-1",
				Range = "15-20"
			}
		},
		FazCade = {
			Type = "Farm",
			Rarity = "Epic",
			Image = "rbxassetid://18363529003",
			PlacePrice = 1000,
			Damage = 0,
			Range = 15,
			Cooldown = 4
		},
		["Phantom Mangle"] = {
			Type = "Continuous",
			Rarity = "Nightmare",
			Image = "rbxassetid://18363533024",
			PlacePrice = 20000,
			Damage = 30,
			Range = 22,
			Cooldown = 0.05,
			TowerStats = {
				Damage = "30-60",
				Cooldown = "0.05",
				Range = "22-35"
			}
		},
		["Phantom Cupcake"] = {
			Type = "Single",
			Rarity = "Secret",
			Image = "rbxassetid://18363537562",
			PlacePrice = 1000,
			Damage = 100,
			Range = 15,
			Cooldown = 2,
			TowerStats = {
				Damage = "100-250",
				Cooldown = "1",
				Range = "15-25"
			}
		},
		Amalgam = {
			Type = "Continuous Slow",
			Rarity = "Epic",
			Image = "rbxassetid://18363541545",
			PlacePrice = 2000,
			Damage = 0,
			Range = 15,
			Cooldown = 0.05
		},
		["Phantom Puppet"] = {
			Type = "Pierce",
			Rarity = "Secret",
			Image = "rbxassetid://18363546528",
			PlacePrice = 15000,
			Damage = 500,
			Range = 15,
			Cooldown = 2,
			TowerStats = {
				Damage = "500-1100",
				Cooldown = "2-1",
				Range = "15-21"
			}
		},
		["Spring Bonnie"] = {
			Type = "Support",
			Rarity = "Secret",
			Image = "rbxassetid://18364574191",
			PlacePrice = 1500,
			Damage = 0,
			Range = 15,
			Cooldown = 0,
			TowerStats = {
				Damage = "0",
				Cooldown = "0",
				Range = "15",
				DamageBoost = "1.1-1.2"
			}
		},
		["Bounded Shadow"] = {
			Type = "Pierce",
			Rarity = "Nightmare",
			Image = "rbxassetid://18363555442",
			PlacePrice = 12000,
			Damage = 500,
			Range = 12,
			Cooldown = 2,
			TowerStats = {
				Damage = "500-1400",
				Cooldown = "2-1.5",
				Range = "15-21"
			}
		},
		["Sentinel Bonnie"] = {
			Type = "Continuous",
			Rarity = "Secret",
			Image = "rbxassetid://18363569957",
			PlacePrice = 4000,
			Damage = 25,
			Range = 15,
			Cooldown = 0.05,
			TowerStats = {
				Damage = "25-45",
				Cooldown = "0.05",
				Range = "15-25"
			}
		},
		["War Machine Foxy"] = {
			Type = "Continuous",
			Rarity = "Secret",
			Image = "rbxassetid://18363581536",
			PlacePrice = 4000,
			Damage = 30,
			Range = 12,
			Cooldown = 0.05,
			TowerStats = {
				Damage = "30-50",
				Cooldown = "0.05",
				Range = "15-20"
			}
		},
		["Sniper Cupcake"] = {
			Type = "Single",
			Rarity = "Rare",
			Image = "rbxassetid://18364281117",
			PlacePrice = 800,
			Damage = 70,
			Range = 30,
			Cooldown = 2,
			TowerStats = {
				Damage = "70-250",
				Cooldown = "3-2",
				Range = "30-45"
			}
		},
		["Witch Toy Chica"] = {
			Type = "Poison",
			Rarity = "Secret",
			Image = "rbxassetid://18363391561",
			PlacePrice = 500,
			Damage = 100,
			Range = 15,
			Cooldown = 4,
			TowerStats = {
				Damage = "100-250",
				Cooldown = "4-2",
				Range = "15-25"
			}
		},
		["Abyssal Foxy"] = {
			Type = "Burst Slow",
			Rarity = "Secret",
			Image = "rbxassetid://18578533614",
			PlacePrice = 15000,
			Damage = 0,
			Range = 15,
			Cooldown = 1,
			TowerStats = {
				Damage = "0-0",
				Cooldown = "1-1",
				Range = "15-15"
			}
		},
		["Major Freddy"] = {
			Type = "Single",
			Rarity = "Rare",
			Image = "rbxassetid://18665224476",
			PlacePrice = 1000,
			Damage = 0,
			Range = 18,
			Cooldown = 1,
			TowerStats = {
				Damage = "0-0",
				Cooldown = "1-1",
				Range = "15-15"
			}
		},
		["Enforcer Bonnie"] = {
			Type = "Continuous",
			Rarity = "Secret",
			Image = "rbxassetid://18673234413",
			PlacePrice = 10000,
			Damage = 0,
			Range = 18,
			Cooldown = 1,
			TowerStats = {
				Damage = "0-0",
				Cooldown = "1-1",
				Range = "15-15"
			}
		},
		["Mercenary Foxy"] = {
			Type = "Continuous",
			Rarity = "Mythic",
			Image = "rbxassetid://18673129884",
			PlacePrice = 2500,
			Damage = 0,
			Range = 18,
			Cooldown = 1,
			TowerStats = {
				Damage = "0-0",
				Cooldown = "1-1",
				Range = "15-15"
			}
		},
		["Cupcake Tank"] = {
			Type = "Summoner",
			Rarity = "Secret",
			Image = "rbxassetid://18673630095",
			PlacePrice = 2000,
			Damage = 0,
			Range = 18,
			Cooldown = 1,
			TowerStats = {
				Damage = "0-0",
				Cooldown = "1-1",
				Range = "15-15"
			}
		},
		["Commando Endo"] = {
			Type = "Continuous",
			Rarity = "Secret",
			Image = "rbxassetid://18673468864",
			PlacePrice = 800,
			Damage = 0,
			Range = 10,
			Cooldown = 1,
			TowerStats = {
				Damage = "0-0",
				Cooldown = "1-1",
				Range = "15-15"
			}
		},
		["Rocketeer Mangle"] = {
			Type = "Explosion",
			Rarity = "Secret",
			Image = "rbxassetid://18673926504",
			PlacePrice = 5000,
			Damage = 0,
			Range = 12,
			Cooldown = 1,
			TowerStats = {
				Damage = "0-0",
				Cooldown = "1-1",
				Range = "15-15"
			}
		},
		["Valkyrie Chica"] = {
			Type = "Continuous",
			Rarity = "Nightmare",
			Image = "rbxassetid://18673330553",
			PlacePrice = 5000,
			Damage = 0,
			Range = 18,
			Cooldown = 1,
			TowerStats = {
				Damage = "0-0",
				Cooldown = "1-1",
				Range = "15-15"
			}
		},
		["Artillery Puppet"] = {
			Type = "Explosion",
			Rarity = "Epic",
			Image = "rbxassetid://18672617524",
			PlacePrice = 1500,
			Damage = 0,
			Range = 40,
			Cooldown = 1,
			TowerStats = {
				Damage = "0-0",
				Cooldown = "1-1",
				Range = "15-15"
			}
		}
	}
}
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
if RunService:IsServer() then
	local HttpService = game:GetService("HttpService")
	local function retreive() --[[ retreive | Line: 675 | Upvalues: HttpService (copy) ]]
		local v1, v2 = pcall(function() --[[ Line: 676 | Upvalues: HttpService (ref) ]]
			return HttpService:GetAsync("https://raw.githubusercontent.com/FiveNightsTD/Stats/main/TowerStats.json", true)
		end)
		if v1 and v2 then
			return HttpService:JSONDecode(v2)
		else
			return nil
		end
	end
	local v1 = nil
	local v2 = false
	local function update() --[[ update | Line: 688 | Upvalues: v1 (ref), v2 (ref), HttpService (copy), t (copy), ReplicatedStorage (copy) ]]
		v1 = nil
		v2 = false
		repeat
			pcall(function() --[[ Line: 692 | Upvalues: v1 (ref), HttpService (ref) ]]
				local v12, v2 = pcall(function() --[[ Line: 676 | Upvalues: HttpService (ref) ]]
					return HttpService:GetAsync("https://raw.githubusercontent.com/FiveNightsTD/Stats/main/TowerStats.json", true)
				end)
				v1 = if v12 and v2 then HttpService:JSONDecode(v2) else nil
			end)
			task.wait(0.5)
		until v1
		t.Towers = v1
		v2 = true
		ReplicatedStorage.Remotes.Towers.MetaData:FireAllClients(HttpService:JSONEncode(t.Towers))
	end
	function ReplicatedStorage.Remotes.Towers.MetaDataRequest.OnServerInvoke() --[[ Line: 702 | Upvalues: v2 (ref), v1 (ref), t (copy) ]]
		if v2 and v1 then
			return t.Towers
		end
		repeat
			task.wait(0.5)
		until v1 and (t.Towers and v2)
		return t.Towers
	end
	repeat
		pcall(update)
	until v1 and (t.Towers and v2)
	task.defer(function() --[[ Line: 711 | Upvalues: v1 (ref), HttpService (copy), t (copy), ReplicatedStorage (copy) ]]
		while true do
			task.wait(60)
			v1 = nil
			repeat
				pcall(function() --[[ Line: 716 | Upvalues: v1 (ref), HttpService (ref) ]]
					local v12, v2 = pcall(function() --[[ Line: 676 | Upvalues: HttpService (ref) ]]
						return HttpService:GetAsync("https://raw.githubusercontent.com/FiveNightsTD/Stats/main/TowerStats.json", true)
					end)
					v1 = if v12 and v2 then HttpService:JSONDecode(v2) else nil
				end)
				task.wait(1)
			until v1 and t.Towers
			t.Towers = v1
			ReplicatedStorage.Remotes.Towers.MetaData:FireAllClients(HttpService:JSONEncode(t.Towers))
		end
	end)
	task.defer(function() --[[ Line: 725 | Upvalues: ReplicatedStorage (copy), HttpService (copy), t (copy) ]]
		while true do
			task.wait(15)
			ReplicatedStorage.Remotes.Towers.MetaData:FireAllClients(HttpService:JSONEncode(t.Towers))
		end
	end)
else
	local v3
	repeat
		v3 = ReplicatedStorage.Remotes.Towers.MetaDataRequest:InvokeServer()
		task.wait(1)
	until v3
	if v3 then
		t.Towers = v3
	end
end
return t