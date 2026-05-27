-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ChatService")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("MessagingService")
local v4 = Sonar("PlaceTypeService")
local v5 = if RunService:IsStudio() then "STUDIO_BROADCAST" elseif v4.IsTestGame() then "TEST_BROADCAST" else "LIVE_BROADCAST"
local v6 = v2.GetRemoteEvent("BroadcastMessageNotificationRemote")
local function messageReceived(p1) --[[ messageReceived | Line: 21 | Upvalues: v6 (copy) ]]
	v6:FireAllClients(p1.Message)
end
v3.Subscribe(v5, messageReceived)
v1:RegisterChatCallback("Broadcast", messageReceived)
return function(p1, p2) --[[ Line: 30 | Upvalues: v1 (copy) ]]
	v1:BroadcastGlobalMessage(p2, "Server", "Broadcast")
	return "Broadcast Sent"
end