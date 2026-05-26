-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require((ReplicatedStorage:WaitForChild("Sonar")))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("Button")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("GuiManager")
local v5 = Sonar("Maid")
local v6 = Sonar("Constants")
local v7 = Sonar("ItemDataService")
local v8 = Sonar("ItemGridButton")
local v9 = Sonar("ItemInfoFrame")
local v10 = Sonar("GuiUtils")
local v11 = Sonar("PremiumShopGui")
local v12 = Sonar("FormatNumber")
local v13 = Sonar("DisplayUtils")
local v14 = Sonar("InputTypeDetector")
local v15 = Sonar("State")
local v16 = Sonar("VirtualizedList")
local v17 = Sonar("DynamicNPCService")
local v18 = Sonar("PromptClient")
local v19 = Sonar("ShopService")
local v20 = Sonar("IssueResponseClient")
local v21 = Sonar("DynamicNPCDialogClient")
local v22 = v1.GetClient()
local LocalPlayer = Players.LocalPlayer
local NPCSellGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("NPCSellGui")
local ContainerFrame = NPCSellGui:FindFirstChild("ContainerFrame")
local Menu = ContainerFrame:FindFirstChild("Menu")
local v23 = Menu:FindFirstChild("Content")
local Items = v23:FindFirstChild("Items")
local Info = v23:FindFirstChild("Info")
local t2 = { "All", "Gear", "Food", "Potions", "Resources", "Equipment" }
local t3 = {
	Food = {
		ItemTypes = { "Food" }
	},
	Gear = {
		ItemTypes = { "Tools", "Seeds", "Capsules", "ItemCapsules" }
	},
	Equipment = {
		ItemTypes = { "Equipment", "EquipmentPalettes", "Flairs" }
	},
	Resources = {
		ItemTypes = { "Resources", "StackableChests", "Chests", "Miscellaneous" }
	},
	Potions = {
		ItemTypes = { "Potions" }
	}
}
local t4 = {
	Equipment = true,
	Seeds = true,
	Chests = true,
	Buildings = true
}
local v24 = v15.new(t2[1])
local v25 = v5.new()
local v26 = v5.new()
local v27 = v5.new()
local v28 = nil
local v29 = nil
local v30 = false
local v31 = nil
local v32 = nil
local v33 = nil
local function resolveNpcTalkTargetForResume(p1) --[[ resolveNpcTalkTargetForResume | Line: 105 ]]
	local Target = p1.Target
	if Target and Target:IsDescendantOf(workspace) then
		return Target
	end
	local NPC = p1.NPC
	if not (NPC and NPC.Model) then
		return nil
	end
	local NPC_2 = NPC.Model:FindFirstChild("NPC")
	if not NPC_2 then
		return nil
	end
	local v1 = NPC_2:FindFirstChild("HumanoidRootPart") or NPC_2:FindFirstChild("Primary")
	if v1 and v1:IsDescendantOf(workspace) then
		return v1
	else
		return nil
	end
end
local function getAnimalCountBySpecies(p1) --[[ getAnimalCountBySpecies | Line: 123 | Upvalues: v22 (copy) ]]
	local v1 = v22:GetItemFolder("Animals")
	if not v1 then
		return 0
	end
	local count = 0
	for v2, v3 in v1:GetChildren() do
		local Species = v3:FindFirstChild("Species")
		if Species and Species.Value == p1 then
			count = count + 1
		end
	end
	return count
end
local function getFlairCountByName(p1) --[[ getFlairCountByName | Line: 140 | Upvalues: v22 (copy) ]]
	local v1 = v22:GetItemFolder("Equipment")
	if not v1 then
		return 0
	end
	local count = 0
	for v2, v3 in v1:GetChildren() do
		if v3.Value == p1 then
			count = count + 1
		end
	end
	return count
end
local function getThemedEquipmentCount(p1) --[[ getThemedEquipmentCount | Line: 156 | Upvalues: v22 (copy) ]]
	local v1 = v22:GetItemFolder("Equipment")
	if not v1 then
		return 0
	end
	local sum = 0
	for v2, v3 in v1:GetChildren() do
		sum = sum + (if v3.Theme.Value == p1 then 1 else 0)
	end
	return sum
