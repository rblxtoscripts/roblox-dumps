-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ItemDisplayCreator")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("GuiManager")
local v4 = Sonar("Maid")
local v5 = Sonar("Button")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("ItemGridButton")
local v8 = Sonar("GuiUtils")
local v9 = Sonar("ItemInfoFrame")
local v10 = Sonar("HotbarService")
local v11 = Sonar("NotificationsClient")
local v12 = Sonar("PromptClient")
local v13 = Sonar("FormatNumber")
local v14 = Sonar("FormatString")
local v15 = Sonar("RemoteUtils")
local v16 = Sonar("IssueResponseClient")
local v17 = Sonar("MarketplaceUtils")
local v18 = Sonar("UINavigator")
local v19 = Sonar("ConsumablesService")
local v20 = Sonar("MutationStatUtils")
local v21 = Sonar("MutationUtils")
local v22 = Sonar("NPCShopGui")
local v23 = Sonar("DisplayUtils")
local v24 = Sonar("AnimalDataService")
local v25 = Sonar("QuickFeedGui")
local v26 = Sonar("DynamicNPCDialogClient")
local v27 = Sonar("ItemSetService")
local v28 = Sonar("FarmingClient")
local v29 = Sonar("TimeUtils")
local v30 = Sonar("TutorialService")
local v31 = Sonar("DisplayAnimalClient")
local v32 = Sonar("VirtualizedList")
local v33 = Sonar("InputTypeDetector")
local v34 = Sonar("State")
local v35 = Sonar("CharacterControls")
local v36 = Sonar("ItemCapsuleGui")
local DisplayAnimalGui = game.Players.LocalPlayer.PlayerGui.DisplayAnimalGui
local PredictButton = DisplayAnimalGui.ContainerFrame.Content.BottomFrame.CapsuleBreeding.PredictButton
local PayClaim = DisplayAnimalGui.ContainerFrame.Content.BottomFrame.CapsuleBreeding.PayClaim
local v37 = Sonar("Constants")
local t2 = { "All", "Gear", "Food", "Potions", "Resources", "Equipment" }
local t3 = { "Name", "Rarity", "Amount" }
local t4 = {
	Food = {
		EmptyString = "You do not have any food items!",
		LayoutOrder = 2,
		ItemTypes = { "Food" }
	},
	Gear = {
		EmptyString = "You do not have any gear items!",
		LayoutOrder = 1,
		ItemTypes = { "Tools", "Seeds", "Capsules", "ItemCapsules" }
	},
	Equipment = {
		EmptyString = "You do not have any equipment or flair accessories!",
		LayoutOrder = 5,
		ItemTypes = { "Equipment", "EquipmentPalettes", "Flairs" }
	},
	Resources = {
		EmptyString = "You do not have any resources!",
		LayoutOrder = 4,
		ItemTypes = { "Resources", "StackableChests", "Chests", "Miscellaneous" }
	},
	Potions = {
		EmptyString = "You do not have any potions!",
		LayoutOrder = 3,
		ItemTypes = { "Potions" }
	}
}
local LocalPlayer = game:GetService("Players").LocalPlayer
local v38 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local ContainerFrame = PlayerGui:WaitForChild("InventoryGui").ContainerFrame
local MultiDelete = ContainerFrame.Menu.Content:FindFirstChild("RightOptions"):FindFirstChild("MultiDelete")
local v39 = v15.GetUnreliableRemoteEvent("ReportClientAnalyticsRemote")
local v40 = nil
local v41 = v34.new(nil)
local v42 = v34.new(t3[1])
local v43 = v34.new(true)
local v44 = v34.new(t2[1])
local v45 = v34.new()
local v46 = v34.new(nil)
local v47 = v4.new()
local t5 = {}
local v48 = v4.new()
local v49 = 1
local t6 = {}
local v50 = false
local v51 = false
local v52 = false
local t7 = {}
local v53 = v4.new()
local v54 = nil
local v55 = nil
local v56 = 0
local function getItemName(p1) --[[ getItemName | Line: 152 ]]
	if p1:IsA("StringValue") then
		return p1.Value
	else
		return p1.Name
	end
end
local function isIndexedEquipmentEquipped(p1) --[[ isIndexedEquipmentEquipped | Line: 160 | Upvalues: v38 (copy) ]]
	local v1 = v38:GetItemFolder("Animals")
	if not v1 then
		return false
	end
	for v2, v3 in v1:GetChildren() do
		local EquippedEquipment = v3:FindFirstChild("EquippedEquipment")
		if EquippedEquipment and EquippedEquipment:FindFirstChild(p1) then
			return true
		end
	end
	return false
end
local function inventoryGridSetSelected(p1, p2) --[[ inventoryGridSetSelected | Line: 176 ]]
	if not p1 then
		return
	end
	local SelectedTab = p1:FindFirstChild("SelectedTab")
	if SelectedTab then
		SelectedTab.Enabled = p2
	end
end
local function filterParentedItemValues(p1) --[[ filterParentedItemValues | Line: 190 ]]
	local t = {}
	for v1, v2 in p1 do
		if v2.Parent then
			table.insert(t, v2)
		end
	end
	return t
end
local function hasMultipleVariants(p1) --[[ hasMultipleVariants | Line: 202 ]]
	local t = {}
	for v1, v2 in p1 do
		if v2.Parent then
			table.insert(t, v2)
		end
	end
	return #t > 1
end
local function syncMultiDeleteToggleLabel() --[[ syncMultiDeleteToggleLabel | Line: 206 | Upvalues: MultiDelete (copy), v51 (ref) ]]
	MultiDelete.Visible = not v51
end
local function shouldExitMultiDeleteForSpecialMode() --[[ shouldExitMultiDeleteForSpecialMode | Line: 210 | Upvalues: v26 (copy), v28 (copy), v41 (copy) ]]
	return v26.IsGifting() or (v28.IsSeeding() or (if v41:get() == "FeedingTrough" then true else v41:get() == "Smelting"))
end
local function setActionsFrame(p1) --[[ setActionsFrame | Line: 217 | Upvalues: v45 (copy), v41 (copy), ContainerFrame (copy), v6 (copy) ]]
	if not (p1 and v45:get()) then
		ContainerFrame.Menu.Content.Info.Content.Buttons.Visible = false
		ContainerFrame.Menu.Content.FeedingTrough.Visible = false
		return
	end
	if v41:get() == "FeedingTrough" then
		ContainerFrame.Menu.Content.FeedingTrough.Visible = true
		ContainerFrame.Menu.Content.Info.Content.Buttons.Visible = false
		return
	end
	local v2 = v6.GetByName((v45:get()))
	ContainerFrame.Menu.Content.Info.Content.Buttons.Visible = v2.ToolType or (if v2.ItemType == "Chests" or (v2.ItemType == "StackableChests" or (v2.ItemType == "Seeds" or v2.ItemType == "Capsules")) then true else v2.ItemType == "ItemCapsules")
end
local function setEquipButtons() --[[ setEquipButtons | Line: 241 | Upvalues: v45 (copy), v6 (copy), v10 (copy), v38 (copy), t6 (copy) ]]
	local v1 = v45:get()
	if not v1 then
		return
	end
	local v2 = v6.GetByName(v1)
	if not v2 then
		return
	end
	if v2.ToolType then
		local v3 = v10:IsItemOnHotbar(v38, v1) and true or false
		for k, v in pairs(t6.Equip) do
			v.Visible = not v3
		end
		for k, v in pairs(t6.Unequip) do
			v.Visible = v3
		end
	else
		for k, v in pairs(t6.Equip) do
			v.Visible = false
		end
		for k, v in pairs(t6.Unequip) do
			v.Visible = false
		end
		for k, v in pairs(t6.Plant) do
			v.Visible = false
		end
	end
end
local function setEquipFrame(p1) --[[ setEquipFrame | Line: 276 | Upvalues: ContainerFrame (copy), t (copy), v50 (ref), v41 (copy), setActionsFrame (copy) ]]
	if p1 then
		ContainerFrame.Menu.Content.Info.Content.EquipFrame.Visible = true
		ContainerFrame.Menu.Content.Info.Content.Description.Visible = false
		ContainerFrame.Menu.Content.Info.Content.Stats.Visible = false
		ContainerFrame.Menu.Content.Info.Content.Buttons.Visible = false
		ContainerFrame.Menu.Content.FeedingTrough.Visible = false
		t.ShrinkOrExpandHUDHotbar = t.ShrinkOrExpandHUDHotbar
		t.ShrinkOrExpandHUDHotbar(v50)
		return
	end
	if v41:get() ~= "Smelting" then
		ContainerFrame.Menu.Content.Info.Content.Description.Visible = true
		ContainerFrame.Menu.Content.Info.Content.Stats.Visible = true
	end
	ContainerFrame.Menu.Content.Info.Content.EquipFrame.Visible = false
	setActionsFrame(true)
end
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 297 | Upvalues: v41 (copy), ContainerFrame (copy), setActionsFrame (copy) ]]
	if v41:get() ~= "Smelting" then
		ContainerFrame.Menu.Content.Info.Content.Description.Visible = true
		ContainerFrame.Menu.Content.Info.Content.Stats.Visible = true
	end
	ContainerFrame.Menu.Content.Info.Content.EquipFrame.Visible = false
	setActionsFrame(true)
	if p1 then
		ContainerFrame.Menu.Content.Info.Content.Visible = true
		ContainerFrame.Menu.Content.Info.NotSelected.Visible = false
		setActionsFrame(true)
	else
		ContainerFrame.Menu.Content.Info.Content.Visible = false
		ContainerFrame.Menu.Content.Info.NotSelected.Visible = true
		ContainerFrame.Menu.Content.Info.Content.Buttons.Visible = false
		ContainerFrame.Menu.Content.FeedingTrough.Visible = false
	end
