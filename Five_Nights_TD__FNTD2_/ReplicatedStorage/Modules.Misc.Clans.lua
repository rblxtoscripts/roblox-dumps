-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local TextService = game:GetService("TextService")
game:GetService("Chat")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Clans = ReplicatedStorage.Remotes.Clans
local Notify = ReplicatedStorage.Remotes.Misc.Notify
local v1 = DataStoreService:GetDataStore("Clans.v6")
local v2 = DataStoreService:GetDataStore("Clans.v6_Points")
local v3 = DataStoreService:GetDataStore("Clans.v6_Players")
local v4 = DataStoreService:GetDataStore("Clans.v6_Invites")
local v5 = DataStoreService:GetOrderedDataStore("Clans.v6_LeaderboardPoints.v15")
local v6 = DataStoreService:GetDataStore("Clans.v6_Names")
DataStoreService:GetDataStore("ClanLeaderboardRewards.v11")
local Manager = require(game.ServerScriptService.PlayerData.Manager)
local Robux = require(ReplicatedStorage.Configs.Robux)
local Misc = require(ReplicatedStorage.Configs.Misc)
require(ReplicatedStorage.Libs.Formatter)
local t = {}
local t2 = {}
local t3 = {}
local t4 = {
	Get = function(p1, p2, p3) --[[ Get | Line: 34 | Upvalues: v1 (copy), v3 (copy), v2 (copy), v4 (copy), v5 (copy), v6 (copy) ]]
		if p3 == "Clan" then
			local v12, v22 = pcall(function() --[[ Line: 36 | Upvalues: v1 (ref), p2 (copy) ]]
				return v1:GetAsync(p2)
			end)
			if v12 then
				return v22
			else
				return nil
			end
		elseif p3 == "Player" then
			local v32, v42 = pcall(function() --[[ Line: 41 | Upvalues: v3 (ref), p2 (copy) ]]
				return v3:GetAsync(p2)
			end)
			if v32 then
				return v42
			else
				return nil
			end
		elseif p3 == "Points" then
			local v52, v62 = pcall(function() --[[ Line: 46 | Upvalues: v2 (ref), p2 (copy) ]]
				return v2:GetAsync(p2)
			end)
			if v52 then
				return v62
			else
				return nil
			end
		elseif p3 == "Invites" then
			local v7, v8 = pcall(function() --[[ Line: 51 | Upvalues: v4 (ref), p2 (copy) ]]
				return v4:GetAsync(p2)
			end)
			if v7 then
				return v8
			else
				return nil
			end
		elseif p3 == "Leaderboard" then
			local v9, v10 = pcall(function() --[[ Line: 56 | Upvalues: v5 (ref), p2 (copy) ]]
				return v5:GetAsync(p2)
			end)
			if v9 then
				return v10
			else
				return nil
			end
		else
			if p3 ~= "Names" then
				return nil
			end
			local v11, v12 = pcall(function() --[[ Line: 61 | Upvalues: v6 (ref), p2 (copy) ]]
				return v6:GetAsync(p2)
			end)
			if v11 then
				return v12
			else
				return nil
			end
		end
	end
}
function t4.IsInClan(p1) --[[ IsInClan | Line: 69 | Upvalues: t4 (copy) ]]
	if not p1 then
		return nil
	end
	if typeof(p1) == "string" and #p1 <= 1 then
		return nil
	end
	local v4 = t4:Get(("Player_%*"):format(if typeof(p1) == "string" and p1 then p1 else p1.UserId), "Player")
	if v4 then
		return t4:Get(v4, "Clan") or nil
	else
		return nil
	end
end
function t4.GetClanStats(p1) --[[ GetClanStats | Line: 80 | Upvalues: t4 (copy) ]]
	local v1 = t4:Get(p1, "Clan")
	if not v1 then
		return
	end
	local t = {}
	for k, v in pairs(v1) do
		t[k] = v
	end
	local _ = v1.Name
	local Players = v1.Players
	local Bio = v1.Bio
	local Owner = v1.Owner
	local Icon = v1.Icon
	local t2 = {}
	local _2, _3 = pcall(function() --[[ Line: 95 | Upvalues: t2 (ref), t4 (ref), p1 (copy) ]]
		t2 = t4:Get(p1, "Points")
	end)
	t.Points = t2
	return t
end
local t5 = {}
function t4.Create(p1, p2, p3) --[[ Create | Line: 104 | Upvalues: t5 (copy), Notify (copy), Manager (copy), t4 (copy), t2 (copy), HttpService (copy), v1 (copy), v3 (copy), v2 (copy), v6 (copy), v5 (copy), Clans (copy) ]]
	if t5[p1.Name] then
		Notify:FireClient(p1, "Please wait before doing this!", Color3.fromRGB(255, 15, 19))
		return
	end
	t5[p1.Name] = true
	task.delay(5, function() --[[ Line: 108 | Upvalues: t5 (ref), p1 (copy) ]]
		t5[p1.Name] = nil
	end)
	local v12 = Manager.Profiles[p1]
	if not v12 then
		return
	end
	if t4.IsInClan(p1) then
		return
	end
	if not p3 and (not t2[p1.Name] or t2[p1.Name] ~= p2) then
		return
	end
	if not (if p3 then true else false) then
		if v12.Data.Tokens < 10000 then
			Notify:FireClient(p1, "You don\'t have enough tokens!", Color3.fromRGB(255, 15, 19))
			return
		end
		Manager.Decrease(p1, "Tokens", 10000)
	end
	local v32 = HttpService:GenerateGUID(false)
	local t = {
		Bio = "No Bio",
		Icon = "rbxassetid://18101588558",
		ID = v32,
		Name = p2,
		Owner = p1.UserId,
		Players = {
			["Player_" .. p1.UserId] = {
				UserId = p1.UserId
			}
		}
	}
	local v4, _ = pcall(function() --[[ Line: 142 | Upvalues: v1 (ref), v32 (copy), t (copy) ]]
		v1:UpdateAsync(v32, function() --[[ Line: 143 | Upvalues: t (ref) ]]
			return t
		end)
	end)
	local _2, _3 = pcall(function() --[[ Line: 147 | Upvalues: v3 (ref), p1 (copy), v32 (copy) ]]
		v3:UpdateAsync("Player_" .. p1.UserId, function() --[[ Line: 148 | Upvalues: v32 (ref) ]]
			return v32
		end)
	end)
	local _4, _5 = pcall(function() --[[ Line: 152 | Upvalues: v2 (ref), v32 (copy), p1 (copy) ]]
		v2:UpdateAsync(v32, function() --[[ Line: 153 | Upvalues: p1 (ref) ]]
			return {
				["Player_" .. p1.UserId] = {
					["Points.v15"] = 0
				}
			}
		end)
	end)
	local _6, _7 = pcall(function() --[[ Line: 157 | Upvalues: v6 (ref), p2 (copy), v32 (copy) ]]
		v6:UpdateAsync(p2, function() --[[ Line: 158 | Upvalues: v32 (ref) ]]
			return v32
		end)
	end)
	local _8, _9 = pcall(function() --[[ Line: 162 | Upvalues: v5 (ref), v32 (copy) ]]
		v5:UpdateAsync(v32, function() --[[ Line: 163 ]]
			return 0
		end)
	end)
	v12.Data.ClanRewards.JoinedAt = 0
	if not v4 then
		return
	end
	Clans.Update:FireClient(p1, t4.GetClanStats(t.ID))
	Clans.UpdateRewards:FireClient(p1)