end
local function getAmountOwned(p1, p2) --[[ getAmountOwned | Line: 170 | Upvalues: getThemedEquipmentCount (copy), getAnimalCountBySpecies (copy), v22 (copy), t4 (copy) ]]
	local ItemType = p2.ItemType
	if ItemType == "EquipmentThemes" then
		return getThemedEquipmentCount(p1)
	end
	if ItemType == "Animals" then
		return getAnimalCountBySpecies(p1)
	end
	if ItemType == "Flairs" then
		local v1 = v22:GetItemFolder("Equipment")
		if not v1 then
			return 0
		end
		local count = 0
		for v2, v3 in v1:GetChildren() do
			if v3.Value == p1 then
				count = count + 1
			end
		end
		return count
	elseif t4[ItemType] then
		local v4 = nil
		if not (pcall(function() --[[ Line: 187 | Upvalues: v4 (ref), v22 (ref), p1 (copy), ItemType (copy) ]]
			v4 = v22:GetTrackedItemValue(p1, ItemType)
		end) and v4) then
			return 0
		end
		local v5 = v4.Value
		if type(v5) == "number" then
			return v5
		else
			return 0
		end
	else
		local v6 = nil
		if not (pcall(function() --[[ Line: 201 | Upvalues: v6 (ref), v22 (ref), p1 (copy), ItemType (copy) ]]
			v6 = v22:GetItemValue(p1, ItemType)
		end) and v6) then
			return 0
		end
		local v7 = v6.Value
		if type(v7) == "number" then
			return v7
		else
			return 0
		end
	end
end
local function parseMultiSellNumerator(p1, p2) --[[ parseMultiSellNumerator | Line: 215 ]]
	local v1 = string.match(tostring(p1), "^(%d*)") or ""
	if v1 == "" then
		return 0
	end
	local v2 = tonumber(v1)
	if v2 then
		return math.clamp(math.floor(v2), 0, p2)
	else
		return 0
	end
end
local v34 = false
local function promptNpcMultiSell() --[[ promptNpcMultiSell | Line: 230 | Upvalues: v31 (ref), v7 (copy), v18 (copy), getAmountOwned (copy), v12 (copy), v20 (copy), v29 (ref), v19 (copy), v30 (ref), v33 (ref) ]]
	local v1 = v31
	if not v1 then
		return
	end
	local v2 = v7.GetByName(v1.Name)
	if not v2 then
		return
	end
	local v3 = v1.Value or (v1.SellPrice or v1.Price)
	if typeof(v3) == "number" then
		v18.Prompt({
			Type = "MultiSell",
			Setup = function(p1, p2) --[[ Setup | Line: 251 | Upvalues: getAmountOwned (ref), v1 (copy), v2 (copy), v12 (ref), v3 (copy) ]]
				p1.Content.IntValue.Visible = true
				p1.Content.IndexedValue.Visible = false
				local TextBox = p1.Content.IntValue.InputFrame.Content.TextBox
				local TextLabel = p1.Content.IntValue.Value.Content.TextLabel
				local v13 = getAmountOwned(v1.Name, v2)
				TextBox.Text = ("0/%*"):format(v13)
				TextLabel.Text = "+0 Coins"
				local function applyCommittedFormat() --[[ applyCommittedFormat | Line: 262 | Upvalues: TextBox (copy), v13 (copy), TextLabel (copy), v12 (ref), v3 (ref) ]]
					local v1 = v13
					local v2 = string.match(tostring(TextBox.Text), "^(%d*)") or ""
					local v32
					if v2 == "" then
						v32 = 0
					else
						local v4 = tonumber(v2)
						v32 = if v4 then math.clamp(math.floor(v4), 0, v1) else 0
					end
					TextBox.Text = ("%*/%*"):format(v32, v13)
					TextLabel.Text = ("+%* Coins"):format((v12.splice(v32 * v3)))
				end
				if not (p2 and p2.Maid) then
					return
				end
				p2.Maid:GiveTask(TextBox.Focused:Connect(function() --[[ Line: 269 | Upvalues: TextBox (copy), TextLabel (copy) ]]
					TextBox.Text = ""
					TextLabel.Text = "+0 Coins"
				end))
				p2.Maid:GiveTask(TextBox.FocusLost:Connect(applyCommittedFormat))
				p2.Maid:GiveTask(TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 276 | Upvalues: TextBox (copy), v13 (copy), TextLabel (copy), v12 (ref), v3 (ref) ]]
					if not TextBox:IsFocused() then
						return
					end
					local v1 = string.gsub(tostring(TextBox.Text), "[^0-9]", "")
					if TextBox.Text ~= v1 then
						TextBox.Text = v1
						return
					end
					local v2 = v13
					local v32 = string.match(tostring(v1), "^(%d*)") or ""
					local v4
					if v32 == "" then
						v4 = 0
					else
						local v5 = tonumber(v32)
						v4 = if v5 then math.clamp(math.floor(v5), 0, v2) else 0
					end
					TextLabel.Text = ("+%* Coins"):format((v12.splice(v4 * v3)))
				end))
			end,
			Run = function(p1) --[[ Run | Line: 292 | Upvalues: getAmountOwned (ref), v1 (copy), v2 (copy), v20 (ref), v29 (ref), v19 (ref), v30 (ref), v33 (ref) ]]
				local TextBox = p1.Content.IntValue.InputFrame.Content.TextBox
				local TextLabel = p1.Content.IntValue.Value.Content.TextLabel
				local v12 = getAmountOwned(v1.Name, v2)
				local v22 = string.match(tostring(TextBox.Text), "^(%d*)") or ""
				local v3
				if v22 == "" then
					v3 = 0
				else
					local v4 = tonumber(v22)
					v3 = if v4 then math.clamp(math.floor(v4), 0, v12) else 0
				end
				if v3 <= 0 then
					v20.NotifyIssue("NpcSellInvalidAmount")
					return false
				end
				local v7 = v29
				if not v7 then
					v20.NotifyIssue("NpcSellInvalid")
					return false
				end
				local v8, v9 = v19:SellNpcStockItem(v7, v1.Name, v3, v1.Theme)
				if v8 then
					v30 = true
					TextBox.Text = ""
					TextLabel.Text = "+0 Coins"
					task.defer(v33)
					return true
				end
				if not v9 then
					return false
				end
				v20.NotifyIssue(v9)
				return false
			end,
			Cancel = function(p1) --[[ Cancel | Line: 324 ]]
				p1.Content.IntValue.InputFrame.Content.TextBox.Text = ""
				p1.Content.IntValue.Value.Content.TextLabel.Text = "+0 Coins"
				return true
			end
		})
	end
