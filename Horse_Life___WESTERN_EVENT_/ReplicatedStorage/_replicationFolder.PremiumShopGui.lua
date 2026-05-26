-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("DisplayUtils")
local v2 = Sonar("spr")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("CommerceService")
local v5 = Sonar("GuiManager")
local v6 = Sonar("GuiUtils")
local v7 = Sonar("ItemDataService")
local v8 = Sonar("MarketplaceUtils")
local v9 = Sonar("Maid")
local v10 = Sonar("State")
local v11 = Sonar("StorageUtils")
local v12 = Sonar("FormatNumber")
local v13 = Sonar("TimeSeedClass")
local v14 = Sonar("FormatString")
local v15 = Sonar("TimeUtils")
local v16 = Sonar("WeightedProbability")
local v17 = Sonar("SortedRandom")
local v18 = Sonar("PlayerWrapper")
local v19 = Sonar("ItemSetService")
local v20 = Sonar("ViewportModel")
local v21 = Sonar("AnimalCosmetics")
local v22 = Sonar("CapsuleService")
local v23 = Sonar("PromoFrameView")
local v24 = Sonar("NotificationsClient")
local v25 = Sonar("ItemDisplayCreator")
local v26 = Sonar("RemoteUtils")
local v27 = Sonar("PlaceTypeService")
local v28 = v18.GetClient()
local v29 = Sonar(v11.Get("Coins"))
local v30 = Sonar(v11.Get("ClubTokens"))
local v31 = Sonar("Constants")
local v32 = v27.IsTestGame()
local BundleInfo = v31.BundleInfo
local PremiumShopData = v31.PremiumShopData
local TackPacks = v31.TackPacks
local v33 = Sonar(v11.Get("ShopItems"))
local v34 = v26.GetUnreliableRemoteEvent("ReportClientAnalyticsRemote")
local v35 = v10.new(false)
local function CreateItem(p1, p2, p3, p4, p5, p6, p7, p8) --[[ CreateItem | Line: 62 | Upvalues: v16 (copy), v17 (copy), v7 (copy), v14 (copy), v22 (copy) ]]
	local v1 = p1:Clone()
	if p2.Name == "RandomEquipment" then
		p2 = v7.GetByName(v17[v16.getRandomWeightedItem(v17, p8)].Name)
	end
	v1.Icon.Image = p2.Image
	v1.ItemName.Text = "x" .. p3 .. " " .. v14.separateWordsInString(p2.Name)
	v1.Visible = true
	if p2.ColorSequence then
		v1.Icon.UIGradient.Color = p2.ColorSequence
		v1.Icon.UIGradient.Enabled = true
	end
	v1.Theme.Visible = false
	if p6 and (p6.Theme and (p7 and p8)) then
		local v4 = v22.DetermineTheme(p6, p7, p8)
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
	v1.Parent = p4
	if p5 then
		p5:GiveTask(v1)
	end
	return v1
