-- https://lua.expert/
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
game:GetService("UserInputService")
local HttpService_2 = game:GetService("HttpService")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local TradingPlazaRequest = Remotes.Misc.TradingPlazaRequest
local StatRerolls = require(ReplicatedStorage.Modules.Misc.StatRerolls)
local ClientState = require(ReplicatedStorage:WaitForChild("Modules").PlayerData.ClientState)
local Formatter = require(ReplicatedStorage:WaitForChild("Libs").Formatter)
local Towers = require(ReplicatedStorage:WaitForChild("Configs").Towers).Towers
local Presents = require(ReplicatedStorage:WaitForChild("Configs").Presents).Presents
local Items = require(ReplicatedStorage:WaitForChild("Configs").Items)
local Tween = require(ReplicatedStorage:WaitForChild("Libs").Tween)
local v1 = nil
local PlazaFrame = script.Parent:WaitForChild("PlazaFrame")
local MarketFrame = PlazaFrame:WaitForChild("MarketFrame")
local SellFrame = PlazaFrame:WaitForChild("SellFrame")
local Sellers = PlazaFrame:WaitForChild("Sellers")
local InventoryFrame = PlazaFrame:WaitForChild("InventoryFrame")
local Rarities = PlazaFrame:WaitForChild("Rarities")
local SaleAmount = PlazaFrame:WaitForChild("SaleAmount")
local SellAmount = PlazaFrame:WaitForChild("SellAmount")
local ConfirmFrame = PlazaFrame:WaitForChild("ConfirmFrame")
local Loading = script.Parent:WaitForChild("Loading")
local v2 = nil
local t = { "Uncommon", "Rare", "Epic", "Mythic", "Secret", "Nightmare", "Forgotten", "Apex" }
local v3 = "all"
local v4 = false
local v5 = tick()
local t2 = {}
local function disconnectAll() --[[ disconnectAll | Line: 95 | Upvalues: t2 (copy) ]]
	for v1, v2 in t2 do
		v2:Disconnect()
	end
	table.clear(t2)
end
local function hasEnchant(p1) --[[ hasEnchant | Line: 102 ]]
	if p1 and typeof(p1) == "string" then
		return p1 and #p1 > 1 and true or false
	else
		return false
	end
end
local function clear(p1) --[[ clear | Line: 112 ]]
	for k, v in pairs(p1:GetChildren()) do
		if v:IsA("ImageButton") or v:IsA("Frame") then
			v:Destroy()
		end
	end
end
local function sortFrame() --[[ sortFrame | Line: 119 | Upvalues: MarketFrame (copy), v3 (ref), Towers (copy) ]]
	for k, v in pairs(MarketFrame.Units:GetChildren()) do
		if v:IsA("ImageButton") then
			if v3 == "all" then
				v.Visible = true
				continue
			end
			if v3 == "Items" and not Towers[v:GetAttribute("Unit")] then
				v.Visible = true
			else
				if v:GetAttribute("Rarity") == v3 then
					v.Visible = true
					continue
				end
				v.Visible = false
			end
		end
	end
end
local function rarityOrder(p1) --[[ rarityOrder | Line: 134 | Upvalues: t (copy) ]]
	return 10 - (if table.find(t, p1) then table.find(t, p1) or 0 else 0)
end
function updatePlazaData() --[[ updatePlazaData | Line: 138 | Upvalues: v5 (ref), TradingPlazaRequest (copy), Loading (copy), v1 (ref) ]]
	if tick() - v5 < 1 then
		return
	end
	v5 = tick()
	local v12 = TradingPlazaRequest:InvokeServer("GetMarket")
	Loading.Visible = false
	if v12 then
		v1 = v12
		task.defer(updateFrame, "none")
	else
		warn("Failed to initial setup trading plaza. (Attempt invoke market data)")
	end
