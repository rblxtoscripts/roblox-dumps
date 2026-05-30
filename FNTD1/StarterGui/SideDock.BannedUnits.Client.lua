-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local RankedBans = game.ReplicatedStorage.Remotes.Misc.RankedBans
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
local Towers = require(game.ReplicatedStorage.Configs.Towers).Towers
local v1 = script.Parent
function update() --[[ update | Line: 10 | Upvalues: Misc (copy), Towers (copy), v1 (copy) ]]
	for k, v in pairs((Misc.GetBanWeek(true))) do
		if Towers[v] then
			local v2 = v1.BG:FindFirstChild(k)
			if v2 then
				v2.Shiny.Visible = false
				v2.TowerPrice.Info.Text = "$ " .. Towers[v].PlacePrice or "$ 0"
				v2.BorderImage.TowerImage.Image = Towers[v].Image or ""
				v2.BorderImage.UIGradient.Color = if Towers[v].Rarity and game.ReplicatedStorage.Gradients:FindFirstChild(Towers[v].Rarity) then game.ReplicatedStorage.Gradients[Towers[v].Rarity].Color else game.ReplicatedStorage.Gradients.Common.Color
			end
		end
	end
end
RankedBans.OnClientEvent:Connect(function() --[[ Line: 27 | Upvalues: v1 (copy), Tween (copy) ]]
	if script.Parent.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not v1.Visible then
		Tween:AddButton("Open", v1)
	end
end)
v1.Info.MouseButton1Click:Connect(function() --[[ Line: 33 | Upvalues: v1 (copy) ]]
	v1.PassiveFrame.Visible = not v1.PassiveFrame.Visible
end)
update()
Tween:AddButton(v1.Exit, v1)
Tween:AddButton(v1.Info)