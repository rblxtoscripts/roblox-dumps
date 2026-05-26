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
local v14 = Sonar("FormatNumber")
local v15 = Sonar("InventoryGui")
local v16 = Sonar("IssueResponseClient")
local v17 = Sonar("TutorialService")
local v18 = Sonar("PlaceTypeService")
Sonar("Constants")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v19 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("EquipmentShopGui").ContainerFrame
local v20 = v3.new()
local v21 = v3.new()
local v22 = v5.new({
	Filters = {
		All = true
	},
	Sorts = {
		ByPrice = {
			Run = function(p1, p2) --[[ Run | Line: 56 ]]
				return p1.Price < p2.Price
			end
		}
	},
	EmptyString = {
		Text = "No items in the shop!",
		Label = ContainerFrame.Menu.Content.Items.EmptyLabel
	},
	Search = {
		TextBox = ContainerFrame.Menu.Content.SearchBar.Content.TextBox,
		Run = function(p1, p2) --[[ Run | Line: 69 ]]
			local v1 = p1:lower()
			local v4 = string.find(if p2.Item.Species then p2.Item.Species:lower() else "", v1)
			return if #p1 <= 0 then true else string.find(p2.NameLabel.Text:lower(), v1) or v4
		end
	}
})
local t = {}
local t2 = {}
local t3 = {}
local v23 = nil
for k, v in pairs({}) do
	v22:AddFilter(k, function(p1) --[[ Line: 84 | Upvalues: v (copy) ]]
		return table.find(v, p1.Item.ItemType)
	end)
end
local t4 = {
	Buy = function() --[[ Buy | Line: 90 | Upvalues: v10 (copy), v19 (copy), v23 (ref), v15 (copy), v11 (copy), v16 (copy) ]]
		local v1 = v10.CanPurchaseItem(v19, v23.Name, "Equipment")
		if v1 == true then
			v10:PurchaseEquipment(v23.Name)
			return
		end
		if v1 == "MaxInventory" or v1 == "MaxEquipment" then
			v15.UpgradeSlots()
		else
			v11.Open("Coins")
		end
		v16.NotifyIssue(v1)
	end
}
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 108 | Upvalues: ContainerFrame (copy) ]]
	if p1 then
		ContainerFrame.Menu.Content.Info.Content.Visible = true
		ContainerFrame.Menu.Content.Info.NotSelected.Visible = false
	else
		ContainerFrame.Menu.Content.Info.Content.Visible = false
		ContainerFrame.Menu.Content.Info.NotSelected.Visible = true
	end
end
local function selectItem(p1) --[[ selectItem | Line: 118 | Upvalues: t (copy), v23 (ref), v21 (copy), v9 (copy), ContainerFrame (copy), v10 (copy) ]]
	local v1 = t[v23]
	if v1 then
		v1:Deselect()
	end
	v21:DoCleaning()
	v23 = p1
	if not p1 then
		ContainerFrame.Menu.Content.Info.Content.Visible = false
		ContainerFrame.Menu.Content.Info.NotSelected.Visible = true
		return
	end
	local v2 = t[p1]
	if not v2 then
		v21:GiveTask(v9.new({
			Item = p1,
			Frame = ContainerFrame.Menu.Content.Info.Content,
			Price = v10.GetPriceForItem(p1.Name, "Equipment")
		}))
		ContainerFrame.Menu.Content.Info.Content.Visible = true
		ContainerFrame.Menu.Content.Info.NotSelected.Visible = false
		return
	end
	v2:Select()
	v21:GiveTask(v9.new({
		Item = p1,
		Frame = ContainerFrame.Menu.Content.Info.Content,
		Price = v10.GetPriceForItem(p1.Name, "Equipment")
	}))
	ContainerFrame.Menu.Content.Info.Content.Visible = true
	ContainerFrame.Menu.Content.Info.NotSelected.Visible = false
end
local function createItem(p1, p2) --[[ createItem | Line: 145 | Upvalues: v6 (copy), v7 (copy), ContainerFrame (copy), v4 (copy), selectItem (copy), t (copy), v20 (copy), v22 (copy) ]]
	local v1 = v6.GetByName(p1)
	local v2 = v7.new({
		GuiSource = "Shop",
		Item = v1,
		ParentFrame = ContainerFrame.Menu.Content.Items,
		Price = p2
	})
	v2:GiveTask(v4.new(v2.Frame, {
		Click = function() --[[ Click | Line: 156 | Upvalues: selectItem (ref), v1 (copy) ]]
			selectItem(v1)
		end
	}))
	t[v1] = v2
	v20:GiveTask(function() --[[ Line: 162 | Upvalues: v22 (ref), v2 (copy) ]]
		v22:Remove(v2)
	end)
	v20:GiveTask(v2)
	v22:Add(v2, true)