end
function t4.Delete(p1) --[[ Delete | Line: 176 | Upvalues: t4 (copy), Notify (copy), v1 (copy), v2 (copy), v6 (copy), v5 (copy), v3 (copy), Clans (copy) ]]
	local v12 = t4.IsInClan(p1)
	if not v12 or v12.Owner ~= p1.UserId then
		return
	end
	for k, v in pairs(v12.Players) do
		if v.UserId ~= p1.UserId then
			Notify:FireClient(p1, "You have to be the only one left in the clan to delete it!", Color3.fromRGB(255, 20, 24))
			return
		end
	end
	local v22, _ = pcall(function() --[[ Line: 187 | Upvalues: v1 (ref), v12 (copy) ]]
		v1:RemoveAsync(v12.ID)
	end)
	local _2, _3 = pcall(function() --[[ Line: 190 | Upvalues: v2 (ref), v12 (copy) ]]
		v2:RemoveAsync(v12.ID)
	end)
	local _4, _5 = pcall(function() --[[ Line: 193 | Upvalues: v6 (ref), v12 (copy) ]]
		v6:RemoveAsync(v12.Name)
	end)
	local _6, _7 = pcall(function() --[[ Line: 196 | Upvalues: v5 (ref), v12 (copy) ]]
		v5:RemoveAsync(v12.ID)
	end)
	if not v22 then
		return
	end
	local _8, _9 = pcall(function() --[[ Line: 200 | Upvalues: v3 (ref), p1 (copy) ]]
		v3:RemoveAsync("Player_" .. p1.UserId)
	end)
	Notify:FireClient(p1, "Success!", Color3.fromRGB(35, 255, 61))
	Clans.Update:FireClient(p1, "None")
end
function t4.ForceDelete(p1, p2) --[[ ForceDelete | Line: 208 | Upvalues: ReplicatedStorage (copy), t4 (copy), v1 (copy), v2 (copy), v6 (copy), v5 (copy), v3 (copy), Notify (copy) ]]
	if game:GetService("RunService"):IsServer() and (p1 and p2) then
		ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Make sure the most players in the clan is left from the game first!")
		task.delay(1.5, function() --[[ Line: 212 | Upvalues: ReplicatedStorage (ref), p1 (copy), t4 (ref), p2 (copy), v1 (ref), v2 (ref), v6 (ref), v5 (ref), v3 (ref), Notify (ref) ]]
			ReplicatedStorage.Remotes.Misc.Notify:FireClient(p1, "Deleting the clan, please wait.")
			local v12 = t4.IsInClan(p2)
			if not v12 then
				ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Please enter the correct owner playerId to delete the clan.")
				return
			end
			local v22 = p2
			if tostring(v12.Owner) ~= tostring(v22) then
				ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Please enter the correct owner playerId to delete the clan.")
				return
			end
			local t = {}
			for k, v in pairs(v12.Players) do
				table.insert(t, v.UserId)
			end
			if not pcall(function() --[[ Line: 222 | Upvalues: v1 (ref), v12 (copy) ]]
				v1:RemoveAsync(v12.ID)
			end) then
				ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Failed to delete the clan, try again later.")
				return
			end
			pcall(function() --[[ Line: 226 | Upvalues: v2 (ref), v12 (copy) ]]
				v2:RemoveAsync(v12.ID)
			end)
			pcall(function() --[[ Line: 229 | Upvalues: v6 (ref), v12 (copy) ]]
				v6:RemoveAsync(v12.Name)
			end)
			pcall(function() --[[ Line: 232 | Upvalues: v5 (ref), v12 (copy) ]]
				v5:RemoveAsync(v12.ID)
			end)
			pcall(function() --[[ Line: 235 | Upvalues: v3 (ref), p2 (ref) ]]
				v3:RemoveAsync((("Player_%*"):format(p2)))
			end)
			for v32, v4 in t do
				pcall(function() --[[ Line: 239 | Upvalues: v3 (ref), v4 (copy) ]]
					v3:RemoveAsync((("Player_%*"):format(v4)))
				end)
			end
			Notify:FireClient(p1, "Successfully deleted the clan!", Color3.fromRGB(35, 255, 61))
		end)
	end