end
local function setStorageCapacityLabel() --[[ setStorageCapacityLabel | Line: 311 | Upvalues: v38 (copy), ContainerFrame (copy), v13 (copy), PlayerGui (copy) ]]
	pcall(function() --[[ Line: 312 | Upvalues: v38 (ref), ContainerFrame (ref), v13 (ref), PlayerGui (ref) ]]
		local v1 = v38:GetItemLimit("Inventory")
		local v2 = v1.Get()
		local v3 = v1.GetLimit()
		ContainerFrame.Menu.Content.InventoryCapacity.Content.TextLabel.Text = v13.suffix(v2) .. "/" .. v13.suffix(v3)
		ContainerFrame.Menu.Content.MaxWarning.Visible = v3 <= v2
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
local function SetMultiSelectFrame() --[[ SetMultiSelectFrame | Line: 340 | Upvalues: ContainerFrame (copy), v51 (ref), v52 (ref), v53 (copy), MultiDelete (copy) ]]
	local Info = ContainerFrame.Menu.Content.Info
	if v51 then
		Info.MultiDelete.Visible = true
		if v52 then
			Info.Content.Visible = true
		else
			Info.Content.Visible = false
		end
		Info.NotSelected.Visible = false
	else
		v52 = false
		v53:DoCleaning()
		Info.MultiDelete.Visible = false
		Info.Content.Visible = false
		Info.NotSelected.Visible = true
	end
	MultiDelete.Visible = not v51
end
local function ExitMultiDeleteMode() --[[ ExitMultiDeleteMode | Line: 366 | Upvalues: v52 (ref), t7 (ref), v51 (ref), v53 (copy), SetMultiSelectFrame (copy), v54 (ref) ]]
	v52 = false
	for v1, v2 in t7 do
		if type(v2) == "table" and v2.Button then
			local Button = v2.Button
			if Button then
				local SelectedTab = Button:FindFirstChild("SelectedTab")
				if SelectedTab then
					SelectedTab.Enabled = false
				end
			end
		end
	end
	t7 = {}
	v51 = false
	v53:DoCleaning()
	SetMultiSelectFrame()
	if not v54 then
		return
	end
	v54()
end
local function SelectMultiItem(p1, p2, p3) --[[ SelectMultiItem | Line: 384 | Upvalues: v51 (ref), t7 (ref), v11 (copy), v12 (copy), v38 (copy), v13 (copy), v8 (copy), v7 (copy), ContainerFrame (copy), v53 (copy), v2 (copy) ]]
	if not v51 then
		return
	end
	if p1 == nil then
		t7 = {}
		return
	end
	if not (p2 and p3) then
		return
	end
	local v1 = p3.Name
	if p1.Deletelocked then
		v11.Notify({
			Message = "You can\'t delete this item!"
		})
	else
		local v22 = 1
		v12.Prompt({
			Type = "DeleteItems",
			Setup = function(p12, p2) --[[ Setup | Line: 411 | Upvalues: p1 (copy), v38 (ref), v13 (ref), v8 (ref), v22 (ref) ]]
				if p1.ItemType == "Equipment" or (p1.ItemType == "Flairs" or (p1.ItemType == "Chests" or p1.ItemType == "Seeds")) then
					p12.Content.IntValue.Visible = false
					p12.Content.IndexedValue.Visible = true
					return
				end
				local v1 = v38:GetItemValue(p1.Name)
				p12.Content.IntValue.OwnedLabel.Text = "You own x" .. v13.splice(if v1 then v1.Value else 1)
				p12.Content.IntValue.InputFrame.Content.TextBox.Text = ""
				p12.Content.IntValue.Visible = true
				p12.Content.IndexedValue.Visible = false
				local v3 = v8.CreateInputTextBox(p12.Content.IntValue.InputFrame.Content.TextBox, function(p1, p2, p3) --[[ Line: 434 | Upvalues: p12 (copy), v22 (ref), v13 (ref) ]]
					if not (p2 and #tostring(p2) > 0) then
						v22 = 0
						return
					end
					local v3 = math.min(p2, (tonumber(p12.Content.IntValue.OwnedLabel.Text:match("x(.+)") or "1")))
					v22 = v3
					if p3 then
						p12.Content.IntValue.InputFrame.Content.TextBox.Text = v13.splice(v3)
					else
						p12.Content.IntValue.InputFrame.Content.TextBox.Text = v3
					end
				end, true)
				if not (p2 and p2.Maid) then
					return
				end
				p2.Maid:GiveTask(v3)
			end,
			Run = function(p12) --[[ Run | Line: 462 | Upvalues: v13 (ref), v22 (ref), p1 (copy), t7 (ref), p3 (copy), v1 (copy), p2 (copy), v7 (ref), ContainerFrame (ref), v53 (ref), v2 (ref) ]]
				local v12 = if p12.Content.IntValue.Visible then tonumber((v13.PositiveIntegerMask(p12.Content.IntValue.InputFrame.Content.TextBox.Text))) or 1 else v22
				local v3 = if p1.ItemType == "Equipment" or p1.ItemType == "Flairs" then true else p1.ItemType == "EquipmentPalettes"
				if not v12 or v12 <= 0 then
					if not v3 then
						return false
					end
					v12 = 1
				end
				local v4 = false
				if p1.ItemType == "Equipment" or (p1.ItemType == "Flairs" or (p1.ItemType == "Chests" or p1.ItemType == "Seeds")) then
					for v5, v6 in t7 do
						local v8 = tonumber(v6.DataValue.Name)
						if v8 == tonumber(p3.Name) then
							warn("Dupe found", v6.DataValue.Name, p3.Name)
							v4 = true
							break
						end
					end
				end
				if v4 then
					return false
				end
				if t7[v1] then
					t7[v1].DeleteAmount = v12
					t7[v1].GridButton.AmountLabel.Text = "x" .. v12
				else
					t7[v1] = {
						ItemData = p1,
						DeleteAmount = v12,
						Button = p2,
						DataValue = p3
					}
					local v10 = v7.new({
						ForceVisible = true,
						Item = p1,
						DataValue = p3,
						ParentFrame = ContainerFrame.Menu.Content.Info.MultiDelete.Content,
						GetAmount = function() --[[ GetAmount | Line: 522 | Upvalues: p1 (ref), v12 (ref) ]]
							if p1.ItemType == "Equipment" or (p1.ItemType == "Flairs" or (p1.ItemType == "Chests" or p1.ItemType == "Seeds")) then
								return 1
							else
								return v12
							end
						end
					})
					t7[v1].GridButton = v10
					v53:GiveTask(v10)
					v53:GiveTask(v2.new(v10.Frame.DeleteItem, {
						Click = function() --[[ Click | Line: 541 | Upvalues: t7 (ref), v1 (ref), v10 (copy) ]]
							local v12 = t7[v1]
							t7[v1] = nil
							if v12 and v12.Button then
								local Button = v12.Button
								if Button then
									local SelectedTab = Button:FindFirstChild("SelectedTab")
									if SelectedTab then
										SelectedTab.Enabled = false
									end
								end
							end
							v10:Destroy()
						end
					}))
					v53:GiveTask(function() --[[ Line: 553 | Upvalues: p2 (ref) ]]
						local v1 = p2
						if not v1 then
							return
						end
						local SelectedTab = v1:FindFirstChild("SelectedTab")
						if SelectedTab then
							SelectedTab.Enabled = false
						end
					end)
				end
				local v11 = p2
				if not v11 then
					return true
				end
				local SelectedTab = v11:FindFirstChild("SelectedTab")
				if not SelectedTab then
					return true
				end
				SelectedTab.Enabled = true
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 562 ]]
				return true
			end
		})
	end
end
local v57 = v4.new()
local function v58() --[[ PredictCapsule | Line: 596 | Upvalues: v57 (copy), v15 (copy), v45 (copy), v6 (copy), v27 (copy), v38 (copy), v31 (copy), v58 (copy), PredictButton (copy), v16 (copy) ]]
	v57:DoCleaning()
	local v1, v2 = v15.GetRemoteFunction("PredictCapsuleRemote"):InvokeServer(v45:get())
	if v1 then
		local v3 = v6.GetByName(v45:get())
		local v4 = v27:_giveHorse(v38, v3, v1)
		v31:DisplaySlot({
			Type = "CapsuleBreeding",
			DestroySlot = true,
			MobileClickBackgroundToClose = true,
			ContinueIfType = true,
			ForceAdult = true,
			Slot = v4,
			OnContinue = v58
		})
		v57:GiveTask(v4)
		PredictButton.Top.AmountLabel.Text = "($" .. v3.Price .. ")"
	else
		v16.NotifyIssue(v2)
	end
