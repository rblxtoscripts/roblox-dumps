-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer
local v1 = LocalPlayer:GetMouse()
local Trading = ReplicatedStorage.Remotes.Trading
local Tween = require(ReplicatedStorage.Libs.Tween)
local Items = require(ReplicatedStorage.Configs.Items)
local Towers = require(ReplicatedStorage.Configs.Towers)
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Presents = require(ReplicatedStorage.Configs.Presents)
local StatRerolls = require(ReplicatedStorage.Modules.Misc.StatRerolls)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local v2 = script.Parent
local Size = v2.Request.Size
local Size_2 = v2.Message.Size
local TradeButton = script.Parent.Parent:WaitForChild("SideDock"):WaitForChild("Container"):WaitForChild("TradeButton")
local ItemInfo = v2.TradeFrame.Main.ItemInfo
local v3 = nil
local t = {}
function Format(p1) --[[ Format | Line: 29 ]]
	return string.format("%02i", p1)
end
function convertToHMS(p1) --[[ convertToHMS | Line: 33 ]]
	local v1 = (p1 - p1 % 60) / 60
	local v2 = (v1 - v1 % 60) / 60
	local v3 = (v2 - v2 % 24) / 24
	return Format(v3) .. ":" .. Format(v2 - v3 * 24) .. ":" .. Format(v1 - v2 * 60) .. ":" .. Format(p1 - v1 * 60)
end
local function hasEnchant(p1) --[[ hasEnchant | Line: 43 ]]
	if p1 and typeof(p1) == "string" then
		return p1 and #p1 > 1 and true or false
	else
		return false
	end
end
function updatePlayerList() --[[ updatePlayerList | Line: 53 | Upvalues: v2 (copy), Players (copy), LocalPlayer (copy), Tween (copy), Trading (copy) ]]
	for k, v in pairs(v2.Players.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and (v.Name ~= "Example" and not Players:FindFirstChild(v.Name)) then
			v:Destroy()
		end
	end
	for i, v in ipairs(Players:GetPlayers()) do
		if v.Name ~= LocalPlayer.Name and not v2.Players.ScrollingFrame:FindFirstChild(v.Name) then
			local v1 = v2.Players.ScrollingFrame.Example:Clone()
			v1.Name = v.Name
			v1.PlayerName.Text = ("%* (@%*)"):format(v.DisplayName, v.Name)
			v1.Visible = true
			v1.Parent = v2.Players.ScrollingFrame
			Tween:AddButton(v1.Send)
			v1.Send.MouseButton1Click:Connect(function() --[[ Line: 71 | Upvalues: Trading (ref), v (copy), v1 (copy) ]]
				Trading.Send:FireServer(v.Name)
				v1.Send.Label.Text = "SENT!"
				task.wait(0.8)
				v1.Send.Label.Text = "SEND"
			end)
		end
	end
end
v2.Players.Search.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 80 | Upvalues: v2 (copy) ]]
	local Text = v2.Players.Search.TextBox.Text
	for k, v in pairs(v2.Players.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			local v1 = nil
			pcall(function() --[[ Line: 87 | Upvalues: v1 (ref), v (copy), Text (copy) ]]
				v1 = string.find(string.lower(v.PlayerName.Text), string.lower(Text))
			end)
			if v1 then
				v.Visible = true
			else
				v.Visible = false
			end
		end
	end
end)
function sent(p1) --[[ sent | Line: 99 | Upvalues: v2 (copy), TweenService (copy), Size (copy) ]]
	if v2.TradeFrame.Visible then
		repeat
			task.wait(0.1)
		until not v2.TradeFrame.Visible
	end
	v2.Request.Size = UDim2.new(0, 0, 0, 0)
	v2.Request.Visible = true
	TweenService:Create(v2.Request, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = Size
	}):Play()
	v2.Requested.Value = p1
	v2.Request.Message.Text = p1 .. " has sent you a trade request."
end
function openTrade(p1) --[[ openTrade | Line: 111 | Upvalues: LocalPlayer (copy), Tween (copy), v2 (copy) ]]
	Instance.new("StringValue", LocalPlayer).Name = "CurrentlyTrading"
	Tween:AddButton("Open", v2.TradeFrame)
	v2.TradeFrame.OtherPlayerName.Text = p1
	v2.Request.Visible = false
	script.Parent.Parent.SideDock.Enabled = false
