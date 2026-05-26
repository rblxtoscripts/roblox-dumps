-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require((ReplicatedStorage:WaitForChild("Sonar")))
Sonar("TeleportService")
Sonar("PlayerWrapper")
local v1 = Sonar("Constants")
local v2 = Sonar("MarketplaceUtils")
Sonar("InstanceUtils")
local v3 = Sonar("RemoteUtils")
Sonar("EventUtils")
local v4 = Sonar("TimeUtils")
Sonar("GuiUtils")
local v5 = Sonar("InputTypeDetector")
local v6 = Sonar("CapsuleService")
local v7 = Sonar("ItemDataService")
local v8 = Sonar("WeightedProbability")
local v9 = Sonar("SortedRandom")
local v10 = Sonar("StorageUtils")
local v11 = Sonar("FormatNumber")
local v12 = Sonar("PlayerWrapper")
local v13 = Sonar("ItemSetService")
local v14 = Sonar("AnimalRiggerService")
local v15 = Sonar("AnimalCosmetics")
local v16 = Sonar("ViewportModel")
local v17 = Sonar("CommerceService")
local v18 = Sonar("DisplayUtils")
local v19 = Sonar("PlaceTypeService")
local v20 = v12.GetClient()
local v21 = v19.IsTestGame()
local v22 = Sonar("TimeSeedClass")
local v23 = Sonar("FormatString")
local v24 = Sonar("GuiManager")
local v25 = Sonar("ButtonTest")
local v26 = Sonar("Maid")
Sonar("PromptClient")
local v27 = Sonar("State")
local v28 = Sonar("spr")
local ContainerFrame = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("PremiumShop"):FindFirstChild("ContainerFrame")
local v29 = ContainerFrame:FindFirstChild("Content")
local Background = ContainerFrame:FindFirstChild("Background")
local Templates = v29:FindFirstChild("Templates")
local List = v29:FindFirstChild("List")
local t = {}
t.Duration = if RunService:IsStudio() then 45 else v1.BundleResetTime
local v32 = v22.new(t)
local BundleInfo = v1.BundleInfo
local PremiumShopData = v1.PremiumShopData
local TackPacks = v1.TackPacks
local v33 = Sonar(v10.Get("Coins"))
local v34 = Sonar(v10.Get("ClubTokens"))
local t2 = {
	ClubTokens = "Coins"
}
local t3 = {
	Featured = "BUNDLES",
	Bundles = "BUNDLES"
}
local v35 = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.InOut)
local v36 = v27.new("Featured")
local v37 = v26.new()
local t4 = {
	"SectionHeaders",
	"SectionOptions",
	"SectionContainers",
	"Coins",
	"ClubTokens",
	"Items",
	"Featured",
	"Bundles",
	"Horses",
	"Merch"
}
local t5 = {
	SectionHeaders = {
		IsSetup = false,
		Setup = function(p1, p2) --[[ Setup | Line: 106 | Upvalues: List (copy), v36 (copy), t3 (copy), v4 (copy), v32 (copy) ]]
			if not p1.IsSetup then
				local SectionHeader = List:FindFirstChild("SectionHeader")
				p1.TitleGradientsFolder = SectionHeader:FindFirstChild("TitleGradients")
				local TitleDisplay = SectionHeader.Container.TitleDisplay
				p1.SectionTitleLabel = TitleDisplay.Title
				p1.SectionTitleShadowLabel = TitleDisplay.TitleShadow
				p1.SectionTitleShadowUIStroke = p1.SectionTitleShadowLabel:FindFirstChild("UIStroke")
				p1.TimerDisplayFrame = SectionHeader.Container.TimerDisplay
				p1.TimerDisplayLabel = p1.TimerDisplayFrame.DisplayLabel
				p1.IsSetup = true
			end
			local TitleGradientsFolder = p1.TitleGradientsFolder
			local SectionTitleLabel = p1.SectionTitleLabel
			local SectionTitleShadowLabel = p1.SectionTitleShadowLabel
			local SectionTitleShadowUIStroke = p1.SectionTitleShadowUIStroke
			local TimerDisplayFrame = p1.TimerDisplayFrame
			local TimerDisplayLabel = p1.TimerDisplayLabel
			local function updateTimerLabel() --[[ updateTimerLabel | Line: 126 | Upvalues: v36 (ref), t3 (ref), TimerDisplayLabel (copy), v4 (ref), v32 (ref) ]]
				local v1 = t3[v36:get()]
				if v1 then
					TimerDisplayLabel.Text = ("%* REFRESH IN %*"):format(v1, (v4.FormatTimeWithoutLeadingZeros(v32:GetTime())))
				end
			end
			local function onSelectedSectionChanged() --[[ onSelectedSectionChanged | Line: 135 | Upvalues: v36 (ref), TitleGradientsFolder (copy), SectionTitleShadowLabel (copy), SectionTitleShadowUIStroke (copy), SectionTitleLabel (copy), TimerDisplayFrame (copy), t3 (ref), TimerDisplayLabel (copy), v4 (ref), v32 (ref) ]]
				local v1 = v36:get()
				local v2 = TitleGradientsFolder:FindFirstChild(v1) or TitleGradientsFolder:FindFirstChild("Default")
				local UIGradient = SectionTitleShadowLabel:FindFirstChildOfClass("UIGradient")
				SectionTitleShadowUIStroke:ClearAllChildren()
				SectionTitleLabel:ClearAllChildren()
				SectionTitleLabel.Text = v1:upper()
				SectionTitleShadowLabel.Text = v1:upper()
				v2:Clone().Parent = SectionTitleShadowUIStroke
				v2:Clone().Parent = SectionTitleShadowLabel
				v2:Clone().Parent = SectionTitleLabel
				if UIGradient then
					UIGradient:Destroy()
				end
				TimerDisplayFrame.Visible = t3[v1] ~= nil
				local v5 = t3[v36:get()]
				if v5 then
					TimerDisplayLabel.Text = ("%* REFRESH IN %*"):format(v5, (v4.FormatTimeWithoutLeadingZeros(v32:GetTime())))
				end
			end
			p2:GiveTask(v36:subscribe(onSelectedSectionChanged))
			p2:GiveTask(v32.TimeChanged:Connect(updateTimerLabel))
			onSelectedSectionChanged()
		end
	},
	SectionOptions = {
		IsSetup = false,
		Setup = function(p1, p2) --[[ Setup | Line: 165 | Upvalues: List (copy), v25 (copy), v36 (copy), TweenService (copy) ]]
			local v1 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			if not p1.IsSetup then
				local Container = List:FindFirstChild("SectionOptions"):FindFirstChild("Container")
				p1.OptionRows = {}
				local v2 = next
				local v3, v4 = Container:GetChildren()
				for v5, v6 in v2, v3, v4 do
					if v6:IsA("ImageButton") then
						local SelectedCover = v6:FindFirstChild("SelectedCover")
						local Line = SelectedCover:FindFirstChild("Line")
						local t = {
							LastEnteredTween = nil,
							OptionButton = v6,
							SelectedCoverLineFrame = Line,
							SelectedCoverUIStroke = SelectedCover:FindFirstChild("UIStroke")
						}
						table.insert(p1.OptionRows, t)
						v25.new(v6, {
							Click = function() --[[ Click | Line: 186 | Upvalues: v36 (ref), v6 (copy) ]]
								v36:set(v6.Name)
							end,
							OnHover = function() --[[ OnHover | Line: 189 | Upvalues: v36 (ref), v6 (copy), t (copy), TweenService (ref), Line (copy), v1 (copy) ]]
								local isName = v36:get() == v6.Name
								if not isName then
									t.LastEnteredTween = TweenService:Create(Line, v1, {
										Size = UDim2.fromScale(0.8, 0.05)
									})
									t.LastEnteredTween:Play()
								end
							end,
							OnLeave = function() --[[ OnLeave | Line: 199 | Upvalues: v36 (ref), v6 (copy), t (copy), Line (copy) ]]
								local isName = v36:get() == v6.Name
								if isName then
									return
								end
								if not t.LastEnteredTween then
									Line.Size = UDim2.fromScale(0, 0.05)
									return
								end
								t.LastEnteredTween:Cancel()
								Line.Size = UDim2.fromScale(0, 0.05)
							end
						})
					end
				end
				p1.IsSetup = true
			end
			for v7, v8 in p1.OptionRows do
				local function onSelectedSectionChanged() --[[ onSelectedSectionChanged | Line: 214 | Upvalues: v36 (ref), v8 (copy), TweenService (ref), v1 (copy) ]]
					local isName = v36:get() == v8.OptionButton.Name
					v8.SelectedCoverUIStroke.Enabled = isName
					if isName then
						TweenService:Create(v8.SelectedCoverLineFrame, v1, {
							Size = UDim2.fromScale(0.8, 0.05)
						}):Play()
					else
						v8.SelectedCoverLineFrame.Size = UDim2.fromScale(0, 0.05)
					end
				end
				p2:GiveTask(v36:subscribe(onSelectedSectionChanged))
				onSelectedSectionChanged()
			end
		end
	},
	SectionContainers = {
		IsSetup = false,
		Setup = function(p1, p2) --[[ Setup | Line: 232 | Upvalues: List (copy), t2 (copy), v5 (copy), TweenService (copy), v35 (copy), v36 (copy) ]]
			local function resolveScales(p1) --[[ resolveScales | Line: 233 ]]
				local UIScale = p1:FindFirstChildOfClass("UIScale")
				if UIScale then
					return { UIScale }
				end
				local t = {}
				for i, v in ipairs(p1:GetChildren()) do
					if v:IsA("GuiObject") then
						local UIScale_2 = v:FindFirstChildOfClass("UIScale")
						if UIScale_2 then
							table.insert(t, UIScale_2)
						end
					end
				end
				return t
			end
			if not p1.IsSetup then
				p1.SectionContainersMap = {}
				local v1 = next
				local v2, v3 = List.SectionOptions.Container:GetChildren()
				for v4, v52 in v1, v2, v3 do
					if v52:IsA("ImageButton") then
						local v6 = List:FindFirstChild(v52.Name)
						if v6 then
							p1.SectionContainersMap[v52.Name] = {
								Frame = v6,
								Scales = resolveScales(v6)
							}
						end
					end
				end
				p1.PiggybackContainersMap = {}
				for v7 in t2 do
					local v8 = List:FindFirstChild(v7)
					if v8 then
						p1.PiggybackContainersMap[v7] = {
							Frame = v8,
							Scales = resolveScales(v8)
						}
					end
				end
				p1.ActiveTweens = {}
				p1.IsSetup = true
			end
			if p1.FirstVisibilityCycleComplete == nil then
				p1.FirstVisibilityCycleComplete = false
			end
			local function applyVisibility(p12, p2, p3) --[[ applyVisibility | Line: 285 | Upvalues: p1 (copy), v5 (ref), TweenService (ref), v35 (ref) ]]
				local Frame = p12.Frame
				local Scales = p12.Scales
				local v1 = p1.ActiveTweens[Frame]
				if v1 then
					for i, v in ipairs(v1) do
						v:Cancel()
					end
					p1.ActiveTweens[Frame] = nil
				end
				local v2 = if v5.IsMobileInputType() then 1.33 else 1
				if not p2 then
					Frame.Visible = false
					return
				end
				if p3 and #Scales > 0 then
					for i, v in ipairs(Scales) do
						v.Scale = 0
					end
					Frame.Visible = true
					local t = {}
					for i, v in ipairs(Scales) do
						local v3 = TweenService:Create(v, v35, {
							Scale = v2
						})
						table.insert(t, v3)
						v3:Play()
					end
					p1.ActiveTweens[Frame] = t
					t[#t].Completed:Connect(function() --[[ Line: 311 | Upvalues: p1 (ref), Frame (copy), t (copy) ]]
						if p1.ActiveTweens[Frame] ~= t then
							return
						end
						p1.ActiveTweens[Frame] = nil
					end)
				else
					for i, v in ipairs(Scales) do
						v.Scale = v2
					end
					Frame.Visible = true
				end
			end
			local function onSelectedSectionChanged() --[[ onSelectedSectionChanged | Line: 327 | Upvalues: v36 (ref), p1 (copy), applyVisibility (copy), t2 (ref) ]]
				local v1 = v36:get()
				local isFirstVisibilityCycleComplete = p1.FirstVisibilityCycleComplete == true
				for v2, v3 in p1.SectionContainersMap do
					applyVisibility(v3, if v2 == v1 then true else false, isFirstVisibilityCycleComplete)
				end
				for v6, v7 in p1.PiggybackContainersMap do
					applyVisibility(v7, if t2[v6] == v1 then true else false, isFirstVisibilityCycleComplete)
				end
				p1.FirstVisibilityCycleComplete = true
			end
			p2:GiveTask(v36:subscribe(onSelectedSectionChanged))
			onSelectedSectionChanged()
		end
	},
	Coins = {
		IsSetup = false,
		Setup = function(p1, p2) --[[ Setup | Line: 346 | Upvalues: List (copy), v33 (copy), v11 (copy), v25 (copy), v2 (copy), Players (copy) ]]
			if p1.IsSetup then
				return
			end
			local v1 = List:FindFirstChild("Coins"):FindFirstChild("Content")
			for i, v in ipairs(v33) do
				local v22 = v1:FindFirstChild((tostring(i)))
				if v22 then
					local Container = v22:FindFirstChild("Container")
					local Buy = Container:FindFirstChild("Buy")
					local Sale = Container:FindFirstChild("Sale")
					local AmountLabel = Container:FindFirstChild("AmountLabel")
					Sale.Visible = false
					AmountLabel.Text = ("$%*"):format((v11.splice(v.Amount)))
					v25.new(Buy, {
						Click = function() --[[ Click | Line: 366 | Upvalues: v2 (ref), Players (ref), v (copy) ]]
							v2.PromptPurchase(Players.LocalPlayer, v.ProductId, "Product")
						end
					})
					task.spawn(function() --[[ Line: 371 | Upvalues: v2 (ref), v (copy), Buy (copy) ]]
						local v1 = v2.GetProductInfo(v.ProductId, "Product")
						Buy.Top.TextLabel.Text = ("\238\128\130%*"):format(v1 and tostring(v1.PriceInRobux) or "N/A")
					end)
				end
			end
			p1.IsSetup = true
		end
	},
	ClubTokens = {
		IsSetup = false,
		Setup = function(p1, p2) --[[ Setup | Line: 382 | Upvalues: List (copy), v34 (copy), v11 (copy), v25 (copy), v2 (copy), Players (copy) ]]
			if p1.IsSetup then
				return
			end
			local v1 = List:FindFirstChild("ClubTokens"):FindFirstChild("Content")
			for i, v in ipairs(v34) do
				local v22 = v1:FindFirstChild((tostring(i)))
				if v22 then
					local Container = v22:FindFirstChild("Container")
					local Buy = Container:FindFirstChild("Buy")
					local Sale = Container:FindFirstChild("Sale")
					local AmountLabel = Container:FindFirstChild("AmountLabel")
					Sale.Visible = false
					AmountLabel.Text = v11.splice(v.Amount)
					v25.new(Buy, {
						Click = function() --[[ Click | Line: 402 | Upvalues: v2 (ref), Players (ref), v (copy) ]]
							v2.PromptPurchase(Players.LocalPlayer, v.ProductId, "Product")
						end
					})
					task.spawn(function() --[[ Line: 407 | Upvalues: v2 (ref), v (copy), Buy (copy) ]]
						local v1 = v2.GetProductInfo(v.ProductId, "Product")
						Buy.Top.TextLabel.Text = ("\238\128\130%*"):format(v1 and tostring(v1.PriceInRobux) or "N/A")
					end)
				end
			end
			p1.IsSetup = true
		end
	},
	Items = {
		IsSetup = false,
		Setup = function(p1, p2) --[[ Setup | Line: 418 | Upvalues: List (copy), Templates (copy), Sonar (copy), v10 (copy), v7 (copy), v23 (copy), v25 (copy), v2 (copy), Players (copy), PremiumShopData (copy) ]]
			if p1.IsSetup then
				return
			end
			local Items = List:FindFirstChild("Items")
			local ItemSlotTemplate = Templates:FindFirstChild("ItemSlotTemplate")
			local function addProduct(p1) --[[ addProduct | Line: 423 | Upvalues: Sonar (ref), v10 (ref), v7 (ref), ItemSlotTemplate (copy), v23 (ref), v25 (ref), v2 (ref), Players (ref), Items (copy) ]]
				local v1 = Sonar(v10.Get(p1.Type))
				local v22 = if v1 then v1[p1.Name] else v1
				if not v22 then
					warn((("could not find item data for: %*"):format(p1.Name)))
					return
				end
				local v3 = if v22.Items == nil then false else true
				local v4 = nil
				if v3 then
					for v5, v6 in v22.Items do
						v4 = {
							Name = v5,
							Amount = v6
						}
						break
					end
				else
					v4 = v22
				end
				local v72 = v7.GetByName(v4.Name)
				if not v72 then
					warn((("could not find item data for: %*"):format(v4.Name)))
					return
				end
				local ProductId = v22.ProductId
				if not ProductId then
					local v8 = Sonar(v10.Get("ShopItems"))
					local v9 = if v8 then v8[p1.Name] else v8
					ProductId = if v9 then v9.ProductId else v9
				end
				if not ProductId then
					warn((("could not resolve ProductId for: %*"):format(p1.Name)))
				else
					local v11 = ItemSlotTemplate:Clone()
					local Container = v11:FindFirstChild("Container")
					local ItemImage = Container:FindFirstChild("ItemImage")
					local Title = Container:FindFirstChild("Title")
					local Amount = Container:FindFirstChild("Amount")
					local Sale = Container:FindFirstChild("Sale")
					local BuyButton = Container:FindFirstChild("BuyButton")
					ItemImage.Image = v72.Image
					if v3 then
						Title.Text = ("%* Pack"):format((v23.separateWordsInString(v72.Name)))
					else
						Title.Text = v23.separateWordsInString(v72.Name)
					end
					Amount.Visible = false
					if v4.Amount then
						Amount.Text = ("x%*"):format(v4.Amount)
						Amount.Visible = true
					end
					Sale.Visible = false
					if v22.PercentOff then
						Sale.Visible = true
						Sale.AmountLabel.Text = string.format("%d%% OFF", v22.PercentOff)
					end
					v25.new(BuyButton, {
						Click = function() --[[ Click | Line: 487 | Upvalues: v2 (ref), Players (ref), ProductId (ref) ]]
							v2.PromptPurchase(Players.LocalPlayer, ProductId, "Product")
						end
					})
					task.spawn(function() --[[ Line: 492 | Upvalues: v2 (ref), ProductId (ref), BuyButton (copy) ]]
						local v1 = v2.GetProductInfo(ProductId, "Product")
						BuyButton.Top.TextLabel.Text = ("\238\128\130%*"):format(v1 and tostring(v1.PriceInRobux) or "N/A")
					end)
					v11.Visible = true
					v11.Name = p1.Name
					v11.LayoutOrder = p1.LayoutOrder
					Container.BG.BackgroundColor3 = p1.BackgroundColor or Color3.fromRGB(255, 243, 226)
					v11:AddTag("PremiumShopScaledInstances")
					v11.Parent = Items
				end
			end
			for i, v in ipairs(PremiumShopData.Items.Products) do
				addProduct(v)
			end
			p1.IsSetup = true
		end
	},
	Featured = {
		IsSetup = false,
		Setup = function(p1, p2) --[[ Setup | Line: 515 | Upvalues: List (copy), Templates (copy), Sonar (copy), v10 (copy), v1 (copy), v20 (copy), v26 (copy), v32 (copy), v8 (copy), v9 (copy), v7 (copy), v23 (copy), v6 (copy), v5 (copy), v25 (copy), v2 (copy), Players (copy), PremiumShopData (copy) ]]
			if not p1.IsSetup then
				p1.FeaturedSeedRefreshers = {}
				local Featured = List:FindFirstChild("Featured")
				local FeaturedSlotTemplate = Templates:FindFirstChild("FeaturedSlotTemplate")
				local BundleSlotTemplate = Templates:FindFirstChild("BundleSlotTemplate")
				local function addProduct(p12) --[[ addProduct | Line: 522 | Upvalues: Sonar (ref), v10 (ref), v1 (ref), v20 (ref), v26 (ref), FeaturedSlotTemplate (copy), BundleSlotTemplate (copy), v32 (ref), v8 (ref), v9 (ref), v7 (ref), v23 (ref), v6 (ref), v5 (ref), v25 (ref), v2 (ref), Players (ref), p1 (copy), Featured (copy) ]]
					local isType = p12.Type == "OneTimeBundles"
					local v12 = isType and Sonar(v10.Get("OneTimeBundles"))[p12.Name] or v1.BundleInfo[p12.Name]
					if v12 and (v12.Items and next(v12.Items)) then
						if v12.DisplayCheck and (v12.DisplayCheck.PlaytimeMax and v20.PlayerData.Stats.PlayTime.Value / 3600 >= v12.DisplayCheck.PlaytimeMax) then
							return
						end
						if v12.FeaturedItem and not v12.Items[v12.FeaturedItem] then
							warn((("FeaturedItem \"%*\" not found in Items for bundle: %*"):format(v12.FeaturedItem, p12.Name)))
						end
						local v22 = if v12.FeaturedItem == nil then false elseif v12.Items[v12.FeaturedItem] == nil then false else true
						local v3 = v26.new()
						local v52 = (v22 and FeaturedSlotTemplate or BundleSlotTemplate):Clone()
						local BuyButton = v52:FindFirstChild("BuyButton")
						local function refreshBundleItems() --[[ refreshBundleItems | Line: 543 | Upvalues: v3 (copy), v32 (ref), v52 (copy), v22 (copy), v1 (ref), v8 (ref), v9 (ref), v7 (ref), v23 (ref), v6 (ref), v12 (copy), v5 (ref) ]]
							v3:DoCleaning()
							local CurrentSeed = v32.CurrentSeed
							local t = {}
							local t2 = {}
							local t3 = {}
							local t4 = {}
							local BundleItems = v52:FindFirstChild("BundleItems")
							local Default = BundleItems:FindFirstChild("Default")
							local v13 = nil
							local v2
							if v22 then
								local FeaturedItem = v52:FindFirstChild("FeaturedItem")
								if FeaturedItem then
									local Default_2 = FeaturedItem:FindFirstChild("Default")
									v2 = FeaturedItem
									v13 = Default_2
								else
									v2 = FeaturedItem
								end
							else
								v2 = nil
							end
							for v33, v4 in next, v1.RandomEquipmentDropThemes do
								v4.Name = v33
								table.insert(t2, v4)
							end
							table.sort(t2, function(p1, p2) --[[ Line: 566 ]]
								return p1.Name < p2.Name
							end)
							local function createItem(p1, p2, p3, p4, p5, p6) --[[ createItem | Line: 570 | Upvalues: v8 (ref), v9 (ref), CurrentSeed (copy), v7 (ref), v23 (ref), v6 (ref), t2 (copy), v3 (ref) ]]
								local v1 = p5:Clone()
								if p1.Name == "RandomEquipment" then
									p1 = v7.GetByName(v9[v8.getRandomWeightedItem(v9, CurrentSeed)].Name)
								end
								v1.Icon.Image = p1.Image
								v1.ItemName.Text = ("x%* %*"):format(p2, (v23.separateWordsInString(p1.Name)))
								v1.Visible = true
								if p1.ColorSequence then
									v1.Icon.UIGradient.Color = p1.ColorSequence
									v1.Icon.UIGradient.Enabled = true
								end
								v1.Theme.Visible = false
								if p3 and p3.Theme then
									local v4 = v6.DetermineTheme(p3, t2, CurrentSeed)
									if v4 then
										local v5 = v7.GetByName(v4)
										if v5 then
											v1.Theme.ImageLabel.Image = v5.Texture or ""
											v1.Theme.ImageLabel.UIGradient.Color = v5.ColorSequence or ColorSequence.new(Color3.fromRGB(255, 255, 255))
											v1.Theme.ImageLabel.UIGradient.Enabled = true
											v1.Theme.Visible = true
										end
									end
								end
								table.insert(p6, v1)
								v1.Parent = p4
								v3:GiveTask(v1)
								return v1
							end
							local function buildPackItem(p1, p2, p3, p4, p5) --[[ buildPackItem | Line: 615 | Upvalues: v8 (ref), v9 (ref), CurrentSeed (copy), v12 (ref), v7 (ref), createItem (copy) ]]
								local v1, v2
								if typeof(p2) == "table" and p2 then
									v1 = p1
									v2 = p2
								else
									v1 = p1
									v2 = {
										Amount = p2
									}
								end
								if v1 == "RandomEquipment" then
									v1 = v9[v8.getRandomWeightedItem(v9, CurrentSeed + (v2.SeedOffset or 0) + (v12.ProductId or 0))].Name
								end
								local v4 = v7.GetByName(v1)
								if not v4 then
									warn("No item data found for", v1)
									return
								end
								createItem(v4, v2.Amount or 1, if v4.ItemType == "Equipment" and v2.Theme ~= nil then {
	Theme = v2.Theme,
	SeedOffset = v2.SeedOffset or 0,
	AlwaysTheme = v2.AlwaysTheme,
	ThemeChance = v2.ThemeChance
} else nil, p3, p4, p5)
							end
							local function addItem(p1, p2, p3, p4, p5) --[[ addItem | Line: 654 | Upvalues: buildPackItem (copy) ]]
								if typeof(p1) ~= "table" then
									buildPackItem(p1, p2, p3, p4, p5)
									return
								end
								for v1, v2 in p1 do
									buildPackItem(v2, p2, p3, p4, p5)
								end
							end
							for v53, v62 in v12.Items do
								if not v22 or v53 ~= v12.FeaturedItem then
									if v53 == "RandomEquipment" then
										v53 = v9[v8.getRandomWeightedItem(v9, CurrentSeed + (typeof(v62) == "table" and v62.SeedOffset or 0) + (v12.ProductId or 0))].Name
									end
									if v62.ChoosePullTable then
										local v82 = Random.new(CurrentSeed + (v62.SeedOffset or 0) + (v12.ProductId or 0))
										local v92 = v62.ChoosePullTable[v82:NextInteger(1, #v62.ChoosePullTable)]
										local v10 = typeof(v92) == "string" and v1.TackPacks[v92] or v92
										if typeof(v10) == "table" then
											local t5 = {}
											for i = 1, v62.PullAmount or #v10 do
												local v122 = nil
												if v62.NoRepeatItems then
													local t6 = {}
													for v132, v14 in v10 do
														if not t5[v14] then
															table.insert(t6, v14)
														end
													end
													if #t6 > 0 then
														v122 = t6[v82:NextInteger(1, #t6)]
														t5[v122] = true
													end
												else
													v122 = v10[v82:NextInteger(1, #v10)]
												end
												if v122 then
													addItem(v122, v62, BundleItems, Default, t3)
												end
											end
										end
										continue
									end
									if typeof(v62) == "table" and v62.PullTable then
										local v15 = Random.new(CurrentSeed + (v62.SeedOffset or 0))
										local t5 = {}
										for v16, v17 in v62.PullTable do
											if not t[v17] then
												table.insert(t5, v17)
											end
										end
										table.sort(t5, function(p1, p2) --[[ Line: 717 ]]
											local v1 = typeof(p1) == "table" and p1[1] or p1
											local v2 = typeof(p2) == "table" and p2[1] or p2
											return tostring(v1) < tostring(v2)
										end)
										if #t5 > 0 then
											local v18 = t5[v15:NextInteger(1, #t5)]
											t[v18] = true
											addItem(v18, v62, BundleItems, Default, t3)
										end
										continue
									end
									addItem(v53, v62, BundleItems, Default, t3)
								end
							end
							if v22 and (v2 and v13) then
								buildPackItem(v12.FeaturedItem, v12.Items[v12.FeaturedItem], v2, v13, t4)
							end
							local v20 = #t3
							local v21 = if v5.IsMobileInputType() then 1.33 else 1
							local v222 = v22 and UDim2.fromScale(0.21, 1) or (v20 <= 3 and UDim2.fromScale(0.21, 1) or (v20 > 8 and UDim2.fromScale(0.165, 1) or UDim2.fromScale(0.21, 1)))
							for j = 1, #t3 do
								t3[j].Size = UDim2.fromScale(v222.X.Scale * v21, v222.Y.Scale * v21)
							end
							table.clear(t3)
							table.clear(t4)
						end
						v52:FindFirstChild("Title").Text = v12.DisplayName
						local v62 = v12.PurchaseLimit or 1
						local v72 = isType and v20.PlayerData.OneTimeBundles:FindFirstChild(p12.Name) or nil
						local function isAtLimit() --[[ isAtLimit | Line: 760 | Upvalues: v72 (copy), v62 (copy) ]]
							if not v72 then
								return false
							end
							local v1 = v72.Value
							if typeof(v1) == "boolean" then
								return v1
							end
							return v62 <= v1
						end
						local function updateBundleVisibility() --[[ updateBundleVisibility | Line: 767 | Upvalues: v52 (copy), v72 (copy), v62 (copy) ]]
							local v2
							if v72 then
								local v3 = v72.Value
								v2 = if typeof(v3) == "boolean" then v3 else v62 <= v3
							else
								v2 = false
							end
							v52.Visible = not v2
						end
						v25.new(BuyButton, {
							Click = function() --[[ Click | Line: 772 | Upvalues: v72 (copy), v62 (copy), v2 (ref), Players (ref), v12 (copy) ]]
								local v1
								if v72 then
									local v22 = v72.Value
									v1 = if typeof(v22) == "boolean" then v22 else v62 <= v22
								else
									v1 = false
								end
								if not v1 then
									v2.PromptPurchase(Players.LocalPlayer, v12.ProductId, "Product")
								end
							end
						})
						task.spawn(function() --[[ Line: 780 | Upvalues: v2 (ref), v12 (copy), BuyButton (copy), v72 (copy), v62 (copy), v52 (copy) ]]
							local v1 = v2.GetProductInfo(v12.ProductId, "Product")
							local v4 = ("\238\128\130%*"):format(v1 and tostring(v1.PriceInRobux) or "N/A")
							local function refreshLabel() --[[ refreshLabel | Line: 783 | Upvalues: BuyButton (ref), v72 (ref), v62 (ref), v4 (copy) ]]
								local v1
								if v72 then
									local v2 = v72.Value
									v1 = if typeof(v2) == "boolean" then v2 else v62 <= v2
								else
									v1 = false
								end
								BuyButton.Top.TextLabel.Text = if v1 then "OWNED" else v4
							end
							local function onPurchaseStateChanged() --[[ onPurchaseStateChanged | Line: 786 | Upvalues: BuyButton (ref), v72 (ref), v62 (ref), v4 (copy), v52 (ref) ]]
								local v1
								if v72 then
									local v2 = v72.Value
									v1 = if typeof(v2) == "boolean" then v2 else v62 <= v2
								else
									v1 = false
								end
								BuyButton.Top.TextLabel.Text = if v1 then "OWNED" else v4
								local v5
								if v72 then
									local v6 = v72.Value
									v5 = if typeof(v6) == "boolean" then v6 else v62 <= v6
								else
									v5 = false
								end
								v52.Visible = not v5
							end
							local TextLabel = BuyButton.Top.TextLabel
							local v5
							if v72 then
								local v6 = v72.Value
								v5 = if typeof(v6) == "boolean" then v6 else v62 <= v6
							else
								v5 = false
							end
							TextLabel.Text = if v5 then "OWNED" else v4
							local v8 = v52
							local v9
							if v72 then
								local v10 = v72.Value
								v9 = if typeof(v10) == "boolean" then v10 elseif v62 <= v10 then true else false
							else
								v9 = false
							end
							v8.Visible = not v9
							if not v72 then
								return
							end
							v72:GetPropertyChangedSignal("Value"):Connect(onPurchaseStateChanged)
						end)
						refreshBundleItems()
						table.insert(p1.FeaturedSeedRefreshers, refreshBundleItems)
						local v82
						if v72 then
							local v92 = v72.Value
							v82 = if typeof(v92) == "boolean" then v92 elseif v62 <= v92 then true else false
						else
							v82 = false
						end
						v52.Visible = not v82
						v52.Name = v12.DisplayName
						v52.LayoutOrder = p12.LayoutOrder
						v52.BG.BackgroundColor3 = v12.CanvasBackgroundColor or Color3.fromRGB(255, 129, 173)
						v52:AddTag("PremiumShopScaledInstances")
						v52.Parent = Featured
					else
						warn((("could not find bundle info or items for featured product: %*"):format(p12.Name)))
					end
				end
				for i, v in ipairs(PremiumShopData.Featured.Products) do
					addProduct(v)
				end
				p1.IsSetup = true
			end
			for v12, v22 in p1.FeaturedSeedRefreshers do
				v22()
				p2:GiveTask(v32.SeedChanged:Connect(v22))
			end
		end
	},
	Bundles = {
		IsSetup = false,
		Setup = function(p1, p2) --[[ Setup | Line: 820 | Upvalues: List (copy), Templates (copy), Sonar (copy), v10 (copy), v26 (copy), v32 (copy), v8 (copy), TackPacks (copy), v23 (copy), v1 (copy), v9 (copy), v7 (copy), v6 (copy), v25 (copy), v2 (copy), Players (copy), v4 (copy) ]]
			if not p1.IsSetup then
				p1.BundleSeedRefreshers = {}
				p1.BundleSaleRows = {}
				local Bundles = List:FindFirstChild("Bundles")
				local BundleSlotTemplate = Templates:FindFirstChild("BundleSlotTemplate")
				local v12 = Sonar(v10.Get("TackProducts"))
				local function addProduct(p12, p2) --[[ addProduct | Line: 828 | Upvalues: BundleSlotTemplate (copy), v26 (ref), v32 (ref), v8 (ref), TackPacks (ref), v23 (ref), v1 (ref), v9 (ref), v7 (ref), v6 (ref), v25 (ref), v2 (ref), Players (ref), p1 (copy), Bundles (copy) ]]
					local v12 = BundleSlotTemplate:Clone()
					local BundleItems = v12:FindFirstChild("BundleItems")
					local Default = BundleItems:FindFirstChild("Default")
					local Title = v12:FindFirstChild("Title")
					local BuyButton = v12:FindFirstChild("BuyButton")
					local SaleBanner = v12:FindFirstChild("SaleBanner")
					local v22 = v26.new()
					local function refreshBundleItems() --[[ refreshBundleItems | Line: 839 | Upvalues: v22 (copy), v32 (ref), v8 (ref), p12 (copy), TackPacks (ref), Title (copy), v23 (ref), v1 (ref), Default (copy), v9 (ref), v7 (ref), v6 (ref), BundleItems (copy) ]]
						v22:DoCleaning()
						local CurrentSeed = v32.CurrentSeed
						local t = {}
						local t2 = {}
						local v12 = v8.getRandomWeightedItem(p12.Species, CurrentSeed)
						local v2 = TackPacks[v12]
						if not v2 then
							warn((("could not find TackPack loot table for species: %*"):format((tostring(v12)))))
							return
						end
						Title.Text = ("%* Pack"):format((v23.separateWordsInString(v12)))
						for v3, v4 in next, v1.RandomEquipmentDropThemes do
							v4.Name = v3
							table.insert(t, v4)
						end
						table.sort(t, function(p1, p2) --[[ Line: 860 ]]
							return p1.Name < p2.Name
						end)
						local function createItem(p1, p2, p3) --[[ createItem | Line: 864 | Upvalues: Default (ref), v8 (ref), v9 (ref), CurrentSeed (copy), v7 (ref), v23 (ref), v6 (ref), t (copy), t2 (copy), BundleItems (ref), v22 (ref) ]]
							local v1 = Default:Clone()
							if p1.Name == "RandomEquipment" then
								p1 = v7.GetByName(v9[v8.getRandomWeightedItem(v9, CurrentSeed)].Name)
							end
							v1.Icon.Image = p1.Image
							v1.ItemName.Text = ("x%* %*"):format(p2, (v23.separateWordsInString(p1.Name)))
							v1.Visible = true
							if p1.ColorSequence then
								v1.Icon.UIGradient.Color = p1.ColorSequence
								v1.Icon.UIGradient.Enabled = true
							end
							v1.Theme.Visible = false
							if p3 and p3.Theme then
								local v4 = v6.DetermineTheme(p3, t, CurrentSeed)
								if v4 then
									local v5 = v7.GetByName(v4)
									if v5 then
										v1.Theme.ImageLabel.Image = v5.Texture or ""
										v1.Theme.ImageLabel.UIGradient.Color = v5.ColorSequence or ColorSequence.new(Color3.fromRGB(255, 255, 255))
										v1.Theme.ImageLabel.UIGradient.Enabled = true
										v1.Theme.Visible = true
									end
								end
							end
							table.insert(t2, v1)
							v1.Parent = BundleItems
							v22:GiveTask(v1)
							return v1
						end
						local function createTackItem(p1, p2) --[[ createTackItem | Line: 902 | Upvalues: v8 (ref), v9 (ref), CurrentSeed (copy), p12 (ref), v7 (ref), createItem (copy) ]]
							local v1, v2
							if typeof(p2) == "table" and p2 then
								v1 = p1
								v2 = p2
							else
								v1 = p1
								v2 = {
									Amount = p2
								}
							end
							if v1 == "RandomEquipment" then
								v1 = v9[v8.getRandomWeightedItem(v9, CurrentSeed + (if typeof(v2) == "table" then v2.SeedOffset or 0 else 0) + (p12.ProductId or 0))].Name
							end
							local v4 = v7.GetByName(v1)
							if not v4 then
								return
							end
							createItem(v4, v2.Amount or 1, if v4.ItemType == "Equipment" and v2.Theme ~= nil then {
	Theme = v2.Theme,
	SeedOffset = v2.SeedOffset or 0,
	AlwaysTheme = v2.AlwaysTheme,
	ThemeChance = v2.ThemeChance
} else nil)
						end
						for v5, v62 in v2 do
							if typeof(v62) == "table" and v62.PullTable then
								if v62.PullAmount then
									for i = 1, v62.PullAmount do
										createTackItem(v8.getRandomWeightedItem(v62.PullTable, CurrentSeed + v62.SeedOffset), v62)
									end
									break
								else
									for v72, v82 in v62.PullTable do
										createTackItem(v82, v62)
									end
									continue
								end
							end
							createTackItem(v5, v62)
						end
						local v92 = #t2
						local v10 = v92 <= 3 and UDim2.fromScale(0.25, 1) or (v92 > 8 and UDim2.fromScale(0.165, 1) or UDim2.fromScale(0.21, 1))
						for v11, v122 in next, t2 do
							v122.Size = v10
						end
						table.clear(t2)
					end
					v25.new(BuyButton, {
						Click = function() --[[ Click | Line: 963 | Upvalues: v2 (ref), Players (ref), p12 (copy) ]]
							v2.PromptPurchase(Players.LocalPlayer, p12.ProductId, "Product")
						end
					})
					SaleBanner.Visible = false
					if p12.SaleStarts and p12.SaleEnds then
						table.insert(p1.BundleSaleRows, {
							ProductData = p12,
							SaleBannerFrame = SaleBanner
						})
					end
					task.spawn(function() --[[ Line: 976 | Upvalues: v2 (ref), p12 (copy), BuyButton (copy) ]]
						local v1 = v2.GetProductInfo(p12.ProductId, "Product")
						BuyButton.Top.TextLabel.Text = ("\238\128\130%*"):format(v1 and tostring(v1.PriceInRobux) or "N/A")
					end)
					refreshBundleItems()
					table.insert(p1.BundleSeedRefreshers, refreshBundleItems)
					v12.Visible = true
					v12.LayoutOrder = p2
					v12.Name = p12.ProductName
					v12:AddTag("PremiumShopScaledInstances")
					v12.Parent = Bundles
				end
				for i, v in ipairs(v12) do
					addProduct(v, i)
				end
				p1.IsSetup = true
			end
			for v22, v3 in p1.BundleSeedRefreshers do
				v3()
				p2:GiveTask(v32.SeedChanged:Connect(v3))
			end
			for v42, v5 in p1.BundleSaleRows do
				p2:GiveTask(v4.AttachToTime(function() --[[ Line: 1001 | Upvalues: v4 (ref), v5 (copy) ]]
					local v1 = v4.Get()
					v5.SaleBannerFrame.Visible = if v5.ProductData.SaleStarts <= v1 then v1 <= v5.ProductData.SaleEnds else false
				end))
			end
		end
	},
	Horses = {
		IsSetup = false,
		Setup = function(p1, p2) --[[ Setup | Line: 1011 | Upvalues: List (copy), Templates (copy), Sonar (copy), v10 (copy), v26 (copy), v32 (copy), v8 (copy), v7 (copy), v23 (copy), v13 (copy), v20 (copy), v14 (copy), v16 (copy), v15 (copy), v25 (copy), v2 (copy), Players (copy), v4 (copy) ]]
			if not p1.IsSetup then
				p1.HorseRows = {}
				local Horses = List:FindFirstChild("Horses")
				local HorseSlotTemplate = Templates:FindFirstChild("HorseSlotTemplate")
				local v1 = Sonar(v10.Get("CapsuleProducts"))
				local function addProduct(p12, p2) --[[ addProduct | Line: 1018 | Upvalues: HorseSlotTemplate (copy), v26 (ref), v32 (ref), v8 (ref), v7 (ref), v23 (ref), v13 (ref), v20 (ref), v14 (ref), v16 (ref), v15 (ref), v25 (ref), v2 (ref), Players (ref), p1 (copy), Horses (copy) ]]
					local v1 = HorseSlotTemplate:Clone()
					local BuyButton = v1.BuyButton
					local HorseViewport = v1.HorseViewport
					local Title = v1.Title
					local SaleBanner = v1.SaleBanner
					local ItemImage = v1.ItemImage
					local v22 = v26.new()
					local function refreshHorse() --[[ refreshHorse | Line: 1028 | Upvalues: v22 (copy), v32 (ref), v8 (ref), p12 (copy), v7 (ref), ItemImage (copy), Title (copy), v23 (ref), v26 (ref), v13 (ref), v20 (ref), v14 (ref), HorseViewport (copy), v16 (ref), v15 (ref) ]]
						v22:DoCleaning()
						local v3 = p12.Drops[v8.getRandomWeightedItem(p12.Drops, v32.CurrentSeed * 1500)]
						if not v3 then
							return
						end
						local v4 = v7.GetByName(v3.Name)
						if v4 then
							ItemImage.Image = v4.Image
							Title.Text = v23.separateWordsInString(v4.Name)
							v22:GiveTask(task.spawn(function() --[[ Line: 1047 | Upvalues: v26 (ref), v22 (ref), v13 (ref), v20 (ref), v4 (copy), v14 (ref), HorseViewport (ref), v16 (ref), v15 (ref) ]]
								local v1 = v26.new()
								v22:GiveTask(v1)
								repeat
									v1:DoCleaning()
									local v2 = v13:_giveHorse(v20, v4)
									local v3 = v14.CreateAnimalModel({
										SlotValue = v2
									})
									v3.Parent = HorseViewport
									v1:GiveTask(v3)
									local Camera = Instance.new("Camera")
									Camera.Parent = HorseViewport
									HorseViewport.CurrentCamera = Camera
									v1:GiveTask(Camera)
									Camera.FieldOfView = 1
									Camera.CFrame = v16(v3, HorseViewport, -130, -8)
									local Eyelid = v3:FindFirstChild("Eyelid")
									if Eyelid then
										Eyelid:Destroy()
									end
									HorseViewport.Ambient = Color3.fromRGB(192, 192, 192)
									HorseViewport.LightDirection = Camera.CFrame.LookVector
									v1:GiveTask(v15.new(v3, {
										InViewport = true,
										SlotValue = v2
									}))
									v1:GiveTask(v2)
									task.wait(10)
								until not Eyelid
							end))
						else
							warn((("could not find item data for capsule: %*"):format(v3.Name)))
						end
					end
					v25.new(BuyButton, {
						Click = function() --[[ Click | Line: 1091 | Upvalues: v2 (ref), Players (ref), p12 (copy) ]]
							v2.PromptPurchase(Players.LocalPlayer, p12.ProductId, "Product")
						end
					})
					SaleBanner.Visible = false
					task.spawn(function() --[[ Line: 1098 | Upvalues: v2 (ref), p12 (copy), BuyButton (copy) ]]
						local v1 = v2.GetProductInfo(p12.ProductId, "Product")
						BuyButton.Top.TextLabel.Text = ("\238\128\130%*"):format(v1 and tostring(v1.PriceInRobux) or "N/A")
					end)
					table.insert(p1.HorseRows, {
						RefreshHorse = refreshHorse,
						ProductData = p12,
						SaleBannerFrame = SaleBanner
					})
					v1.BG.BackgroundColor3 = p12.BackgroundColor or Color3.fromRGB(255, 129, 173)
					v1.Visible = true
					v1.LayoutOrder = p2
					v1.Name = p12.ProductName
					v1:AddTag("PremiumShopScaledInstances")
					v1.Parent = Horses
				end
				for i, v in ipairs(v1) do
					addProduct(v, i)
				end
				p1.IsSetup = true
			end
			for v22, v3 in p1.HorseRows do
				v3.RefreshHorse()
				p2:GiveTask(v32.SeedChanged:Connect(v3.RefreshHorse))
				if v3.ProductData.SaleStarts and v3.ProductData.SaleEnds then
					p2:GiveTask(v4.AttachToTime(function() --[[ Line: 1125 | Upvalues: v4 (ref), v3 (copy) ]]
						local v1 = v4.Get()
						v3.SaleBannerFrame.Visible = if v3.ProductData.SaleStarts <= v1 then v1 <= v3.ProductData.SaleEnds else false
					end))
				end
			end
		end
	},
	Merch = {
		IsSetup = false,
		Setup = function(p1, p2) --[[ Setup | Line: 1136 | Upvalues: List (copy), Templates (copy), Sonar (copy), v10 (copy), v25 (copy), v21 (copy), v3 (copy), Players (copy), v17 (copy), v7 (copy), v18 (copy), v11 (copy), v28 (copy), v4 (copy) ]]
			if not p1.IsSetup then
				p1.MerchRows = {}
				local Merch = List:FindFirstChild("Merch")
				local MerchSlotTemplate = Templates:FindFirstChild("MerchSlotTemplate")
				local v1 = Sonar(v10.Get("MerchBundles"))
				local function addProduct(p12, p2) --[[ addProduct | Line: 1143 | Upvalues: MerchSlotTemplate (copy), v25 (ref), v21 (ref), v3 (ref), Players (ref), v17 (ref), v7 (ref), v18 (ref), v11 (ref), Merch (copy), p1 (copy) ]]
					local v1 = MerchSlotTemplate:Clone()
					local BuyButton = v1.BuyButton
					local ProductImage = v1.ProductImage
					local SaleBanner = v1.SaleBanner
					local Items = v1.Items
					local Template = Items.Template
					local Included = v1.Included
					v1.Title.Text = p12.ForcedDisplayName
					ProductImage.Image = p12.ProductImages[1]
					v25.new(BuyButton, {
						Click = function() --[[ Click | Line: 1157 | Upvalues: v21 (ref), v3 (ref), Players (ref), p12 (copy), v17 (ref) ]]
							if v21 then
								v3.GetRemoteEvent("TestPurchaseRemote"):FireServer({
									PlayerId = Players.LocalPlayer.UserId,
									ProductId = p12.CommerceId
								})
							else
								v17:PromptCommerceProductPurchase(Players.LocalPlayer, p12.CommerceId)
							end
						end
					})
					SaleBanner.Visible = false
					if p12.Items and next(p12.Items) then
						for v2, v32 in p12.Items do
							if typeof(v32) == "table" and typeof(v32.Name) == "string" then
								local v5 = typeof(v32.Amount) == "number" and v32.Amount or 1
								local v6 = v7.GetByName(v32.Name)
								if v6 then
									local v72 = v18.GetDisplayName(v32.Name, v6)
									if v5 > 1 then
										v72 = ("x%* %*"):format(v11.splice(v5), v72)
									end
									local v9 = Template:Clone()
									v9.Icon.Image = v6.Image
									v9.ItemName.Text = v72
									v9.Name = v32.Name
									v9.Visible = true
									v9.Parent = Items
								end
							end
						end
						Included.Visible = true
						Items.Visible = true
					else
						Included.Visible = false
						Items.Visible = false
					end
					v1.LayoutOrder = p12.LayoutOrder or 0
					v1:AddTag("PremiumShopScaledInstances")
					v1.Parent = Merch
					v1.Name = p2
					v1.Visible = true
					table.insert(p1.MerchRows, {
						ProductImage = ProductImage,
						DefaultProductImagePosition = ProductImage.Position,
						SaleBannerFrame = SaleBanner,
						MerchData = p12,
						BuyButton = BuyButton,
						ProductContainer = v1
					})
				end
				for v2, v32 in v1 do
					addProduct(v32, v2)
				end
				p1.IsSetup = true
			end
			for v42, v5 in p1.MerchRows do
				p2:GiveTask(v5.ProductImage.MouseEnter:Connect(function() --[[ Line: 1227 | Upvalues: v28 (ref), v5 (copy) ]]
					v28.target(v5.ProductImage, 10, 10, {
						Position = v5.ProductImage.Position + UDim2.new(0, 0, -0.1, 0)
					})
				end))
				p2:GiveTask(v5.ProductImage.MouseLeave:Connect(function() --[[ Line: 1232 | Upvalues: v28 (ref), v5 (copy) ]]
					v28.target(v5.ProductImage, 10, 10, {
						Position = v5.DefaultProductImagePosition
					})
				end))
				if v5.MerchData.SaleStarts and (v5.MerchData.SaleEnds and v5.MerchData.SalePercentageOff) then
					p2:GiveTask(v4.AttachToTime(function() --[[ Line: 1238 | Upvalues: v4 (ref), v5 (copy) ]]
						local v1 = v4.Get()
						local v2 = if v5.MerchData.SaleStarts <= v1 then v1 <= v5.MerchData.SaleEnds else false
						v5.SaleBannerFrame.TextLabel.Text = ("%*%% OFF"):format(v5.MerchData.SalePercentageOff)
						v5.SaleBannerFrame.Visible = v2
					end))
				end
				p2:GiveTask(task.spawn(function() --[[ Line: 1245 | Upvalues: v17 (ref), v5 (copy) ]]
					local v1 = v17.GetCommerceInfo((tostring(v5.MerchData.CommerceId)))
					v5.ProductContainer.Visible = v1 and true or false
					v5.BuyButton.Top.TextLabel.Text = if v1 then v1.Item.DisplayPrice or "" else ""
				end))
			end
		end
	}
}
local t6 = {
	GetTimeSeed = function() --[[ GetTimeSeed | Line: 1259 | Upvalues: v32 (copy) ]]
		return v32
	end,
	Open = function(p1) --[[ Open | Line: 1262 | Upvalues: List (copy), v36 (copy), v24 (copy), ContainerFrame (copy) ]]
		if p1 and List:FindFirstChild("SectionOptions"):FindFirstChild("Container"):FindFirstChild(p1) then
			v36:set(p1)
		end
		v24.OpenMainFrame(ContainerFrame, {})
	end,
	Close = function() --[[ Close | Line: 1272 | Upvalues: v24 (copy), ContainerFrame (copy) ]]
		v24.CloseMainFrame(ContainerFrame)
	end,
	OnOpen = function(p1) --[[ OnOpen | Line: 1275 | Upvalues: Background (copy), v37 (copy), TweenService (copy), t4 (copy), t5 (copy) ]]
		Background.ImageTransparency = 1
		Background.BackgroundTransparency = 1
		v37:GiveTask(task.delay(0.1, function() --[[ Line: 1278 | Upvalues: TweenService (ref), Background (ref), v37 (ref) ]]
			local v1 = TweenService:Create(Background, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				BackgroundTransparency = 0.25,
				ImageTransparency = 0.94
			})
			v1:Play()
			v37:GiveTask(function() --[[ Line: 1285 | Upvalues: v1 (copy) ]]
				v1:Cancel()
			end)
		end))
		for v1, v2 in t4 do
			local v3 = t5[v2]
			if v3 and v3.Setup then
				v3.Setup(v3, v37)
			end
		end
	end,
	OnClose = function(p1) --[[ OnClose | Line: 1297 | Upvalues: v37 (copy) ]]
		v37:DoCleaning()
	end,
	_refreshTimerTabs = function() --[[ _refreshTimerTabs | Line: 1300 ]] end
}
function t6.Init() --[[ Init | Line: 1306 | Upvalues: v24 (copy), ContainerFrame (copy), t6 (copy), v25 (copy), List (copy), CollectionService (copy) ]]
	v24.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v24.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 1314 | Upvalues: t6 (ref) ]]
		t6:OnClose()
	end)
	v24.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 1317 | Upvalues: t6 (ref) ]]
		t6:OnOpen()
	end)
	v25.new(List.SectionHeader.CloseButton, {
		Click = t6.Close
	});
	(function() --[[ setupSectionScaling | Line: 1324 | Upvalues: List (ref), CollectionService (ref) ]]
		local function updateInstanceScale(p1) --[[ updateInstanceScale | Line: 1325 | Upvalues: List (ref) ]]
			local v1 = p1:GetAttribute("OriginalSize") or p1.Size.Y.Offset
			p1.Size = UDim2.new(p1.Size.X.Scale, 0, 0, List.AbsoluteSize.Y * (v1 / 746))
			p1:SetAttribute("OriginalSize", v1)
		end
		local function updateScales() --[[ updateScales | Line: 1332 | Upvalues: CollectionService (ref), updateInstanceScale (copy) ]]
			local v1 = next
			local v2, v3 = CollectionService:GetTagged("PremiumShopScaledInstances")
			for v4, v5 in v1, v2, v3 do
				updateInstanceScale(v5)
			end
		end
		local v1 = next
		local v2, v3 = CollectionService:GetTagged("PremiumShopScaledInstances")
		for v4, v5 in v1, v2, v3 do
			updateInstanceScale(v5)
		end
		List:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScales)
		CollectionService:GetInstanceAddedSignal("PremiumShopScaledInstances"):Connect(updateInstanceScale)
	end)()
end
t6.Init()
return t6