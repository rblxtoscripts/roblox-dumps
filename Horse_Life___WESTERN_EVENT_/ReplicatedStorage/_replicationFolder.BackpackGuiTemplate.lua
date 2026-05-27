-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GamepadService = game:GetService("GamepadService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("CharacterControls")
local v3 = Sonar("Maid")
local v4 = Sonar("HotbarService")
local v5 = Sonar("StorageUtils")
local v6 = Sonar("ShopService")
local v7 = Sonar("NotificationsService")
local v8 = Sonar("UnlockSequenceService")
local v9 = Sonar("KeyCodeLabel")
local v10 = v5.GetConfig("Backpack")()
local HotbarKeyCodeMap = v10.HotbarKeyCodeMap
local ItemFoldersToBuild = v10.ItemFoldersToBuild
local Tabs = v10.Tabs
local v11 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 31 | Upvalues: t (copy), v11 (copy), v4 (copy), v6 (copy), v7 (copy), v8 (copy), v1 (copy), v9 (copy), v2 (copy), GamepadService (copy), v3 (copy), HotbarKeyCodeMap (copy), v10 (copy), Tabs (copy), ItemFoldersToBuild (copy) ]]
	local v22 = setmetatable({}, t)
	v22.GuiProvider = p1
	v22.InventoryScreen = p1:GetScreen("Inventory")
	v22.HotbarScreen = p1:GetScreen("Hotbar")
	local function openInventoryTabFromItem(p1) --[[ openInventoryTabFromItem | Line: 40 | Upvalues: v11 (ref), v22 (copy) ]]
		local v1 = v11:GetItemDataByValue(p1)
		if not v1 then
			return
		end
		for v2, v3 in v22.InventoryTabNavigator:GetDisplayAllTabs({
			IsOpen = true
		}) do
			v22.InventoryTabNavigator:OpenTab(v2)
			return
		end
		for v4, v5 in v22.InventoryTabNavigator:GetTabs() do
			if v5.Config.Filter and v5.Config.Filter(v1) then
				v22.InventoryTabNavigator:OpenTab(v4)
				return
			end
		end
	end
	local function removeFromHotbar(p1) --[[ removeFromHotbar | Line: 62 | Upvalues: v4 (ref), v11 (ref) ]]
		local v1 = v4.GetHotbarSlotValue(v11, p1)
		if v1 then
			v4.RemoveFromHotbar(v11, v1)
			v4.SetHotbarSlot(v1.Name)
		end
	end
	local function addToHotbar(p1, p2) --[[ addToHotbar | Line: 75 | Upvalues: v4 (ref), v11 (ref) ]]
		local v1 = v4.GetHotbarSlotValue(v11, p1)
		if v1 then
			v4.AddToHotbar(v11, v1, p2)
			v4.SetHotbarSlot(v1.Name, p2.Name)
		end
	end
	local function getItemFromHotbarSlot(p1, p2) --[[ getItemFromHotbarSlot | Line: 88 | Upvalues: v11 (ref) ]]
		if not (#p1.Value > 0) then
			return nil
		end
		local v1 = os.time()
		local v2 = nil
		while not v2 do
			if p2 and p2 < os.time() - v1 then
				return nil
			end
			local v3 = v11:GetItemValue(p1.Value)
			if v3 then
				v2 = v3
				continue
			end
			task.wait()
			v2 = v3
		end
		return v2
	end
	local function sellItem(p1) --[[ sellItem | Line: 108 | Upvalues: v6 (ref), v11 (ref), v7 (ref) ]]
		local v1 = v6.GetShop("Item-Sell")
		if not v1 then
			return
		end
		local t = {
			Name = p1.Name
		}
		t.Amount = if p1:IsA("IntValue") then p1.Value or 1 else 1
		local v4, v5 = v1:CanSellItem(v11, t)
		if v4 == true then
			v6.RequestToSellItem(v5)
		else
			v7.Notify({
				Response = v4,
				Args = { v5 }
			})
		end
	end
	local function promptCapacityUpgrade(p1) --[[ promptCapacityUpgrade | Line: 129 | Upvalues: v22 (copy), v11 (ref), v7 (ref), v8 (ref) ]]
		local v1 = v22.BackpackCapacityUpgrades:GetNextTierToUnlock(v11)
		if not v1 then
			return "CapacityReachedBackpackMaxUpgrade"
		end
		if p1 and not p1.Prompt then
			return true
		end
		v7.Prompt({
			Type = "PurchaseUnlock",
			Text = "Upgrade Backpack Capacity?",
			Price = v1.Price,
			Run = function() --[[ Run | Line: 144 | Upvalues: v22 (ref), v11 (ref), v7 (ref), v8 (ref) ]]
				local v1, v2 = v22.BackpackCapacityUpgrades:CanClaim(v11)
				print(v1, v2)
				if v1 == true then
					return v8.RequestToClaimTier(v2)
				else
					v7.Notify({
						Response = v1,
						Args = { v2 }
					})
				end
			end,
			Cancel = function() --[[ Cancel | Line: 157 ]]
				return true
			end
		})
		return true
	end
	local function buildHotbar(p1) --[[ buildHotbar | Line: 168 | Upvalues: v22 (copy), v1 (ref), v8 (ref), v9 (ref), v2 (ref), GamepadService (ref), v4 (ref), v11 (ref), v3 (ref), getItemFromHotbarSlot (copy), HotbarKeyCodeMap (ref), v10 (ref), openInventoryTabFromItem (copy), sellItem (copy) ]]
		if v22._buildHotbar then
			return
		end
		v22._buildHotbar = true
		v22.HotbarSlots = {}
		v22.ActiveHotbarSlots = {}
		v22.InventoryItems = {}
		v22.DragToInventoryFrame = v1.FindElement(v22.InventoryScreen.Instance, "DragDrop")
		v22.DragToSellFrame = v1.FindElement(v22.InventoryScreen.Instance, "DragDropSell")
		v22.BackpackCapacityUpgrades = v8.GetSequence("BackpackCapacity")
		v22.BackpackButton = v1.FindElement(p1.Instance, "BackpackButton")
		if v22.BackpackButton then
			local v12 = v9.Get(v22.BackpackButton)
			if v12 then
				v2:AddControls("SelectBackpackButton", v12:GetKeyCodes(), {
					InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 190 | Upvalues: v22 (ref), GamepadService (ref) ]]
						v22:ToggleOpenOrClose()
						if p3 ~= "Gamepad" then
							return
						end
						if v22.InventoryScreen:IsOpen() then
							GamepadService:EnableGamepadCursor(v22.BackpackButton)
							return
						end
						GamepadService:DisableGamepadCursor()
					end
				}, function() --[[ Line: 200 | Upvalues: v1 (ref) ]]
					return v1.IsScreenGroupOpen("HUD")
				end)
			end
			v1.AddComponent("Button", {
				Instance = v22.BackpackButton,
				OnClick = function() --[[ OnClick | Line: 207 | Upvalues: v22 (ref) ]]
					v22:ToggleOpenOrClose()
				end
			})
		end
		v1.AddComponent("DynamicAspectRatio", {
			Instance = p1.Instance,
			Thresholds = function(p1) --[[ Thresholds | Line: 215 ]]
				local function calculateThresholdRatio(p1) --[[ calculateThresholdRatio | Line: 226 ]]
					return 0.39 + (10 - p1) * 0.039
				end
				local t = {
					Default = {
						HotbarSlots = 9
					}
				}
				for i = 8, 4, -1 do
					table.insert(t, {
						WidthRatio = 0.39 + (10 - i) * 0.039,
						HotbarSlots = i
					})
				end
				return t
			end,
			OnInstanceSizeChanged = function(p1, p2) --[[ OnInstanceSizeChanged | Line: 251 | Upvalues: v22 (ref), v4 (ref), v11 (ref) ]]
				v22.TotalHotbarSlotsVisibleFromAspectRatio = p2.Threshold.HotbarSlots
				for v1, v2 in v22.HotbarSlots do
					v2:SetVisible(true)
					if not v2:IsVisible() then
						local v42 = v4.GetHotbarSlotValue(v11, v2.Name)
						if v42 then
							v4.RemoveFromHotbar(v11, v42)
							v4.SetHotbarSlot(v42.Name)
						end
					end
				end
			end
		})
		for v23, v32 in v11.PlayerData.Hotbar.Equipped:GetChildren() do
			local v42 = v3.new()
			local v5 = nil
			local function canSlotBeEquippedToHotbar() --[[ canSlotBeEquippedToHotbar | Line: 268 | Upvalues: v22 (ref), v32 (copy) ]]
				if not v22.TotalHotbarSlotsVisibleFromAspectRatio then
					return true
				end
				if tonumber(v32.Name) > v22.TotalHotbarSlotsVisibleFromAspectRatio then
					return false
				else
					return true
				end
			end
			local AddComponent = v1.AddComponent
			local t = {
				Name = v32.Name,
				Instance = p1.Instance:FindFirstChild(v32.Name),
				Parent = p1.Instance
			}
			t.LayoutOrder = tonumber(v32.Name)
			function t.OnClick() --[[ OnClick | Line: 283 | Upvalues: v4 (ref), v11 (ref), getItemFromHotbarSlot (ref), v32 (copy) ]]
				v4.EquipOrUnequipTool(v11, (getItemFromHotbarSlot(v32)))
			end
			function t.Visibility() --[[ Visibility | Line: 287 | Upvalues: v22 (ref), v32 (copy), v5 (ref) ]]
				if not (if v22.TotalHotbarSlotsVisibleFromAspectRatio then not (tonumber(v32.Name) > v22.TotalHotbarSlotsVisibleFromAspectRatio) else true) then
					return false
				end
				if v5 then
					return true
				else
					return v22.InventoryScreen:IsOpen()
				end
			end
			local v7 = AddComponent("GuiObject", t)
			v22.HotbarSlots[v32.Name] = v7
			local v82 = v1.FindElement(v7.Instance, "SlotNumberLabel")
			if v82 then
				v82.Text = v32.Name
			end
			v2:AddControls("Slot" .. v32.Name, { HotbarKeyCodeMap[v32.Name] }, {
				InputBegan = function(p1) --[[ InputBegan | Line: 303 | Upvalues: v4 (ref), v11 (ref), getItemFromHotbarSlot (ref), v32 (copy) ]]
					v4.EquipOrUnequipTool(v11, (getItemFromHotbarSlot(v32)))
				end
			})
			local function setVisibility() --[[ setVisibility | Line: 308 | Upvalues: v7 (copy) ]]
				v7:SetVisible(true)
			end
			local function setOnHotbar(p1) --[[ setOnHotbar | Line: 312 | Upvalues: v42 (copy), v5 (ref), getItemFromHotbarSlot (ref), v32 (copy), v22 (ref), v4 (ref), v11 (ref), v1 (ref), v7 (copy), v10 (ref), openInventoryTabFromItem (ref), sellItem (ref) ]]
				v42:DoCleaning()
				v5 = getItemFromHotbarSlot(v32, 2)
				local v12 = if v22.TotalHotbarSlotsVisibleFromAspectRatio then not (tonumber(v32.Name) > v22.TotalHotbarSlotsVisibleFromAspectRatio) else true
				if not v12 then
					local v43 = v4.GetHotbarSlotValue(v11, v32.Name)
					if v43 then
						v4.RemoveFromHotbar(v11, v43)
						v4.SetHotbarSlot(v43.Name)
					end
					v5 = nil
				end
				if not v5 then
					v7:SetVisible(true)
					return
				end
				local v52 = v4.GetToolID(v11, v5)
				local v6 = v42:GiveTask(v1.AddComponent("ItemDisplay", {
					Instance = v7.Instance,
					DataValue = v5,
					DoNotShowToolTip = not v10.ShowToolTipsOnHotbar,
					Mutation = {
						CreateParticle2D = true
					},
					OnDestroyed = function(p1) --[[ OnDestroyed | Line: 336 | Upvalues: v7 (ref), v22 (ref), v32 (ref) ]]
						v7:Reset()
						p1:Reset()
						v22.ActiveHotbarSlots[v32.Name] = nil
					end
				}))
				v22.ActiveHotbarSlots[v32.Name] = v6
				v6:GiveTask(v1.AddComponent("DraggableObject", {
					DragDropAreaVisibleOnlyWhenDragging = true,
					Instance = v7.Instance,
					CanDrag = function(p1) --[[ CanDrag | Line: 349 | Upvalues: v22 (ref) ]]
						return v22.InventoryScreen:IsOpen()
					end,
					OnDragEnded = function(p1, p2) --[[ OnDragEnded | Line: 352 | Upvalues: openInventoryTabFromItem (ref), v5 (ref), v32 (ref), v4 (ref), v11 (ref), sellItem (ref) ]]
						if p2.WithinDragDropArea then
							if p2.WithinDragDropArea == "Inventory" then
								openInventoryTabFromItem(v5)
								local v2 = v4.GetHotbarSlotValue(v11, v32.Name)
								if v2 then
									v4.RemoveFromHotbar(v11, v2)
									v4.SetHotbarSlot(v2.Name)
								end
							elseif p2.WithinDragDropArea == "Sell" then
								sellItem(v5)
							end
						else
							if not p2.ObjectToSnapTo then
								return
							end
							local v42 = v5
							local v52 = v4.GetHotbarSlotValue(v11, p2.ObjectToSnapTo.Name)
							if not v52 then
								return
							end
							v4.AddToHotbar(v11, v52, v42)
							v4.SetHotbarSlot(v52.Name, v42.Name)
						end
					end,
					DragDropArea = {
						Inventory = v22.DragToInventoryFrame,
						Sell = v22.DragToSellFrame
					},
					SnapToObjects = function() --[[ SnapToObjects | Line: 371 | Upvalues: v22 (ref) ]]
						return v22.HotbarSlots
					end
				}))
				local function setEquipped() --[[ setEquipped | Line: 376 | Upvalues: v11 (ref), v52 (copy), v7 (ref) ]]
					if v11.EquippedTool and v11.EquippedTool.Object.Name == v52 then
						v7:Select()
					else
						v7:Deselect()
					end
					v7:SetVisible(true)
				end
				v6:GiveTask(v11:GetSignal("EquippedToolChangedSignal"):Connect(setEquipped))
				if v11.EquippedTool and v11.EquippedTool.Object.Name == v52 then
					v7:Select()
				else
					v7:Deselect()
				end
				v7:SetVisible(true)
			end
			v32:GetPropertyChangedSignal("Value"):Connect(setOnHotbar)
			task.spawn(setOnHotbar, true)
			v22.InventoryScreen:AddCallback("OnOpen", setVisibility)
			v22.InventoryScreen:AddCallback("OnClose", setVisibility)
		end
	end
	v22.HotbarScreen:AddCallback("OnOpen", buildHotbar)
	local function buildInventory(p1) --[[ buildInventory | Line: 403 | Upvalues: v22 (copy), v1 (ref), Tabs (ref), ItemFoldersToBuild (ref), v4 (ref), v11 (ref), sellItem (copy), promptCapacityUpgrade (copy) ]]
		if v22._buildInventory then
			return
		end
		v22._buildInventory = true
		v22.InventoryTabNavigator = v1.AddComponent("TabNavigator", {
			OpenDefaultTabOnDeselect = true,
			Instance = p1.Instance,
			Tabs = Tabs
		})
		v22.InventoryLayoutSort = v1.AddComponent("LayoutSort", {
			DefaultSorts = true,
			Instance = p1.Instance,
			TabNavigator = v22.InventoryTabNavigator
		})
		v22.BackpackItemCreator = v1.AddComponent("InventoryCreator", {
			Instance = p1.Instance,
			TabNavigator = v22.InventoryTabNavigator,
			LayoutSort = v22.InventoryLayoutSort,
			ItemFolders = ItemFoldersToBuild,
			GuiObject = {
				DisplayType = "ItemDisplay",
				OnClick = function(p1) --[[ OnClick | Line: 433 | Upvalues: v4 (ref), v11 (ref) ]]
					v4.EquipOrUnequipTool(v11, p1.DataValue)
				end
			},
			OnCreated = function(p1) --[[ OnCreated | Line: 437 | Upvalues: v4 (ref), v11 (ref), v1 (ref), sellItem (ref), v22 (ref) ]]
				local v12 = v4.GetToolID(v11, p1.DataValue)
				p1:GiveTask(v1.AddComponent("DraggableObject", {
					DragDropAreaVisibleOnlyWhenDragging = true,
					Instance = p1.Instance,
					OnDragged = function(p1, p2) --[[ OnDragged | Line: 442 ]] end,
					OnDragEnded = function(p12, p2) --[[ OnDragEnded | Line: 445 | Upvalues: sellItem (ref), p1 (copy), v4 (ref), v11 (ref) ]]
						if p2.WithinDragDropArea then
							if p2.WithinDragDropArea == "Sell" then
								sellItem(p1.DataValue)
							end
						else
							local ObjectToSnapTo = p2.ObjectToSnapTo
							if not ObjectToSnapTo then
								return
							end
							local DataValue = p1.DataValue
							local v2 = v4.GetHotbarSlotValue(v11, ObjectToSnapTo.Name)
							if not v2 then
								return
							end
							v4.AddToHotbar(v11, v2, DataValue)
							v4.SetHotbarSlot(v2.Name, DataValue.Name)
						end
					end,
					DragDropArea = {
						Sell = v22.DragToSellFrame
					},
					SnapToObjects = function() --[[ SnapToObjects | Line: 463 | Upvalues: v22 (ref) ]]
						return v22.HotbarSlots
					end,
					OnSnapObjectHovered = function(p1, p2) --[[ OnSnapObjectHovered | Line: 466 ]]
						p2.UIScale.Scale = 1.1
					end,
					OnSnapObjectLeave = function(p1, p2) --[[ OnSnapObjectLeave | Line: 469 ]]
						p2.UIScale.Scale = 1
					end
				}))
				local function setEquipped() --[[ setEquipped | Line: 474 | Upvalues: v11 (ref), v12 (copy), p1 (copy) ]]
					if v11.EquippedTool and v11.EquippedTool.Object.Name == v12 then
						p1:Select()
					else
						p1:Deselect()
					end
				end
				p1:GiveTask(v11:GetSignal("EquippedToolChangedSignal"):Connect(setEquipped))
				if v11.EquippedTool and v11.EquippedTool.Object.Name == v12 then
					p1:Select()
				else
					p1:Deselect()
				end
			end,
			CanCreate = function(p1) --[[ CanCreate | Line: 484 ]]
				if #p1.Equipped.Value > 0 then
					return
				end
				if not (p1:IsA("IntValue") or p1:IsA("NumberValue")) then
					return true
				end
				if p1.Value <= 0 then
				else
					return true
				end
			end,
			CanCreateChanged = function(p1) --[[ CanCreateChanged | Line: 498 ]]
				return { p1:GetPropertyChangedSignal("Value"), p1.Equipped:GetPropertyChangedSignal("Value") }
			end
		})
		local v12 = v1.FindElement(p1.Instance, "CapacityFrame")
		if v12 then
			v22.CapacityDisplay = v1.AddComponent("CapacityDisplay", {
				DoNotTweenText = true,
				Instance = v12,
				OnClick = promptCapacityUpgrade,
				ButtonVisibility = function() --[[ ButtonVisibility | Line: 513 | Upvalues: v22 (ref), v11 (ref) ]]
					return v22.BackpackCapacityUpgrades:GetNextTierToUnlock(v11)
				end,
				ButtonVisibilityChanged = function() --[[ ButtonVisibilityChanged | Line: 516 | Upvalues: v22 (ref), v11 (ref) ]]
					return v22.BackpackCapacityUpgrades:GetTiersChangedSignal(v11)
				end,
				Get = function() --[[ Get | Line: 522 | Upvalues: v11 (ref) ]]
					local v1 = v11:GetItemLimit("Backpack")
					return v1.Amount, v1.Limit
				end,
				Format = function(p1, p2) --[[ Format | Line: 526 ]]
					return string.format("%d/%d", p1, p2)
				end,
				Changed = { v11:GetItemsChangedSignal("Backpack") }
			})
		end
		v22.InventoryTabNavigator:OpenDefaultTab()
	end
	v22.InventoryScreen:AddCallback("OnOpen", buildInventory)
	v7.AddReceivedCallback("CapacityReachedBackpack", promptCapacityUpgrade)
	v2:AddControls("Inventory", { Enum.KeyCode.Backquote }, {
		InputBegan = function() --[[ InputBegan | Line: 544 | Upvalues: v22 (copy) ]]
			if v22.HotbarScreen:IsOpen() then
				v22:ToggleOpenOrClose()
			end
		end
	})
	v2:AddControls("EquipNextTool", { Enum.KeyCode.ButtonR1 }, {
		InputBegan = function() --[[ InputBegan | Line: 554 | Upvalues: v4 (ref), v11 (ref) ]]
			v4.EquipNextTool(v11)
		end
	})
	v2:AddControls("EquipPreviousTool", { Enum.KeyCode.ButtonL1 }, {
		InputBegan = function() --[[ InputBegan | Line: 560 | Upvalues: v4 (ref), v11 (ref) ]]
			v4.EquipPreviousTool(v11)
		end
	})
	return v22
end
function t.ToggleOpenOrClose(p1) --[[ ToggleOpenOrClose | Line: 568 ]]
	local v1 = p1:_getSelf()
	if v1.InventoryScreen:IsOpen() then
		v1.InventoryScreen:Close()
	else
		v1.InventoryScreen:Open()
	end
end
function t.Init(p1) --[[ Init | Line: 578 ]] end
t:Init()
return t