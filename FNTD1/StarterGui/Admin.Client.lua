-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local v1 = LocalPlayer:GetMouse()
local TradeHistory = ReplicatedStorage.Remotes.Misc.TradeHistory
local PurchaseHistory = ReplicatedStorage.Remotes.Misc.PurchaseHistory
local MarketHistory = ReplicatedStorage.Remotes.Misc.MarketHistory
local Ban = ReplicatedStorage.Remotes.Misc.Ban
local ViewSouls = ReplicatedStorage.Remotes.Misc.ViewSouls
local GiveWins = ReplicatedStorage.Remotes.Misc.GiveWins
local GiveItems = ReplicatedStorage.Remotes.Misc.GiveItems
local ViewItems = ReplicatedStorage.Remotes.Misc.ViewItems
local DeleteClanByID = ReplicatedStorage.Remotes.Misc.DeleteClanByID
local GetClanIdByName = ReplicatedStorage.Remotes.Misc.GetClanIdByName
local GetTradingPlaza = ReplicatedStorage.Remotes.Misc.GetTradingPlaza
local MiscLogs = ReplicatedStorage.Remotes.Misc.MiscLogs
local GiveClanWins = ReplicatedStorage.Remotes.Misc.GiveClanWins
local BanLogsRemote = ReplicatedStorage.Remotes.Misc.BanLogsRemote
local Tween = require(ReplicatedStorage.Libs.Tween)
local Towers = require(ReplicatedStorage.Configs.Towers)
local Items = require(ReplicatedStorage.Configs.Items)
local Presents = require(ReplicatedStorage.Configs.Presents)
local Misc = require(ReplicatedStorage.Configs.Misc)
local StatRerolls = require(ReplicatedStorage.Modules.Misc.StatRerolls)
local v2 = script.Parent
local View = script.Parent.View
local Pages = script.Parent.Pages
local Pages2 = script.Parent.Pages2
local ChoosePlayer = script.Parent.ChoosePlayer
local InventoryFrame = script.Parent.InventoryFrame
local Ban_2 = script.Parent.Ban
local ToGive = script.Parent.ToGive
local MiscLogs_2 = script.Parent.MiscLogs
local ModLogs = script.Parent.ModLogs
local BanLogs = script.Parent.BanLogs
local ItemInfo = View.Main.ItemInfo
local TradeHistory_2 = script.Parent.Parent:WaitForChild("SideDock"):WaitForChild("TradeHistory")
local Ban_3 = script.Parent.Parent:WaitForChild("SideDock"):WaitForChild("Ban")
local v3 = 1
local t = {}
local v4 = nil
local v5 = nil
local t2 = {}
local Rarities = Misc.Rarities
local function v6(p1) --[[ deepCopy | Line: 57 | Upvalues: v6 (copy) ]]
	if not p1 then
		return {}
	end
	local t = {}
	for k, v in pairs(p1) do
		if type(v) == "table" then
			v = v6(v)
		end
		t[k] = v
	end
	return t
end
function Format(p1) --[[ Format | Line: 69 ]]
	return string.format("%02i", p1)
end
function convertToHMS(p1) --[[ convertToHMS | Line: 73 ]]
	local v1 = (p1 - p1 % 60) / 60
	local v2 = (v1 - v1 % 60) / 60
	local v3 = (v2 - v2 % 24) / 24
	return Format(v3) .. ":" .. Format(v2 - v3 * 24) .. ":" .. Format(v1 - v2 * 60) .. ":" .. Format(p1 - v1 * 60)
end
local function clear() --[[ clear | Line: 83 | Upvalues: Pages (copy) ]]
	for v1, v2 in Pages.Pages:GetChildren() do
		if v2:IsA("Frame") and v2.Name ~= "ExamplePage" then
			v2:Destroy()
		end
	end
end
local function rarityOrder(p1) --[[ rarityOrder | Line: 91 | Upvalues: Rarities (copy) ]]
	return 10 - (if table.find(Rarities, p1) then table.find(Rarities, p1) or 0 else 0)
end
local function hasEnchant(p1) --[[ hasEnchant | Line: 95 ]]
	if p1 and typeof(p1) == "string" then
		return p1 and #p1 > 1 and true or false
	else
		return false
	end
end
function marketplace(p1, p2) --[[ marketplace | Line: 105 | Upvalues: v4 (ref), ChoosePlayer (copy), v3 (ref), t (ref), v6 (copy), clear (copy), Pages (copy), Tween (copy) ]]
	v4 = "Marketplace"
	if typeof(p1) == "string" then
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "ERROR!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
		return
	end
	v3 = 1
	if p2 then
		local count = 0
		local t2 = {}
		for k, v in pairs(p1) do
			count = count + 1
			t2[count] = v6(v)
		end
		table.sort(t2, function(p1, p2) --[[ Line: 139 ]]
			return (if p2 then p2.Time else 0) < (if p1 then p1.Time else 0)
		end)
		p1 = t2
	else
		t = {}
		for k, v in pairs(p1) do
			if v.Info then
				table.insert(t, {
					ID = k,
					Time = v.Time,
					Info = v.Info
				})
				continue
			end
			table.insert(t, {
				ID = k,
				Player = v.Player,
				OtherPlayer = v.OtherPlayer,
				Time = v.Time,
				Inbox = v.Inbox
			})
		end
		table.sort(t, function(p1, p2) --[[ Line: 129 ]]
			return p1.Time > p2.Time
		end)
	end
	clear()
	local count = 0
	for k, v in pairs(if p2 then p1 else t) do
		count = count + 1
		local v42 = math.ceil(count / 5)
		local v5 = Pages.Pages:FindFirstChild("Page" .. v42)
		if not v5 then
			local v62 = Pages.Pages.ExamplePage:Clone()
			v62.Name = "Page" .. v42
			v62.Parent = Pages.Pages
			v5 = v62
		end
		local v7 = if v.Info then v.Info[1] else v.OtherPlayer
		local v8 = v5.Example2:Clone()
		v8.Name = v.ID
		v8.LayoutOrder = count
		v8.Other.Text = v7 .. ""
		v8.Time.Text = convertToHMS(os.time() - v.Time) .. " ago"
		local v9 = if v.Inbox then v.Inbox else nil
		if not v9 then
			v9 = (if v.Info[4] then "Bought @" .. v.Info[1] .. " " else "@" .. v.Info[1] .. " bought your ") .. v.Info[2] .. " for " .. v.Info[3] .. " souls"
		end
		v8.Inbox.Text = v9
		v8.Parent = v5
		v8.Visible = true
	end
	updatePages()
	Tween:AddButton("Open", Pages)
end
MarketHistory.OnClientEvent:Connect(marketplace)
PurchaseHistory.OnClientEvent:Connect(function(p1) --[[ Line: 207 | Upvalues: ChoosePlayer (copy), v3 (ref), t (ref), clear (copy), Pages (copy), Tween (copy) ]]
	if typeof(p1) == "string" then
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "ERROR!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
		return
	end
	v3 = 1
	t = {}
	for k, v in pairs(p1) do
		table.insert(t, {
			ID = k,
			Player = v.Player,
			Time = v.Time,
			Inbox = v.Purchased
		})
	end
	table.sort(t, function(p1, p2) --[[ Line: 223 ]]
		return p1.Time > p2.Time
	end)
	clear()
	local count = 0
	for k, v in pairs(t) do
		count = count + 1
		local v2 = math.ceil(count / 5)
		local v32 = Pages.Pages:FindFirstChild("Page" .. v2)
		if not v32 then
			local v4 = Pages.Pages.ExamplePage:Clone()
			v4.Name = "Page" .. v2
			v4.Parent = Pages.Pages
			v32 = v4
		end
		local v5 = v32.Example2:Clone()
		v5.Name = v.ID
		v5.LayoutOrder = count
		v5.Other.Text = v.Player
		v5.Time.Text = convertToHMS(os.time() - v.Time) .. " ago"
		v5.Inbox.Text = v.Inbox
		v5.Parent = v32
		v5.Visible = true
	end
	updatePages()
	Tween:AddButton("Open", Pages)
end)
function tradeHistory(p1, p2, p3) --[[ tradeHistory | Line: 256 | Upvalues: View (copy), ChoosePlayer (copy), v4 (ref), v3 (ref), t (ref), v6 (copy), clear (copy), Pages (copy), Tween (copy) ]]
	if p1 == "CheckBan" then
		if p2 == "Error" then
			View.OtherPlayerName.TextColor3 = Color3.fromRGB(255, 227, 67)
			return
		end
		if p2 == true then
			View.OtherPlayerName.TextColor3 = Color3.fromRGB(255, 32, 36)
			return
		end
		if p2 ~= false then
			return
		end
		View.OtherPlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
	elseif p1 == "CheckBan2" then
		if p3 ~= ChoosePlayer.TextBox.Text then
			return
		end
		if p2 == "Error" then
			View.TextLabel.TextColor3 = Color3.fromRGB(255, 227, 67)
			return
		end
		if p2 == true then
			View.TextLabel.TextColor3 = Color3.fromRGB(255, 32, 36)
			return
		end
		if p2 ~= false then
			return
		end
		View.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	else
		v4 = "TradeHistory"
		if typeof(p1) == "string" then
			ChoosePlayer.TextBox.Text = ""
			ChoosePlayer.TextBox.PlaceholderText = "ERROR!"
			ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
			task.wait(0.8)
			ChoosePlayer.TextBox.PlaceholderText = ""
			ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
			return
		end
		v3 = 1
		if p2 then
			local count = 0
			local t2 = {}
			for k, v in pairs(p1) do
				count = count + 1
				t2[count] = v6(v)
			end
			table.sort(t2, function(p1, p2) --[[ Line: 308 ]]
				return (if p2 then p2.Time else 0) < (if p1 then p1.Time else 0)
			end)
			p1 = t2
		else
			t = {}
			for k, v in pairs(p1) do
				table.insert(t, {
					OtherPlayer = v.OtherPlayer,
					Time = v.Time,
					Items1 = v.Items1,
					Items2 = v.Items2,
					ID = k
				})
			end
			table.sort(t, function(p1, p2) --[[ Line: 298 ]]
				return p1.Time > p2.Time
			end)
		end
		clear()
		local count = 0
		for k, v in pairs(if p2 then p1 else t) do
			count = count + 1
			local v32 = math.ceil(count / 5)
			local v42 = Pages.Pages:FindFirstChild("Page" .. v32)
			if not v42 then
				local v5 = Pages.Pages.ExamplePage:Clone()
				v5.Name = "Page" .. v32
				v5.Parent = Pages.Pages
				v42 = v5
			end
			local v62 = v42.Example:Clone()
			v62.Name = v.ID
			v62.LayoutOrder = count
			v62.Other.Text = v.OtherPlayer
			v62.Time.Text = convertToHMS(os.time() - v.Time) .. " ago"
			v62.Parent = v42
			v62.Visible = true
			Tween:AddButton(v62.View)
			v62.View.MouseButton1Click:Connect(function() --[[ Line: 340 | Upvalues: v (copy) ]]
				task.spawn(viewTrade, v.ID)
			end)
		end
		updatePages()
		Tween:AddButton("Open", Pages)
	end
