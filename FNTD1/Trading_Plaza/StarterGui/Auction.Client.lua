-- https://lua.expert/
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local Auction = game.ReplicatedStorage.Remotes.Auction
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Presents = require(game.ReplicatedStorage.Configs.Presents)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
local Items = require(game.ReplicatedStorage.Configs.Items)
local Towers = require(game.ReplicatedStorage.Configs.Towers).Towers
local Formatter = require(game.ReplicatedStorage.Libs.Formatter)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local StatRerolls = require(game.ReplicatedStorage.Modules.Misc.StatRerolls)
local Board = script.Parent.Board
local Bid = script.Parent.Bid
local StartingBid = script.Parent.StartingBid
local InventoryFrame = script.Parent.InventoryFrame
local Loading = script.Parent.Loading
local v1 = nil
local v2 = nil
local v3 = false
local Rarities = Misc.Rarities
function getImage(p1) --[[ getImage | Line: 28 | Upvalues: Towers (copy), Items (copy), Presents (copy) ]]
	local v1 = ""
	if p1.TowerTable then
		if Towers[p1.TowerTable.Name] then
			return Towers[p1.TowerTable.Name].Image
		end
	elseif p1.Item then
		if Items[p1.Item] and Items[p1.Item].Image then
			return Items[p1.Item].Image
		end
	elseif p1.Present and (Presents.Presents[p1.Present] and Presents.Presents[p1.Present].Image) then
		v1 = Presents.Presents[p1.Present].Image
	end
	return v1
end
function getRarity(p1) --[[ getRarity | Line: 47 | Upvalues: Towers (copy), Items (copy), Presents (copy) ]]
	local v1 = "Common"
	if p1.TowerTable then
		if Towers[p1.TowerTable.Name] then
			return Towers[p1.TowerTable.Name].Rarity
		end
	elseif p1.Item then
		if Items[p1.Item] and Items[p1.Item].Rarity then
			return Items[p1.Item].Rarity
		end
	elseif p1.Present and (Presents.Presents[p1.Present] and Presents.Presents[p1.Present].Rarity) then
		v1 = Presents.Presents[p1.Present].Rarity
	end
	return v1
end
function getName(p1) --[[ getName | Line: 66 | Upvalues: Towers (copy), Items (copy), Presents (copy) ]]
	local v1 = ""
	if p1.TowerTable then
		if Towers[p1.TowerTable.Name] then
			return p1.TowerTable.Name
		end
	elseif p1.Item then
		if Items[p1.Item] and Items[p1.Item].Name then
			return Items[p1.Item].Name
		end
	elseif p1.Present and (Presents.Presents[p1.Present] and Presents.Presents[p1.Present].Name) then
		v1 = Presents.Presents[p1.Present].Name
	end
	return v1
end
function getActiveID(p1) --[[ getActiveID | Line: 86 ]]
	local v1 = (1 / 0)
	local v2 = nil
	for k, v in pairs(p1) do
		if v.Placed < v1 then
			v1 = v.Placed
			v2 = k
		end
	end
	return v2
end
function showItem(p1, p2) --[[ showItem | Line: 98 | Upvalues: StatRerolls (copy) ]]
	p1.BorderImage.TowerImage.Image = getImage(p2)
	if p1:FindFirstChild("Enchant") then
		p1.Enchant:Destroy()
	end
	if p2.TowerTable then
		if p2.TowerTable.Shiny then
			p1.Shiny.Visible = true
		else
			p1.Shiny.Visible = false
		end
		if p2.TowerTable.Enchant and game.ReplicatedStorage.Objects.Enchants:FindFirstChild(p2.TowerTable.Enchant) then
			local Enchant = game.ReplicatedStorage.Objects.Enchants[p2.TowerTable.Enchant]:Clone()
			Enchant.Name = "Enchant"
			Enchant.Parent = p1
		end
		if p2.TowerTable.Stats then
			p1.Parent.StatFrame.Visible = true
			local Holder = p1.Parent.StatFrame.Holder
			for k, v in pairs({ "Damage", "Range", "Cooldown" }) do
				local v1 = StatRerolls.GetLetterStats(v, p2.TowerTable.Stats[v], true)
				Holder[v .. "Letter"].TextLabel.Text = v1.Letter
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
				end
			end
		else
			p1.Parent.StatFrame.Visible = false
		end
	else
		p1.Shiny.Visible = false
		p1.Parent.StatFrame.Visible = false
	end
	p1.BorderImage.UIGradient.Color = if p2.TowerTable and p2.TowerTable.Shiny then game.ReplicatedStorage.Gradients.Shiny.Color else game.ReplicatedStorage.Gradients[getRarity(p2)].Color
