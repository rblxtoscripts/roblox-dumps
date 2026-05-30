-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local BossRaidShop = game.ReplicatedStorage.Remotes.Misc.BossRaidShop
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local Formatter = require(game.ReplicatedStorage.Libs.Formatter)
local v1 = script.Parent
function init() --[[ init | Line: 10 | Upvalues: v1 (copy), Tween (copy) ]]
	for k, v in pairs(v1.Main:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Units" then
			Tween:AddButton(v)
			Tween:AddButton(v.Buy)
			v.MouseButton1Click:Connect(function() --[[ Line: 15 | Upvalues: v (copy), v1 (ref) ]]
				v1.SelectedSlot.Value = string.gsub(v.Name, "Buy", "")
				v1.Main.ConfirmFrame.Message.Text = "Are you sure you want to buy " .. v.TowerName.Value .. "?"
				v1.Main.ConfirmFrame.Visible = true
			end)
			v.Buy.MouseButton1Click:Connect(function() --[[ Line: 21 | Upvalues: v (copy), v1 (ref) ]]
				v1.SelectedSlot.Value = string.gsub(v.Name, "Buy", "")
				v1.Main.ConfirmFrame.Message.Text = "Are you sure you want to buy " .. v.TowerName.Value .. "?"
				v1.Main.ConfirmFrame.Visible = true
			end)
		end
	end
end
v1.Main.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 30 | Upvalues: BossRaidShop (copy), v1 (copy) ]]
	BossRaidShop:FireServer(v1.SelectedSlot.Value)
	v1.Main.ConfirmFrame.Visible = false
end)
v1.Main.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 35 | Upvalues: v1 (copy) ]]
	v1.SelectedSlot.Value = ""
	v1.Main.ConfirmFrame.Visible = false
end)
v1:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 40 | Upvalues: v1 (copy) ]]
	if v1.Visible then
		return
	end
	v1.SelectedSlot.Value = ""
	v1.Main.ConfirmFrame.Visible = false
end)
BossRaidShop.OnClientEvent:Connect(function() --[[ Line: 47 | Upvalues: v1 (copy), Tween (copy) ]]
	if script.Parent.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not v1.Visible then
		Tween:AddButton("Open", v1)
	end
end)
function update() --[[ update | Line: 53 | Upvalues: ClientState (copy), v1 (copy), Formatter (copy) ]]
	v1.RerollsFrame.TextLabel.Text = Formatter.FormatCompact(ClientState.GetData()["Death Tokens"])
end
init()
Tween:AddButton(v1.Exit, v1)
Tween:AddButton(v1.Main.ConfirmFrame.Yes)
Tween:AddButton(v1.Main.ConfirmFrame.No)
game.ReplicatedStorage.Remotes.PlayerData.UpdateData.OnClientEvent:Connect(update)