end
local v36 = TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local v37 = Color3.fromRGB(19, 146, 121)
local v38 = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.new(0.431373, 1, 0.501961)),
	ColorSequenceKeypoint.new(0.472, Color3.new(0.431373, 1, 0.501961)),
	ColorSequenceKeypoint.new(0.474, Color3.new(0.352941, 0.866667, 0.501961)),
	ColorSequenceKeypoint.new(1, Color3.new(0.352941, 0.866667, 0.501961))
})
local v39 = Color3.fromRGB(58, 41, 183)
local v40 = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.new(0.654902, 0.462745, 1)),
	ColorSequenceKeypoint.new(0.472, Color3.new(0.654902, 0.462745, 1)),
	ColorSequenceKeypoint.new(0.474, Color3.new(0.537255, 0.4, 1)),
	ColorSequenceKeypoint.new(1, Color3.new(0.537255, 0.4, 1))
})
local LocalPlayer = Players.LocalPlayer
local PremiumShopGui = LocalPlayer.PlayerGui:WaitForChild("PremiumShopGui")
local ContainerFrame = PremiumShopGui.ContainerFrame
local Menu = ContainerFrame.Menu
local v41 = Menu.Content
local TabFrames = v41.TabFrames
local ScrollingFrame = v41.ScrollingFrame
local v42 = v10.new(ScrollingFrame.CanvasPosition)
local v43 = v9.new()
local v44 = v10.new("Featured")
local DefaultTemplates = PremiumShopGui.ContainerFrame.Menu.Content.DefaultTemplates
local t2 = {}
t2.Duration = if RunService:IsStudio() then 45 else v31.BundleResetTime
local v47 = v13.new(t2)
local t3 = {}
local t4 = {
	MutationPotions = DefaultTemplates.ItemDefault,
	BreedPotions = DefaultTemplates.ItemDefault,
	ItemPacks = DefaultTemplates.ItemDefault,
	BundleInfo = DefaultTemplates.BundleDefault,
	MerchBundles = DefaultTemplates.MerchDefault,
	CapsuleProducts = DefaultTemplates.EmbryoDefault,
	TackProducts = DefaultTemplates.BundleDefault,
	Lootbox = DefaultTemplates.LootboxDefault
}
local t5 = {
	BundleInfo = DefaultTemplates.FeaturedBundleDefault,
	OneTimeBundles = DefaultTemplates.SpecialsBundleDefault,
	CapsuleProducts = DefaultTemplates.FeaturedEmbryoDefault,
	MerchBundles = DefaultTemplates.FeaturedMerchDefault,
	Lootbox = DefaultTemplates.LootboxDefault
}
local t6 = {
	MutationPotions = "Items",
	BreedPotions = "Items",
	BundleInfo = "ItemPacks",
	OneTimeBundles = "ItemPacks",
	ItemPacks = "Items",
	Lootbox = "Lootbox"
}
local t7 = {}
local t8 = {
	Coins = function(p1, p2) --[[ Coins | Line: 184 | Upvalues: v9 (copy), v29 (copy), v3 (copy), v8 (copy), LocalPlayer (copy), v12 (copy) ]]
		local v1 = v9.new()
		local v4 = v29[tonumber(p1.Name)]
		v1:GiveTask(p2.ProductInfo:subscribe(function(p12) --[[ Line: 188 | Upvalues: p1 (copy) ]]
			p1.Buy.Top.TextLabel.Text = "\238\128\130" .. (if p12 then p12.PriceInRobux or "N/A" else "N/A")
		end))
		v1:GiveTask(v3.new(p1.Buy, {
			Click = function() --[[ Click | Line: 194 | Upvalues: v8 (ref), LocalPlayer (ref), p2 (copy) ]]
				v8.PromptPurchase(LocalPlayer, p2.ProductId, "Product")
			end
		}))
		p1.Sale.Visible = false
		p1.AmountLabel.Text = "$" .. v12.splice(v4.Amount)
		return v1
	end,
	ClubTokens = function(p1, p2) --[[ ClubTokens | Line: 205 | Upvalues: v9 (copy), v30 (copy), v3 (copy), v8 (copy), LocalPlayer (copy), v12 (copy) ]]
		local v1 = v9.new()
		local v4 = v30[tonumber(p1.Name)]
		v1:GiveTask(p2.ProductInfo:subscribe(function(p12) --[[ Line: 209 | Upvalues: p1 (copy) ]]
			p1.Buy.Top.TextLabel.Text = "\238\128\130" .. (if p12 then p12.PriceInRobux or "N/A" else "N/A")
		end))
		v1:GiveTask(v3.new(p1.Buy, {
			Click = function() --[[ Click | Line: 215 | Upvalues: v8 (ref), LocalPlayer (ref), p2 (copy) ]]
				v8.PromptPurchase(LocalPlayer, p2.ProductId, "Product")
			end
		}))
		p1.Sale.Visible = false
		p1.AmountLabel.Text = v12.splice(v4.Amount)
		return v1
	end,
	TackProducts = function(p1, p2) --[[ TackProducts | Line: 226 | Upvalues: v9 (copy), v16 (copy), v47 (copy), TackPacks (copy), v31 (copy), v3 (copy), v8 (copy), LocalPlayer (copy), v14 (copy), v15 (copy), v17 (copy), v7 (copy), CreateItem (copy) ]]
		local v1 = v9.new()
		local v2 = v16.getRandomWeightedItem(p2.ProductData.Species, v47.CurrentSeed)
		local t = {}
		for v4, v5 in v31.RandomEquipmentDropThemes do
			v5.Name = v4
			table.insert(t, v5)
		end
		table.sort(t, function(p1, p2) --[[ Line: 240 ]]
			return p1.Name < p2.Name
		end)
		v1:GiveTask(p2.ProductInfo:subscribe(function(p12) --[[ Line: 244 | Upvalues: p1 (copy) ]]
			p1.BuyButton.Top.TextLabel.Text = "\238\128\130" .. (if p12 then p12.PriceInRobux or "N/A" else "N/A")
		end))
		v1:GiveTask(v3.new(p1.BuyButton, {
			Click = function() --[[ Click | Line: 250 | Upvalues: v8 (ref), LocalPlayer (ref), p2 (copy) ]]
				v8.PromptPurchase(LocalPlayer, p2.ProductId, "Product")
			end
		}))
		p1.Title.Text = v14.separateWordsInString(v2) .. " Pack"
		if p2.ProductData.SaleStarts and p2.ProductData.SaleEnds then
			v1:GiveTask(v15.AttachToTime(function() --[[ Line: 258 | Upvalues: v15 (ref), p2 (copy), p1 (copy) ]]
				local v1 = v15.Get()
				p1.SaleBanner.Visible = if p2.ProductData.SaleStarts <= v1 then v1 <= p2.ProductData.SaleEnds else false
			end))
		end
		local function CreateTackItem(p12, p22, p3) --[[ CreateTackItem | Line: 265 | Upvalues: v16 (ref), v17 (ref), v47 (ref), p2 (copy), v7 (ref), CreateItem (ref), p1 (copy), v1 (copy), t (copy) ]]
			local v12 = if typeof(p22) == "table" then p22 else {
	Amount = p22
}
			local v2 = if p12 == "RandomEquipment" then v17[v16.getRandomWeightedItem(v17, v47.CurrentSeed + (if typeof(v12) == "table" then v12.SeedOffset or 0 else 0) + p2.ProductId)].Name else p12
			local v4 = v7.GetByName(v2)
			if not v4 then
				warn("No item data found for", v2)
				return
			end
			CreateItem(p1.BundleItems.Default, v4, v12.Amount or 1, p1.BundleItems, v1, if v4.ItemType == "Equipment" and v12.Theme ~= nil then {
	Theme = v12.Theme,
	SeedOffset = v12.SeedOffset or 0,
	AlwaysTheme = v12.AlwaysTheme,
	ThemeChance = v12.ThemeChance
} else nil, t, v47.CurrentSeed)
		end
		for v6, v72 in TackPacks[v2] do
			if v72.PullTable then
				if v72.PullAmount then
					for i = 1, v72.PullAmount do
						CreateTackItem(v16.getRandomWeightedItem(v72.PullTable, v47.CurrentSeed + v72.SeedOffset), v72, v72.SeedOffset)
					end
					return v1
				else
					for v82, v92 in v72.PullTable do
						CreateTackItem(v92, v72, v72.SeedOffset)
					end
					continue
				end
			end
			CreateTackItem(v6, v72, v72.SeedOffset)
		end
		return v1
	end,
	CapsuleProducts = function(p1, p2) --[[ CapsuleProducts | Line: 333 | Upvalues: v9 (copy), v16 (copy), v47 (copy), v7 (copy), v14 (copy), v3 (copy), v8 (copy), LocalPlayer (copy), v15 (copy), v19 (copy), v28 (copy), Sonar (copy), v20 (copy), v21 (copy) ]]
		local v1 = v9.new()
		local v4 = v7.GetByName(p2.ProductData.Drops[v16.getRandomWeightedItem(p2.ProductData.Drops, v47.CurrentSeed * 1500)].Name)
		p1.ItemImage.Image = v4.Image
		p1.Title.Text = v14.separateWordsInString(v4.Name)
		v1:GiveTask(p2.ProductInfo:subscribe(function(p12) --[[ Line: 343 | Upvalues: p1 (copy) ]]
			p1.BuyButton.Top.TextLabel.Text = "\238\128\130" .. (if p12 then p12.PriceInRobux or "N/A" else "N/A")
		end))
		v1:GiveTask(v3.new(p1.BuyButton, {
			Click = function() --[[ Click | Line: 349 | Upvalues: v8 (ref), LocalPlayer (ref), p2 (copy) ]]
				v8.PromptPurchase(LocalPlayer, p2.ProductId, "Product")
			end
		}))
		if p2.ProductData.SaleStarts and p2.ProductData.SaleEnds then
			v1:GiveTask(v15.AttachToTime(function() --[[ Line: 355 | Upvalues: v15 (ref), p2 (copy), p1 (copy) ]]
				local v1 = v15.Get()
				p1.SaleBanner.Visible = if p2.ProductData.SaleStarts <= v1 then v1 <= p2.ProductData.SaleEnds else false
			end))
		end
		v1:GiveTask(task.spawn(function() --[[ Line: 362 | Upvalues: v9 (ref), v1 (copy), v19 (ref), v28 (ref), v4 (copy), Sonar (ref), p1 (copy), v20 (ref), v21 (ref) ]]
			local v12 = v9.new()
			v1:GiveTask(v12)
			repeat
				v12:DoCleaning()
				local v2 = v19:_giveHorse(v28, v4)
				local v3 = Sonar("AnimalRiggerService").CreateAnimalModel({
					SlotValue = v2
				})
				v3.Parent = p1.HorseViewport
				v1:GiveTask(v3)
				local Camera = Instance.new("Camera")
				Camera.Parent = p1.HorseViewport
				p1.HorseViewport.CurrentCamera = Camera
				v1:GiveTask(Camera)
				Camera.FieldOfView = 1
				Camera.CFrame = v20(v3, p1.HorseViewport, -130, -8)
				local Eyelid = v3:FindFirstChild("Eyelid")
				if Eyelid then
					Eyelid:Destroy()
				end
				p1.HorseViewport.Ambient = Color3.fromRGB(192, 192, 192)
				p1.HorseViewport.LightDirection = Camera.CFrame.LookVector
				v1:GiveTask(v21.new(v3, {
					InViewport = true,
					SlotValue = v2
				}))
				v12:GiveTask(v2)
				v12:GiveTask(v3)
				task.wait(10)
			until not Eyelid
		end))
		return v1
	end,
	Items = function(p1, p2) --[[ Items | Line: 409 | Upvalues: v9 (copy), v7 (copy), v14 (copy), v3 (copy), v8 (copy), LocalPlayer (copy) ]]
		local v1 = v9.new()
		local ProductData = p2.ProductData
		local v2, v32
		if ProductData.Items then
			local t = {}
			for v4, v5 in ProductData.Items do
				table.insert(t, {
					Name = v4,
					Amount = v5
				})
			end
			v2 = t[1]
			v32 = true
		else
			v2 = ProductData
			v32 = false
		end
		local v6 = v7.GetByName(v2.Name)
		p1.ItemImage.Image = v6.Image
		if v32 then
			p1.Title.Text = v14.separateWordsInString(v6.Name) .. " Pack"
		else
			p1.Title.Text = v14.separateWordsInString(v6.Name)
		end
		if v2.Amount then
			p1.Amount.Text = "x" .. v2.Amount
			p1.Amount.Visible = true
		end
		if ProductData.PercentOff then
			p1.Sale.Visible = true
			p1.Sale.AmountLabel.Text = string.format("%d%% OFF", ProductData.PercentOff)
		end
		v1:GiveTask(p2.ProductInfo:subscribe(function(p12) --[[ Line: 448 | Upvalues: p1 (copy) ]]
			p1.BuyButton.Top.TextLabel.Text = "\238\128\130" .. (if p12 then p12.PriceInRobux or "N/A" else "N/A")
		end))
		v1:GiveTask(v3.new(p1.BuyButton, {
			Click = function() --[[ Click | Line: 454 | Upvalues: v8 (ref), LocalPlayer (ref), p2 (copy) ]]
				v8.PromptPurchase(LocalPlayer, p2.ProductId, "Product")
			end
		}))
		return v1
	end,
	ItemPacks = function(p1, p2) --[[ ItemPacks | Line: 462 | Upvalues: v9 (copy), v31 (copy), v15 (copy), v16 (copy), v17 (copy), v47 (copy), v7 (copy), CreateItem (copy), TackPacks (copy), v10 (copy), v28 (copy), v3 (copy), v24 (copy), v8 (copy), LocalPlayer (copy) ]]
		local v1 = v9.new()
		if not p2.ProductData.Items then
			return v1
		end
		local t = {}
		for v2, v32 in v31.RandomEquipmentDropThemes do
			v32.Name = v2
			table.insert(t, v32)
		end
		table.sort(t, function(p1, p2) --[[ Line: 475 ]]
			return p1.Name < p2.Name
		end)
		if p2.ProductData.SaleStarts and (p2.ProductData.SaleEnds and p2.ProductType ~= "OneTimeBundles") then
			local function updateSaleBanner() --[[ updateSaleBanner | Line: 481 | Upvalues: v15 (ref), p2 (copy), p1 (copy) ]]
				local v1 = v15.Get()
				p1.SaleBanner.Visible = if p2.ProductData.SaleStarts <= v1 then v1 <= p2.ProductData.SaleEnds else false
			end
			v1:GiveTask(v15.AttachToTime(updateSaleBanner))
			local v4 = v15.Get()
			p1.SaleBanner.Visible = if p2.ProductData.SaleStarts <= v4 then if v4 <= p2.ProductData.SaleEnds then true else false else false
		end
		local function CreateItemPackItem(p12, p22) --[[ CreateItemPackItem | Line: 493 | Upvalues: v16 (ref), v17 (ref), v47 (ref), p2 (copy), v7 (ref), CreateItem (ref), p1 (copy), v1 (copy), t (copy) ]]
			local v12 = if typeof(p22) == "table" then p22.Amount else p22
			if p12.Name == "RandomEquipment" then
				p12 = v7.GetByName(v17[v16.getRandomWeightedItem(v17, v47.CurrentSeed + (typeof(p22) == "table" and p22.SeedOffset or 0) + p2.ProductId)].Name)
			end
			return CreateItem(p1.BundleItems.Default, p12, v12, p1.BundleItems, v1, if p12.ItemType == "Equipment" and (typeof(p22) == "table" and p22.Theme ~= nil) then {
	Theme = p22.Theme,
	SeedOffset = p22.SeedOffset or 0,
	AlwaysTheme = p22.AlwaysTheme,
	ThemeChance = p22.ThemeChance
} else nil, t, v47.CurrentSeed)
		end
		local t2 = {}
		for v6, v72 in p2.ProductData.Items do
			local function addItem(p1) --[[ addItem | Line: 533 | Upvalues: v7 (ref), CreateItemPackItem (copy), v72 (copy) ]]
				if typeof(p1) == "table" then
					for v1, v2 in p1 do
						local v3 = v7.GetByName(v2)
						if v3 then
							CreateItemPackItem(v3, v72)
							continue
						end
						warn("ItemData not found for", (tostring(v2)))
					end
				else
					local v4 = v7.GetByName(p1)
					if v4 then
						CreateItemPackItem(v4, v72)
					else
						warn("ItemData not found for", (tostring(p1)))
					end
				end
			end
			if v6 == "RandomEquipment" then
				v6 = v17[v16.getRandomWeightedItem(v17, v47.CurrentSeed + (v72.SeedOffset or 0) + p2.ProductId)].Name
			end
			if typeof(v72) == "table" and v72.ChoosePullTable then
				local v82 = Random.new(v47.CurrentSeed + (v72.SeedOffset or 0) + p2.ProductId)
				local v92 = v72.ChoosePullTable[v82:NextInteger(1, #v72.ChoosePullTable)]
				local v102 = typeof(v92) == "string" and TackPacks[v92] or v92
				if typeof(v102) == "table" then
					local t3 = {}
					for i = 1, v72.PullAmount or #v102 do
						local v12 = nil
						if v72.NoRepeatItems then
							local t4 = {}
							for v13, v14 in v102 do
								if not t3[v14] then
									table.insert(t4, v14)
								end
							end
							if #t4 > 0 then
								v12 = t4[v82:NextInteger(1, #t4)]
								t3[v12] = true
							end
						else
							v12 = v102[v82:NextInteger(1, #v102)]
						end
						if v12 then
							addItem(v12)
						end
					end
				end
				continue
			end
			if typeof(v72) == "table" and v72.PullTable then
				local v152 = Random.new(v47.CurrentSeed + (v72.SeedOffset or 0))
				local t3 = {}
				for v162, v172 in v72.PullTable do
					if not t2[v172] then
						table.insert(t3, v172)
					end
				end
				table.sort(t3, function(p1, p2) --[[ Line: 599 ]]
					local v1 = typeof(p1) == "table" and p1[1] or p1
					local v2 = typeof(p2) == "table" and p2[1] or p2
					return tostring(v1) < tostring(v2)
				end)
				if #t3 > 0 then
					local v18 = t3[v152:NextInteger(1, #t3)]
					t2[v18] = true
					v6 = v18
				end
			end
			addItem(v6)
		end
		p1.Title.Text = p2.ProductData.DisplayName or p2.ProductData.Name
		if p2.ProductType == "OneTimeBundles" then
			local v20 = v1:GiveTask(v10.new(0))
			local ProductData = p2.ProductData
			v1:GiveTask(v10.subscribeMulti({ p2.ProductInfo, v1:GiveTask(v10.fromProperty(v28.PlayerData.OneTimeBundles:FindFirstChild(ProductData.Name), "Value")), v20 }, function(p12, p2) --[[ Line: 628 | Upvalues: ProductData (copy), v15 (ref), p1 (copy) ]]
				local v2 = ("%*%*"):format(utf8.char(57346), p12 and p12.PriceInRobux or "N/A")
				local SaleStarts = ProductData.SaleStarts
				local SaleEnds = ProductData.SaleEnds
				local v3 = v15.Get()
				local v4 = if SaleStarts <= v3 then if v3 <= SaleEnds then true else false else false
				p1.TimeLeft.Text = ("\226\154\160\239\184\143 This bundle will go offsale in %*!"):format((v15.FormatTimeWithoutLeadingZeros(if SaleEnds then SaleEnds - v3 else SaleEnds)))
				p1.TimeLeft.Visible = v4
				p1.BuyButton.Top.TextLabel.Text = if p2 then "PURCHASED" elseif v4 then v2 elseif SaleStarts and v3 <= SaleStarts then v15.FormatTimeWithoutLeadingZeros(SaleStarts - v3) elseif SaleEnds and SaleEnds <= v3 then "OFFSALE" else v2
			end))
			v1:GiveTask(v15.AttachToTime(function() --[[ Line: 658 | Upvalues: v20 (copy) ]]
				v20:set(v20:get() + 1)
			end))
		else
			v1:GiveTask(p2.ProductInfo:subscribe(function(p12) --[[ Line: 662 | Upvalues: p1 (copy) ]]
				p1.BuyButton.Top.TextLabel.Text = "\238\128\130" .. (if p12 then p12.PriceInRobux or "N/A" else "N/A")
			end))
		end
		v1:GiveTask(v3.new(p1.BuyButton, {
			Click = function() --[[ Click | Line: 670 | Upvalues: p2 (copy), v15 (ref), v24 (ref), v28 (ref), v8 (ref), LocalPlayer (ref) ]]
				local ProductData = p2.ProductData
				local v1 = v15.Get()
				if ProductData.ProductType ~= "OneTimeBundles" then
					v8.PromptPurchase(LocalPlayer, p2.ProductId, "Product")
					return
				end
				if ProductData.SaleStarts and v1 <= ProductData.SaleStarts then
					v24.Notify({
						Preset = "Red",
						Message = ("You can purchase this product in %*!"):format((v15.FormatTimeWithoutLeadingZeros(ProductData.SaleStarts - v1)))
					})
					return
				end
				if ProductData.SaleEnds and ProductData.SaleEnds <= v1 then
					v24.Notify({
						Message = "This product is no longer on sale!",
						Preset = "Red"
					})
					return
				end
				local v4 = v28.PlayerData.OneTimeBundles:FindFirstChild(ProductData.Name)
				if v4 and v4.Value then
					v24.Notify({
						Message = "You can only purchase this product once!",
						Preset = "Red"
					})
				else
					v8.PromptPurchase(LocalPlayer, p2.ProductId, "Product")
				end
			end
		}))
		if p2.ProductData.SaleStarts and p2.ProductData.SaleEnds then
			v1:GiveTask(v15.AttachToTime(function() --[[ Line: 717 | Upvalues: v15 (ref), p2 (copy), p1 (copy) ]]
				local v1 = v15.Get()
				local v2 = if p2.ProductData.SaleStarts <= v1 then v1 <= p2.ProductData.SaleEnds else false
				if p2.ProductType == "OneTimeBundles" then
					return
				end
				p1.SaleBanner.Visible = v2
			end))
		end
		return v1
	end,
	MerchBundles = function(p1, p2) --[[ MerchBundles | Line: 730 | Upvalues: v9 (copy), v31 (copy), v3 (copy), v32 (copy), Sonar (copy), LocalPlayer (copy), v4 (copy), t3 (ref), v2 (copy), v15 (copy), v7 (copy), v1 (copy), v12 (copy) ]]
		local v13 = v9.new()
		local v22 = nil
		for v33, v42 in v31.MerchBundles do
			local v5 = tonumber(v42.CommerceId)
			if v5 == tonumber(p2.ProductId) then
				v22 = v42
				break
			end
		end
		p1.Title.Text = v22.ForcedDisplayName
		v13:GiveTask(v3.new(p1.BuyButton, {
			Click = function() --[[ Click | Line: 744 | Upvalues: v32 (ref), Sonar (ref), LocalPlayer (ref), v22 (ref), v4 (ref) ]]
				if v32 then
					Sonar("RemoteUtils").GetRemoteEvent("TestPurchaseRemote"):FireServer({
						PlayerId = LocalPlayer.UserId,
						ProductId = v22.CommerceId
					})
				else
					v4:PromptCommerceProductPurchase(LocalPlayer, v22.CommerceId)
				end
			end
		}))
		local Position = p1.ProductImage.Position
		p1.ProductImage.Image = v22.ProductImages[1]
		local t = {
			ImageSpot = p1.ProductImage,
			MerchData = v22
		}
		table.insert(t3, t)
		v13:GiveTask(p1.ProductImage.MouseEnter:Connect(function() --[[ Line: 765 | Upvalues: v2 (ref), p1 (copy) ]]
			v2.target(p1.ProductImage, 10, 10, {
				Position = p1.ProductImage.Position + UDim2.new(0, 0, -0.1, 0)
			})
		end))
		v13:GiveTask(p1.ProductImage.MouseLeave:Connect(function() --[[ Line: 771 | Upvalues: v2 (ref), p1 (copy), Position (copy) ]]
			v2.target(p1.ProductImage, 10, 10, {
				Position = Position
			})
		end))
		v13:GiveTask(p2.ProductInfo:subscribe(function(p12) --[[ Line: 777 | Upvalues: p1 (copy) ]]
			p1.Visible = p12 and true or false
			p1.BuyButton.Top.TextLabel.Text = if p12 then p12.Item.DisplayPrice or "" else ""
		end))
		if v22.SaleStarts and (v22.SaleEnds and v22.SalePercentageOff) then
			v13:GiveTask(v15.AttachToTime(function() --[[ Line: 783 | Upvalues: v15 (ref), v22 (ref), p1 (copy) ]]
				local v1 = v15.Get()
				local v2 = if v22.SaleStarts <= v1 then v1 <= v22.SaleEnds else false
				p1.SaleBanner.TextLabel.Text = ("%*%% OFF"):format(v22.SalePercentageOff)
				p1.SaleBanner.Visible = v2
			end))
		end
		if v22.Items and next(v22.Items) then
			local Template = p1.Items.Template
			for v72, v8 in v22.Items do
				if typeof(v8) == "table" and typeof(v8.Name) == "string" then
					local v10 = typeof(v8.Amount) == "number" and v8.Amount or 1
					local v11 = v7.GetByName(v8.Name)
					if v11 then
						local v122 = v1.GetDisplayName(v8.Name, v11)
						if v10 > 1 then
							v122 = ("x%* %*"):format(v12.splice(v10), v122)
						end
						local v152 = v13:GiveTask(Template:Clone())
						v152.Icon.Image = v11.Image
						v152.ItemName.Text = v122
						v152.Name = v8.Name
						v152.Visible = true
						v152.Parent = Template.Parent
					end
				end
			end
			p1.Included.Visible = true
			p1.Items.Visible = true
			p1.ProductImage.Position = UDim2.fromScale(0.473, 0.37)
		else
			p1.Included.Visible = false
			p1.Items.Visible = false
			p1.ProductImage.Position = UDim2.fromScale(0.473, 0.46)
		end
		return v13
	end,
	Lootbox = function(p1, p2) --[[ Lootbox | Line: 835 | Upvalues: v9 (copy), v7 (copy), v47 (copy), v16 (copy), v25 (copy), v12 (copy), v5 (copy), v14 (copy), v3 (copy), v8 (copy), LocalPlayer (copy) ]]
		local v1 = v9.new()
		local ProductData = p2.ProductData
		if not ProductData.Items then
			return v1
		end
		local v2 = nil
		local v32 = 5
		local v4 = false
		for v52, v6 in ProductData.Items do
			local v72 = v7.GetByName(v52)
			if v72 and v72.ItemDropTable then
				v2 = v72.ItemDropTable
				v32 = v72.ItemPullAmount or 5
				v4 = v72.NoRepeatItems
				break
			end
		end
		if not v2 then
			return v1
		end
		local v82 = v47.CurrentSeed * 1500 + p2.ProductId
		local t = {}
		local t2 = {}
		for i = 1, math.max(5, v32) do
			local v92
			local v10 = v16.getRandomWeightedItem(v2, v82 + i)
			local v11 = nil
			if v10 and (typeof(v2) == "table" and typeof(v10) == "number") then
				v11 = v2[v10]
			elseif v10 and (typeof(v10) == "string" or typeof(v10) == "table") then
				v11 = v10
			end
			if v11 then
				if v4 then
					if t[typeof(v11) == "table" and v11.Name or v11] then
						local count = 0
						repeat
							local v13 = v16.getRandomWeightedItem(v2, v82 + i + count)
							if v13 and (typeof(v2) == "table" and typeof(v13) == "number") then
								v11 = v2[v13]
							elseif v13 then
								local v142 = v13
								if typeof(v142) == "string" or typeof(v142) == "table" then
									v11 = v142
								end
							end
							count = count + 1
							if not v11 then
								break
							end
							v92 = typeof(v11) == "table" and v11.Name or v11
						until not t[v92] or count >= 100
					end
					if v11 then
						t[typeof(v11) == "table" and v11.Name or v11] = true
					end
				end
				if v11 then
					t2[typeof(v11) == "table" and v11.Name or v11] = if typeof(v11) == "table" then v11.Amount or 1 else 1
				end
			end
		end
		local function createCarousel(p12, p2) --[[ createCarousel | Line: 909 | Upvalues: t2 (copy), v7 (ref), v1 (copy), v25 (ref), v12 (ref), v9 (ref), p1 (copy), v5 (ref) ]]
			if not p12 then
				return
			end
			local ImageLabel = p12:FindFirstChild("ImageLabel")
			if not ImageLabel or ImageLabel.Visible then
				return
			end
			local UIPageLayout = p12:FindFirstChildOfClass("UIPageLayout")
			if not UIPageLayout then
				return
			end
			for v13, v2 in t2 do
				local v3 = v7.GetByName(v13)
				if v3 then
					local v4 = ImageLabel:Clone()
					v4.Visible = true
					v4.Parent = p12
					v1:GiveTask(v25:Create({
						Viewport = v4:FindFirstChild("Viewport") or v4:FindFirstChild("Icon") or v4,
						Item = v3
					}))
					local AmountLabel = v4:FindFirstChild("AmountLabel")
					if AmountLabel then
						AmountLabel.Text = "x" .. v12.splice(v2)
						AmountLabel.Visible = true
					end
				end
			end
			local count = 0
			for v6 in t2 do
				count = count + 1
			end
			if count <= 1 then
				return
			end
			local v72 = p2 and count or 1
			local function nextPage() --[[ nextPage | Line: 949 | Upvalues: p2 (copy), v72 (ref), count (ref), UIPageLayout (copy) ]]
				if p2 then
					v72 = v72 - 1
					if v72 < 1 then
						v72 = count
					end
				else
					v72 = v72 % count + 1
				end
				UIPageLayout:JumpToIndex(v72)
			end
			local v8 = v9.new()
			v1:GiveTask(v8)
			local v92 = p1:FindFirstAncestorOfClass("Frame")
			if v92 and v5.getFrameFromInstance(v92) then
				local function screenStateChanged() --[[ screenStateChanged | Line: 966 | Upvalues: v5 (ref), v92 (copy), v8 (copy), p2 (copy), v72 (ref), count (ref), UIPageLayout (copy) ]]
					if v5.IsFrameOpen(v92) then
						v8:GiveTask(task.spawn(function() --[[ Line: 968 | Upvalues: p2 (ref), v72 (ref), count (ref), UIPageLayout (ref) ]]
							while true do
								task.wait(3)
								if p2 then
									v72 = v72 - 1
									if v72 < 1 then
										v72 = count
									end
								else
									v72 = v72 % count + 1
								end
								UIPageLayout:JumpToIndex(v72)
							end
						end))
					else
						v8:DoCleaning()
					end
				end
				v8:GiveTask(v92:GetPropertyChangedSignal("Visible"):Connect(screenStateChanged))
				screenStateChanged()
			else
				v8:GiveTask(task.spawn(function() --[[ Line: 982 | Upvalues: p2 (copy), v72 (ref), count (ref), UIPageLayout (copy) ]]
					while true do
						task.wait(3)
						if p2 then
							v72 = v72 - 1
							if v72 < 1 then
								v72 = count
							end
						else
							v72 = v72 % count + 1
						end
						UIPageLayout:JumpToIndex(v72)
					end
				end))
			end
		end
		createCarousel(p1:FindFirstChild("ItemCarouselTop"), false)
		createCarousel(p1:FindFirstChild("ItemCarouselBottom"), true)
		local v18 = nil
		for v19, v20 in ProductData.Items do
			v18 = v19
			break
		end
		p1.Title.Text = v14.separateWordsInString(v18)
		if v18 then
			local v21 = v7.GetByName(v18)
			if v21 then
				p1.LootBoxImage.Image = v21.Image
			end
		end
		v3.new(p1.BuyButton, {
			Click = function() --[[ Click | Line: 1011 | Upvalues: v8 (ref), LocalPlayer (ref), ProductData (copy) ]]
				v8.PromptPurchase(LocalPlayer, ProductData.OtherIds[1].Id, "Product")
			end
		})
		v3.new(p1["3xBuyButton"], {
			Click = function() --[[ Click | Line: 1016 | Upvalues: v8 (ref), LocalPlayer (ref), ProductData (copy) ]]
				v8.PromptPurchase(LocalPlayer, ProductData.OtherIds[2].Id, "Product")
			end
		})
		v3.new(p1["9xBuyButton"], {
			Click = function() --[[ Click | Line: 1021 | Upvalues: v8 (ref), LocalPlayer (ref), ProductData (copy) ]]
				v8.PromptPurchase(LocalPlayer, ProductData.OtherIds[3].Id, "Product")
			end
		})
		local PriceInRobux = v8.GetProductInfo(ProductData.OtherIds[1].Id, "Product").PriceInRobux
		local PriceInRobux_2 = v8.GetProductInfo(ProductData.OtherIds[2].Id, "Product").PriceInRobux
		local PriceInRobux_3 = v8.GetProductInfo(ProductData.OtherIds[3].Id, "Product").PriceInRobux
		p1.BuyButton.Top.TextLabel.Text = "\238\128\130" .. PriceInRobux
		p1["3xBuyButton"].Top.TextLabel.Text = "\238\128\130" .. PriceInRobux_2
		p1["9xBuyButton"].Top.TextLabel.Text = "\238\128\130" .. PriceInRobux_3
		p1.BuyButton.AmountLabel.Text = "x" .. ProductData.OtherIds[1].Amount
		p1["3xBuyButton"].AmountLabel.Text = "x" .. ProductData.OtherIds[2].Amount
		p1["9xBuyButton"].AmountLabel.Text = "x" .. ProductData.OtherIds[3].Amount
		return v1
	end
}
local function isProductEnabled(p1) --[[ isProductEnabled | Line: 1043 ]]
	return if typeof(p1) == "table" then p1.Enabled ~= false else true
end
local function getTabProducts(p1) --[[ getTabProducts | Line: 1048 | Upvalues: Sonar (copy), v11 (copy), BundleInfo (copy), v28 (copy), v33 (copy), v10 (copy), v35 (copy), v4 (copy), v8 (copy) ]]
	local t = {}
	if p1.Data then
		for v1, v2 in { p1.Data.ProductTypes, p1.Data.Products } do
			if typeof(v2) == "table" then
				local v3 = if v2 == p1.Data.ProductTypes then true else false
				local v42 = if v2 == p1.Data.Products then true else false
				for v7, v82 in v2 do
					local v5, v6
					local v9 = typeof(v82)
					local v102 = 100
					if if typeof(v82) == "table" then if v82.Enabled == false then false else true else true then
						local v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v282, v29, v30, v31, v32, v332
						if v42 then
							if v9 == "table" and typeof(v82.Type) == "string" then
								if v9 == "table" then
									v102 = v82.LayoutOrder or v102
									v5 = v82.Name
								else
									v5 = v82
								end
								if typeof(v5) == "string" then
									v12 = if v3 then v5 else v82.Type
									v13 = Sonar(v11.Get(v12))
									if v3 then
										v6 = v13
									else
										v14 = v13[v5]
										if not v14 and v12 == "BundleInfo" then
											v14 = BundleInfo[v5]
										end
										if v14 and (v12 == "BundleInfo" and (v14.DisplayCheck and v14.DisplayCheck.NotPurchased ~= nil)) then
											v15 = v28.PlayerData:FindFirstChild("PurchasedBundles")
											v16 = if v15 then v15:FindFirstChild(v5) else v15
											if v16 and v16.Value then
												v14 = nil
											end
										end
										v17 = v14 and { v14 } or {}
										v6 = v17
									end
									for v34, v352 in v6 do
										v18 = if typeof(v352) == "table" then if v352.Enabled == false then false else true else true
										if v18 then
											v19 = #t + 1
											for v36, v37 in t do
												if not (v102 < v37.LayoutOrder) then
													v19 = v36 + 1
												end
											end
											v20 = v352.CommerceId
											v21 = tonumber(v20)
											v22 = v352.ProductId
											v23 = tonumber(v22)
											v24 = v352.ProductType
											if v352.Name and not (v21 or v23) then
												v25 = v33[v352.Name] or BundleInfo[v352.Name]
												v26 = v25
												for v38, v39 in BundleInfo do
													if v26 then
														break
													end
													if v39.DisplayName == v352.Name then
														v26 = v39
													end
												end
											else
												v26 = nil
											end
											if v26 and not v23 then
												v27 = v26.ProductId
												v23 = tonumber(v27)
											end
											if v23 then
												v24 = "Product"
											end
											v282 = if typeof(v21) == "number" then true else false
											v29 = not v282 and (if typeof(v23) == "number" then true else false)
											v30 = if v29 and v24 == "Gamepass" then true elseif v24 == "Product" then true else false
											v31 = v30
											if v282 or v31 then
												v32 = v10.new(nil)
												v332 = false
												v35:subscribe(function(p1_2) --[[ Line: 1162 | Upvalues: v332 (ref), v282 (copy), v4 (ref), v352 (copy), v31 (ref), v8 (ref), v23 (ref), v24 (ref), v32 (copy) ]]
													if v332 then
														return
													end
													if not p1_2 then
														return
													end
													v332 = true
													local v1 = nil
													if v282 then
														v1 = v4.GetCommerceInfo((tostring(v352.CommerceId)))
													elseif v31 then
														v1 = v8.GetProductInfo(v23, v24)
													end
													v32:set(v1)
												end)
												table.insert(t, v19, {
													LayoutOrder = v102,
													ProductData = v352,
													ProductId = v21 or v23,
													ProductInfo = v32,
													ProductType = v12
												})
											end
										end
									end
								end
							end
						else
							if v9 == "table" then
								v102 = v82.LayoutOrder or v102
								v5 = v82.Name
							else
								v5 = v82
							end
							if typeof(v5) == "string" then
								v12 = if v3 then v5 else v82.Type
								v13 = Sonar(v11.Get(v12))
								if v3 then
									v6 = v13
								else
									v14 = v13[v5]
									if not v14 and v12 == "BundleInfo" then
										v14 = BundleInfo[v5]
									end
									if v14 and (v12 == "BundleInfo" and (v14.DisplayCheck and v14.DisplayCheck.NotPurchased ~= nil)) then
										v15 = v28.PlayerData:FindFirstChild("PurchasedBundles")
										v16 = if v15 then v15:FindFirstChild(v5) else v15
										if v16 and v16.Value then
											v14 = nil
										end
									end
									v17 = v14 and { v14 } or {}
									v6 = v17
								end
								for v34, v352 in v6 do
									v18 = if typeof(v352) == "table" then if v352.Enabled == false then false else true else true
									if v18 then
										v19 = #t + 1
										for v36, v37 in t do
											if not (v102 < v37.LayoutOrder) then
												v19 = v36 + 1
											end
										end
										v20 = v352.CommerceId
										v21 = tonumber(v20)
										v22 = v352.ProductId
										v23 = tonumber(v22)
										v24 = v352.ProductType
										if v352.Name and not (v21 or v23) then
											v25 = v33[v352.Name] or BundleInfo[v352.Name]
											v26 = v25
											for v38, v39 in BundleInfo do
												if v26 then
													break
												end
												if v39.DisplayName == v352.Name then
													v26 = v39
												end
											end
										else
											v26 = nil
										end
										if v26 and not v23 then
											v27 = v26.ProductId
											v23 = tonumber(v27)
										end
										if v23 then
											v24 = "Product"
										end
										v282 = if typeof(v21) == "number" then true else false
										v29 = not v282 and (if typeof(v23) == "number" then true else false)
										v30 = if v29 and v24 == "Gamepass" then true elseif v24 == "Product" then true else false
										v31 = v30
										if v282 or v31 then
											v32 = v10.new(nil)
											v332 = false
											v35:subscribe(function(p1_2) --[[ Line: 1162 | Upvalues: v332 (ref), v282 (copy), v4 (ref), v352 (copy), v31 (ref), v8 (ref), v23 (ref), v24 (ref), v32 (copy) ]]
												if v332 then
													return
												end
												if not p1_2 then
													return
												end
												v332 = true
												local v1 = nil
												if v282 then
													v1 = v4.GetCommerceInfo((tostring(v352.CommerceId)))
												elseif v31 then
													v1 = v8.GetProductInfo(v23, v24)
												end
												v32:set(v1)
											end)
											table.insert(t, v19, {
												LayoutOrder = v102,
												ProductData = v352,
												ProductId = v21 or v23,
												ProductInfo = v32,
												ProductType = v12
											})
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	local count = 0
	for v40, v41 in t do
		v41.LayoutOrder = count
		count = count + 1
	end
	return t
end
local function buildTabProduct(p1, p2) --[[ buildTabProduct | Line: 1208 | Upvalues: v9 (copy), ScrollingFrame (copy), t4 (copy), t5 (copy), t8 (copy), t6 (copy) ]]
	local v1 = v9.new()
	local v2 = ScrollingFrame[p1]
	local v4 = v2:FindFirstChild("Grid") or v2:FindFirstChild("Content") or v2
	local ProductType = p2.ProductType
	local v5 = nil
	if v4 == ScrollingFrame.Coins and ProductType == "Coins" or v4 == ScrollingFrame.ClubTokens and ProductType == "ClubTokens" then
		v5 = v4[p2.LayoutOrder + 1]
	else
		local v6 = t4[ProductType]
		if p1 == "Featured" or p1 == "Specials" then
			v6 = t5[ProductType]
		end
		if v6 then
			v5 = v1:GiveTask(v6:Clone())
		end
	end
	if v5 then
		local v7 = t8[t6[ProductType] or ProductType]
		if v7 then
			task.spawn(function() --[[ Line: 1241 | Upvalues: v7 (copy), v5 (ref), p2 (copy), v1 (copy) ]]
				local v12 = v7(v5, p2)
				if not v12 then
					return
				end
				v1:GiveTask(v12)
			end)
		end
		v5.Visible = true
		v5.Parent = v4
		if ProductType == "BundleInfo" and (p2.ProductData.DisplayCheck and p2.ProductData.DisplayCheck.NotPurchased ~= nil) then
			v5.Name = p2.ProductData.Name or "ProductName"
		end
	end
	return v1
end
local function buildTabProducts(p1) --[[ buildTabProducts | Line: 1261 | Upvalues: v9 (copy), v10 (copy), t7 (copy), buildTabProduct (copy) ]]
	local v1 = v9.new()
	local t = {}
	local t2 = {}
	for v2, v3 in p1.Products do
		local v4 = table.clone(v3)
		for v5, v6 in v4 do
			if typeof(v6) == "table" and getmetatable(v6) == v10 then
				v4[v5] = v3[v5]:derive(function(...) --[[ Line: 1283 ]]
					return ...
				end)
			end
		end
		table.insert(t, v4)
	end
	for v7, v8 in t7 do
		t2[v8.Data.LayoutOrder] = v8.Products
	end
	for v92, v102 in t do
		v1:GiveTask((buildTabProduct(p1.Name, v102)))
	end
	return v1
end
function t.Close() --[[ Close | Line: 1305 | Upvalues: v43 (copy), v5 (copy), v44 (copy), ContainerFrame (copy), v34 (copy) ]]
	v43:DoCleaning()
	v43:GiveTask(task.spawn(function() --[[ Line: 1308 | Upvalues: v5 (ref), v44 (ref) ]]
		v5.YieldForMainFrameClose()
		v44:set("Featured")
	end))
	if v5.IsFrameOpen(ContainerFrame) then
		v34:FireServer("ClosedMajorInterface", "RobuxShop")
	end
	v5.CloseMainFrame(ContainerFrame, {})
end
function t.Open(p1) --[[ Open | Line: 1321 | Upvalues: v35 (copy), v43 (copy), t7 (copy), v9 (copy), v44 (copy), v34 (copy), v5 (copy), ContainerFrame (copy) ]]
	v35:set(true)
	v43:DoCleaning()
	v43:GiveTask(task.spawn(function() --[[ Line: 1325 | Upvalues: t7 (ref), v9 (ref), v43 (ref) ]]
		for v1, v2 in t7 do
			local Run = v2.Run
			if typeof(Run) ~= "function" then
				break
			end
			local v3 = v9.new()
			local v4 = Run(v2)
			if v4 then
				v3:GiveTask(v4)
			end
			v43:GiveTask(v3)
		end
	end))
	task.delay(0.1, v44.set, v44, p1 or "Featured")
	v34:FireServer("AccessedMajorInterface", "RobuxShop")
	v5.OpenMainFrame(ContainerFrame, {})
end
function t._rebuildContent(p1) --[[ _rebuildContent | Line: 1352 | Upvalues: t3 (ref), v43 (copy), t7 (copy), v9 (copy) ]]
	t3 = {}
	v43:DoCleaning()
	v43:GiveTask(task.spawn(function() --[[ Line: 1355 | Upvalues: t7 (ref), v9 (ref), v43 (ref) ]]
		for v1, v2 in t7 do
			local Run = v2.Run
			if typeof(Run) == "function" then
				local v3 = v9.new()
				local v4 = Run(v2)
				if v4 then
					v3:GiveTask(v4)
				end
				v43:GiveTask(v3)
			end
		end
	end))
end
function t._setupGui(p1) --[[ _setupGui | Line: 1376 | Upvalues: TabFrames (copy), ScrollingFrame (copy), PremiumShopData (copy), v44 (copy), v42 (copy), TweenService (copy), v36 (copy), v2 (copy), v37 (copy), v39 (copy), v38 (copy), v40 (copy), v10 (copy), v6 (copy), v3 (copy), Menu (copy), t (copy), v5 (copy), ContainerFrame (copy) ]]
	for v1, v22 in { TabFrames, ScrollingFrame } do
		for v32, v4 in v22:GetChildren() do
			if v4:IsA("GuiObject") then
				local v52 = PremiumShopData[v4.Name]
				local v62 = 1000000
				if v52 then
					v62 = tonumber(v52.LayoutOrder) or v62
				end
				v4.LayoutOrder = v62
			end
		end
	end
	for v8, v9 in TabFrames:GetChildren() do
		if v9:IsA("GuiButton") then
			v9.Activated:Connect(function() --[[ Line: 1403 | Upvalues: v44 (ref), v9 (copy) ]]
				v44:set(v9.Name)
			end)
		end
	end
	v42:subscribe(function(p1, p2) --[[ Line: 1408 | Upvalues: TweenService (ref), ScrollingFrame (ref), v36 (ref) ]]
		p2:add(TweenService:Create(ScrollingFrame, v36, {
			CanvasPosition = p1
		})):Play()
	end)
	v44:subscribe(function(p1, p2) --[[ Line: 1414 | Upvalues: ScrollingFrame (ref), v42 (ref) ]]
		if p1 then
			v42:set(ScrollingFrame.CanvasPosition + Vector2.yAxis * (ScrollingFrame[p1].AbsolutePosition.Y - ScrollingFrame.AbsolutePosition.Y))
		end
	end)
	v44:subscribe(function(p1, p2) --[[ Line: 1430 | Upvalues: TabFrames (ref), v2 (ref), v37 (ref), v39 (ref), v38 (ref), v40 (ref), v10 (ref) ]]
		for v1, v22 in TabFrames:GetChildren() do
			if v22:IsA("GuiButton") then
				local v3 = if v22.Name == p1 then true else false
				local t = {}
				t.Position = UDim2.fromScale(0.5, if v3 then 0.1 else 0)
				v2.target(v22.Top, 0.8, 4, t)
				if v22.Name ~= "Featured" and v22.Name ~= "Specials" then
					local v9 = if v3 then v38 else v40
					local Keypoints = v22.Top.UIGradient.Color.Keypoints
					if v9 ~= Keypoints then
						local t2 = {}
						local t3 = {}
						for v102, v11 in Keypoints do
							local v12 = p2:add(v10.new(v11.Value))
							table.insert(t2, v12)
							t3[v11.Time] = v12
						end
						p2:add(v10.subscribeMulti(t2, function() --[[ Line: 1462 | Upvalues: t3 (copy), v22 (copy) ]]
							local t = {}
							for v1, v2 in t3 do
								local v3 = v2:get()
								table.insert(t, ColorSequenceKeypoint.new(v1, v3))
							end
							table.sort(t, function(p1, p2) --[[ Line: 1471 ]]
								return p1.Time < p2.Time
							end)
							v22.Top.UIGradient.Color = ColorSequence.new(t)
						end))
						for v13, v14 in t3 do
							local v15 = v13 * 1000 // 1
							local v16 = nil
							for v17, v18 in v9.Keypoints do
								if v15 == v18.Time * 1000 // 1 then
									v16 = v18
									break
								end
							end
							v2.targetState(v14, 0.8, 4, v16.Value)
						end
					end
					v2.target(v22.Shadow, 0.8, 4, {
						BackgroundColor3 = if v3 then v37 else v39
					})
				end
			end
		end
	end)
	for v102, v11 in ScrollingFrame:GetChildren() do
		if v11:IsA("GuiObject") then
			local Grid = v11:FindFirstChild("Grid")
			if Grid and (Grid:IsA("GuiObject") and not Grid:IsA("ScrollingFrame")) then
				local v12 = Grid:FindFirstChildWhichIsA("UIGridStyleLayout")
				if v12 then
					local v13 = Grid:FindFirstChildWhichIsA("UIPadding")
					local v14 = if v13 then v13.PaddingBottom.Offset or 5 else 5
					local function updateGridSize() --[[ updateGridSize | Line: 1527 | Upvalues: Grid (copy), v12 (copy), v14 (copy) ]]
						local X = Grid.Size.X
						Grid.Size = UDim2.new(X.Scale, X.Offset, 0, v12.AbsoluteContentSize.Y + v14)
					end
					v12:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateGridSize)
					Grid:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateGridSize)
					local X = Grid.Size.X
					Grid.Size = UDim2.new(X.Scale, X.Offset, 0, v12.AbsoluteContentSize.Y + v14)
				end
			end
		end
	end
	local v15 = ScrollingFrame:FindFirstChildWhichIsA("UIGridStyleLayout")
	if not v15 then
		v3.new(Menu.CloseButton, {
			Click = t.Close
		})
		v5.AddFrame(ContainerFrame, {})
		return
	end
	v6.manageCanvasSize(v15, ScrollingFrame, {
		y = true
	})
	v3.new(Menu.CloseButton, {
		Click = t.Close
	})
	v5.AddFrame(ContainerFrame, {})
end
function t._setupTabs(p1) --[[ _setupTabs | Line: 1557 | Upvalues: t7 (copy), PremiumShopData (copy), getTabProducts (copy) ]]
	for v1, v2 in t7 do
		v2.Data = PremiumShopData[v1]
		v2.Products = getTabProducts(v2)
	end
	for v3, v4 in t7 do
		local Setup = v4.Setup
		if typeof(Setup) == "function" then
			Setup(v4)
		end
	end
end
function t.Init(p1) --[[ Init | Line: 1575 | Upvalues: PremiumShopData (copy), t7 (copy), buildTabProducts (copy), v47 (copy), PremiumShopGui (copy), v15 (copy), v28 (copy), ScrollingFrame (copy), v23 (copy), t (copy) ]]
	for v1 in PremiumShopData do
		local v2 = t7[v1]
		local v4 = if v2 then v2 else {}
		for v5, v6 in {
			Name = v1,
			Run = buildTabProducts
		} do
			v4[v5] = v4[v5] or v6
		end
		t7[v1] = v4
	end
	p1:_setupGui()
	p1:_setupTabs()
	v47.TimeChanged:Connect(function() --[[ Line: 1597 | Upvalues: PremiumShopGui (ref), v15 (ref), v47 (ref) ]]
		PremiumShopGui.ContainerFrame.Menu.TimerLabel.Text = string.format("Resets in %s", v15.FormatTimeWithoutLeadingZeros(v47:GetTime()))
	end)
	v47.SeedChanged:Connect(function() --[[ Line: 1602 | Upvalues: p1 (copy) ]]
		p1:_rebuildContent()
	end)
	task.spawn(function() --[[ Line: 1606 | Upvalues: v28 (ref), ScrollingFrame (ref) ]]
		local v1 = v28.PlayerData:FindFirstChild("PurchasedBundles") or v28.PlayerData:WaitForChild("PurchasedBundles", 10)
		if not v1 then
			return
		end
		v1.ChildAdded:Connect(function(p1) --[[ Line: 1610 | Upvalues: ScrollingFrame (ref) ]]
			local v1 = p1.Name
			for v2, v3 in ScrollingFrame:GetChildren() do
				if v3:IsA("GuiObject") then
					for v5, v6 in (v3:FindFirstChild("Grid") or (v3:FindFirstChild("Content") or v3)):GetChildren() do
						if v6:IsA("GuiObject") and v6.Name == v1 then
							v6.Visible = false
						end
					end
				end
			end
		end)
	end)
	v23.CreateCustomButton({
		Promote = true,
		RotateProductTypeImages = true,
		ProductType = "MerchBundles",
		LayoutOrder = 9000000,
		Name = "MERCH",
		Image = 104397150609965,
		Tab = "Merch",
		onClick = function() --[[ onClick | Line: 1638 | Upvalues: t (ref) ]]
			t.Open("Merch")
		end
	})
	v23.OpenBundleSignal:Connect(t.Open)
end
t:Init()
return t