end
function updateBoard(p1) --[[ updateBoard | Line: 154 | Upvalues: Auction (copy), v1 (ref), Tween (copy), Bid (copy), Board (copy), Formatter (copy) ]]
	if not p1 then
		p1 = Auction.Request:InvokeServer("Get")
	end
	local v2 = if p1 == "Waiting" then nil else getActiveID(p1)
	if v1 ~= v2 then
		Tween:AddButton("Close", Bid)
	end
	if v2 then
		Board.WonText.Visible = false
		Board.BidButton.Visible = true
	else
		Board.ItemName.Text = "N/A"
		Board.CurrentBid.Text = "0"
		Board.PlayerName.Text = "N/A"
		Board.StatFrame.Visible = false
		Board.Item.Shiny.Visible = false
		Board.Item.BorderImage.TowerImage.Image = ""
		Board.Item.BorderImage.UIGradient.Color = game.ReplicatedStorage.Gradients.Common.Color
		updateTime(true, "None")
		if Board.Item:FindFirstChild("Enchant") then
			Board.Item.Enchant:Destroy()
		end
	end
	if typeof(p1) ~= "table" then
		return
	end
	for k, v in pairs(p1) do
		local v3
		local v4, v5, Enchant
		if Board.Queue:FindFirstChild(k) then
			if v2 == k then
				Board.Queue[k]:Destroy()
				v4 = if game.Players:GetPlayerByUserId(v.UserId) then "@" .. game.Players:GetPlayerByUserId(v.UserId).Name else "N/A"
				if v4 == "N/A" then
					pcall(function() --[[ Line: 197 | Upvalues: v4 (ref), v (copy) ]]
						v4 = "@" .. game.Players:GetNameFromUserIdAsync(v.UserId)
					end)
				end
				if v2 == k then
					v1 = k
					Board.ItemName.Text = getName(v)
					Board.CurrentBid.Text = Formatter.FormatCompact(v.Bid)
					Board.PlayerName.Text = v4
					Bid.CurrentBid.Text = Formatter.FormatCompact(v.MinimumBid)
					Bid.PlayerName.Text = v4
					Bid.ItemName.Text = getName(v)
					showItem(Board.Item, v)
					showItem(Bid.Item, v)
				else
					v5 = Board.Queue.Example:Clone()
					v5.Name = k
					v5.Item.BorderImage.TowerImage.Image = getImage(v)
					v5.ItemName.Text = getName(v)
					v5.PlayerName.Text = v4
					if v5.Item:FindFirstChild("Enchant") then
						v5.Item.Enchant:Destroy()
					end
					if v.TowerTable then
						if v.TowerTable.Shiny then
							v5.Item.Shiny.Visible = true
						else
							v5.Item.Shiny.Visible = false
						end
						if v.TowerTable.Enchant and game.ReplicatedStorage.Objects.Enchants:FindFirstChild(v.TowerTable.Enchant) then
							Enchant = game.ReplicatedStorage.Objects.Enchants[v.TowerTable.Enchant]:Clone()
							Enchant.Name = "Enchant"
							Enchant.Parent = v5.Item
						end
					else
						v5.Item.Shiny.Visible = false
					end
					v3 = if v.TowerTable and v.TowerTable.Shiny then game.ReplicatedStorage.Gradients.Shiny.Color else game.ReplicatedStorage.Gradients[getRarity(v)].Color
					v5.Item.BorderImage.UIGradient.Color = v3
					v5.BorderImage.UIGradient.Color = v3
					v5.Visible = true
					v5.Parent = Board.Queue
				end
			end
		else
			v4 = if game.Players:GetPlayerByUserId(v.UserId) then "@" .. game.Players:GetPlayerByUserId(v.UserId).Name else "N/A"
			if v4 == "N/A" then
				pcall(function() --[[ Line: 197 | Upvalues: v4 (ref), v (copy) ]]
					v4 = "@" .. game.Players:GetNameFromUserIdAsync(v.UserId)
				end)
			end
			if v2 == k then
				v1 = k
				Board.ItemName.Text = getName(v)
				Board.CurrentBid.Text = Formatter.FormatCompact(v.Bid)
				Board.PlayerName.Text = v4
				Bid.CurrentBid.Text = Formatter.FormatCompact(v.MinimumBid)
				Bid.PlayerName.Text = v4
				Bid.ItemName.Text = getName(v)
				showItem(Board.Item, v)
				showItem(Bid.Item, v)
			else
				v5 = Board.Queue.Example:Clone()
				v5.Name = k
				v5.Item.BorderImage.TowerImage.Image = getImage(v)
				v5.ItemName.Text = getName(v)
				v5.PlayerName.Text = v4
				if v5.Item:FindFirstChild("Enchant") then
					v5.Item.Enchant:Destroy()
				end
				if v.TowerTable then
					if v.TowerTable.Shiny then
						v5.Item.Shiny.Visible = true
					else
						v5.Item.Shiny.Visible = false
					end
					if v.TowerTable.Enchant and game.ReplicatedStorage.Objects.Enchants:FindFirstChild(v.TowerTable.Enchant) then
						Enchant = game.ReplicatedStorage.Objects.Enchants[v.TowerTable.Enchant]:Clone()
						Enchant.Name = "Enchant"
						Enchant.Parent = v5.Item
					end
				else
					v5.Item.Shiny.Visible = false
				end
				v3 = if v.TowerTable and v.TowerTable.Shiny then game.ReplicatedStorage.Gradients.Shiny.Color else game.ReplicatedStorage.Gradients[getRarity(v)].Color
				v5.Item.BorderImage.UIGradient.Color = v3
				v5.BorderImage.UIGradient.Color = v3
				v5.Visible = true
				v5.Parent = Board.Queue
			end
		end
	end
	local tbl = {}
	for k, v in pairs(Board.Queue:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			if p1[v.Name] then
				tbl[v.Name] = p1[v.Name].Placed
				continue
			end
			v:Destroy()
		end
	end
	for k, v in pairs(tbl) do
		Board.Queue[k].LayoutOrder = v
	end
end
function updateTime(p1, p2) --[[ updateTime | Line: 259 | Upvalues: Auction (copy), Board (copy), TweenService (copy) ]]
	local v1 = if p2 and p2 == "None" then 30 elseif p2 then p2 else Auction.Request:InvokeServer("GetTime")
	if not v1 then
		return
	end
	Board.TimeLeft.Text = if p2 == "None" then "N/A" else v1 .. "s"
	if v1 >= 20 then
		Board.TimerOuterframe.TimerOuterframe.UIGradient.Color = Board.TimerOuterframe.TimerOuterframe.UIGradientGreen.Color
	elseif v1 >= 10 then
		Board.TimerOuterframe.TimerOuterframe.UIGradient.Color = Board.TimerOuterframe.TimerOuterframe.UIGradientOrange.Color
	else
		Board.TimerOuterframe.TimerOuterframe.UIGradient.Color = Board.TimerOuterframe.TimerOuterframe.UIGradientRed.Color
	end
	if v1 > 30 then
		v1 = 30
	end
	if v1 < 0 then
		v1 = 0
	end
	TweenService:Create(Board.TimerOuterframe.TimerOuterframe, TweenInfo.new(if p1 then 0.1 else 1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Size = UDim2.new(v1 / 30, 0, 1, 0)
	}):Play()
end
function updateInventory() --[[ updateInventory | Line: 279 | Upvalues: Loading (copy), Rarities (copy), InventoryFrame (copy), Auction (copy), ClientState (copy), Towers (copy), HttpService (copy), Tween (copy), v3 (ref), v2 (ref), StartingBid (copy), Presents (copy), Items (copy) ]]
	Loading.Visible = true
	local function hasEnchant(p1) --[[ hasEnchant | Line: 281 ]]
		if p1 and typeof(p1) == "string" then
			return p1 and #p1 > 1 and true or false
		else
			return false
		end
	end
	local function rarityOrder(p1) --[[ rarityOrder | Line: 291 | Upvalues: Rarities (ref) ]]
		return 10 - (if table.find(Rarities, p1) then table.find(Rarities, p1) or 0 else 0)
	end
	local function clear(p1) --[[ clear | Line: 295 ]]
		for k, v in pairs(p1:GetChildren()) do
			if v:IsA("ImageButton") or v:IsA("Frame") then
				v:Destroy()
			end
		end
	end
	task.spawn(clear, InventoryFrame.HolderFrame.Items)
	local v1 = Auction.GetLists:InvokeServer()
	local v22 = ClientState.GetData()
	if not v22 then
		return
	end
	for v5, v6 in v22.Towers do
		local v32, v4
		if not (v6.Locked or table.find(v1.Blacklist, v6.Name)) then
			local v7 = Towers[v6.Name] and Towers[v6.Name].Rarity or "Common"
			if v7 == "Nightmare" or (v7 == "Apex" or (v7 == "Forgotten" or table.find(v1.Whitelist, v6.Name))) then
				local v8, v9, v10, v11, v12, v13, v14, v15, v16
				if v6.Shiny then
					if not v6.Stats then
						v8 = v6.Enchant
						v9 = if v8 and typeof(v8) == "string" then if v8 and #v8 > 1 then true else false else false
						if v9 and not v6.Shiny then
							v10 = InventoryFrame.HolderFrame.Items:FindFirstChild(v6.Enchant .. v6.Name)
							if v10 then
								v10:SetAttribute("Owned", v10:GetAttribute("Owned") + 1)
								v10.Info.Text = ("x%*"):format((v10:GetAttribute("Owned")))
								v10.Info.Visible = true
								continue
							end
						end
						v11 = v6.Enchant
						v12 = if v11 and typeof(v11) == "string" then if v11 and #v11 > 1 then true else false else false
						if v12 and v6.Shiny then
							v13 = InventoryFrame.HolderFrame.Items:FindFirstChild("Shiny" .. v6.Enchant .. v6.Name)
							if v13 and v13.Shiny.Visible then
								v13:SetAttribute("Owned", v13:GetAttribute("Owned") + 1)
								v13.Info.Text = ("x%*"):format((v13:GetAttribute("Owned")))
								v13.Info.Visible = true
								continue
							end
						end
						v14 = v6.Enchant
						v15 = if v14 and typeof(v14) == "string" then if v14 and #v14 > 1 then true else false else false
						if not v15 and v6.Shiny then
							v16 = InventoryFrame.HolderFrame.Items:FindFirstChild("Shiny" .. v6.Name)
							if v16 and v16.Shiny.Visible then
								v16:SetAttribute("Owned", v16:GetAttribute("Owned") + 1)
								v16.Info.Text = ("x%*"):format((v16:GetAttribute("Owned")))
								v16.Info.Visible = true
								continue
							end
						end
					end
				else
					local Enchant = v6.Enchant
					if (if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false) or v6.Stats then
						if not v6.Stats then
							v8 = v6.Enchant
							v9 = if v8 and typeof(v8) == "string" then if v8 and #v8 > 1 then true else false else false
							if v9 and not v6.Shiny then
								v10 = InventoryFrame.HolderFrame.Items:FindFirstChild(v6.Enchant .. v6.Name)
								if v10 then
									v10:SetAttribute("Owned", v10:GetAttribute("Owned") + 1)
									v10.Info.Text = ("x%*"):format((v10:GetAttribute("Owned")))
									v10.Info.Visible = true
									continue
								end
							end
							v11 = v6.Enchant
							v12 = if v11 and typeof(v11) == "string" then if v11 and #v11 > 1 then true else false else false
							if v12 and v6.Shiny then
								v13 = InventoryFrame.HolderFrame.Items:FindFirstChild("Shiny" .. v6.Enchant .. v6.Name)
								if v13 and v13.Shiny.Visible then
									v13:SetAttribute("Owned", v13:GetAttribute("Owned") + 1)
									v13.Info.Text = ("x%*"):format((v13:GetAttribute("Owned")))
									v13.Info.Visible = true
									continue
								end
							end
							v14 = v6.Enchant
							v15 = if v14 and typeof(v14) == "string" then if v14 and #v14 > 1 then true else false else false
							if not v15 and v6.Shiny then
								v16 = InventoryFrame.HolderFrame.Items:FindFirstChild("Shiny" .. v6.Name)
								if v16 and v16.Shiny.Visible then
									v16:SetAttribute("Owned", v16:GetAttribute("Owned") + 1)
									v16.Info.Text = ("x%*"):format((v16:GetAttribute("Owned")))
									v16.Info.Visible = true
									continue
								end
							end
						end
					else
						local v18 = InventoryFrame.HolderFrame.Items:FindFirstChild(v6.Name)
						if v18 and not v18.Shiny.Visible then
							v18:SetAttribute("Owned", v18:GetAttribute("Owned") + 1)
							v18.Info.Text = ("x%*"):format((v18:GetAttribute("Owned")))
							v18.Info.Visible = true
							continue
						end
					end
				end
				local v19 = Towers[v6.Name]
				if v19 then
					v32 = if v6.Shiny then game.ReplicatedStorage.Gradients.Shiny.Color elseif v19.Rarity and game.ReplicatedStorage.Gradients:FindFirstChild(v19.Rarity) then game.ReplicatedStorage.Gradients[v19.Rarity].Color else game.ReplicatedStorage.Gradients.Common.Color
					local v20 = script.InventorySample:Clone()
					if v6.Stats then
						v20.Name = v20.Name .. "_Stats" .. HttpService:GenerateGUID(false)
					end
					local Rarity = v19.Rarity
					v20.LayoutOrder = 10 - (table.find(Rarities, Rarity) and table.find(Rarities, Rarity) or 0)
					local Enchant = v6.Enchant
					if (if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false) and not v6.Shiny then
						v4 = v6.Enchant .. v6.Name
					else
						local Enchant_2 = v6.Enchant
						v4 = if (if Enchant_2 and typeof(Enchant_2) == "string" then if Enchant_2 and #Enchant_2 > 1 then true else false else false) and v6.Shiny then "Shiny" .. v6.Enchant .. v6.Name elseif v6.Shiny then "Shiny" .. v6.Name else v6.Name
					end
					v20.Name = v4
					v20.BorderImage.TowerImage.Image = v19.Image or ""
					v20.BorderImage.UIGradient.Color = v32
					v20.Frame.UIGradient.Color = v32
					v20.Shiny.Visible = if v6.Shiny then true else false
					v20.Stat.Visible = if v6.Stats then true else false
					local Enchant_2 = v6.Enchant
					local v26 = if Enchant_2 and typeof(Enchant_2) == "string" then if Enchant_2 and #Enchant_2 > 1 then true else false else false
					if v26 and game.ReplicatedStorage.Objects.Enchants:FindFirstChild(v6.Enchant) then
						game.ReplicatedStorage.Objects.Enchants[v6.Enchant]:Clone().Parent = v20
					end
					v20.Info.Text = "x1"
					v20:SetAttribute("Owned", 1)
					v20:SetAttribute("Rarity", v19.Rarity)
					v20:SetAttribute("Unit", v6.Name)
					v20:SetAttribute("Shiny", v6.Shiny)
					v20.Parent = InventoryFrame.HolderFrame.Items
					v20.Visible = true
					Tween:AddButton(v20, nil, "ButtonClick", nil, true)
					v20.Activated:Connect(function() --[[ Line: 384 | Upvalues: v3 (ref), v2 (ref), v6 (copy), InventoryFrame (ref), StartingBid (ref), Tween (ref) ]]
						if not v3 then
							v2 = v6.Stats
							InventoryFrame.Visible = false
							StartingBid:SetAttribute("ID", v6.Name)
							StartingBid:SetAttribute("RealID", v6.ID)
							Tween:AddButton("Open", StartingBid)
						end
					end)
				end
			end
		end
	end
	for v28, v29 in v22.Presents do
		local v27
		if table.find(v1.Whitelist, v28) and not (v29 <= 0) then
			local v30 = Presents[v28]
			if v30 then
				v27 = if v30.Rarity and game.ReplicatedStorage.Gradients:FindFirstChild(v30.Rarity) then game.ReplicatedStorage.Gradients[v30.Rarity].Color else game.ReplicatedStorage.Gradients.Common.Color
				local v31 = script.InventorySample:Clone()
				local Rarity = v30.Rarity
				v31.LayoutOrder = 10 - (table.find(Rarities, Rarity) and table.find(Rarities, Rarity) or 0)
				v31.Name = v28
				v31.BorderImage.TowerImage.Image = v30.Image or ""
				v31.BorderImage.UIGradient.Color = v27
				v31.Frame.UIGradient.Color = v27
				v31.Shiny.Visible = false
				v31.Info.Text = "x" .. v29
				v31:SetAttribute("Owned", 1)
				v31:SetAttribute("Rarity", v30.Rarity)
				v31:SetAttribute("Unit", v28)
				v31:SetAttribute("Shiny", false)
				v31:SetAttribute("IsItem", true)
				v31.Parent = InventoryFrame.HolderFrame.Items
				v31.Visible = true
				Tween:AddButton(v31, nil, "ButtonClick", nil, true)
				v31.Activated:Connect(function() --[[ Line: 420 | Upvalues: v3 (ref), InventoryFrame (ref), StartingBid (ref), v28 (copy), Tween (ref) ]]
					if not v3 then
						InventoryFrame.Visible = false
						StartingBid:SetAttribute("ID", v28)
						Tween:AddButton("Open", StartingBid)
					end
				end)
			end
		end
	end
	for v34, v35 in v22.Items do
		local v33
		if table.find(v1.Whitelist, v34) and (v34 ~= "Souls" and not (v35 <= 0)) then
			local v36 = Items[v34]
			if v36 then
				v33 = if v36.Rarity and game.ReplicatedStorage.Gradients:FindFirstChild(v36.Rarity) then game.ReplicatedStorage.Gradients[v36.Rarity].Color else game.ReplicatedStorage.Gradients.Common.Color
				local v37 = script.InventorySample:Clone()
				local Rarity = v36.Rarity
				v37.LayoutOrder = 10 - (table.find(Rarities, Rarity) and table.find(Rarities, Rarity) or 0)
				v37.Name = v34
				v37.BorderImage.TowerImage.Image = v36.Image or ""
				v37.BorderImage.UIGradient.Color = v33
				v37.Frame.UIGradient.Color = v33
				v37.Shiny.Visible = false
				v37.Info.Text = "x" .. v35
				v37:SetAttribute("Owned", 1)
				v37:SetAttribute("Rarity", v36.Rarity)
				v37:SetAttribute("Unit", v34)
				v37:SetAttribute("Shiny", false)
				v37:SetAttribute("IsItem", true)
				v37.Parent = InventoryFrame.HolderFrame.Items
				v37.Visible = true
				Tween:AddButton(v37, nil, "ButtonClick", nil, true)
				v37.Activated:Connect(function() --[[ Line: 453 | Upvalues: v3 (ref), InventoryFrame (ref), StartingBid (ref), v34 (copy), Tween (ref) ]]
					if not v3 then
						InventoryFrame.Visible = false
						StartingBid:SetAttribute("ID", v34)
						Tween:AddButton("Open", StartingBid)
					end
				end)
			end
		end
	end
	Loading.Visible = false
end
InventoryFrame.Search.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 464 | Upvalues: InventoryFrame (copy) ]]
	local v1 = InventoryFrame.Search.TextBox.Text:lower()
	local v2 = v1:match("shiny") ~= nil
	local _, v3 = v1:find("shiny ")
	for v4, v5 in InventoryFrame.HolderFrame.Items:GetChildren() do
		if v5:IsA("ImageButton") then
			v5.Visible = false
			if not v2 or v5:GetAttribute("Shiny") then
				if v2 and #InventoryFrame.Search.TextBox.Text == 5 then
					v5.Visible = true
					continue
				end
				if v3 then
					v1 = v1:sub(v3 + 1, #v1)
				end
				if v5:GetAttribute("Unit"):lower():match(v1) then
					v5.Visible = true
				end
			end
		end
	end
end)
Bid.Confirm.MouseButton1Click:Connect(function() --[[ Line: 488 | Upvalues: Auction (copy), v1 (ref), Bid (copy), Tween (copy) ]]
	if not Auction.Request:InvokeServer("Bid", v1, (tonumber(Bid.Enter.TextBox.Text))) then
		return
	end
	Tween:AddButton("Close", Bid)
end)
StartingBid.Confirm.MouseButton1Click:Connect(function() --[[ Line: 494 | Upvalues: Auction (copy), StartingBid (copy), Tween (copy) ]]
	if not Auction.Request:InvokeServer("Add", if StartingBid:GetAttribute("RealID") then StartingBid:GetAttribute("RealID") else StartingBid:GetAttribute("ID"), (tonumber(StartingBid.Enter.TextBox.Text))) then
		return
	end
	Tween:AddButton("Close", StartingBid)
end)
Board.AddQueue.MouseButton1Click:Connect(function() --[[ Line: 501 ]]
	updateInventory()
end)
updateBoard()
updateTime()
task.defer(function() --[[ Line: 508 | Upvalues: Loading (copy), v3 (ref) ]]
	while true do
		if Loading.Visible then
			v3 = true
			local Icon = Loading.Icon
			Icon.Rotation = Icon.Rotation + 57.29577951308232
		else
			v3 = false
		end
		task.wait(0.03333333333333333)
	end
end)
Board.BidButton.MouseButton1Click:Connect(function() --[[ Line: 520 | Upvalues: v1 (ref), Tween (copy), Bid (copy) ]]
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if v1 == nil then
		return
	end
	Tween:AddButton("Open", Bid)
end)
Board.AddQueue.MouseButton1Click:Connect(function() --[[ Line: 526 | Upvalues: Tween (copy), InventoryFrame (copy) ]]
	if not script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		Tween:AddButton("Open", InventoryFrame)
	end
end)
Tween:AddButton(Board.BidButton)
Tween:AddButton(Bid.Exit, Bid)
Tween:AddButton(Bid.Confirm)
Tween:AddButton(Board.AddQueue)
Tween:AddButton(InventoryFrame.Exit, InventoryFrame)
Tween:AddButton(StartingBid.Exit, StartingBid)
Tween:AddButton(StartingBid.Confirm)
Auction.Update.OnClientEvent:Connect(function(p1, ...) --[[ Line: 539 | Upvalues: Board (copy) ]]
	if p1 == "Time" then
		updateTime(...)
		return
	end
	if p1 == "Won" then
		Board.WonText.Visible = true
		Board.BidButton.Visible = false
		Board.WonText.Text = ...
	else
		updateBoard(p1, ...)
	end
end)