end
function t4.ForceDeleteById(p1, p2) --[[ ForceDeleteById | Line: 250 | Upvalues: ReplicatedStorage (copy), t4 (copy), v1 (copy), v2 (copy), v6 (copy), v5 (copy), v3 (copy), Notify (copy) ]]
	if game:GetService("RunService"):IsServer() and (p1 and p2) then
		ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Make sure the most players in the clan is left from the game first!")
		task.delay(1.5, function() --[[ Line: 254 | Upvalues: ReplicatedStorage (ref), p1 (copy), t4 (ref), p2 (copy), v1 (ref), v2 (ref), v6 (ref), v5 (ref), v3 (ref), Notify (ref) ]]
			ReplicatedStorage.Remotes.Misc.Notify:FireClient(p1, "Deleting the clan, please wait.")
			local v12 = t4:Get(p2, "Clan")
			if not v12 then
				ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Failed to get the clan.")
				return
			end
			local t = {}
			for k, v in pairs(v12.Players) do
				table.insert(t, v.UserId)
			end
			if not pcall(function() --[[ Line: 264 | Upvalues: v1 (ref), v12 (copy) ]]
				v1:RemoveAsync(v12.ID)
			end) then
				ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Failed to delete the clan, try again later.")
				return
			end
			pcall(function() --[[ Line: 268 | Upvalues: v2 (ref), v12 (copy) ]]
				v2:RemoveAsync(v12.ID)
			end)
			pcall(function() --[[ Line: 271 | Upvalues: v6 (ref), v12 (copy) ]]
				v6:RemoveAsync(v12.Name)
			end)
			pcall(function() --[[ Line: 274 | Upvalues: v5 (ref), v12 (copy) ]]
				v5:RemoveAsync(v12.ID)
			end)
			for v22, v32 in t do
				pcall(function() --[[ Line: 278 | Upvalues: v3 (ref), v32 (copy) ]]
					v3:RemoveAsync((("Player_%*"):format(v32)))
				end)
			end
			Notify:FireClient(p1, "Successfully deleted the clan!", Color3.fromRGB(35, 255, 61))
		end)
	end
end
function t4.Leave(p1) --[[ Leave | Line: 289 | Upvalues: t4 (copy), Notify (copy), v1 (copy), v3 (copy), v2 (copy), Players (copy), Clans (copy) ]]
	local v12 = t4.IsInClan(p1)
	if not v12 then
		return
	end
	if v12.Owner == p1.UserId then
		Notify:FireClient(p1, "You can\'t leave the clan as the owner!", Color3.fromRGB(255, 8, 12))
		return
	end
	local t = {}
	for k, v in pairs(v12.Players) do
		local v22 = tostring(v.UserId)
		if v22 == tostring(p1.UserId) then
			t[k] = nil
			continue
		end
		t[k] = v
	end
	local t2 = {
		ID = v12.ID,
		Name = v12.Name,
		Owner = v12.Owner,
		Players = t,
		Bio = v12.Bio,
		Icon = v12.Icon
	}
	local v32, _ = pcall(function() --[[ Line: 312 | Upvalues: v1 (ref), v12 (copy), t2 (copy) ]]
		v1:UpdateAsync(v12.ID, function() --[[ Line: 313 | Upvalues: t2 (ref) ]]
			return t2
		end)
	end)
	if not v32 then
		return
	end
	local _2, _3 = pcall(function() --[[ Line: 319 | Upvalues: v3 (ref), p1 (copy) ]]
		v3:RemoveAsync("Player_" .. p1.UserId)
	end)
	local v4 = t4:Get(v12.ID, "Points")
	local t3 = {}
	if v4 then
		for k, v in pairs(v4) do
			if k == "Player_" .. p1.UserId then
				t3[k] = nil
				continue
			end
			t3[k] = v
		end
	end
	local _4, _5 = pcall(function() --[[ Line: 335 | Upvalues: v2 (ref), v12 (copy), t3 (copy) ]]
		v2:UpdateAsync(v12.ID, function() --[[ Line: 336 | Upvalues: t3 (ref) ]]
			return t3
		end)
	end)
	for i, v in ipairs(Players:GetPlayers()) do
		if t2.Players["Player_" .. v.UserId] and v.UserId ~= p1.UserId then
			Clans.Update:FireClient(v, t2)
		end
	end
	Clans.Update:FireClient(p1, "None")
	Notify:FireClient(p1, "Success!", Color3.fromRGB(35, 255, 61))
	Clans.UpdateRewards:FireClient(p1)
end
function t4.Invite(p1, p2) --[[ Invite | Line: 376 | Upvalues: Players (copy), t4 (copy), Notify (copy), t3 (copy), Clans (copy) ]]
	local v1 = Players:FindFirstChild(p2)
	if not v1 then
		return
	end
	if p1.UserId == v1.UserId then
		return
	end
	if t4:Get("Player_" .. v1.UserId, "Player") then
		Notify:FireClient(p1, v1.Name .. " is already in a clan!", Color3.fromRGB(255, 10, 14))
		return
	end
	local v2 = t4.IsInClan(p1)
	if not v2 then
		return
	end
	if not t3[v1.Name] then
		t3[v1.Name] = {}
	end
	local v3 = v1
	if t3[v3.Name][v2.ID] then
		Notify:FireClient(p1, v3.Name .. " was already invited to this clan!", Color3.fromRGB(255, 10, 14))
		return
	end
	local isUserId = v2.Owner == p1.UserId
	if not isUserId then
		for k, v in pairs(v2.Players) do
			local v4 = tostring(v.UserId)
			if v4 == tostring(p1.UserId) and (v.Rank and v.Rank == "Officer") then
				isUserId = true
			end
		end
	end
	if isUserId then
		t3[v3.Name][v2.ID] = true
		Clans.Invite:FireClient(p1, v3.Name, "Sent")
		Clans.Invite:FireClient(v3, p1.Name, v2.ID)
	else
		Notify:FireClient(p1, "You aren\'t allowed to do this!", Color3.fromRGB(255, 10, 14))
	end
