-- https://lua.expert/
game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local HttpService = game:GetService("HttpService")
local LocalPlayer = game.Players.LocalPlayer
local Presents = require(script.Parent.Parent.Parent.Configs.Presents)
local v1 = if LocalPlayer then require(ReplicatedStorage.Modules.PlayerData.ClientState) else require(ServerScriptService.PlayerData.Manager)
local v2 = if LocalPlayer then nil else require(ServerStorage.Modules.TowersManager)
local Towers = require(ReplicatedStorage.Configs.Towers)
local TowersModule = require(ReplicatedStorage.Modules.Towers.TowersModule)
local Misc = require(ReplicatedStorage.Configs.Misc)
local Robux = require(ReplicatedStorage.Configs.Robux)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local Quests = require(ReplicatedStorage.Modules.Misc.Quests)
local t = {}
function halfString(p1) --[[ halfString | Line: 21 ]]
	return string.sub(p1, 1, (math.floor(#p1 / 2)))
end
function t.Give(p1, p2, p3) --[[ Give | Line: 26 | Upvalues: LocalPlayer (copy), Presents (copy), v1 (copy), ReplicatedStorage (copy) ]]
	if LocalPlayer then
		return
	end
	if not Presents.Presents[p2] then
		return
	end
	if not p3 then
		p3 = 1
	end
	if not tonumber(p3) then
		return
	end
	local v12 = tonumber(p3)
	local v2 = v1.Profiles[p1]
	if not v2 then
		return
	end
	if v2.Data.Presents[p2] then
		local Presents_2 = v2.Data.Presents
		Presents_2[p2] = Presents_2[p2] + v12
	else
		v2.Data.Presents[p2] = v12
	end
	ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v2.Data)
	ReplicatedStorage.Remotes.Misc.UpdateItems:FireClient(p1)
end
function t.Remove(p1, p2, p3) --[[ Remove | Line: 46 | Upvalues: LocalPlayer (copy), v1 (copy), ReplicatedStorage (copy) ]]
	if LocalPlayer then
		return
	end
	if not p3 then
		p3 = 1
	end
	local v12 = v1.Profiles[p1]
	if not v12 then
		return
	end
	if not v12.Data.Presents[p2] then
		return
	end
	if v12.Data.Presents[p2] < p3 then
		return
	end
	local Presents = v12.Data.Presents
	Presents[p2] = Presents[p2] - p3
	if v12.Data.Presents[p2] <= 0 then
		v12.Data.Presents[p2] = nil
	end
	ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
	ReplicatedStorage.Remotes.Misc.UpdateItems:FireClient(p1)
	return true
end
function t.Open(p1, p2, p3) --[[ Open | Line: 64 | Upvalues: LocalPlayer (copy), Presents (copy), v1 (copy), ReplicatedStorage (copy), Robux (copy), TowersModule (copy), t (copy), Towers (copy), v2 (copy), Misc (copy), HttpService (copy), Quests (copy), Formatter (copy) ]]
	if p3 ~= 1 and (p3 ~= 3 and (p3 ~= 8 and p3 ~= "All")) then
		return
	end
	if LocalPlayer then
		return
	end
	if not Presents.Presents[p2] then
		return
	end
	local v12 = v1.Profiles[p1]
	if not v12 then
		return
	end
	local v22
	if p3 == "All" then
		v22 = true
		if not v12.Data.Gamepasses.QuickOpen then
			ReplicatedStorage.Remotes.Misc.Prompt:FireClient(p1, Robux.Products.QuickOpen)
			return
		end
		local v3 = TowersModule.GetMaxStorage() - TowersModule.GetStorage(v12.Data)
		local v4 = v12.Data.Presents[p2]
		p3 = if v3 < v4 then v3 else v4
		if p3 > 25 then
			p3 = 25
		end
	else
		v22 = nil
	end
	if p3 <= 0 or TowersModule.GetStorage(v12.Data) + p3 > TowersModule.GetMaxStorage() then
		ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, (("You can\'t have more than %* towers"):format((TowersModule.GetMaxStorage()))))
		return
	end
	if not t.Remove(p1, p2, p3) then
		ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "You don\'t have enough presents!")
		return
	end
	local v5 = 1
	if ReplicatedStorage.Objects:FindFirstChild("Values") and (ReplicatedStorage.Objects.Values:FindFirstChild("Luck") and ReplicatedStorage.Objects.Values.Luck.Value > 1) then
		v5 = ReplicatedStorage.Objects.Values.Luck.Value
	elseif v12.Data.Boosts.SuperLuckPotion then
		v5 = 2
	elseif v12.Data.Boosts.LuckPotion then
		v5 = 1.5
	end
	local tbl = {}
	for k, v in pairs(Presents.Presents[p2].Chances) do
		if v <= 10 and (Towers.Towers[k] and (Towers.Towers[k].Rarity == "Mythic" or (Towers.Towers[k].Rarity == "Secret" or (Towers.Towers[k].Rarity == "Nightmare" or Towers.Towers[k].Rarity == "Apex")))) then
			tbl[k] = v * v5
			continue
		end
		tbl[k] = v
	end
	local sum = 0
	for k, v in pairs(tbl) do
		sum = sum + v
	end
	local Data = v12.Data
	Data.PresentsOpened = Data.PresentsOpened + p3
	local tbl2 = {}
	for i = 1, p3 do
		local sum_2 = Random.new():NextNumber(0, sum)
		for k, v in pairs(tbl) do
			sum_2 = sum_2 - v
			if sum_2 < 0 then
				tbl2[i] = {
					Name = k,
					Show = k
				}
				break
			end
		end
	end
	local t2 = {}
	for k, v in pairs(tbl2) do
		local Rarity = Towers.Towers[v.Name].Rarity
		if t2[Rarity] then
			t2[Rarity] = t2[Rarity] + 1
			continue
		end
		t2[Rarity] = 1
	end
	local ShinyHunter = v12.Data.Gamepasses.ShinyHunter
	local t3 = {}
	local sum_2 = 0
	for k, v in pairs(tbl2) do
		local v6 = if Random.new():NextNumber(0, 100) <= 2 then true else false
		if v6 then
			tbl2[k] = {
				Name = v.Name,
				Show = "Shiny " .. v.Name
			}
		end
		local Rarity = Towers.Towers[v.Name].Rarity
		if v12.Data.AutoDeletePresents[Rarity] and not v6 then
			if Misc.SellValues[Rarity] then
				sum_2 = sum_2 + Misc.SellValues[Rarity]
			end
		else
			local ID = v2.Give(p1, v.Name, if v6 then "IsShiny" else nil, nil, nil, nil, nil, true).ID
			table.insert(t3, ID)
		end
		if (Rarity == "Secret" or (Rarity == "Nightmare" or (Rarity == "Apex" or Rarity == "Forgotten"))) and (t2[Rarity] <= (if p3 > 8 then 5 else 3) or v6) then
			pcall(function() --[[ Line: 166 | Upvalues: HttpService (ref), v12 (copy), v6 (copy), v (copy), p2 (copy) ]]
				local v1 = halfString(HttpService:GenerateGUID(false))
				local t = {
					Time = os.time()
				}
				t.Message = "Obtained: " .. (if v6 then "Shiny " else "") .. v.Name .. " from " .. p2 .. " present"
				v12.Data.PresentHistory[v1] = t
			end)
		end
		if Rarity == "Apex" then
			Quests.DoTask(p1, "TheStrongest", 1)
			local v11 = p1.Name
			task.delay(10, function() --[[ Line: 174 | Upvalues: v6 (copy), ReplicatedStorage (ref), v11 (copy), v (copy) ]]
				if v6 then
					ReplicatedStorage.Remotes.Misc.ChatMessage:FireAllClients(v11 .. " just got a SHINY apex " .. v.Name .. " from a present!")
				else
					ReplicatedStorage.Remotes.Misc.ChatMessage:FireAllClients(v11 .. " just got an apex " .. v.Name .. " from a present!")
				end
			end)
		end
	end
	if sum_2 > 0 then
		v1.Increase(p1, "Tokens", sum_2)
		ReplicatedStorage.Remotes.Misc.Notify:FireClient(p1, ("+%* Tokens from auto deleted units"):format((Formatter.FormatCompact(sum_2))), Color3.fromRGB(255, 241, 41))
	end
	ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
	ReplicatedStorage.Remotes.Towers.Give:FireClient(p1, t3)
	ReplicatedStorage.Remotes.Misc.UpdateIndex:FireClient(p1)
	ReplicatedStorage.Remotes.Misc.UpdateItems:FireClient(p1, "OpenedPresent", tbl2, v22)
	Quests.DoTask(p1, "OpenPresents", p3)
end
if LocalPlayer then
	ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 212 | Upvalues: Towers (copy) ]]
		if not p1 then
			return
		end
		if pcall(function() --[[ Line: 214 | Upvalues: p1 (ref), Towers (ref) ]]
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
	local t2 = {}
	ReplicatedStorage.Remotes.Misc.OpenPresent.OnServerEvent:Connect(function(p1, p2, p3) --[[ Line: 200 | Upvalues: t2 (copy), t (copy) ]]
		if not t2[p1.Name] then
			t2[p1.Name] = true
			delay(0.5, function() --[[ Line: 203 | Upvalues: t2 (ref), p1 (copy) ]]
				t2[p1.Name] = nil
			end)
			task.spawn(t.Open, p1, p2, p3)
		end
	end)
end
return t