end
TradeHistory.OnClientEvent:Connect(tradeHistory)
Pages.Search.Go.MouseButton1Click:Connect(function() --[[ Line: 353 | Upvalues: Pages (copy), t (ref), v4 (ref) ]]
	local v1 = Pages.Search.TextBox.Text:lower()
	local t2 = {}
	local v2 = nil
	pcall(function() --[[ Line: 359 | Upvalues: v2 (ref), v1 (copy) ]]
		v2 = game.Players:GetNameFromUserIdAsync(v1)
	end)
	for k, v in pairs(t) do
		if v4 == "TradeHistory" then
			if string.match(string.lower(v.OtherPlayer), v1) then
				t2[k] = v
			end
			if v2 and string.match(string.lower(v2), string.lower(v.OtherPlayer)) then
				t2[k] = v
			end
			for k2, v3 in pairs(v.Items1) do
				if not t2[k] then
					if string.match(string.lower(k2), v1) then
						t2[k] = v
						continue
					end
					if typeof(v3) == "table" and (v3.Name and string.match(string.lower(v3.Name), v1)) then
						t2[k] = v
					end
				end
			end
			for k2, v3 in pairs(v.Items2) do
				if not t2[k] then
					if string.match(string.lower(k2), v1) then
						t2[k] = v
						continue
					end
					if typeof(v3) == "table" and (v3.Name and string.match(string.lower(v3.Name), v1)) then
						t2[k] = v
					end
				end
			end
			continue
		end
		if v4 == "Marketplace" then
			local v5 = if v.Info then v.Info[1] else v.OtherPlayer
			local v6 = if v.Info then v.Info[2] else v.Inbox
			if string.match(string.lower(v5), v1) then
				t2[k] = v
			end
			if v2 and string.match(string.lower(v2), string.lower(v5)) then
				t2[k] = v
			end
			if string.match(string.lower(v6), v1) then
				t2[k] = v
			end
			continue
		end
		if string.match(string.lower(v.Message), v1) then
			t2[k] = v
		end
	end
	table.sort(t2, function(p1, p2) --[[ Line: 418 ]]
		if not (p1 and p2) then
			return
		end
		return p1.Time > p2.Time
	end)
	if v4 == "TradeHistory" then
		tradeHistory(t2, true)
	elseif v4 == "Marketplace" then
		marketplace(t2, true)
	else
		miscLogs(v4, t2)
	end
end)
ViewItems.OnClientEvent:Connect(function(p1) --[[ Line: 432 | Upvalues: InventoryFrame (copy), ChoosePlayer (copy), Towers (copy), Items (copy), Presents (copy), ReplicatedStorage (copy), Rarities (copy), Tween (copy), StatRerolls (copy), HttpService (copy) ]]
	if not p1 or (typeof(p1) ~= "table" or #p1 == 0) then
		return
	end
	InventoryFrame.TextLabel.Text = "Spectating Inventory"
	ChoosePlayer.Visible = false
	for v1, v2 in InventoryFrame.Items:GetChildren() do
		if v2:IsA("ImageButton") then
			v2:Destroy()
		end
	end
	for v5, v6 in p1 do
		local v3, v4
		if v6.Type and v6.Name then
			if v6.Type == "Unit" then
				local v7, v8, v9, v10, v11, v12, v13, v14, v15
				if v6.Shiny then
					if not v6.Stats then
						v7 = v6.Enchant
						v8 = if v7 and typeof(v7) == "string" then if v7 and #v7 > 1 then true else false else false
						if v8 and not v6.Shiny then
							v9 = InventoryFrame.Items:FindFirstChild(v6.Enchant .. v6.Name)
							if v9 then
								v9:SetAttribute("Owned", v9:GetAttribute("Owned") + 1)
								v9.Info.Text = ("x%*"):format((v9:GetAttribute("Owned")))
								v9.Info.Visible = true
								continue
							end
						end
						v10 = v6.Enchant
						v11 = if v10 and typeof(v10) == "string" then if v10 and #v10 > 1 then true else false else false
						if v11 and v6.Shiny then
							v12 = InventoryFrame.Items:FindFirstChild("Shiny" .. v6.Enchant .. v6.Name)
							if v12 and v12.Shiny.Visible then
								v12:SetAttribute("Owned", v12:GetAttribute("Owned") + 1)
								v12.Info.Text = ("x%*"):format((v12:GetAttribute("Owned")))
								v12.Info.Visible = true
								continue
							end
						end
						v13 = v6.Enchant
						v14 = if v13 and typeof(v13) == "string" then if v13 and #v13 > 1 then true else false else false
						if not v14 and v6.Shiny then
							v15 = InventoryFrame.Items:FindFirstChild("Shiny" .. v6.Name)
							if v15 and v15.Shiny.Visible then
								v15:SetAttribute("Owned", v15:GetAttribute("Owned") + 1)
								v15.Info.Text = ("x%*"):format((v15:GetAttribute("Owned")))
								v15.Info.Visible = true
								continue
							end
						end
					end
				else
					local Enchant = v6.Enchant
					if (if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false) or v6.Stats then
						if not v6.Stats then
							v7 = v6.Enchant
							v8 = if v7 and typeof(v7) == "string" then if v7 and #v7 > 1 then true else false else false
							if v8 and not v6.Shiny then
								v9 = InventoryFrame.Items:FindFirstChild(v6.Enchant .. v6.Name)
								if v9 then
									v9:SetAttribute("Owned", v9:GetAttribute("Owned") + 1)
									v9.Info.Text = ("x%*"):format((v9:GetAttribute("Owned")))
									v9.Info.Visible = true
									continue
								end
							end
							v10 = v6.Enchant
							v11 = if v10 and typeof(v10) == "string" then if v10 and #v10 > 1 then true else false else false
							if v11 and v6.Shiny then
								v12 = InventoryFrame.Items:FindFirstChild("Shiny" .. v6.Enchant .. v6.Name)
								if v12 and v12.Shiny.Visible then
									v12:SetAttribute("Owned", v12:GetAttribute("Owned") + 1)
									v12.Info.Text = ("x%*"):format((v12:GetAttribute("Owned")))
									v12.Info.Visible = true
									continue
								end
							end
							v13 = v6.Enchant
							v14 = if v13 and typeof(v13) == "string" then if v13 and #v13 > 1 then true else false else false
							if not v14 and v6.Shiny then
								v15 = InventoryFrame.Items:FindFirstChild("Shiny" .. v6.Name)
								if v15 and v15.Shiny.Visible then
									v15:SetAttribute("Owned", v15:GetAttribute("Owned") + 1)
									v15.Info.Text = ("x%*"):format((v15:GetAttribute("Owned")))
									v15.Info.Visible = true
									continue
								end
							end
						end
					else
						local v17 = InventoryFrame.Items:FindFirstChild(v6.Name)
						if v17 and not v17.Shiny.Visible then
							v17:SetAttribute("Owned", v17:GetAttribute("Owned") + 1)
							v17.Info.Text = ("x%*"):format((v17:GetAttribute("Owned")))
							v17.Info.Visible = true
							continue
						end
					end
				end
			end
			if v6.Type == "Unit" or not (v6.Amount <= 0) then
				local v18 = if v6.Type == "Unit" then Towers.Towers[v6.Name] elseif v6.Type == "Item" then Items[v6.Name] elseif v6.Type == "Present" then Presents.Presents[v6.Name] else nil
				if v18 then
					v3 = if v6.Shiny then ReplicatedStorage.Gradients.Shiny.Color elseif v18.Rarity and ReplicatedStorage.Gradients:FindFirstChild(v18.Rarity) then ReplicatedStorage.Gradients[v18.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
					local v19 = script.InventorySample:Clone()
					v19.ZIndex = -#InventoryFrame.Items:GetChildren()
					local Rarity = v18.Rarity
					v19.LayoutOrder = 10 - (table.find(Rarities, Rarity) and table.find(Rarities, Rarity) or 0)
					v19.BorderImage.TowerImage.Image = v18.Image or ""
					v19.BorderImage.UIGradient.Color = v3
					v19.Frame.UIGradient.Color = v3
					v19.Info.Text = "x1"
					v19:SetAttribute("Owned", 1)
					v19:SetAttribute("Type", v6.Type)
					v19:SetAttribute("Name", v6.Name)
					v19:SetAttribute("Shiny", v6.Shiny)
					v19:SetAttribute("Enchant", v6.Enchant)
					if v6.Stats then
						v19:SetAttribute("ID", v6.ID)
						v19.Stats.Visible = true
						Tween:AddButton(v19.Stats)
						local v21 = v19.Stats.MouseButton1Click:Connect(function() --[[ Line: 514 | Upvalues: v19 (copy), StatRerolls (ref), v6 (copy) ]]
							v19.StatFrame.Visible = not v19.StatFrame.Visible
							local Holder = v19.StatFrame.Holder
							for k, v in pairs({ "Damage", "Range", "Cooldown" }) do
								local v1 = StatRerolls.GetLetterStats(v, v6.Stats[v], true)
								Holder[v .. "Letter"].TextLabel.Text = v1.Letter
								Holder[v .. "Show"].TextLabel.Text = v1.Value
								if Holder[v .. "Letter"]:FindFirstChild("ImageLabel") then
									Holder[v .. "Letter"].ImageLabel:Destroy()
								end
								if v1.Image then
									Holder[v .. "Letter"].TextLabel.Text = ""
									local ImageLabel = Instance.new("ImageLabel", Holder[v .. "Letter"])
									ImageLabel.Size = UDim2.new(1, 0, 1, 0)
									ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
									ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
									ImageLabel.BackgroundTransparency = 1
									ImageLabel.Image = v1.Image
									ImageLabel.ScaleType = Enum.ScaleType.Fit
								end
								if v1.Gradient then
									Holder[v .. "Letter"].Rare.Color = v1.Gradient
									Holder[v .. "Letter"].Frame.Rare.Color = v1.Gradient
									Holder[v .. "Letter"].TextLabel.Rare.Color = v1.Gradient
									Holder[v .. "Show"].Rare.Color = v1.Gradient
									Holder[v .. "Show"].Frame.Rare.Color = v1.Gradient
									Holder[v .. "Show"].TextLabel.Rare.Color = v1.Gradient
								end
							end
						end)
						v19.Destroying:Once(function() --[[ Line: 546 | Upvalues: v21 (ref) ]]
							v21:Disconnect()
						end)
					else
						v19.Stats.Visible = false
					end
					if v6.Type == "Unit" then
						local Enchant = v6.Enchant
						if (if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false) and not v6.Shiny then
							v4 = v6.Enchant .. v6.Name
						else
							local Enchant_2 = v6.Enchant
							v4 = if (if Enchant_2 and typeof(Enchant_2) == "string" then if Enchant_2 and #Enchant_2 > 1 then true else false else false) and v6.Shiny then "Shiny" .. v6.Enchant .. v6.Name elseif v6.Shiny then "Shiny" .. v6.Name else v6.Name
						end
						v19.Name = v4
						if v6.Stats then
							v19.Name = v19.Name .. "_Stats" .. HttpService:GenerateGUID(false)
						end
						local Enchant_2 = v6.Enchant
						local v24 = if Enchant_2 and typeof(Enchant_2) == "string" then if Enchant_2 and #Enchant_2 > 1 then true else false else false
						if v24 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v6.Enchant) then
							ReplicatedStorage.Objects.Enchants[v6.Enchant]:Clone().Parent = v19
						end
						v19.Shiny.Visible = if v6.Shiny then true else false
					else
						v19.Name = v6.Name
						v19.Shiny.Visible = false
						v19.Info.Text = ("x%*"):format(v6.Amount)
						v19:SetAttribute("Owned", v6.Amount)
					end
					v19.Parent = InventoryFrame.Items
					v19.Visible = true
					Tween:AddButton(v19, nil, nil, nil, true)
					v19.MouseButton1Click:Connect(function() --[[ Line: 576 | Upvalues: InventoryFrame (ref), v19 (copy) ]]
						InventoryFrame.CurrentDelete.Value = v19
						InventoryFrame.DeleteFrame.Visible = true
					end)
				end
			end
		end
	end
	InventoryFrame.Visible = true
end)
ViewItems.Delete.OnClientEvent:Connect(function() --[[ Line: 585 | Upvalues: ViewItems (copy), ChoosePlayer (copy) ]]
	ViewItems:FireServer(ChoosePlayer.TextBox.Text, true)
end)
InventoryFrame.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 588 | Upvalues: ViewItems (copy), ChoosePlayer (copy), v5 (ref), InventoryFrame (copy) ]]
	ViewItems.Delete:FireServer(ChoosePlayer.TextBox.Text, v5)
	InventoryFrame.ConfirmFrame.Visible = false
	v5 = nil