end
local function collectOwnedValueBases(p1, p2) --[[ collectOwnedValueBases | Line: 336 | Upvalues: v22 (copy) ]]
	local ItemType = p2.ItemType
	local v1 = v22:GetItemFolder(ItemType)
	if not v1 then
		return {}
	end
	local t = {}
	if ItemType == "Seeds" then
		for v2, v3 in v1:GetChildren() do
			if v3.Value == p1 then
				table.insert(t, v3)
			end
		end
	elseif ItemType == "Equipment" or ItemType == "Flairs" then
		for v4, v5 in v1:GetChildren() do
			if v5.Value == p1 then
				table.insert(t, v5)
			end
		end
	elseif ItemType == "Animals" then
		for v6, v7 in v1:GetChildren() do
			local Species = v7:FindFirstChild("Species")
			if Species and Species.Value == p1 then
				table.insert(t, v7)
			end
		end
	else
		local v8 = v1:FindFirstChild(p1)
		if v8 then
			table.insert(t, v8)
		end
	end
	return t
end
local function setInfoSelected(p1) --[[ setInfoSelected | Line: 374 | Upvalues: Info (copy) ]]
	if p1 then
		Info.Content.Visible = true
		Info.NotSelected.Visible = false
	else
		Info.Content.Visible = false
		Info.NotSelected.Visible = true
	end
end
local function syncSellButtons(p1) --[[ syncSellButtons | Line: 384 | Upvalues: Info (copy), v7 (copy), getAmountOwned (copy) ]]
	local Buttons = Info.Content:FindFirstChild("Buttons")
	if not Buttons then
		return
	end
	local Sell = Buttons:FindFirstChild("Sell")
	local NotAble = Buttons:FindFirstChild("NotAble")
	if not (p1 and (Sell and NotAble)) then
		return
	end
	local v1 = v7.GetByName(p1.Name)
	if not v1 then
		return
	end
	local v2 = getAmountOwned(p1.Name, v1)
	Sell.Visible = v2 >= 1
	NotAble.Visible = if v2 < 1 then true else false