end
local v4 = nil
function addInfo(p1, p2, p3, p4) --[[ addInfo | Line: 124 | Upvalues: v2 (copy), ItemInfo (copy), v4 (ref), UserInputService (copy), v1 (copy), Towers (copy), Items (copy), Presents (copy), ReplicatedStorage (copy), v3 (ref) ]]
	local v12 = if p4 then v2.HistoryView.Main.ItemInfo else ItemInfo
	if v12.Visible and v4 == p1 then
		v12.Visible = false
		return
	end
	v4 = p1
	if UserInputService.MouseEnabled then
		local v22 = (Vector2.new(v1.X, v1.Y) - v12.Parent.AbsolutePosition) / v12.Parent.AbsoluteSize
		v12.Position = UDim2.fromScale(v22.X, v22.Y)
	else
		local v32 = UDim2.new(0, p1.AbsolutePosition.X, 0, p1.AbsolutePosition.Y, 0)
		v12.Position = if p1 then v32 - UDim2.new(0, v12.Parent.AbsolutePosition.X, 0, v12.Parent.AbsolutePosition.Y) else v12.Parent.Position
	end
	v12.Visible = true
	local v5 = nil
	v5 = p1.Parent:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 140 | Upvalues: v12 (copy), v5 (ref) ]]
		v12.Visible = false
		v5:Disconnect()
	end)
	local v6 = if Towers.Towers[p2] then Towers.Towers[p2] elseif Items[p2] then Items[p2] elseif Presents.Presents[p2] then Presents.Presents[p2] else nil
	local v7 = if v6 and v6.Rarity then v6.Rarity else "Common"
	v12.Holder.Rarity.Text = v7
	v12.Holder.Rarity:ClearAllChildren()
	ReplicatedStorage.Gradients[v7]:Clone().Parent = v12.Holder.Rarity
	v12.Holder.ItemName.Text = if v6 and v6.Name then v6.Name else p2
	v12.Holder.Description.Text = if v6 and v6.Description then v6.Description elseif Presents.Presents[p2] then "A present" elseif Towers.Towers[p2] then "A tower" else "N/A"
	v2.TradeFrame.Main.ItemInfo.StatFrame.Visible = false
	if p3 and (typeof(p3) == "table" and p3.Stats) then
		v3 = p3.Stats
		v12.Stats.Visible = true
	else
		v12.Stats.Visible = false
	end
