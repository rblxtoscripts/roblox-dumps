-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PolicyService = game:GetService("PolicyService")
local LocalPlayer = Players.LocalPlayer
local Enchant = ReplicatedStorage.Remotes.Misc.Enchant
local Tween = require(ReplicatedStorage.Libs.Tween)
local Enchants = require(ReplicatedStorage.Modules.Misc.Enchants)
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Towers = require(ReplicatedStorage.Configs.Towers)
local Robux = require(ReplicatedStorage.Configs.Robux)
local Misc = require(ReplicatedStorage.Configs.Misc)
local MainFrame = script.Parent.MainFrame
local Size = MainFrame.Success.Size
local Size_2 = MainFrame.Enchant.Size
local v1 = false
local v2 = false
local t = { "Damage", "Range", "Speed" }
local v3 = 0
function animation(p1) --[[ animation | Line: 26 | Upvalues: v2 (ref), v3 (ref), ReplicatedStorage (copy), MainFrame (copy), TweenService (copy), Size (copy), Enchants (copy), Size_2 (copy) ]]
	if p1 == "StopAuto" then
		v2 = false
		return
	end
	local v1 = tick()
	v3 = v1
	local v22 = if ReplicatedStorage.Objects.Enchants:FindFirstChild(p1) then ReplicatedStorage.Objects.Enchants[p1].UIGradient.Color else ReplicatedStorage.Gradients.Common.Color
	MainFrame.Success.Size = UDim2.new(0, 0, 0, 0)
	MainFrame.Success.Visible = true
	TweenService:Create(MainFrame.Success, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), {
		Size = Size
	}):Play()
	if MainFrame.Enchant:FindFirstChild("Shine") then
		MainFrame.Enchant.Shine:Destroy()
	end
	MainFrame.Enchant.Size = UDim2.new(0, 0, 0, 0)
	MainFrame.Enchant.Text = Enchants.Enchants[p1].Name
	MainFrame.Enchant.UIGradient.Color = v22
	TweenService:Create(MainFrame.Enchant, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), {
		Size = Size_2
	}):Play()
	task.wait(1)
	if v1 == v1 then
		TweenService:Create(MainFrame.Success, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Size = UDim2.new(0, 0, 0, 0)
		}):Play()
	end
end
function update() --[[ update | Line: 58 | Upvalues: ClientState (copy), MainFrame (copy) ]]
	local v1 = ClientState.GetData()
	MainFrame.RerollsFrame.TextLabel.Text = if v1.Items.Souls then v1.Items.Souls else 0