end
function showSellers(p1, p2) --[[ showSellers | Line: 151 | Upvalues: Loading (copy), Sellers (copy), TradingPlazaRequest (copy), Towers (copy), Items (copy), Presents (copy), ReplicatedStorage (copy), SellFrame (copy), PlazaFrame (copy), Rarities (copy), MarketFrame (copy), InventoryFrame (copy), SaleAmount (copy), SellAmount (copy), clear (copy), Formatter (copy), t2 (copy), v4 (ref), Players (copy), Tween (copy), StatRerolls (copy), v3 (ref) ]]
	Loading.Visible = false
	if p1 and p1 ~= "Souls" then
		Loading.Visible = true
		Sellers:SetAttribute("Unit", p1)
		Sellers:SetAttribute("Shiny", p2)
		local v1 = TradingPlazaRequest:InvokeServer("GetSellers", p1, nil, p2)
		if not v1 then
			Loading.Visible = false
		else
			local v2 = Towers[p1] ~= nil
			if not v2 then
				p2 = false
			end
			local v32 = if v2 and Towers[p1] then Towers[p1] elseif v2 or not Items[p1] then if v2 or not Presents[p1] then nil else Presents[p1] else Items[p1]
			if not v32 then
				Loading.Visible = false
			else
				local v42 = if p2 then ReplicatedStorage.Gradients.Shiny.Color elseif v32.Rarity and ReplicatedStorage.Gradients:FindFirstChild(v32.Rarity) then ReplicatedStorage.Gradients[v32.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
				SellFrame.Visible = false
				PlazaFrame.SellUnitsTitle.Visible = false
				Rarities.Visible = false
				MarketFrame.Visible = false
				InventoryFrame.Visible = false
				SaleAmount.Visible = false
				SellAmount.Visible = false
				Sellers.Visible = false
				Rarities.Visible = false
				if not v2 and v32.Name then
					p1 = v32.Name
				end
				Sellers.UnitName.Text = p2 and "Shiny " .. p1 or p1
				Sellers.Price.Info.Text = "N/A"
				Sellers.SellerName.Text = "N/A"
				Sellers.Holder.BorderImage.TowerImage.Image = v32.Image or ""
				Sellers.Holder.BorderImage.UIGradient.Color = v42
				Sellers.Holder.Frame.UIGradient.Color = v42
				Sellers.Holder.Shiny.Visible = p2
				Sellers.Visible = true
				local t = {}
				for v6, v7 in v1 do
					for v8, v9 in v7 do
						if v9.Price then
							local t3 = {
								Seller = v6,
								Price = v9.Price
							}
							t3.Enchant = v2 and v9.Enchant or ""
							t3.Name = v9.Name
							t3.Shiny = v2 and v9.IsShiny or false
							t3.ID = v9.ID
							t3.Stats = v9.Stats
							t3.Amount = v9.Amount
							table.insert(t, t3)
						end
					end
				end
				pcall(clear, Sellers.ScrollingFrame)
				Loading.Visible = false
				if #t > 0 then
					table.sort(t, function(p1, p2) --[[ Line: 202 ]]
						return p1.Price < p2.Price
					end)
					local v12 = t[1]
					Sellers.SellerName.Text = ("@%*"):format(v12.Seller)
					Sellers.Price.Info.Text = Formatter.AbreviatedFormat(v12.Price)
					for v13, v14 in t2 do
						v14:Disconnect()
					end
					table.clear(t2)
					local function f16() --[[ Line: 210 | Upvalues: v4 (ref), Loading (ref), TradingPlazaRequest (ref), v12 (copy), p1 (ref), p2 (ref) ]]
						if v4 then
							return
						end
						Loading.Visible = true
						if TradingPlazaRequest:InvokeServer("Buy", v12) then
							task.delay(1, showSellers, p1, p2)
						else
							Loading.Visible = false
						end
					end
					table.insert(t2, Sellers.Price.Activated:Connect(f16))
					for v17, v18 in t do
						if v18.Seller and v18.Price then
							local v19 = Players:FindFirstChild(v18.Seller)
							if v19 then
								local v20 = Players:GetUserThumbnailAsync(v19.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
								local v21 = script.SellerSample:Clone()
								v21.LayoutOrder = v17
								v21.Name = v18.Seller
								v21.Price.Info.Text = Formatter.AbreviatedFormat(v18.Price) or "N/A"
								v21.User.Text = ("@%*"):format(v18.Seller)
								v21.Img.Image = v20 or ""
								v21.Icon.Image = v32.Image
								v21.Parent = Sellers.ScrollingFrame
								v21.Visible = true
								if v2 then
									local Enchant = v18.Enchant
									local v22 = if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false
									if v22 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v18.Enchant) then
										ReplicatedStorage.Objects.Enchants[v18.Enchant]:Clone().Parent = v21
									end
								end
								v21.Price.Activated:Connect(function() --[[ Line: 238 | Upvalues: v4 (ref), Loading (ref), TradingPlazaRequest (ref), v18 (copy), p1 (ref), p2 (ref) ]]
									if v4 then
										return
									end
									Loading.Visible = true
									if TradingPlazaRequest:InvokeServer("Buy", v18) then
										task.delay(1, showSellers, p1, p2)
									else
										Loading.Visible = false
									end
								end)
								Tween:AddButton(v21.Price, nil, "ButtonClick", nil, true)
								if v18.Amount then
									v21.Amount.Text = ("x%*"):format(v18.Amount)
								end
								if v18.Stats then
									v21.Stats.Visible = true
									Tween:AddButton(v21.Stats)
									v21.Stats.Activated:Connect(function() --[[ Line: 255 | Upvalues: v21 (copy), StatRerolls (ref), v18 (copy) ]]
										v21.StatFrame.Visible = not v21.StatFrame.Visible
										local Holder = v21.StatFrame.Holder
										for k, v in pairs({ "Damage", "Range", "Cooldown" }) do
											local v1 = StatRerolls.GetLetterStats(v, v18.Stats[v], true)
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
									continue
								end
								v21.Stats.Visible = false
							end
						end
					end
				else
					v3 = "all"
					Rarities.Visible = true
					MarketFrame.Visible = true
					Sellers.Visible = false
					InventoryFrame.Visible = false
					SellFrame.Visible = false
					PlazaFrame.SellUnitsTitle.Visible = false
					SaleAmount.Visible = false
					SellAmount.Visible = false
					task.delay(1, updatePlazaData)
				end
			end
		end
	end
end
function updateInventory() --[[ updateInventory | Line: 304 | Upvalues: Loading (copy), clear (copy), InventoryFrame (copy), ClientState (copy), Towers (copy), ReplicatedStorage (copy), HttpService_2 (copy), t (copy), Tween (copy), v4 (ref), v2 (ref), SaleAmount (copy), Presents (copy), SellAmount (copy), Items (copy) ]]
	Loading.Visible = true
	task.spawn(clear, InventoryFrame.HolderFrame.Items)
	local v1 = ClientState.GetData()
	if not v1 then
		return
	end
	for v42, v5 in v1.Towers do
		local v22, v3
		local v6, v7, v8, v9, v10, v11, v12, v13, v14
		if v5.Shiny then
			if not v5.Stats then
				v6 = v5.Enchant
				v7 = if v6 and typeof(v6) == "string" then if v6 and #v6 > 1 then true else false else false
				if v7 and not v5.Shiny then
					v8 = InventoryFrame.HolderFrame.Items:FindFirstChild(v5.Enchant .. v5.Name)
					if v8 then
						v8:SetAttribute("Owned", v8:GetAttribute("Owned") + 1)
						v8.Info.Text = ("x%*"):format((v8:GetAttribute("Owned")))
						v8.Info.Visible = true
						continue
					end
				end
				v9 = v5.Enchant
				v10 = if v9 and typeof(v9) == "string" then if v9 and #v9 > 1 then true else false else false
				if v10 and v5.Shiny then
					v11 = InventoryFrame.HolderFrame.Items:FindFirstChild("Shiny" .. v5.Enchant .. v5.Name)
					if v11 and v11.Shiny.Visible then
						v11:SetAttribute("Owned", v11:GetAttribute("Owned") + 1)
						v11.Info.Text = ("x%*"):format((v11:GetAttribute("Owned")))
						v11.Info.Visible = true
						continue
					end
				end
				v12 = v5.Enchant
				v13 = if v12 and typeof(v12) == "string" then if v12 and #v12 > 1 then true else false else false
				if not v13 and v5.Shiny then
					v14 = InventoryFrame.HolderFrame.Items:FindFirstChild("Shiny" .. v5.Name)
					if v14 and v14.Shiny.Visible then
						v14:SetAttribute("Owned", v14:GetAttribute("Owned") + 1)
						v14.Info.Text = ("x%*"):format((v14:GetAttribute("Owned")))
						v14.Info.Visible = true
						continue
					end
				end
			end
		else
			local Enchant = v5.Enchant
			if (if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false) or v5.Stats then
				if not v5.Stats then
					v6 = v5.Enchant
					v7 = if v6 and typeof(v6) == "string" then if v6 and #v6 > 1 then true else false else false
					if v7 and not v5.Shiny then
						v8 = InventoryFrame.HolderFrame.Items:FindFirstChild(v5.Enchant .. v5.Name)
						if v8 then
							v8:SetAttribute("Owned", v8:GetAttribute("Owned") + 1)
							v8.Info.Text = ("x%*"):format((v8:GetAttribute("Owned")))
							v8.Info.Visible = true
							continue
						end
					end
					v9 = v5.Enchant
					v10 = if v9 and typeof(v9) == "string" then if v9 and #v9 > 1 then true else false else false
					if v10 and v5.Shiny then
						v11 = InventoryFrame.HolderFrame.Items:FindFirstChild("Shiny" .. v5.Enchant .. v5.Name)
						if v11 and v11.Shiny.Visible then
							v11:SetAttribute("Owned", v11:GetAttribute("Owned") + 1)
							v11.Info.Text = ("x%*"):format((v11:GetAttribute("Owned")))
							v11.Info.Visible = true
							continue
						end
					end
					v12 = v5.Enchant
					v13 = if v12 and typeof(v12) == "string" then if v12 and #v12 > 1 then true else false else false
					if not v13 and v5.Shiny then
						v14 = InventoryFrame.HolderFrame.Items:FindFirstChild("Shiny" .. v5.Name)
						if v14 and v14.Shiny.Visible then
							v14:SetAttribute("Owned", v14:GetAttribute("Owned") + 1)
							v14.Info.Text = ("x%*"):format((v14:GetAttribute("Owned")))
							v14.Info.Visible = true
							continue
						end
					end
				end
			else
				local v16 = InventoryFrame.HolderFrame.Items:FindFirstChild(v5.Name)
				if v16 and not v16.Shiny.Visible then
					v16:SetAttribute("Owned", v16:GetAttribute("Owned") + 1)
					v16.Info.Text = ("x%*"):format((v16:GetAttribute("Owned")))
					v16.Info.Visible = true
					continue
				end
			end
		end
		local v17 = Towers[v5.Name]
		if v17 then
			v22 = if v5.Shiny then ReplicatedStorage.Gradients.Shiny.Color elseif v17.Rarity and ReplicatedStorage.Gradients:FindFirstChild(v17.Rarity) then ReplicatedStorage.Gradients[v17.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
			local v18 = script.InventorySample:Clone()
			if v5.Stats then
				v18.Name = v18.Name .. "_Stats" .. HttpService_2:GenerateGUID(false)
			end
			local Rarity = v17.Rarity
			v18.LayoutOrder = 10 - (table.find(t, Rarity) and table.find(t, Rarity) or 0)
			local Enchant = v5.Enchant
			if (if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false) and not v5.Shiny then
				v3 = v5.Enchant .. v5.Name
			else
				local Enchant_2 = v5.Enchant
				v3 = if (if Enchant_2 and typeof(Enchant_2) == "string" then if Enchant_2 and #Enchant_2 > 1 then true else false else false) and v5.Shiny then "Shiny" .. v5.Enchant .. v5.Name elseif v5.Shiny then "Shiny" .. v5.Name else v5.Name
			end
			v18.Name = v3
			v18.BorderImage.TowerImage.Image = v17.Image or ""
			v18.BorderImage.UIGradient.Color = v22
			v18.Frame.UIGradient.Color = v22
			v18.Shiny.Visible = if v5.Shiny then true else false
			v18.Stat.Visible = if v5.Stats then true else false
			local Enchant_2 = v5.Enchant
			local v24 = if Enchant_2 and typeof(Enchant_2) == "string" then if Enchant_2 and #Enchant_2 > 1 then true else false else false
			if v24 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v5.Enchant) then
				ReplicatedStorage.Objects.Enchants[v5.Enchant]:Clone().Parent = v18
			end
			v18.Info.Text = "x1"
			v18:SetAttribute("Owned", 1)
			v18:SetAttribute("Rarity", v17.Rarity)
			v18:SetAttribute("Unit", v5.Name)
			v18:SetAttribute("Shiny", v5.Shiny)
			v18.Parent = InventoryFrame.HolderFrame.Items
			v18.Visible = true
			Tween:AddButton(v18, nil, "ButtonClick", nil, true)
			v18.Activated:Connect(function() --[[ Line: 380 | Upvalues: v4 (ref), v2 (ref), v5 (copy), InventoryFrame (ref), SaleAmount (ref) ]]
				if not v4 then
					v2 = v5.Stats
					InventoryFrame.Visible = false
					SaleAmount:SetAttribute("ID", v5.Name)
					SaleAmount:SetAttribute("Shiny", v5.Shiny)
					SaleAmount:SetAttribute("Enchant", v5.Enchant)
					SaleAmount:SetAttribute("RealID", v5.ID)
					SaleAmount.Visible = true
				end
			end)
		end
	end
	for v26, v27 in v1.Presents do
		local v25
		if not (v27 <= 0) then
			local v28 = Presents[v26]
			if v28 then
				v25 = if v28.Rarity and ReplicatedStorage.Gradients:FindFirstChild(v28.Rarity) then ReplicatedStorage.Gradients[v28.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
				local v29 = script.InventorySample:Clone()
				local Rarity = v28.Rarity
				v29.LayoutOrder = 10 - (table.find(t, Rarity) and table.find(t, Rarity) or 0)
				v29.Name = v26
				v29.BorderImage.TowerImage.Image = v28.Image or ""
				v29.BorderImage.UIGradient.Color = v25
				v29.Frame.UIGradient.Color = v25
				v29.Shiny.Visible = false
				v29.Info.Text = "x" .. v27
				v29:SetAttribute("Owned", 1)
				v29:SetAttribute("Rarity", v28.Rarity)
				v29:SetAttribute("Unit", v26)
				v29:SetAttribute("Shiny", false)
				v29:SetAttribute("IsItem", true)
				v29.Parent = InventoryFrame.HolderFrame.Items
				v29.Visible = true
				Tween:AddButton(v29, nil, "ButtonClick", nil, true)
				v29.Activated:Connect(function() --[[ Line: 417 | Upvalues: v4 (ref), InventoryFrame (ref), SaleAmount (ref), v26 (copy), SellAmount (ref) ]]
					if not v4 then
						InventoryFrame.Visible = false
						SaleAmount:SetAttribute("ID", v26)
						SaleAmount:SetAttribute("Shiny", false)
						SaleAmount:SetAttribute("Enchant", "")
						SellAmount.Visible = true
					end
				end)
			end
		end
	end
	for v32, v33 in v1.Items do
		local v31
		if v32 ~= "Souls" and not (v33 <= 0) then
			local v34 = Items[v32]
			if v34 then
				v31 = if v34.Rarity and ReplicatedStorage.Gradients:FindFirstChild(v34.Rarity) then ReplicatedStorage.Gradients[v34.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
				local v35 = script.InventorySample:Clone()
				local Rarity = v34.Rarity
				v35.LayoutOrder = 10 - (table.find(t, Rarity) and table.find(t, Rarity) or 0)
				v35.Name = v32
				v35.BorderImage.TowerImage.Image = v34.Image or ""
				v35.BorderImage.UIGradient.Color = v31
				v35.Frame.UIGradient.Color = v31
				v35.Shiny.Visible = false
				v35.Info.Text = "x" .. v33
				v35:SetAttribute("Owned", 1)
				v35:SetAttribute("Rarity", v34.Rarity)
				v35:SetAttribute("Unit", v32)
				v35:SetAttribute("Shiny", false)
				v35:SetAttribute("IsItem", true)
				v35.Parent = InventoryFrame.HolderFrame.Items
				v35.Visible = true
				Tween:AddButton(v35, nil, "ButtonClick", nil, true)
				v35.Activated:Connect(function() --[[ Line: 452 | Upvalues: v4 (ref), InventoryFrame (ref), SaleAmount (ref), v32 (copy), SellAmount (ref) ]]
					if not v4 then
						InventoryFrame.Visible = false
						SaleAmount:SetAttribute("ID", v32)
						SaleAmount:SetAttribute("Shiny", false)
						SaleAmount:SetAttribute("Enchant", "")
						SellAmount.Visible = true
					end
				end)
			end
		end
	end
	Loading.Visible = false
end
function updateSlot() --[[ updateSlot | Line: 465 | Upvalues: clear (copy), SellFrame (copy), ClientState (copy), Loading (copy), Towers (copy), Items (copy), Presents (copy), ReplicatedStorage (copy), Formatter (copy), Tween (copy), v4 (ref), SaleAmount (copy), TradingPlazaRequest (copy), InventoryFrame (copy) ]]
	task.spawn(clear, SellFrame.Units)
	local v1 = ClientState.GetData()
	if not v1 then
		Loading.Visible = false
		return
	end
	local v2 = 12 - #v1.TradingPlaza
	Loading.Visible = false
	for i = 12, 1, -1 do
		local v3
		local v42 = 13 - i
		local v5 = script.SlotSample:Clone()
		v5.Name = v42
		v5.LayoutOrder = v42
		local v6 = nil
		if i <= v2 then
			v5.Info.Visible = true
			v5.Price.Visible = false
			v5.Shiny.Visible = false
			v5.Frame.Visible = false
			v5.BorderImage.TowerImage.Visible = false
			if v5.BorderImage:FindFirstChild("UIGradient") then
				v5.BorderImage.UIGradient.Enabled = false
			end
			Tween:AddButton(v5, nil, "ButtonClick", nil, true)
			v5.Activated:Connect(function() --[[ Line: 515 | Upvalues: v4 (ref), Loading (ref), SaleAmount (ref), v5 (copy), v6 (ref), TradingPlazaRequest (ref), InventoryFrame (ref) ]]
				if v4 then
					return
				end
				Loading.Visible = true
				SaleAmount:SetAttribute("ID", nil)
				SaleAmount:SetAttribute("Shiny", nil)
				SaleAmount:SetAttribute("Enchant", nil)
				SaleAmount:SetAttribute("RealID", nil)
				task.spawn(updateInventory)
				if v5.Info.Visible then
					InventoryFrame.Visible = true
				else
					if not v6 then
						Loading.Visible = false
						return
					end
					Loading.Visible = true
					if not TradingPlazaRequest:InvokeServer("RemoveSlot", v6) then
						Loading.Visible = false
						return
					end
					task.delay(1, updatePlazaData)
					task.delay(1, updateInventory)
					task.delay(1, updateSlot)
				end
				Loading.Visible = false
			end)
			v5.Parent = SellFrame.Units
		else
			v5.Info.Visible = false
			v5.Price.Visible = true
			v5.Frame.Visible = true
			v5.BorderImage.TowerImage.Visible = true
			if v5.BorderImage:FindFirstChild("UIGradient") then
				v5.BorderImage.UIGradient.Enabled = true
			end
			v6 = v1.TradingPlaza[v42]
			if v6 then
				local v7 = Towers[v6.Name] or (Items[v6.Name] or (Presents[v6.Name] or nil))
				if v7 then
					v3 = if v6.IsShiny then ReplicatedStorage.Gradients.Shiny.Color elseif v7.Rarity and ReplicatedStorage.Gradients:FindFirstChild(v7.Rarity) then ReplicatedStorage.Gradients[v7.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
					v5.BorderImage.TowerImage.Image = v7.Image or ""
					v5.BorderImage.UIGradient.Color = v3
					v5.Frame.UIGradient.Color = v3
					v5.Price.Info.Text = Formatter.AbreviatedFormat(v6.Price) or "N/A"
					local Enchant = v6.Enchant
					local v8 = if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false
					if v8 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v6.Enchant) then
						ReplicatedStorage.Objects.Enchants[v6.Enchant]:Clone().Parent = v5
					end
					Tween:AddButton(v5, nil, "ButtonClick", nil, true)
					v5.Activated:Connect(function() --[[ Line: 515 | Upvalues: v4 (ref), Loading (ref), SaleAmount (ref), v5 (copy), v6 (ref), TradingPlazaRequest (ref), InventoryFrame (ref) ]]
						if v4 then
							return
						end
						Loading.Visible = true
						SaleAmount:SetAttribute("ID", nil)
						SaleAmount:SetAttribute("Shiny", nil)
						SaleAmount:SetAttribute("Enchant", nil)
						SaleAmount:SetAttribute("RealID", nil)
						task.spawn(updateInventory)
						if v5.Info.Visible then
							InventoryFrame.Visible = true
						else
							if not v6 then
								Loading.Visible = false
								return
							end
							Loading.Visible = true
							if not TradingPlazaRequest:InvokeServer("RemoveSlot", v6) then
								Loading.Visible = false
								return
							end
							task.delay(1, updatePlazaData)
							task.delay(1, updateInventory)
							task.delay(1, updateSlot)
						end
						Loading.Visible = false
					end)
					v5.Parent = SellFrame.Units
					continue
				end
				v5:Destroy()
				continue
			end
			v5:Destroy()
		end
	end
end
function createUnitFrame(p1, p2, p3, p4, p5, p6) --[[ createUnitFrame | Line: 540 | Upvalues: ReplicatedStorage (copy), t (copy), Formatter (copy), Tween (copy), v4 (ref) ]]
	if not (p2 and (p3 and p5)) then
		return
	end
	if p6 then
		p4 = false
	end
	local v1 = if p4 then ReplicatedStorage.Gradients.Shiny.Color elseif p2.Rarity and ReplicatedStorage.Gradients:FindFirstChild(p2.Rarity) then ReplicatedStorage.Gradients[p2.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
	if p4 and p3:FindFirstChild("Shiny" .. p1) then
		p3:FindFirstChild("Shiny" .. p1):Destroy()
	elseif not p4 and p3:FindFirstChild(p1) then
		p3:FindFirstChild(p1):Destroy()
	end
	local v2 = script.MarketSample:Clone()
	local Rarity = p2.Rarity
	v2.LayoutOrder = 10 - (table.find(t, Rarity) and table.find(t, Rarity) or 0)
	v2.Name = p4 and "Shiny" .. p1 or p1
	v2.Price.Info.Text = Formatter.AbreviatedFormat(p5) or "N/A"
	v2.BorderImage.TowerImage.Image = p2.Image or ""
	v2.BorderImage.UIGradient.Color = v1
	v2.Frame.UIGradient.Color = v1
	v2.Shiny.Visible = if p4 then true else false
	v2.Visible = true
	v2:SetAttribute("Unit", p1)
	v2:SetAttribute("Rarity", p2.Rarity)
	v2:SetAttribute("Shiny", p4)
	v2.Parent = p3
	Tween:AddButton(v2, nil, "ButtonClick", nil, true)
	v2.Activated:Connect(function() --[[ Line: 572 | Upvalues: v4 (ref), p1 (copy), p4 (ref) ]]
		if not v4 then
			task.spawn(showSellers, p1, p4)
		end
	end)
end
function updateFrame(p1) --[[ updateFrame | Line: 579 | Upvalues: v1 (ref), clear (copy), MarketFrame (copy), Players (copy), Towers (copy), Items (copy), Presents (copy), sortFrame (copy) ]]
	if not v1 then
		return
	end
	task.spawn(clear, MarketFrame.Units)
	for v12, v2 in v1 do
		local count = 0
		local v3 = (1 / 0)
		local count_2 = 0
		local v4 = (1 / 0)
		for v5, v6 in v2 do
			if Players:FindFirstChild(v5) then
				for v7, v8 in v6 do
					if v8.ID and (v8.Name and v8.Price) then
						if v8.IsShiny then
							count_2 = count_2 + 1
							if v8.Price < v4 then
								v4 = v8.Price
							end
							continue
						end
						count = count + 1
						if v8.Price < v3 then
							v3 = v8.Price
						end
					end
				end
			end
		end
		local v9 = Towers[v12] or (Items[v12] or (Presents[v12] or nil))
		local v10 = not Towers[v12]
		if v9 then
			if count_2 > 0 then
				task.defer(createUnitFrame, v12, v9, MarketFrame.Units, true, v4, v10)
			end
			if count > 0 then
				task.defer(createUnitFrame, v12, v9, MarketFrame.Units, false, v3, v10)
			end
			pcall(sortFrame)
		end
	end
	task.defer(sortFrame)
end
Remotes.Misc.TradingPlaza.OnClientEvent:Connect(function(p1) --[[ Line: 624 | Upvalues: v1 (ref), HttpService (copy) ]]
	if p1 then
		v1 = HttpService:JSONDecode(p1)
		task.defer(updateFrame, "none")
	end
end)
Remotes.Misc.TradingPlazaUpdate.OnClientEvent:Connect(function() --[[ Line: 630 | Upvalues: Sellers (copy) ]]
	task.delay(1, updateFrame, "none")
	task.delay(1, updateSlot)
	if not (Sellers.Visible and Sellers:GetAttribute("Unit")) then
		return
	end
	task.delay(1, showSellers, Sellers:GetAttribute("Unit"), Sellers:GetAttribute("Shiny"))
end)
Remotes.Misc.TradingPlazaOpen.OnClientEvent:Connect(function() --[[ Line: 638 | Upvalues: PlazaFrame (copy) ]]
	if not (script.Parent.Parent:FindFirstChild("Trade") and script.Parent.Parent.Trade.TradeFrame.Visible) then
		PlazaFrame.Visible = true
		script.Parent.Parent.Trade.Players.Visible = false
		script.Parent.Parent.Inventory.InventoryFrame.Visible = false
	end
end)
PlazaFrame.Buy.Activated:Connect(function() --[[ Line: 648 | Upvalues: v4 (ref), Loading (copy), v3 (ref), Rarities (copy), MarketFrame (copy), Sellers (copy), InventoryFrame (copy), SellFrame (copy), PlazaFrame (copy), SaleAmount (copy), SellAmount (copy) ]]
	if not v4 then
		Loading.Visible = true
		v3 = "all"
		Rarities.Visible = true
		MarketFrame.Visible = true
		Sellers.Visible = false
		InventoryFrame.Visible = false
		SellFrame.Visible = false
		PlazaFrame.SellUnitsTitle.Visible = false
		SaleAmount.Visible = false
		SellAmount.Visible = false
		task.delay(1, updatePlazaData)
	end
end)
PlazaFrame.Sell.Activated:Connect(function() --[[ Line: 663 | Upvalues: v4 (ref), Loading (copy), SellFrame (copy), PlazaFrame (copy), Rarities (copy), MarketFrame (copy), InventoryFrame (copy), SaleAmount (copy), SellAmount (copy), Sellers (copy) ]]
	if not v4 then
		Loading.Visible = true
		SellFrame.Visible = true
		PlazaFrame.SellUnitsTitle.Visible = true
		Rarities.Visible = false
		MarketFrame.Visible = false
		InventoryFrame.Visible = false
		SaleAmount.Visible = false
		SellAmount.Visible = false
		Sellers.Visible = false
		task.defer(updateSlot)
	end
end)
PlazaFrame.Exit.Activated:Connect(function() --[[ Line: 677 | Upvalues: v4 (ref), PlazaFrame (copy) ]]
	if not v4 then
		PlazaFrame.Visible = false
	end
end)
SaleAmount.Enter.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 682 | Upvalues: SaleAmount (copy) ]]
	tonumber(SaleAmount.Enter.TextBox.Text)
	local v1 = tonumber(SaleAmount.Enter.TextBox.Text)
	if not v1 then
		return
	end
	SaleAmount.Enter.TextBox.Text = math.round(v1)
end)
ConfirmFrame.No.Activated:Connect(function() --[[ Line: 695 | Upvalues: v4 (ref), ConfirmFrame (copy), SaleAmount (copy), SellAmount (copy) ]]
	if not v4 then
		ConfirmFrame.Message.Text = "Are you sure you want to ... ?"
		ConfirmFrame:SetAttribute("ID", nil)
		ConfirmFrame:SetAttribute("Shiny", nil)
		ConfirmFrame:SetAttribute("Enchant", nil)
		ConfirmFrame.Visible = false
		SaleAmount.Visible = false
		SellAmount.Visible = false
	end
end)
ConfirmFrame.Yes.Activated:Connect(function() --[[ Line: 706 | Upvalues: v4 (ref), SaleAmount (copy), ConfirmFrame (copy), Loading (copy), TradingPlazaRequest (copy) ]]
	if v4 then
		return
	end
	local v1 = tonumber(SaleAmount.Enter.TextBox.Text)
	ConfirmFrame.Yes.Visible = false
	ConfirmFrame.No.Visible = false
	Loading.Visible = true
	if TradingPlazaRequest:InvokeServer("InsertSlot", ConfirmFrame:GetAttribute("ID"), v1, ConfirmFrame:GetAttribute("Shiny"), ConfirmFrame:GetAttribute("Enchant"), ConfirmFrame:GetAttribute("RealID"), ConfirmFrame:GetAttribute("Amount")) then
		task.delay(1, updateSlot)
		ConfirmFrame.Visible = false
		SaleAmount.Visible = false
		ConfirmFrame:SetAttribute("ID", nil)
		ConfirmFrame:SetAttribute("Shiny", nil)
		ConfirmFrame:SetAttribute("Enchant", nil)
	else
		SaleAmount.Visible = false
		Loading.Visible = false
		ConfirmFrame.Visible = false
	end
end)
SaleAmount.Confirm.Activated:Connect(function() --[[ Line: 723 | Upvalues: v4 (ref), SaleAmount (copy), Loading (copy), ConfirmFrame (copy), Formatter (copy) ]]
	if not v4 then
		local v1 = tonumber(SaleAmount.Enter.TextBox.Text)
		Loading.Visible = true
		SaleAmount.Visible = false
		ConfirmFrame:SetAttribute("ID", SaleAmount:GetAttribute("ID"))
		ConfirmFrame:SetAttribute("Shiny", SaleAmount:GetAttribute("Shiny"))
		ConfirmFrame:SetAttribute("Enchant", SaleAmount:GetAttribute("Enchant"))
		ConfirmFrame:SetAttribute("RealID", SaleAmount:GetAttribute("RealID"))
		ConfirmFrame:SetAttribute("Amount", SaleAmount:GetAttribute("Amount"))
		SaleAmount:SetAttribute("ID", nil)
		SaleAmount:SetAttribute("Shiny", nil)
		SaleAmount:SetAttribute("Enchant", nil)
		SaleAmount:SetAttribute("Amount", nil)
		ConfirmFrame.Yes.Visible = true
		ConfirmFrame.No.Visible = true
		ConfirmFrame.Message.Text = ("Are you sure you want to sell for %* souls ?"):format((Formatter.AbreviatedFormat(v1)))
		ConfirmFrame.Visible = true
		Loading.Visible = false
	end
end)
SaleAmount.Exit.Activated:Connect(function() --[[ Line: 744 | Upvalues: v4 (ref), SaleAmount (copy) ]]
	if not v4 then
		SaleAmount:SetAttribute("ID", nil)
		SaleAmount:SetAttribute("Shiny", nil)
		SaleAmount:SetAttribute("Enchant", nil)
		SaleAmount.Visible = false
	end
end)
SellAmount.Exit.Activated:Connect(function() --[[ Line: 752 | Upvalues: v4 (ref), SaleAmount (copy), SellAmount (copy) ]]
	if not v4 then
		SaleAmount:SetAttribute("ID", nil)
		SaleAmount:SetAttribute("Shiny", nil)
		SaleAmount:SetAttribute("Enchant", nil)
		SellAmount.Visible = false
	end
end)
SellAmount.Single.Activated:Connect(function() --[[ Line: 760 | Upvalues: v4 (ref), SaleAmount (copy), SellAmount (copy) ]]
	if not v4 then
		SaleAmount:SetAttribute("Amount", 1)
		SaleAmount.Visible = true
		SellAmount.Visible = false
	end
end)
SellAmount.Multi.Activated:Connect(function() --[[ Line: 766 | Upvalues: v4 (ref), SaleAmount (copy), SellAmount (copy) ]]
	if not v4 then
		SaleAmount:SetAttribute("Amount", 10)
		SaleAmount.Visible = true
		SellAmount.Visible = false
	end
end)
InventoryFrame.Exit.Activated:Connect(function() --[[ Line: 773 | Upvalues: v4 (ref), InventoryFrame (copy), SaleAmount (copy) ]]
	if not v4 then
		InventoryFrame.Visible = false
		SaleAmount:SetAttribute("ID", nil)
		SaleAmount:SetAttribute("Shiny", nil)
		SaleAmount:SetAttribute("Enchant", nil)
		SaleAmount.Visible = false
	end
end)
InventoryFrame.Search.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 782 | Upvalues: InventoryFrame (copy) ]]
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
PlazaFrame.Search.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 805 | Upvalues: PlazaFrame (copy), MarketFrame (copy) ]]
	local v1 = PlazaFrame.Search.TextBox.Text:lower()
	local v2 = v1:match("shiny") ~= nil
	local _, v3 = v1:find("shiny ")
	for v4, v5 in MarketFrame.Units:GetChildren() do
		if v5:IsA("ImageButton") then
			v5.Visible = false
			if not v2 or v5:GetAttribute("Shiny") then
				if v2 and #PlazaFrame.Search.TextBox.Text == 5 then
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
Tween:AddButton(PlazaFrame.Buy, nil, "ButtonClick", nil, true)
Tween:AddButton(PlazaFrame.Sell, nil, "ButtonClick", nil, true)
Tween:AddButton(PlazaFrame.Exit, nil, "ButtonClick", nil, true)
Tween:AddButton(SaleAmount.Confirm, nil, "ButtonClick", nil, true)
Tween:AddButton(SaleAmount.Exit, nil, "ButtonClick", nil, true)
Tween:AddButton(Sellers.Price, nil, "ButtonClick", nil, true)
Tween:AddButton(ConfirmFrame.Yes, nil, "ButtonClick", nil, true)
Tween:AddButton(ConfirmFrame.No, nil, "ButtonClick", nil, true)
Tween:AddButton(SellAmount.Single, nil, "ButtonClick", nil, true)
Tween:AddButton(SellAmount.Multi, nil, "ButtonClick", nil, true)
Tween:AddButton(SellAmount.Exit, nil, "ButtonClick", nil, true)
task.defer(function() --[[ Line: 841 | Upvalues: Loading (copy), v4 (ref) ]]
	while true do
		if Loading.Visible then
			v4 = true
			local Icon = Loading.Icon
			Icon.Rotation = Icon.Rotation + 57.29577951308232
		else
			v4 = false
		end
		task.wait(0.03333333333333333)
	end
end)
for k, v in pairs(Rarities:GetChildren()) do
	if v:IsA("ImageButton") and (table.find(t, v.Name) or v.Name == "Items") then
		v.Activated:Connect(function() --[[ Line: 856 | Upvalues: v4 (ref), v3 (ref), v (copy), sortFrame (copy), Rarities (copy), t (copy) ]]
			if v4 then
				return
			end
			v3 = if v3 == v.Name then "all" else v.Name
			task.defer(sortFrame)
			for k, v2 in pairs(Rarities:GetChildren()) do
				if v2:IsA("ImageButton") and (table.find(t, v2.Name) or v2.Name == "Items") then
					if v3 == v2.Name then
						v2.ImageColor3 = Color3.fromRGB(255, 255, 255)
						v2.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						continue
					end
					v2.ImageColor3 = Color3.fromRGB(116, 116, 116)
					v2.TextLabel.TextColor3 = Color3.fromRGB(116, 116, 116)
				end
			end
		end)
		Tween:AddButton(v, nil, "ButtonClick", nil, true)
	end
end
for v6, v7 in PlazaFrame:GetDescendants() do
	if v7:IsA("Frame") or (v7:IsA("ImageLabel") or (v7:IsA("ImageButton") or (v7:IsA("TextButton") or v7:IsA("TextBox")))) then
		v7.Selectable = true
	end
end
task.spawn(clear, MarketFrame.Units)
task.delay(1, updatePlazaData)
task.delay(1, updateSlot)
task.delay(1, updateInventory)