end
local function clearSelection() --[[ clearSelection | Line: 408 | Upvalues: v31 (ref), v26 (copy), Info (copy), v32 (ref) ]]
	v31 = nil
	v26:DoCleaning()
	Info.Content.Visible = false
	Info.NotSelected.Visible = true
	if not v32 then
		return
	end
	v32:Refresh()
end
local function selectStockEntry(p1) --[[ selectStockEntry | Line: 418 | Upvalues: v26 (copy), v7 (copy), v31 (ref), Info (copy), v32 (ref), v22 (copy), collectOwnedValueBases (copy), v9 (copy), syncSellButtons (copy) ]]
	v26:DoCleaning()
	local v1 = v7.GetByName(p1.Name)
	if v1 then
		v31 = p1
		Info.Content.Visible = true
		Info.NotSelected.Visible = false
		local v2 = p1.Value or p1.SellPrice or p1.Price
		local t = {
			Item = v1,
			Frame = Info.Content,
			Theme = p1.Theme,
			AmountChanged = v22.HotbarChangedSignal
		}
		if typeof(v2) == "number" then
			t.Price = v2
		end
		local v3 = collectOwnedValueBases(p1.Name, v1)
		if #v3 > 0 then
			t.Values = v3
		else
			local v4 = v22:GetItemValue(v1.Name, v1.ItemType)
			if v4 and v4:IsA("IntValue") then
				t.DataValue = v4
			end
		end
		v26:GiveTask((v9.new(t)))
		syncSellButtons(p1)
		v26:GiveTask(v22.HotbarChangedSignal:Connect(function() --[[ Line: 464 | Upvalues: v31 (ref), p1 (copy), syncSellButtons (ref) ]]
			task.defer(function() --[[ Line: 465 | Upvalues: v31 (ref), p1 (ref), syncSellButtons (ref) ]]
				if v31 ~= p1 then
					return
				end
				syncSellButtons(p1)
			end)
		end))
	else
		v31 = nil
		Info.Content.Visible = false
		Info.NotSelected.Visible = true
	end
	if not v32 then
		return
	end
	v32:Refresh()
end
local function sellReify(p1, p2, p3, p4) --[[ sellReify | Line: 477 | Upvalues: v29 (ref), v17 (copy), v22 (copy), v12 (copy), v8 (copy), Items (copy), getAmountOwned (copy), v31 (ref), v2 (copy), v26 (copy), Info (copy), v32 (ref), selectStockEntry (copy) ]]
	p2.Maid:DoCleaning()
	if not p4 then
		return
	end
	local Stock = p2.Stock
	local ItemData = p2.ItemData
	p1.Name = Stock.Name
	local LockedOverlay = p1:FindFirstChild("LockedOverlay")
	local v1 = false
	if LockedOverlay then
		local Bond = Stock.Bond
		if typeof(Bond) == "number" and v29 then
			v1 = v17.GetBondPercentage(v22, v29) < Bond
			if v1 then
				LockedOverlay.Visible = true
				local Title = LockedOverlay:FindFirstChild("Title")
				if Title and Title:IsA("TextLabel") then
					Title.Text = Bond .. "% Bond"
				end
			else
				LockedOverlay.Visible = false
			end
		else
			LockedOverlay.Visible = false
		end
	end
	local v23 = Stock.Value or (Stock.SellPrice or Stock.Price)
	local v3 = p1:FindFirstChild("Content")
	local v4 = if v3 then v3:FindFirstChild("Viewport") else v3
	local v5 = if v4 then v4:FindFirstChild("Content") else v4
	local v6 = if v5 then v5:FindFirstChild("TextLabel") else v5
	if v6 and v6:IsA("TextLabel") then
		if typeof(v23) == "number" then
			v6.Text = v12.suffix(v23)
			v6.Visible = true
		else
			v6.Visible = false
		end
	end
	local v7 = v8.new({
		DoNotClone = true,
		ParentFrame = Items,
		GuiObject = p1,
		Item = ItemData,
		Theme = Stock.Theme,
		GetAmount = function() --[[ GetAmount | Line: 537 | Upvalues: getAmountOwned (ref), Stock (copy), ItemData (copy) ]]
			return getAmountOwned(Stock.Name, ItemData)
		end,
		AmountChanged = v22.HotbarChangedSignal
	})
	p2.Maid:GiveTask(v7)
	local SelectedTab = p1:FindFirstChild("SelectedTab", true)
	if SelectedTab and SelectedTab:IsA("UIGradient") then
		SelectedTab.Enabled = v31 == Stock
	end
	if v1 then
		return
	end
	p2.Maid:GiveTask(v2.new(p1, {
		Click = function() --[[ Click | Line: 553 | Upvalues: v31 (ref), Stock (copy), v26 (ref), Info (ref), v32 (ref), selectStockEntry (ref) ]]
			if v31 == Stock then
				v31 = nil
				v26:DoCleaning()
				Info.Content.Visible = false
				Info.NotSelected.Visible = true
				if v32 then
					v32:Refresh()
				end
			else
				selectStockEntry(Stock)
			end
		end
	}))