end
MainFrame.RollEnchant.MouseButton1Click:Connect(function() --[[ Line: 63 | Upvalues: v2 (ref), ClientState (copy), MainFrame (copy), Enchants (copy), Enchant (copy) ]]
	if v2 then
		return
	end
	local v1 = ClientState.GetData().Towers[MainFrame.TowerID.Value]
	if (if v1 and (v1.Enchant and #v1.Enchant > 2) and Enchants.Chances[v1.Enchant] then Enchants.Chances[v1.Enchant] else 100) <= 1 then
		MainFrame.ConfirmFrame.Visible = true
	else
		Enchant:FireServer(MainFrame.TowerID.Value)
	end
end)
MainFrame.AutoEnchant.MouseButton1Click:Connect(function() --[[ Line: 79 | Upvalues: v2 (ref), ClientState (copy), MainFrame (copy), Enchants (copy), Enchant (copy) ]]
	v2 = not v2
	if not v2 then
		return
	end
	local v1 = ClientState.GetData()
	local v22 = v1.Towers[MainFrame.TowerID.Value]
	if not v22 then
		return
	end
	if v22 and (v22.Enchant and #v22.Enchant > 2) and Enchants.Chances[v22.Enchant] then
		local _ = Enchants.Chances[v22.Enchant]
	end
	if v1.Towers[MainFrame.TowerID.Value].Enchant and (v1.Towers[MainFrame.TowerID.Value].Enchant ~= "" and not table.find(v1.AutoSkipEnchants, v1.Towers[MainFrame.TowerID.Value].Enchant)) then
		v2 = false
		return
	end
	repeat
		Enchant:FireServer(MainFrame.TowerID.Value, "Auto")
		task.wait(0.35)
		local v3 = ClientState.GetData()
	until not MainFrame.Visible or (MainFrame.TowerID.Value ~= MainFrame.TowerID.Value or not (table.find(v3.AutoSkipEnchants, v3.Towers[MainFrame.TowerID.Value].Enchant) and v2))
	v2 = false
end)
function updateTowerSlot(p1) --[[ updateTowerSlot | Line: 102 | Upvalues: Tween (copy), MainFrame (copy), ClientState (copy), Towers (copy), ReplicatedStorage (copy), Enchants (copy), Misc (copy) ]]
	if p1 == 1 then
		return
	end
	Tween:AddButton("Open", MainFrame)
	local v1 = ClientState.GetData().Towers[p1]
	if not v1 then
		return
	end
	local v2 = Towers.Towers[v1.Name]
	if not v2 then
		return
	end
	MainFrame.TowerID.Value = p1
	local v3 = if v1.Shiny then ReplicatedStorage.Gradients.Shiny.Color elseif ReplicatedStorage.Gradients:FindFirstChild(v2.Rarity) then ReplicatedStorage.Gradients[v2.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
	local v4 = if v1.Enchant and (#v1.Enchant > 2 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v1.Enchant)) then ReplicatedStorage.Objects.Enchants[v1.Enchant].UIGradient.Color else ReplicatedStorage.Gradients.Common.Color
	MainFrame.TowerSlot.BorderImage.TowerImage.Visible = true
	MainFrame.TowerSlot.BorderImage.Plus.Visible = false
	MainFrame.TowerSlot.BorderImage.TowerImage.Image = v2.Image or ""
	MainFrame.TowerName.Text = v1.Name
	MainFrame.Enchant.Text = if v1.Enchant and #v1.Enchant > 2 then Enchants.Enchants[v1.Enchant].Name else "None"
	MainFrame.Enchant.UIGradient.Color = v4
	if MainFrame.Enchant:FindFirstChild("Shine") then
		MainFrame.Enchant.Shine:Destroy()
	end
	if not table.find(Misc.EnchantShines, v1.Enchant) then
		MainFrame.TowerSlot.BorderImage.UIGradient.Color = v3
		MainFrame.TowerSlot.Frame.UIGradient.Color = v3
		MainFrame.TowerSlot.BorderImage.UIGradient.Enabled = true
		MainFrame.TowerSlot.Frame.UIGradient.Enabled = true
		return
	end
	local v6 = script.Parent.Parent.Effects.Shine:Clone()
	v6.Parent = MainFrame.Enchant
	script.Parent.Parent.Effects.Event:Fire(v6)
	MainFrame.TowerSlot.BorderImage.UIGradient.Color = v3
	MainFrame.TowerSlot.Frame.UIGradient.Color = v3
	MainFrame.TowerSlot.BorderImage.UIGradient.Enabled = true
	MainFrame.TowerSlot.Frame.UIGradient.Enabled = true
end
MainFrame.TowerSlot.MouseButton1Click:Connect(function() --[[ Line: 140 | Upvalues: Enchant (copy), LocalPlayer (copy) ]]
	Enchant.Bindable:Fire(1)
	if LocalPlayer:FindFirstChild("EnchantTower") then
		return
	end
	local EnchantTower = Instance.new("StringValue")
	EnchantTower.Name = "EnchantTower"
	EnchantTower.Parent = LocalPlayer
end)
function initChances() --[[ initChances | Line: 149 | Upvalues: MainFrame (copy), Tween (copy), ClientState (copy), v1 (ref) ]]
	for k, v in pairs(MainFrame.ChancesScroll:GetChildren()) do
		if v:IsA("ImageButton") then
			Tween:AddButton(v)
			v.MouseButton1Click:Connect(function() --[[ Line: 154 | Upvalues: ClientState (ref), v1 (ref), v (copy), MainFrame (ref) ]]
				local v12 = ClientState.GetData()
				if not v1 then
					MainFrame.SelectedChance.Value = v.Name
					return
				end
				if table.find(v12.AutoSkipEnchants, v.Name) or table.find(v12.AutoSkipEnchants, v.Name .. 1) then
					game.ReplicatedStorage.Remotes.Misc.AutoSkipEnchant:FireServer(v.Name, false)
				else
					game.ReplicatedStorage.Remotes.Misc.AutoSkipEnchant:FireServer(v.Name, true)
				end
			end)
		end
	end
end
MainFrame.SelectedChance.Changed:Connect(function() --[[ Line: 169 | Upvalues: Enchants (copy), MainFrame (copy), t (copy) ]]
	local v1 = Enchants.Enchants[MainFrame.SelectedChance.Value]
	if not (v1 or table.find(t, MainFrame.SelectedChance.Value)) then
		MainFrame.ChancesFrame.Visible = false
		return
	end
	MainFrame.ChancesFrame.Visible = true
	if not table.find(t, MainFrame.SelectedChance.Value) then
		MainFrame.ChancesFrame.Single.Visible = true
		MainFrame.ChancesFrame.Multi.Visible = false
		MainFrame.ChancesFrame.Single.EnchantName.Text = v1.Name
		MainFrame.ChancesFrame.Single.Description.Text = v1.String
		MainFrame.ChancesFrame.Single.Visible = true
		return
	end
	for i = 1, 3 do
		local v2 = Enchants.Enchants[MainFrame.SelectedChance.Value .. i]
		MainFrame.ChancesFrame.Single.Visible = false
		MainFrame.ChancesFrame.Multi.Visible = true
		MainFrame.ChancesFrame.Multi.EnchantName.Text = MainFrame.SelectedChance.Value
		MainFrame.ChancesFrame.Multi["Description" .. i].Text = v2.Name .. ": " .. v2.String
	end
end)
MainFrame.ChancesFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 193 | Upvalues: MainFrame (copy) ]]
	MainFrame.SelectedChance.Value = ""
end)
MainFrame.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 197 | Upvalues: MainFrame (copy) ]]
	MainFrame.ConfirmFrame.Visible = false
