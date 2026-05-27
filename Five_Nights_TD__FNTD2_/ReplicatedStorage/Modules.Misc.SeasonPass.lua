-- https://lua.expert/
local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local v1 = if LocalPlayer then require(ReplicatedStorage.Modules.PlayerData.ClientState) else require(ServerScriptService.PlayerData.Manager)
require(ReplicatedStorage.Libs.Formatter)
local Rewards = require(ReplicatedStorage.Libs.Rewards)
local t = {
	Levels = {
		{
			Requirement = 10,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Present_FuntimeChicaPresent_1" }
			}
		},
		{
			Requirement = 20,
			Reward = {
				Normal = { "Tokens_4000" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 30,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 40,
			Reward = {
				Normal = { "Tokens_4000" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 50,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Present_ExclusivePack9_4" }
			}
		},
		{
			Requirement = 60,
			Reward = {
				Normal = { "Tokens_4000" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 70,
			Reward = {
				Normal = { "Present_ExclusivePack9_2" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 80,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Present_ExclusivePack9_4" }
			}
		},
		{
			Requirement = 90,
			Reward = {
				Normal = { "Tokens_4000" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 100,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 110,
			Reward = {
				Normal = { "Present_ExclusivePack9_2" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 120,
			Reward = {
				Normal = { "Tokens_4000" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 130,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Present_ExclusivePack9_4" }
			}
		},
		{
			Requirement = 140,
			Reward = {
				Normal = { "Tokens_4000" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 150,
			Reward = {
				Normal = { "Present_ExclusivePack9_2" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 160,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 170,
			Reward = {
				Normal = { "Tokens_4000" },
				Premium = { "Present_ExclusivePack9_4" }
			}
		},
		{
			Requirement = 180,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 190,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 200,
			Reward = {
				Normal = { "Tokens_4000" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 210,
			Reward = {
				Normal = { "Present_ExclusivePack9_2" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 220,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 230,
			Reward = {
				Normal = { "Tokens_4000" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 240,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 250,
			Reward = {
				Normal = { "Present_ExclusivePack9_2" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 260,
			Reward = {
				Normal = { "Tokens_4000" },
				Premium = { "Tokens_10000" }
			}
		},
		{
			Requirement = 270,
			Reward = {
				Normal = { "Tokens_4000" },
				Premium = { "Present_ExclusivePack9_4" }
			}
		},
		{
			Requirement = 280,
			Reward = {
				Normal = { "Present_ExclusivePack9_2" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 290,
			Reward = {
				Normal = { "Present_Corrupted_2" },
				Premium = { "Present_Corrupted_6" }
			}
		},
		{
			Requirement = 300,
			Reward = {
				Normal = { "Present_PrototypeGFPresent_1" },
				Premium = { "Present_ITPSBPresent_1" }
			}
		}
	},
	EventLevels = {
		{
			Requirement = 10,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Present_WaterworksPresent_1" }
			}
		},
		{
			Requirement = 20,
			Reward = {
				Normal = { "NewSummer Tokens_4000" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 30,
			Reward = {
				Normal = { "Item_Fish_2" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 40,
			Reward = {
				Normal = { "NewSummer Tokens_4000" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 50,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Present_Summer2Present_2" }
			}
		},
		{
			Requirement = 60,
			Reward = {
				Normal = { "NewSummer Tokens_4000" },
				Premium = { "Item_Fish_10" }
			}
		},
		{
			Requirement = 70,
			Reward = {
				Normal = { "Present_Summer2Present_1" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 80,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Present_Summer2Present_2" }
			}
		},
		{
			Requirement = 90,
			Reward = {
				Normal = { "NewSummer Tokens_4000" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 100,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 110,
			Reward = {
				Normal = { "Present_Summer2Present_1" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 120,
			Reward = {
				Normal = { "NewSummer Tokens_4000" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 130,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Present_Summer2Present_2" }
			}
		},
		{
			Requirement = 140,
			Reward = {
				Normal = { "NewSummer Tokens_4000" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 150,
			Reward = {
				Normal = { "Present_Summer2Present_1" },
				Premium = { "Item_Fish_10" }
			}
		},
		{
			Requirement = 160,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 170,
			Reward = {
				Normal = { "NewSummer Tokens_4000" },
				Premium = { "Present_Summer2Present_2" }
			}
		},
		{
			Requirement = 180,
			Reward = {
				Normal = { "Item_Fish_2" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 190,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 200,
			Reward = {
				Normal = { "NewSummer Tokens_4000" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 210,
			Reward = {
				Normal = { "Present_Summer2Present_1" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 220,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 230,
			Reward = {
				Normal = { "NewSummer Tokens_4000" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 240,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 250,
			Reward = {
				Normal = { "Present_Summer2Present_1" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 260,
			Reward = {
				Normal = { "Item_Fish_6" },
				Premium = { "NewSummer Tokens_10000" }
			}
		},
		{
			Requirement = 270,
			Reward = {
				Normal = { "NewSummer Tokens_8000" },
				Premium = { "Present_Summer2Present_3" }
			}
		},
		{
			Requirement = 280,
			Reward = {
				Normal = { "Present_Summer2Present_1" },
				Premium = { "Item_Souls_75" }
			}
		},
		{
			Requirement = 290,
			Reward = {
				Normal = { "Item_Souls_40" },
				Premium = { "Item_Fish_10" }
			}
		},
		{
			Requirement = 300,
			Reward = {
				Normal = { "Present_IntoThePoolPresent_1" },
				Premium = { "Present_Summer2Present_100" }
			}
		}
	}
}
function t.GiveRewards(p1, p2, p3, p4, p5) --[[ GiveRewards | Line: 78 | Upvalues: LocalPlayer (copy), t (copy), v1 (copy), ReplicatedStorage (copy), Rewards (copy) ]]
	if not (p4 and tostring(p4)) then
		p4 = ""
	end
	if p4 ~= "NewSummer" and p4 ~= "" then
		return
	end
	if LocalPlayer then
		return
	end
	if p3 ~= "Normal" and p3 ~= "Premium" then
		return
	end
	local v12 = tonumber(p2)
	local v2 = if p4 == "NewSummer" then t.EventLevels else t.Levels
	if not v2[v12] then
		return
	end
	local v3 = v1.Profiles[p1]
	if not v3 then
		return
	end
	if not v3.Data.SeasonPass.UnlockedPremium and (p3 == "Premium" and p4 == "") then
		return
	end
	if not v3.Data.SeasonPass.UnlockedNewSummer and (p3 == "Premium" and p4 == "NewSummer") then
		return
	end
	if v3.Data.SeasonPass[p3 .. p4 .. v12] then
		return
	end
	v3.Data.SeasonPass[p3 .. p4 .. v12] = true
	if not p5 then
		ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v3.Data)
	end
	Rewards.Give(p1, if v2[v12].Reward.Premium then v2[v12].Reward[p3] else v2[v12].Reward.Normal, nil, true)
	if p5 or not p4 then
		return
	end
	ReplicatedStorage.Remotes.SeasonPass.EventUpdate:FireClient(p1)
end
function t.GetStats(p1, p2) --[[ GetStats | Line: 110 | Upvalues: LocalPlayer (copy), v1 (copy), t (copy) ]]
	local v12 = if LocalPlayer then v1.GetData() else v1.Profiles[p1].Data
	if not v12 then
		return
	end
	local count = 0
	local sum = if p2 == "NewSummer" then v12.NewSummerXP else v12.SeasonPassXP
	for k, v in pairs(if p2 == "NewSummer" then t.EventLevels else t.Levels) do
		local Requirement = v.Requirement
		if tonumber(Requirement) <= sum then
			sum = sum - tonumber(Requirement)
			count = count + 1
		end
	end
	return {
		Level = count,
		CurrentLevelXP = sum,
		RequiredXP = if t.Levels[count + 1] then t.Levels[count + 1].Requirement else 0
	}
end
return t