end
function t4.Join(p1, p2) --[[ Join | Line: 405 | Upvalues: t4 (copy), t3 (copy), Notify (copy), v1 (copy), v3 (copy), Players (copy), Clans (copy), Manager (copy), v2 (copy) ]]
	if t4:Get("Player_" .. p1.UserId, "Player") then
		return
	end
	if not (t3[p1.Name] and t3[p1.Name][p2]) then
		return
	end
	t3[p1.Name][p2] = nil
	local v12 = t4:Get(p2, "Clan")
	if not v12 then
		return
	end
	local count = 0
	local t = {}
	for k, v in pairs(v12.Players) do
		t[k] = v
		count = count + 1
	end
	if count >= 20 then
		Notify:FireClient(p1, "Too many players are in this clan!", Color3.fromRGB(255, 10, 14))
		return
	end
	t["Player_" .. p1.UserId] = {
		Rank = "Member",
		UserId = p1.UserId
	}
	local t2 = {
		Name = v12.Name,
		ID = v12.ID,
		Owner = v12.Owner,
		Players = t,
		Bio = v12.Bio,
		Icon = v12.Icon
	}
	local v22, _ = pcall(function() --[[ Line: 436 | Upvalues: v1 (ref), v12 (copy), t2 (copy) ]]
		v1:UpdateAsync(v12.ID, function() --[[ Line: 437 | Upvalues: t2 (ref) ]]
			return t2
		end)
	end)
	if not v22 then
		return
	end
	local _2, _3 = pcall(function() --[[ Line: 444 | Upvalues: v3 (ref), p1 (copy), t2 (copy) ]]
		v3:UpdateAsync("Player_" .. p1.UserId, function() --[[ Line: 445 | Upvalues: t2 (ref) ]]
			return t2.ID
		end)
	end)
	local v32 = t4.GetClanStats(t2.ID)
	for i, v in ipairs(Players:GetPlayers()) do
		if t2.Players["Player_" .. v.UserId] then
			local v4 = false
			local _4, _5 = pcall(function() --[[ Line: 454 | Upvalues: t4 (ref), v (copy), v12 (copy), v4 (ref) ]]
				if t4:Get("Player_" .. v.UserId, "Player") ~= v12.ID then
					return
				end
				v4 = true
			end)
			if v4 then
				Clans.Update:FireClient(v, v32)
			end
		end
	end
	Clans.Invite:FireClient(p1, "Close")
	local _4, _5 = pcall(function() --[[ Line: 483 | Upvalues: t4 (ref), v12 (copy), Manager (ref), p1 (copy) ]]
		Manager.Profiles[p1].Data.ClanRewards.JoinedAt = t4:Get(v12.ID, "Leaderboard")
	end)
	local v5 = t4:Get(v12.ID, "Points")
	local t5 = {}
	for k, v in pairs(v5) do
		t5[k] = v
	end
	t5["Player_" .. p1.UserId] = {
		["Points.v15"] = 0
	}
	local _6, _7 = pcall(function() --[[ Line: 496 | Upvalues: v2 (ref), v12 (copy), t5 (copy) ]]
		v2:UpdateAsync(v12.ID, function() --[[ Line: 497 | Upvalues: t5 (ref) ]]
			return t5
		end)
	end)
	Clans.UpdateRewards:FireClient(p1)
end
local t6 = {}
function t4.GivePoints(p1, p2) --[[ GivePoints | Line: 506 | Upvalues: t4 (copy), t6 (copy), v2 (copy), v5 (copy), Players (copy), Clans (copy) ]]
	local v1 = t4.IsInClan(p1)
	if not v1 then
		return
	end
	pcall(function() --[[ Line: 510 | Upvalues: t6 (ref), v1 (copy) ]]
		if t6[v1.ID] then
			local v12 = t6[v1.ID]
			local v2 = t6
			local ID = v1.ID
			v2[ID] = v2[ID] + 1
			task.delay(8, function() --[[ Line: 519 | Upvalues: t6 (ref), v1 (ref) ]]
				local v12 = t6
				local ID = v1.ID
				v12[ID] = v12[ID] - 1
			end)
			task.wait(v12 * 8)
		else
			t6[v1.ID] = 1
			task.delay(8, function() --[[ Line: 513 | Upvalues: t6 (ref), v1 (ref) ]]
				local v12 = t6
				local ID = v1.ID
				v12[ID] = v12[ID] - 1
			end)
		end
	end)
	local v22 = t4:Get(v1.ID, "Points")
	if not v22 then
		return
	end
	local v3 = t4:Get(v1.ID, "Leaderboard")
	if not v3 then
		return
	end
	local t = {}
	for k, v in pairs(v22) do
		t[k] = v
	end
	if t["Player_" .. p1.UserId] then
		if t["Player_" .. p1.UserId]["Points.v15"] then
			local v4 = t["Player_" .. p1.UserId]
			v4["Points.v15"] = v4["Points.v15"] + p2
		else
			t["Player_" .. p1.UserId]["Points.v15"] = p2
		end
	else
		t["Player_" .. p1.UserId] = {}
		t["Player_" .. p1.UserId]["Points.v15"] = p2
	end
	local v52 = v3 + p2
	local _, _2 = pcall(function() --[[ Line: 549 | Upvalues: v2 (ref), v1 (copy), t (copy) ]]
		v2:UpdateAsync(v1.ID, function() --[[ Line: 550 | Upvalues: t (ref) ]]
			return t
		end)
	end)
	local _3, _4 = pcall(function() --[[ Line: 555 | Upvalues: v5 (ref), v1 (copy), v52 (ref) ]]
		v5:UpdateAsync(v1.ID, function() --[[ Line: 556 | Upvalues: v52 (ref) ]]
			return v52
		end)
	end)
	local v6 = t4.GetClanStats(v1.ID)
	for i, v in ipairs(Players:GetPlayers()) do
		if v1.Players["Player_" .. v.UserId] then
			local v7 = false
			local _5, _6 = pcall(function() --[[ Line: 565 | Upvalues: t4 (ref), v (copy), v1 (copy), v7 (ref) ]]
				if t4:Get("Player_" .. v.UserId, "Player") ~= v1.ID then
					return
				end
				v7 = true
			end)
			if v7 then
				Clans.Update:FireClient(v, v6)
			end
		end
	end
	Clans.UpdateRewards:FireClient(p1)
end
function t4.GetTopClans() --[[ GetTopClans | Line: 578 | Upvalues: v5 (copy) ]]
	return v5:GetSortedAsync(false, 100):GetCurrentPage()
end
function t4.GetTopClanStats(p1, p2, p3) --[[ GetTopClanStats | Line: 583 | Upvalues: t (ref), t4 (copy), Clans (copy) ]]
	if not t[p1] then
		local v1 = t4:Get(p1, "Clan")
		if not v1 then
			return
		end
		t[p1] = v1
	end
	t[p1].Place = p3
	if p2 and t[p1]["Points.v15"] then
		local v2 = t[p1]
		v2["Points.v15"] = v2["Points.v15"] + p2
	elseif p2 then
		t[p1]["Points.v15"] = p2
	end
	Clans.TopClans:FireAllClients(t)