end)
local v4 = false
MainFrame.ConfirmFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 202 | Upvalues: v4 (ref) ]]
	v4 = true
	task.wait(0.8)
	v4 = false
end)
MainFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 208 | Upvalues: MainFrame (copy), Enchant (copy) ]]
	if MainFrame.Visible then
		return
	end
	Enchant:FireServer(MainFrame.TowerID.Value, "Left")
end)
MainFrame.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 214 | Upvalues: v4 (ref), MainFrame (copy), Enchant (copy) ]]
	if v4 then
		return
	end
	MainFrame.ConfirmFrame.Visible = false
	Enchant:FireServer(MainFrame.TowerID.Value, "RareEnchant")
end)
ReplicatedStorage.Remotes.Misc.EnchantTouch.OnClientEvent:Connect(function() --[[ Line: 221 | Upvalues: MainFrame (copy), Tween (copy) ]]
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not MainFrame.Visible then
		Tween:AddButton("Open", MainFrame)
	end
end)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 227 | Upvalues: Towers (copy) ]]
	if not p1 then
		return
	end
	if pcall(function() --[[ Line: 229 | Upvalues: p1 (ref), Towers (ref) ]]
		p1 = game:GetService("HttpService"):JSONDecode(p1)
		if p1 then
			Towers.Towers = p1
			return
		end
		error(0)
	end) then
		return
	end
	warn("Failed to update Client MetaData.")
end)
function initBuy() --[[ initBuy | Line: 242 | Upvalues: MainFrame (copy), Robux (copy), Tween (copy), PolicyService (copy), LocalPlayer (copy), MarketplaceService (copy) ]]
	for k, v in pairs(MainFrame.BuyTokens:GetChildren()) do
		if Robux.Products[v.Name] then
			Tween:AddButton(v, nil, nil, nil, true)
			v.MouseButton1Click:Connect(function() --[[ Line: 246 | Upvalues: PolicyService (ref), LocalPlayer (ref), MarketplaceService (ref), Robux (ref), v (copy) ]]
				local v1, v2 = pcall(function() --[[ Line: 248 | Upvalues: PolicyService (ref), LocalPlayer (ref) ]]
					return PolicyService:GetPolicyInfoForPlayerAsync(LocalPlayer)
				end)
				if not v1 then
					warn("PolicyService error: " .. v2)
					return
				end
				if v2.ArePaidRandomItemsRestricted then
					game.ReplicatedStorage.Remotes.Misc.Alert.Bindable:Fire("Your region doesn\'t allow you to buy this!")
				else
					MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products[v.Name])
				end
			end)
			pcall(function() --[[ Line: 261 | Upvalues: v (copy), MarketplaceService (ref), Robux (ref) ]]
				v.Robux.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products[v.Name], Enum.InfoType.Product).PriceInRobux)
			end)
		end
	end
end
function updateAutoSkip() --[[ updateAutoSkip | Line: 269 | Upvalues: ClientState (copy), MainFrame (copy), t (copy) ]]
	local v1 = ClientState.GetData()
	for k, v in pairs(MainFrame.ChancesScroll:GetChildren()) do
		local v2
		if v:IsA("ImageButton") then
			v2 = if table.find(t, v.Name) and table.find(v1.AutoSkipEnchants, v.Name .. 1) then true else not table.find(t, v.Name) and table.find(v1.AutoSkipEnchants, v.Name)
			if v2 then
				v.AutoDelete.Visible = true
				continue
			end
			v.AutoDelete.Visible = false
		end
	end
end
MainFrame.AutoSkip.MouseButton1Click:Connect(function() --[[ Line: 282 | Upvalues: v1 (ref), MainFrame (copy) ]]
	v1 = not v1
	if v1 then
		MainFrame.AutoSkip.TextLabel.Text = "CLICK TO FINISH"
	else
		MainFrame.AutoSkip.TextLabel.Text = "AUTO ENCHANT SETTINGS"
	end
end)
updateAutoSkip()
Tween:AddButton(MainFrame.TowerSlot)
Tween:AddButton(MainFrame.Exit, MainFrame)
Tween:AddButton(MainFrame.RollEnchant)
Tween:AddButton(MainFrame.ChancesFrame.Exit)
Tween:AddButton(MainFrame.ConfirmFrame.Yes)
Tween:AddButton(MainFrame.ConfirmFrame.No)
Tween:AddButton(MainFrame.AutoSkip)
Tween:AddButton(MainFrame.AutoEnchant)
ReplicatedStorage.Remotes.PlayerData.UpdateData.OnClientEvent:Connect(update)
ReplicatedStorage.Remotes.Misc.AutoSkipEnchant.OnClientEvent:Connect(updateAutoSkip)
Enchant.OnClientEvent:Connect(animation)
Enchant.Bindable.Event:Connect(updateTowerSlot)
initChances()
initBuy()