-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ItemRewardDisplay")
local v2 = Sonar("IssueResponseClient")
local v3 = Sonar("ItemCarousel")
local v4 = Sonar("WeightedProbability")
local v5 = Sonar("MarketplaceUtils")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("TimeSeedClass")
local v8 = Sonar("PlayerWrapper")
local v9 = Sonar("FormatNumber")
local v10 = Sonar("FormatString")
local v11 = Sonar("StorageUtils")
local v12 = Sonar("GuiManager")
local v13 = Sonar("ButtonTest")
local v14 = Sonar("TabManager")
local v15 = Sonar("MissionsService")
local v16 = Sonar("RemoteUtils")
local v17 = Sonar("Constants")
local v18 = Sonar("State")
local v19 = Sonar("Maid")
local v20 = Sonar("StatBar")
local v21 = Sonar("TimeUtils")
local v22 = Sonar("NotificationsClient")
local v23 = Sonar("CapsuleService")
local v24 = Sonar("ShopService")
local v25 = Sonar("GuiUtils")
local v26 = Sonar("ItemSetService")
local v27 = Sonar("ViewportModel")
local v28 = Sonar("AnimalCosmetics")
if v17.EventName then
	local v29 = Sonar(v11.Get("Lootbox"))
	local v30 = Sonar(ReplicatedStorage.Storage.Events[v17.EventName].EventProducts)
	local v31 = Sonar(ReplicatedStorage.Storage.Events[v17.EventName].ActiveActivities)
	local LocalPlayer = Players.LocalPlayer
	local v32 = v8.GetClient()
	local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("EventJournalGui").ContainerFrame
	function t.Open(p1) --[[ Open | Line: 55 | Upvalues: v12 (copy), ContainerFrame (copy), t (copy) ]]
		v12.OpenFrame(ContainerFrame, {
			CloseAll = "CloseOverlay"
		})
		if p1 ~= "PremiumShop" and (type(p1) ~= "table" or p1.Tab ~= "PremiumShop") then
			return
		end
		t:OpenCurrencyShop()
	end
	function t.Close() --[[ Close | Line: 65 | Upvalues: v12 (copy), ContainerFrame (copy) ]]
		v12.CloseFrame(ContainerFrame)
	end
	function t.OnOpen(p1) --[[ OnOpen | Line: 69 ]] end
	function t.OnClose(p1) --[[ OnClose | Line: 73 ]] end
	local v33 = false
	local v34 = false
	local v35 = false
	local v36 = false
	local v37 = v18.new("List")
	local v38 = v18.new("List")
	local v39 = v19.new()
	local v40 = v19.new()
	local t2 = {
		EventActivities = function(p1, p2) --[[ EventActivities | Line: 84 | Upvalues: v36 (ref), v31 (copy) ]]
			if v36 then
				return
			end
			v36 = true
			p1.List.ScrollingFrame.Default.Visible = false
			for v1, v2 in v31 do
				local v3 = p1.List.ScrollingFrame.Default:Clone()
				v3.Title.Text = v2.Name
				v3.Description.Text = v2.Description
				v3.Duration.Text = v2.Duration .. " Seconds"
				v3.ImageLabel.Image = v2.Image
				v3.Visible = true
				v3.Parent = p1.List.ScrollingFrame
			end
		end,
		EventShop = function(p1, p2) --[[ EventShop | Line: 103 | Upvalues: v33 (ref), v17 (copy), v30 (copy), v5 (copy), v9 (copy), v13 (copy), LocalPlayer (copy), v19 (copy), v7 (copy), v10 (copy), v6 (copy), v23 (copy), v32 (copy), v21 (copy), Sonar (copy), ReplicatedStorage (copy), v24 (copy), v2 (copy), v29 (copy), v4 (copy), v3 (copy), ContainerFrame (copy), v26 (copy), v27 (copy), v28 (copy), v14 (copy) ]]
			if v33 then
				return
			end
			v33 = true
			local v1 = false
			local v22 = false
			local v34 = false
			local v42 = false
			local t = {
				Currency = function(p1, p2) --[[ Currency | Line: 110 | Upvalues: v1 (ref), v17 (ref), v30 (ref), v5 (ref), v9 (ref), v13 (ref), LocalPlayer (ref) ]]
					if v1 then
						return
					end
					v1 = true
					if not v17.EventCurrencyName then
						return
					end
					for v12, v2 in p1.Content:GetChildren() do
						task.spawn(function() --[[ Line: 116 | Upvalues: v30 (ref), v17 (ref), v2 (copy), v5 (ref), v9 (ref), v13 (ref), LocalPlayer (ref) ]]
							local v3 = v30[v17.EventCurrencyName][tonumber(v2.Name)]
							if not v3 then
								return
							end
							local ProductId = v3.ProductId
							local v4 = v5.GetProductInfo(ProductId, Enum.InfoType.Product)
							v2.AmountLabel.Text = "$" .. v9.splice(v3.Amount)
							v2.Buy.Top.TextLabel.Text = "\238\128\130 " .. (if v4 then v4.PriceInRobux or "N/A" else "N/A")
							v13.new(v2.Buy, {
								Click = function() --[[ Click | Line: 129 | Upvalues: v5 (ref), LocalPlayer (ref), ProductId (copy) ]]
									v5.PromptPurchase(LocalPlayer, ProductId, "Product")
								end
							})
						end)
					end
				end,
				Featured = function(p1, p2) --[[ Featured | Line: 138 | Upvalues: v22 (ref), v19 (ref), v7 (ref), v17 (ref), v10 (ref), v5 (ref), v13 (ref), LocalPlayer (ref), v6 (ref), v23 (ref), v32 (ref), v30 (ref), v21 (ref) ]]
					if v22 then
						return
					end
					v22 = true
					local v1 = v19.new()
					local Bundles = p1:FindFirstChild("Bundles")
					local v2 = Bundles and Bundles:FindFirstChild("FeaturedBundleDefault")
					if not (Bundles and v2) then
						return
					end
					v2.Visible = false
					local v3 = v7.new({
						Duration = v17.BundleResetTime or 86400
					})
					local function SetupTackBundle(p1, p2) --[[ SetupTackBundle | Line: 156 | Upvalues: v2 (copy), Bundles (copy), v1 (copy), v10 (ref), v5 (ref), v13 (ref), LocalPlayer (ref), v6 (ref), v23 (ref), v32 (ref), v3 (copy) ]]
						local v12 = v2:Clone()
						v12.Name = "TackBundle" .. p1
						v12.Visible = true
						v12.Parent = Bundles
						v1:GiveTask(v12)
						local LootTable = p2.LootTable
						if not LootTable then
							return
						end
						if v12:FindFirstChild("Title", true) then
							v12.Title.Text = p2.DisplayName or v10.separateWordsInString(p2.Species) .. " Pack"
						end
						local v33 = v5.GetPriceForProduct(p2.ProductId, true)
						local BuyButton = v12:FindFirstChild("BuyButton", true)
						if BuyButton then
							if BuyButton:FindFirstChild("Top", true) and BuyButton.Top:FindFirstChild("TextLabel", true) then
								BuyButton.Top.TextLabel.Text = v33 or ""
							end
							v1:GiveTask(v13.new(BuyButton, {
								Click = function() --[[ Click | Line: 179 | Upvalues: v5 (ref), LocalPlayer (ref), p2 (copy) ]]
									v5.PromptPurchase(LocalPlayer, p2.ProductId, "Product")
								end
							}))
						end
						local BundleItems = v12:FindFirstChild("BundleItems", true)
						if not BundleItems then
							return
						end
						local Default = BundleItems:FindFirstChild("Default")
						if Default then
							Default.Visible = false
						end
						local function CreateTackItem(p1) --[[ CreateTackItem | Line: 195 | Upvalues: v6 (ref), BundleItems (copy), v1 (ref), v10 (ref) ]]
							local v2 = v6.GetByName(p1.Name)
							if not v2 then
								return
							end
							local v3 = p1.Amount or 1
							local v5 = (BundleItems:FindFirstChild("Default") or BundleItems):Clone()
							v1:GiveTask(v5)
							v5.Visible = true
							v5.Parent = BundleItems
							local Icon = v5:FindFirstChild("Icon", true)
							local ItemName = v5:FindFirstChild("ItemName", true)
							local Theme = v5:FindFirstChild("Theme", true)
							if Icon then
								Icon.Image = v2.Image
								local UIGradient = Icon:FindFirstChild("UIGradient")
								if UIGradient and v2.ColorSequence then
									UIGradient.Color = v2.ColorSequence
									UIGradient.Enabled = true
								end
							end
							if ItemName then
								ItemName.Text = "x" .. tostring(v3) .. " " .. v10.separateWordsInString(v2.Name)
							end
							if Theme and v2.ItemType == "Equipment" then
								local Theme_2 = p1.Theme
								if not Theme_2 then
									Theme.Visible = false
									return
								end
								local v62 = v6.GetByName(Theme_2)
								if not v62 then
									return
								end
								local ImageLabel = Theme:FindFirstChild("ImageLabel")
								if ImageLabel then
									ImageLabel.Image = v62.Texture or ""
									local UIGradient = ImageLabel:FindFirstChild("UIGradient")
									if UIGradient then
										UIGradient.Color = v62.ColorSequence or ColorSequence.new(Color3.new(255/255, 255/255, 255/255))
										UIGradient.Enabled = true
									end
								end
								Theme.Visible = true
								return
							end
							if not Theme then
								return
							end
							Theme.Visible = false
						end
						for v4, v52 in v23.GetTackItems(v32, LootTable, v3.CurrentSeed) do
							CreateTackItem(v52)
						end
					end
					local function SetupAllTackBundles() --[[ SetupAllTackBundles | Line: 256 | Upvalues: v1 (copy), v30 (ref), SetupTackBundle (copy) ]]
						v1:DoCleaning()
						if not v30.TackProducts then
							return
						end
						for v12, v2 in v30.TackProducts do
							task.spawn(function() --[[ Line: 262 | Upvalues: SetupTackBundle (ref), v12 (copy), v2 (copy) ]]
								SetupTackBundle(v12, v2)
							end)
						end
					end
					v3.SeedChanged:Connect(SetupAllTackBundles)
					SetupAllTackBundles()
					local Items = p1:FindFirstChild("Items")
					local v4 = Items and Items:FindFirstChild("ItemDefault")
					if Items and v4 then
						v4.Visible = false
						local Items_2 = v30.Items
						if Items_2 then
							for v52, v62 in Items_2 do
								task.spawn(function() --[[ Line: 280 | Upvalues: v6 (ref), v52 (copy), v4 (copy), Items (copy), v62 (copy), v10 (ref), v5 (ref), v13 (ref), LocalPlayer (ref) ]]
									local v1 = v6.GetByName(v52)
									if not v1 then
										return
									end
									local v2 = v4:Clone()
									v2.Name = v52
									v2.Visible = true
									v2.Parent = Items
									v2.ItemImage.Image = v1.Image
									v2.Amount.Text = "x1"
									v2.Sale.Visible = v62.Sale and true or false
									local v42 = v2:FindFirstChild("ItemName", true) or v2:FindFirstChild("Title", true)
									if v42 then
										v42.Text = v10.separateWordsInString(v52)
									end
									local v53 = v2:FindFirstChild("BuyButton", true) or v2:FindFirstChild("Buy", true)
									if not v53 then
										return
									end
									local v63 = v5.GetPriceForProduct(v62.ProductId, true)
									if v53:FindFirstChild("Top", true) and v53.Top:FindFirstChild("TextLabel", true) then
										v53.Top.TextLabel.Text = v63 or ""
									end
									v13.new(v53, {
										Click = function() --[[ Click | Line: 308 | Upvalues: v5 (ref), LocalPlayer (ref), v62 (ref) ]]
											v5.PromptPurchase(LocalPlayer, v62.ProductId, "Product")
										end
									})
								end)
							end
						end
					end
					local Boosts = v30.Boosts
					local Boosts_2 = p1:FindFirstChild("Boosts")
					if not (Boosts and Boosts_2) then
						return
					end
					for v72, v8 in { "BoostLong", "BoostShort" } do
						local v9 = Boosts_2:FindFirstChild(v8)
						local v102 = Boosts[v8]
						if v9 and v102 then
							local ProductId = v102.ProductId
							local v11 = v5.GetProductInfo(ProductId, Enum.InfoType.Product)
							if v9:FindFirstChild("ImageLabel") then
								v9.ImageLabel.Image = v17.CurrentEventUICosmetics.CurrencyImage
							end
							if v102.SaleStarts and v102.SaleEnds then
								v21.AttachToTime(function() --[[ Line: 336 | Upvalues: v21 (ref), v102 (copy), v9 (copy) ]]
									local v1 = v21.Get()
									local v2 = if v102.SaleStarts <= v1 then v1 <= v102.SaleEnds else false
									if not v9:FindFirstChild("SaleBanner") then
										return
									end
									v9.SaleBanner.Visible = v2
								end)
							elseif v9:FindFirstChild("SaleBanner") then
								v9.SaleBanner.Visible = false
							end
							local v12 = v11 and v11.PriceInRobux or "N/A"
							if v9:FindFirstChild("Footer") and v9.Footer:FindFirstChild("BuyButton") then
								v9.Footer.BuyButton.Top.TextLabel.Text = "\238\128\130" .. v12
								v13.new(v9.Footer.BuyButton, {
									Click = function() --[[ Click | Line: 351 | Upvalues: v5 (ref), LocalPlayer (ref), ProductId (copy) ]]
										v5.PromptPurchase(LocalPlayer, ProductId, "Product")
									end
								})
							end
							if v9:FindFirstChild("Description") then
								v9.Description.Text = v102.Description or ""
							end
							if v9:FindFirstChild("Title") then
								v9.Title.Text = v102.NameText or v8
							end
						end
					end
					local Title = Boosts_2:FindFirstChild("Title")
					local Boosts_3 = v32.PlayerData.Events[v17.EventName]:FindFirstChild("Boosts")
					if not (Title and Boosts_3) then
						return
					end
					local t = {
						BoostShort = 25,
						BoostLong = 50
					}
					local function updateBoostTitle() --[[ updateBoostTitle | Line: 374 | Upvalues: Boosts_3 (copy), t (copy), Title (copy) ]]
						local sum = 0
						for v1, v2 in Boosts_3:GetChildren() do
							if v2.Value > 0 then
								sum = sum + (t[v2.Name] or 0) * v2.Value
							end
						end
						if sum > 0 then
							Title.Text = "Active Boost: " .. sum .. "%"
						else
							Title.Text = "No Active Boost"
						end
					end
					for v132, v14 in Boosts_3:GetChildren() do
						v14:GetPropertyChangedSignal("Value"):Connect(updateBoostTitle)
					end
					Boosts_3.ChildAdded:Connect(function(p1) --[[ Line: 394 | Upvalues: updateBoostTitle (copy) ]]
						p1:GetPropertyChangedSignal("Value"):Connect(updateBoostTitle)
						updateBoostTitle()
					end)
					updateBoostTitle()
				end,
				Items = function(p1, p2) --[[ Items | Line: 403 | Upvalues: v34 (ref), v17 (ref), Sonar (ref), v6 (ref), ReplicatedStorage (ref), v10 (ref), v9 (ref), v13 (ref), v24 (ref), v32 (ref), v2 (ref), v5 (ref), LocalPlayer (ref) ]]
					if v34 then
						return
					end
					v34 = true
					local EventShopItems = game.ReplicatedStorage.Storage.Events[v17.EventName].EventShopItems
					if not EventShopItems then
						warn("No event shop items found")
					end
					for v1, v22 in Sonar(EventShopItems) do
						local v3 = v6.GetByName(v1)
						if v3 then
							local Default = p1.ScrollingFrame:FindFirstChild("Default")
							if Default then
								Default.Visible = false
								local v4 = Default:Clone()
								v4.Name = v1
								v4.ItemImage.Image = v3.Image
								if v3.ColorSequence then
									local UIGradient = v4.ItemImage:FindFirstChild("UIGradient")
									if UIGradient then
										UIGradient.Color = v3.ColorSequence
										UIGradient.Enabled = true
									else
										local ItemColorGradient = ReplicatedStorage.Storage.Assets:FindFirstChild("ItemColorGradient")
										if ItemColorGradient then
											local v52 = ItemColorGradient:Clone()
											v52.Color = v3.ColorSequence
											v52.Parent = v4.ItemImage
										end
									end
								end
								v4.Title.Text = v10.separateWordsInString(v1)
								v4.BuyButton.Top.PriceFrame.AmountLabel.Text = v9.splice(v22)
								v4.BuyButton.Top.PriceFrame.Icon.Image = v17.CurrentEventUICosmetics.CurrencyImage
								v4.LayoutOrder = v22
								v4.Visible = true
								v4.Parent = p1.ScrollingFrame
								v13.new(v4.BuyButton, {
									Click = function() --[[ Click | Line: 455 | Upvalues: v24 (ref), v32 (ref), v1 (copy), Sonar (ref), v2 (ref), v5 (ref), LocalPlayer (ref) ]]
										local v12, v22 = v24.CanPurchaseEventItem(v32, v1)
										if v12 == true then
											if type(v22) == "table" and v22.ProductId then
												v5.PromptPurchase(LocalPlayer, v22.ProductId, "Product")
											else
												v24:PurchaseEventItem(v1)
											end
										else
											if v12 == "MaxInventory" then
												Sonar("InventoryGui").UpgradeSlots()
											end
											v2.NotifyIssue(v12)
										end
									end
								})
								continue
							end
							warn("No item frame found")
							continue
						end
						warn("No item data found for " .. v1)
					end
				end,
				Lootboxes = function(p1, p2) --[[ Lootboxes | Line: 477 | Upvalues: v42 (ref), v19 (ref), v7 (ref), v17 (ref), v30 (ref), v29 (ref), v6 (ref), v4 (ref), v3 (ref), ContainerFrame (ref), v10 (ref), v13 (ref), v5 (ref), LocalPlayer (ref), v21 (ref), v26 (ref), v32 (ref), Sonar (ref), v27 (ref), v28 (ref) ]]
					if not v42 then
						v42 = true
						local v1 = v19.new()
						local v2 = v7.new({
							Duration = v17.BundleResetTime or 86400
						})
						local function SetupLootboxes() --[[ SetupLootboxes | Line: 487 | Upvalues: v1 (copy), v30 (ref), v29 (ref), p1 (copy), v6 (ref), v2 (copy), v4 (ref), v3 (ref), ContainerFrame (ref), v10 (ref), v13 (ref), v5 (ref), LocalPlayer (ref), v21 (ref), v19 (ref), v26 (ref), v32 (ref), Sonar (ref), v27 (ref), v28 (ref) ]]
							v1:DoCleaning()
							local Lootboxes = v30.Lootboxes
							for v22, v33 in if Lootboxes then Lootboxes else {} do
								local v42 = v29[v33.LootboxName]
								if v42 and v42.Items then
									local LootboxDefault = p1.ScrollingFrame:FindFirstChild("LootboxDefault")
									if LootboxDefault then
										LootboxDefault.Visible = false
										local v52 = LootboxDefault:Clone()
										v52.Name = "Lootbox" .. v22
										v52.Visible = true
										v52.Parent = p1.ScrollingFrame
										v1:GiveTask(v52)
										task.spawn(function() --[[ Line: 512 | Upvalues: v42 (copy), v6 (ref), v2 (ref), v22 (copy), v4 (ref), v52 (copy), v1 (ref), v3 (ref), ContainerFrame (ref), v10 (ref), v13 (ref), v5 (ref), LocalPlayer (ref) ]]
											local v12 = nil
											local v23 = 5
											local v32 = false
											for v43, v53 in v42.Items do
												local v62 = v6.GetByName(v43)
												if v62 and v62.ItemDropTable then
													v12 = v62.ItemDropTable
													v23 = v62.ItemPullAmount or 5
													v32 = v62.NoRepeatItems
													break
												end
											end
											if not v12 then
												return
											end
											local v8 = v42.ProductId or v22
											local v9 = v2.CurrentSeed * 1500 + v8
											local t = {}
											local t2 = {}
											for i = 1, math.max(5, v23) do
												local v102
												local v11 = v4.getRandomWeightedItem(v12, v9 + i)
												local v122 = nil
												if v11 and (typeof(v12) == "table" and typeof(v11) == "number") then
													v122 = v12[v11]
												elseif v11 and (typeof(v11) == "string" or typeof(v11) == "table") then
													v122 = v11
												end
												if v122 then
													if v32 then
														if t[typeof(v122) == "table" and v122.Name or v122] then
															local count = 0
															repeat
																local v14 = v4.getRandomWeightedItem(v12, v9 + i + count)
																if v14 and (typeof(v12) == "table" and typeof(v14) == "number") then
																	v122 = v12[v14]
																elseif v14 then
																	local v15 = v14
																	if typeof(v15) == "string" or typeof(v15) == "table" then
																		v122 = v15
																	end
																end
																count = count + 1
																if not v122 then
																	break
																end
																v102 = typeof(v122) == "table" and v122.Name or v122
															until not t[v102] or count >= 100
														end
														if v122 then
															t[typeof(v122) == "table" and v122.Name or v122] = true
														end
													end
													if v122 then
														t2[typeof(v122) == "table" and v122.Name or v122] = if typeof(v122) == "table" then v122.Amount or 1 else 1
													end
												end
											end
											local ItemCarouselTop = v52:FindFirstChild("ItemCarouselTop")
											if ItemCarouselTop then
												v1:GiveTask(v3.new({
													ReverseDirection = false,
													Frame = ItemCarouselTop,
													Items = t2,
													ContainerFrame = ContainerFrame
												}))
											end
											local ItemCarouselBottom = v52:FindFirstChild("ItemCarouselBottom")
											if ItemCarouselBottom then
												v1:GiveTask(v3.new({
													ReverseDirection = true,
													Frame = ItemCarouselBottom,
													Items = t2,
													ContainerFrame = ContainerFrame
												}))
											end
											local v19 = nil
											for v20, v21 in v42.Items do
												v19 = v20
												break
											end
											v52.Title.Text = v10.separateWordsInString(v19)
											if v19 then
												local v222 = v6.GetByName(v19)
												if v222 then
													v52.LootBoxImage.Image = v222.Image
												end
											end
											if v42.OtherIds and v42.OtherIds[1] then
												v13.new(v52.BuyButton, {
													Click = function() --[[ Click | Line: 617 | Upvalues: v5 (ref), LocalPlayer (ref), v42 (ref) ]]
														v5.PromptPurchase(LocalPlayer, v42.OtherIds[1].Id, "Product")
													end
												})
												local v232 = v5.GetProductInfo(v42.OtherIds[1].Id, "Product")
												v52.BuyButton.Top.TextLabel.Text = "\238\128\130" .. (if v232 then v232.PriceInRobux or "N/A" else "N/A")
												v52.BuyButton.AmountLabel.Text = "x" .. v42.OtherIds[1].Amount
											end
											if v42.OtherIds and v42.OtherIds[2] then
												local v26 = v52:FindFirstChild("3xBuyButton")
												if v26 then
													v13.new(v26, {
														Click = function() --[[ Click | Line: 631 | Upvalues: v5 (ref), LocalPlayer (ref), v42 (ref) ]]
															v5.PromptPurchase(LocalPlayer, v42.OtherIds[2].Id, "Product")
														end
													})
													local v27 = v5.GetProductInfo(v42.OtherIds[2].Id, "Product")
													v26.Top.TextLabel.Text = "\238\128\130" .. (if v27 then v27.PriceInRobux or "N/A" else "N/A")
													v26.AmountLabel.Text = "x" .. v42.OtherIds[2].Amount
												end
											end
											if not (v42.OtherIds and v42.OtherIds[3]) then
												return
											end
											local v30 = v52:FindFirstChild("9xBuyButton")
											if not v30 then
												return
											end
											v13.new(v30, {
												Click = function() --[[ Click | Line: 646 | Upvalues: v5 (ref), LocalPlayer (ref), v42 (ref) ]]
													v5.PromptPurchase(LocalPlayer, v42.OtherIds[3].Id, "Product")
												end
											})
											local v31 = v5.GetProductInfo(v42.OtherIds[3].Id, "Product")
											v30.Top.TextLabel.Text = "\238\128\130" .. (if v31 then v31.PriceInRobux or "N/A" else "N/A")
											v30.AmountLabel.Text = "x" .. v42.OtherIds[3].Amount
										end)
									end
								end
							end
							local Capsules = v30.Capsules
							if not Capsules then
								return
							end
							local CapsuleDefault = p1.ScrollingFrame:FindFirstChild("CapsuleDefault")
							if not CapsuleDefault then
								return
							end
							CapsuleDefault.Visible = false
							for v62, v7 in Capsules do
								local v8 = CapsuleDefault:Clone()
								v8.Name = "Capsule" .. v62
								v8.Visible = true
								v8.Parent = p1.ScrollingFrame
								v1:GiveTask(v8)
								local v9 = v6.GetByName(v7.CapsuleName)
								if v9 then
									v8.Title.Text = v10.separateWordsInString(v9.Name)
									local ItemImage = v8:FindFirstChild("ItemImage")
									if ItemImage and v9.Image then
										ItemImage.Image = v9.Image
									end
								else
									v8.Title.Text = v7.DisplayName or v7.CapsuleName or "Capsule"
								end
								task.spawn(function() --[[ Line: 682 | Upvalues: v5 (ref), v7 (copy), v8 (copy) ]]
									local v1 = v5.GetProductInfo(v7.ProductId, "Product")
									v8.BuyButton.Top.TextLabel.Text = "\238\128\130" .. (if v1 then v1.PriceInRobux or "N/A" else "N/A")
								end)
								v13.new(v8.BuyButton, {
									Click = function() --[[ Click | Line: 688 | Upvalues: v5 (ref), LocalPlayer (ref), v7 (copy) ]]
										v5.PromptPurchase(LocalPlayer, v7.ProductId, "Product")
									end
								})
								if v7.SaleStarts and v7.SaleEnds then
									v1:GiveTask(v21.AttachToTime(function() --[[ Line: 694 | Upvalues: v21 (ref), v7 (copy), v8 (copy) ]]
										local v1 = v21.Get()
										local v2 = if v7.SaleStarts <= v1 then v1 <= v7.SaleEnds else false
										local SaleBanner = v8:FindFirstChild("SaleBanner")
										if not SaleBanner then
											return
										end
										SaleBanner.Visible = v2
									end))
								end
								if v9 and v9.SpeciesDropTable then
									local HorseViewport = v8:FindFirstChild("HorseViewport")
									if HorseViewport then
										v1:GiveTask(task.spawn(function() --[[ Line: 707 | Upvalues: v19 (ref), v1 (ref), v26 (ref), v32 (ref), v9 (copy), Sonar (ref), HorseViewport (copy), v27 (ref), v28 (ref) ]]
											local v12 = v19.new()
											v1:GiveTask(v12)
											repeat
												v12:DoCleaning()
												local v2 = v26:_giveHorse(v32, v9)
												local v3 = Sonar("AnimalRiggerService").CreateAnimalModel({
													SlotValue = v2
												})
												v3.Parent = HorseViewport
												v12:GiveTask(v3)
												local Camera = Instance.new("Camera")
												Camera.Parent = HorseViewport
												HorseViewport.CurrentCamera = Camera
												v12:GiveTask(Camera)
												Camera.FieldOfView = 1
												Camera.CFrame = v27(v3, HorseViewport, -130, -8)
												local Eyelid = v3:FindFirstChild("Eyelid")
												if Eyelid then
													Eyelid:Destroy()
												end
												HorseViewport.Ambient = Color3.fromRGB(192, 192, 192)
												HorseViewport.LightDirection = Camera.CFrame.LookVector
												v12:GiveTask(v28.new(v3, {
													InViewport = true,
													SlotValue = v2
												}))
												v12:GiveTask(v2)
												v12:GiveTask(v3)
												task.wait(10)
											until not Eyelid
										end))
									end
								end
							end
						end
						v2.SeedChanged:Connect(function() --[[ Line: 746 | Upvalues: v1 (copy), SetupLootboxes (copy) ]]
							v1:DoCleaning()
							SetupLootboxes()
						end)
						task.spawn(function() --[[ Line: 751 | Upvalues: SetupLootboxes (copy) ]]
							SetupLootboxes()
						end)
					end
				end
			}
			for v52, v62 in p1.TabButtons:GetChildren() do
				if v62:IsA("ImageButton") then
					local v72 = p1.TabFrames:FindFirstChild(v62.Name)
					if v72 then
						v14.AddTab(v72, {
							ParentFrame = p1.TabFrames,
							Button = v62
						})
						v13.new(v62, {
							Click = function() --[[ Click | Line: 769 | Upvalues: v14 (ref), v72 (copy), t (copy), v62 (copy) ]]
								v14.OpenTab(v72)
								t[v62.Name](v72, v62)
							end
						})
					end
				end
			end
			local Featured = p1.TabFrames:FindFirstChild("Featured")
			local Featured_2 = p1.TabButtons:FindFirstChild("Featured")
			if Featured and Featured_2 then
				v14.OpenTab(Featured)
				t.Featured(Featured, Featured_2)
			end
			return t
		end,
		Missions = function(p1, p2) --[[ Missions | Line: 787 | Upvalues: v34 (ref), Sonar (copy), ReplicatedStorage (copy), v17 (copy), v32 (copy), v39 (copy), v20 (copy), v25 (copy), v13 (copy), v16 (copy), v1 (copy), v21 (copy), v22 (copy), v15 (copy), v2 (copy), v19 (copy), v10 (copy), v37 (copy) ]]
			if v34 then
				return
			end
			v34 = true
			local v12 = Sonar(ReplicatedStorage.Storage.Events[v17.EventName].EventMissions)
			local Missions = v32.PlayerData.Events[v17.EventName].Missions
			p1.List.ScrollingFrame.Default.Visible = false
			local function setSelectedMission(p12) --[[ setSelectedMission | Line: 796 | Upvalues: v39 (ref), p1 (copy), Missions (copy), v12 (copy), v20 (ref), v25 (ref), v13 (ref), v16 (ref), v1 (ref), v17 (ref), v21 (ref), v22 (ref), v15 (ref), v32 (ref), v2 (ref), Sonar (ref) ]]
				v39:DoCleaning()
				p1.SelectedFrame.TaskList.ScrollingFrame.Default.Visible = false
				for v14, v23 in Missions[p12].Missions:GetChildren() do
					local v3 = p1.SelectedFrame.TaskList.ScrollingFrame.Default:Clone()
					local v4 = v12[p12].Missions[v23.Name]
					v3.Content.QuestDescription.Text = string.format(v4.Description, v4.Amount)
					v3.Visible = true
					v3.Parent = p1.SelectedFrame.TaskList.ScrollingFrame
					v39:GiveTask(v20.new({
						TweenAmount = false,
						Clipped = false,
						Frame = v3.Content.ProgressBar.Bar,
						AmountLabel = v3.Content.ProgressLabel,
						GetText = function(p1, p2) --[[ GetText | Line: 816 | Upvalues: v23 (copy) ]]
							if v23.Value or v23.Completed.Value then
								return "COMPLETE"
							else
								return p1 .. "/" .. p2
							end
						end,
						Get = function() --[[ Get | Line: 823 | Upvalues: v23 (copy), v4 (copy) ]]
							return math.min(v23.Amount.Value, v4.Amount)
						end,
						GetMax = function() --[[ GetMax | Line: 828 | Upvalues: v4 (copy) ]]
							return v4.Amount
						end,
						Changed = { v23.Amount:GetPropertyChangedSignal("Value"), v23:GetPropertyChangedSignal("Value") }
					}))
					local function updatePinButton() --[[ updatePinButton | Line: 839 | Upvalues: Missions (ref), p12 (copy), v3 (copy), v23 (copy), v25 (ref) ]]
						local v1 = not Missions[p12].Claimed.Value
						v3.Content.PinButton.Visible = v1
						if not v1 then
							return
						end
						local Pinned = v23.Pinned.Value
						local v2 = v3.Content.PinButton:FindFirstChild("Top") and v3.Content.PinButton.Top:FindFirstChild("CrossLabel")
						if v2 then
							v2.Visible = Pinned
						end
						v25.SetButtonColor(v3.Content.PinButton, "Diagonal", if Pinned then "Red" else "Blue")
					end
					updatePinButton()
					v39:GiveTask(v23.Pinned:GetPropertyChangedSignal("Value"):Connect(updatePinButton))
					v39:GiveTask(Missions[p12].Claimed:GetPropertyChangedSignal("Value"):Connect(updatePinButton))
					v39:GiveTask(v13.new(v3.Content.PinButton, {
						Click = function() --[[ Click | Line: 859 | Upvalues: v16 (ref), p12 (copy), v23 (copy) ]]
							v16.GetRemoteFunction("PinMissionRemote"):InvokeServer("EventMissions", p12, v23.Name)
						end
					}))
					v39:GiveTask(v3)
				end
				local Rewards = v12[p12].Rewards
				v39:GiveTask(v1.new({
					CycleTime = 5,
					RandomHorse = true,
					ParentFrame = p1.SelectedFrame.RewardFrame.Items,
					CloneFrame = p1.SelectedFrame.RewardFrame.Items.Default,
					Rewards = Rewards,
					Dots = Rewards[2] ~= nil
				}))
				local t = {}
				for v6, v7 in Missions[p12].Missions:GetChildren() do
					table.insert(t, v7:GetPropertyChangedSignal("Value"))
				end
				local Completed = Missions[p12].Completed
				table.insert(t, Completed:GetPropertyChangedSignal("Value"))
				v39:GiveTask(v20.new({
					TweenAmount = false,
					Clipped = false,
					Frame = p1.SelectedFrame.RewardFrame.ProgressBar.Bar,
					AmountLabel = p1.SelectedFrame.RewardFrame.ProgressBar.ProgressLabel,
					GetText = function(p1, p2) --[[ GetText | Line: 891 | Upvalues: Missions (ref), p12 (copy) ]]
						if Missions[p12].Completed.Value then
							return "COMPLETE"
						else
							return p1 .. "/" .. p2
						end
					end,
					Get = function() --[[ Get | Line: 898 | Upvalues: Missions (ref), p12 (copy) ]]
						local count = 0
						for v1, v2 in Missions[p12].Missions:GetChildren() do
							if v2.Value then
								count = count + 1
							end
						end
						return count
					end,
					GetMax = function() --[[ GetMax | Line: 907 | Upvalues: v12 (ref), p12 (copy) ]]
						local count = 0
						for v1 in v12[p12].Missions do
							count = count + 1
						end
						return count
					end,
					Changed = t
				}))
				local function isMissionInCooldown() --[[ isMissionInCooldown | Line: 917 | Upvalues: Missions (ref), p12 (copy), v17 (ref) ]]
					local v1 = Missions[p12]
					if not (v1.Completed.Value and v1.Claimed.Value) then
						return false
					end
					local CompletedAt = v1.CompletedAt.Value
					if not (CompletedAt > 0) then
						return false
					end
					return workspace:GetServerTimeNow() < CompletedAt + v17.CurrentEvent.MiniQuestCooldown
				end
				local ClaimButton = p1.SelectedFrame.RewardFrame.ClaimButton
				local CooldownLabel = p1.SelectedFrame.RewardFrame:FindFirstChild("CooldownLabel")
				local function updateClaimButton() --[[ updateClaimButton | Line: 931 | Upvalues: Missions (ref), p12 (copy), v17 (ref), ClaimButton (copy), CooldownLabel (copy) ]]
					local Completed = Missions[p12].Completed.Value
					local v1 = Missions[p12]
					local v2
					if v1.Completed.Value and v1.Claimed.Value then
						local CompletedAt = v1.CompletedAt.Value
						v2 = if CompletedAt > 0 then workspace:GetServerTimeNow() < CompletedAt + v17.CurrentEvent.MiniQuestCooldown else false
					else
						v2 = false
					end
					ClaimButton.Visible = if Completed then not Missions[p12].Claimed.Value and not v2 else Completed
					if not CooldownLabel then
						return
					end
					if v2 then
						CooldownLabel.Text = "Resets " .. os.date("%B %d at %I:%M %p", Missions[p12].CompletedAt.Value + v17.CurrentEvent.MiniQuestCooldown)
					end
					CooldownLabel.Visible = v2
				end
				v39:GiveTask(Missions[p12].Completed:GetPropertyChangedSignal("Value"):Connect(updateClaimButton))
				v39:GiveTask(Missions[p12].Claimed:GetPropertyChangedSignal("Value"):Connect(updateClaimButton))
				v39:GiveTask(Missions[p12].CompletedAt:GetPropertyChangedSignal("Value"):Connect(updateClaimButton))
				v39:GiveTask(v21.AttachToTime(updateClaimButton))
				updateClaimButton()
				v39:GiveTask(v13.new(ClaimButton, {
					Click = function() --[[ Click | Line: 955 | Upvalues: Missions (ref), p12 (copy), v17 (ref), v22 (ref), v15 (ref), v32 (ref), v2 (ref), Sonar (ref) ]]
						local v1 = Missions[p12]
						local v23
						if v1.Completed.Value and v1.Claimed.Value then
							local CompletedAt = v1.CompletedAt.Value
							v23 = if CompletedAt > 0 then workspace:GetServerTimeNow() < CompletedAt + v17.CurrentEvent.MiniQuestCooldown else false
						else
							v23 = false
						end
						if v23 then
							v22.Notify({
								Preset = "Red",
								Message = "Resets " .. os.date("%B %d at %I:%M %p", Missions[p12].CompletedAt.Value + v17.CurrentEvent.MiniQuestCooldown) .. "!"
							})
							return
						end
						local v4 = v15.CanClaimEventMission(v32, p12)
						if v4 ~= true then
							v2.NotifyIssue(v4)
							return
						end
						local v5 = v15.ClaimEventMission(p12)
						if not v5 or v5 == true then
							return
						end
						task.wait()
						Sonar("DisplayAnimalClient"):DisplaySlot({
							Type = "Claimed",
							AllowNaming = true,
							ShowMaxWarning = true,
							MobileClickBackgroundToClose = true,
							Slot = v32:GetItemFolder("Animals"):WaitForChild(v5)
						})
					end
				}))
			end
			local function getMissionOrder(p1) --[[ getMissionOrder | Line: 990 ]]
				local t = {}
				local t2 = {}
				for v1, v2 in p1 do
					t[v1] = v2
				end
				local count = 1
				while next(t) do
					local v3 = false
					for v4, v5 in t do
						local Requires = v5.Requires
						if not Requires or t2[Requires] then
							t2[v4] = count
							t[v4] = nil
							v3 = true
							count = count + 1
							break
						end
					end
					if not v3 then
						for v6 in t do
							t2[v6] = count
							t[v6] = nil
							count = count + 1
							break
						end
						continue
					end
				end
				return t2
			end
			local v23 = getMissionOrder(v12)
			local v3 = v19.new()
			for v4, v5 in v12 do
				local v6 = p1.List.ScrollingFrame.Default:Clone()
				v6.Title.Text = v12[v4].Title or v10.separateWordsInString(v4)
				local function isMissionFrameLocked() --[[ isMissionFrameLocked | Line: 1032 | Upvalues: Missions (copy), v4 (copy), v12 (copy), v17 (ref) ]]
					local v1 = Missions[v4]
					local Requires = v12[v4].Requires
					if Requires then
						local v2 = Missions[Requires]
						if v2 and not v2.Claimed.Value then
							local CompletedCount = v2:FindFirstChild("CompletedCount")
							if not CompletedCount or CompletedCount.Value < 1 then
								return true, "Requires"
							end
						end
					end
					if not (v1.Completed.Value and v1.Claimed.Value) then
						return false
					end
					local CompletedAt = v1.CompletedAt.Value
					if CompletedAt > 0 and workspace:GetServerTimeNow() < CompletedAt + v17.CurrentEvent.MiniQuestCooldown then
						return true, "Cooldown"
					else
						return false
					end
				end
				local Locked = v6:FindFirstChild("Locked")
				if Locked then
					local SkipButton = Locked:FindFirstChild("SkipButton")
					if SkipButton then
						local v8 = SkipButton:FindFirstChild("Top") and SkipButton.Top:FindFirstChild("TextLabel")
						if v8 then
							v8.Text = "Unlock Now"
						end
						v13.new(SkipButton, {
							Click = function() --[[ Click | Line: 1069 ]] end
						})
					end
				end
				local function updateLockedState() --[[ updateLockedState | Line: 1077 | Upvalues: isMissionFrameLocked (copy), Locked (copy), v12 (copy), v4 (copy), v10 (ref), Missions (copy), v17 (ref), v6 (copy) ]]
					local v1, v2 = isMissionFrameLocked()
					if Locked then
						Locked.Visible = v1
						if v1 then
							local TextLabel = Locked:FindFirstChild("TextLabel")
							local SkipButton = Locked:FindFirstChild("SkipButton")
							if SkipButton then
								SkipButton.Visible = v2 == "Cooldown"
							end
							if TextLabel and v2 == "Requires" then
								local Requires = v12[v4].Requires
								TextLabel.Text = "Complete \"" .. (v12[Requires].Title or v10.separateWordsInString(Requires)) .. "\" to unlock"
							elseif TextLabel then
								TextLabel.Text = "Replay: " .. os.date("%b %d, %Y %I:%M %p", Missions[v4].CompletedAt.Value + v17.CurrentEvent.MiniQuestCooldown)
							end
						end
					end
					v6.Title.Visible = not v1
				end
				v3:GiveTask(Missions[v4].Completed:GetPropertyChangedSignal("Value"):Connect(updateLockedState))
				v3:GiveTask(Missions[v4].Claimed:GetPropertyChangedSignal("Value"):Connect(updateLockedState))
				v3:GiveTask(Missions[v4].CompletedAt:GetPropertyChangedSignal("Value"):Connect(updateLockedState))
				local Requires = v12[v4].Requires
				if Requires and Missions[Requires] then
					v3:GiveTask(Missions[Requires].Claimed:GetPropertyChangedSignal("Value"):Connect(updateLockedState))
					local CompletedCount = Missions[Requires]:FindFirstChild("CompletedCount")
					if CompletedCount then
						v3:GiveTask(CompletedCount:GetPropertyChangedSignal("Value"):Connect(updateLockedState))
					end
				end
				updateLockedState()
				v13.new(v6.ViewButton, {
					Click = function() --[[ Click | Line: 1121 | Upvalues: Locked (copy), isMissionFrameLocked (copy), v12 (copy), v4 (copy), v10 (ref), v22 (ref), Missions (copy), v17 (ref), v37 (ref) ]]
						if not (Locked and Locked.Visible) then
							v37:set(v4)
							return
						end
						local _, v1 = isMissionFrameLocked()
						if v1 ~= "Requires" then
							v22.Notify({
								Preset = "Red",
								Message = "Replay: " .. os.date("%b %d, %Y %I:%M %p", Missions[v4].CompletedAt.Value + v17.CurrentEvent.MiniQuestCooldown) .. "!"
							})
							return
						end
						local Requires = v12[v4].Requires
						v22.Notify({
							Preset = "Red",
							Message = "Complete \"" .. (v12[Requires].Title or v10.separateWordsInString(Requires)) .. "\" to unlock this mission!"
						})
					end
				})
				local function updateSkipButton() --[[ updateSkipButton | Line: 1145 | Upvalues: Missions (copy), v4 (copy), isMissionFrameLocked (copy), v6 (copy) ]]
					local v1 = isMissionFrameLocked()
					local SkipButton = v6.SkipButton
					local v2 = SkipButton:FindFirstChild("Top") and SkipButton.Top:FindFirstChild("TextLabel")
					if v2 then
						v2.Text = "Skip"
					end
					SkipButton.Visible = not Missions[v4].Completed.Value and not v1
				end
				v3:GiveTask(Missions[v4].Completed:GetPropertyChangedSignal("Value"):Connect(updateSkipButton))
				v3:GiveTask(Missions[v4].Claimed:GetPropertyChangedSignal("Value"):Connect(updateSkipButton))
				v3:GiveTask(Missions[v4].CompletedAt:GetPropertyChangedSignal("Value"):Connect(updateSkipButton))
				if Requires and Missions[Requires] then
					v3:GiveTask(Missions[Requires].Claimed:GetPropertyChangedSignal("Value"):Connect(updateSkipButton))
				end
				local v9 = isMissionFrameLocked()
				local SkipButton = v6.SkipButton
				local v102 = SkipButton:FindFirstChild("Top") and SkipButton.Top:FindFirstChild("TextLabel")
				if v102 then
					v102.Text = "Skip"
				end
				SkipButton.Visible = not Missions[v4].Completed.Value and not v9
				v13.new(v6.SkipButton, {
					Click = function() --[[ Click | Line: 1169 ]] end
				})
				v6.Visible = true
				v6.Name = v4
				v6.LayoutOrder = v23[v4] or 999
				v6.Parent = p1.List.ScrollingFrame
				local Rewards = v12[v4].Rewards
				v1.new({
					CycleTime = 10,
					RandomHorse = true,
					ParentFrame = v6.RewardFrame,
					CloneFrame = v6.RewardFrame.Default,
					Rewards = Rewards,
					Dots = if Rewards[2] == nil then false else true
				})
				local t = {}
				for v132, v14 in Missions[v4].Missions:GetChildren() do
					table.insert(t, v14:GetPropertyChangedSignal("Value"))
				end
				table.insert(t, Missions[v4].Completed:GetPropertyChangedSignal("Value"))
				v20.new({
					TweenAmount = false,
					Clipped = false,
					Frame = v6.ProgressBar.Bar,
					AmountLabel = v6.ProgressBar.ProgressLabel,
					GetText = function(p1, p2) --[[ GetText | Line: 1204 | Upvalues: Missions (copy), v4 (copy) ]]
						if Missions[v4].Completed.Value then
							return "COMPLETE"
						else
							return p1 .. "/" .. p2
						end
					end,
					Get = function() --[[ Get | Line: 1211 | Upvalues: Missions (copy), v4 (copy) ]]
						local count = 0
						for v1, v2 in Missions[v4].Missions:GetChildren() do
							if v2.Value then
								count = count + 1
							end
						end
						return count
					end,
					GetMax = function() --[[ GetMax | Line: 1220 | Upvalues: v12 (copy), v4 (copy) ]]
						local count = 0
						for v1 in v12[v4].Missions do
							count = count + 1
						end
						return count
					end,
					Changed = t
				})
			end
			v21.AttachToTime(function() --[[ Line: 1231 | Upvalues: v12 (copy), Missions (copy), p1 (copy), v17 (ref) ]]
				local v1 = workspace:GetServerTimeNow()
				for v2 in v12 do
					local v3 = Missions[v2]
					local v4 = p1.List.ScrollingFrame:FindFirstChild(v2)
					if v4 and (v3.Completed.Value and v3.Claimed.Value) then
						local CompletedAt = v3.CompletedAt.Value
						if CompletedAt > 0 then
							local v5 = v1 < CompletedAt + v17.CurrentEvent.MiniQuestCooldown
							local Locked = v4:FindFirstChild("Locked")
							if Locked then
								Locked.Visible = v5
								if v5 then
									local TextLabel = Locked:FindFirstChild("TextLabel")
									if TextLabel then
										TextLabel.Text = "Replay: " .. os.date("%b %d, %Y %I:%M %p", CompletedAt + v17.CurrentEvent.MiniQuestCooldown)
									end
								end
							end
							v4.Title.Visible = not v5
						end
					end
				end
			end)
			v13.new(p1.SelectedFrame.Header.BackButton, {
				Click = function() --[[ Click | Line: 1259 | Upvalues: v37 (ref) ]]
					v37:set("List")
				end
			})
			v37:subscribe(function(p12) --[[ Line: 1264 | Upvalues: p1 (copy), setSelectedMission (copy) ]]
				if p12 == "List" then
					p1.List.Visible = true
					p1.SelectedFrame.Visible = false
				else
					p1.List.Visible = false
					p1.SelectedFrame.Visible = true
					setSelectedMission(p12)
				end
			end)
		end,
		SpecialQuests = function(p1, p2) --[[ SpecialQuests | Line: 1276 | Upvalues: v35 (ref), Sonar (copy), ReplicatedStorage (copy), v17 (copy), v32 (copy), v40 (copy), v15 (copy), v20 (copy), v25 (copy), v13 (copy), v16 (copy), v1 (copy), v2 (copy), v22 (copy), v38 (copy), v5 (copy), LocalPlayer (copy), v21 (copy) ]]
			if v35 then
				return
			end
			v35 = true
			local v12 = Sonar(ReplicatedStorage.Storage.Events[v17.EventName].MiniQuests)
			local MiniQuests = v32.PlayerData.Events[v17.EventName].MiniQuests
			p1.List.ScrollingFrame.Default.Visible = false
			local function setSelectedMission(p12) --[[ setSelectedMission | Line: 1287 | Upvalues: v40 (ref), MiniQuests (copy), v12 (copy), p1 (copy), v15 (ref), v20 (ref), v25 (ref), v13 (ref), v16 (ref), v1 (ref), v32 (ref), v2 (ref) ]]
				v40:DoCleaning()
				local v14 = MiniQuests:FindFirstChild(p12)
				local v22 = v12[tonumber(p12)]
				p1.SelectedFrame.TaskList.ScrollingFrame.Default.Visible = false
				for v3, v4 in v14.Missions:GetChildren() do
					local v5 = p1.SelectedFrame.TaskList.ScrollingFrame.Default:Clone()
					local v6 = v22.Missions[v4.Name]
					v5.Content.QuestDescription.Text = string.format(v6.Description or v15.Descriptions[v4.Type.Value], v6.Amount)
					v5.Visible = true
					v5.Parent = p1.SelectedFrame.TaskList.ScrollingFrame
					v40:GiveTask(v20.new({
						TweenAmount = false,
						Clipped = false,
						Frame = v5.Content.ProgressBar.Bar,
						AmountLabel = v5.Content.ProgressLabel,
						GetText = function(p1, p2) --[[ GetText | Line: 1311 | Upvalues: v4 (copy) ]]
							if v4.Value then
								return "COMPLETE"
							else
								return p1 .. "/" .. p2
							end
						end,
						Get = function() --[[ Get | Line: 1318 | Upvalues: v4 (copy), v6 (copy) ]]
							return math.min(v4.Amount.Value, v6.Amount)
						end,
						GetMax = function() --[[ GetMax | Line: 1321 | Upvalues: v6 (copy) ]]
							return v6.Amount
						end,
						Changed = { v4.Amount:GetPropertyChangedSignal("Value"), v4:GetPropertyChangedSignal("Value") }
					}))
					local function updatePinButton() --[[ updatePinButton | Line: 1330 | Upvalues: v14 (copy), v5 (copy), v4 (copy), v25 (ref) ]]
						local v1 = not v14.Claimed.Value
						v5.Content.PinButton.Visible = v1
						if not v1 then
							return
						end
						local Pinned = v4.Pinned.Value
						local v2 = v5.Content.PinButton:FindFirstChild("Top") and v5.Content.PinButton.Top:FindFirstChild("CrossLabel")
						if v2 then
							v2.Visible = Pinned
						end
						v25.SetButtonColor(v5.Content.PinButton, "Diagonal", if Pinned then "Red" else "Blue")
					end
					updatePinButton()
					v40:GiveTask(v4.Pinned:GetPropertyChangedSignal("Value"):Connect(updatePinButton))
					v40:GiveTask(v14.Claimed:GetPropertyChangedSignal("Value"):Connect(updatePinButton))
					v40:GiveTask(v13.new(v5.Content.PinButton, {
						Click = function() --[[ Click | Line: 1350 | Upvalues: v16 (ref), p12 (copy), v4 (copy) ]]
							v16.GetRemoteFunction("PinMissionRemote"):InvokeServer("MiniMissions", p12, v4.Name)
						end
					}))
					v40:GiveTask(v5)
				end
				v40:GiveTask(v1.new({
					CycleTime = 10,
					RandomHorse = true,
					ParentFrame = p1.SelectedFrame.RewardFrame.Items,
					CloneFrame = p1.SelectedFrame.RewardFrame.Items.Default,
					Rewards = { v14.CompletedCount.Value == 0 and v22.Rewards[1] or (v22.Rewards[2] or v22.Rewards[1]) }
				}))
				local t = {}
				for v9, v10 in v14.Missions:GetChildren() do
					table.insert(t, v10:GetPropertyChangedSignal("Value"))
				end
				table.insert(t, v14.Completed:GetPropertyChangedSignal("Value"))
				v40:GiveTask(v20.new({
					TweenAmount = false,
					Clipped = false,
					Frame = p1.SelectedFrame.RewardFrame.ProgressBar.Bar,
					AmountLabel = p1.SelectedFrame.RewardFrame.ProgressBar.ProgressLabel,
					GetText = function(p1, p2) --[[ GetText | Line: 1381 | Upvalues: v14 (copy) ]]
						if v14.Completed.Value then
							return "COMPLETE"
						else
							return p1 .. "/" .. p2
						end
					end,
					Get = function() --[[ Get | Line: 1388 | Upvalues: v14 (copy) ]]
						local count = 0
						for v1, v2 in v14.Missions:GetChildren() do
							if v2.Value then
								count = count + 1
							end
						end
						return count
					end,
					GetMax = function() --[[ GetMax | Line: 1397 | Upvalues: v22 (copy) ]]
						local count = 0
						for v1 in v22.Missions do
							count = count + 1
						end
						return count
					end,
					Changed = t
				}))
				local function updateClaimButton() --[[ updateClaimButton | Line: 1407 | Upvalues: v14 (copy), p1 (ref) ]]
					local Completed = v14.Completed.Value
					p1.SelectedFrame.RewardFrame.ClaimButton.Visible = if Completed then not v14.Claimed.Value else Completed
				end
				v40:GiveTask(v14.Completed:GetPropertyChangedSignal("Value"):Connect(updateClaimButton))
				v40:GiveTask(v14.Claimed:GetPropertyChangedSignal("Value"):Connect(updateClaimButton))
				local Completed_2 = v14.Completed.Value
				local ClaimButton = p1.SelectedFrame.RewardFrame.ClaimButton
				ClaimButton.Visible = if Completed_2 then not v14.Claimed.Value else Completed_2
				v40:GiveTask(v13.new(p1.SelectedFrame.RewardFrame.ClaimButton, {
					Click = function() --[[ Click | Line: 1418 | Upvalues: v15 (ref), v32 (ref), p12 (copy), v2 (ref), v16 (ref) ]]
						local v1 = v15.CanClaimMiniQuestMission(v32, p12)
						if v1 == true then
							v16.GetRemoteFunction("ClaimMiniQuestMissionRemote"):InvokeServer(p12)
						else
							v2.NotifyIssue(v1)
						end
					end
				}))
			end
			local t = {}
			for v23, v3 in MiniQuests:GetChildren() do
				local v52 = v12[tonumber(v3.Name)]
				local v6 = p1.List.ScrollingFrame.Default:Clone()
				v6.Title.Text = v52.Name
				local function updateLockedState() --[[ updateLockedState | Line: 1436 | Upvalues: v52 (copy), v6 (copy) ]]
					local v1 = workspace:GetServerTimeNow() < v52.UnlockDate
					v6.Locked.Visible = v1
					v6.Title.Visible = not v1
					if not v1 then
						return
					end
					v6.Locked.TextLabel.Text = "Locked Until " .. os.date("%B %d, %Y at %I:%M %p", v52.UnlockDate)
				end
				local v7 = if workspace:GetServerTimeNow() < v52.UnlockDate then true else false
				v6.Locked.Visible = v7
				v6.Title.Visible = not v7
				if v7 then
					v6.Locked.TextLabel.Text = "Locked Until " .. os.date("%B %d, %Y at %I:%M %p", v52.UnlockDate)
				end
				v13.new(v6.ViewButton, {
					Click = function() --[[ Click | Line: 1449 | Upvalues: v6 (copy), v22 (ref), v52 (copy), v38 (ref), v3 (copy) ]]
						if v6.Locked.Visible then
							v22.Notify({
								Preset = "Red",
								Message = "This mission is locked until " .. os.date("%B %d, %Y at %I:%M %p", v52.UnlockDate) .. "!"
							})
						else
							v38:set(v3.Name)
						end
					end
				})
				local function updateMiniQuestSkipButton() --[[ updateMiniQuestSkipButton | Line: 1462 | Upvalues: v3 (copy), v6 (copy) ]]
					local Claimed = v3.Claimed.Value
					local SkipButton = v6.SkipButton
					local v1 = SkipButton:FindFirstChild("Top") and SkipButton.Top:FindFirstChild("TextLabel")
					if v1 then
						v1.Text = if Claimed then "Reset" else "Skip"
					end
					SkipButton.Visible = not v3.Completed.Value or Claimed
				end
				v3.Completed:GetPropertyChangedSignal("Value"):Connect(updateMiniQuestSkipButton)
				v3.Claimed:GetPropertyChangedSignal("Value"):Connect(updateMiniQuestSkipButton)
				local Claimed = v3.Claimed.Value
				local SkipButton = v6.SkipButton
				local v8 = SkipButton:FindFirstChild("Top") and SkipButton.Top:FindFirstChild("TextLabel")
				if v8 then
					v8.Text = if Claimed then "Reset" else "Skip"
				end
				SkipButton.Visible = not v3.Completed.Value or Claimed
				v13.new(v6.SkipButton, {
					Click = function() --[[ Click | Line: 1481 | Upvalues: v6 (copy), v22 (ref), v52 (copy), v3 (copy), v16 (ref), v5 (ref), LocalPlayer (ref) ]]
						if v6.Locked.Visible then
							v22.Notify({
								Preset = "Red",
								Message = "This mission is locked until " .. os.date("%B %d, %Y at %I:%M %p", v52.UnlockDate) .. "!"
							})
							return
						end
						v16.GetRemoteFunction("SkipEventMission"):InvokeServer("MiniMission:" .. v3.Name)
						if v3.Claimed.Value then
							v5.PromptPurchase(LocalPlayer, 3529480728, "Product")
						else
							v5.PromptPurchase(LocalPlayer, 3424063344, "Product")
						end
					end
				})
				v6.Visible = true
				v6.Name = v3.Name
				v6.Parent = p1.List.ScrollingFrame
				v1.new({
					CycleTime = 10,
					MaxRewards = 1,
					RandomHorse = true,
					ParentFrame = v6.RewardFrame,
					CloneFrame = v6.RewardFrame.Default,
					Rewards = { v3.CompletedCount.Value == 0 and v52.Rewards[1] or (v52.Rewards[2] or v52.Rewards[1]) }
				})
				local t2 = {}
				for v11, v122 in v3.Missions:GetChildren() do
					table.insert(t2, v122:GetPropertyChangedSignal("Value"))
					table.insert(t2, v122.Amount:GetPropertyChangedSignal("Value"))
				end
				table.insert(t2, v3.Completed:GetPropertyChangedSignal("Value"))
				v20.new({
					TweenAmount = false,
					Clipped = false,
					Frame = v6.ProgressBar.Bar,
					AmountLabel = v6.ProgressBar.ProgressLabel,
					GetText = function(p1, p2) --[[ GetText | Line: 1531 | Upvalues: v3 (copy) ]]
						if v3.Completed.Value then
							return "COMPLETE"
						else
							return p1 .. "/" .. p2
						end
					end,
					Get = function() --[[ Get | Line: 1538 | Upvalues: v3 (copy) ]]
						local count = 0
						for v1, v2 in v3.Missions:GetChildren() do
							if v2.Value then
								count = count + 1
							end
						end
						return count
					end,
					GetMax = function() --[[ GetMax | Line: 1547 | Upvalues: v52 (copy) ]]
						local count = 0
						for v1 in v52.Missions do
							count = count + 1
						end
						return count
					end,
					Changed = t2
				})
				t[v3.Name] = {
					MissionFrame = v6,
					MissionData = v52
				}
			end
			v21.AttachToTime(function() --[[ Line: 1563 | Upvalues: t (copy) ]]
				local v1 = workspace:GetServerTimeNow()
				for v2, v3 in t do
					local v4 = v1 < v3.MissionData.UnlockDate
					v3.MissionFrame.Locked.Visible = v4
					v3.MissionFrame.Title.Visible = not v4
					if v4 then
						v3.MissionFrame.Locked.TextLabel.Text = "Locked Until " .. os.date("%B %d, %Y at %I:%M %p", v3.MissionData.UnlockDate)
					end
				end
			end)
			v13.new(p1.SelectedFrame.Header.BackButton, {
				Click = function() --[[ Click | Line: 1578 | Upvalues: v38 (ref) ]]
					v38:set("List")
				end
			})
			v38:subscribe(function(p12) --[[ Line: 1583 | Upvalues: p1 (copy), setSelectedMission (copy) ]]
				if p12 == "List" then
					p1.List.Visible = true
					p1.SelectedFrame.Visible = false
				else
					p1.List.Visible = false
					p1.SelectedFrame.Visible = true
					setSelectedMission(p12)
				end
			end)
		end
	}
	function t.OpenCurrencyShop(p1) --[[ OpenCurrencyShop | Line: 1596 | Upvalues: ContainerFrame (copy), v14 (copy), t2 (copy) ]]
		local EventShop = ContainerFrame.Menu.TabFrames:FindFirstChild("EventShop")
		local EventShop_2 = ContainerFrame.TabButtons:FindFirstChild("EventShop")
		if not (EventShop and EventShop_2) then
			return
		end
		v14.OpenTab(EventShop)
		local v1 = t2.EventShop(EventShop, EventShop_2)
		local Currency = EventShop.TabFrames:FindFirstChild("Currency")
		local Currency_2 = EventShop.TabButtons:FindFirstChild("Currency")
		if not (Currency and (Currency_2 and v1)) then
			return
		end
		v14.OpenTab(Currency)
		v1.Currency(Currency, Currency_2)
	end
	function t.Init(p1) --[[ Init | Line: 1613 | Upvalues: v17 (copy), v12 (copy), ContainerFrame (copy), t (copy), v13 (copy), Sonar (copy), v14 (copy), t2 (copy) ]]
		if v17.EventName ~= "Valentines2026" then
			return
		end
		v12.AddFrame(ContainerFrame, {
			TweenAnimation = "Open",
			CloseAll = "CloseOverlay",
			OpenPosition = ContainerFrame.Position,
			ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
		})
		for v1, v2 in ContainerFrame.Menu.TabFrames.EventShop.TabFrames.Currency.Content:GetChildren() do
			if v2:IsA("Frame") then
				v2.Icon.Image = v17.CurrentEventUICosmetics.CurrencyImage
				v2.IconBG.Image = v17.CurrentEventUICosmetics.CurrencyImage
				if tonumber(v2.Name) < 6 then
					v2.UIGradient.Color = v17.CurrentEventUICosmetics.MainUIGradient.Color
					v2.AmountLabel.UIGradient.Color = v17.CurrentEventUICosmetics.PremiumShopCurrencyGradient.Color
					v2.AmountLabel.UIStroke.Color = v17.CurrentEventUICosmetics.CurrencyStrokeColor
				end
			end
		end
		v12.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 1638 | Upvalues: t (ref) ]]
			t:OnClose()
		end)
		v12.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 1641 | Upvalues: t (ref) ]]
			t:OnOpen()
		end)
		v13.new(ContainerFrame.Menu.CloseButton, {
			Click = t.Close
		})
		v13.new(ContainerFrame.Menu.HelpButton, {
			Click = function() --[[ Click | Line: 1650 | Upvalues: Sonar (ref) ]]
				Sonar("TutorialService").PromptPopupInfo("Event")
			end
		})
		for v4, v5 in ContainerFrame.TabButtons:GetChildren() do
			if v5:IsA("ImageButton") then
				local v6 = ContainerFrame.Menu.TabFrames:FindFirstChild(v5.Name)
				if v6 then
					v14.AddTab(v6, {
						ParentFrame = ContainerFrame,
						Button = v5
					})
					v13.new(v5, {
						Click = function() --[[ Click | Line: 1667 | Upvalues: v6 (copy), v14 (ref), t2 (ref), v5 (copy) ]]
							if v6 then
								v14.OpenTab(v6)
								t2[v5.Name](v6, v5)
							end
						end
					})
				end
			end
		end
		t2.Missions(ContainerFrame.Menu.TabFrames.Missions, ContainerFrame.TabButtons.Missions)
	end
	function t.ClaimMission(p1, p2, p3) --[[ ClaimMission | Line: 1679 | Upvalues: v15 (copy), v32 (copy), v2 (copy), Sonar (copy), v16 (copy) ]]
		if p1 == "EventMissions" then
			local v1 = v15.CanClaimEventMission(v32, p2, p3)
			if v1 ~= true then
				v2.NotifyIssue(v1)
				return
			end
			local v22 = v15.ClaimEventMission(p2, p3)
			if v22 and v22 ~= true then
				task.wait()
				Sonar("DisplayAnimalClient"):DisplaySlot({
					Type = "Claimed",
					AllowNaming = true,
					ShowMaxWarning = true,
					MobileClickBackgroundToClose = true,
					Slot = v32:GetItemFolder("Animals"):WaitForChild(v22)
				})
			end
		else
			if p1 ~= "MiniMissions" then
				return
			end
			local v3 = v15.CanClaimMiniQuestMission(v32, p2)
			if v3 ~= true then
				v2.NotifyIssue(v3)
				return
			end
			v16.GetRemoteFunction("ClaimMiniQuestMissionRemote"):InvokeServer(p2)
		end
	end
	t:Init()
	return t
else
	return {}
end