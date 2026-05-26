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
local v11 = Sonar("PremiumShopGui")
local v12 = Sonar("UINavigator")
local v13 = Sonar("PromptClient")
local v14 = Sonar("IssueResponseClient")
local v15 = Sonar("FormatNumber")
local v16 = Sonar("MarketplaceUtils")
local v17 = Sonar("InventoryGui")
local v18 = Sonar("TutorialService")
local v19 = Sonar("RemoteUtils")
Sonar("Constants")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v20 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local ContainerFrame = PlayerGui:WaitForChild("ShopGui").ContainerFrame
local v21 = v19.GetUnreliableRemoteEvent("ReportClientAnalyticsRemote")
local v22 = v3.new()
local v23 = v3.new()
local v24 = v5.new({
	Filters = {
		All = true
	},
	EmptyString = {
		Text = "No items in the shop!",
		Label = ContainerFrame.Menu.Content.Items.EmptyLabel
	},
	Sorts = {
		ByPrice = {
			Run = function(p1, p2) --[[ Run | Line: 80 ]]
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
		TextBox = ContainerFrame.Menu.Content.SearchBar.Content.TextBox,
		Run = function(p1, p2) --[[ Run | Line: 99 ]]
			return if #p1 <= 0 then true else string.find(p2.NameLabel.Text:lower(), p1:lower())
		end
	}
})
local t = {}
local t2 = {}
local t3 = {}
local v25 = nil
for k, v in pairs({
	Food = { "Food" },
	Gear = { "Tools" },
	Resources = { "Resources", "Miscellaneous" },
	Potions = { "Potions" }
}) do
	v24:AddFilter(k, function(p1) --[[ Line: 105 | Upvalues: v (copy) ]]
		return table.find(v, p1.Item.ItemType)
	end)
end
local t4 = {
	Buy = function() --[[ Buy | Line: 111 | Upvalues: v10 (copy), v20 (copy), v25 (ref), v17 (copy), v11 (copy), v14 (copy), v16 (copy), LocalPlayer (copy) ]]
		local v1, v2 = v10.CanPurchaseItem(v20, v25.Name, nil, 1)
		if v1 == true then
			if type(v2) == "table" and v2.ProductId then
				v16.PromptPurchase(LocalPlayer, v2.ProductId, "Product")
			else
				v10:PurchaseItem(v25.Name, 1)
			end
		else
			if v1 == "MaxInventory" then
				v17.UpgradeSlots()
			else
				v11.Open("Coins")
			end
			v14.NotifyIssue(v1)
		end
	end,
	Bulk = function() --[[ Bulk | Line: 134 | Upvalues: v13 (copy), v10 (copy), v25 (ref), v15 (copy), v20 (copy), v17 (copy), v11 (copy), v14 (copy), v16 (copy), LocalPlayer (copy) ]]
		v13.Prompt({
			Type = "MultiBuy",
			Setup = function(p1, p2) --[[ Setup | Line: 137 | Upvalues: v10 (ref), v25 (ref), v15 (ref) ]]
				p1.Content.IntValue.Visible = true
				p1.Content.IndexedValue.Visible = false
				local v1 = v10.GetPriceForItem(v25.Name)
				local v2 = p1.Content.IntValue.InputFrame.Content.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 142 | Upvalues: p1 (copy), v15 (ref), v1 (copy) ]]
					if not (#tostring(p1.Content.IntValue.InputFrame.Content.TextBox.Text) > 0) then
						return
					end
					p1.Content.IntValue.InputFrame.Content.TextBox.Text = v15.SanitiseInput((tonumber(p1.Content.IntValue.InputFrame.Content.TextBox.Text)))
					p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: " .. v1 * p1.Content.IntValue.InputFrame.Content.TextBox.Text
				end)
				if not (p2 and p2.Maid) then
					return
				end
				p2.Maid:GiveTask(v2)
			end,
			Run = function(p1) --[[ Run | Line: 152 | Upvalues: v10 (ref), v20 (ref), v25 (ref), v17 (ref), v11 (ref), v14 (ref), v16 (ref), LocalPlayer (ref) ]]
				local v1 = if #tostring(p1.Content.IntValue.InputFrame.Content.TextBox.Text) > 0 then tonumber(p1.Content.IntValue.InputFrame.Content.TextBox.Text) else 1
				local v3, v4 = v10.CanPurchaseItem(v20, v25.Name, nil, v1)
				if v3 == true then
					if type(v4) == "table" and v4.ProductId then
						v16.PromptPurchase(LocalPlayer, v4.ProductId, "Product")
					else
						v10:PurchaseItem(v25.Name, v1)
					end
					p1.Content.IntValue.InputFrame.Content.TextBox.Text = ""
					p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: 0"
					return true
				end
				if v3 == "MaxInventory" then
					v17.UpgradeSlots()
				else
					v11.Open("Coins")
				end
				v14.NotifyIssue(v3)
			end,
			Cancel = function(p1) --[[ Cancel | Line: 185 ]]
				p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: 0"
				return true
			end
		})
	end
}
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 215 | Upvalues: ContainerFrame (copy) ]]
	if p1 then
		ContainerFrame.Menu.Content.Info.Content.Visible = true
		ContainerFrame.Menu.Content.Info.NotSelected.Visible = false
	else
		ContainerFrame.Menu.Content.Info.Content.Visible = false
		ContainerFrame.Menu.Content.Info.NotSelected.Visible = true
	end