end
local function setupSellVirtualizedList() --[[ setupSellVirtualizedList | Line: 564 | Upvalues: v32 (ref), v14 (copy), Items (copy), v25 (copy), v16 (copy), sellReify (copy) ]]
	if v32 then
		return
	end
	local v1 = v14.IsMobileInputType()
	Items.Content.Visible = not v1
	Items.ContentMobile.Visible = v1
	local v2 = if v1 then Items.ContentMobile else Items.Content
	local v3 = v2:FindFirstChild("DefaultTemplate") or v2:FindFirstChild("Default")
	if v3 then
		v3.Visible = false
		v32 = v25:GiveTask(v16.new({
			ItemsPerRow = 5,
			ItemSpacing = 8,
			UpdateThrottle = 0.3,
			ScrollingFrame = v2,
			TemplateFrame = v3,
			GetItemHeight = function(p1, p2) --[[ GetItemHeight | Line: 592 | Upvalues: v2 (copy) ]]
				return (v2.AbsoluteSize.Y - 16) / 3
			end,
			GetItemWidth = function(p1, p2) --[[ GetItemWidth | Line: 600 | Upvalues: v2 (copy) ]]
				return (v2.AbsoluteSize.X - 32) / 5 - v2.ScrollBarThickness
			end,
			OnItemHidden = function(p1, p2, p3) --[[ OnItemHidden | Line: 609 ]]
				p2.Maid:DoCleaning()
			end,
			OnItemVisible = function(p1, p2, p3) --[[ OnItemVisible | Line: 613 | Upvalues: sellReify (ref) ]]
				sellReify(p1, p2, p3, true)
			end,
			UpdateContent = function(p1, p2, p3) --[[ UpdateContent | Line: 617 | Upvalues: sellReify (ref) ]]
				sellReify(p1, p2, p3, true)
			end
		}))
	else
		warn("[NPCSellGui] Missing DefaultTemplate/Default for VirtualizedList")
	end
end
local function buildSortedRows() --[[ buildSortedRows | Line: 623 | Upvalues: v28 (ref), v7 (copy), v24 (copy), t3 (copy), v23 (copy), v13 (copy) ]]
	local v1 = v28
	if not v1 then
		return {}
	end
	local t = {}
	for v2, v3 in v1 do
		local v4 = v7.GetByName(v3.Name)
		if v4 then
			table.insert(t, {
				Stock = v3,
				ItemData = v4
			})
		end
	end
	local v5 = v24:get()
	if v5 ~= "All" then
		local v6 = t3[v5]
		local v72 = if v6 then v6.ItemTypes else v6
		if v72 then
			for i = #t, 1, -1 do
				if not table.find(v72, t[i].ItemData.ItemType) then
					table.remove(t, i)
				end
			end
		end
	end
	local SortOptions = v23:FindFirstChild("SortOptions")
	local v8 = ""
	if SortOptions then
		local SearchBar = SortOptions:FindFirstChild("SearchBar")
		local v9 = if SearchBar then SearchBar:FindFirstChild("Content") else SearchBar
		local v10 = if v9 then v9:FindFirstChild("TextBox") else v9
		if v10 then
			v8 = string.gsub(string.lower(v10.ContentText or ""), " ", "")
		end
	end
	if string.len(v8) > 0 then
		for j = #t, 1, -1 do
			local ItemData = t[j].ItemData
			if not string.find(string.gsub(string.lower(ItemData.Name), " ", ""), v8, 1, true) then
				local v15 = false
				if ItemData.Theme and string.find(string.gsub(string.lower(ItemData.Theme), " ", ""), v8, 1, true) then
					v15 = true
				end
				if not v15 then
					table.remove(t, j)
				end
			end
		end
	end
	local function bondReq(p1) --[[ bondReq | Line: 699 ]]
		local Bond = p1.Stock.Bond
		return if typeof(Bond) == "number" and Bond then Bond else 0
	end
	table.sort(t, function(p1, p2) --[[ Line: 705 | Upvalues: v13 (ref) ]]
		local Bond = p1.Stock.Bond
		local v1 = if typeof(Bond) == "number" and Bond then Bond else 0
		local Bond_2 = p2.Stock.Bond
		local v2 = if typeof(Bond_2) == "number" and Bond_2 then Bond_2 else 0
		if v1 == v2 then
			local ItemData = p1.ItemData
			local ItemData_2 = p2.ItemData
			local Index = ItemData.Rarity.Index
			local Index_2 = ItemData_2.Rarity.Index
			local v3 = v13.GetDisplayName(ItemData.Name, ItemData)
			local v4 = v13.GetDisplayName(ItemData_2.Name, ItemData_2)
			if Index == Index_2 then
				if v3 == v4 then
					local v5 = ItemData.Name
					local v6 = ItemData_2.Name
					if v5 == v6 then
						return false
					end
					return v5 < v6
				else
					return v3 < v4
				end
			else
				return Index_2 < Index
			end
		else
			return v1 < v2
		end
	end)
	return t, v8, v5
