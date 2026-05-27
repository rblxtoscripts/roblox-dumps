-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local EndlessShop = game.ReplicatedStorage.Remotes.Misc.EndlessShop
local Tween = require(game.ReplicatedStorage.Libs.Tween)
require(game.ReplicatedStorage.Configs.EndlessShop)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local Formatter = require(game.ReplicatedStorage.Libs.Formatter)
local v1 = script.Parent
function init() --[[ init | Line: 11 | Upvalues: v1 (copy), Tween (copy) ]]
	for k, v in pairs(v1.Main:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Units" then
			Tween:AddButton(v)
			Tween:AddButton(v.Buy)
			v.MouseButton1Click:Connect(function() --[[ Line: 16 | Upvalues: v (copy), v1 (ref) ]]
				v1.SelectedSlot.Value = string.gsub(v.Name, "Buy", "")
				v1.Main.ConfirmFrame.Message.Text = "Are you sure you want to buy " .. v.TowerName.Value .. "?"
				v1.Main.ConfirmFrame.Visible = true
			end)
			v.Buy.MouseButton1Click:Connect(function() --[[ Line: 22 | Upvalues: v (copy), v1 (ref) ]]
				v1.SelectedSlot.Value = string.gsub(v.Name, "Buy", "")
				v1.Main.ConfirmFrame.Message.Text = "Are you sure you want to buy " .. v.TowerName.Value .. "?"
				v1.Main.ConfirmFrame.Visible = true
			end)
		end
	end
end
v1.Main.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 31 | Upvalues: EndlessShop (copy), v1 (copy) ]]
	EndlessShop:FireServer(v1.SelectedSlot.Value)
	v1.Main.ConfirmFrame.Visible = false
end)
v1.Main.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 36 | Upvalues: v1 (copy) ]]
	v1.SelectedSlot.Value = ""
	v1.Main.ConfirmFrame.Visible = false
end)
v1:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 41 | Upvalues: v1 (copy) ]]
	if v1.Visible then
		return
	end
	v1.SelectedSlot.Value = ""
	v1.Main.ConfirmFrame.Visible = false
end)
EndlessShop.OnClientEvent:Connect(function() --[[ Line: 48 | Upvalues: v1 (copy), Tween (copy) ]]
	if script.Parent.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not v1.Visible then
		Tween:AddButton("Open", v1)
	end
end)
function update() --[[ update | Line: 54 | Upvalues: ClientState (copy), v1 (copy), Formatter (copy) ]]
	v1.RerollsFrame.TextLabel.Text = Formatter.FormatCompact(ClientState.GetData().Stars3)
end
init()
Tween:AddButton(v1.Exit, v1)
Tween:AddButton(v1.Main.ConfirmFrame.Yes)
Tween:AddButton(v1.Main.ConfirmFrame.No)
game.ReplicatedStorage.Remotes.PlayerData.UpdateData.OnClientEvent:Connect(update)