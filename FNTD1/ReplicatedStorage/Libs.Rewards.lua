-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local v1 = if Players.LocalPlayer then nil else require(ServerScriptService.PlayerData.Manager)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local Presents = require(ReplicatedStorage.Modules.Misc.Presents)
local Presents_2 = require(ReplicatedStorage.Configs.Presents)
local Items = require(ReplicatedStorage.Configs.Items)
local Towers = require(ReplicatedStorage.Configs.Towers)
local v2 = if Players.LocalPlayer then nil else require(ServerStorage.Modules.TowersManager)
local Robux = require(ReplicatedStorage.Configs.Robux)
local v3 = if Players.LocalPlayer then nil else require(ReplicatedStorage.Modules.Misc.Clans)
local Misc = require(ReplicatedStorage.Configs.Misc)
local Enchants = require(ReplicatedStorage.Modules.Misc.Enchants)
local Quests = require(ReplicatedStorage.Modules.Misc.Quests)
local Config = require(ReplicatedStorage.Modules.Misc.StatRerolls.Config)
local Notify = ReplicatedStorage.Remotes.Misc.Notify
local t = {}
local t2 = {}
function t.Give(p1, p2, p3, p4) --[[ Give | Line: 25 | Upvalues: v1 (copy), t2 (copy), t (copy), Formatter (copy), ReplicatedStorage (copy), Notify (copy), Presents (copy), Presents_2 (copy), Items (copy), Towers (copy), Enchants (copy), Config (copy), v2 (copy), Robux (copy), Misc (copy), Quests (copy), v3 (copy) ]]
	local v12 = v1.Profiles[p1]
	if v12 then
		local sum = 0
		for k, v in pairs(p2) do
			local v22, v32
			local v4 = string.split(v, "_")
			local v5 = v4[1]
			local v6 = v4[2]
			local v7 = v4[3]
			local v8 = v4[4]
			local v9 = v4[5]
			local v10 = v4[6]
			if v12.Data[v5] and typeof(v12.Data[v5]) == "number" then
				v1.Increase(p1, v5, Formatter.FormatToNumber(v6))
				if v5 == "NewSummerXP" then
					ReplicatedStorage.Remotes.SeasonPass.EventUpdate:FireClient(p1)
				end
				if not p3 then
					if v5 == "NewSummer Tokens" then
						v5 = "Beach Balls"
					end
					local v13 = "+" .. Formatter.FormatCompact(v6) .. " " .. v5
					Notify:FireClient(p1, v13, if v5 == "Tokens" then Color3.fromRGB(255, 249, 62) else nil)
				end
				continue
			end
			if v5 == "Present" then
				local v15 = v7 or 1
				Presents.Give(p1, v6, v15)
				if not p3 then
					v22 = if Presents_2.Presents[v6] and Presents_2.Presents[v6].Name then Presents_2.Presents[v6].Name else v6 .. (if v15 == 1 then "Present" else "Presents")
					Notify:FireClient(p1, "+" .. v15 .. " " .. v22)
				end
				continue
			end
			if v5 == "Item" then
				local v17 = if v7 then Formatter.FormatToNumber(v7) else 1
				if Items[v6] then
					if v12.Data.Items[v6] then
						local Items_2 = v12.Data.Items
						Items_2[v6] = Items_2[v6] + v17
					else
						v12.Data.Items[v6] = v17
					end
					if not p3 then
						Notify:FireClient(p1, "+" .. v17 .. " " .. v6)
					end
				end
				continue
			end
			if v5 == "Tower" then
				if Towers.Towers[v6] then
					v32 = if v7 and tonumber(v7) then tonumber(v7) else 1
					local v18 = if v9 and Enchants.Enchants[v9] then v9 else nil
					local v19 = true
					local v20 = nil
					if v8 and v8 == "NoShiny" then
						v19 = false
					elseif v8 and v8 == "Shiny" then
						v20 = true
					end
					local v21 = if v10 and Config[v10] then {
	Damage = v10,
	Range = v10,
	Cooldown = v10
} else nil
					for i = 1, v32 do
						v2.Give(p1, v6, v19, v18, v20, nil, nil, nil, v21)
					end
					if not p3 then
						Notify:FireClient(p1, "+" .. v32 .. " " .. v6)
					end
				end
				continue
			end
			if v5 == "PremiumPass" then
				v12.Data.SeasonPass.UnlockedPremium = true
				continue
			end
			if v5 == "Gamepass" then
				if Robux.Gamepassses[v6] then
					v12.Data.Gamepasses[v6] = true
				end
				continue
			end
			if v5 == "ClanPoints" then
				local v222 = Formatter.FormatToNumber(v6)
				sum = sum + v222
				if not p3 then
					Notify:FireClient(p1, "+" .. v222 .. " Clan Points")
				end
				continue
			end
			if v5 == "RestartPass" then
				local UnlockedPremium = v12.Data.SeasonPass.UnlockedPremium
				v12.Data.SeasonPassXP = 0
				for k2, v11 in pairs(v12.Data.SeasonPass) do
					if not string.find(k2, "NewSummer") then
						v12.Data.SeasonPass[k2] = nil
					end
				end
				if UnlockedPremium then
					v12.Data.SeasonPass.UnlockedPremium = true
				end
				continue
			end
			if v5 == "Rank" then
				local v23 = Formatter.FormatToNumber(v6)
				if not p3 then
					Notify:FireClient(p1, "+" .. v23 .. " Rank")
				end
				local v24 = if v7 then v7 else Misc.RankSave
				if v12.Data.Rank[v24] then
					local Rank = v12.Data.Rank
					Rank[v24] = Rank[v24] + v23
					continue
				end
				v12.Data.Rank[v24] = v23
				continue
			end
			if v5 == "Title" then
				if not p3 then
					Notify:FireClient(p1, "+" .. v6 .. " Title")
				end
				v12.Data.Titles[v6] = if v7 and v7 == "Remove" then nil else true
			end
		end
		if v12.Data.Tokens >= 1000000 and (v12.Data.Items.Souls and v12.Data.Items.Souls >= Misc.SoulsCap) then
			Quests.DoTask(p1, "FazbearMafia", 1)
		end
		if not p4 then
			ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
			ReplicatedStorage.Remotes.Misc.UpdateItems:FireClient(p1)
			delay(0.1, function() --[[ Line: 161 | Upvalues: ReplicatedStorage (ref), p1 (copy) ]]
				ReplicatedStorage.Remotes.SeasonPass.Update:FireClient(p1)
			end)
		end
		if not (sum > 0) then
			return
		end
		v3.GivePoints(p1, sum)
	else
		if t2[p1.Name] then
			local v26 = t2
			local v27 = p1.Name
			v26[v27] = v26[v27] + 1
			if t2[p1.Name] >= 5 then
				t2[p1.Name] = nil
				return
			end
		else
			t2[p1.Name] = 1
		end
		task.wait(3)
		t.Give(p1, p2, p3)
	end
end
if Players.LocalPlayer then
	ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 177 | Upvalues: Towers (copy) ]]
		if not p1 then
			return
		end
		if pcall(function() --[[ Line: 179 | Upvalues: p1 (ref), Towers (ref) ]]
			p1 = game:GetService("HttpService"):JSONDecode(p1)
			if p1 then
				Towers.Towers = p1
				return
			end
			error(0)
		end) then
			return
		end
		warn("Failed to update Client MetaData.")
	end)
else
	ReplicatedStorage.Remotes.PlayerData.GiveRewards.Event:Connect(function(p1, p2) --[[ Line: 173 | Upvalues: t (copy) ]]
		task.spawn(t.Give, p1, p2)
	end)
end
return t