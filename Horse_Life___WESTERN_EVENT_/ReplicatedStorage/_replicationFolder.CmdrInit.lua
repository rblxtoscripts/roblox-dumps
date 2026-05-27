-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("NotificationsClient")
v3.GetRemoteEvent("BroadcastMessageNotificationRemote").OnClientEvent:Connect(function(p1) --[[ Line: 12 | Upvalues: v4 (copy) ]]
	v4.Notify({
		Type = "BroadcastMessageNotificationRemote",
		Preset = "Admin",
		Message = p1,
		TextColor = Color3.new(1, 0, 0.917647)
	})
end)
if v1.CanRunCommand(v2.GetClient()) then
	require(ReplicatedStorage:WaitForChild("CmdrClient")):SetActivationKeys({ Enum.KeyCode.Semicolon })
else
	ReplicatedStorage:WaitForChild("CmdrClient"):Destroy()
end
return {}