-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("GuiManager")
local v3 = Sonar("Maid")
local v4 = Sonar("Button")
local v5 = Sonar("GridSort")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("ItemGridButton")
local v8 = Sonar("GuiUtils")
local v9 = Sonar("ItemInfoFrame")
local v10 = Sonar("ShopService")
local v11 = Sonar("UINavigator")
local v12 = Sonar("PromptClient")
local v13 = Sonar("IssueResponseClient")
local v14 = Sonar("FormatNumber")
local v15 = Sonar("MarketplaceUtils")
local v16 = Sonar("InventoryGui")
local v17 = Sonar("PremiumShopGui")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v18 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local BuildGui = PlayerGui:WaitForChild("BuildGui")
local ShopFrame = BuildGui:WaitForChild("ShopFrame")
local v19 = v3.new()
local v20 = v3.new()
local v21 = v3.new()
local v22 = v5.new({
	Filters = {
		All = true
	},
	EmptyString = {
		Text = "No items in the shop!",
		Label = ShopFrame.Menu.Content.Items.EmptyLabel
	},
	Sorts = {
		ByPrice = {
			Run = function(p1, p2) --[[ Run | Line: 75 ]]
				if p1.ProductId and not p2.ProductId then
					return true
				end
				if not p1.ProductId and p2.ProductId then
					return false
				end
				if p1.ProductId and p2.ProductId then
					return p1.ProductId < p2.ProductId
				else
					return p1.Price < p2.Price
				end
			end
		}
	},
	Search = {
		TextBox = ShopFrame.Menu.Content.SearchBar.Content.TextBox,
		Run = function(p1, p2) --[[ Run | Line: 93 ]]
			return if #p1 <= 0 then true else string.find(p2.NameLabel.Text:lower(), p1:lower())
		end
	}
})
local t = {}
local t2 = {}
local v23 = nil
local t3 = {}
for k, v in pairs({
	Food = { "Food" },
	Gear = { "Tools" },
	Resources = { "Resources", "Miscellaneous" },
	Potions = { "Potions" }
}) do
	v22:AddFilter(k, function(p1) --[[ Line: 99 | Upvalues: v (copy) ]]
		return table.find(v, p1.Item.ItemType)
	end)
end
local t4 = {
	Buy = function() --[[ Buy | Line: 105 | Upvalues: v10 (copy), v18 (copy), v23 (ref), v16 (copy), v17 (copy), v13 (copy), v15 (copy), LocalPlayer (copy) ]]
		local v1, v2 = v10.CanPurchaseItem(v18, v23.Name, "Building", 1)
		if v1 == true then
			if type(v2) == "table" and v2.ProductId then
				v15.PromptPurchase(LocalPlayer, v2.ProductId, "Product")
			else
				v10:PurchaseBuildingItem(v23.Name, 1)
			end
		else
			if v1 == "MaxInventory" then
				v16.UpgradeSlots()
			else
				v17.Open("Coins")
			end
			v13.NotifyIssue(v1)
		end
	end,
	Bulk = function() --[[ Bulk | Line: 128 | Upvalues: v12 (copy), v10 (copy), v23 (ref), v14 (copy), v13 (copy), v18 (copy), v16 (copy), v17 (copy), v15 (copy), LocalPlayer (copy) ]]
		local v1 = nil
		v12.Prompt({
			Type = "MultiBuy",
			Setup = function(p1) --[[ Setup | Line: 133 | Upvalues: v10 (ref), v23 (ref), v1 (ref), v14 (ref) ]]
				p1.Content.IntValue.Visible = true
				p1.Content.IndexedValue.Visible = false
				local v12 = v10.GetPriceForItem(v23.Name, "Building")
				v1 = p1.Content.IntValue.InputFrame.Content.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 138 | Upvalues: p1 (copy), v14 (ref), v12 (copy) ]]
					if not (#tostring(p1.Content.IntValue.InputFrame.Content.TextBox.Text) > 0) then
						return
					end
					p1.Content.IntValue.InputFrame.Content.TextBox.Text = v14.SanitiseInput((tonumber(p1.Content.IntValue.InputFrame.Content.TextBox.Text)))
					p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: " .. v12 * p1.Content.IntValue.InputFrame.Content.TextBox.Text
				end)
			end,
			Run = function(p1) --[[ Run | Line: 145 | Upvalues: v14 (ref), v13 (ref), v10 (ref), v18 (ref), v23 (ref), v16 (ref), v17 (ref), v15 (ref), LocalPlayer (ref), v1 (ref) ]]
				local v12 = if #tostring(p1.Content.IntValue.InputFrame.Content.TextBox.Text) > 0 then v14.SanitiseInput((tonumber(p1.Content.IntValue.InputFrame.Content.TextBox.Text))) else 1
				if v12 <= 0 then
					v13.NotifyIssue("InvalidAmount")
					return
				end
				local v3, v4 = v10.CanPurchaseItem(v18, v23.Name, "Building", v12)
				if v3 == true then
					if type(v4) == "table" and v4.ProductId then
						v15.PromptPurchase(LocalPlayer, v4.ProductId, "Product")
					else
						v10:PurchaseBuildingItem(v23.Name, v12)
					end
					v1:Disconnect()
					p1.Content.IntValue.InputFrame.Content.TextBox.Text = ""
					p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: 0"
					return true
				end
				if v3 == "MaxInventory" then
					v16.UpgradeSlots()
				else
					v17.Open("Coins")
				end
				v13.NotifyIssue(v3)
			end,
			Cancel = function(p1) --[[ Cancel | Line: 184 | Upvalues: v1 (ref) ]]
				p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: 0"
				v1:Disconnect()
				return true
			end
		})
	end
}
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 193 | Upvalues: ShopFrame (copy) ]]
	if p1 then
		ShopFrame.Menu.Content.Info.Content.Visible = true
		ShopFrame.Menu.Content.Info.NotSelected.Visible = false
	else
		ShopFrame.Menu.Content.Info.Content.Visible = false
		ShopFrame.Menu.Content.Info.NotSelected.Visible = true
	end