end)
InventoryFrame.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 593 | Upvalues: InventoryFrame (copy), v5 (ref) ]]
	InventoryFrame.ConfirmFrame.Visible = false
	v5 = nil
end)
InventoryFrame.DeleteFrame.Confirm.MouseButton1Click:Connect(function() --[[ Line: 597 | Upvalues: InventoryFrame (copy), v5 (ref) ]]
	local CurrentDelete = InventoryFrame.CurrentDelete.Value
	if not CurrentDelete then
		return
	end
	if tonumber(InventoryFrame.DeleteFrame.Enter.TextBox.Text) then
		local t = {
			Attributes = CurrentDelete:GetAttributes()
		}
		t.Amount = tonumber(InventoryFrame.DeleteFrame.Enter.TextBox.Text)
		v5 = t
		InventoryFrame.CurrentDelete.Value = nil
		InventoryFrame.ConfirmFrame.Visible = true
		InventoryFrame.DeleteFrame.Visible = false
	end
end)
InventoryFrame.DeleteFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 608 | Upvalues: InventoryFrame (copy) ]]
	InventoryFrame.CurrentDelete.Value = nil
	InventoryFrame.DeleteFrame.Visible = false
end)
GetTradingPlaza.OnClientEvent:Connect(function(p1) --[[ Line: 613 | Upvalues: InventoryFrame (copy), ChoosePlayer (copy), Towers (copy), Items (copy), Presents (copy), ReplicatedStorage (copy), Rarities (copy), Tween (copy) ]]
	if not p1 or (typeof(p1) ~= "table" or #p1 == 0) then
		return
	end
	InventoryFrame.TextLabel.Text = "Viewing Marketplace"
	ChoosePlayer.Visible = false
	for v1, v2 in InventoryFrame.Items:GetChildren() do
		if v2:IsA("ImageButton") then
			v2:Destroy()
		end
	end
	for v5, v6 in p1 do
		local v3, v4
		if v6.Type and v6.Name then
			if v6.Type == "Unit" then
				local v7, v8, v9, v10, v11, v12, v13, v14, v15
				if v6.Shiny then
					if not v6.Stats then
						v7 = v6.Enchant
						v8 = if v7 and typeof(v7) == "string" then if v7 and #v7 > 1 then true else false else false
						if v8 and not v6.Shiny then
							v9 = InventoryFrame.Items:FindFirstChild(v6.Enchant .. v6.Name)
							if v9 then
								v9:SetAttribute("Owned", v9:GetAttribute("Owned") + 1)
								v9.Info.Text = ("x%*"):format((v9:GetAttribute("Owned")))
								v9.Info.Visible = true
								continue
							end
						end
						v10 = v6.Enchant
						v11 = if v10 and typeof(v10) == "string" then if v10 and #v10 > 1 then true else false else false
						if v11 and v6.Shiny then
							v12 = InventoryFrame.Items:FindFirstChild("Shiny" .. v6.Enchant .. v6.Name)
							if v12 and v12.Shiny.Visible then
								v12:SetAttribute("Owned", v12:GetAttribute("Owned") + 1)
								v12.Info.Text = ("x%*"):format((v12:GetAttribute("Owned")))
								v12.Info.Visible = true
								continue
							end
						end
						v13 = v6.Enchant
						v14 = if v13 and typeof(v13) == "string" then if v13 and #v13 > 1 then true else false else false
						if not v14 and v6.Shiny then
							v15 = InventoryFrame.Items:FindFirstChild("Shiny" .. v6.Name)
							if v15 and v15.Shiny.Visible then
								v15:SetAttribute("Owned", v15:GetAttribute("Owned") + 1)
								v15.Info.Text = ("x%*"):format((v15:GetAttribute("Owned")))
								v15.Info.Visible = true
								continue
							end
						end
					end
				else
					local Enchant = v6.Enchant
					if (if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false) or v6.Stats then
						if not v6.Stats then
							v7 = v6.Enchant
							v8 = if v7 and typeof(v7) == "string" then if v7 and #v7 > 1 then true else false else false
							if v8 and not v6.Shiny then
								v9 = InventoryFrame.Items:FindFirstChild(v6.Enchant .. v6.Name)
								if v9 then
									v9:SetAttribute("Owned", v9:GetAttribute("Owned") + 1)
									v9.Info.Text = ("x%*"):format((v9:GetAttribute("Owned")))
									v9.Info.Visible = true
									continue
								end
							end
							v10 = v6.Enchant
							v11 = if v10 and typeof(v10) == "string" then if v10 and #v10 > 1 then true else false else false
							if v11 and v6.Shiny then
								v12 = InventoryFrame.Items:FindFirstChild("Shiny" .. v6.Enchant .. v6.Name)
								if v12 and v12.Shiny.Visible then
									v12:SetAttribute("Owned", v12:GetAttribute("Owned") + 1)
									v12.Info.Text = ("x%*"):format((v12:GetAttribute("Owned")))
									v12.Info.Visible = true
									continue
								end
							end
							v13 = v6.Enchant
							v14 = if v13 and typeof(v13) == "string" then if v13 and #v13 > 1 then true else false else false
							if not v14 and v6.Shiny then
								v15 = InventoryFrame.Items:FindFirstChild("Shiny" .. v6.Name)
								if v15 and v15.Shiny.Visible then
									v15:SetAttribute("Owned", v15:GetAttribute("Owned") + 1)
									v15.Info.Text = ("x%*"):format((v15:GetAttribute("Owned")))
									v15.Info.Visible = true
									continue
								end
							end
						end
					else
						local v17 = InventoryFrame.Items:FindFirstChild(v6.Name)
						if v17 and not v17.Shiny.Visible then
							v17:SetAttribute("Owned", v17:GetAttribute("Owned") + 1)
							v17.Info.Text = ("x%*"):format((v17:GetAttribute("Owned")))
							v17.Info.Visible = true
							continue
						end
					end
				end
			end
			if v6.Type == "Unit" or not (v6.Amount <= 0) then
				local v18 = if v6.Type == "Unit" then Towers.Towers[v6.Name] elseif v6.Type == "Item" then Items[v6.Name] elseif v6.Type == "Present" then Presents.Presents[v6.Name] else nil
				if v18 then
					v3 = if v6.Shiny then ReplicatedStorage.Gradients.Shiny.Color elseif v18.Rarity and ReplicatedStorage.Gradients:FindFirstChild(v18.Rarity) then ReplicatedStorage.Gradients[v18.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
					local v19 = script.InventorySample:Clone()
					local Rarity = v18.Rarity
					v19.LayoutOrder = 10 - (table.find(Rarities, Rarity) and table.find(Rarities, Rarity) or 0)
					v19.BorderImage.TowerImage.Image = v18.Image or ""
					v19.BorderImage.UIGradient.Color = v3
					v19.Frame.UIGradient.Color = v3
					v19.Info.Text = "x1"
					v19.Price.Visible = true
					v19.Price.Text = v6.Price
					v19.SoulsImage.Visible = true
					v19:SetAttribute("Owned", 1)
					v19:SetAttribute("Type", v6.Type)
					v19:SetAttribute("Name", v6.Name)
					v19:SetAttribute("Shiny", v6.Shiny)
					if v6.Type == "Unit" then
						local Enchant = v6.Enchant
						if (if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false) and not v6.Shiny then
							v4 = v6.Enchant .. v6.Name
						else
							local Enchant_2 = v6.Enchant
							v4 = if (if Enchant_2 and typeof(Enchant_2) == "string" then if Enchant_2 and #Enchant_2 > 1 then true else false else false) and v6.Shiny then "Shiny" .. v6.Enchant .. v6.Name elseif v6.Shiny then "Shiny" .. v6.Name else v6.Name
						end
						v19.Name = v4
						local Enchant_2 = v6.Enchant
						local v23 = if Enchant_2 and typeof(Enchant_2) == "string" then if Enchant_2 and #Enchant_2 > 1 then true else false else false
						if v23 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v6.Enchant) then
							ReplicatedStorage.Objects.Enchants[v6.Enchant]:Clone().Parent = v19
						end
						v19.Shiny.Visible = if v6.Shiny then true else false
					else
						v19.Name = v6.Name
						v19.Shiny.Visible = false
						v19.Info.Text = ("x%*"):format(v6.Amount)
						v19:SetAttribute("Owned", v6.Amount)
					end
					v19.Parent = InventoryFrame.Items
					v19.Visible = true
					Tween:AddButton(v19, nil, nil, nil, true)
				end
			end
		end
	end
	InventoryFrame.Visible = true
end)
local v7 = nil
local v8 = nil
function addInfo(p1, p2, p3) --[[ addInfo | Line: 716 | Upvalues: ItemInfo (copy), v8 (ref), UserInputService (copy), v1 (copy), Towers (copy), Items (copy), Presents (copy), ReplicatedStorage (copy), v7 (ref) ]]
	if ItemInfo.Visible and v8 == p1 then
		ItemInfo.Visible = false
		return
	end
	v8 = p1
	if UserInputService.MouseEnabled then
		local v12 = (Vector2.new(v1.X, v1.Y) - ItemInfo.Parent.AbsolutePosition) / ItemInfo.Parent.AbsoluteSize
		ItemInfo.Position = UDim2.fromScale(v12.X, v12.Y)
	else
		local v2 = UDim2.new(0, p1.AbsolutePosition.X, 0, p1.AbsolutePosition.Y, 0)
		ItemInfo.Position = if p1 then v2 - UDim2.new(0, ItemInfo.Parent.AbsolutePosition.X, 0, ItemInfo.Parent.AbsolutePosition.Y) else ItemInfo.Parent.Position
	end
	ItemInfo.Visible = true
	local v5 = nil
	v5 = p1.Parent:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 730 | Upvalues: ItemInfo (ref), v5 (ref) ]]
		ItemInfo.Visible = false
		v5:Disconnect()
	end)
	local v6 = if Towers.Towers[p2] then Towers.Towers[p2] elseif Items[p2] then Items[p2] elseif Presents.Presents[p2] then Presents.Presents[p2] else nil
	local v72 = if v6 and v6.Rarity then v6.Rarity else "Common"
	ItemInfo.Holder.Rarity.Text = v72
	ItemInfo.Holder.Rarity:ClearAllChildren()
	ReplicatedStorage.Gradients[v72]:Clone().Parent = ItemInfo.Holder.Rarity
	local ItemName = ItemInfo.Holder.ItemName
	ItemName.Text = if v6 and v6.Name then v6.Name else p2
	local Description = ItemInfo.Holder.Description
	Description.Text = if v6 and v6.Description then v6.Description elseif Presents.Presents[p2] then "A present" elseif Towers.Towers[p2] then "A tower" else "N/A"
	if p3 and (typeof(p3) == "table" and p3.Stats) then
		v7 = p3.Stats
		ItemInfo.Stats.Visible = true
	else
		ItemInfo.Stats.Visible = false
	end
