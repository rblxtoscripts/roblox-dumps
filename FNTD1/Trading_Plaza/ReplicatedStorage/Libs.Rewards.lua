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
local Enchants = require(ReplicatedStorage.Modules.Misc.Enchants)
local Notify = ReplicatedStorage.Remotes.Misc.Notify
local t = {}
local t2 = {}
function t.Give(p1, p2, p3) --[[ Give | Line: 22 | Upvalues: v1 (copy), t2 (copy), t (copy), Formatter (copy), ReplicatedStorage (copy), Notify (copy), Presents (copy), Presents_2 (copy), Items (copy), Towers (copy), Enchants (copy), v2 (copy), Robux (copy), v3 (copy) ]]
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
			if v12.Data[v5] and typeof(v12.Data[v5]) == "number" then
				v1.Increase(p1, v5, Formatter.FormatToNumber(v6))
				if v5 == "SummerXP" then
					ReplicatedStorage.Remotes.SeasonPass.SummerUpdate:FireClient(p1)
				end
				if not p3 then
					local v122 = "+" .. Formatter.FormatCompact(v6) .. " " .. v5
					Notify:FireClient(p1, v122, if v5 == "Tokens" then Color3.fromRGB(255, 249, 62) else nil)
				end
				continue
			end
			if v5 == "Present" then
				local v14 = v7 or 1
				Presents.Give(p1, v6, v14)
				if not p3 then
					v22 = if Presents_2.Presents[v6] and Presents_2.Presents[v6].Name then Presents_2.Presents[v6].Name else v6 .. (if v14 == 1 then "Present" else "Presents")
					Notify:FireClient(p1, "+" .. v14 .. " " .. v22)
				end
				continue
			end
			if v5 == "Item" then
				local v16 = if v7 then Formatter.FormatToNumber(v7) else 1
				if Items[v6] then
					if v12.Data.Items[v6] then
						local Items_2 = v12.Data.Items
						Items_2[v6] = Items_2[v6] + v16
					else
						v12.Data.Items[v6] = v16
					end
					ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
					ReplicatedStorage.Remotes.Misc.UpdateItems:FireClient(p1)
					if not p3 then
						Notify:FireClient(p1, "+" .. v16 .. " " .. v6)
					end
				end
				continue
			end
			if v5 == "Tower" then
				if Towers.Towers[v6] then
					v32 = if v7 and tonumber(v7) then tonumber(v7) else 1
					local v17 = if v9 and Enchants.Enchants[v9] then v9 else nil
					local v18 = true
					local v19 = nil
					if v8 and v8 == "NoShiny" then
						v18 = false
					elseif v8 and v8 == "Shiny" then
						v19 = true
					end
					for i = 1, v32 do
						v2.Give(p1, v6, v18, v17, v19)
					end
					if not p3 then
						Notify:FireClient(p1, "+" .. v32 .. " " .. v6)
					end
				end
				continue
			end
			if v5 == "PremiumPass" then
				v12.Data.SeasonPass.UnlockedPremium = true
				ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
				task.wait(0.1)
				ReplicatedStorage.Remotes.SeasonPass.Update:FireClient(p1)
				continue
			end
			if v5 == "Gamepass" then
				if Robux.Gamepassses[v6] then
					v12.Data.Gamepasses[v6] = true
				end
				continue
			end
			if v5 == "ClanPoints" then
				local v20 = Formatter.FormatToNumber(v6)
				sum = sum + v20
				if not p3 then
					Notify:FireClient(p1, "+" .. v20 .. " Clan Points")
				end
				continue
			end
			if v5 == "RestartPass" then
				local UnlockedPremium = v12.Data.SeasonPass.UnlockedPremium
				v12.Data.SeasonPassXP = 0
				for k2, v10 in pairs(v12.Data.SeasonPass) do
					if not string.find(k2, "Summer") then
						v12.Data.SeasonPass[k2] = nil
					end
				end
				if UnlockedPremium then
					v12.Data.SeasonPass.UnlockedPremium = true
				end
				ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
				ReplicatedStorage.Remotes.SeasonPass.Update:FireClient(p1)
				continue
			end
			if v5 == "RestartSummerPass" then
				v12.Data.SummerXP = 0
				for k2, v10 in pairs(v12.Data.SeasonPass) do
					if string.find(k2, "Summer") then
						v12.Data.SeasonPass[k2] = nil
					end
				end
				ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
				ReplicatedStorage.Remotes.SeasonPass.SummerUpdate:FireClient(p1)
			end
		end
		if not (sum > 0) then
			return
		end
		v3.GivePoints(p1, sum)
	else
		if t2[p1.Name] then
			local v21 = t2
			local v22 = p1.Name
			v21[v22] = v21[v22] + 1
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
	ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 158 | Upvalues: Towers (copy) ]]
		if not p1 then
			return
		end
		if pcall(function() --[[ Line: 160 | Upvalues: p1 (ref), Towers (ref) ]]
			p1 = game:GetService("HttpService"):JSONDecode(p1)
			if not p1 then
				error(0)
			end
			Towers.Towers = p1
		end) then
			return
		end
		warn("Failed to update Client MetaData.")
	end)
else
	ReplicatedStorage.Remotes.PlayerData.GiveRewards.Event:Connect(function(p1, p2) --[[ Line: 154 | Upvalues: t (copy) ]]
		task.spawn(t.Give, p1, p2)
	end)
end
return t