end
local function selectItem(p1) --[[ selectItem | Line: 203 | Upvalues: t (copy), v23 (ref), v20 (copy), v10 (copy), v9 (copy), v18 (copy), ShopFrame (copy) ]]
	local v1 = t[v23]
	if v1 then
		v1:Deselect()
	end
	v20:DoCleaning()
	v23 = p1
	if not p1 then
		ShopFrame.Menu.Content.Info.Content.Visible = false
		ShopFrame.Menu.Content.Info.NotSelected.Visible = true
		return
	end
	local v2 = t[p1]
	if v2 then
		v2:Select()
	end
	local v3 = v10.GetPriceForItem(p1.Name, "Building")
	local t2 = {
		Item = p1,
		DataValue = v18:GetItemValue(p1.Name),
		Frame = ShopFrame.Menu.Content.Info.Content
	}
	t2.Price = if type(v3) == "number" then v3 else false
	t2.ProductId = if type(v3) == "table" then v3.ProductId else false
	v20:GiveTask(v9.new(t2))
	ShopFrame.Menu.Content.Info.Content.Buttons.Bulk.Visible = type(v3) == "number"
	ShopFrame.Menu.Content.Info.Content.Visible = true
	ShopFrame.Menu.Content.Info.NotSelected.Visible = false
end
local function createItem(p1, p2) --[[ createItem | Line: 235 | Upvalues: v6 (copy), v7 (copy), v18 (copy), ShopFrame (copy), v4 (copy), Sonar (copy), selectItem (copy), t (copy), v19 (copy), v22 (copy) ]]
	local v1 = v6.GetByName(p1)
	local t2 = {
		Item = v1,
		DataValue = v18:GetItemValue(p1),
		ParentFrame = ShopFrame.Menu.Content.Items
	}
	t2.Price = if type(p2) == "number" then p2 else false
	t2.ProductId = if type(p2) == "table" then p2.ProductId else false
	local v5 = v7.new(t2)
	v5:GiveTask(v4.new(v5.Frame, {
		Click = function() --[[ Click | Line: 247 | Upvalues: v5 (copy), Sonar (ref), selectItem (ref), v1 (copy) ]]
			if v5.Frame.Locked.Visible then
				Sonar("NotificationsClient").Notify({
					Message = "Select the Torn Lasso and purchase one!",
					Type = "SelectTutorial"
				})
			else
				selectItem(v1)
			end
		end
	}))
	t[v1] = v5
	v19:GiveTask(function() --[[ Line: 260 | Upvalues: v22 (ref), v5 (copy) ]]
		v22:Remove(v5)
	end)
	v19:GiveTask(v5)
	v22:Add(v5, not v5.ProductId)