end
function updateItems(p1, p2) --[[ updateItems | Line: 166 | Upvalues: ClientState (copy), v2 (copy), Formatter (copy), Towers (copy), Items (copy), Presents (copy), ReplicatedStorage (copy), Tween (copy), Trading (copy) ]]
	if not ClientState.GetData() then
		return
	end
	local v1 = if p1 then v2.TradeFrame.Main.Items2 else v2.TradeFrame.Main.Items1
	for k, v in pairs(v1:GetChildren()) do
		if (v:IsA("Frame") or v:IsA("ImageButton")) and (v.Name ~= "Example" and (v.Name ~= "Add" and not p2[v.Name])) then
			v:Destroy()
		end
	end
	for k, v in pairs(p2) do
		local v22, v3, v4, v5, v6, v7
		if v1:FindFirstChild(k) then
			v22 = if typeof(v) == "table" and v.Amount then Formatter.FormatCompact(v.Amount) else Formatter.FormatCompact(v)
			v1[k].Amount.Text = "x" .. v22
			continue
		end
		v3 = if typeof(v) == "table" and v.Name then v.Name else k
		local v9 = v1.Example:Clone()
		v9.Name = k
		v4 = if typeof(v) == "table" and v.Amount then Formatter.FormatCompact(v.Amount) else Formatter.FormatCompact(v)
		v9.Amount.Text = "x" .. v4
		v5 = if typeof(v) == "table" and Towers.Towers[v3] then Towers.Towers[v3].Image elseif Items[v3] and Items[v3].Image then Items[v3].Image elseif Presents.Presents[v3] and Presents.Presents[v3].Image then Presents.Presents[v3].Image else ""
		v9.BorderImage.TowerImage.Image = v5
		v6 = typeof(v) == "table" and v.Stats and true or false
		v9.Stat.Visible = v6
		v7 = if typeof(v) == "table" and v.Shiny then "Shiny" elseif Items[v3] and Items[v3].Rarity then Items[v3].Rarity elseif Towers.Towers[v3] and Towers.Towers[v3].Rarity then Towers.Towers[v3].Rarity elseif Presents.Presents[v3] and Presents.Presents[v3].Rarity then Presents.Presents[v3].Rarity else "Common"
		v9.BorderImage.UIGradient.Color = if ReplicatedStorage.Gradients:FindFirstChild(v7) then ReplicatedStorage.Gradients[v7].Color else ReplicatedStorage.Gradients.Common.Color
		if typeof(v) == "table" and (v.Enchant and (#v.Enchant > 1 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v.Enchant))) then
			ReplicatedStorage.Objects.Enchants[v.Enchant]:Clone().Parent = v9
		end
		if Towers.Towers[v3] then
			v9.Price.Visible = true
			v9.Price.Info.Text = "$" .. Towers.Towers[v3].PlacePrice
		else
			v9.Price.Visible = false
		end
		v9.Visible = true
		v9.Parent = v1
		if v9:IsA("ImageButton") then
			Tween:AddButton(v9, nil, nil, nil, true)
			v9.MouseButton1Click:Connect(function() --[[ Line: 213 | Upvalues: v9 (copy), v3 (copy), v (copy), Trading (ref), k (copy) ]]
				if v9.Parent.Name == "Items2" then
					addInfo(v9, v3, v)
				else
					Trading.Trade:FireServer("Remove", k)
				end
			end)
		end
	end
end
function updateItemsHistory(p1, p2) --[[ updateItemsHistory | Line: 225 | Upvalues: v2 (copy), Formatter (copy), Towers (copy), Items (copy), Presents (copy), ReplicatedStorage (copy), Tween (copy) ]]
	local v1 = if p1 then v2.HistoryView.Main.Items2 else v2.HistoryView.Main.Items1
	for k, v in pairs(v1:GetChildren()) do
		if (v:IsA("Frame") or v:IsA("ImageButton")) and (v.Name ~= "Example" and not p2[v.Name]) then
			v:Destroy()
		end
	end
	for k, v in pairs(p2) do
		local v22, v3, v4, v5, v6, v7
		if v1:FindFirstChild(k) then
			v22 = if typeof(v) == "table" and v.Amount then Formatter.FormatCompact(v.Amount) else Formatter.FormatCompact(v)
			v1[k].Amount.Text = "x" .. v22
			continue
		end
		v3 = if typeof(v) == "table" and v.Name then v.Name else k
		local v9 = v1.Example:Clone()
		v9.Name = k
		v4 = if typeof(v) == "table" and v.Amount then Formatter.FormatCompact(v.Amount) else Formatter.FormatCompact(v)
		v9.Amount.Text = "x" .. v4
		v5 = if typeof(v) == "table" and Towers.Towers[v3] then Towers.Towers[v3].Image elseif Items[v3] and Items[v3].Image then Items[v3].Image elseif Presents.Presents[v3] and Presents.Presents[v3].Image then Presents.Presents[v3].Image else ""
		v9.BorderImage.TowerImage.Image = v5
		v6 = typeof(v) == "table" and v.Stats and true or false
		v9.Stat.Visible = v6
		v7 = if typeof(v) == "table" and v.Shiny then "Shiny" elseif Items[v3] and Items[v3].Rarity then Items[v3].Rarity elseif Towers.Towers[v3] and Towers.Towers[v3].Rarity then Towers.Towers[v3].Rarity elseif Presents.Presents[v3] and Presents.Presents[v3].Rarity then Presents.Presents[v3].Rarity else "Common"
		v9.BorderImage.UIGradient.Color = if ReplicatedStorage.Gradients:FindFirstChild(v7) then ReplicatedStorage.Gradients[v7].Color else ReplicatedStorage.Gradients.Common.Color
		if typeof(v) == "table" then
			local Enchant = v.Enchant
			local v12 = if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false
			if v12 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v.Enchant) then
				ReplicatedStorage.Objects.Enchants[v.Enchant]:Clone().Parent = v9
			end
		end
		if Towers.Towers[v3] then
			v9.Price.Visible = true
			v9.Price.Info.Text = "$" .. Towers.Towers[v3].PlacePrice
		else
			v9.Price.Visible = false
		end
		v9.Visible = true
		v9.Parent = v1
		Tween:AddButton(v9, nil, nil, nil, true)
		v9.MouseButton1Click:Connect(function() --[[ Line: 268 | Upvalues: v9 (copy), v3 (copy), v (copy) ]]
			addInfo(v9, v3, v, true)
		end)
	end
end
v2.Request.Yes.MouseButton1Click:Connect(function() --[[ Line: 275 | Upvalues: v2 (copy), Trading (copy) ]]
	v2.Request.Visible = false
	Trading.Accept:FireServer(v2.Requested.Value)
	v2.Requested.Value = ""
end)
v2.Request.No.MouseButton1Click:Connect(function() --[[ Line: 281 | Upvalues: v2 (copy), Trading (copy) ]]
	v2.Request.Visible = false
	Trading.Accept:FireServer(v2.Requested.Value, true)
	v2.Requested.Value = ""
end)
function giveMessage(p1) --[[ giveMessage | Line: 287 | Upvalues: v2 (copy), TweenService (copy), Size_2 (copy) ]]
	v2.Message.Size = UDim2.new(0, 0, 0, 0)
	v2.Message.Visible = true
	TweenService:Create(v2.Message, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = Size_2
	}):Play()
	v2.Message.Message.Text = p1