end
v33 = function() --[[ Line: 739 | Upvalues: v28 (ref), v32 (ref), setupSellVirtualizedList (copy), v31 (ref), v26 (copy), buildSortedRows (copy), Items (copy), v5 (copy), selectStockEntry (copy), Info (copy) ]]
	if not v28 then
		return
	end
	if not v32 then
		setupSellVirtualizedList()
	end
	if not v32 then
		return
	end
	local v1 = v31
	v26:DoCleaning()
	v31 = nil
	local v2, v3, v4 = buildSortedRows()
	local EmptyLabel = Items:FindFirstChild("EmptyLabel")
	if EmptyLabel then
		EmptyLabel.Visible = #v2 == 0
		if #v2 == 0 then
			local v6 = "You have nothing to sell..."
			if string.len(v3) > 0 then
				v6 = "No items found for your search..."
			elseif v4 == "Food" then
				v6 = "No food items to sell..."
			elseif v4 == "Gear" then
				v6 = "No gear to sell..."
			elseif v4 == "Equipment" then
				v6 = "No equipment to sell..."
			elseif v4 == "Resources" then
				v6 = "No materials to sell..."
			elseif v4 == "Potions" then
				v6 = "No potions to sell..."
			end
			EmptyLabel.Text = v6
		end
	end
	local t = {}
	for v7, v8 in v2 do
		table.insert(t, {
			Stock = v8.Stock,
			ItemData = v8.ItemData,
			Maid = v5.new()
		})
	end
	v32:SetData(t)
	local v9 = false
	if v1 then
		for v10, v11 in t do
			if v11.Stock == v1 then
				selectStockEntry(v1)
				v9 = true
				break
			end
		end
	end
	if v9 then
		return
	end
	Info.Content.Visible = false
	Info.NotSelected.Visible = true
end
local function refreshWhenOpen() --[[ refreshWhenOpen | Line: 811 | Upvalues: v28 (ref), v33 (ref) ]]
	if v28 then
		v33()
	end