end
View.Main.ItemInfo.Stats.MouseButton1Click:Connect(function() --[[ Line: 754 | Upvalues: v7 (ref), View (copy), StatRerolls (copy) ]]
	if not v7 then
		return
	end
	View.Main.ItemInfo.StatFrame.Visible = not View.Main.ItemInfo.StatFrame.Visible
	local Holder = View.Main.ItemInfo.StatFrame.Holder
	for k, v in pairs({ "Damage", "Range", "Cooldown" }) do
		local v1 = StatRerolls.GetLetterStats(v, v7[v], true)
		Holder[v .. "Letter"].TextLabel.Text = v1.Letter
		Holder[v .. "Show"].TextLabel.Text = v1.Value
		if Holder[v .. "Letter"]:FindFirstChild("ImageLabel") then
			Holder[v .. "Letter"].ImageLabel:Destroy()
		end
		if v1.Image then
			Holder[v .. "Letter"].TextLabel.Text = ""
			local ImageLabel = Instance.new("ImageLabel", Holder[v .. "Letter"])
			ImageLabel.Size = UDim2.new(1, 0, 1, 0)
			ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.Image = v1.Image
			ImageLabel.ScaleType = Enum.ScaleType.Fit
		end
		if v1.Gradient then
			Holder[v .. "Letter"].Rare.Color = v1.Gradient
			Holder[v .. "Letter"].Frame.Rare.Color = v1.Gradient
			Holder[v .. "Letter"].TextLabel.Rare.Color = v1.Gradient
			Holder[v .. "Show"].Rare.Color = v1.Gradient
			Holder[v .. "Show"].Frame.Rare.Color = v1.Gradient
			Holder[v .. "Show"].TextLabel.Rare.Color = v1.Gradient
		end
	end
end)
function updateItems(p1, p2) --[[ updateItems | Line: 788 | Upvalues: View (copy), Towers (copy), Items (copy), Presents (copy), ReplicatedStorage (copy), Tween (copy) ]]
	local v1 = if p1 then View.Main.Items2 else View.Main.Items1
	for k, v in pairs(v1:GetChildren()) do
		if (v:IsA("Frame") or v:IsA("ImageButton")) and (v.Name ~= "Example" and not p2[v.Name]) then
			v:Destroy()
		end
	end
	for k, v in pairs(p2) do
		local v2, v3, v4, v5, v6
		if v1:FindFirstChild(k) then
			v2 = if typeof(v) == "table" and v.Amount then v.Amount else v
			v1[k].Amount.Text = "x" .. v2
			continue
		end
		v3 = if typeof(v) == "table" and v.Name then v.Name else k
		local v8 = v1.Example:Clone()
		v8.Name = k
		v4 = if typeof(v) == "table" and v.Amount then v.Amount else v
		v8.Amount.Text = "x" .. v4
		v5 = if typeof(v) == "table" and Towers.Towers[v3] then Towers.Towers[v3].Image elseif Items[v3] and Items[v3].Image then Items[v3].Image elseif Presents.Presents[v3] and Presents.Presents[v3].Image then Presents.Presents[v3].Image else ""
		v8.BorderImage.TowerImage.Image = v5
		v6 = if typeof(v) == "table" and v.Shiny then "Shiny" elseif Items[v3] and Items[v3].Rarity then Items[v3].Rarity elseif Towers.Towers[v3] and Towers.Towers[v3].Rarity then Towers.Towers[v3].Rarity elseif Presents.Presents[v3] and Presents.Presents[v3].Rarity then Presents.Presents[v3].Rarity else "Common"
		v8.BorderImage.UIGradient.Color = if ReplicatedStorage.Gradients:FindFirstChild(v6) then ReplicatedStorage.Gradients[v6].Color else ReplicatedStorage.Gradients.Common.Color
		if typeof(v) == "table" then
			local Enchant = v.Enchant
			local v11 = if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false
			if v11 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v.Enchant) then
				ReplicatedStorage.Objects.Enchants[v.Enchant]:Clone().Parent = v8
			end
		end
		if Towers.Towers[v3] then
			v8.Price.Visible = true
			v8.Price.Info.Text = "$" .. Towers.Towers[v3].PlacePrice
		else
			v8.Price.Visible = false
		end
		v8.Visible = true
		v8.Parent = v1
		Tween:AddButton(v8, nil, nil, nil, true)
		v8.MouseButton1Click:Connect(function() --[[ Line: 830 | Upvalues: v8 (copy), v3 (copy), v (copy) ]]
			addInfo(v8, v3, v)
		end)
	end
