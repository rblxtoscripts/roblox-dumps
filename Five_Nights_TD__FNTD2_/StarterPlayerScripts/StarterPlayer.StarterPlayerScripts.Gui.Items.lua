-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
require(ReplicatedStorage.Modules.Misc.Presents)
local Presents = require(ReplicatedStorage.Configs.Presents)
local Items = require(ReplicatedStorage.Configs.Items)
local Towers = require(ReplicatedStorage.Configs.Towers)
local LocalPlayer = Players.LocalPlayer
local v1 = LocalPlayer:GetMouse()
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Inventory = PlayerGui:WaitForChild("Inventory")
local SideDock = PlayerGui:WaitForChild("SideDock")
local InventoryFrame = Inventory:WaitForChild("InventoryFrame")
local Container = SideDock:WaitForChild("Container")
local HolderFrame = InventoryFrame:WaitForChild("HolderFrame")
Container:WaitForChild("InventoryButton")
local Items_2 = HolderFrame:WaitForChild("Items")
InventoryFrame:WaitForChild("OpenPresent")
local ItemInfo = InventoryFrame:WaitForChild("ItemInfo")
local ItemInfo2 = InventoryFrame:WaitForChild("ItemInfo2")
local PresentAnimation = Inventory:WaitForChild("PresentAnimation")
local One = PresentAnimation.One
local v2 = nil
local v3 = nil
function updateSelected(p1) --[[ updateSelected | Line: 32 | Upvalues: ClientState (copy), Items_2 (copy), v2 (ref), InventoryFrame (copy), v3 (ref), Items (copy), ItemInfo (copy), ItemInfo2 (copy), UserInputService (copy), v1 (copy), Presents (copy) ]]
	local v12 = ClientState.GetData()
	local v22 = 1
	pcall(function() --[[ Line: 35 | Upvalues: Items_2 (ref), v2 (ref), v22 (ref) ]]
		v22 = tonumber((string.gsub(Items_2[v2].Info.Text, "x", "")))
	end)
	InventoryFrame.ItemInfo.Visible = false
	InventoryFrame.ItemInfo2.Visible = false
	InventoryFrame.OpenPresent.Visible = false
	InventoryFrame.OpenPresent3.Visible = false
	InventoryFrame.OpenPresent8.Visible = false
	InventoryFrame.OpenPresentAll.Visible = false
	v3 = if p1 == "Present" then if v12.Gamepasses.QuickOpen then InventoryFrame.OpenPresentAll elseif v22 >= 8 then InventoryFrame.OpenPresent8 elseif v22 >= 3 then InventoryFrame.OpenPresent3 else InventoryFrame.OpenPresent elseif Items[v2] and Items[v2].Usable then ItemInfo else ItemInfo2
	if v2 then
		v3.Visible = true
		if UserInputService.MouseEnabled then
			local v32 = (Vector2.new(v1.X, v1.Y) - InventoryFrame.AbsolutePosition) / InventoryFrame.AbsoluteSize
			v3.Position = UDim2.fromScale(v32.X, v32.Y)
		else
			v3.Position = InventoryFrame.Position
		end
		if p1 == "Present" then
			v3.Holder.PresentName.Text = if Presents.Presents[v2] and Presents.Presents[v2].Name then Presents.Presents[v2].Name else v2
		else
			v3.Holder.ItemName.Text = if Items[v2] and Items[v2].Name then Items[v2].Name else v2
			v3.Holder.Description.Text = if Items[v2] and Items[v2].Description then Items[v2].Description else "N/A"
		end
	else
		v3.Visible = false
	end