end
local function setupSortOptions() --[[ setupSortOptions | Line: 819 | Upvalues: v23 (copy), v15 (copy), t2 (copy), v3 (copy), v24 (copy), v25 (copy), refreshWhenOpen (copy), v22 (copy) ]]
	local SortOptions = v23:FindFirstChild("SortOptions")
	if not SortOptions then
		return
	end
	local v1 = v15.new(false)
	local ItemType = SortOptions:FindFirstChild("ItemType")
	if ItemType then
		local Dropdown = ItemType:FindFirstChild("Dropdown")
		local v2 = if Dropdown then Dropdown:FindFirstChild("Template") else Dropdown
		if Dropdown and v2 then
			for v32, v4 in next, t2 do
				local v5 = v2:Clone()
				v5.Name = v4
				v5.LayoutOrder = v32
				local DisplayLabel = v5:FindFirstChild("DisplayLabel")
				if DisplayLabel then
					DisplayLabel.Text = if v4 == "Resources" then "Materials" else v4
				end
				v5.Visible = true
				v5.Parent = Dropdown
				v3.new(v5, {
					Click = function() --[[ Click | Line: 847 | Upvalues: v24 (ref), v4 (copy), v1 (copy) ]]
						v24:set(v4)
						v1:set(false)
					end
				})
			end
			local function onIsDropdownOpenChanged() --[[ onIsDropdownOpenChanged | Line: 854 | Upvalues: Dropdown (copy), v1 (copy) ]]
				Dropdown.Visible = v1:get()
			end
			Dropdown.Visible = v1:get()
			v24:set(t2[1])
			v25:GiveTask(v1:subscribe(onIsDropdownOpenChanged))
		end
		local v7 = ItemType:FindFirstChild("Top") and ItemType:FindFirstChild("Top"):FindFirstChild("DisplayLabel")
		local function onSelectedTabChanged() --[[ onSelectedTabChanged | Line: 866 | Upvalues: v7 (copy), v24 (ref) ]]
			if not v7 then
				return
			end
			local v1 = v24:get()
			v7.Text = if v1 == "Resources" then "Materials" else v1
		end
		v3.new(ItemType, {
			IgnoreUIScale = true,
			Click = function() --[[ Click | Line: 875 | Upvalues: v1 (copy) ]]
				v1:set(not v1:get())
			end
		})
		if v7 then
			local v8 = v24:get()
			v7.Text = if v8 == "Resources" then "Materials" else v8
		end
		v25:GiveTask(v24:subscribe(onSelectedTabChanged))
	end
	local SearchBar = SortOptions:FindFirstChild("SearchBar")
	local v10 = if SearchBar then SearchBar:FindFirstChild("Content") else SearchBar
	local v11 = v10 and v10:FindFirstChild("TextBox")
	if not v11 then
		v25:GiveTask(v24:subscribe(function() --[[ Line: 894 | Upvalues: refreshWhenOpen (ref) ]]
			task.defer(refreshWhenOpen)
		end))
		v25:GiveTask(v22.HotbarChangedSignal:Connect(function() --[[ Line: 898 | Upvalues: refreshWhenOpen (ref) ]]
			task.defer(refreshWhenOpen)
		end))
		return
	end
	v25:GiveTask(v15.fromProperty(v11, "ContentText"):subscribe(function() --[[ Line: 889 | Upvalues: refreshWhenOpen (ref) ]]
		task.defer(refreshWhenOpen)
	end))
	v25:GiveTask(v24:subscribe(function() --[[ Line: 894 | Upvalues: refreshWhenOpen (ref) ]]
		task.defer(refreshWhenOpen)
	end))
	v25:GiveTask(v22.HotbarChangedSignal:Connect(function() --[[ Line: 898 | Upvalues: refreshWhenOpen (ref) ]]
		task.defer(refreshWhenOpen)
	end))
end
function t.Open(...) --[[ Open | Line: 903 | Upvalues: v4 (copy), ContainerFrame (copy) ]]
	v4.OpenMainFrame(ContainerFrame, {
		DisableControls = true,
		CallbackArgs = { ... }
	})
end
function t.Close() --[[ Close | Line: 910 | Upvalues: v4 (copy), ContainerFrame (copy) ]]
	v4.CloseMainFrame(ContainerFrame)
end
function t.ConsumeSoldSomethingForResume() --[[ ConsumeSoldSomethingForResume | Line: 914 | Upvalues: v30 (ref) ]]
	local v1 = v30
	v30 = false
	return v1