end
local v5 = nil
v2.Message.Okay.MouseButton1Click:Connect(function() --[[ Line: 297 | Upvalues: v5 (ref), TweenService (copy), v2 (copy) ]]
	local v1 = tick()
	v5 = v1
	local v22 = TweenService:Create(v2.Message, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 0, 0, 0)
	})
	v22:Play()
	v22.Completed:Wait()
	if v1 ~= v1 then
		return
	end
	v2.Message.Visible = false
end)
v2.TradeFrame.Main.Items1.Add.MouseButton1Click:Connect(function() --[[ Line: 310 | Upvalues: Trading (copy), LocalPlayer (copy) ]]
	Trading.Trade.Bindable:Fire(1)
	if LocalPlayer:FindFirstChild("TradingItem") then
		return
	end
	local TradingItem = Instance.new("StringValue")
	TradingItem.Name = "TradingItem"
	TradingItem.Parent = LocalPlayer
end)
Trading.Trade.Bindable.Event:Connect(function(p1, p2) --[[ Line: 319 | Upvalues: Tween (copy), v2 (copy), Trading (copy) ]]
	if p1 ~= 1 then
		Tween:AddButton("Open", v2.TradeFrame)
		Trading.Trade:FireServer("Add", p1, (tonumber(p2)))
	end
end)
v2.TradeFrame.Decline.MouseButton1Click:Connect(function() --[[ Line: 326 | Upvalues: Trading (copy), LocalPlayer (copy), Tween (copy), v2 (copy) ]]
	Trading.Trade:FireServer("Decline")
	if LocalPlayer:FindFirstChild("CurrentlyTrading") then
		return
	end
	Tween:AddButton("Close", v2.TradeFrame)
end)
v2.TradeFrame.Confirm.MouseButton1Click:Connect(function() --[[ Line: 333 | Upvalues: v2 (copy), Trading (copy) ]]
	if not v2.ChatFrame.Visible then
		Trading.Trade:FireServer("Accept")
	end
end)
v2.TradeFrame.Chat.MouseButton1Click:Connect(function() --[[ Line: 338 | Upvalues: v2 (copy) ]]
	v2.TradeFrame.ChatNotification.Visible = false
	v2.ChatFrame.Visible = not v2.ChatFrame.Visible
end)
v2.ChatFrame.Send.MouseButton1Click:Connect(function() --[[ Line: 343 | Upvalues: ReplicatedStorage (copy), v2 (copy) ]]
	ReplicatedStorage.Remotes.Misc.TradeChat:FireServer(v2.ChatFrame.Frame.Message.Text)
	v2.ChatFrame.Frame.Message.Text = ""
end)
UserInputService.InputBegan:Connect(function(p1) --[[ Line: 348 | Upvalues: v2 (copy), ReplicatedStorage (copy) ]]
	if p1.KeyCode ~= Enum.KeyCode.Return or not v2.ChatFrame.Visible then
		return
	end
	ReplicatedStorage.Remotes.Misc.TradeChat:FireServer(v2.ChatFrame.Frame.Message.Text)
	v2.ChatFrame.Frame.Message.Text = ""
end)
ReplicatedStorage.Remotes.Misc.TradeChat.OnClientEvent:Connect(function(p1, p2, p3) --[[ Line: 355 | Upvalues: TextChatService (copy) ]]
	if p2 == "SEND" then
		TextChatService:WaitForChild(p3):SendAsync(p1)
	end
end)
TextChatService.MessageReceived:Connect(function(p1) --[[ Line: 363 | Upvalues: LocalPlayer (copy), v2 (copy) ]]
	local TextSource = p1.TextSource
	local TextChannel = p1.TextChannel
	if not TextChannel then
		return
	end
	if string.sub(TextChannel.Name, 1, 6) ~= "Trade_" then
		return
	end
	if not v2.ChatFrame.Visible then
		v2.TradeFrame.ChatNotification.Visible = true
	end
	local Active = (if not TextSource or TextSource.UserId ~= LocalPlayer.UserId then v2.ChatFrame.Messages.ExampleOther else v2.ChatFrame.Messages.Example):Clone()
	Active.Name = "Active"
	Active.LayoutOrder = #v2.ChatFrame.Messages:GetChildren() - 3
	Active.Main.TextLabel.Text = p1.Text
	Active.Parent = v2.ChatFrame.Messages
	Active.Visible = true
	v2.ChatFrame.Messages.CanvasPosition = Vector2.new(0, v2.ChatFrame.Messages.AbsoluteCanvasSize.Y)
end)
local function clear() --[[ clear | Line: 382 | Upvalues: v2 (copy) ]]
	for v1, v22 in v2.HistoryPages.Pages:GetChildren() do
		if v22:IsA("Frame") and v22.Name ~= "ExamplePage" then
			v22:Destroy()
		end
	end
