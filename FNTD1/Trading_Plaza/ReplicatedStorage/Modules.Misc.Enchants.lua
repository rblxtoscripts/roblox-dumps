-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local LocalPlayer = Players.LocalPlayer
local v1 = if LocalPlayer then require(ReplicatedStorage.Modules.PlayerData.ClientState) else require(ServerScriptService.PlayerData.Manager)
local Quests = require(ReplicatedStorage.Modules.Misc.Quests)
local t = {
	Enchants = {
		Damage1 = {
			Name = "Damage I",
			Rarity = "Common",
			Multi = 1.1,
			String = "+10% strength"
		},
		Damage2 = {
			Name = "Damage II",
			Rarity = "Uncommon",
			Multi = 1.2,
			String = "+20% strength"
		},
		Damage3 = {
			Name = "Damage III",
			Rarity = "Uncommon",
			Multi = 1.3,
			String = "+30% strength"
		},
		Range1 = {
			Name = "Range I",
			Rarity = "Common",
			Multi = 1.1,
			String = "+10% range"
		},
		Range2 = {
			Name = "Range II",
			Rarity = "Uncommon",
			Multi = 1.2,
			String = "+20% range"
		},
		Range3 = {
			Name = "Range III",
			Rarity = "Uncommon",
			Multi = 1.3,
			String = "+30% range"
		},
		Speed1 = {
			Name = "Speed I",
			Rarity = "Common",
			Multi = 0.9,
			String = "-10% attack cooldown"
		},
		Speed2 = {
			Name = "Speed II",
			Rarity = "Uncommon",
			Multi = 0.8,
			String = "-20% attack cooldown"
		},
		Speed3 = {
			Name = "Speed III",
			Rarity = "Uncommon",
			Multi = 0.7,
			String = "-30% attack cooldown"
		},
		Shadow = {
			Name = "Shadow",
			Rarity = "Secret",
			String = "+100% damage and +25% range",
			Multi = {
				Damage = 2,
				Range = 1.25
			}
		},
		PuppetsNightmare = {
			Name = "Puppet\'s Nightmare",
			Rarity = "Secret",
			String = "+70% damage and +50% range",
			Multi = {
				Damage = 1.7,
				Range = 1.5
			}
		},
		Withered = {
			Name = "Withered",
			Rarity = "Mythic",
			String = "+25% damage, +25% range, and -25% attack cooldown",
			Multi = {
				Damage = 1.25,
				Range = 1.25,
				Speed = 0.75
			}
		},
		BossKiller = {
			Name = "Boss Killer",
			Rarity = "Mythic",
			String = "+200% damage to bosses and +50% damage",
			Multi = {
				Boss = 3,
				Damage = 1.5
			}
		},
		Bounded = {
			Name = "Bounded",
			Rarity = "Secret",
			String = "+125% damage and +20% slower attack speed",
			Multi = {
				Damage = 2.25,
				Speed = 1.2
			}
		},
		Vengeance = {
			Name = "Vengeance",
			Rarity = "Nightmare",
			String = "+125% damage, +35% range, and -20% cooldown",
			Multi = {
				Damage = 2.25,
				Range = 1.35,
				Speed = 0.8
			}
		},
		Developer = {
			Name = "Developer",
			Rarity = "Nightmare",
			String = "+200% damage, +100% range, -25% cooldown",
			Multi = {
				Damage = 3,
				Range = 2,
				Speed = 0.75
			}
		},
		Overclock = {
			Name = "Overclock",
			Rarity = "Nightmare",
			String = "+50% damage, +50% range, and -33% cooldown",
			Multi = {
				Damage = 1.5,
				Range = 1.5,
				Speed = 0.67
			}
		},
		Springlock = {
			Name = "Springlock",
			Rarity = "Nightmare",
			String = "+250% damage, +80% range, and +30% slower cooldown",
			Multi = {
				Damage = 3.5,
				Range = 1.8,
				Speed = 1.3
			}
		},
		Investigator = {
			Name = "Investigator",
			Rarity = "Nightmare",
			String = "+175% damage, +75% range, and -20% cooldown",
			Multi = {
				Damage = 2.75,
				Range = 1.75,
				Speed = 0.8
			}
		},
		bear5 = {
			Name = "bear5",
			Rarity = "Nightmare",
			String = "+155% damage, +55% range, and -15% cooldown",
			Multi = {
				Damage = 2.55,
				Range = 1.55,
				Speed = 0.85
			}
		},
		Prototype = {
			Name = "Prototype",
			Rarity = "Nightmare",
			String = "+175% damage, +75% range, and -20% cooldown",
			Multi = {
				Damage = 2.75,
				Range = 1.75,
				Speed = 0.8
			}
		},
		Champion = {
			Name = "Champion",
			Rarity = "Nightmare",
			String = "+250% damage, +80% range, and +20% cooldown",
			Multi = {
				Damage = 3.5,
				Range = 1.8,
				Speed = 1.2
			}
		}
	},
	Chances = {
		Damage1 = 16.29,
		Damage2 = 10,
		Damage3 = 6,
		Range1 = 16.32,
		Range2 = 10,
		Range3 = 6,
		Speed1 = 16.24,
		Speed2 = 10,
		Speed3 = 6,
		Shadow = 0.1,
		PuppetsNightmare = 0.5,
		Withered = 1,
		BossKiller = 1,
		Bounded = 0.5,
		Overclock = 0.03,
		Vengeance = 0.01,
		Springlock = 0.01
	}
}
function returnSumOfWeight(p1) --[[ returnSumOfWeight | Line: 66 ]]
	local sum = 0
	for k, v in pairs(p1) do
		sum = sum + v
	end
	return sum
