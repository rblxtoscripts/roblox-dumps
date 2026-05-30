-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer
local GetShop = ReplicatedStorage.Remotes.Misc.GetShop
local TowerShop = ReplicatedStorage.Remotes.Misc.TowerShop
local Tween = require(ReplicatedStorage.Libs.Tween)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local Shop = require(ReplicatedStorage.Configs.Shop)
local Towers = require(ReplicatedStorage.Configs.Towers)
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Salvaging = require(ReplicatedStorage.Configs.Salvaging)
local Items = require(ReplicatedStorage.Configs.Items)
local Robux = require(ReplicatedStorage.Configs.Robux)
local Presents = require(ReplicatedStorage.Configs.Presents)
local v1 = script.Parent
local Main = v1.Main
local Salvage = v1.Salvage
local v2 = true
local v3 = nil
local v4 = 0
ReplicatedStorage.Remotes.Misc.ShinyHunter.Event:Connect(function(p1) --[[ Line: 28 | Upvalues: v1 (copy) ]]
	if p1 then
		v1.ShinyHunter.Header.Text = "Shiny Hunter (OWNED)"
	else
		v1.ShinyHunter.Header.Text = "Shiny Hunter"
	end
end)
function init() --[[ init | Line: 36 | Upvalues: Main (copy), Salvage (copy), Tween (copy), v1 (copy), Salvaging (copy), Items (copy), Presents (copy), ReplicatedStorage (copy), v3 (ref) ]]
	Main.Visible = true
	Salvage.Visible = false
	for k, v in pairs(Main:GetChildren()) do
		if v:IsA("ImageButton") and string.find(v.Name, "Buy") then
			Tween:AddButton(v.Buy)
			v.Buy.MouseButton1Click:Connect(function() --[[ Line: 44 | Upvalues: v (copy), v1 (ref), Main (ref) ]]
				if v.Locked.Visible then
					return
				end
				v1.SelectedSlot.Value = string.gsub(v.Name, "Buy", "")
				Main.ConfirmFrame.Message.Text = "Are you sure you want to buy 1 " .. v.TowerName.Value .. "?"
				Main.ConfirmFrame.Visible = true
			end)
			Tween:AddButton(v)
			v.MouseButton1Click:Connect(function() --[[ Line: 53 | Upvalues: v (copy), v1 (ref), Main (ref) ]]
				if v.Locked.Visible then
					return
				end
				v1.SelectedSlot.Value = string.gsub(v.Name, "Buy", "")
				Main.ConfirmFrame.Message.Text = "Are you sure you want to buy 1 " .. v.TowerName.Value .. "?"
				Main.ConfirmFrame.Visible = true
			end)
		end
	end
	for k, v in pairs(Salvaging) do
		local v12 = Items[k] or Presents.Presents[k]
		if v12 then
			local v2 = if ReplicatedStorage.Gradients:FindFirstChild(v12.Rarity) then ReplicatedStorage.Gradients[v12.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
			local v32 = Salvage.Items.Example:Clone()
			v32.Name = k
			v32.BorderImage.TowerImage.Image = if v12.Image then v12.Image else ""
			v32.Price.Info.Text = v.Souls
			v32.BorderImage.UIGradient.Color = v2
			v32.Frame.UIGradient.Color = v2
			v32.Visible = true
			v32.LayoutOrder = v.Order
			v32.Parent = Salvage.Items
			Tween:AddButton(v32.Price)
			Tween:AddButton(v32, nil, nil, nil, true)
			local function clicked() --[[ clicked | Line: 82 | Upvalues: v3 (ref), k (copy), Salvage (ref) ]]
				v3 = k
				Salvage.DeleteFrame.Enter.TextBox.Text = "1"
				Salvage.DeleteFrame.Visible = true
			end
			v32.Price.MouseButton1Click:Connect(clicked)
			v32.MouseButton1Click:Connect(clicked)
			continue
		end
		warn("Item not found : ", k)
	end
end
function update() --[[ update | Line: 93 | Upvalues: GetShop (copy), ClientState (copy), Main (copy), Towers (copy), Presents (copy), Items (copy), ReplicatedStorage (copy), Formatter (copy), Shop (copy) ]]
	local v1 = GetShop:InvokeServer()
	if not v1 then
		task.wait(3)
		update()
		return
	end
	local v2 = ClientState.GetData()
	for k, v in pairs(v1) do
		local v3
		if k ~= 4 then
			local v4 = Main:FindFirstChild("Buy" .. k)
			if v4 then
				local v5 = Towers.Towers[v.Name] or (Presents.Presents[v.Name] or Items[v.Name])
				if not v5 then
					return
				end
				local v6 = if ReplicatedStorage.Gradients:FindFirstChild(v5.Rarity) then ReplicatedStorage.Gradients[v5.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
				v4.Buy.Info.Text = "$ " .. Formatter.FormatCompact(v.Cost or Shop.Prices[v.Rarity])
				v4.BorderImage.TowerImage.Image = v5.Image or ""
				v4.BorderImage.UIGradient.Color = v6
				v4.Frame.UIGradient.Color = v6
				v4.TowerName.Value = v.Name
				v3 = v2.TowerMerchant.Hour and (v2.TowerMerchant.Hour == ReplicatedStorage.Remotes.Misc.GetHour:InvokeServer() and (v2.TowerMerchant["Slot" .. k] and (v.Stock or 3) <= v2.TowerMerchant["Slot" .. k])) and true or false
				v4.Locked.Visible = v3
			end
		end
	end
	if v2.TowerMerchant.Hour and (v2.TowerMerchant.Hour == ReplicatedStorage.Remotes.Misc.GetHour:InvokeServer() and (v2.TowerMerchant.Slot4 and v2.TowerMerchant.Slot4 >= 3)) then
		Main.Buy4.Locked.Visible = true
	else
		Main.Buy4.Locked.Visible = false
	end
	if not v1[4] then
		Main.Buy4.CantGet.Visible = true
		Main.Buy4.Buy.Info.Text = "???"
		return
	end
	local v10 = Towers.Towers[v1[4].Name]
	Main.Buy4.CantGet.Visible = false
	Main.Buy4.BorderImage.TowerImage.Image = v10.Image or ""
	Main.Buy4.Buy.Info.Text = ("$%*"):format(({
		["Circuit Breaker Freddy"] = 100000,
		["Cyber Police Roxy"] = 75000,
		["Flipside Freddy"] = 300000
	})[v1[4].Name])
	Main.Buy4.TowerName.Value = v1[4].Name
	local v11 = if ReplicatedStorage.Gradients:FindFirstChild(v10.Rarity) then ReplicatedStorage.Gradients[v10.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
	Main.Buy4.BorderImage.UIGradient.Color = v11
	Main.Buy4.Frame.UIGradient.Color = v11
end
function updateMainButton() --[[ updateMainButton | Line: 141 | Upvalues: v2 (ref), v1 (copy) ]]
	if v2 then
		v1.MainButton.Regular.Enabled = false
		v1.MainButton.Salvage.Enabled = true
		v1.MainButton.TextLabel.Regular.Enabled = false
		v1.MainButton.TextLabel.Salvage.Enabled = true
		v1.MainButton.TextLabel.Text = "Salvage"
	else
		v1.MainButton.Regular.Enabled = true
		v1.MainButton.Salvage.Enabled = false
		v1.MainButton.TextLabel.Regular.Enabled = true
		v1.MainButton.TextLabel.Salvage.Enabled = false
		v1.MainButton.TextLabel.Text = "Merchant"
	end
end
Main.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 157 | Upvalues: TowerShop (copy), v1 (copy), Main (copy) ]]
	TowerShop:FireServer(v1.SelectedSlot.Value)
	Main.ConfirmFrame.Visible = false
end)
Main.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 162 | Upvalues: v1 (copy), Main (copy) ]]
	v1.SelectedSlot.Value = ""
	Main.ConfirmFrame.Visible = false
