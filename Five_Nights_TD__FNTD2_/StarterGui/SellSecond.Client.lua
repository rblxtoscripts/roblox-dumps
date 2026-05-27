-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game.Players.LocalPlayer
local Sell = ReplicatedStorage.Remotes.Quests.Client.Sell
local CommitData = ReplicatedStorage.Remotes.CommitData
local Tween = require(ReplicatedStorage.Libs.Tween)
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Towers = require(ReplicatedStorage.Configs.Towers)
require(ReplicatedStorage.Configs.Misc)
local Items = require(ReplicatedStorage.Configs.Items)
local MainFrame = script.Parent.MainFrame
local TowerSlot = MainFrame.SellUnits.Example.ScrollingFrame.TowerSlot
ReplicatedStorage.Remotes.Quests.Client.Sell.OnClientEvent:Connect(function() --[[ Line: 16 | Upvalues: MainFrame (copy), Tween (copy) ]]
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not MainFrame.Visible then
		Tween:AddButton("Open", MainFrame)
	end
end)
function updatePoints() --[[ updatePoints | Line: 22 | Upvalues: ClientState (copy), MainFrame (copy) ]]
	MainFrame.Milestones.EARNED.TextLabel.Text = ClientState.GetData().FNTD2Points
end
MainFrame.SellButton.MouseButton1Click:Connect(function() --[[ Line: 28 | Upvalues: MainFrame (copy) ]]
	MainFrame.SellUnits.Visible = true
	MainFrame.Milestones.Visible = false
end)
MainFrame.MilestonesButton.MouseButton1Click:Connect(function() --[[ Line: 33 | Upvalues: MainFrame (copy) ]]
	MainFrame.SellUnits.Visible = false
	MainFrame.Milestones.Visible = true
end)
MainFrame.TransferButton.MouseButton1Click:Connect(function() --[[ Line: 38 | Upvalues: CommitData (copy) ]]
	CommitData:FireServer()
end)
function updateTowerSlot(p1) --[[ updateTowerSlot | Line: 42 | Upvalues: Tween (copy), MainFrame (copy), TowerSlot (copy), ClientState (copy), Towers (copy), ReplicatedStorage (copy), Items (copy) ]]
	if p1 == 1 then
		return
	end
	Tween:AddButton("Open", MainFrame)
	if p1 == "Empty" then
		TowerSlot.BorderImage.TowerImage.Visible = false
		TowerSlot.BorderImage.UIGradient.Enabled = false
		TowerSlot.Frame.UIGradient.Enabled = false
		TowerSlot.BorderImage.Plus.Visible = true
		TowerSlot.BorderImage.Add.Visible = true
		return
	end
	local v1 = ClientState.GetData()
	local v2 = v1.Towers[p1]
	if v2 then
		local v3 = Towers.Towers[v2.Name]
		if not v3 then
			return
		end
		MainFrame.TowerID.Value = p1
		local v4 = if v2.Shiny then ReplicatedStorage.Gradients.Shiny.Color elseif ReplicatedStorage.Gradients:FindFirstChild(v3.Rarity) then ReplicatedStorage.Gradients[v3.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
		if v2.Enchant and (#v2.Enchant > 2 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v2.Enchant)) then
			local Color = ReplicatedStorage.Objects.Enchants[v2.Enchant].UIGradient.Color
		else
			local Color = ReplicatedStorage.Gradients.Common.Color
		end
		TowerSlot.BorderImage.TowerImage.Visible = true
		TowerSlot.BorderImage.Plus.Visible = false
		TowerSlot.BorderImage.Add.Visible = false
		TowerSlot.BorderImage.TowerImage.Image = v3.Image or ""
		TowerSlot.BorderImage.UIGradient.Color = v4
		TowerSlot.Frame.UIGradient.Color = v4
	else
		if not v1.Items[p1] then
			return
		end
		local v5 = Items[p1]
		if not v5 then
			return
		end
		MainFrame.TowerID.Value = p1
		local v6 = if ReplicatedStorage.Gradients:FindFirstChild(v5.Rarity) then ReplicatedStorage.Gradients[v5.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
		TowerSlot.BorderImage.TowerImage.Visible = true
		TowerSlot.BorderImage.Plus.Visible = false
		TowerSlot.BorderImage.Add.Visible = false
		TowerSlot.BorderImage.TowerImage.Image = v5.Image or ""
		TowerSlot.BorderImage.UIGradient.Color = v6
		TowerSlot.Frame.UIGradient.Color = v6
	end
	TowerSlot.BorderImage.UIGradient.Enabled = true
	TowerSlot.Frame.UIGradient.Enabled = true
end
TowerSlot.MouseButton1Click:Connect(function() --[[ Line: 102 | Upvalues: Sell (copy), LocalPlayer (copy) ]]
	Sell.Bindable:Fire(1)
	if LocalPlayer:FindFirstChild("Sell2Tower") then
		return
	end
	local Sell2Tower = Instance.new("StringValue")
	Sell2Tower.Name = "Sell2Tower"
	Sell2Tower.Parent = LocalPlayer
end)
MainFrame.SellUnits.Sell.MouseButton1Click:Connect(function() --[[ Line: 111 | Upvalues: Sell (copy), MainFrame (copy) ]]
	updateTowerSlot("Empty")
	Sell:FireServer(MainFrame.TowerID.Value)
end)
Tween:AddButton(MainFrame.Exit, MainFrame)
Tween:AddButton(MainFrame.SellButton)
Tween:AddButton(MainFrame.MilestonesButton)
Tween:AddButton(TowerSlot, nil, nil, nil, true)
Tween:AddButton(MainFrame.SellUnits.Sell)
Tween:AddButton(MainFrame.TransferButton)
updatePoints()
game.ReplicatedStorage.Remotes.PlayerData.UpdateData.OnClientEvent:Connect(updatePoints)
Sell.Bindable.Event:Connect(updateTowerSlot)