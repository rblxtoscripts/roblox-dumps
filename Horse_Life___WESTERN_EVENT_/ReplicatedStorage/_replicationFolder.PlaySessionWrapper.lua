-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("FormatTime")
local v2 = Sonar("StorageUtils")
local v3 = Sonar("DataUpdateService", "Server")
local v4 = Sonar("InstanceUtils")
local v5 = v2.GetConfig("PlaySession")()
local v6 = game:GetService("RunService"):IsServer()
function t.new(p1) --[[ new | Line: 21 | Upvalues: t (copy), v6 (copy), v1 (copy), v5 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = p1.Maid
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	v2.PlayerData = v2.PlayerWrapper.PlayerData
	if v2.PlayerWrapper:IsLocalOrServer() then
		v2.PlaySessionData = v2.PlayerData:FindFirstChild("PlaySession")
		if not v2.PlaySessionData then
			warn("\226\154\160\239\184\143 PlaySessionWrapper, PlaySession data folder not found under player data", v2.Player.Name)
			return v2
		end
		v2.LeaveTimeValue = v2.PlaySessionData.Leave
		v2.StartTimeValue = v2.PlaySessionData.Start
		v2.FirstJoinTimeValue = v2.PlayerData.Metadata.FirstJoinTime
		if v6 then
			if v2.FirstJoinTimeValue and v2.FirstJoinTimeValue.Value <= 0 then
				v2.FirstJoinTimeValue.Value = v1.GetTime()
			end
			v2.PlayerWrapper:AddOnRemovedCallback(function() --[[ Line: 48 | Upvalues: v2 (copy), v1 (ref) ]]
				v2.LeaveTimeValue.Value = v1.GetTime()
			end)
			v2.ResetPlaySessionOnJoin = v2:GetTimeSinceLastSession() > v5.TimeAfterLeaveToResetSessionStart
			local v4 = v2.ResetPlaySessionOnJoin and v1.GetTime() or v2.StartTimeValue.Value + (v1.GetTime() - v2.LeaveTimeValue.Value)
			v2:SetSessionStart(v4)
		end
	end
	return v2
end
function t.HasResetPlaySessionOnJoin(p1) --[[ HasResetPlaySessionOnJoin | Line: 71 ]]
	return p1.ResetPlaySessionOnJoin
end
function t.SetSessionStart(p1, p2) --[[ SetSessionStart | Line: 78 | Upvalues: v1 (copy) ]]
	p1.StartTimeValue.Value = if p2 then p2 else v1.GetTime()
end
function t.GetSessionStartTime(p1) --[[ GetSessionStartTime | Line: 85 ]]
	return p1.StartTimeValue.Value
end
function t.GetSessionLeaveTime(p1) --[[ GetSessionLeaveTime | Line: 92 ]]
	return p1.LeaveTimeValue.Value
end
function t.GetTimeSinceLastSession(p1) --[[ GetTimeSinceLastSession | Line: 99 | Upvalues: v1 (copy) ]]
	return v1.GetTime() - p1.LeaveTimeValue.Value
end
function t.GetTimeInSession(p1) --[[ GetTimeInSession | Line: 106 | Upvalues: v1 (copy) ]]
	return v1.GetTime() - p1.StartTimeValue.Value
end
function t.GetFirstJoinTime(p1) --[[ GetFirstJoinTime | Line: 113 ]]
	return p1.FirstJoinTimeValue.Value
end
function t.Init(p1) --[[ Init | Line: 117 | Upvalues: v6 (copy), v3 (copy), v4 (copy) ]]
	if not v6 then
		return
	end
	v3.AddRigDataCallback(function(p1) --[[ Line: 119 | Upvalues: v4 (ref) ]]
		if not p1:FindFirstChild("PlaySession") then
			local v1 = v4.Create("Folder", {
				Name = "PlaySession",
				Parent = p1
			})
			v4.Create("IntValue", {
				Name = "Start",
				Parent = v1
			})
			v4.Create("IntValue", {
				Name = "Leave",
				Parent = v1
			})
		end
		local Metadata = p1:FindFirstChild("Metadata")
		if not Metadata then
			Metadata = v4.Create("Folder", {
				Name = "Metadata",
				Parent = p1
			})
		end
		if Metadata:FindFirstChild("FirstJoinTime") then
			return
		end
		v4.Create("IntValue", {
			Name = "FirstJoinTime",
			Parent = Metadata
		})
	end)
end
return t