end
local v9 = 0
local v10 = nil
function viewTrade(p1) --[[ viewTrade | Line: 839 | Upvalues: t (ref), Tween (copy), Pages (copy), View (copy), v9 (ref), v10 (ref), ChoosePlayer (copy), TradeHistory (copy) ]]
	local v1 = nil
	for k, v in pairs(t) do
		if v.ID == p1 then
			v1 = v
		end
	end
	if not v1 then
		Tween:AddButton("Open", Pages)
	else
		Tween:AddButton("Open", View)
		v9 = v9 + 1
		if v9 >= 5 or v10 ~= ChoosePlayer.TextBox.Text then
			v10 = ChoosePlayer.TextBox.Text
			v9 = 0
			View.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TradeHistory:FireServer(ChoosePlayer.TextBox.Text, "CheckBan2")
		end
		updateItems(false, v1.Items1)
		updateItems(true, v1.Items2)
		View.OtherPlayerName.Text = v1.OtherPlayer
		local v2 = nil
		pcall(function() --[[ Line: 863 | Upvalues: v2 (ref), v1 (ref) ]]
			v2 = game.Players:GetUserIdFromNameAsync(v1.OtherPlayer)
		end)
		if v2 then
			TradeHistory:FireServer(v2, "CheckBan")
		end
		View.OtherPlayerBoth.Text = if v2 then v1.OtherPlayer .. " - " .. v2 else v1.OtherPlayer .. " - N/A"
	end