end
local t8 = {
	Equip = function() --[[ Equip | Line: 625 | Upvalues: v30 (copy), ContainerFrame (copy), t (copy), v50 (ref), v38 (copy), v18 (copy) ]]
		if not v30.CanDoActionInTutorial("EquipInventoryAction") then
			return
		end
		ContainerFrame.Menu.Content.Info.Content.EquipFrame.Visible = true
		ContainerFrame.Menu.Content.Info.Content.Description.Visible = false
		ContainerFrame.Menu.Content.Info.Content.Stats.Visible = false
		ContainerFrame.Menu.Content.Info.Content.Buttons.Visible = false
		ContainerFrame.Menu.Content.FeedingTrough.Visible = false
		t.ShrinkOrExpandHUDHotbar = t.ShrinkOrExpandHUDHotbar
		t.ShrinkOrExpandHUDHotbar(v50)
		local Slots = ContainerFrame.Menu.Content.Info.Content.EquipFrame.Slots
		local v1 = nil
		if not v1 then
			for i = 1, 6 do
				if i <= 3 then
					if v50 then
						continue
					end
				elseif not v50 then
					continue
				end
				if not (#v38.HotbarData[tostring(i)].Value > 0) then
					v1 = Slots["Slot" .. i].Menu
					break
				end
			end
		end
		v18.SetGamepadSelection(if v1 then v1 else v50 and Slots.Slot4.Menu or Slots.Slot1.Menu)
	end,
	Unequip = function() --[[ Unequip | Line: 656 | Upvalues: v30 (copy), v10 (copy), v38 (copy), v45 (copy) ]]
		if not v30.CanDoActionInTutorial("UnequipInventoryAction") then
			return
		end
		local v1 = v10:IsItemOnHotbar(v38, v45:get())
		if v1 then
			v10:SetHotbarSlot(v1.Name)
		end
	end,
	Feed = function() --[[ Feed | Line: 670 | Upvalues: v25 (copy), v45 (copy) ]]
		v25.Open({
			Item = v45:get()
		})
	end,
	Use = function() --[[ Use | Line: 675 | Upvalues: v25 (copy), v45 (copy) ]]
		v25.Open({
			Item = v45:get()
		})
	end,
	Gift = function() --[[ Gift | Line: 681 | Upvalues: v45 (copy), v26 (copy), t (copy) ]]
		v26.GiftSignal:Fire((v45:get()))
		t.Close()
	end,
	Open = function() --[[ Open | Line: 687 | Upvalues: v45 (copy), v6 (copy), v38 (copy), v27 (copy), v16 (copy), v11 (copy), v23 (copy), v58 (copy), t (copy), v36 (copy) ]]
		local v1 = v45:get()
		local v2 = v6.GetByName(v1)
		if v2.ItemType == "Chests" then
			local t2 = {}
			for v3, v4 in v38:GetItemFolder("Chests"):GetChildren() do
				if v4.Value == v1 then
					table.insert(t2, v4)
				end
			end
			local v5 = table.unpack(t2)
			if not v5 then
				return
			end
			local v62 = v27.CanClaimChest(v38, v5.Name)
			if v62 ~= true then
				v16.NotifyIssue(v62)
				return
			end
			warn("Claiming chest", v1, v5.Name)
			if v27:ClaimChest(v38, v5.Name) == true then
				v11.Notify({
					Preset = "Green",
					Message = string.format("Successfully opened %s!", v23.GetDisplayName(v2.Name, v2))
				})
			end
		else
			if v2.ItemType == "Capsules" then
				local v7 = v27.CanClaimCapsule(v38, v1)
				if v7 == true then
					v58()
				else
					v16.NotifyIssue(v7)
				end
				return
			end
			if v2.ItemType == "ItemCapsules" then
				local v8 = v27.CanClaimItemCapsule(v38, v1)
				if v8 == true then
					t.Close()
					v36.PredictItems(v1)
				else
					v16.NotifyIssue(v8)
				end
				return
			end
			local v9 = v27.CanClaimStackableChest(v38, v45:get(), 1)
			if v9 ~= true then
				v16.NotifyIssue(v9)
				return
			end
			if v27:ClaimChest(v38, v45:get(), 1) ~= true then
				return
			end
			v11.Notify({
				Preset = "Green",
				Message = string.format("Successfully opened %s!", v23.GetDisplayName(v2.Name, v2))
			})
		end
	end,
	PurchaseStorage = function() --[[ PurchaseStorage | Line: 768 | Upvalues: v12 (copy), v6 (copy), v38 (copy), v13 (copy), v14 (copy), v17 (copy), v2 (copy), v15 (copy), v16 (copy) ]]
		v12.Prompt({
			Type = "UpgradeInventory",
			Setup = function(p1, p2) --[[ Setup | Line: 779 | Upvalues: v6 (ref), v38 (ref), v13 (ref), v14 (ref), v17 (ref), v2 (ref), v15 (ref) ]]
				local v1 = v6.GetInventorySlotPurchase(v38)
				if v1 then
					p1.Content.Label.Text = string.format("Increase Inventory Capacity by %s slots?", v13.suffix(v1.Amount))
					for k, v in pairs(v1.Stats) do
						p1.Content[k].TextLabel.Text = v13.suffix(v38:GetStatValue(k).Value) .. "/" .. v13.suffix(v) .. " " .. v14.separateWordsInString(k)
						p1.Content[k].Visible = true
					end
					p1.Content.Price.TextLabel.Text = v13.splice(v1.Price)
					p1.Content.Price.Visible = true
					p1.Content.Label.Visible = true
					p1.Content.MaxLabel.Visible = false
				else
					p1.Content.NodesHarvested.Visible = false
					p1.Content.Label.Visible = false
					p1.Content.Price.Visible = false
					p1.Content.MaxLabel.Visible = true
				end
				local function setRobuxPurchase() --[[ setRobuxPurchase | Line: 805 | Upvalues: v6 (ref), v38 (ref), v17 (ref), p1 (copy) ]]
					local v1 = v6.GetInventorySlotPurchase(v38, "Robux")
					if not v1 then
						p1.RobuxPurchase.Visible = false
						return
					end
					local v2 = v17.GetProductInfo(v1.ProductId, Enum.InfoType.Product)
					p1.RobuxPurchase.Content.RobuxLabel.Text = "\238\128\130" .. (if v2 then v2.PriceInRobux or "N/A" else "N/A")
					p1.RobuxPurchase.Content.Label.Text = "+" .. v1.Amount .. " Inventory Capacity"
					p1.RobuxPurchase.Visible = true
				end
				p2.Maid:GiveTask(v2.new(p1.RobuxPurchase.Content.BuyButton, {
					Click = function() --[[ Click | Line: 823 | Upvalues: v6 (ref), v38 (ref), v15 (ref) ]]
						if not v6.GetInventorySlotPurchase(v38, "Robux") then
							return
						end
						v15.GetRemoteFunction("PurchaseInventorySlotsRemote"):InvokeServer("Robux")
					end
				}))
				p2.Maid:GiveTask(v38.PlayerData.InventoryTiersPurchased.RobuxTiersPurchased:GetPropertyChangedSignal("Value"):Connect(setRobuxPurchase))
				setRobuxPurchase()
			end,
			Run = function() --[[ Run | Line: 838 | Upvalues: v6 (ref), v38 (ref), v16 (ref), v15 (ref) ]]
				local v1 = v6.GetInventorySlotPurchase(v38)
				if not v1 then
					return true
				end
				if v1.Stats then
					for k, v in pairs(v1.Stats) do
						if v38:GetStatValue(k).Value < v then
							return v16.NotifyIssue("NotEnoughStats")
						end
					end
				end
				if v1.Price and not v38:CanAfford(v1.Price, v1.Currency) then
					return v16.NotifyIssue("CantAffordInventoryUpgrade")
				else
					return v15.GetRemoteFunction("PurchaseInventorySlotsRemote"):InvokeServer()
				end
			end,
			Cancel = function() --[[ Cancel | Line: 860 ]]
				return true
			end
		})
	end,
	DeleteItem = function(p1) --[[ DeleteItem | Line: 865 | Upvalues: v30 (copy), v6 (copy), v11 (copy), v12 (copy), v49 (ref), v13 (copy), v38 (copy), v15 (copy) ]]
		if not v30.CanDoActionInTutorial("DeleteItemAction") then
			return
		end
		local v2 = v6.GetByName(if p1:IsA("StringValue") then p1.Value else p1.Name)
		if v2.Deletelocked then
			v11.Notify({
				Message = "You can\'t delete this item!"
			})
		else
			v12.Prompt({
				Type = "DeleteItems",
				Setup = function(p1) --[[ Setup | Line: 882 | Upvalues: v2 (copy), v49 (ref), v13 (ref), v38 (ref) ]]
					if v2.ItemType == "Equipment" or (v2.ItemType == "Flairs" or (v2.ItemType == "Chests" or v2.ItemType == "Seeds")) then
						p1.Content.IntValue.Visible = false
						p1.Content.IndexedValue.Visible = true
					else
						v49 = 1
						p1.Content.IntValue.OwnedLabel.Text = "You own x" .. v13.splice(v38:GetItemValue(v2.Name).Value)
						p1.Content.IntValue.InputFrame.Content.TextBox.Text = ""
						p1.Content.IntValue.Visible = true
						p1.Content.IndexedValue.Visible = false
					end
				end,
				Run = function(p12) --[[ Run | Line: 900 | Upvalues: v2 (copy), v15 (ref), p1 (copy), v49 (ref) ]]
					if v2.ItemType == "Equipment" or v2.ItemType == "Flairs" then
						v15.GetRemoteFunction("DeleteEquipmentRemote"):InvokeServer(p1.Name)
					elseif v2.ItemType == "Chests" then
						v15.GetRemoteEvent("DeleteChest"):FireServer(p1.Name)
					elseif v2.ItemType == "Seeds" then
						v15.GetRemoteEvent("DeleteSeed"):FireServer(p1.Name)
					else
						local v1 = v49
						if v1 <= 0 then
							v1 = 1
						end
						v15.GetRemoteEvent("DeleteItem"):FireServer(p1.Name, v1)
					end
					v49 = 1
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 917 | Upvalues: v49 (ref) ]]
					v49 = 1
					return true
				end
			})
		end
	end,
	Plant = function() --[[ Plant | Line: 924 | Upvalues: v28 (copy), v38 (copy), v45 (copy), t6 (copy) ]]
		if v28.IsSeeding() then
			local v1 = v38:GetItemFolder("Seeds")
			local v2 = v45:get()
			local v3 = nil
			for v4, v5 in v1:GetChildren() do
				if v5.Value == v2 then
					v3 = v5
					break
				end
			end
			if not v3 then
				return
			end
			v28.PlantSeed(v3)
		end
		for v6, v7 in t6.Plant do
			v7.Visible = false
		end
	end,
	AddButton = function() --[[ AddButton | Line: 952 | Upvalues: v45 (copy), v38 (copy), v56 (ref), t6 (copy), v6 (copy), v55 (ref), ContainerFrame (copy), v14 (copy), v29 (copy) ]]
		if not v45:get() then
			return
		end
		local v1 = v38:GetItemValue(v45:get())
		if not v1 then
			return
		end
		if not (v56 < v1.Value) then
			return
		end
		v56 = v56 + 1
		for v2, v3 in t6.SmeltButton do
			v3.Top.TextLabel.Text = "SMELT (" .. v56 .. ")"
		end
		local v4 = v6.GetByName(v45:get())
		ContainerFrame.Menu.Content.Info.Content.SmeltOutputLabel.Text = string.format("You will receive %d %s", math.floor(v56 / v55.Building.Data.InputAmount), v14.separateWordsInString(v55.OutputItems[v4.Rarity.Name]), v14.separateWordsInString(v4.Name))
		ContainerFrame.Menu.Content.Info.Content.SmeltTimeLabel.Text = if v56 == 0 then "0s" else v29.FormatHMS(v55.ProccessTime * math.ceil(v56 / 3)) or "0s"
	end,
	RemoveButton = function() --[[ RemoveButton | Line: 985 | Upvalues: v45 (copy), v56 (ref), t6 (copy), v6 (copy), v55 (ref), ContainerFrame (copy), v14 (copy), v29 (copy) ]]
		if not v45:get() then
			return
		end
		if not (v56 > 0) then
			return
		end
		v56 = v56 - 1
		for v1, v2 in t6.SmeltButton do
			v2.Top.TextLabel.Text = "MAKE (" .. v56 .. ")"
		end
		local v3 = v6.GetByName(v45:get())
		ContainerFrame.Menu.Content.Info.Content.SmeltOutputLabel.Text = string.format("You will receive %d %s", math.floor(v56 / v55.Building.Data.InputAmount), v14.separateWordsInString(v55.OutputItems[v3.Rarity.Name]), v14.separateWordsInString(v3.Name))
		ContainerFrame.Menu.Content.Info.Content.SmeltTimeLabel.Text = if v56 == 0 then "0s" else v29.FormatHMS(v55.ProccessTime * math.ceil(v56 / 3)) or "0s"
	end,
	SmeltButton = function() --[[ SmeltButton | Line: 1013 | Upvalues: v56 (ref), v45 (copy), v55 (ref), t6 (copy) ]]
		if v56 <= 0 then
			return
		end
		if not v45:get() then
			return
		end
		if not v55 then
			return
		end
		v55:AddItem(v45:get(), v56)
		v56 = 0
		for v1, v2 in t6.SmeltButton do
			v2.Top.TextLabel.Text = "MAKE (" .. v56 .. ")"
		end
	end
}
local v59 = nil
local function selectItem(p1) --[[ selectItem | Line: 1034 | Upvalues: v26 (copy), v28 (copy), v48 (copy), v51 (ref), v41 (copy), ExitMultiDeleteMode (copy), ContainerFrame (copy), v6 (copy), t4 (copy), v38 (copy), v9 (copy), t (copy), v2 (copy), isIndexedEquipmentEquipped (copy), t8 (copy), v34 (copy), v11 (copy), v59 (ref), v52 (ref), SetMultiSelectFrame (copy), SelectMultiItem (copy), t6 (copy), v55 (ref), v4 (copy), Sonar (copy), v56 (ref), v45 (copy), v14 (copy), v29 (copy), v25 (copy), setEquipButtons (copy), setActionsFrame (copy) ]]
	local v1 = v26.IsGifting()
	local v22 = v28.IsSeeding()
	v48:DoCleaning()
	if v51 and (v26.IsGifting() or (v28.IsSeeding() or (if v41:get() == "FeedingTrough" then true else v41:get() == "Smelting"))) then
		ExitMultiDeleteMode()
	end
	if not p1 then
		return
	end
	ContainerFrame.Menu.Content.Info.Content.SmeltTimeLabel.Visible = false
	ContainerFrame.Menu.Content.Info.Content.SmeltOutputLabel.Visible = false
	local v42 = v6.GetByName(p1)
	local t2 = {}
	for v5, v62 in t4 do
		local ItemTypes = v62.ItemTypes
		if ItemTypes then
			for v7, v8 in ItemTypes do
				local v92 = v38:GetItemFolder(v8)
				if v92 then
					for v10, v112 in v92:GetChildren() do
						if (if v112:IsA("StringValue") then v112.Value else v112.Name) == p1 then
							table.insert(t2, v112)
						end
					end
				end
			end
		end
	end
	local v13 = table.unpack(t2)
	if not v13 then
		return
	end
	if v51 then
		local t3 = {}
		for v142, v15 in t2 do
			if v15.Parent then
				table.insert(t3, v15)
			end
		end
		if #t3 == 0 then
			return
		end
		if #t3 > 1 then
			v11.Notify({
				Message = "This item has multiple variants and can\'t be selected in Multi Delete."
			})
			return
		end
		local v16 = v59
		if not v16 then
			return
		end
		local function commitMultiDeleteWithValue(p1) --[[ commitMultiDeleteWithValue | Line: 1262 | Upvalues: v52 (ref), v48 (ref), SetMultiSelectFrame (ref), SelectMultiItem (ref), v42 (copy), v16 (copy) ]]
			v52 = false
			v48:DoCleaning()
			SetMultiSelectFrame()
			SelectMultiItem(v42, v16, p1)
		end
		v52 = false
		v48:DoCleaning()
		SetMultiSelectFrame()
		SelectMultiItem(v42, v16, t3[1])
	else
		local v18 = ContainerFrame.Menu.Content.Info.Content
		local t3 = {
			DisregardTheme = true,
			Item = v42,
			DataValue = v13
		}
		t3.DisregardStats = v42.ItemType == "Equipment"
		t3.Frame = v18
		t3.Values = t2
		function t3.OnAmountReachedZero() --[[ OnAmountReachedZero | Line: 1096 | Upvalues: t (ref) ]]
			t.ResetSelection()
		end
		v48:GiveTask(v9.new(t3))
		for v21, v222 in v18.Variants.Content.ScrollingFrame:GetChildren() do
			if v222:IsA("GuiObject") and v222.Visible then
				local v23 = v222.Name
				local DeleteItem = v222:FindFirstChild("DeleteItem")
				if not DeleteItem then
					local Container = v222:FindFirstChild("Container")
					if Container then
						DeleteItem = Container:FindFirstChild("DeleteItem")
					end
				end
				if DeleteItem then
					v48:GiveTask(v2.new(DeleteItem, {
						Click = function() --[[ Click | Line: 1125 | Upvalues: t2 (copy), v23 (copy), isIndexedEquipmentEquipped (ref), t8 (ref) ]]
							local v1 = nil
							local v2 = nil
							for v3, v4 in t2 do
								if v4.Parent then
									local Theme = v4:FindFirstChild("Theme")
									local v5 = if Theme then Theme.Value else ""
									if v5 == "" then
										v5 = "Default"
									end
									if v5 == v23 and isIndexedEquipmentEquipped(v4.Name) then
										if not v2 then
											v2 = v4
										end
									elseif v5 == v23 then
										v1 = v4
										break
									end
								end
							end
							if not v1 then
								v1 = v2
							end
							if v1 then
								t8.DeleteItem(v1)
							end
						end
					}))
				end
			end
		end
		local v24 = v48:GiveTask(v34.new(0))
		for v252, v262 in t2 do
			local v27 = v48:GiveTask(v34.new(0))
			v48:GiveTask(v27:subscribe(function() --[[ Line: 1171 | Upvalues: t2 (copy), v24 (copy) ]]
				local v1 = 0
				for v2, v3 in t2 do
					if v3.Parent then
						v1 = if v3:IsA("IntValue") then v1 + v3.Value else v1 + 1
					end
				end
				v24:set(v1)
			end))
			v48:GiveTask(v262:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 1189 | Upvalues: v27 (copy) ]]
				v27:set(v27:get() + 1)
			end))
			v48:GiveTask(v262:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1193 | Upvalues: v27 (copy) ]]
				v27:set(v27:get() + 1)
			end))
		end
		local v282 = 0
		for v292, v30 in t2 do
			if v30.Parent then
				v282 = if v30:IsA("IntValue") then v282 + v30.Value else v282 + 1
			end
		end
		v24:set(v282)
		v48:GiveTask(v24:subscribe(function(p1) --[[ Line: 1211 | Upvalues: t (ref) ]]
			if not (p1 > 0) then
				t.ResetSelection()
			end
		end))
		v18.DeleteItem.Visible = if v42.ItemType == "Equipment" then false else true
		v48:GiveTask(v2.new(v18.DeleteItem, {
			Click = function() --[[ Click | Line: 1222 | Upvalues: t2 (copy), t8 (ref) ]]
				local v1 = nil
				for v2, v3 in t2 do
					if v3.Parent then
						v1 = v3
						break
					end
				end
				if v1 then
					t8.DeleteItem(v1)
				end
			end
		}))
	end
	for v32, v33 in t6 do
		for v342, v35 in v33 do
			v35.Visible = false
		end
	end
	ContainerFrame.Menu.Content.FeedingTrough.Visible = false
	if v42.EventIcon then
		ContainerFrame.Menu.Content.Info.Content.EventIcon.Image = v42.EventIcon
		ContainerFrame.Menu.Content.Info.Content.EventIcon.Visible = true
	else
		ContainerFrame.Menu.Content.Info.Content.EventIcon.Visible = false
	end
	if v1 then
		for v36, v37 in t6.Gift do
			v37.Visible = true
		end
	elseif v22 then
		if v42.ItemType == "Seeds" then
			for v382, v39 in t6.Plant do
				v39.Visible = true
			end
		end
	elseif v41:get() == "FeedingTrough" then
		warn("Feeding Trough")
		ContainerFrame.Menu.Content.FeedingTrough.Visible = true
		for v40, v412 in v55.InteractionData.Items:GetChildren() do
			local v422 = v4.new()
			local v43 = ContainerFrame.Menu.Content.FeedingTrough[v412.Name]
			v48:GiveTask(v422)
			v48:GiveTask(v2.new(v43.RemoveButton, {
				Click = function() --[[ Click | Line: 1307 | Upvalues: v55 (ref), v43 (copy) ]]
					v55:RemoveFood(v43.Name)
				end
			}))
			v48:GiveTask(v2.new(v43, {
				Click = function() --[[ Click | Line: 1312 | Upvalues: v55 (ref), p1 (copy), v42 (copy), v43 (copy) ]]
					v55:AddFood({
						Name = p1,
						ItemType = v42.ItemType,
						Slot = v43.Name
					})
				end
			}))
			local function createOrRemoveItem() --[[ createOrRemoveItem | Line: 1321 | Upvalues: v422 (copy), v6 (ref), v412 (copy), v38 (ref), v43 (copy), Sonar (ref) ]]
				v422:DoCleaning()
				local v1 = v6.GetByName(v412.Value)
				if v1 then
					local v2 = v38:GetItemValueAny(v412.Value)
					v43.RemoveButton.Visible = true
					v43.Title.Visible = false
					v422:GiveTask(Sonar("ItemGridButton").new({
						DoNotClone = true,
						IgnoreBackgroundColor = true,
						Item = v1,
						GuiObject = v43.Viewport,
						ViewportFrame = v43.Viewport,
						DataValue = v2,
						AmountColors = {
							None = Color3.fromRGB(255, 94, 97),
							Default = Color3.fromRGB(255, 255, 255)
						}
					}))
					v43.Viewport.Visible = true
				else
					v43.Viewport.Visible = false
					v43.RemoveButton.Visible = false
					v43.Title.Visible = true
				end
			end
			v48:GiveTask(v412:GetPropertyChangedSignal("Value"):Connect(createOrRemoveItem))
			createOrRemoveItem()
		end
	elseif v41:get() == "Smelting" then
		v56 = 0
		ContainerFrame.Menu.Content.Info.Content.Stats.Visible = false
		ContainerFrame.Menu.Content.Info.Content.Description.Visible = false
		ContainerFrame.Menu.Content.Info.Content.SmeltTimeLabel.Visible = true
		ContainerFrame.Menu.Content.Info.Content.SmeltOutputLabel.Visible = true
		local v44 = v6.GetByName(v45:get())
		ContainerFrame.Menu.Content.Info.Content.SmeltOutputLabel.Text = string.format("You will receive %d %s", math.floor(v56 / v55.Building.Data.InputAmount), v14.separateWordsInString(v55.OutputItems[v44.Rarity.Name]), v14.separateWordsInString(v44.Name))
		ContainerFrame.Menu.Content.Info.Content.SmeltTimeLabel.Text = if v56 == 0 then "0s" else v29.FormatHMS(v55.ProccessTime * math.ceil(v56 / 3)) or "0s"
		for v49, v50 in t6.SmeltButton do
			v50.Top.TextLabel.Text = "MAKE (" .. v56 .. ")"
		end
		for v512, v522 in { "AddButton", "RemoveButton", "SmeltButton" } do
			for v53, v54 in t6[v522] do
				v54.Visible = true
			end
		end
	else
		local v552 = false
		for v562, v57 in t6.Gift do
			v57.Visible = false
		end
		for v58, v592 in t6.Use do
			v592.Visible = v42.ConsumableType and (if v42.ItemType == "Food" then false else true)
			if v592.Visible then
				v552 = true
			end
		end
		for v61, v62 in t6.Feed do
			v62.Visible = v42.ConsumableType and (if v42.ItemType == "Food" then true else false)
			if v62.Visible then
				v552 = true
			end
		end
		for v64, v65 in t6.Open do
			v65.Visible = if v42.ItemType == "Chests" or (v42.ItemType == "StackableChests" or v42.ItemType == "Capsules") then true elseif v42.ItemType == "ItemCapsules" then true else false
			if v42.ItemType == "Capsules" or v42.ItemType == "ItemCapsules" then
				v65.Top.TextLabel.Text = "OPEN ($" .. v42.Price .. ")"
				continue
			end
			v65.Top.TextLabel.Text = "OPEN"
		end
		if v552 and v25.IsOpen() then
			v25.Open({
				Item = v45:get()
			})
		end
		v48:GiveTask(v38.HotbarChangedSignal:Connect(setEquipButtons))
		v48:GiveTask(task.defer(function() --[[ Line: 1428 | Upvalues: setEquipButtons (ref) ]]
			setEquipButtons()
		end))
	end
	if v51 then
		return
	end
	if v41:get() ~= "Smelting" then
		ContainerFrame.Menu.Content.Info.Content.Description.Visible = true
		ContainerFrame.Menu.Content.Info.Content.Stats.Visible = true
	end
	ContainerFrame.Menu.Content.Info.Content.EquipFrame.Visible = false
	setActionsFrame(true)
	ContainerFrame.Menu.Content.Info.Content.Visible = true
	ContainerFrame.Menu.Content.Info.NotSelected.Visible = false
	setActionsFrame(true)
	v48:GiveTask(function() --[[ Line: 1436 | Upvalues: v41 (ref), ContainerFrame (ref), setActionsFrame (ref) ]]
		if v41:get() ~= "Smelting" then
			ContainerFrame.Menu.Content.Info.Content.Description.Visible = true
			ContainerFrame.Menu.Content.Info.Content.Stats.Visible = true
		end
		ContainerFrame.Menu.Content.Info.Content.EquipFrame.Visible = false
		setActionsFrame(true)
		ContainerFrame.Menu.Content.Info.Content.Visible = false
		ContainerFrame.Menu.Content.Info.NotSelected.Visible = true
		ContainerFrame.Menu.Content.Info.Content.Buttons.Visible = false
		ContainerFrame.Menu.Content.FeedingTrough.Visible = false
	end)