end
function getRandomItem(p1) --[[ getRandomItem | Line: 74 ]]
	local sum = Random.new():NextNumber(0, returnSumOfWeight(p1))
	for k, v in pairs(p1) do
		if sum <= v then
			return k
		end
		sum = sum - v
	end
end
local t2 = {}
function t.Enchant(p1, p2, p3) --[[ Enchant | Line: 87 | Upvalues: v1 (copy), t2 (copy), ReplicatedStorage (copy), t (copy), Quests (copy) ]]
	local v12 = v1.Profiles[p1]
	if not v12 then
		return
	end
	local v2 = if v12.Data.Gamepasses.VIP then 0.25 else 0.5
	if t2[p1.Name] then
		return
	end
	t2[p1.Name] = true
	task.delay(v2, function() --[[ Line: 95 | Upvalues: t2 (ref), p1 (copy) ]]
		t2[p1.Name] = nil
	end)
	if p3 == "Left" then
		ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
		ReplicatedStorage.Remotes.Towers.Enchanted:FireClient(p1, p2)
		ReplicatedStorage.Remotes.Misc.UpdateItems:FireClient(p1)
		return
	end
	if not v12.Data.Towers[p2] then
		return
	end
	if not v12.Data.Items.Souls or v12.Data.Items.Souls <= 0 then
		return
	end
	local Enchant = v12.Data.Towers[p2].Enchant
	if Enchant == "Developer" or (Enchant == "Investigator" or (Enchant == "bear5" or Enchant == "Champion")) then
		ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "You can\'t remove this enchant!")
		return
	end
	if p3 == "Auto" and (Enchant and (Enchant ~= "" and not table.find(v12.Data.AutoSkipEnchants, Enchant))) then
		ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
		ReplicatedStorage.Remotes.Misc.Enchant:FireClient(p1, "StopAuto")
		return
	end
	local v3 = 100
	for k, v in pairs(t.Chances) do
		if k == Enchant then
			v3 = v
		end
	end
	if v3 <= 1 and (not p3 or p3 ~= "RareEnchant" and p3 ~= "Auto") then
		return
	end
	local Data = v12.Data
	Data.EnchantRolls = Data.EnchantRolls + 1
	local Items = v12.Data.Items
	Items.Souls = Items.Souls - 1
	if v12.Data.Items.Souls <= 0 then
		v12.Data.Items.Souls = nil
	end
	Quests.DoTask(p1, "SpendSouls", 1)
	Quests.DoTask(p1, "Enchant", 1)
	local v4 = getRandomItem(t.Chances)
	v12.Data.Towers[p2].Enchant = v4
	if t.Chances[v4] <= 0.01 then
		Quests.DoTask(p1, "UltimatePower", 1)
	end
	if v3 <= 1 then
		ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
		ReplicatedStorage.Remotes.Towers.Enchanted:FireClient(p1, p2)
		ReplicatedStorage.Remotes.Misc.UpdateItems:FireClient(p1)
	end
	ReplicatedStorage.Remotes.Misc.Enchant:FireClient(p1, v4, p2, v12.Data.Items.Souls)
end
function t.CheckShiny(p1, p2, p3) --[[ CheckShiny | Line: 158 | Upvalues: LocalPlayer (copy), v1 (copy) ]]
	if p1 then
		local v12 = if LocalPlayer then v1.GetData() else v1.Profiles[p1]
		if v12 then
			if not LocalPlayer then
				v12 = v12.Data
			end
			local v2 = v12.Towers[p2]
			if not v2 then
				for k, v in pairs(v12.Towers) do
					if v.Equipped and v.Name == p2 then
						p2 = v.ID
						break
					end
				end
				v2 = v12.Towers[p2]
			end
			if p3 then
				return v2.Shiny and true or false
			end
			if v2.Shiny then
				return 1.25
			else
				return 1
			end
		elseif p3 then
			return false
		else
			return 1
		end
	elseif p3 then
		return false
	else
		return 1
	end
end
function t.GetStatMulti(p1, p2, p3, p4) --[[ GetStatMulti | Line: 185 | Upvalues: LocalPlayer (copy), v1 (copy), t (copy) ]]
	local v12 = if LocalPlayer then v1.GetData() else v1.Profiles[p1]
	if not v12 then
		return
	end
	if not LocalPlayer then
		v12 = v12.Data
	end
	local v2 = v12.Towers[p2]
	if not v2 then
		return
	end
	local Enchant = v2.Enchant
	if Enchant and (not (#Enchant <= 2) and t.Enchants[Enchant]) then
		if string.find(Enchant, p3) and typeof(t.Enchants[Enchant].Multi) ~= "table" then
			local v4 = math.round((t.Enchants[Enchant].Multi - 1) * 100)
			local v5 = if v4 > 0 then "+" else ""
			if p4 then
				return " (" .. v5 .. v4 .. "%)"
			else
				return t.Enchants[Enchant].Multi
			end
		end
		if typeof(t.Enchants[Enchant].Multi) == "table" then
			for k, v in pairs(t.Enchants[Enchant].Multi) do
				if k == p3 then
					local v6 = math.round((v - 1) * 100)
					local v7 = if v6 > 0 then "+" else ""
					if p4 then
						return " (" .. v7 .. v6 .. "%)"
					else
						return v
					end
				end
			end
		end
	end
	if p4 then
		return ""
	else
		return 1
	end
end
if not LocalPlayer then
	ReplicatedStorage.Remotes.Misc.Enchant.OnServerEvent:Connect(function(p1, p2, p3) --[[ Line: 214 | Upvalues: t (copy) ]]
		task.spawn(t.Enchant, p1, p2, p3)
	end)
end
return t