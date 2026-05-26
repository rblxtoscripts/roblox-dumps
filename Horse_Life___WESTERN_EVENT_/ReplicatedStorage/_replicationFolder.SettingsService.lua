-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("FriendsService")
local v4 = game:GetService("RunService"):IsServer()
local RequestSettings = Sonar("Constants").RequestSettings
local t2 = { "CoRide", "Trade", "JoustingRequests" }
local LocalPlayer = game:GetService("Players").LocalPlayer
local t3 = {
	NoOne = function() --[[ NoOne | Line: 28 ]]
		return "NotSettingEveryone"
	end,
	Friends = function(p1, p2) --[[ Friends | Line: 32 | Upvalues: v4 (copy), v3 (copy) ]]
		if v4 then
			if v3:IsFriendsWith(p1, p2) then
				return true
			end
		elseif v3:IsFriendsWith(p2) then
			return true
		end
		return "NotSettingFriends"
	end,
	Everyone = function() --[[ Everyone | Line: 46 ]]
		return true
	end
}
function t.SetSettingValue(p1, p2, p3) --[[ SetSettingValue | Line: 51 ]]
	local v1 = p1.PlayerData.Settings:FindFirstChild(p2, true)
	if v1 then
		v1.Value = p3
	end
end
function t.GetSetting(p1, p2) --[[ GetSetting | Line: 58 | Upvalues: t (copy) ]]
	local v1 = t.GetSettingValue(p1, p2)
	if v1 then
		return v1.Value
	else
		warn("Setting value could not be found for", p1.Player, p2)
	end
end
function t.GetSettingValue(p1, p2) --[[ GetSettingValue | Line: 67 | Upvalues: LocalPlayer (copy), v4 (copy) ]]
	if p1.Player == LocalPlayer or v4 then
		return p1.PlayerData.Settings:FindFirstChild(p2, true)
	else
		return p1.SettingsFolder:FindFirstChild(p2)
	end
end
function t.GetSettingChangedSignal(p1, p2) --[[ GetSettingChangedSignal | Line: 75 | Upvalues: t (copy) ]]
	local v1 = t.GetSettingValue(p1, p2)
	if v1 then
		return v1.Changed
	end
end
function t.GetRequestStatusForPlayer(p1, p2, p3) --[[ GetRequestStatusForPlayer | Line: 82 | Upvalues: t (copy), t3 (copy), v4 (copy), LocalPlayer (copy) ]]
	local v1 = t.GetSetting(p2, p3)
	if v1 == nil then
		return
	end
	local t2 = {}
	t2[1] = v4 and p1.Player or LocalPlayer
	t2[2] = p2.Player
	return t3[v1](table.unpack(t2))
end
function t.CanPlayerBeRequested(p1, p2, p3) --[[ CanPlayerBeRequested | Line: 90 | Upvalues: t (copy) ]]
	return t.GetRequestStatusForPlayer(p1, p2, p3) == true
end
function t.Init(p1) --[[ Init | Line: 96 | Upvalues: v4 (copy), RequestSettings (copy), t (copy), v1 (copy), v2 (copy), t2 (copy) ]]
	if v4 then
		local t3 = {
			Permissions = function(p1, p2) --[[ Permissions | Line: 100 | Upvalues: RequestSettings (ref), t (ref) ]]
				if table.find(RequestSettings, p2[2]) then
					t.SetSettingValue(p1, p2[1], p2[2])
				end
			end,
			States = function(p1, p2) --[[ States | Line: 104 | Upvalues: t (ref) ]]
				if t.GetSettingValue(p1, p2[1]):IsA("BoolValue") then
					p2[2] = p2[2] and true or false
				end
				t.SetSettingValue(p1, p2[1], p2[2])
			end,
			Volume = function(p1, p2) --[[ Volume | Line: 113 ]]
				local v2 = p1.PlayerData.Settings.Volume[p2[1]]
				v2.Volume.Value = p2[2]
				v2.Value = p2[3]
			end
		}
		v1.GetRemoteEvent("ChangeSettingsRemote").OnServerEvent:Connect(function(p1, p2, ...) --[[ Line: 121 | Upvalues: v2 (ref), t3 (copy) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v22 = t3[p2]
			if v22 then
				v22(v1, ...)
			end
		end)
		v2.bindToPlayers(function(p1) --[[ Line: 130 | Upvalues: v2 (ref), t2 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			for k, v in pairs(t2) do
				local v22 = v1.PlayerData.Settings:FindFirstChild(v, true)
				if v22 then
					local v3 = v22:Clone()
					v1.Maid:GiveTask(v22:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 139 | Upvalues: v3 (copy), v22 (copy) ]]
						v3.Value = v22.Value
					end))
					v3.Parent = v1.SettingsFolder
				end
			end
		end)
	end
end
t:Init()
return t