end
function t.OnOpen(p1) --[[ OnOpen | Line: 1442 | Upvalues: v3 (copy), ContainerFrame (copy), t (copy), t6 (copy), v2 (copy), t8 (copy), v30 (copy), MultiDelete (copy), v37 (copy), v51 (ref), v26 (copy), v28 (copy), v41 (copy), v11 (copy), ExitMultiDeleteMode (copy), v52 (ref), SetMultiSelectFrame (copy), v54 (ref), v34 (copy), t2 (copy), v44 (copy), v42 (copy), v43 (copy), t3 (copy), v12 (copy), v8 (copy), v45 (copy), v38 (copy), v49 (ref), v13 (copy), v50 (ref), v10 (copy), v4 (copy), v6 (copy), v9 (copy), v5 (copy), setActionsFrame (copy), PlayerGui (copy), v33 (copy), v59 (ref), selectItem (copy), v1 (copy), v23 (copy), v47 (copy), v32 (copy), v40 (ref), v46 (copy), t4 (copy) ]]
	local v14 = v3.getFrameFromInstance(ContainerFrame)
	if not v14.Opened then
		t.ResetSelection()
		v14.Opened = true
		for k, v in pairs(ContainerFrame.Menu.Content.Info.Content.Buttons:GetChildren()) do
			if v:IsA("ImageButton") then
				if not t6[v.Name] then
					t6[v.Name] = {}
				end
				table.insert(t6[v.Name], v)
				v2.new(v, {
					Click = t8[v.Name]
				})
			end
		end
		local function setDeleteActionButtons() --[[ setDeleteActionButtons | Line: 1464 | Upvalues: v30 (ref), MultiDelete (ref) ]]
			local v1 = v30.GetGameState("DeleteItemAction")
			local v2 = MultiDelete and MultiDelete:FindFirstChild("InactiveFrame", true)
			if not v2 then
				return
			end
			v2.Visible = not v1
		end
		v37.GameStateChangedSignal:Connect(setDeleteActionButtons)
		local v35 = v30.GetGameState("DeleteItemAction")
		local v48 = MultiDelete and MultiDelete:FindFirstChild("InactiveFrame", true)
		if v48 then
			v48.Visible = not v35
		end
		local function setUnequipActionButtons() --[[ setUnequipActionButtons | Line: 1475 | Upvalues: t6 (ref), v30 (ref) ]]
			for v1, v2 in t6.Unequip do
				v2.InactiveFrame.Visible = not v30.GetGameState("UnequipInventoryAction")
			end
		end
		v37.GameStateChangedSignal:Connect(setUnequipActionButtons)
		setUnequipActionButtons()
		local function setEquipActionButtons() --[[ setEquipActionButtons | Line: 1483 | Upvalues: t6 (ref), v30 (ref) ]]
			for v1, v2 in t6.Equip do
				v2.InactiveFrame.Visible = not v30.GetGameState("EquipInventoryAction")
			end
		end
		v37.GameStateChangedSignal:Connect(setEquipActionButtons)
		setEquipActionButtons()
		MultiDelete.Visible = not v51
		v2.new(MultiDelete, {
			Click = function() --[[ Click | Line: 1493 | Upvalues: v30 (ref), v26 (ref), v28 (ref), v41 (ref), v11 (ref), v51 (ref), ExitMultiDeleteMode (ref), t (ref), v52 (ref), SetMultiSelectFrame (ref), v54 (ref) ]]
				if not v30.CanDoActionInTutorial("DeleteItemAction") then
					return
				end
				if v26.IsGifting() or (v28.IsSeeding() or (if v41:get() == "FeedingTrough" then true else v41:get() == "Smelting")) then
					v11.Notify({
						Message = "You can\'t use this right now!"
					})
					return
				end
				if v51 then
					ExitMultiDeleteMode()
					t.ResetSelection()
					return
				end
				v51 = true
				v52 = false
				t.ResetSelection()
				SetMultiSelectFrame()
				v11.Notify({
					Message = "Multi Delete enabled (items with variants are hidden)"
				})
				if not v54 then
					return
				end
				v54()
			end
		})
		local SortOptions = ContainerFrame.Menu.Content.SortOptions
		local v53 = v34.new(false)
		local SortFilters = SortOptions:FindFirstChild("SortFilters")
		local ItemType = SortOptions:FindFirstChild("ItemType")
		local function setupSortItemDropdowns() --[[ setupSortItemDropdowns | Line: 1534 | Upvalues: ItemType (copy), t2 (ref), v2 (ref), v44 (ref), v53 (copy) ]]
			local Dropdown = ItemType:FindFirstChild("Dropdown")
			local Template = Dropdown:FindFirstChild("Template")
			for v1, v22 in next, t2 do
				local v3 = Template:Clone()
				v3.Name = v22
				v3.LayoutOrder = v1
				local DisplayLabel = v3:FindFirstChild("DisplayLabel")
				DisplayLabel.Text = if v22 == "Resources" then "Materials" else v22
				v3.Visible = true
				v3.Parent = Dropdown
				v2.new(v3, {
					Click = function() --[[ Click | Line: 1548 | Upvalues: v44 (ref), v22 (copy), v53 (ref) ]]
						v44:set(v22)
						v53:set(false)
					end
				})
			end
			local function onIsDropdownOpenChanged() --[[ onIsDropdownOpenChanged | Line: 1555 | Upvalues: Dropdown (copy), v53 (ref) ]]
				Dropdown.Visible = v53:get()
			end
			Dropdown.Visible = v53:get()
			v44:set(t2[1])
			v53:subscribe(onIsDropdownOpenChanged)
		end
		local function setupSortFilters() --[[ setupSortFilters | Line: 1563 | Upvalues: SortFilters (copy), v42 (ref), v43 (ref), v2 (ref), t3 (ref) ]]
			local DisplayLabel = SortFilters:FindFirstChild("SortDisplay"):FindFirstChild("Container"):FindFirstChild("DisplayLabel")
			local Icon = SortFilters:FindFirstChild("SortDirection"):FindFirstChild("Top"):FindFirstChild("Icon")
			local function onSortFilterChanged() --[[ onSortFilterChanged | Line: 1566 | Upvalues: DisplayLabel (copy), v42 (ref) ]]
				DisplayLabel.Text = ("By %*"):format((v42:get()))
			end
			local function onIsSortAscendingChanged() --[[ onIsSortAscendingChanged | Line: 1569 | Upvalues: Icon (copy), v43 (ref) ]]
				Icon.Image = if v43:get() then "rbxassetid://105090227455606" else "rbxassetid://92236593875345"
			end
			v2.new(SortFilters:FindFirstChild("SortDisplay"):FindFirstChild("Button"), {
				IgnoreUIScale = true,
				Click = function() --[[ Click | Line: 1575 | Upvalues: v42 (ref), t3 (ref) ]]
					v42:set(t3[(table.find(t3, (v42:get())) or 0) + 1] or t3[1])
				end
			})
			v2.new(SortFilters:FindFirstChild("SortDirection"), {
				Click = function() --[[ Click | Line: 1582 | Upvalues: v43 (ref) ]]
					v43:set(not v43:get())
				end
			})
			DisplayLabel.Text = ("By %*"):format((v42:get()))
			Icon.Image = if v43:get() then "rbxassetid://105090227455606" else "rbxassetid://92236593875345"
			v42:subscribe(onSortFilterChanged)
			v43:subscribe(onIsSortAscendingChanged)
		end
		local function setupItemTypeFrame() --[[ setupItemTypeFrame | Line: 1592 | Upvalues: ItemType (copy), v44 (ref), v2 (ref), v53 (copy) ]]
			local DisplayLabel = ItemType:FindFirstChild("Top"):FindFirstChild("DisplayLabel")
			local function onSelectedTabChanged() --[[ onSelectedTabChanged | Line: 1594 | Upvalues: v44 (ref), DisplayLabel (copy) ]]
				local v1 = v44:get()
				DisplayLabel.Text = if v1 == "Resources" then "Materials" else v1
			end
			v2.new(ItemType, {
				IgnoreUIScale = true,
				Click = function() --[[ Click | Line: 1600 | Upvalues: v53 (ref) ]]
					v53:set(not v53:get())
				end
			})
			local v1 = v44:get()
			DisplayLabel.Text = if v1 == "Resources" then "Materials" else v1
			v44:subscribe(onSelectedTabChanged)
		end
		setupSortFilters()
		setupItemTypeFrame()
		setupSortItemDropdowns()
		local v62 = v12.GetPromptFrame("DeleteItems")
		v8.CreateInputTextBox(v62.Content.IntValue.InputFrame.Content.TextBox, function(p1, p2, p3) --[[ Line: 1616 | Upvalues: v51 (ref), v45 (ref), v38 (ref), v49 (ref), v62 (copy), v13 (ref) ]]
			if v51 then
				return
			end
			if not (p2 and #tostring(p2) > 0) then
				v49 = 1
				return
			end
			local v1 = v45:get()
			if not v1 then
				return
			end
			local v2 = v38:GetItemValue(v1)
			if not v2 then
				v49 = tonumber(p2) or 1
				return
			end
			local v3 = v38:GetAmountToUse(v2, p2)
			v49 = v3
			if p3 then
				v62.Content.IntValue.InputFrame.Content.TextBox.Text = v13.splice(v3)
			else
				v62.Content.IntValue.InputFrame.Content.TextBox.Text = v3
			end
		end, true)
		v2.new(ContainerFrame.Menu.Content.InventoryCapacity.Button, {
			Click = t8.PurchaseStorage
		})
		local t5 = {}
		local t7 = {}
		local function shrinkOrExpandHotbar(p1, p2) --[[ shrinkOrExpandHotbar | Line: 1653 | Upvalues: v50 (ref), t (ref), t5 (copy), v10 (ref), v38 (ref), t7 (copy) ]]
			v50 = if p1 == nil then not v50 else p1
			if not p2 then
				t.ShrinkOrExpandHUDHotbar(v50)
			end
			for k, v in pairs(t5) do
				local v1
				v1 = if v50 and k > 3 then true else not v50 and (if k <= 3 then true else false)
				v.Visible = v1
			end
			if v10:HasExtraHotbarSlots(v38) then
				for k, v in pairs(t7) do
					v.Visible = v.Name == "Shrink" and v50 or (if v.Name == "Expand" then not v50 else false)
				end
			else
				for k, v in pairs(t7) do
					v.Visible = false
				end
			end
		end
		for i = 1, 6 do
			local v7 = ContainerFrame.Menu.Content.Info.Content.EquipFrame.Slots["Slot" .. i]
			local v82 = v38.HotbarData[tostring(i)]
			local v92 = nil
			local v102 = v4.new()
			local function setTool() --[[ setTool | Line: 1688 | Upvalues: v102 (copy), v92 (ref), v6 (ref), v82 (copy), v9 (ref), v38 (ref), v7 (copy) ]]
				v102:DoCleaning()
				v92 = v6.GetByName(v82.Value)
				if v92 then
					v102:GiveTask(v9.new({
						Item = v92,
						DataValue = v38:GetItemValueAny(v92.Name),
						Frame = v7.Menu.Content
					}))
					v7.Menu.Content.Viewport.Visible = true
					v7.Menu.Content.NameLabel.Visible = true
					v7.Menu.Content.UnboundIcon.Visible = false
				else
					v7.Menu.Content.Viewport.Visible = false
					v7.Menu.Content.NameLabel.Visible = false
					v7.Menu.Content.UnboundIcon.Visible = true
				end
			end
			v82:GetPropertyChangedSignal("Value"):Connect(setTool)
			setTool()
			local function setLocked() --[[ setLocked | Line: 1711 | Upvalues: v7 (copy), v10 (ref), v38 (ref), i (copy) ]]
				v7:FindFirstChild("Locked", true).Visible = not v10:IsHotbarSlotUnlocked(v38, i)
			end
			v38.PlayerData.ExtraHotbarSlots:GetPropertyChangedSignal("Value"):Connect(setLocked)
			v7:FindFirstChild("Locked", true).Visible = not v10:IsHotbarSlotUnlocked(v38, i)
			v5.new(v7.Menu, {
				NoHoverShadowLabel = true,
				NoHoverColor = true,
				HoverUpLabel = v7.Menu.Content.Viewport,
				Click = function() --[[ Click | Line: 1722 | Upvalues: v45 (ref), v10 (ref), v82 (copy), v41 (ref), ContainerFrame (ref), setActionsFrame (ref) ]]
					if not v10:SetHotbarSlot(v82.Name, (v45:get())) then
						return
					end
					if v41:get() ~= "Smelting" then
						ContainerFrame.Menu.Content.Info.Content.Description.Visible = true
						ContainerFrame.Menu.Content.Info.Content.Stats.Visible = true
					end
					ContainerFrame.Menu.Content.Info.Content.EquipFrame.Visible = false
					setActionsFrame(true)
				end
			})
			t5[i] = v7
			for k, v in pairs(PlayerGui.HUDGui.BottomFrame:GetChildren()) do
				local v112 = v.Bottom:FindFirstChild("Slot" .. i)
				v5:RegisterClick(v112.Menu:IsA("ImageButton") and v112.Menu or v112, function() --[[ Line: 1737 | Upvalues: t (ref), v10 (ref), v82 (copy), v45 (ref), v41 (ref), ContainerFrame (ref), setActionsFrame (ref) ]]
					if not t.IsSelectingHotbarSlot() then
						return
					end
					if not v10:SetHotbarSlot(v82.Name, v45:get()) then
						return
					end
					if v41:get() ~= "Smelting" then
						ContainerFrame.Menu.Content.Info.Content.Description.Visible = true
						ContainerFrame.Menu.Content.Info.Content.Stats.Visible = true
					end
					ContainerFrame.Menu.Content.Info.Content.EquipFrame.Visible = false
					setActionsFrame(true)
				end)
			end
		end
		v38.PlayerData.ExtraHotbarSlots:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1748 | Upvalues: shrinkOrExpandHotbar (copy) ]]
			shrinkOrExpandHotbar(false, true)
		end)
		for k, v in pairs({ "Shrink", "Expand" }) do
			local v142 = ContainerFrame.Menu.Content.Info.Content.EquipFrame:FindFirstChild(v)
			if v142 then
				v2.new(v142, {
					Click = function() --[[ Click | Line: 1756 | Upvalues: shrinkOrExpandHotbar (copy), v (copy) ]]
						shrinkOrExpandHotbar(v == "Expand")
					end
				})
				table.insert(t7, v142)
			end
		end
		shrinkOrExpandHotbar(false, true)
	end
	if not v14.ContentsLoaded then
		v14.ContentsLoaded = true
		local v15 = v33.IsMobileInputType()
		local Items = ContainerFrame.Menu.Content.Items
		Items.Content.Visible = v15 == false
		Items.ContentMobile.Visible = v15 == true
		local v21 = (if v15 then Items:FindFirstChild("ContentMobile") else nil) or Items.Content
		v21.Default.Visible = false
		v21.Visible = true
		local Default = v21.Default
		Default.Visible = false
		local function reify(p1, p2, p3, p4) --[[ reify | Line: 1787 | Upvalues: v5 (ref), v59 (ref), v51 (ref), v45 (ref), selectItem (ref), v1 (ref), v34 (ref), v10 (ref), v38 (ref), v23 (ref) ]]
			p2.Maid:DoCleaning()
			if not p4 then
				return
			end
			local v12 = p2.ItemData.Name
			p1.Name = v12
			p2.Maid:GiveTask(v5.new(p1, {
				Click = function() --[[ Click | Line: 1801 | Upvalues: v59 (ref), p1 (copy), v51 (ref), v45 (ref), selectItem (ref), v12 (copy) ]]
					v59 = p1
					if v51 then
						v45:set(nil)
					else
						v45:set(v12)
					end
					selectItem(v12)
				end
			}))
			p2.Maid:GiveTask(v1:Create({
				Viewport = p1.Content.Viewport,
				Item = p2.ItemData
			}))
			local OwnedLabel = p1.Content.Viewport.OwnedLabel
			local HotbarLabel = p1.Content.HotbarLabel
			local v2 = p2.Maid:GiveTask(v34.new(v10:IsItemOnHotbar(v38, p2.ItemData.Name)))
			p2.Maid:GiveTask(v38.HotbarChangedSignal:Connect(function() --[[ Line: 1824 | Upvalues: v2 (copy), v10 (ref), v38 (ref), p2 (copy) ]]
				v2:set(v10:IsItemOnHotbar(v38, p2.ItemData.Name))
			end))
			p2.Maid:GiveTask(v2:subscribe(function(p12) --[[ Line: 1828 | Upvalues: p1 (copy), HotbarLabel (copy) ]]
				local v1 = p12 and true or false
				p1.BackgroundColor3 = if v1 then Color3.fromRGB(101, 244, 128) else Color3.fromRGB(255, 255, 255)
				HotbarLabel.Text = ("(%*)"):format(p12)
				HotbarLabel.Visible = v1
			end))
			local v3 = p2.Maid:GiveTask(v34.new(0))
			p2.Maid:GiveTask(v3:subscribe(function(p1) --[[ Line: 1845 | Upvalues: OwnedLabel (copy) ]]
				OwnedLabel.Text = ("x%*"):format(p1)
			end))
			for v4, v52 in p2.Values do
				p2.Maid:GiveTask(p2.Maid:GiveTask(v34.fromProperty(v52, "Value")):subscribe(function() --[[ Line: 1852 | Upvalues: p2 (copy), v3 (copy) ]]
					p2.Maid._amount = task.defer(function() --[[ Line: 1853 | Upvalues: p2 (ref), v3 (ref) ]]
						local v1 = 0
						for v2, v32 in p2.Values do
							v1 = if v32:IsA("IntValue") then v1 + v32.Value else v1 + 1
						end
						v3:set(v1)
					end)
				end))
			end
			p2.Maid:GiveTask(v45:subscribe(function(p12) --[[ Line: 1869 | Upvalues: v51 (ref), p2 (copy), p1 (copy) ]]
				if v51 then
					return
				end
				local isName = p2.ItemData.Name == p12
				local SelectedTab = p1:FindFirstChild("SelectedTab")
				if SelectedTab then
					SelectedTab.Enabled = isName
				end
			end))
			p1.Content.NameLabel.Text = v23.GetDisplayName(p2.ItemData.Name, p2.ItemData)
		end
		local t5 = {}
		local v22 = v47:GiveTask(v32.new({
			ItemsPerRow = 5,
			ItemSpacing = 8,
			UpdateThrottle = 0.3,
			ScrollingFrame = v21,
			TemplateFrame = Default,
			GetItemHeight = function(p1, p2) --[[ GetItemHeight | Line: 1896 | Upvalues: v21 (ref) ]]
				return (v21.AbsoluteSize.Y - 16) / 3
			end,
			GetItemWidth = function(p1, p2) --[[ GetItemWidth | Line: 1906 | Upvalues: v21 (ref) ]]
				return (v21.AbsoluteSize.X - 32) / 5 - v21.ScrollBarThickness
			end,
			OnItemHidden = reify,
			OnItemVisible = function(p1, p2, p3) --[[ OnItemVisible | Line: 1919 | Upvalues: reify (copy) ]]
				reify(p1, p2, p3, true)
			end,
			UpdateContent = function(p1, p2, p3) --[[ UpdateContent | Line: 1923 | Upvalues: reify (copy) ]]
				reify(p1, p2, p3, true)
			end
		}))
		local function getInventoryStackAmount(p1) --[[ getInventoryStackAmount | Line: 1928 ]]
			local v1 = 0
			for v2, v3 in p1.Values do
				v1 = if v3:IsA("IntValue") then v1 + v3.Value else v1 + 1
			end
			return v1
		end
		local v232 = v47:GiveTask(v4.new())
		local function update() --[[ update | Line: 1943 | Upvalues: t5 (copy), v10 (ref), v38 (ref), v42 (ref), v43 (ref), v23 (ref), getInventoryStackAmount (copy), v4 (ref), v44 (ref), v40 (ref), v46 (ref), t4 (ref), ContainerFrame (ref), v51 (ref), v22 (copy), v45 (ref), selectItem (ref) ]]
			table.sort(t5, function(p1, p2) --[[ Line: 1944 | Upvalues: v10 (ref), v38 (ref), v42 (ref), v43 (ref), v23 (ref), getInventoryStackAmount (ref) ]]
				local ItemData = p1.ItemData
				local ItemData_2 = p2.ItemData
				local v1 = v10:IsItemOnHotbar(v38, ItemData.Name)
				local v3 = tonumber(if v1 then v1.Name or nil else nil)
				local v4 = v10:IsItemOnHotbar(v38, ItemData_2.Name)
				local v5, v6
				if v4 then
					v5 = v4.Name
					if v5 then
						v6 = v3
					else
						v5 = nil
						v6 = v3
					end
				else
					v5 = nil
					v6 = v3
				end
				local v7 = tonumber(v5)
				if v6 and v7 then
					if v6 < v7 then
						return true
					end
					if v7 < v6 then
						return false
					end
				else
					local v8 = v7
					if v6 and not v8 then
						return true
					end
					if v8 and not v6 then
						return false
					end
				end
				local v9 = v42:get()
				local v102 = v43:get()
				local Index = ItemData.Rarity.Index
				local Index_2 = ItemData_2.Rarity.Index
				local v11 = v23.GetDisplayName(ItemData.Name, ItemData)
				local v12 = v23.GetDisplayName(ItemData_2.Name, ItemData_2)
				if v9 == "Name" then
					if v11 ~= v12 and v102 then
						return v11 < v12
					elseif v11 ~= v12 then
						return v12 < v11
					end
				elseif v9 == "Rarity" then
					if Index ~= Index_2 and v102 then
						return Index_2 < Index
					elseif Index ~= Index_2 then
						return Index < Index_2
					end
				elseif v9 == "Amount" then
					local v17 = getInventoryStackAmount(p1)
					local v18 = getInventoryStackAmount(p2)
					if v17 ~= v18 and v102 then
						return v18 < v17
					elseif v17 ~= v18 then
						return v17 < v18
					end
				end
				if Index == Index_2 then
					if v11 == v12 then
						local v21 = ItemData.Name
						local v22 = ItemData_2.Name
						if v21 == v22 then
							return false
						end
						return v21 < v22
					else
						return v11 < v12
					end
				else
					return Index_2 < Index
				end
			end)
			for v1, v2 in t5 do
				v2.Maid = v2.Maid or v4.new()
				v2.Maid:DoCleaning()
			end
			local v47 = v44:get()
			local v5 = table.clone(t5)
			if v40 then
				for i = #v5, 1, -1 do
					if not table.find(v40, v5[i].ItemData.Name) then
						table.remove(v5, i)
					end
				end
			elseif v46:get() then
				for j = #v5, 1, -1 do
					if v5[j].ItemData.ItemType ~= "Seeds" then
						table.remove(v5, j)
					end
				end
			elseif v47 ~= "All" then
				local ItemTypes = t4[v47].ItemTypes
				if ItemTypes then
					for k = #v5, 1, -1 do
						if not table.find(ItemTypes, v5[k].ItemData.ItemType) then
							table.remove(v5, k)
						end
					end
				end
			end
			local v6 = ContainerFrame.Menu.Content.SortOptions.SearchBar.Content.TextBox.ContentText:lower():gsub(" ", "")
			local v7
			if string.len(v6) > 0 then
				v7 = v6
				for n = #v5, 1, -1 do
					local ItemData = v5[n].ItemData
					local Values = v5[n].Values
					if not string.find(ItemData.Name:lower():gsub(" ", ""), v6) then
						local v9 = false
						if ItemData.Theme and string.find(ItemData.Theme:lower():gsub(" ", ""), v6) then
							v9 = true
						end
						if not v9 and Values then
							for v11, v12 in Values do
								local Theme = v12:FindFirstChild("Theme")
								if Theme and (Theme.Value and Theme.Value ~= "") and string.find(Theme.Value:lower():gsub(" ", ""), v6) then
									v9 = true
									break
								end
							end
						end
						if not v9 then
							table.remove(v5, n)
						end
					end
				end
			else
				v7 = v6
			end
			if v51 then
				for m = #v5, 1, -1 do
					local t = {}
					for v15, v16 in v5[m].Values or {} do
						if v16.Parent then
							table.insert(t, v16)
						end
					end
					if if #t > 1 then true else false then
						table.remove(v5, m)
					end
				end
			end
			ContainerFrame.Menu.Content.Items.EmptyLabel.Visible = if #v5 == 0 then true else false
			if #v5 == 0 then
				local v19 = "You do not have any items!"
				local v20 = v44:get()
				if string.len(v7) > 0 then
					v19 = "No items found for your search..."
				elseif v51 then
					v19 = "No items available for Multi Delete!"
				elseif v20 == "Food" then
					v19 = "You do not have any food items!"
				elseif v20 == "Gear" then
					v19 = "You do not have any gear items!"
				elseif v20 == "Equipment" then
					v19 = "You do not have any equipments!"
				elseif v20 == "Resources" then
					v19 = "You do not have any materials!"
				elseif v20 == "Potions" then
					v19 = "You do not have any potions!"
				end
				ContainerFrame.Menu.Content.Items.EmptyLabel.Text = v19
			end
			if v22.SetData then
				v22:SetData(v5)
			end
			local v21 = v45:get()
			if not v21 then
				return
			end
			selectItem(v21)
		end
		v54 = function() --[[ Line: 2158 | Upvalues: v232 (copy), update (copy) ]]
			v232._thread = task.defer(update)
		end
		v34.fromProperty(ContainerFrame.Menu.Content.SortOptions.SearchBar.Content.TextBox, "ContentText"):subscribe(function() --[[ Line: 2162 | Upvalues: v232 (copy), update (copy) ]]
			v232._thread = task.defer(update)
		end)
		v38.HotbarChangedSignal:Connect(function() --[[ Line: 2166 | Upvalues: v232 (copy), update (copy) ]]
			v232._thread = task.defer(update)
		end)
		v47:GiveTask(v44:subscribe(function(p1) --[[ Line: 2170 | Upvalues: v232 (copy), update (copy) ]]
			v232._thread = task.defer(update)
		end))
		v47:GiveTask(v42:subscribe(function() --[[ Line: 2174 | Upvalues: v232 (copy), update (copy) ]]
			v232._thread = task.defer(update)
		end))
		v47:GiveTask(v43:subscribe(function() --[[ Line: 2178 | Upvalues: v232 (copy), update (copy) ]]
			v232._thread = task.defer(update)
		end))
		local function onChildChanged(p1, p2, p3) --[[ onChildChanged | Line: 2182 | Upvalues: v6 (ref), t5 (copy), v4 (ref), v232 (copy), update (copy) ]]
			if not p1:IsA("ValueBase") then
				return
			end
			local v2 = v6.GetByName(if p1:IsA("StringValue") then p1.Value else p1.Name)
			if not v2 then
				return
			end
			local v3 = nil
			for v42, v5 in t5 do
				if v2.Name == v5.ItemData.Name then
					v3 = v5
					break
				end
			end
			local v62 = if v3 then v3 else {}
			v62.ItemData = v62.ItemData or v2
			v62.Values = v62.Values or {}
			local v8 = false
			if p2 == "Added" then
				local v9
				if table.find(v62.Values, p1) then
					v9 = v62
				else
					table.insert(v62.Values, p1)
					v9 = v62
					v8 = true
				end
				if not table.find(t5, v9) then
					table.insert(t5, v9)
					v8 = true
				end
			elseif p2 == "Removed" then
				local v11 = table.find(v62.Values, p1)
				local v12
				if v11 then
					table.remove(v62.Values, v11)
					v12 = v62
					v8 = true
				else
					v12 = v62
				end
				local v13 = 0
				for v14, v15 in v12.Values do
					v13 = if v15:IsA("IntValue") then v13 + v15.Value else v13 + 1
				end
				if v13 == 0 then
					local v16 = table.find(t5, v12)
					if v16 then
						v12.Maid = v12.Maid or v4.new()
						v12.Maid:DoCleaning()
						table.remove(t5, v16)
						v8 = true
					end
				end
			end
			if not (v8 and p3) then
				return
			end
			v232._thread = task.defer(update)
		end
		for v24, v25 in t4 do
			for v262, v27 in v25.ItemTypes do
				local v282 = v38:GetItemFolder(v27)
				if v282 then
					v47:GiveTask(v282.ChildAdded:Connect(function(p1) --[[ Line: 2265 | Upvalues: v47 (ref), v34 (ref), onChildChanged (copy) ]]
						v47:GiveTask(v34.fromProperty(p1, "Value"):subscribe(function(p12) --[[ Line: 2266 | Upvalues: p1 (copy), onChildChanged (ref) ]]
							if not p1:IsA("IntValue") then
								onChildChanged(p1, "Added", true)
								return
							end
							if p12 > 0 then
								onChildChanged(p1, "Added", true)
							else
								onChildChanged(p1, "Removed", true)
							end
						end))
					end))
					v47:GiveTask(v282.ChildRemoved:Connect(function(p1) --[[ Line: 2279 | Upvalues: onChildChanged (copy) ]]
						if not p1:IsA("IntValue") then
							onChildChanged(p1, "Removed", true)
						end
					end))
					for v29, v302 in v282:GetChildren() do
						v47:GiveTask(v34.fromProperty(v302, "Value"):subscribe(function(p1) --[[ Line: 2287 | Upvalues: v302 (copy), onChildChanged (copy) ]]
							if not v302:IsA("IntValue") then
								onChildChanged(v302, "Added", true)
								return
							end
							if p1 > 0 then
								onChildChanged(v302, "Added", true)
							else
								onChildChanged(v302, "Removed", true)
							end
						end))
					end
				end
			end
		end
		v47:GiveTask(v41:subscribe(function(p1) --[[ Line: 2302 | Upvalues: v232 (copy), update (copy), v51 (ref), ExitMultiDeleteMode (ref) ]]
			v232._thread = task.defer(update)
			if not v51 or p1 ~= "FeedingTrough" and p1 ~= "Smelting" then
				return
			end
			ExitMultiDeleteMode()
		end))
		v47:GiveTask(v46:subscribe(function(p1) --[[ Line: 2310 | Upvalues: v232 (copy), update (copy), v51 (ref), ExitMultiDeleteMode (ref) ]]
			v232._thread = task.defer(update)
			if not (v51 and p1) then
				return
			end
			ExitMultiDeleteMode()
		end))
		v232._thread = task.defer(update)
	end
	if v41:get() ~= "Smelting" then
		ContainerFrame.Menu.Content.Info.Content.Description.Visible = true
		ContainerFrame.Menu.Content.Info.Content.Stats.Visible = true
	end
	ContainerFrame.Menu.Content.Info.Content.EquipFrame.Visible = false
	setActionsFrame(true)