end
function t.Init() --[[ Init | Line: 920 | Upvalues: setupSellVirtualizedList (copy), v4 (copy), ContainerFrame (copy), Items (copy), NPCSellGui (copy), v30 (ref), v6 (copy), v28 (ref), v29 (ref), v31 (ref), v26 (copy), Info (copy), v32 (ref), v27 (copy), v22 (copy), v23 (copy), v33 (ref), v21 (copy), t (copy), LocalPlayer (copy), resolveNpcTalkTargetForResume (copy), v34 (ref), v3 (copy), promptNpcMultiSell (copy), Menu (copy), v10 (copy), v11 (copy), setupSortOptions (copy) ]]
	setupSellVirtualizedList()
	v4.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = Items.Content
	})
	v4.AddStateCallback(ContainerFrame, "OnOpen", function(p1) --[[ Line: 933 | Upvalues: NPCSellGui (ref), v30 (ref), v6 (ref), v28 (ref), v29 (ref), v31 (ref), v26 (ref), Info (ref), v32 (ref), v27 (ref), v22 (ref), v23 (ref), v33 (ref) ]]
		if type(p1) ~= "string" then
			warn("got invalid npc name for opening npc sell gui", p1)
			return
		end
		NPCSellGui.Enabled = true
		v30 = false
		local v1 = v6[("%*SellStock"):format(p1)]
		if not v1 then
			warn("could not find npc sell stock for", p1)
			return
		end
		v28 = v1
		v29 = p1
		v31 = nil
		v26:DoCleaning()
		Info.Content.Visible = false
		Info.NotSelected.Visible = true
		if v32 then
			v32:Refresh()
		end
		v27:DoCleaning()
		local v2 = v22.PlayerData.DynamicNPCs:FindFirstChild(p1)
		local v3 = if v2 then v2:FindFirstChild("Bond") else v2
		if v3 and v3:IsA("ValueBase") then
			v27:GiveTask(v3:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 959 | Upvalues: v32 (ref), v28 (ref) ]]
				task.defer(function() --[[ Line: 960 | Upvalues: v32 (ref), v28 (ref) ]]
					if not (v32 and v28) then
						return
					end
					v32:Refresh()
				end)
			end))
		end
		local v4 = v23:FindFirstChild("Title") or v23:FindFirstChild("TitleLabel")
		if v4 and v4:IsA("TextLabel") then
			v4.Text = ("Sell Stock (%*)"):format(p1)
		end
		v33()
	end)
	v4.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 976 | Upvalues: v21 (ref), t (ref), v30 (ref), v28 (ref), v29 (ref), v27 (ref), v31 (ref), v26 (ref), Info (ref), v32 (ref), LocalPlayer (ref), resolveNpcTalkTargetForResume (ref), NPCSellGui (ref) ]]
		local v1 = v21.TakePendingNpcSellResume()
		local v2 = false
		if v1 then
			v2 = t.ConsumeSoldSomethingForResume()
		else
			v30 = false
		end
		v28 = nil
		v29 = nil
		v27:DoCleaning()
		v31 = nil
		v26:DoCleaning()
		Info.Content.Visible = false
		Info.NotSelected.Visible = true
		if v32 then
			v32:Refresh()
		end
		if v32 then
			v32:SetData({})
		end
		if not v1 then
			return
		end
		local v3 = LocalPlayer.Character or v1.Character
		local NPC = v1.NPC
		local v4 = resolveNpcTalkTargetForResume(v1)
		if v3 and (v4 and NPC) then
			NPCSellGui.Enabled = false
			task.defer(function() --[[ Line: 1000 | Upvalues: v21 (ref), v1 (copy), v3 (copy), v4 (copy), NPC (copy), v2 (ref) ]]
				v21.Start({
					Type = v1.Type,
					Character = v3,
					Target = v4,
					NPC = NPC,
					ResumeFromNpcSell = {
						Sold = v2
					}
				})
			end)
		else
			warn("[NPCSellResume] skipped reopening dialogue (missing Character, NPC, or valid Target)")
		end
	end)
	if not v34 then
		v34 = true
		local Buttons = Info.Content:FindFirstChild("Buttons")
		local v1 = if Buttons then Buttons:FindFirstChild("Sell") else Buttons
		if v1 and v1:IsA("GuiButton") then
			v3.new(v1, {
				Click = promptNpcMultiSell
			})
		end
	end
	v3.new(Menu.CloseButton, {
		Click = function() --[[ Click | Line: 1029 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	local Coins = v23:FindFirstChild("Coins")
	if not Coins then
		setupSortOptions()
		return
	end
	local v2 = Coins:FindFirstChild("Content")
	local v35 = if v2 then v2:FindFirstChild("TextLabel") else v2
	if v35 then
		v10.CreateCurrencyLabel({
			GuiObject = v35,
			Value = v22:GetCurrencyValue("Coins")
		})
	end
	local PurchaseButton = Coins:FindFirstChild("PurchaseButton")
	if not PurchaseButton then
		setupSortOptions()
		return
	end
	v3.new(PurchaseButton, {
		Click = function() --[[ Click | Line: 1049 | Upvalues: v11 (ref) ]]
			v11.Open("Coins")
		end
	})
	setupSortOptions()
end
t.Init()
return t