end
local function selectItem(p1) --[[ selectItem | Line: 225 | Upvalues: t3 (ref), v25 (ref), v23 (copy), v10 (copy), v9 (copy), v20 (copy), ContainerFrame (copy) ]]
	local v1 = t3[v25]
	if v1 then
		v1:Deselect()
	end
	v23:DoCleaning()
	v25 = p1
	if not p1 then
		ContainerFrame.Menu.Content.Info.Content.Visible = false
		ContainerFrame.Menu.Content.Info.NotSelected.Visible = true
		return
	end
	local v2 = t3[p1]
	if v2 then
		v2:Select()
	end
	local v3 = v10.GetPriceForItem(p1.Name)
	local t = {
		Item = p1,
		DataValue = v20:GetItemValue(p1.Name),
		Frame = ContainerFrame.Menu.Content.Info.Content
	}
	t.Price = if type(v3) == "number" then v3 else false
	t.ProductId = if type(v3) == "table" then v3.ProductId else false
	v23:GiveTask(v9.new(t))
	ContainerFrame.Menu.Content.Info.Content.Buttons.Bulk.Visible = type(v3) == "number"
	ContainerFrame.Menu.Content.Info.Content.Visible = true
	ContainerFrame.Menu.Content.Info.NotSelected.Visible = false
end
local function createItem(p1, p2) --[[ createItem | Line: 257 | Upvalues: v6 (copy), v7 (copy), v20 (copy), ContainerFrame (copy), v4 (copy), Sonar (copy), selectItem (copy), t3 (ref), v22 (copy), v24 (copy) ]]
	local v1 = v6.GetByName(p1)
	if not v1 then
		return
	end
	local t = {
		GuiSource = "Shop",
		Item = v1,
		DataValue = v20:GetItemValue(p1),
		ParentFrame = ContainerFrame.Menu.Content.Items
	}
	t.Price = if type(p2) == "number" then p2 else false
	t.ProductId = if type(p2) == "table" then p2.ProductId else false
	local v5 = v7.new(t)
	v5:GiveTask(v4.new(v5.Frame, {
		Click = function() --[[ Click | Line: 272 | Upvalues: v5 (copy), Sonar (ref), selectItem (ref), v1 (copy) ]]
			if v5.Frame:WaitForChild("Locked").Visible then
				Sonar("NotificationsClient").Notify({
					Message = "Select the Torn Lasso and purchase one!",
					Type = "SelectTutorial"
				})
			else
				selectItem(v1)
			end
		end
	}))
	t3[v1] = v5
	v22:GiveTask(function() --[[ Line: 285 | Upvalues: v24 (ref), v5 (copy) ]]
		v24:Remove(v5)
	end)
	v22:GiveTask(v5)
	v24:Add(v5, true)
	v5.Frame:WaitForChild("Locked").Visible = false