end
local function setStorageCapacityLabel() --[[ setStorageCapacityLabel | Line: 267 | Upvalues: v18 (copy), ShopFrame (copy), v14 (copy), PlayerGui (copy) ]]
	pcall(function() --[[ Line: 268 | Upvalues: v18 (ref), ShopFrame (ref), v14 (ref), PlayerGui (ref) ]]
		local v1 = v18:GetItemLimit("Inventory")
		local v2 = v1.Get()
		local v3 = v1.GetLimit()
		ShopFrame.Menu.Content.InventoryCapacity.Content.TextLabel.Text = v14.suffix(v2) .. "/" .. v14.suffix(v3)
		ShopFrame.Menu.Content.MaxWarning.Visible = v3 <= v2
		local v5 = if v3 <= v2 then "rbxassetid://17588467754" else "rbxassetid://16550455022"
		for k2, v in pairs(PlayerGui.HUDGui.RightFrame:GetChildren()) do
			local Inventory = v:FindFirstChild("Inventory", true)
			if Inventory then
				Inventory.Color.Menu:FindFirstChild("Icon", true).Image = v5
			end
		end
		local Inventory = PlayerGui.HUDGui.MobileRightFrame.Core.Buttons:FindFirstChild("Inventory")
		if not Inventory then
			return
		end
		Inventory.Color.Menu:FindFirstChild("Icon", true).Image = v5
	end)
end
function t2.OnOpen(p1) --[[ OnOpen | Line: 296 | Upvalues: v2 (copy), ShopFrame (copy), t3 (copy), v1 (copy), t4 (copy), v8 (copy), v22 (copy), v16 (copy), v18 (copy), setStorageCapacityLabel (copy), v14 (copy), PlayerGui (copy), v17 (copy), v10 (copy), createItem (copy), selectItem (copy) ]]
	local v12 = v2.getFrameFromInstance(ShopFrame)
	if not v12.Opened then
		v12.Opened = true
		for k, v in pairs(ShopFrame.Menu.Content.Info.Content.Buttons:GetChildren()) do
			if v:IsA("ImageButton") then
				if not t3[v.Name] then
					t3[v.Name] = {}
				end
				table.insert(t3[v.Name], v)
				v1.new(v, {
					Click = t4[v.Name]
				})
			end
		end
		for k, v in pairs(ShopFrame.Menu.Content.SortButtons:GetChildren()) do
			if v:IsA("ImageButton") then
				local function setSortButton() --[[ setSortButton | Line: 319 | Upvalues: v8 (ref), v (copy), v22 (ref) ]]
					v8.SetButtonColor(v, "Diagonal", if v.Name == v22.FilterType then "Green" else "Blue")
				end
				v22.FilterChangedSignal:Connect(setSortButton)
				local SetButtonColor = v8.SetButtonColor
				local v4 = if v.Name == v22.FilterType then "Green" else "Blue"
				SetButtonColor(v, "Diagonal", v4)
				v1.new(v, {
					Click = function() --[[ Click | Line: 326 | Upvalues: v22 (ref), v (copy) ]]
						v22:Filter(v.Name)
					end
				})
			end
		end
		v1.new(ShopFrame.Menu.Content.InventoryCapacity.Button, {
			Click = v16.UpgradeSlots
		})
		v18.InventoryItemsChangedSignal:Connect(setStorageCapacityLabel)
		v18.MaxInventoryChangedSignal:Connect(setStorageCapacityLabel)
		pcall(function() --[[ Line: 268 | Upvalues: v18 (ref), ShopFrame (ref), v14 (ref), PlayerGui (ref) ]]
			local v1 = v18:GetItemLimit("Inventory")
			local v2 = v1.Get()
			local v3 = v1.GetLimit()
			ShopFrame.Menu.Content.InventoryCapacity.Content.TextLabel.Text = v14.suffix(v2) .. "/" .. v14.suffix(v3)
			ShopFrame.Menu.Content.MaxWarning.Visible = v3 <= v2
			local v5 = if v3 <= v2 then "rbxassetid://17588467754" else "rbxassetid://16550455022"
			for k2, v in pairs(PlayerGui.HUDGui.RightFrame:GetChildren()) do
				local Inventory = v:FindFirstChild("Inventory", true)
				if Inventory then
					Inventory.Color.Menu:FindFirstChild("Icon", true).Image = v5
				end
			end
			local Inventory = PlayerGui.HUDGui.MobileRightFrame.Core.Buttons:FindFirstChild("Inventory")
			if not Inventory then
				return
			end
			Inventory.Color.Menu:FindFirstChild("Icon", true).Image = v5
		end)
		v8.CreateCurrencyLabel({
			GuiObject = ShopFrame.Menu.Content.Coins.Content.TextLabel,
			Value = v18:GetCurrencyValue("Coins"),
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 343 ]] end
		})
		v1.new(ShopFrame.Menu.Content.Coins.PurchaseButton, {
			Click = function() --[[ Click | Line: 348 | Upvalues: v17 (ref) ]]
				v17.Open("Coins")
			end
		})
		v8.CreateCurrencyLabel({
			GuiObject = PlayerGui:WaitForChild("PromptGui").PromptFrame.PromptFrames.MultiBuy.Content.IntValue.Coins.Content.TextLabel,
			Value = v18:GetCurrencyValue("Coins"),
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 356 ]] end
		})
	end
	if v12.ContentsLoaded then
		return
	end
	v12.ContentsLoaded = true
	for k, v in pairs(v10.GetItems("Building")) do
		task.spawn(createItem, k, v)
	end
	v22:Sort(v22.SortType or "ByPrice")
	v22:Filter("All")
	selectItem()