end
function t.Cleanup(p1) --[[ Cleanup | Line: 2324 | Upvalues: selectItem (copy), ExitMultiDeleteMode (copy), v47 (copy), t5 (ref), v3 (copy), ContainerFrame (copy) ]]
	selectItem()
	ExitMultiDeleteMode()
	v47:DoCleaning()
	t5 = {}
	v3.CleanContents(ContainerFrame)
end
function t.Open(p1, ...) --[[ Open | Line: 2334 | Upvalues: v30 (copy), v38 (copy), v11 (copy), v3 (copy), ContainerFrame (copy), v39 (copy), v26 (copy), ExitMultiDeleteMode (copy), v40 (ref), v46 (copy), t (copy) ]]
	if not v30.HasCompletedPrimaryTutorial(v38) and (v38.PlayerCohorts.NewTutorial:get() and not v38.LearnToFeedYourHorse) then
		v11.Notify({
			Message = "You can\'t open your inventory yet!"
		})
		return
	end
	if v3.IsFrameOpen(ContainerFrame) then
		t.Close()
		return
	end
	v39:FireServer("AccessedMajorInterface", "Inventory")
	if v26.IsGifting() then
		ExitMultiDeleteMode()
	end
	v3.OpenMainFrame(ContainerFrame, {
		CallbackArgs = { ... }
	})
	if typeof(p1) == "table" then
		v40 = p1
	else
		v46:set(p1)
	end