end)
v1:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 167 | Upvalues: v1 (copy), Main (copy) ]]
	if v1.Visible then
		return
	end
	v1.SelectedSlot.Value = ""
	Main.ConfirmFrame.Visible = false
end)
ReplicatedStorage.Remotes.Misc.MerchantTouch.OnClientEvent:Connect(function() --[[ Line: 174 | Upvalues: v1 (copy), Tween (copy) ]]
	if script.Parent.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not v1.Visible then
		Tween:AddButton("Open", v1)
	end
end)
v1.SwitchButton.MouseButton1Click:Connect(function() --[[ Line: 180 | Upvalues: Main (copy), Salvage (copy) ]]
	local Visible = Main.Buy1.Visible
	Main.Visible = true
	Salvage.Visible = false
	Main.Buy1.Visible = not Visible
	Main.Buy2.Visible = not Visible
	Main.Buy3.Visible = not Visible
	Main.Buy4.Visible = Visible
	Main.Buy5.Visible = Visible
	Main.Buy6.Visible = Visible
	local v2 = string.gsub(string.gsub(Main.TimeLeft.Text, "ROTATES IN: ", ""), "REFRESHES IN: ", "")
	if Visible then
		Main.TimeLeft.Text = "REFRESHES IN: " .. v2
	else
		Main.TimeLeft.Text = "ROTATES IN: " .. v2
	end
end)
v1.MainButton.MouseButton1Click:Connect(function() --[[ Line: 202 | Upvalues: Salvage (copy), v1 (copy), v2 (ref) ]]
	local Visible = Salvage.Visible
	Salvage.Visible = not Visible
	v1.Main.Visible = Visible
	Salvage.DeleteFrame.Visible = false
	Salvage.ConfirmFrame.Visible = false
	v2 = Visible
	updateMainButton()
end)
Salvage.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 215 | Upvalues: Salvage (copy), ReplicatedStorage (copy), v3 (ref), v4 (ref) ]]
	Salvage.ConfirmFrame.Visible = false
	ReplicatedStorage.Remotes.Misc.Salvage:FireServer(v3, v4)
