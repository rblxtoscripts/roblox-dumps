-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local MarketplaceTeleport = game.ReplicatedStorage.Remotes.Misc.MarketplaceTeleport
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local v1 = script.Parent
v1.Normal.MouseButton1Click:Connect(function() --[[ Line: 8 | Upvalues: MarketplaceTeleport (copy) ]]
	MarketplaceTeleport:FireServer("Normal")
end)
v1.Pro.MouseButton1Click:Connect(function() --[[ Line: 11 | Upvalues: MarketplaceTeleport (copy) ]]
	MarketplaceTeleport:FireServer("Pro")
end)
v1.Player.MouseButton1Click:Connect(function() --[[ Line: 14 | Upvalues: v1 (copy), MarketplaceTeleport (copy) ]]
	MarketplaceTeleport:FireServer("Player", v1.Search.TextBox.Text)
end)
MarketplaceTeleport.OnClientEvent:Connect(function() --[[ Line: 19 | Upvalues: v1 (copy), Tween (copy) ]]
	if v1.Visible then
		return
	end
	Tween:AddButton("Open", v1)
end)
Tween:AddButton(v1.Normal)
Tween:AddButton(v1.Pro)
Tween:AddButton(v1.Player)
Tween:AddButton(v1.Exit, v1)