end
function t.OpenSmelting(p1, p2, p3) --[[ OpenSmelting | Line: 2368 | Upvalues: v41 (copy), v55 (ref), selectItem (copy), t (copy) ]]
	v41:set("Smelting")
	v55 = p3
	selectItem()
	t.Open(p1)
end
function t.OpenFoodTrough(p1) --[[ OpenFoodTrough | Line: 2375 | Upvalues: v41 (copy), v55 (ref), selectItem (copy), v6 (copy), t (copy) ]]
	warn("Food Trough")
	v41:set("FeedingTrough")
	v55 = p1
	selectItem()
	local t2 = {}
	for k, v in pairs(v6.GetType("Food")) do
		table.insert(t2, k)
	end
	t.Open(t2)
end
function t.Close(p1) --[[ Close | Line: 2387 | Upvalues: v46 (copy), v3 (copy), ContainerFrame (copy), v39 (copy), v41 (copy), t (copy), v40 (ref), t6 (copy), ExitMultiDeleteMode (copy) ]]
	v46:set(nil)
	if v3.IsFrameOpen(ContainerFrame) then
		v39:FireServer("ClosedMajorInterface", "Inventory")
	end
	if p1 then
		v3.CloseFrame(ContainerFrame)
		v3.OpenHUD({
			DoNotCloseMainFrame = p1
		})
	else
		v3.CloseMainFrame(ContainerFrame)
	end
	if v41:get() then
		t.ResetSelection()
	end
	v40 = nil
	v41:set(nil)
	if t6.Plant then
		for v1, v2 in t6.Plant do
			v2.Visible = false
		end
	end
	ExitMultiDeleteMode()