end
function update() --[[ update | Line: 87 | Upvalues: ClientState (copy), Items_2 (copy), Presents (copy), ReplicatedStorage (copy), Tween (copy), LocalPlayer (copy), InventoryFrame (copy), v2 (ref), Items (copy) ]]
	local v1 = ClientState.GetData()
	for k, v in pairs(Items_2:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	for k, v in pairs(v1.Presents) do
		if not (v <= 0) then
			local v22 = Presents.Presents[k]
			if v22 then
				local v3 = Items_2.Example:Clone()
				v3.Name = k
				v3.BorderImage.TowerImage.Image = v22.Image
				v3.Info.Text = "x" .. v
				ReplicatedStorage.Gradients[if v22.Rarity then v22.Rarity else "Common"]:Clone().Parent = v3.BorderImage
				v3.Parent = Items_2
				v3.Visible = true
				Tween:AddButton(v3, nil, nil, nil, true)
				v3.MouseButton1Click:Connect(function() --[[ Line: 110 | Upvalues: LocalPlayer (ref), k (copy), InventoryFrame (ref), v2 (ref) ]]
					if LocalPlayer:FindFirstChild("TradingItem") then
						LocalPlayer.TradingItem.Value = k
						InventoryFrame.TradeAmount.Visible = true
						return
					end
					v2 = if v2 == k then nil else k
					updateSelected("Present")
				end)
			end
		end
	end
	for k, v in pairs(v1.Items) do
		if not (v <= 0) then
			local v5 = Items[k]
			if v5 then
				local v6 = Items_2.Example:Clone()
				v6.Name = k
				v6.BorderImage.TowerImage.Image = v5.Image
				v6.Info.Text = "x" .. v
				ReplicatedStorage.Gradients[if v5.Rarity then v5.Rarity else "Common"]:Clone().Parent = v6.BorderImage
				v6.Parent = Items_2
				v6.Visible = true
				Tween:AddButton(v6, nil, nil, nil, true)
				v6.MouseButton1Click:Connect(function() --[[ Line: 139 | Upvalues: LocalPlayer (ref), k (copy), InventoryFrame (ref), v2 (ref) ]]
					if LocalPlayer:FindFirstChild("TradingItem") then
						LocalPlayer.TradingItem.Value = k
						InventoryFrame.TradeAmount.Visible = true
						return
					end
					v2 = if v2 == k then nil else k
					updateSelected()
				end)
			end
		end
	end
end
local t = {}
function openAnimation(p1, p2) --[[ openAnimation | Line: 157 | Upvalues: LocalPlayer (copy), PlayerGui (copy), t (ref), One (ref), PresentAnimation (copy), Towers (copy), ReplicatedStorage (copy), TweenService (copy) ]]
	if LocalPlayer:FindFirstChild("InSummon") then
		repeat
			task.wait(0.5)
		until not LocalPlayer:FindFirstChild("InSummon")
	end
	for k, v in pairs(PlayerGui:GetChildren()) do
		if v.Name ~= "Inventory" and (v.Name ~= "Messages" and v.Enabled) then
			v.Enabled = false
			t[v] = v
		end
	end
	local count = 0
	for k, v in pairs(p1) do
		count = count + 1
	end
	One = if p2 then PresentAnimation.Infinite elseif count == 1 then PresentAnimation.One elseif count == 3 then PresentAnimation.Three elseif count == 8 then PresentAnimation.Eight else nil
	if not One then
		return
	end
	if p2 then
		local t2 = {}
		for k, v in pairs(p1) do
			if t2[v.Show] then
				t2[v.Show] = {
					Name = v.Name,
					Show = v.Show,
					Amount = t2[v.Show].Amount + 1
				}
				continue
			end
			t2[v.Show] = {
				Amount = 1,
				Name = v.Name,
				Show = v.Show
			}
		end
		p1 = t2
	end
	local count_2 = 0
	for k, v in pairs(p1) do
		count_2 = count_2 + 1
		local v2 = v.Name
		local v3 = Towers.Towers[v2]
		if v2 and v3 then
			PresentAnimation.Visible = true
			local v4 = string.find(v.Show, "Shiny")
			local Active = One[if p2 then "Example" else "Example" .. count_2]:Clone()
			Active.Name = "Active"
			Active.Tower.BorderImage.TowerImage.Image = if v3 then v3.Image else ""
			Active.Tower.BorderImage.UIGradient.Color = if v4 then ReplicatedStorage.Gradients.Shiny.Color elseif ReplicatedStorage.Gradients:FindFirstChild(v3.Rarity) then ReplicatedStorage.Gradients[v3.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
			Active.Tower.Frame.UIGradient.Color = if v4 then ReplicatedStorage.Gradients.Shiny.Color elseif ReplicatedStorage.Gradients:FindFirstChild(v3.Rarity) then ReplicatedStorage.Gradients[v3.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
			Active.TowerName.Text = v.Show
			Active.Parent = One
			Active.Visible = true
			if Active:FindFirstChild("Amount") and v.Amount then
				Active.Amount.Text = "x" .. v.Amount
			end
			if v4 then
				Active.Tower.Shiny.Visible = true
				continue
			end
			Active.Tower.Shiny.Visible = false
		end
	end
	local Size = One.Size
	One.Size = UDim2.new(0, 0, 0, 0)
	One.Visible = true
	TweenService:Create(One, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = Size
	}):Play()
	task.wait(2)
	PresentAnimation.Close.Visible = true
end
function close() --[[ close | Line: 235 | Upvalues: One (ref), t (ref), PresentAnimation (copy) ]]
	if not One then
		return
	end
	for k, v in pairs(One:GetChildren()) do
		if v.Name == "Active" then
			v:Destroy()
		end
	end
	for k, v in pairs(t) do
		v.Enabled = true
	end
	t = {}
	One.Visible = false
	One = nil
	PresentAnimation.Close.Visible = false
	PresentAnimation.Visible = false
end
PresentAnimation.Close.MouseButton1Click:Connect(function() --[[ Line: 254 | Upvalues: Tween (copy), InventoryFrame (copy) ]]
	close()
	Tween:AddButton("Open", InventoryFrame)
end)
InventoryFrame.Search.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 259 | Upvalues: InventoryFrame (copy), Items_2 (copy), Presents (copy), Items (copy) ]]
	local v1 = InventoryFrame.Search.TextBox.Text:lower()
	for v3, v4 in Items_2:GetChildren() do
		local v2
		if v4:IsA("ImageButton") and v4.Name ~= "Example" then
			v4.Visible = false
			v2 = if Presents.Presents[v4.Name] and Presents.Presents[v4.Name].Name then Presents.Presents[v4.Name].Name elseif Items[v4.Name] and Items[v4.Name].Name then Items[v4.Name].Name else v4.Name
			if v2:lower():match(v1) or v4.Name:lower():match(v1) then
				v4.Visible = true
			end
		end
	end