end
function updatePages() --[[ updatePages | Line: 390 | Upvalues: v2 (copy) ]]
	local count = 0
	for k, v in pairs(v2.HistoryPages.Pages:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "ExamplePage" then
			count = count + 1
			if v.Name == "Page" .. page then
				v.Visible = true
				continue
			end
			v.Visible = false
		end
	end
	v2.HistoryPages.Page.Text = "(" .. page .. "/" .. count .. ")"
end
function viewTrade(p1) --[[ viewTrade | Line: 404 | Upvalues: t (ref), Tween (copy), v2 (copy) ]]
	local v1 = nil
	for k, v in pairs(t) do
		if v.ID == p1 then
			v1 = v
		end
	end
	if v1 then
		Tween:AddButton("Open", v2.HistoryView)
		updateItemsHistory(false, v1.Items1)
		updateItemsHistory(true, v1.Items2)
		v2.HistoryView.OtherPlayerName.Text = v1.OtherPlayer
	else
		Tween:AddButton("Open", v2.HistoryPages)
	end
end
v2.HistoryView.Exit.MouseButton1Click:Connect(function() --[[ Line: 420 | Upvalues: Tween (copy), v2 (copy) ]]
	Tween:AddButton("Open", v2.HistoryPages)
end)
v2.HistoryPages.Exit.MouseButton1Click:Connect(function() --[[ Line: 423 | Upvalues: Tween (copy), v2 (copy) ]]
	Tween:AddButton("Open", v2.Players)
	for k, v in pairs(v2.HistoryPages.Pages:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "ExamplePage" then
			v:Destroy()
		end
	end
	v2.HistoryPages.Page.Text = "(0/0)"
end)
v2.HistoryPages.Next.MouseButton1Click:Connect(function() --[[ Line: 432 | Upvalues: v2 (copy) ]]
	local count = 0
	for k, v in pairs(v2.HistoryPages.Pages:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "ExamplePage" then
			count = count + 1
		end
	end
	if count <= page then
		page = 1
	else
		page = page + 1
	end
	updatePages()
end)
v2.HistoryPages.Previous.MouseButton1Click:Connect(function() --[[ Line: 445 | Upvalues: v2 (copy) ]]
	local count = 0
	for k, v in pairs(v2.HistoryPages.Pages:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "ExamplePage" then
			count = count + 1
		end
	end
	if page <= 1 then
		page = count
	else
		page = page - 1
	end
	updatePages()
end)
function tradeHistory(p1, p2) --[[ tradeHistory | Line: 459 | Upvalues: t (ref), clear (copy), v2 (copy), Tween (copy) ]]
	page = 1
	if not p2 then
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
		table.sort(t, function(p1, p2) --[[ Line: 469 ]]
			return p1.Time > p2.Time
		end)
	end
	clear()
	local count = 0
	for k, v in pairs(if p2 then p1 else t) do
		count = count + 1
		local v3 = math.ceil(count / 5)
		local v4 = v2.HistoryPages.Pages:FindFirstChild("Page" .. v3)
		if not v4 then
			local v5 = v2.HistoryPages.Pages.ExamplePage:Clone()
			v5.Name = "Page" .. v3
			v5.Parent = v2.HistoryPages.Pages
			v4 = v5
		end
		local v6 = v4.Example:Clone()
		v6.Name = v.ID
		v6.LayoutOrder = count
		v6.Other.Text = v.OtherPlayer
		v6.Time.Text = convertToHMS(os.time() - v.Time) .. " ago"
		v6.Parent = v4
		v6.Visible = true
		Tween:AddButton(v6.View)
		v6.View.MouseButton1Click:Connect(function() --[[ Line: 498 | Upvalues: v (copy) ]]
			task.spawn(viewTrade, v.ID)
		end)
	end
	updatePages()
	Tween:AddButton("Open", v2.HistoryPages)
end
v2.Players.History.MouseButton1Click:Connect(function() --[[ Line: 508 | Upvalues: ClientState (copy) ]]
	tradeHistory(ClientState.GetData().TradeHistory)
end)
v2.TradeFrame.Main.ItemInfo.Stats.MouseButton1Click:Connect(function() --[[ Line: 513 | Upvalues: v3 (ref), v2 (copy), StatRerolls (copy) ]]
	if not v3 then
		return
	end
	v2.TradeFrame.Main.ItemInfo.StatFrame.Visible = not v2.TradeFrame.Main.ItemInfo.StatFrame.Visible
	local Holder = v2.TradeFrame.Main.ItemInfo.StatFrame.Holder
	for k, v in pairs({ "Damage", "Range", "Cooldown" }) do
		local v1 = StatRerolls.GetLetterStats(v, v3[v], true)
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
v2.HistoryView.Main.ItemInfo.Stats.MouseButton1Click:Connect(function() --[[ Line: 546 | Upvalues: v3 (ref), v2 (copy), StatRerolls (copy) ]]
	if not v3 then
		return
	end
	v2.HistoryView.Main.ItemInfo.StatFrame.Visible = not v2.HistoryView.Main.ItemInfo.StatFrame.Visible
	local Holder = v2.HistoryView.Main.ItemInfo.StatFrame.Holder
	for k, v in pairs({ "Damage", "Range", "Cooldown" }) do
		local v1 = StatRerolls.GetLetterStats(v, v3[v], true)
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
Tween:AddButton(TradeButton, v2.Players, "ButtonClick", true)
Tween:AddButton(v2.Players.Exit, v2.Players)
Tween:AddButton(v2.Request.Yes)
Tween:AddButton(v2.Request.No)
Tween:AddButton(v2.TradeFrame.Decline)
Tween:AddButton(v2.TradeFrame.Main.Items1.Add, nil, nil, false, true)
Tween:AddButton(v2.Message.Okay)
Tween:AddButton(v2.TradeFrame.Confirm)
Tween:AddButton(v2.TradeFrame.Chat)
Tween:AddButton(v2.ChatFrame.Send)
Tween:AddButton(v2.Players.History)
Tween:AddButton(v2.HistoryView.Exit)
Tween:AddButton(v2.HistoryPages.Exit)
Tween:AddButton(v2.HistoryPages.Next)
Tween:AddButton(v2.HistoryPages.Previous)
Tween:AddButton(v2.TradeFrame.Main.ItemInfo.Stats)
Tween:AddButton(v2.HistoryView.Main.ItemInfo.Stats)
Trading.Trade.OnClientEvent:Connect(function(p1, p2, p3, p4, p5) --[[ Line: 598 | Upvalues: v2 (copy), LocalPlayer (copy), Tween (copy), ItemInfo (copy) ]]
	if p1 == "Start" then
		task.spawn(openTrade, p2)
		return
	end
	if p1 == "Message" then
		task.spawn(giveMessage, p2)
		return
	end
	if p1 == "Decline" then
		v2.ChatFrame.Visible = false
		for k, v in pairs(v2.TradeFrame.Main.Items1:GetChildren()) do
			if (v:IsA("Frame") or v:IsA("ImageButton")) and (v.Name ~= "Example" and v.Name ~= "Add") then
				v:Destroy()
			end
		end
		for k, v in pairs(v2.TradeFrame.Main.Items2:GetChildren()) do
			if (v:IsA("Frame") or v:IsA("ImageButton")) and (v.Name ~= "Example" and v.Name ~= "Add") then
				v:Destroy()
			end
		end
		for k, v in pairs(v2.ChatFrame.Messages:GetChildren()) do
			if v:IsA("Frame") and (v.Name ~= "Example" and v.Name ~= "ExampleOther") then
				v:Destroy()
			end
		end
		if not LocalPlayer:FindFirstChild("CurrentlyTrading") then
			Tween:AddButton("Close", v2.TradeFrame)
			script.Parent.Parent.SideDock.Enabled = true
			ItemInfo.Visible = false
			return
		end
		LocalPlayer.CurrentlyTrading:Destroy()
		Tween:AddButton("Close", v2.TradeFrame)
		script.Parent.Parent.SideDock.Enabled = true
		ItemInfo.Visible = false
	else
		if p1 == "UpdateItems" then
			task.spawn(updateItems, p2, p3, p4, p5)
			return
		end
		if p1 ~= "TradeAccepted" then
			return
		end
		if typeof(p2) == "string" then
			v2.TradeFrame.Confirm.TextLabel.Text = p2
			return
		end
		if p2 then
			v2.TradeFrame.Ready1.TextLabel.Text = "READY"
			v2.TradeFrame.Ready1.TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
			v2.TradeFrame.Ready1.ImageColor3 = Color3.fromRGB(0, 255, 0)
		else
			v2.TradeFrame.Ready1.TextLabel.Text = "NOT READY"
			v2.TradeFrame.Ready1.TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
			v2.TradeFrame.Ready1.ImageColor3 = Color3.fromRGB(255, 0, 0)
		end
		if p3 then
			v2.TradeFrame.Ready2.TextLabel.Text = "READY"
			v2.TradeFrame.Ready2.TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
			v2.TradeFrame.Ready2.ImageColor3 = Color3.fromRGB(0, 255, 0)
		else
			v2.TradeFrame.Ready2.TextLabel.Text = "NOT READY"
			v2.TradeFrame.Ready2.TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
			v2.TradeFrame.Ready2.ImageColor3 = Color3.fromRGB(255, 0, 0)
		end
		if p2 and p3 then
			v2.TradeFrame.Confirm.TextLabel.Text = "CONFIRM"
			return
		end
		if p2 and not p3 then
			v2.TradeFrame.Confirm.TextLabel.Text = "CANCEL"
			return
		end
		v2.TradeFrame.Confirm.TextLabel.Text = "ACCEPT"
	end
end)
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)
Trading.Send.OnClientEvent:Connect(sent)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 662 | Upvalues: Towers (copy) ]]
	if p1 and not pcall(function() --[[ Line: 664 | Upvalues: p1 (ref), Towers (ref) ]]
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
task.spawn(updatePlayerList)