end
function t4.CanCreate(p1, p2) --[[ CanCreate | Line: 603 | Upvalues: t4 (copy), TextService (copy) ]]
	if not p2 then
		return
	end
	if t4:Get(p2, "Names") then
		return "NAME IS TAKEN"
	end
	if t4:Get("Player_" .. p1.UserId, "Player") then
		return
	end
	if string.len(p2) > 15 then
		return "NAME TOO LONG"
	end
	if string.len(p2) <= 3 then
		return "NAME TOO SHORT"
	end
	local v1 = ""
	local v2, _ = pcall(function() --[[ Line: 614 | Upvalues: v1 (ref), TextService (ref), p2 (copy), p1 (copy) ]]
		v1 = TextService:FilterStringAsync(p2, p1.UserId)
		v1 = v1:GetNonChatStringForBroadcastAsync()
	end)
	if not v2 then
		return
	end
	if p2 == v1 then
		return true
	else
		return "NAME FILTERED OUT BY ROBLOX"
	end
end
function t4.Promote(p1, p2, p3) --[[ Promote | Line: 625 | Upvalues: t4 (copy), Notify (copy), v1 (copy), Players (copy), Clans (copy) ]]
	if tostring(p1.UserId) == tostring(p2) then
		return
	end
	if p3 ~= "Member" and (p3 ~= "Officer" and p3 ~= "Owner") then
		return
	end
	local v12 = t4.IsInClan(p1)
	if v12.Owner ~= p1.UserId then
		Notify:FireClient(p1, "You aren\'t allowed to do this!", Color3.fromRGB(255, 15, 19))
		return
	end
	local t = {}
	local v2 = false
	for k, v in pairs(v12.Players) do
		t[k] = v
		if tostring(v.UserId) == tostring(p2) then
			v2 = true
		end
	end
	if not v2 then
		return
	end
	if p3 == "Owner" then
		t["Player_" .. p2] = {
			Rank = nil,
			UserId = tonumber(p2)
		}
	else
		t["Player_" .. p2] = {
			UserId = tonumber(p2),
			Rank = p3
		}
	end
	local v3 = if p3 == "Owner" then tonumber(p2) else v12.Owner
	local v4, _ = pcall(function() --[[ Line: 649 | Upvalues: v1 (ref), v12 (copy), v3 (copy), t (copy) ]]
		v1:UpdateAsync(v12.ID, function() --[[ Line: 650 | Upvalues: v12 (ref), v3 (ref), t (ref) ]]
			return {
				Name = v12.Name,
				ID = v12.ID,
				Owner = v3,
				Players = t,
				Bio = v12.Bio,
				Icon = v12.Icon
			}
		end)
	end)
	if v4 then
		Notify:FireClient(p1, "Success!", Color3.fromRGB(51, 255, 15))
	end
	if not Players:GetPlayerByUserId(p2) then
		return
	end
	local v5 = t4.GetClanStats(v12.ID)
	if not v5 then
		return
	end
	Clans.Update:FireClient(p1, v5)
end
function t4.Kick(p1, p2) --[[ Kick | Line: 675 | Upvalues: t4 (copy), v1 (copy), v3 (copy), v2 (copy), Notify (copy), Players (copy), Clans (copy) ]]
	if tostring(p1.UserId) == tostring(p2) then
		return
	end
	local v12 = t4.IsInClan(p1)
	if not v12 then
		return
	end
	if tostring(v12.Owner) == tostring(p2) then
		return
	end
	local v22 = nil
	if v12.Owner == p1.UserId then
		v22 = true
	else
		for k, v in pairs(v12.Players) do
			local v32 = tostring(v.UserId)
			if v32 == tostring(p1.UserId) then
				if v.Rank and v.Rank == "Officer" then
					v22 = true
				end
				continue
			end
			if tostring(v.UserId) == tostring(p2) and (v.Rank and v.Rank == "Officer") then
				v22 = false
				break
			end
		end
	end
	if not v22 then
		return
	end
	local t = {}
	for k, v in pairs(v12.Players) do
		t[k] = v
		local _ = tostring(v.UserId) == tostring(p2)
	end
	t["Player_" .. p2] = nil
	local t2 = {
		ID = v12.ID,
		Name = v12.Name,
		Owner = v12.Owner,
		Players = t,
		Bio = v12.Bio,
		Icon = v12.Icon
	}
	local v4, _ = pcall(function() --[[ Line: 719 | Upvalues: v1 (ref), v12 (copy), t2 (copy) ]]
		v1:UpdateAsync(v12.ID, function() --[[ Line: 720 | Upvalues: t2 (ref) ]]
			return t2
		end)
	end)
	if not v4 then
		return
	end
	v3:RemoveAsync("Player_" .. p2)
	local v5 = t4:Get(v12.ID, "Points")
	local t3 = {}
	if v5 then
		for k, v in pairs(v5) do
			if k == "Player_" .. p2 then
				t3[k] = nil
				continue
			end
			t3[k] = v
		end
	end
	pcall(function() --[[ Line: 740 | Upvalues: v2 (ref), v12 (copy), t3 (copy) ]]
		v2:UpdateAsync(v12.ID, function() --[[ Line: 741 | Upvalues: t3 (ref) ]]
			return t3
		end)
	end)
	Notify:FireClient(p1, "Success!", Color3.fromRGB(51, 255, 15))
	if Players:GetPlayerByUserId(p2) then
		Clans.Update:FireClient(Players:GetPlayerByUserId(p2), "None")
	end
	local v6 = t4.GetClanStats(t2.ID)
	for i, v in ipairs(Players:GetPlayers()) do
		if t2.Players["Player_" .. v.UserId] then
			local v7 = false
			local _2, _3 = pcall(function() --[[ Line: 756 | Upvalues: t4 (ref), v (copy), t2 (copy), v7 (ref) ]]
				if t4:Get("Player_" .. v.UserId, "Player") ~= t2.ID then
					return
				end
				v7 = true
			end)
			if v7 then
				Clans.Update:FireClient(v, v6)
			end
		end
	end