end
function t.OnOpen(p1) --[[ OnOpen | Line: 294 | Upvalues: v2 (copy), ContainerFrame (copy), t2 (copy), v1 (copy), t4 (copy), v8 (copy), v24 (copy), v20 (copy), v11 (copy), v10 (copy), createItem (copy), selectItem (copy) ]]
	local v12 = v2.getFrameFromInstance(ContainerFrame)
	if not v12.Opened then
		v12.Opened = true
		for k, v in pairs(ContainerFrame.Menu.Content.Info.Content.Buttons:GetChildren()) do
			if v:IsA("ImageButton") then
				if not t2[v.Name] then
					t2[v.Name] = {}
				end
				table.insert(t2[v.Name], v)
				v1.new(v, {
					Click = t4[v.Name]
				})
			end
		end
		for k, v in pairs(ContainerFrame.Menu.Content.SortButtons:GetChildren()) do
			if v:IsA("ImageButton") then
				local function setSortButton() --[[ setSortButton | Line: 317 | Upvalues: v8 (ref), v (copy), v24 (ref) ]]
					v8.SetButtonColor(v, "Diagonal", if v.Name == v24.FilterType then "Green" else "Blue")
				end
				v24.FilterChangedSignal:Connect(setSortButton)
				local SetButtonColor = v8.SetButtonColor
				local v4 = if v.Name == v24.FilterType then "Green" else "Blue"
				SetButtonColor(v, "Diagonal", v4)
				v1.new(v, {
					Click = function() --[[ Click | Line: 324 | Upvalues: v24 (ref), v (copy) ]]
						v24:Filter(v.Name)
					end
				})
			end
		end
		v8.CreateCurrencyLabel({
			GuiObject = ContainerFrame.Menu.Content.Coins.Content.TextLabel,
			Value = v20:GetCurrencyValue("Coins"),
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 333 ]] end
		})
		v1.new(ContainerFrame.Menu.Content.Coins.PurchaseButton, {
			Click = function() --[[ Click | Line: 338 | Upvalues: v11 (ref) ]]
				v11.Open("Coins")
			end
		})
	end
	if v12.ContentsLoaded then
		return
	end
	v12.ContentsLoaded = true
	for k, v in pairs(v10.GetItems()) do
		task.spawn(createItem, k, v)
	end
	v24:Sort(v24.SortType or "ByPrice")
	v24:Filter("All")
	selectItem()
end
function t.Cleanup(p1) --[[ Cleanup | Line: 358 | Upvalues: selectItem (copy), v22 (copy), t3 (ref), v2 (copy), ContainerFrame (copy) ]]
	selectItem()
	v22:DoCleaning()
	t3 = {}
	v2.CleanContents(ContainerFrame)
end
function t.Open(p1) --[[ Open | Line: 366 | Upvalues: v2 (copy), ContainerFrame (copy), v21 (copy), v6 (copy), v24 (copy), selectItem (copy), t (copy) ]]
	if v2.IsFrameOpen(ContainerFrame) then
		t.Close()
	else
		v21:FireServer("AccessedMajorInterface", "Shop")
		v2.OpenFrame(ContainerFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { p1 }
		})
		if p1 then
			task.defer(function() --[[ Line: 376 | Upvalues: v6 (ref), p1 (copy), v24 (ref), selectItem (ref) ]]
				local v1 = v6.GetByName(p1)
				if not v1 then
					return
				end
				v24:Filter("Potions")
				selectItem(v1)
			end)
		end
	end
end
function t.Close() --[[ Close | Line: 389 | Upvalues: v2 (copy), ContainerFrame (copy), v21 (copy) ]]
	if not v2.IsFrameOpen(ContainerFrame) then
		v2.CloseFrame(ContainerFrame)
		v2.OpenHUD()
		return
	end
	v21:FireServer("ClosedMajorInterface", "Shop")
	v2.CloseFrame(ContainerFrame)
	v2.OpenHUD()
end
function t.Init(p1) --[[ Init | Line: 399 | Upvalues: v2 (copy), ContainerFrame (copy), v12 (copy), t (copy), v1 (copy), v8 (copy), PlayerGui (copy), v20 (copy), Sonar (copy), v18 (copy) ]]
	v2.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = ContainerFrame.Menu.Content.Items.Content
	})
	v12.SetUnselectableWhenSelected(ContainerFrame.Menu.Content.Items.Content)
	v2.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 412 | Upvalues: t (ref) ]]
		t:OnOpen()
	end)
	v1.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 417 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	task.spawn(function() --[[ Line: 422 | Upvalues: v8 (ref), PlayerGui (ref), v20 (ref) ]]
		v8.CreateCurrencyLabel({
			GuiObject = PlayerGui:WaitForChild("PromptGui").PromptFrame.PromptFrames.MultiBuy.Content.IntValue.Coins.Content.TextLabel,
			Value = v20:GetCurrencyValue("Coins"),
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 427 ]] end
		})
	end)
	task.spawn(function() --[[ Line: 433 | Upvalues: Sonar (ref), v18 (ref), t (ref) ]]
		Sonar("InteractMenu").new(workspace:WaitForChild("Interactions"):WaitForChild("Shop"):WaitForChild("InteractPart"), {
			ShowHintLabel = true,
			Hint = "Open Shop",
			Run = function() --[[ Run | Line: 436 | Upvalues: v18 (ref), t (ref) ]]
				if v18.CanDoActionInTutorial("InteractZones") then
					t.Open()
				end
			end,
			GetRange = function() --[[ GetRange | Line: 442 ]]
				return 25
			end
		})
	end)
end
t:Init()
return t