end
function t2.Cleanup(p1) --[[ Cleanup | Line: 376 | Upvalues: selectItem (copy), v19 (copy), v2 (copy), ShopFrame (copy) ]]
	selectItem()
	v19:DoCleaning()
	v2.CleanContents(ShopFrame)
end
function t2.Open(...) --[[ Open | Line: 383 | Upvalues: v2 (copy), ShopFrame (copy), t2 (copy) ]]
	if v2.IsFrameOpen(ShopFrame) then
		t2.Close()
	else
		t2.FlashTweenButtons(false)
		v2.OpenFrame(ShopFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	end
end
function t2.Close() --[[ Close | Line: 397 | Upvalues: v2 (copy), ShopFrame (copy) ]]
	v2.CloseFrame(ShopFrame, {})
end
function t2.FlashTweenButtons(p1) --[[ FlashTweenButtons | Line: 403 | Upvalues: v21 (copy), t2 (copy), BuildGui (copy) ]]
	if not p1 then
		v21:DoCleaning()
		t2.__tweenFlashing = false
		return
	end
	if t2.__lastFlashTween and tick() - t2.__lastFlashTween < 2 then
		return
	end
	if t2.__tweenFlashing then
		return
	end
	t2.__tweenFlashing = true
	t2.__lastFlashTween = tick()
	for k, v in pairs(BuildGui.TopFrame:GetChildren()) do
		local ShopButton = v.ShopButton
		local v1 = game:GetService("TweenService"):Create(ShopButton.UIScale, TweenInfo.new(0.45, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 9000000000, true), {
			Scale = ShopButton.UIScale.Scale * 1.2
		})
		ShopButton.UIStroke.Enabled = true
		v21:GiveTask(game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 426 | Upvalues: ShopButton (copy) ]]
			ShopButton.UIStroke.UIGradient.Rotation = ShopButton.UIStroke.UIGradient.Rotation + 1
			if not (ShopButton.UIStroke.UIGradient.Rotation >= 180) then
				return
			end
			ShopButton.UIStroke.UIGradient.Rotation = -180
		end))
		v21:GiveTask(function() --[[ Line: 434 | Upvalues: v1 (copy), ShopButton (copy) ]]
			v1:Cancel()
			ShopButton.UIScale.Scale = 1
			ShopButton.UIStroke.Enabled = false
		end)
		v1:Play()
		task.delay(3, function() --[[ Line: 442 | Upvalues: t2 (ref) ]]
			t2.FlashTweenButtons(false)
		end)
	end
end
function t2.Init(p1) --[[ Init | Line: 449 | Upvalues: v2 (copy), ShopFrame (copy), v11 (copy), v1 (copy), t2 (copy), Sonar (copy) ]]
	v2.AddFrame(ShopFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ShopFrame.Position,
		ClosePosition = ShopFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = ShopFrame.Menu.Content.Items.Content
	})
	v11.SetUnselectableWhenSelected(ShopFrame.Menu.Content.Items.Content)
	v1.new(ShopFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 463 | Upvalues: t2 (ref) ]]
			t2.Close()
		end
	})
	v1.new(ShopFrame.Menu.HelpButton, {
		Click = function() --[[ Click | Line: 468 | Upvalues: Sonar (ref) ]]
			Sonar("TutorialService").PromptPopupInfo("BuildShop")
		end
	})
	v2.AddStateCallback(ShopFrame, "OnOpen", function() --[[ Line: 473 | Upvalues: t2 (ref) ]]
		t2:OnOpen()
	end)
	v2.AddStateCallback(ShopFrame, "OnCleanup", function() --[[ Line: 477 | Upvalues: t2 (ref) ]]
		t2:Cleanup()
	end)
end
t2:Init()
return t2