end
function t4.ChangeIcon(p1, p2) --[[ ChangeIcon | Line: 768 | Upvalues: Misc (copy), t4 (copy), v1 (copy), Notify (copy), Players (copy), Clans (copy) ]]
	if not table.find(Misc.ClanImages, p2) then
		return
	end
	local v12 = t4.IsInClan(p1)
	if not v12 or v12.Owner ~= p1.UserId then
		return
	end
	local t = {
		ID = v12.ID,
		Name = v12.Name,
		Owner = v12.Owner,
		Players = v12.Players,
		Bio = v12.Bio,
		Icon = p2
	}
	local v2, _ = pcall(function() --[[ Line: 782 | Upvalues: v1 (ref), v12 (copy), t (copy) ]]
		v1:UpdateAsync(v12.ID, function() --[[ Line: 783 | Upvalues: t (ref) ]]
			return t
		end)
	end)
	if not v2 then
		return
	end
	Notify:FireClient(p1, "Success!", Color3.fromRGB(51, 255, 15))
	local v3 = t4.GetClanStats(t.ID)
	for i, v in ipairs(Players:GetPlayers()) do
		if t.Players["Player_" .. v.UserId] then
			local v4 = false
			local _2, _3 = pcall(function() --[[ Line: 795 | Upvalues: t4 (ref), v (copy), v3 (copy), v4 (ref) ]]
				if t4:Get("Player_" .. v.UserId, "Player") ~= v3.ID then
					return
				end
				v4 = true
			end)
			if v4 then
				Clans.Update:FireClient(v, v3)
			end
		end
	end
end
function t4.ChangeBio(p1, p2) --[[ ChangeBio | Line: 808 | Upvalues: t4 (copy), TextService (copy), Notify (copy), v1 (copy), Players (copy), Clans (copy) ]]
	local v12 = t4.IsInClan(p1)
	if not v12 or v12.Owner ~= p1.UserId then
		return
	end
	local v2 = nil
	local v3, _ = pcall(function() --[[ Line: 813 | Upvalues: v2 (ref), TextService (ref), p2 (copy), p1 (copy) ]]
		v2 = TextService:FilterStringAsync(p2, p1.UserId)
		v2 = v2:GetNonChatStringForBroadcastAsync()
	end)
	if not v3 then
		return
	end
	if p2 ~= v2 then
		return Notify:FireClient(p1, "Bio filtered by roblox!", Color3.fromRGB(255, 0, 4))
	end
	if string.len(p2) < 3 then
		Notify:FireClient(p1, "Bio too short!", Color3.fromRGB(255, 0, 4))
		return
	end
	if string.len(p2) > 20 then
		Notify:FireClient(p1, "Bio too long!", Color3.fromRGB(255, 0, 4))
		return
	end
	local t = {
		ID = v12.ID,
		Name = v12.Name,
		Owner = v12.Owner,
		Players = v12.Players,
		Bio = p2,
		Icon = v12.Icon
	}
	local v4, _2 = pcall(function() --[[ Line: 832 | Upvalues: v1 (ref), v12 (copy), t (copy) ]]
		v1:UpdateAsync(v12.ID, function() --[[ Line: 833 | Upvalues: t (ref) ]]
			return t
		end)
	end)
	if not v4 then
		return
	end
	Notify:FireClient(p1, "Success!", Color3.fromRGB(51, 255, 15))
	local v5 = t4.GetClanStats(t.ID)
	for i, v in ipairs(Players:GetPlayers()) do
		if t.Players["Player_" .. v.UserId] then
			local v6 = false
			local _3, _4 = pcall(function() --[[ Line: 845 | Upvalues: t4 (ref), v (copy), v12 (copy), v6 (ref) ]]
				if t4:Get("Player_" .. v.UserId, "Player") ~= v12.ID then
					return
				end
				v6 = true
			end)
			if v6 then
				Clans.Update:FireClient(v, v5)
			end
		end
	end
end
function t4.GetRewardStats(p1) --[[ GetRewardStats | Line: 858 | Upvalues: t4 (copy), Manager (copy), v5 (copy), Misc (copy) ]]
	local v1 = t4:Get("Player_" .. p1.UserId, "Player")
	if not v1 then
		return "No Clan"
	end
	local v2 = Manager.Profiles[p1]
	if not v2 then
		return
	end
	local v3 = nil
	local _, v4 = pcall(function() --[[ Line: 866 | Upvalues: v3 (ref), v5 (ref), v1 (copy) ]]
		v3 = v5:GetAsync(v1)
	end)
	if not (v3 or v4) then
		local _2, _3 = pcall(function() --[[ Line: 872 | Upvalues: v5 (ref), v1 (copy), v3 (ref) ]]
			v5:UpdateAsync(v1, function() --[[ Line: 873 ]]
				return 0
			end)
			v3 = 0
		end)
	end
	if not v3 then
		return
	end
	if not v2.Data.ClanRewards.JoinedAt then
		v2.Data.ClanRewards.JoinedAt = v3
	end
	if v3 < v2.Data.ClanRewards.JoinedAt then
		v2.Data.ClanRewards.JoinedAt = v3
	end
	local sum = v3 - v2.Data.ClanRewards.JoinedAt
	if sum < 0 then
		sum = 0
	end
	local count = 0
	for k, v in pairs(Misc.ClanRewards) do
		local Requirement = v.Requirement
		if Requirement <= sum then
			sum = sum - Requirement
			count = count + 1
		end
	end
	return {
		Level = count,
		CurrentLevelXP = sum,
		RequiredXP = if Misc.ClanRewards[count + 1] then Misc.ClanRewards[count + 1].Requirement else 0,
		TotalPoints = v3
	}
end
function t4.ClaimReward(p1, p2) --[[ ClaimReward | Line: 904 | Upvalues: Misc (copy), Manager (copy), t4 (copy), ReplicatedStorage (copy), Clans (copy) ]]
	local v2 = tonumber((string.gsub(p2, "Reward", "")))
	if not (v2 and Misc.ClanRewards[v2]) then
		return
	end
	local v3 = Manager.Profiles[p1]
	if not v3 then
		return
	end
	local v4 = t4.GetRewardStats(p1)
	if not v4 then
		return
	end
	if v4.Level < v2 then
		return
	end
	if not v3.Data.ClanRewards["Points.v15"] then
		v3.Data.ClanRewards["Points.v15"] = {}
	end
	if not v3.Data.ClanRewards["Points.v15"][p2] then
		v3.Data.ClanRewards["Points.v15"][p2] = true
		ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v3.Data)
		ReplicatedStorage.Remotes.PlayerData.GiveRewards:Fire(p1, Misc.ClanRewards[v2].Reward)
		Clans.UpdateRewards:FireClient(p1)
	end