end
function t.IsSelectingHotbarSlot() --[[ IsSelectingHotbarSlot | Line: 2419 | Upvalues: v3 (copy), ContainerFrame (copy) ]]
	if v3.IsFrameOpen(ContainerFrame) then
		return ContainerFrame.Menu.Content.Info.Content.EquipFrame.Visible
	end
end
function t.UpgradeSlots() --[[ UpgradeSlots | Line: 2426 | Upvalues: t8 (copy) ]]
	t8.PurchaseStorage()
end
function t.Init(p1) --[[ Init | Line: 2431 | Upvalues: v3 (copy), ContainerFrame (copy), v18 (copy), t (copy), v25 (copy), v2 (copy), v30 (copy), v38 (copy), v26 (copy), v11 (copy), v21 (copy), v24 (copy), v23 (copy), ReplicatedStorage (copy), v19 (copy), v6 (copy), v12 (copy), v20 (copy), Sonar (copy), ExitMultiDeleteMode (copy), v15 (copy), t7 (ref), setStorageCapacityLabel (copy), v13 (copy), PlayerGui (copy), PredictButton (copy), v58 (copy), PayClaim (copy), v27 (copy), v45 (copy), v31 (copy), v35 (copy) ]]
	v3.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = ContainerFrame.Menu.Content.Items.Content
	})
	v18.SetUnselectableWhenSelected(ContainerFrame.Menu.Content.Items.Content)
	v3.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 2443 | Upvalues: t (ref) ]]
		t:OnOpen()
	end)
	v3.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 2446 | Upvalues: v25 (ref), t (ref) ]]
		v25.Close()
		t:Cleanup()
	end)
	v3.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 2450 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v2.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 2455 | Upvalues: v30 (ref), v38 (ref), t (ref), v26 (ref) ]]
			if v30.IsInTutorial(v38) and v38:GetStatValue("HorsesFed").Value == 0 then
				return
			end
			t.Close()
			t.ResetSelection()
			if not v26.IsGifting() then
				return
			end
			v26.CancelGifting()
		end
	})
	v11.AddNotificationCallback("MaxInventory", function(p1) --[[ Line: 2474 ]]
		return {
			Message = "\226\154\160\239\184\143 You are at max inventory space! \226\154\160\239\184\143",
			Preset = "Red",
			Type = "MaxInventory",
			Sound = game.ReplicatedStorage.Storage.SFX.MaxPrompt
		}
	end)
	v11.AddNotificationCallback("RandomMutation", function(p1, p2) --[[ Line: 2482 | Upvalues: v21 (ref), v24 (ref), v38 (ref), v23 (ref), ReplicatedStorage (ref) ]]
		local v1 = v21.GetMutation(p2)
		return {
			Preset = "Green",
			Message = string.format("%s unlocked the %s mutation!", v24.GetCustomName(v38:GetAnimalSlot(p1)), v23.GetDisplayName(v1.Name, v1)),
			Sound = ReplicatedStorage.Storage.SFX.UpgradeMutation,
			Type = "RandomMutation" .. p1
		}
	end)
	v11.AddNotificationCallback("GaveInfertility", function() --[[ Line: 2496 ]]
		return {
			Message = "Successfully made horse infertile!",
			Type = "GaveInfertility",
			Preset = "Green"
		}
	end)
	v11.AddNotificationCallback("GenderSwap", function() --[[ Line: 2504 ]]
		return {
			Message = "Successfully changed horse gender!",
			Type = "GenderSwap",
			Preset = "Green"
		}
	end)
	v11.AddNotificationCallback("SetUpliftedWings", function(p1) --[[ Line: 2512 ]]
		return {
			Message = "Successfully changed the wing animations!",
			Type = "SetUpliftedWings",
			Preset = "Green"
		}
	end)
	v11.AddNotificationCallback("InstantFoal", function() --[[ Line: 2520 ]]
		return {
			Message = "Successfully completed foal gestation!",
			Type = "InstantFoal",
			Preset = "Green"
		}
	end)
	v11.AddNotificationCallback("GaveMutation", function(p1, p2) --[[ Line: 2528 | Upvalues: v21 (ref), v24 (ref), v38 (ref), v23 (ref), ReplicatedStorage (ref) ]]
		local v1 = v21.GetMutation(p2)
		return {
			Preset = "Green",
			Message = string.format("Successfully gave %s the %s mutation!", v24.GetCustomName(v38:GetAnimalSlot(p1)), v23.GetDisplayName(v1.Name, v1)),
			Sound = ReplicatedStorage.Storage.SFX.UpgradeMutation,
			Type = "GaveMutation" .. p2 .. p1
		}
	end)
	v11.AddNotificationCallback("DataSynced", function() --[[ Line: 2542 ]]
		return {
			Message = "\226\156\133 Data has now synced! \226\156\133",
			Preset = "Green"
		}
	end)
	v19.AddFunction({
		Type = "UpgradeMutation",
		Name = "ClientPrompt",
		Function = function(p1, p2, p3) --[[ Function | Line: 2552 | Upvalues: v6 (ref), v21 (ref), v12 (ref), v23 (ref), v20 (ref), v38 (ref), Sonar (ref), v19 (ref), ReplicatedStorage (ref), v11 (ref) ]]
			local v1 = v6.GetByName(p2)
			local v2, v3
			if p3 then
				v2 = p1.Mutations[p3]
				v3 = v21.GetMutation(v2.Value)
			else
				local v4, v5 = v21.GetMutationOfType(p1, v1.TargetMutationType)
				v2 = v5
				v3 = v4
			end
			v12.Prompt({
				Type = "UpgradeMutation",
				Setup = function(p1, p2) --[[ Setup | Line: 2565 | Upvalues: v23 (ref), v3 (ref), v20 (ref), v2 (ref), v1 (copy) ]]
					p1.Content.Label.Text = string.format("Upgrade your %s?", v23.GetDisplayName(v3.Name, v3))
					local v12 = v20.GetUnlockCondition(v2, v3.Type)
					if v12 then
						p1.Content.UpgradedStats.Description.Text = v12.UpgradeDescription
						p1.Content.UpgradedStats.Description.Visible = true
						p1.Content.UpgradedStats.Stats.Visible = false
					else
						p1.Content.UpgradedStats.Stats.Visible = true
						p1.Content.UpgradedStats.Description.Visible = false
					end
					for k, v in pairs({ p1.Content.MutationUpgradePotion, p1.Content.WingUpgradePotion }) do
						v.Visible = v.Name == v1.Name
					end
					for k, v in pairs(v3.Stats) do
						local Default = p1.Content.UpgradedStats.Stats:FindFirstChild("Default", true)
						Default.Visible = false
						local v22 = Default:Clone()
						v22.Title.Text = v23.SafeUpper(v20.FormatStat(k, v))
						local v32 = v20.GetValue(v, v2)
						local v4 = v20.GetValue(v, v2, v2.Level.Value + 1)
						local _, v5 = v20.FormatStat(k, v4)
						v22.Value.Text = v5
						v22.Addition.Text = "+" .. v20.FormatStatDifference(k, v4 - v32)
						v22.Name = k
						v22.Visible = true
						v22.Parent = p1.Content.UpgradedStats.Stats
						p2.Maid:GiveTask(v22)
					end
				end,
				Run = function() --[[ Run | Line: 2609 | Upvalues: v38 (ref), p2 (copy), Sonar (ref), v19 (ref), p1 (copy), v2 (ref), ReplicatedStorage (ref), v11 (ref) ]]
					if v38:GetItemValue(p2).Value <= 0 then
						Sonar("ShopGui").Open(p2)
						return true
					end
					if v19.GiveConsumable({
						Notify = true,
						Item = p2,
						Slot = p1,
						Data = { v2.Name, true }
					}) then
						ReplicatedStorage.Storage.SFX.UpgradeMutation:Play()
						v11.Notify({
							Message = "You upgraded your mutation!",
							Preset = "Green"
						})
						return true
					end
				end,
				Cancel = function() --[[ Cancel | Line: 2634 ]]
					return true
				end
			})
		end
	})
	v19.AddFunction({
		Type = "MutationDeletePotion",
		Name = "ClientPrompt",
		Function = function(p1, p2, p3) --[[ Function | Line: 2644 | Upvalues: v12 (ref), v19 (ref), v11 (ref), v24 (ref) ]]
			local v1 = p1.Mutations[p3]
			v12.Prompt({
				Type = "DeleteMutation",
				Setup = function(p1, p2) --[[ Setup | Line: 2649 ]] end,
				Run = function() --[[ Run | Line: 2650 | Upvalues: v19 (ref), p2 (copy), p1 (copy), v1 (ref), v11 (ref), v24 (ref) ]]
					if v19.GiveConsumable({
						Notify = true,
						Item = p2,
						Slot = p1,
						Data = { v1.Name, true }
					}) then
						v11.Notify({
							Preset = "Green",
							Message = string.format("\226\157\140 Successfully deleted the mutation from %s! \226\157\140", v24.GetCustomName(p1)),
							Type = "DeletedMutation" .. v1.Name .. p1.Name
						})
						return true
					end
				end,
				Cancel = function() --[[ Cancel | Line: 2673 ]]
					return true
				end
			})
		end
	})
	v19.AddFunction({
		Type = "MutationSlotPotion",
		Name = "ClientPrompt",
		Function = function(p1, p2) --[[ Function | Line: 2683 | Upvalues: v12 (ref), v19 (ref), v11 (ref), v24 (ref) ]]
			v12.Prompt({
				Type = "AddMutationSlot",
				Setup = function(p1, p2) --[[ Setup | Line: 2686 ]] end,
				Run = function() --[[ Run | Line: 2687 | Upvalues: v19 (ref), p2 (copy), p1 (copy), v11 (ref), v24 (ref) ]]
					if v19.GiveConsumable({
						Notify = true,
						Item = p2,
						Slot = p1,
						Data = { true }
					}) then
						v11.Notify({
							Preset = "Green",
							Message = string.format("\240\159\167\172 Successfully added an empty mutation slot for %s! \240\159\167\172", v24.GetCustomName(p1)),
							Type = "AddMutationSlot" .. p1.Name
						})
						return true
					end
				end,
				Cancel = function() --[[ Cancel | Line: 2710 ]]
					return true
				end
			})
		end
	})
	v2.new(ContainerFrame.Menu.Content.Info.MultiDelete.Buttons.Cancel, {
		IgnoreUIScale = true,
		Click = function() --[[ Click | Line: 2719 | Upvalues: ExitMultiDeleteMode (ref), t (ref) ]]
			ExitMultiDeleteMode()
			t.ResetSelection()
		end
	})
	v2.new(ContainerFrame.Menu.Content.Info.MultiDelete.Buttons.Delete, {
		IgnoreUIScale = true,
		Click = function() --[[ Click | Line: 2727 | Upvalues: v15 (ref), t7 (ref), ExitMultiDeleteMode (ref), t (ref) ]]
			v15.GetRemoteFunction("MassDelete"):InvokeServer(t7)
			ExitMultiDeleteMode()
			t.ResetSelection()
		end
	})
	v38.InventoryItemsChangedSignal:Connect(setStorageCapacityLabel)
	v38.MaxInventoryChangedSignal:Connect(setStorageCapacityLabel)
	pcall(function() --[[ Line: 312 | Upvalues: v38 (ref), ContainerFrame (ref), v13 (ref), PlayerGui (ref) ]]
		local v1 = v38:GetItemLimit("Inventory")
		local v2 = v1.Get()
		local v3 = v1.GetLimit()
		ContainerFrame.Menu.Content.InventoryCapacity.Content.TextLabel.Text = v13.suffix(v2) .. "/" .. v13.suffix(v3)
		ContainerFrame.Menu.Content.MaxWarning.Visible = v3 <= v2
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
	v11.AddNotificationCallback("ClaimedChest", function(p1) --[[ Line: 2738 | Upvalues: Sonar (ref), v38 (ref) ]]
		Sonar("DisplayAnimalClient"):DisplaySlot({
			Type = "Claimed",
			AllowNaming = true,
			ShowMaxWarning = true,
			MobileClickBackgroundToClose = true,
			ShowTameContestPoints = false,
			Slot = v38:GetItemFolder("Animals"):WaitForChild(p1)
		})
	end)
	v2.new(PredictButton, {
		Click = function() --[[ Click | Line: 2750 | Upvalues: v58 (ref) ]]
			v58()
		end
	})
	v2.new(PayClaim, {
		Click = function() --[[ Click | Line: 2756 | Upvalues: v27 (ref), v38 (ref), v45 (ref), v31 (ref) ]]
			local v1, v2 = v27:ClaimCapsule(v38, v45:get())
			v31:Stop()
			if not v1 then
				return
			end
			v31:DisplaySlot({
				Type = "Claimed",
				AllowNaming = true,
				ForceAdult = true,
				Slot = v38:GetItemFolder("Animals"):WaitForChild(v2)
			})
		end
	})
	v35:AddControls("GamepadClaimCapsulePredict", { Enum.KeyCode.ButtonA }, {
		InputBegan = function() --[[ InputBegan | Line: 2774 | Upvalues: v31 (ref), v45 (ref), v27 (ref), v38 (ref) ]]
			local v1 = v31.GetDisplay()
			if not v1 then
				return
			end
			if v1.Type ~= "CapsuleBreeding" then
				return
			end
			if not v45:get() then
				return
			end
			local v2, v3 = v27:ClaimCapsule(v38, v45:get())
			v31:Stop()
			if not v2 then
				return
			end
			v31:DisplaySlot({
				Type = "Claimed",
				AllowNaming = true,
				ForceAdult = true,
				Slot = v38:GetItemFolder("Animals"):WaitForChild(v3)
			})
		end
	}, function() --[[ Line: 2798 | Upvalues: v31 (ref) ]]
		local v1 = v31.GetDisplay()
		if not v1 then
			return
		end
		if v1.Type == "CapsuleBreeding" then
			return v31.CanDismiss()
		end
	end, nil, true)
end
function t.ResetSelection() --[[ ResetSelection | Line: 2810 | Upvalues: v45 (copy), selectItem (copy), v41 (copy), ContainerFrame (copy), setActionsFrame (copy) ]]
	v45:set(nil)
	selectItem()
	if v41:get() ~= "Smelting" then
		ContainerFrame.Menu.Content.Info.Content.Description.Visible = true
		ContainerFrame.Menu.Content.Info.Content.Stats.Visible = true
	end
	ContainerFrame.Menu.Content.Info.Content.EquipFrame.Visible = false
	setActionsFrame(true)
	ContainerFrame.Menu.Content.Info.Content.Visible = false
	ContainerFrame.Menu.Content.Info.NotSelected.Visible = true
	ContainerFrame.Menu.Content.Info.Content.Buttons.Visible = false
	ContainerFrame.Menu.Content.FeedingTrough.Visible = false
end
function t.GetSelectedItem() --[[ GetSelectedItem | Line: 2816 | Upvalues: v45 (copy) ]]
	return {
		Name = v45:get()
	}
end
v22.UpgradeSlots = t.UpgradeSlots
t.ContainerFrame = ContainerFrame
t:Init()
return t