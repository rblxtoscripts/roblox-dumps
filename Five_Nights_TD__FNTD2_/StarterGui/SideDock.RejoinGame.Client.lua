-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local RejoinGame = game.ReplicatedStorage.Remotes.Misc.RejoinGame
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local v1 = script.Parent
RejoinGame.OnClientEvent:Connect(function() --[[ Line: 8 | Upvalues: Tween (copy), v1 (copy) ]]
	Tween:AddButton("Open", v1)
end)
v1.Yes.MouseButton1Click:Connect(function() --[[ Line: 12 | Upvalues: RejoinGame (copy) ]]
	RejoinGame:FireServer(true)
end)
v1.No.MouseButton1Click:Connect(function() --[[ Line: 15 | Upvalues: RejoinGame (copy) ]]
	RejoinGame:FireServer(false)
end)
Tween:AddButton(v1.Yes, v1)
Tween:AddButton(v1.No, v1)