end
View.Exit.MouseButton1Click:Connect(function() --[[ Line: 875 | Upvalues: Tween (copy), Pages (copy) ]]
	Tween:AddButton("Open", Pages)
end)
function updatePages() --[[ updatePages | Line: 879 | Upvalues: Pages (copy), v3 (ref) ]]
	local count = 0
	for k, v in pairs(Pages.Pages:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "ExamplePage" then
			count = count + 1
			if v.Name == "Page" .. v3 then
				v.Visible = true
				continue
			end
			v.Visible = false
		end
	end
	Pages.Page.Text = "(" .. v3 .. "/" .. count .. ")"
end
Pages.Exit.MouseButton1Click:Connect(function() --[[ Line: 893 | Upvalues: Pages (copy) ]]
	for k, v in pairs(Pages.Pages:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "ExamplePage" then
			v:Destroy()
		end
	end
	Pages.Page.Text = "(0/0)"
end)
Pages.Next.MouseButton1Click:Connect(function() --[[ Line: 901 | Upvalues: Pages (copy), v3 (ref) ]]
	local count = 0
	for k, v in pairs(Pages.Pages:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "ExamplePage" then
			count = count + 1
		end
	end
	v3 = if count <= v3 then 1 else v3 + 1
	updatePages()
end)
Pages.Previous.MouseButton1Click:Connect(function() --[[ Line: 914 | Upvalues: Pages (copy), v3 (ref) ]]
	local count = 0
	for k, v in pairs(Pages.Pages:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "ExamplePage" then
			count = count + 1
		end
	end
	v3 = if v3 <= 1 then count else v3 - 1
	updatePages()
end)
ChoosePlayer.View.MouseButton1Click:Connect(function() --[[ Line: 928 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), TradeHistory (copy) ]]
	if table.find(Misc.TradeHistory, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		TradeHistory:FireServer(ChoosePlayer.TextBox.Text)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ChoosePlayer.View2.MouseButton1Click:Connect(function() --[[ Line: 941 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), PurchaseHistory (copy) ]]
	if table.find(Misc.PurchaseHistory, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		PurchaseHistory:FireServer(ChoosePlayer.TextBox.Text)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ChoosePlayer.View3.MouseButton1Click:Connect(function() --[[ Line: 954 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), MarketHistory (copy) ]]
	if table.find(Misc.MarketHistory, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		MarketHistory:FireServer(ChoosePlayer.TextBox.Text)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ChoosePlayer.View4.MouseButton1Click:Connect(function() --[[ Line: 967 | Upvalues: ChoosePlayer (copy) ]]
	local v1 = nil
	pcall(function() --[[ Line: 969 | Upvalues: v1 (ref), ChoosePlayer (ref) ]]
		v1 = game.Players:GetUserIdFromNameAsync(ChoosePlayer.TextBox.Text)
	end)
	if v1 then
		ChoosePlayer.TextBox.Text = v1
	else
		local v2 = nil
		pcall(function() --[[ Line: 975 | Upvalues: v2 (ref), ChoosePlayer (ref) ]]
			v2 = game.Players:GetNameFromUserIdAsync(ChoosePlayer.TextBox.Text)
		end)
		if v2 then
			ChoosePlayer.TextBox.Text = v2
		end
	end
end)
ChoosePlayer.View5.MouseButton1Click:Connect(function() --[[ Line: 981 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), Tween (copy) ]]
	if table.find(Misc.CanGiveClanWins, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		Tween:AddButton("Open", script.Parent.GiveClanWins)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ChoosePlayer.View6.MouseButton1Click:Connect(function() --[[ Line: 994 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy) ]]
	if table.find(Misc.CanGiveItems, LocalPlayer.UserId) or table.find(Misc.TestingGiveWins, LocalPlayer.UserId) and game.PlaceId == 17770150441 or game:GetService("RunService"):IsStudio() then
		script.Parent.GiveWins.Visible = true
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ChoosePlayer.View7.MouseButton1Click:Connect(function() --[[ Line: 1007 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), Tween (copy), ToGive (copy) ]]
	if table.find(Misc.CanGiveItems, LocalPlayer.UserId) or table.find(Misc.TestingInventory, LocalPlayer.UserId) and game.PlaceId == 17770150441 or game:GetService("RunService"):IsStudio() then
		ChoosePlayer.Visible = false
		Tween:AddButton("Open", ToGive)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ChoosePlayer.View8.MouseButton1Click:Connect(function() --[[ Line: 1021 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), ViewItems (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		ViewItems:FireServer(ChoosePlayer.TextBox.Text)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ChoosePlayer.View9.MouseButton1Click:Connect(function() --[[ Line: 1034 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), Tween (copy), MiscLogs_2 (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		Tween:AddButton("Close", ChoosePlayer)
		MiscLogs_2.Visible = true
		local v1 = "N/A"
		pcall(function() --[[ Line: 1047 | Upvalues: v1 (ref), ChoosePlayer (ref) ]]
			v1 = game.Players:GetNameFromUserIdAsync(ChoosePlayer.TextBox.Text)
		end)
		MiscLogs_2.Choose.Viewing.Text = "Viewing: " .. v1 .. " (" .. ChoosePlayer.TextBox.Text .. ")"
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ChoosePlayer.View10.MouseButton1Click:Connect(function() --[[ Line: 1053 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), DeleteClanByID (copy) ]]
	if table.find(Misc.CanDeleteClan, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		DeleteClanByID:FireServer(ChoosePlayer.TextBox.Text)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ChoosePlayer.View11.MouseButton1Click:Connect(function() --[[ Line: 1066 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), ReplicatedStorage (copy), GetClanIdByName (copy) ]]
	if not (table.find(Misc.CanDeleteClan, LocalPlayer.UserId) or (table.find(Misc.CanGiveClanWins, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio())) then
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
		return
	end
	ReplicatedStorage.Remotes.Misc.Alert.Bindable:Fire("Please wait.")
	local v1 = GetClanIdByName:InvokeServer(ChoosePlayer.TextBox.Text)
	if v1 then
		ChoosePlayer.TextBox.Text = v1
	else
		ReplicatedStorage.Remotes.Misc.Alert.Bindable:Fire("Failed, try again later.")
	end
end)
ChoosePlayer.View12.MouseButton1Click:Connect(function() --[[ Line: 1082 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), GetTradingPlaza (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		GetTradingPlaza:FireServer(ChoosePlayer.TextBox.Text)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ChoosePlayer.View13.MouseButton1Click:Connect(function() --[[ Line: 1095 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), BanLogsRemote (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		BanLogsRemote:FireServer(ChoosePlayer.TextBox.Text)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
BanLogsRemote.OnClientEvent:Connect(function(p1, p2) --[[ Line: 1108 | Upvalues: ChoosePlayer (copy), Tween (copy), BanLogs (copy) ]]
	local Text = ChoosePlayer.TextBox.Text
	pcall(function() --[[ Line: 1110 | Upvalues: Text (ref), ChoosePlayer (ref) ]]
		Text = game.Players:GetNameFromUserIdAsync(ChoosePlayer.TextBox.Text) .. (" (%*)"):format(ChoosePlayer.TextBox.Text)
	end)
	Tween:AddButton("Open", BanLogs)
	if p1 then
		if typeof(p2) == "table" then
			BanLogs.Logged.Visible = true
			BanLogs.NotLogged.Visible = false
			BanLogs.Logged.Viewing.Text = Text .. " is banned"
			BanLogs.Logged.Viewing.TextColor3 = Color3.fromRGB(255, 30, 34)
			local v1 = ""
			pcall(function() --[[ Line: 1135 | Upvalues: v1 (ref), p2 (copy) ]]
				v1 = game.Players:GetNameFromUserIdAsync(p2.Moderator)
			end)
			BanLogs.Logged.Moderator.Text = "Moderator - " .. v1 .. (" (%*)"):format(p2.Moderator)
			BanLogs.Logged.Reason.Text = "Reason: " .. p2.Reason
			BanLogs.Logged.FakeReason.Text = "Fake Reason: " .. (if p2.FakeReason then p2.FakeReason else "N/A")
			BanLogs.Logged.Time.Text = convertToHMS(os.time() - p2.Time) .. " ago"
		else
			BanLogs.Logged.Visible = false
			BanLogs.NotLogged.Visible = true
			BanLogs.NotLogged.Viewing.Text = Text .. " is banned"
			BanLogs.NotLogged.Viewing.TextColor3 = Color3.fromRGB(255, 30, 34)
		end
	else
		BanLogs.Logged.Visible = true
		BanLogs.NotLogged.Visible = false
		BanLogs.Logged.Viewing.Text = Text .. " is not banned"
		BanLogs.Logged.Viewing.TextColor3 = Color3.fromRGB(94, 255, 76)
		BanLogs.Logged.Moderator.Text = "Moderator - N/A"
		BanLogs.Logged.Reason.Text = "Reason: N/A"
		BanLogs.Logged.FakeReason.Text = "Fake Reason: N/A"
		BanLogs.Logged.Time.Text = "N/A ago"
	end
end)
BanLogs.Exit.MouseButton1Click:Connect(function() --[[ Line: 1151 | Upvalues: Tween (copy), ChoosePlayer (copy) ]]
	Tween:AddButton("Open", ChoosePlayer)
end)
Ban_2.Unban.MouseButton1Click:Connect(function() --[[ Line: 1155 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), Ban (copy), Ban_2 (copy) ]]
	if table.find(Misc.CanBan, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		Ban:FireServer("Unban", Ban_2.TextBox.Text, Ban_2.Reason.Text, Ban_2.Reason2.Text)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
Ban_2.Ban.MouseButton1Click:Connect(function() --[[ Line: 1167 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), Ban (copy), Ban_2 (copy), Tween (copy), v2 (copy) ]]
	if table.find(Misc.CanBan, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		Ban:FireServer("BanAmount", Ban_2.TextBox.Text)
		Tween:AddButton("Open", v2.BanLength)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
v2.BanLength.Back.MouseButton1Click:Connect(function() --[[ Line: 1182 | Upvalues: Tween (copy), Ban_2 (copy) ]]
	Tween:AddButton("Open", Ban_2)
end)
v2.InventoryClear.Back.MouseButton1Click:Connect(function() --[[ Line: 1185 | Upvalues: Tween (copy), v2 (copy) ]]
	Tween:AddButton("Open", v2.BanLength)
end)
v2.AutoClearLength.Back.MouseButton1Click:Connect(function() --[[ Line: 1188 | Upvalues: Tween (copy), v2 (copy) ]]
	Tween:AddButton("Open", v2.InventoryClear)
end)
function initBanLength() --[[ initBanLength | Line: 1192 | Upvalues: v2 (copy), Tween (copy), t2 (copy) ]]
	local t = {
		Day = 86400,
		ThreeDays = 259200,
		Week = 604800,
		Permanent = 9000000000
	}
	for k, v in pairs(v2.BanLength:GetChildren()) do
		if t[v.Name] or v.Name == "Custom" then
			Tween:AddButton(v)
			v.MouseButton1Click:Connect(function() --[[ Line: 1197 | Upvalues: v (copy), t2 (ref), t (copy), v2 (ref), Tween (ref) ]]
				if v.Name == "Custom" then
					local v1 = tonumber(v2.BanLength.CustomTextBox.Text)
					if not v1 then
						game.ReplicatedStorage.Remotes.Misc.Alert.Bindable:Fire("Invalid amount of time. Only type the number of seconds to be banned.")
						return
					end
					t2.Time = v1
				else
					t2.Time = t[v.Name]
				end
				Tween:AddButton("Open", v2.InventoryClear)
			end)
		end
	end
end
function initInventoryClear() --[[ initInventoryClear | Line: 1213 | Upvalues: v2 (copy), Tween (copy), t2 (copy), Ban_2 (copy), Ban (copy) ]]
	local v1 = nil
	for k, v in pairs(v2.InventoryClear:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Back" then
			Tween:AddButton(v)
			v.MouseButton1Click:Connect(function() --[[ Line: 1218 | Upvalues: v2 (ref), v (copy), Tween (ref), t2 (ref), Ban_2 (ref), Ban (ref), v1 (ref) ]]
				if v2.InventoryClear.ConfirmFrame.Visible then
					return
				end
				if v.Name == "Auto" then
					Tween:AddButton("Open", v2.AutoClearLength)
					return
				end
				if v.Name == "Nothing" then
					t2.InventoryClear = v.Name
					Tween:AddButton("Open", Ban_2)
					Ban:FireServer("Ban", Ban_2.TextBox.Text, Ban_2.Reason.Text, Ban_2.Reason2.Text, t2)
				else
					v1 = v.Name
					v2.InventoryClear.ConfirmFrame.Visible = true
				end
			end)
		end
	end
	v2.InventoryClear.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 1235 | Upvalues: v2 (ref), t2 (ref), v1 (ref), Tween (ref), Ban_2 (ref), Ban (ref) ]]
		v2.InventoryClear.ConfirmFrame.Visible = false
		t2.InventoryClear = v1
		Tween:AddButton("Open", Ban_2)
		Ban:FireServer("Ban", Ban_2.TextBox.Text, Ban_2.Reason.Text, Ban_2.Reason2.Text, t2)
	end)
	v2.InventoryClear.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 1241 | Upvalues: v2 (ref) ]]
		v2.InventoryClear.ConfirmFrame.Visible = false
	end)
end
function initAutoClearLength() --[[ initAutoClearLength | Line: 1246 | Upvalues: v2 (copy), Tween (copy), t2 (copy), Ban_2 (copy), Ban (copy) ]]
	local t = {
		Day = 86400,
		ThreeDays = 259200,
		Week = 604800,
		Month = 2592000
	}
	local v1 = nil
	for k, v in pairs(v2.AutoClearLength:GetChildren()) do
		if t[v.Name] or v.Name == "Custom" then
			Tween:AddButton(v)
			v.MouseButton1Click:Connect(function() --[[ Line: 1252 | Upvalues: v2 (ref), v1 (ref), v (copy) ]]
				if not v2.AutoClearLength.ConfirmFrame.Visible then
					v1 = v.Name
					v2.AutoClearLength.ConfirmFrame.Visible = true
				end
			end)
		end
	end
	v2.AutoClearLength.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 1259 | Upvalues: v1 (ref), v2 (ref), t (copy), t2 (ref), Tween (ref), Ban_2 (ref), Ban (ref) ]]
		local v12 = if v1 == "Custom" then tonumber(v2.AutoClearLength.CustomTextBox.Text) else t[v1]
		if v1 == "Custom" and not v12 then
			return
		end
		v2.AutoClearLength.ConfirmFrame.Visible = false
		t2.InventoryClear = { "Auto", v12 }
		Tween:AddButton("Open", Ban_2)
		Ban:FireServer("Ban", Ban_2.TextBox.Text, Ban_2.Reason.Text, Ban_2.Reason2.Text, t2)
	end)
	v2.AutoClearLength.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 1267 | Upvalues: v2 (ref) ]]
		v2.AutoClearLength.ConfirmFrame.Visible = false
	end)
end
Ban.OnClientEvent:Connect(function(p1, p2) --[[ Line: 1272 | Upvalues: Ban_2 (copy), v2 (copy) ]]
	if p1 == "Success" then
		Ban_2.TextBox.Text = ""
		Ban_2.TextBox.PlaceholderText = "SUCCESS!"
		Ban_2.TextBox.PlaceholderColor3 = Color3.fromRGB(55, 255, 52)
		task.wait(1)
		Ban_2.TextBox.PlaceholderText = ""
		Ban_2.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
		return
	end
	if p1 == "Error" then
		Ban_2.TextBox.Text = ""
		Ban_2.TextBox.PlaceholderText = "ERROR!"
		Ban_2.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 23, 27)
		task.wait(1)
		Ban_2.TextBox.PlaceholderText = ""
		Ban_2.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
		return
	end
	if p1 == "Already" then
		Ban_2.TextBox.Text = ""
		Ban_2.TextBox.PlaceholderText = "ALREADY BANNED!"
		Ban_2.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 23, 27)
		task.wait(1)
		Ban_2.TextBox.PlaceholderText = ""
		Ban_2.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
		return
	end
	if p1 ~= "BanAmount" then
		return
	end
	v2.BanLength.BanAmount.Text = "Banned " .. p2 .. " times"
end)
ChoosePlayer.View14.MouseButton1Click:Connect(function() --[[ Line: 1299 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), ModLogs (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		ModLogs.Visible = true
		local v1 = "N/A"
		pcall(function() --[[ Line: 1311 | Upvalues: v1 (ref), ChoosePlayer (ref) ]]
			v1 = game.Players:GetNameFromUserIdAsync(ChoosePlayer.TextBox.Text)
		end)
		ModLogs.Choose.Viewing.Text = "Viewing: " .. v1 .. " (" .. ChoosePlayer.TextBox.Text .. ")"
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ModLogs.Exit.MouseButton1Click:Connect(function() --[[ Line: 1317 | Upvalues: ModLogs (copy), Tween (copy), ChoosePlayer (copy) ]]
	ModLogs.Visible = false
	Tween:AddButton("Open", ChoosePlayer)
end)
ModLogs.Choose.Choose1.MouseButton1Click:Connect(function() --[[ Line: 1321 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), ReplicatedStorage (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		ReplicatedStorage.Remotes.Misc.ModLogs:FireServer(ChoosePlayer.TextBox.Text, true)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
ModLogs.Choose.Choose2.MouseButton1Click:Connect(function() --[[ Line: 1333 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), ReplicatedStorage (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		ReplicatedStorage.Remotes.Misc.ModLogs:FireServer(ChoosePlayer.TextBox.Text, false)
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
Pages2.Exit.Activated:Connect(function() --[[ Line: 1346 | Upvalues: Pages2 (copy) ]]
	Pages2.Visible = false
end)
InventoryFrame.Exit.Activated:Connect(function() --[[ Line: 1350 | Upvalues: InventoryFrame (copy), ChoosePlayer (copy) ]]
	InventoryFrame.Visible = false
	ChoosePlayer.Visible = true
end)
ToGive.Give.Activated:Connect(function() --[[ Line: 1355 | Upvalues: Tween (copy), ToGive (copy), GiveItems (copy), ChoosePlayer (copy) ]]
	Tween:AddButton("Close", ToGive)
	if #tostring(ToGive.TextBox.Text) <= 1 then
		return
	end
	if tonumber(ToGive.TextBox2.Text) then
		local t = {}
		t.User = tostring(ChoosePlayer.TextBox.Text)
		t.Name = tostring(ToGive.TextBox.Text)
		t.Amount = tonumber(ToGive.TextBox2.Text)
		t.Enchant = tostring(ToGive.TextBox3.Text)
		t.DamageLetter = tostring(ToGive.StatsFrame.Damage.Text)
		t.RangeLetter = tostring(ToGive.StatsFrame.Range.Text)
		t.CooldownLetter = tostring(ToGive.StatsFrame.Cooldown.Text)
		GiveItems:FireServer(t)
	end
end)
ToGive.Exit.Activated:Connect(function() --[[ Line: 1374 | Upvalues: Tween (copy), ToGive (copy), ChoosePlayer (copy) ]]
	Tween:AddButton("Close", ToGive)
	ChoosePlayer.Visible = true
end)
InventoryFrame.Search.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 1379 | Upvalues: InventoryFrame (copy) ]]
	if not InventoryFrame.Visible then
		return
	end
	local v1 = InventoryFrame.Search.TextBox.Text:lower()
	local v2 = v1:match("shiny") ~= nil
	local v3 = if v1:match("item") == nil then false else true
	local v4 = if v1:match("present") == nil then false else true
	local v5 = if v1:match("unit") == nil then false else true
	for v6, v7 in InventoryFrame.Items:GetChildren() do
		if v7:IsA("ImageButton") then
			v7.Visible = false
			if v5 then
				if v7:GetAttribute("Type") == "Unit" then
					local _, v8 = v1:find("unit ")
					if v8 then
						v1 = v1:sub(v8 + 1, #v1)
					end
					v7.Visible = true
					if v7:GetAttribute("Name"):lower():match(v1) then
						v7.Visible = true
					end
				end
			elseif v3 then
				if v7:GetAttribute("Type") == "Item" then
					local _, v10 = v1:find("item ")
					if v10 then
						v1 = v1:sub(v10 + 1, #v1)
					end
					v7.Visible = true
					if v7:GetAttribute("Name"):lower():match(v1) then
						v7.Visible = true
					end
				end
			elseif v4 then
				if v7:GetAttribute("Type") == "Present" then
					local _, v12 = v1:find("present ")
					if v12 then
						v1 = v1:sub(v12 + 1, #v1)
					end
					v7.Visible = true
					if v7:GetAttribute("Name"):lower():match(v1) then
						v7.Visible = true
					end
				end
			elseif v2 then
				if v7:GetAttribute("Shiny") then
					if #InventoryFrame.Search.TextBox.Text == 5 then
						v7.Visible = true
						continue
					end
					local _, v14 = v1:find("shiny ")
					if v14 then
						v1 = v1:sub(v14 + 1, #v1)
					end
					if v7:GetAttribute("Name"):lower():match(v1) then
						v7.Visible = true
					end
				end
			elseif v7:GetAttribute("Name"):lower():match(v1) then
				v7.Visible = true
			end
		end
	end
end)
script.Parent.GiveWins.Exit.MouseButton1Click:Connect(function() --[[ Line: 1449 ]]
	script.Parent.GiveWins.Visible = false
end)
script.Parent.GiveWins.Give.MouseButton1Click:Connect(function() --[[ Line: 1453 | Upvalues: GiveWins (copy), ChoosePlayer (copy) ]]
	GiveWins:FireServer(ChoosePlayer.TextBox.Text, script.Parent.GiveWins.TextBox.Text)
end)
script.Parent.GiveClanWins.Give.MouseButton1Click:Connect(function() --[[ Line: 1457 | Upvalues: GiveClanWins (copy), ChoosePlayer (copy) ]]
	GiveClanWins:FireServer(ChoosePlayer.TextBox.Text, script.Parent.GiveClanWins.TextBox.Text)
end)
MiscLogs_2.Exit.MouseButton1Click:Connect(function() --[[ Line: 1461 | Upvalues: MiscLogs_2 (copy), Tween (copy), ChoosePlayer (copy) ]]
	MiscLogs_2.Visible = false
	Tween:AddButton("Open", ChoosePlayer)
end)
MiscLogs_2.Choose.Choose1.MouseButton1Click:Connect(function() --[[ Line: 1466 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), MiscLogs (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		MiscLogs:FireServer(ChoosePlayer.TextBox.Text, "Summon")
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
MiscLogs_2.Choose.Choose2.MouseButton1Click:Connect(function() --[[ Line: 1478 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), MiscLogs (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		MiscLogs:FireServer(ChoosePlayer.TextBox.Text, "Delete")
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
MiscLogs_2.Choose.Choose3.MouseButton1Click:Connect(function() --[[ Line: 1490 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), MiscLogs (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		MiscLogs:FireServer(ChoosePlayer.TextBox.Text, "Present")
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
MiscLogs_2.Choose.Choose4.MouseButton1Click:Connect(function() --[[ Line: 1502 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), MiscLogs (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		MiscLogs:FireServer(ChoosePlayer.TextBox.Text, "Evolution")
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
MiscLogs_2.Choose.Choose5.MouseButton1Click:Connect(function() --[[ Line: 1514 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), MiscLogs (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		MiscLogs:FireServer(ChoosePlayer.TextBox.Text, "Item")
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
MiscLogs_2.Choose.Choose6.MouseButton1Click:Connect(function() --[[ Line: 1526 | Upvalues: Misc (copy), LocalPlayer (copy), ChoosePlayer (copy), MiscLogs (copy) ]]
	if table.find(Misc.CanViewItems, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
		MiscLogs:FireServer(ChoosePlayer.TextBox.Text, "Auction")
	else
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "PERMISSION DENIED!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	end
end)
function miscLogs(p1, p2, p3) --[[ miscLogs | Line: 1539 | Upvalues: MiscLogs_2 (copy), v4 (ref), ChoosePlayer (copy), v3 (ref), t (ref), clear (copy), Pages (copy), Tween (copy) ]]
	MiscLogs_2.Visible = false
	v4 = p1
	if typeof(p2) == "string" then
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "ERROR!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
		return
	end
	v3 = 1
	if not p3 then
		t = {}
		for k, v in pairs(p2) do
			table.insert(t, {
				ID = k,
				Time = v.Time,
				Message = v.Message
			})
		end
		table.sort(t, function(p1, p2) --[[ Line: 1559 ]]
			return p1.Time > p2.Time
		end)
	end
	clear()
	local count = 0
	for k, v in pairs(if p3 then p2 else t) do
		count = count + 1
		local v32 = math.ceil(count / 5)
		local v42 = Pages.Pages:FindFirstChild("Page" .. v32)
		if not v42 then
			local v5 = Pages.Pages.ExamplePage:Clone()
			v5.Name = "Page" .. v32
			v5.Parent = Pages.Pages
			v42 = v5
		end
		local v6 = v42.Example3:Clone()
		v6.Name = v.ID
		v6.LayoutOrder = count
		v6.Time.Text = convertToHMS(os.time() - v.Time) .. " ago"
		v6.Inbox.Text = v.Message
		v6.Parent = v42
		v6.Visible = true
	end
	updatePages()
	Tween:AddButton("Open", Pages)
end
MiscLogs.OnClientEvent:Connect(miscLogs)
function modLogs(p1, p2) --[[ modLogs | Line: 1596 | Upvalues: ModLogs (copy), ChoosePlayer (copy), v3 (ref), t (ref), clear (copy), Pages (copy), Tween (copy) ]]
	ModLogs.Visible = false
	if typeof(p1) == "string" then
		ChoosePlayer.TextBox.Text = ""
		ChoosePlayer.TextBox.PlaceholderText = "ERROR!"
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 4)
		task.wait(0.8)
		ChoosePlayer.TextBox.PlaceholderText = ""
		ChoosePlayer.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
		return
	end
	v3 = 1
	if not p2 then
		t = {}
		for k, v in pairs(p1) do
			table.insert(t, {
				ID = k,
				Time = v.Time,
				Message = v.Message
			})
		end
		table.sort(t, function(p1, p2) --[[ Line: 1615 ]]
			return p1.Time > p2.Time
		end)
	end
	clear()
	local count = 0
	for k, v in pairs(if p2 then p1 else t) do
		count = count + 1
		local v32 = math.ceil(count / 5)
		local v4 = Pages.Pages:FindFirstChild("Page" .. v32)
		if not v4 then
			local v5 = Pages.Pages.ExamplePage:Clone()
			v5.Name = "Page" .. v32
			v5.Parent = Pages.Pages
			v4 = v5
		end
		local v6 = v4.Example3:Clone()
		v6.Name = v.ID
		v6.LayoutOrder = count
		v6.Time.Text = convertToHMS(os.time() - v.Time) .. " ago"
		v6.Inbox.Text = v.Message
		v6.Parent = v4
		v6.Visible = true
	end
	updatePages()
	Tween:AddButton("Open", Pages)
end
ReplicatedStorage.Remotes.Misc.ModLogs.OnClientEvent:Connect(modLogs)
Pages.Exit.MouseButton1Click:Connect(function() --[[ Line: 1651 | Upvalues: v4 (ref), Tween (copy), ChoosePlayer (copy), Pages (copy) ]]
	if v4 and (v4 == "Summon" or (v4 == "Delete" or (v4 == "Present" or (v4 == "Evolution" or v4 == "Item")))) then
		Tween:AddButton("Open", ChoosePlayer)
	else
		Tween:AddButton("Close", Pages)
	end
end)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 1659 | Upvalues: Towers (copy) ]]
	if p1 and not pcall(function() --[[ Line: 1661 | Upvalues: p1 (ref), Towers (ref) ]]
		p1 = game:GetService("HttpService"):JSONDecode(p1)
		if not p1 then
			error(0)
		end
		Towers.Towers = p1
	end) then
		warn("Failed to update Client MetaData.")
	end
end)
task.spawn(clear)
if table.find(Misc.TradeHistory, LocalPlayer.UserId) or (table.find(Misc.PurchaseHistory, LocalPlayer.UserId) or (table.find(Misc.CanGiveItems, LocalPlayer.UserId) or (table.find(Misc.CanViewItems, LocalPlayer.UserId) or table.find(Misc.TestingInventory, LocalPlayer.UserId) and game.PlaceId == 17770150441))) or game:GetService("RunService"):IsStudio() then
	TradeHistory_2.Visible = true
end
if table.find(Misc.CanBan, LocalPlayer.UserId) or game:GetService("RunService"):IsStudio() then
	Ban_3.Visible = true
end
if not (TradeHistory_2.Visible or Ban_3.Visible) then
	script:Destroy()
	return
end
initBanLength()
initInventoryClear()
initAutoClearLength()
Tween:AddButton(TradeHistory_2, ChoosePlayer)
Tween:AddButton(Ban_3, Ban_2)
Tween:AddButton(Ban_2.Exit, Ban_2)
Tween:AddButton(ChoosePlayer.Exit, ChoosePlayer)
Tween:AddButton(View.Exit)
Tween:AddButton(Pages.Exit)
Tween:AddButton(Pages.Next)
Tween:AddButton(Pages.Previous)
Tween:AddButton(ChoosePlayer.View)
Tween:AddButton(ChoosePlayer.View2)
Tween:AddButton(Ban_2.Ban)
Tween:AddButton(Ban_2.Unban)
Tween:AddButton(ChoosePlayer.View3)
Tween:AddButton(ChoosePlayer.View4)
Tween:AddButton(ChoosePlayer.View5)
Tween:AddButton(ChoosePlayer.View6)
Tween:AddButton(ChoosePlayer.View7)
Tween:AddButton(ChoosePlayer.View8)
Tween:AddButton(ChoosePlayer.View9)
Tween:AddButton(ChoosePlayer.View10)
Tween:AddButton(ChoosePlayer.View11)
Tween:AddButton(ChoosePlayer.View12)
Tween:AddButton(ChoosePlayer.View13)
Tween:AddButton(ChoosePlayer.View14)
Tween:AddButton(InventoryFrame.Exit)
Tween:AddButton(ToGive.Exit)
Tween:AddButton(ToGive.Give)
Tween:AddButton(Pages.Search.Go)
Tween:AddButton(Pages2.Search.Go)
Tween:AddButton(InventoryFrame.DeleteFrame.Confirm)
Tween:AddButton(InventoryFrame.DeleteFrame.Exit)
Tween:AddButton(InventoryFrame.ConfirmFrame.Yes)
Tween:AddButton(InventoryFrame.ConfirmFrame.No)
Tween:AddButton(script.Parent.GiveWins.Give)
Tween:AddButton(script.Parent.GiveWins.Exit)
Tween:AddButton(script.Parent.GiveClanWins.Give)
Tween:AddButton(script.Parent.GiveClanWins.Exit, script.Parent.GiveClanWins)
Tween:AddButton(MiscLogs_2.Exit)
Tween:AddButton(MiscLogs_2.Choose.Choose1)
Tween:AddButton(MiscLogs_2.Choose.Choose2)
Tween:AddButton(MiscLogs_2.Choose.Choose3)
Tween:AddButton(MiscLogs_2.Choose.Choose4)
Tween:AddButton(MiscLogs_2.Choose.Choose5)
Tween:AddButton(MiscLogs_2.Choose.Choose6)
Tween:AddButton(BanLogs.Exit)
Tween:AddButton(ModLogs.Exit)
Tween:AddButton(ModLogs.Choose.Choose1)
Tween:AddButton(ModLogs.Choose.Choose2)
Tween:AddButton(v2.BanLength.Back)
Tween:AddButton(v2.InventoryClear.Back)
Tween:AddButton(v2.AutoClearLength.Back)
Tween:AddButton(v2.InventoryClear.ConfirmFrame.Yes)
Tween:AddButton(v2.InventoryClear.ConfirmFrame.No)
Tween:AddButton(v2.AutoClearLength.ConfirmFrame.Yes)
Tween:AddButton(v2.AutoClearLength.ConfirmFrame.No)
Tween:AddButton(View.Main.ItemInfo.Stats)