end)
InventoryFrame.Items.MouseButton1Click:Connect(function() --[[ Line: 274 | Upvalues: Items_2 (copy), HolderFrame (copy), InventoryFrame (copy), v3 (ref) ]]
	Items_2.Visible = true
	HolderFrame.Units.Visible = false
	HolderFrame.Shop.Visible = false
	HolderFrame.Teams.Visible = false
	InventoryFrame.TowerStats.Visible = false
	if v3 then
		v3.Visible = false
	end
	InventoryFrame.UnequipAll.Visible = false
	InventoryFrame.Teams.Visible = false
	InventoryFrame.Search.Visible = true
	InventoryFrame.Search.TextBox.Text = ""
	for k, v in pairs(InventoryFrame.Units:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Example" then
			v.Visible = true
		end
	end
	task.defer(update)
end)
function openClick(p1) --[[ openClick | Line: 294 | Upvalues: LocalPlayer (copy), One (ref), InventoryFrame (copy), Tween (copy), ReplicatedStorage (copy), v2 (ref) ]]
	if LocalPlayer:FindFirstChild("InSummon") then
		return
	end
	if not (One and One.Visible) then
		InventoryFrame.OpenPresent.Visible = false
		InventoryFrame.OpenPresent3.Visible = false
		InventoryFrame.OpenPresent8.Visible = false
		InventoryFrame.OpenPresentAll.Visible = false
		Tween:AddButton("Close", InventoryFrame)
		ReplicatedStorage.Remotes.Misc.OpenPresent:FireServer(v2, p1)
		v2 = nil
	end
end
Items_2:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 306 | Upvalues: Items_2 (copy), v3 (ref), v2 (ref) ]]
	if Items_2.Visible or not v3 then
		return
	end
	v3.Visible = false
	v2 = nil
