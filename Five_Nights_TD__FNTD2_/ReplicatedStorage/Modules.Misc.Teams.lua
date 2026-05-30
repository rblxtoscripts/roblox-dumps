-- https://lua.expert/
local TextService = game:GetService("TextService")
local LocalPlayer = game.Players.LocalPlayer
local Teams = game.ReplicatedStorage.Remotes.Misc.Teams
local Manager = require(game.ServerScriptService.PlayerData.Manager)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
local t = {}
local t2 = { "Team1", "Team2", "Team3", "Team4", "Team5", "Team6" }
function t.SetTowers(p1, p2) --[[ SetTowers | Line: 13 | Upvalues: t2 (copy), Manager (copy), Teams (copy) ]]
	if not table.find(t2, p2) then
		return
	end
	local v1 = Manager.Profiles[p1]
	if not v1 then
		return
	end
	if not v1.Data.Teams[p2] then
		v1.Data.Teams[p2] = {}
	end
	v1.Data.Teams[p2].Towers = {}
	for k, v in pairs(v1.Data.Towers) do
		if v.Equipped then
			v1.Data.Teams[p2].Towers["Slot" .. v.Equipped] = v.ID
		end
	end
	game.ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v1.Data)
	Teams:FireClient(p1, p2)
	game.ReplicatedStorage.Remotes.Misc.Notify:FireClient(p1, "Successfully set team!", Color3.fromRGB(67, 255, 73))
end
function t.ClearTowers(p1, p2) --[[ ClearTowers | Line: 37 | Upvalues: t2 (copy), Manager (copy), Teams (copy) ]]
	if not table.find(t2, p2) then
		return
	end
	local v1 = Manager.Profiles[p1]
	if not v1 then
		return
	end
	if not v1.Data.Teams[p2] then
		v1.Data.Teams[p2] = {}
	end
	v1.Data.Teams[p2].Towers = {}
	game.ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v1.Data)
	Teams:FireClient(p1, p2)
	game.ReplicatedStorage.Remotes.Misc.Notify:FireClient(p1, "Successfully cleared team!", Color3.fromRGB(67, 255, 73))
end
function t.ChangeName(p1, p2, p3) --[[ ChangeName | Line: 55 | Upvalues: t2 (copy), Manager (copy), TextService (copy), Teams (copy) ]]
	if not table.find(t2, p2) then
		return
	end
	local v1 = Manager.Profiles[p1]
	if not v1 then
		return
	end
	if not v1.Data.Teams[p2] then
		v1.Data.Teams[p2] = {}
	end
	local v2 = ""
	local v3, _ = pcall(function() --[[ Line: 66 | Upvalues: v2 (ref), TextService (ref), p3 (copy), p1 (copy) ]]
		v2 = TextService:FilterStringAsync(p3, p1.UserId)
		v2 = v2:GetNonChatStringForBroadcastAsync()
	end)
	if not v3 then
		return
	end
	local v4 = v2
	if string.len(v4) > 15 then
		game.ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Name too long!")
		return
	end
	local v5 = v2
	if string.len(v5) < 1 then
		game.ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Name too short!")
		return
	end
	if v1.Data.Teams[p2].Name and v2 == v1.Data.Teams[p2].Name then
		return
	end
	v1.Data.Teams[p2].Name = v2
	game.ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v1.Data)
	Teams:FireClient(p1, p2)
	game.ReplicatedStorage.Remotes.Misc.Notify:FireClient(p1, "Successfully changed name!", Color3.fromRGB(67, 255, 73))
end
function t.Equip(p1, p2) --[[ Equip | Line: 85 | Upvalues: t2 (copy), Manager (copy), Misc (copy) ]]
	if not table.find(t2, p2) then
		return
	end
	if p1:FindFirstChild("InQueue") then
		game.ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "You can\'t do this while in a queue!")
		return
	end
	local v1 = Manager.Profiles[p1]
	if not v1 then
		return
	end
	if not (v1.Data.Teams[p2] and v1.Data.Teams[p2].Towers) then
		game.ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "You can\'t equip an empty team!")
		return
	end
	local count = 0
	for k, v in pairs(v1.Data.Teams[p2].Towers) do
		if v1.Data.Towers[v] then
			count = count + 1
		end
	end
	if count == 0 then
		game.ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "You can\'t equip an empty team!")
		return
	end
	for k, v in pairs(v1.Data.Towers) do
		if v.Equipped then
			v.Equipped = nil
		end
	end
	local SameTowers = Misc.SameTowers
	local tbl = {}
	local tbl2 = {}
	for k, v in pairs(v1.Data.Teams[p2].Towers) do
		local v2 = string.gsub(k, "Slot", "")
		for k2, v3 in pairs(tbl) do
			local v32 = if v1.Data.Towers[v] then v1.Data.Towers[v] else ""
			if SameTowers[v3] then
				if v32 == SameTowers[v3] then
					game.ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, ("You can\'t equip a %* and %* on the same team!"):format(v3, v32), Color3.fromRGB(255, 39, 43))
					return
				end
				continue
			end
			if SameTowers[v32] and v3 == SameTowers[v32] then
				game.ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, ("You can\'t equip a %* and %* on the same team!"):format(v32, v3), Color3.fromRGB(255, 39, 43))
				return
			end
		end
		if v1.Data.Towers[v] then
			v1.Data.Towers[v].Equipped = tonumber(v2)
			table.insert(tbl2, v)
			table.insert(tbl, v1.Data.Towers[v].Name)
		end
	end
	game.ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v1.Data)
	for k, v in pairs(tbl2) do
		game.ReplicatedStorage.Remotes.Towers.Equip:FireClient(p1, v)
	end
	game.ReplicatedStorage.Remotes.Misc.Notify:FireClient(p1, "Successfully equipped team!", Color3.fromRGB(67, 255, 73))
end
local t3 = {}
Teams.OnServerEvent:Connect(function(p1, p2, p3, p4) --[[ Line: 149 | Upvalues: t3 (copy), t (copy) ]]
	if t3[p1.Name] then
		game.ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Please wait before doing this!")
		return
	end
	t3[p1.Name] = true
	delay(0.5, function() --[[ Line: 154 | Upvalues: t3 (ref), p1 (copy) ]]
		t3[p1.Name] = nil
	end)
	if p2 == "Set" then
		t.SetTowers(p1, p3)
		return
	end
	if p2 == "Clear" then
		t.ClearTowers(p1, p3)
		return
	end
	if p2 == "Name" then
		t.ChangeName(p1, p3, p4)
		return
	end
	if p2 ~= "Equip" then
		return
	end
	t.Equip(p1, p3)
end)
return t