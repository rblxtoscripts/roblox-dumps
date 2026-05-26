-- https://lua.expert/
local RBXSystem = game:GetService("TextChatService"):WaitForChild("TextChannels"):WaitForChild("RBXSystem")
local ProcessServerMessage = game.ReplicatedStorage.Remotes.Chat.ProcessServerMessage
local v1 = Color3.fromRGB(255, 255, 255)
ProcessServerMessage.OnClientEvent:Connect(function(p1, p2) --[[ Line: 20 | Upvalues: v1 (copy), RBXSystem (copy) ]]
	if not p2 then
		p2 = v1
	end
	RBXSystem:DisplaySystemMessage(string.format("<font color=\"rgb(%s, %s, %s)\">%s</font>", math.floor(p2.R * 255), math.floor(p2.G * 255), math.floor(p2.B * 255), p1))
end)