end)
InventoryFrame.OpenPresentAll.Holder.Open1.MouseButton1Click:Connect(function() --[[ Line: 315 ]]
	task.spawn(openClick, 1)
end)
InventoryFrame.OpenPresentAll.Holder.Open3.MouseButton1Click:Connect(function() --[[ Line: 318 ]]
	task.spawn(openClick, 3)
end)
InventoryFrame.OpenPresentAll.Holder.Open8.MouseButton1Click:Connect(function() --[[ Line: 321 ]]
	task.spawn(openClick, 8)
end)
InventoryFrame.OpenPresentAll.Holder.OpenAll.MouseButton1Click:Connect(function() --[[ Line: 324 ]]
	task.spawn(openClick, "All")
end)
InventoryFrame.OpenPresent8.Holder.Open1.MouseButton1Click:Connect(function() --[[ Line: 327 ]]
	task.spawn(openClick, 1)
end)
InventoryFrame.OpenPresent8.Holder.Open3.MouseButton1Click:Connect(function() --[[ Line: 330 ]]
	task.spawn(openClick, 3)
end)
InventoryFrame.OpenPresent8.Holder.Open8.MouseButton1Click:Connect(function() --[[ Line: 333 ]]
	task.spawn(openClick, 8)
end)
InventoryFrame.OpenPresent3.Holder.Open1.MouseButton1Click:Connect(function() --[[ Line: 336 ]]
	task.spawn(openClick, 1)
end)
InventoryFrame.OpenPresent3.Holder.Open3.MouseButton1Click:Connect(function() --[[ Line: 339 ]]
	task.spawn(openClick, 3)
end)
InventoryFrame.OpenPresent.Holder.Open.MouseButton1Click:Connect(function() --[[ Line: 342 ]]
	task.spawn(openClick, 1)
end)
InventoryFrame.ItemInfo.Holder.Use.MouseButton1Click:Connect(function() --[[ Line: 345 | Upvalues: v2 (ref), v3 (ref), LocalPlayer (copy), ReplicatedStorage (copy) ]]
	if not v2 then
		return
	end
	if v3 then
		v3.Visible = false
	end
	if string.find(v2, "Remnant") then
		if not LocalPlayer:FindFirstChild("UsingItem") then
			local UsingItem = Instance.new("StringValue")
			UsingItem.Name = "UsingItem"
			UsingItem.Value = v2
			UsingItem.Parent = LocalPlayer
		end
		ReplicatedStorage.Remotes.Misc.UseItem.Bindable:Fire(1, v2)
	else
		ReplicatedStorage.Remotes.Misc.UseItem:FireServer(v2)
	end
	v2 = nil
end)
ReplicatedStorage.Remotes.Misc.UseItem.Bindable.Event:Connect(function(p1, p2) --[[ Line: 365 | Upvalues: ReplicatedStorage (copy) ]]
	if p1 ~= 1 then
		ReplicatedStorage.Remotes.Misc.UseItem:FireServer(p2, p1)
	end
end)
Tween:AddButton(InventoryFrame.Items)
Tween:AddButton(InventoryFrame.OpenPresent8.Holder.Open1)
Tween:AddButton(InventoryFrame.OpenPresent8.Holder.Open3)
Tween:AddButton(InventoryFrame.OpenPresent8.Holder.Open8)
Tween:AddButton(InventoryFrame.OpenPresent3.Holder.Open1)
Tween:AddButton(InventoryFrame.OpenPresent3.Holder.Open3)
Tween:AddButton(InventoryFrame.OpenPresentAll.Holder.Open1)
Tween:AddButton(InventoryFrame.OpenPresentAll.Holder.Open3)
Tween:AddButton(InventoryFrame.OpenPresentAll.Holder.Open8)
Tween:AddButton(InventoryFrame.OpenPresentAll.Holder.OpenAll)
Tween:AddButton(InventoryFrame.OpenPresent.Holder.Open)
Tween:AddButton(InventoryFrame.ItemInfo.Holder.Use)
Tween:AddButton(PresentAnimation.Close)
Tween:AddButton(InventoryFrame.TradeAmount.Confirm)
PresentAnimation.One.Visible = false
PresentAnimation.Three.Visible = false
PresentAnimation.Eight.Visible = false
task.wait(3)
task.spawn(update)
ReplicatedStorage.Remotes.Misc.UpdateItems.OnClientEvent:Connect(function(p1, p2, p3) --[[ Line: 393 ]]
	if not p1 then
		task.spawn(update)
		return
	end
	if p1 ~= "OpenedPresent" then
		return
	end
	task.spawn(openAnimation, p2, p3)
end)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 401 | Upvalues: Towers (copy) ]]
	if p1 and not pcall(function() --[[ Line: 403 | Upvalues: p1 (ref), Towers (ref) ]]
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
ReplicatedStorage.Remotes.Misc.UpdateItems.Bindable.Event:Connect(close)