end
if not Players.LocalPlayer then
	task.spawn(function() --[[ Line: 972 | Upvalues: Clans (copy), t (ref), t4 (copy) ]]
		task.wait(10)
		while true do
			Clans.TopClans:FireAllClients("Reset")
			t = {}
			for k, v in pairs((t4.GetTopClans())) do
				t4.GetTopClanStats(v.key, v.value, k)
				task.wait(1)
			end
			task.wait(900)
		end
	end)
	function Clans.GetPointsName.OnServerInvoke() --[[ Line: 988 ]]
		return "Points.v15"
	end
	local t7 = {}
	function Clans.UpdateRewards.GetStats.OnServerInvoke(p1) --[[ Line: 993 | Upvalues: t7 (copy), t4 (copy) ]]
		if t7[p1.Name] then
		else
			t7[p1.Name] = true
			delay(0.5, function() --[[ Line: 996 | Upvalues: t7 (ref), p1 (copy) ]]
				t7[p1.Name] = nil
			end)
			return t4.GetRewardStats(p1)
		end
	end
	local t8 = {}
	Clans.Create.OnServerEvent:Connect(function(p1, p2, p3) --[[ Line: 1006 | Upvalues: t8 (copy), Notify (copy), t2 (copy), ReplicatedStorage (copy), Robux (copy), t4 (copy), Clans (copy) ]]
		if t8[p1.Name] then
			Notify:FireClient(p1, "Please wait before doing this!", Color3.fromRGB(255, 0, 4))
			return
		end
		t8[p1.Name] = true
		task.delay(0.2, function() --[[ Line: 1009 | Upvalues: t8 (ref), p1 (copy) ]]
			t8[p1.Name] = nil
		end)
		if t2[p1.Name] and t2[p1.Name] == p2 then
			if p3 then
				local ClanName = Instance.new("StringValue", p1)
				ClanName.Name = "ClanName"
				ClanName.Value = t2[p1.Name]
				ReplicatedStorage.Remotes.Misc.Prompt:FireClient(p1, Robux.Products.CreateClan)
			else
				t4.Create(p1, p2)
			end
		else
			local v1 = t4.CanCreate(p1, p2)
			if v1 == true then
				t2[p1.Name] = p2
				Clans.Create:FireClient(p1, "Confirm")
				task.delay(3, function() --[[ Line: 1035 | Upvalues: t2 (ref), p1 (copy), Clans (ref) ]]
					t2[p1.Name] = nil
					Clans.Create:FireClient(p1, "NoConfirm")
				end)
			else
				Clans.Create:FireClient(p1, v1)
			end
		end
	end)
	local t9 = {}
	Clans.EditMember.OnServerEvent:Connect(function(p1, p2, p3) --[[ Line: 1043 | Upvalues: t9 (copy), Notify (copy), t4 (copy) ]]
		if t9[p1.Name] then
			Notify:FireClient(p1, "Please wait before doing this!", Color3.fromRGB(255, 0, 4))
			return
		end
		t9[p1.Name] = true
		task.delay(3, function() --[[ Line: 1046 | Upvalues: t9 (ref), p1 (copy) ]]
			t9[p1.Name] = nil
		end)
		if p3 == "Officer" then
			t4.Promote(p1, p2, "Officer")
			return
		end
		if p3 == "Member" then
			t4.Promote(p1, p2, "Member")
			return
		end
		if p3 == "Owner" then
			t4.Promote(p1, p2, "Owner")
			return
		end
		if p3 ~= "Kick" then
			return
		end
		t4.Kick(p1, p2)
	end)
	local t10 = {}
	Clans.Change.OnServerEvent:Connect(function(p1, p2, p3) --[[ Line: 1066 | Upvalues: t10 (copy), Notify (copy), t4 (copy) ]]
		if t10[p1.Name] then
			Notify:FireClient(p1, "Please wait before doing this!", Color3.fromRGB(255, 0, 4))
			return
		end
		t10[p1.Name] = true
		task.delay(3, function() --[[ Line: 1069 | Upvalues: t10 (ref), p1 (copy) ]]
			t10[p1.Name] = nil
		end)
		if p2 == "Bio" then
			t4.ChangeBio(p1, p3)
			return
		end
		if p2 ~= "Icon" then
			return
		end
		t4.ChangeIcon(p1, p3)
	end)
	local t11 = {}
	Clans.Invite.OnServerEvent:Connect(function(p1, p2, p3) --[[ Line: 1086 | Upvalues: t11 (copy), Notify (copy), t4 (copy) ]]
		if t11[p1.Name] then
			Notify:FireClient(p1, "Please wait before doing this!", Color3.fromRGB(255, 0, 4))
			return
		end
		t11[p1.Name] = true
		task.delay(3, function() --[[ Line: 1089 | Upvalues: t11 (ref), p1 (copy) ]]
			t11[p1.Name] = nil
		end)
		if p2 == "Clan" then
			t4.Join(p1, p3)
		else
			t4.Invite(p1, p2)
		end
	end)
	local t12 = {}
	Clans.Delete.OnServerEvent:Connect(function(p1) --[[ Line: 1105 | Upvalues: t12 (copy), Notify (copy), t4 (copy) ]]
		if t12[p1.Name] then
			Notify:FireClient(p1, "Please wait before doing this!", Color3.fromRGB(255, 0, 4))
		else
			t12[p1.Name] = true
			task.delay(3, function() --[[ Line: 1108 | Upvalues: t12 (ref), p1 (copy) ]]
				t12[p1.Name] = nil
			end)
			t4.Delete(p1)
		end
	end)
	ReplicatedStorage.Remotes.Misc.DeleteClan.OnServerEvent:Connect(function(p1, p2) --[[ Line: 1118 | Upvalues: Misc (copy), t12 (copy), Notify (copy), ReplicatedStorage (copy), t4 (copy) ]]
		if not (p1 and p2) then
			return
		end
		if not table.find(Misc.CanDeleteClan, p1.UserId) then
			return
		end
		if t12[p1.Name] then
			Notify:FireClient(p1, "Please wait before doing this!", Color3.fromRGB(255, 0, 4))
		else
			t12[p1.Name] = true
			task.delay(4, function() --[[ Line: 1124 | Upvalues: t12 (ref), p1 (copy) ]]
				t12[p1.Name] = nil
			end)
			ReplicatedStorage.Remotes.Misc.SetModLogs:Fire(p1, nil, nil, (("Deleted clan %*"):format(p2)))
			task.spawn(t4.ForceDelete, p1, p2)
		end
	end)
	ReplicatedStorage.Remotes.Misc.DeleteClanByID.OnServerEvent:Connect(function(p1, p2) --[[ Line: 1136 | Upvalues: Misc (copy), t12 (copy), Notify (copy), t4 (copy) ]]
		if not (p1 and p2) then
			return
		end
		if not table.find(Misc.CanDeleteClan, p1.UserId) then
			return
		end
		if t12[p1.Name] then
			Notify:FireClient(p1, "Please wait before doing this!", Color3.fromRGB(255, 0, 4))
		else
			t12[p1.Name] = true
			task.delay(4, function() --[[ Line: 1142 | Upvalues: t12 (ref), p1 (copy) ]]
				t12[p1.Name] = nil
			end)
			task.spawn(t4.ForceDeleteById, p1, p2)
		end
	end)
	function ReplicatedStorage.Remotes.Misc.GetClanIdByName.OnServerInvoke(p1, p2) --[[ Line: 1151 | Upvalues: Misc (copy), t12 (copy), Notify (copy), t4 (copy) ]]
		if not p1 or (not p2 or (typeof(p2) ~= "string" or #p2 <= 1)) then
			return
		end
		if not (table.find(Misc.CanDeleteClan, p1.UserId) or table.find(Misc.CanGiveClanWins, p1.UserId)) then
			return
		end
		if t12[p1.Name] then
			Notify:FireClient(p1, "Please wait before doing this!", Color3.fromRGB(255, 0, 4))
		else
			t12[p1.Name] = true
			task.delay(2, function() --[[ Line: 1157 | Upvalues: t12 (ref), p1 (copy) ]]
				t12[p1.Name] = nil
			end)
			return t4:Get(p2, "Names")
		end
	end
	local t13 = {}
	Clans.Leave.OnServerEvent:Connect(function(p1) --[[ Line: 1168 | Upvalues: t13 (copy), Notify (copy), t4 (copy) ]]
		if t13[p1.Name] then
			Notify:FireClient(p1, "Please wait before doing this!", Color3.fromRGB(255, 0, 4))
		else
			t13[p1.Name] = true
			task.delay(3, function() --[[ Line: 1171 | Upvalues: t13 (ref), p1 (copy) ]]
				t13[p1.Name] = nil
			end)
			t4.Leave(p1)
		end
	end)
	local t14 = {}
	Clans.ClaimReward.OnServerEvent:Connect(function(p1, p2) --[[ Line: 1183 | Upvalues: t14 (copy), Notify (copy), t4 (copy) ]]
		if t14[p1.Name] then
			Notify:FireClient(p1, "Please wait before doing this!", Color3.fromRGB(255, 0, 4))
		else
			t14[p1.Name] = true
			task.delay(0.5, function() --[[ Line: 1186 | Upvalues: t14 (ref), p1 (copy) ]]
				t14[p1.Name] = nil
			end)
			t4.ClaimReward(p1, p2)
		end
	end)
	local t15 = {}
	ReplicatedStorage.Remotes.Misc.GiveClanWins.OnServerEvent:Connect(function(p1, p2, p3) --[[ Line: 1197 | Upvalues: Misc (copy), t15 (copy), ReplicatedStorage (copy), t4 (copy), v5 (copy) ]]
		if not (table.find(Misc.CanGiveClanWins, p1.UserId) or game:GetService("RunService"):IsStudio()) then
			return
		end
		if not tonumber(p3) then
			return
		end
		local v1 = tonumber(p3)
		if v1 < 0 then
			return
		end
		if t15[p1.Name] then
			ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Please wait a few seconds to do this again.")
			return
		end
		t15[p1.Name] = true
		task.delay(2, function() --[[ Line: 1206 | Upvalues: t15 (ref), p1 (copy) ]]
			t15[p1.Name] = nil
		end)
		local v2 = t4:Get(p2, "Clan")
		if not (p2 and v2) then
			ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Please enter clan id correctly.")
			return
		end
		local v3, v4 = pcall(function() --[[ Line: 1221 | Upvalues: v5 (ref), p2 (copy), v1 (ref) ]]
			v5:UpdateAsync(p2, function() --[[ Line: 1222 | Upvalues: v1 (ref) ]]
				return v1
			end)
		end)
		if v3 and not v4 then
			ReplicatedStorage.Remotes.Misc.SetModLogs:Fire(p1, nil, nil, (("Set clan wins of %* to %*"):format(v2.Name, v1)))
			ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Success.", Color3.fromRGB(70, 255, 101))
		else
			ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, "Failed.")
		end
	end)
	function plrAdded(p1) --[[ plrAdded | Line: 1235 | Upvalues: t4 (copy), Clans (copy), t (ref) ]]
		task.wait(8)
		local v1 = t4.IsInClan(p1)
		if v1 then
			Clans.Update:FireClient(p1, t4.GetClanStats(v1.ID))
		else
			Clans.Update:FireClient(p1, "None")
		end
		Clans.TopClans:FireClient(p1, t)
	end
	function plrLeft() --[[ plrLeft | Line: 1247 | Upvalues: Players (copy), t3 (copy) ]]
		for i, v in ipairs(Players:GetPlayers()) do
			if t3[v.Name] then
				t3[v.Name] = nil
			end
		end
	end
	Players.PlayerAdded:Connect(plrAdded)
	Players.PlayerRemoving:Connect(plrLeft)
	for i, v in ipairs(Players:GetPlayers()) do
		task.spawn(plrAdded, v)
	end
end
return t4