end
function t3.OnOpen(p1) --[[ OnOpen | Line: 169 | Upvalues: v2 (copy), ContainerFrame (copy), t2 (copy), v1 (copy), t4 (copy), v8 (copy), v22 (copy), v19 (copy), v11 (copy), v10 (copy), createItem (copy), selectItem (copy) ]]
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
				local function setSortButton() --[[ setSortButton | Line: 192 | Upvalues: v8 (ref), v (copy), v22 (ref) ]]
					v8.SetButtonColor(v, "Diagonal", if v.Name == v22.FilterType then "Green" else "Blue")
				end
				v22.FilterChangedSignal:Connect(setSortButton)
				local SetButtonColor = v8.SetButtonColor
				local v4 = if v.Name == v22.FilterType then "Green" else "Blue"
				SetButtonColor(v, "Diagonal", v4)
				v1.new(v, {
					Click = function() --[[ Click | Line: 199 | Upvalues: v22 (ref), v (copy) ]]
						v22:Filter(v.Name)
					end
				})
			end
		end
		v8.CreateCurrencyLabel({
			GuiObject = ContainerFrame.Menu.Content.Coins.Content.TextLabel,
			Value = v19:GetCurrencyValue("Coins"),
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 208 ]] end
		})
		v1.new(ContainerFrame.Menu.Content.Coins.PurchaseButton, {
			Click = function() --[[ Click | Line: 213 | Upvalues: v11 (ref) ]]
				v11.Open("Coins")
			end
		})
	end
	if v12.ContentsLoaded then
		return
	end
	v12.ContentsLoaded = true
	for k, v in pairs(v10.GetItems("Equipment")) do
		createItem(k, v)
	end
	v22:Sort(v22.SortType or "ByPrice")
	v22:Filter("All")
	selectItem()
end
function t3.Cleanup(p1) --[[ Cleanup | Line: 233 | Upvalues: selectItem (copy), v20 (copy), v2 (copy), ContainerFrame (copy) ]]
	selectItem()
	v20:DoCleaning()
	v2.CleanContents(ContainerFrame)
end
function t3.Open(...) --[[ Open | Line: 240 | Upvalues: v2 (copy), ContainerFrame (copy), v10 (copy), v19 (copy), v13 (copy), Sonar (copy), v14 (copy), t3 (copy) ]]
	if v2.IsFrameOpen(ContainerFrame) then
		t3.Close()
		return
	end
	if v10.HasUnlockedEquipmentShop(v19) then
		v2.OpenFrame(ContainerFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	else
		v13.Prompt({
			Type = "FeatureLocked",
			Setup = function(p1, p2) --[[ Setup | Line: 245 | Upvalues: v10 (ref), Sonar (ref), v14 (ref), v19 (ref) ]]
				p1.Content.ProgressDescription.Description.Text = string.format("Level up any of your horses skills %s times to unlock the Equipment Shop!", v10.GetAmountToUnlock("Equipment"))
				p1.Content.Description.Visible = false
				p1.Content.ProgressDescription.Visible = true
				p2.Maid:GiveTask(Sonar("StatBar").new({
					TweenAmount = true,
					Clipped = false,
					Frame = p1.Content.ProgressDescription.ProgressBar.Fill,
					AmountLabel = p1.Content.ProgressDescription.ProgressBar.Progress,
					GetText = function(p1, p2) --[[ GetText | Line: 256 | Upvalues: v14 (ref) ]]
						return v14.suffix(p1) .. "/" .. v14.suffix(p2)
					end,
					Get = function() --[[ Get | Line: 260 | Upvalues: v19 (ref) ]]
						return v19:GetStatValue("HorseSkillLevelUps").Value
					end,
					GetMax = function() --[[ GetMax | Line: 263 | Upvalues: v10 (ref) ]]
						return v10.GetAmountToUnlock("Equipment")
					end,
					Changed = { v19:GetStatValue("HorseSkillLevelUps"):GetPropertyChangedSignal("Value") }
				}))
			end,
			Run = function() --[[ Run | Line: 271 ]]
				return true
			end
		})
	end
end
function t3.Close() --[[ Close | Line: 288 | Upvalues: v2 (copy), ContainerFrame (copy) ]]
	v2.CloseFrame(ContainerFrame, {})
	v2.OpenHUD()
end
function t3.Init(p1) --[[ Init | Line: 296 | Upvalues: v2 (copy), ContainerFrame (copy), v12 (copy), t3 (copy), v1 (copy), v18 (copy), Sonar (copy), v17 (copy) ]]
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
	v2.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 309 | Upvalues: t3 (ref) ]]
		t3:OnOpen()
	end)
	v2.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 312 | Upvalues: t3 (ref) ]]
		t3:Cleanup()
	end)
	v1.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 317 | Upvalues: t3 (ref) ]]
			t3.Close()
		end
	})
	if not (v18.IsMainWorld() or v18.IsMarketWorld()) then
		return
	end
	Sonar("InteractMenu").new(workspace:WaitForChild("Interactions"):WaitForChild("EquipmentShop"):WaitForChild("InteractPart"), {
		ShowHintLabel = true,
		Hint = "Open Equipment",
		Run = function() --[[ Run | Line: 325 | Upvalues: v17 (ref), t3 (ref) ]]
			if v17.CanDoActionInTutorial("InteractZones") then
				t3.Open()
			end
		end,
		GetRange = function() --[[ GetRange | Line: 331 ]]
			return 25
		end
	})
end
t3:Init()
return t3