end)
Salvage.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 219 | Upvalues: Salvage (copy) ]]
	Salvage.ConfirmFrame.Visible = false
end)
Salvage.DeleteFrame.Confirm.MouseButton1Click:Connect(function() --[[ Line: 223 | Upvalues: Salvage (copy), v4 (ref), v3 (ref) ]]
	Salvage.DeleteFrame.Visible = false
	Salvage.ConfirmFrame.Visible = true
	v4 = tonumber(Salvage.DeleteFrame.Enter.TextBox.Text)
	Salvage.ConfirmFrame.Message.Text = ("Are you sure you want to salvage %* %*?"):format(v4, v3)
end)
Salvage.DeleteFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 230 | Upvalues: Salvage (copy) ]]
	Salvage.DeleteFrame.Visible = false
end)
v1.ShinyHunter.Buy.MouseButton1Click:Connect(function() --[[ Line: 234 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.ShinyHunter)
end)
pcall(function() --[[ Line: 237 | Upvalues: v1 (copy), MarketplaceService (copy), Robux (copy) ]]
	v1.ShinyHunter.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.ShinyHunter, Enum.InfoType.Product).PriceInRobux)
end)
update()
init()
updateMainButton()
Tween:AddButton(v1.Exit, v1)
Tween:AddButton(Main.ConfirmFrame.Yes)
Tween:AddButton(Main.ConfirmFrame.No)
Tween:AddButton(v1.SwitchButton)
Tween:AddButton(v1.MainButton)
Tween:AddButton(Salvage.ConfirmFrame.Yes)
Tween:AddButton(Salvage.ConfirmFrame.No)
Tween:AddButton(Salvage.DeleteFrame.Confirm)
Tween:AddButton(Salvage.DeleteFrame.Exit)
Tween:AddButton(v1.ShinyHunter.Buy)
TowerShop.OnClientEvent:Connect(update)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 260 | Upvalues: Towers (copy) ]]
	if p1 and not pcall(function() --[[ Line: 262 | Upvalues: p1 (ref), Towers (ref) ]]
		p1 = game:GetService("HttpService"):JSONDecode(p1)
		if p1 then
			Towers.Towers = p1
			return
		end
		error(0)
	end) then
		warn("Failed to update Client MetaData.")
	end
end)
task.spawn(function() --[[ Line: 275 | Upvalues: Main (copy) ]]
	while task.wait(1) do
		local v1 = os.date("!*t")
		local v2 = 59 - v1.min
		local v3 = 60 - v1.sec
		if v2 < 10 then
			v2 = "0" .. v2
		end
		if v3 < 10 then
			v3 = "0" .. v3
		end
		if Main.Buy4.Visible then
			Main.TimeLeft.Text = "REFRESHES IN: " .. v2 .. ":" .. v3
			continue
		end
		Main.TimeLeft.Text = "ROTATES IN: " .. v2 .. ":" .. v3
	end
end)