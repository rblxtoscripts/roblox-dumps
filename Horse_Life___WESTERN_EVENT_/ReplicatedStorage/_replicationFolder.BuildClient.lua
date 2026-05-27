-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local GamepadService = game:GetService("GamepadService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("GuiManager")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("ButtonTest")
local v5 = Sonar("BuildDragger")
local v6 = Sonar("Animal")
local v7 = Sonar("ItemReplicationService")
local v8 = Sonar("Maid")
local v9 = Sonar("ItemInfoFrame")
local v10 = Sonar("ItemGridButton")
local v11 = Sonar("ItemDataService")
local v12 = Sonar("Button")
local v13 = Sonar("GridSort")
local v14 = Sonar("GuiUtils")
local v15 = Sonar("InputTypeDetector")
local v16 = Sonar("BuildService")
local v17 = Sonar("IssueResponseClient")
local v18 = Sonar("PromptClient")
local v19 = Sonar("NotificationsClient")
local v20 = Sonar("UINavigator")
local v21 = Sonar("CharacterControls")
local v22 = Sonar("TimeFormat")
local v23 = Sonar("Signal")
local v24 = Sonar("TimeUtils")
local v25 = Sonar("FormatNumber")
local v26 = Sonar("MarketplaceUtils")
local v27 = Sonar("FormatString")
local v28 = Sonar("BuildShopGui")
local v29 = Sonar("StorageUtils")
local v30 = Sonar("Constants")
local v31 = v11.GetType("Buildings")
local v32 = Sonar(v29.Get("PlotSaveIcons"))
local LocalPlayer = game.Players.LocalPlayer
local v33 = Sonar("PlayerWrapper").GetClient()
local BuildGui = LocalPlayer.PlayerGui:WaitForChild("BuildGui")
local TopFrame = BuildGui.TopFrame
local BuildFrame = BuildGui.BuildFrame
local ContainerFrame = BuildFrame.ContainerFrame
local ShowFrame = BuildFrame.ShowFrame
local PlacePlotFrame = BuildFrame.PlacePlotFrame
local Recipe = ContainerFrame.Menu.Content.Recipe
local PlacementFrame = BuildGui.PlacementFrame
local ManageFrame = BuildGui.ManageFrame
local Selected = ManageFrame.Menu.Content.Selected
local v34 = v8.new()
local v35 = v8.new()
local v36 = tick()
local v37 = v1.GetRemoteFunction("SetBuildModeRemote")
local v38 = tick()
local v39 = v23.new()
local v40 = v8.new()
local v41 = v13.new({
	Priority = {
		{
			Priority = 1,
			Run = function(p1) --[[ Run | Line: 125 ]]
				return p1:_getAmount() > 0
			end,
			Changed = function(p1) --[[ Changed | Line: 128 ]]
				return p1.AmountChanged
			end
		}
	},
	Filters = {
		All = true
	},
	Sorts = {
		Alphabet = {
			Run = function(p1, p2, p3) --[[ Run | Line: 139 ]]
				return p1.NameLabel.Text:lower() < p2.NameLabel.Text:lower()
			end,
			Changed = function(p1) --[[ Changed | Line: 144 ]]
				return p1.NameLabel:GetPropertyChangedSignal("Text")
			end
		}
	}
})
local t = {
	SmallGrid = {
		[true] = "Small Grid",
		[false] = "Large Grid"
	},
	GlobalSnapping = {
		[true] = "Snapping Corners",
		[false] = "Snapping Off"
	},
	RotateIncrement = {
		[true] = "Rotate 15\194\176",
		[false] = "Rotate 45\194\176"
	}
}
local v42 = false
local v43 = false
local t2 = {}
local v44 = nil
local t3 = {}
local v45 = 1
local v46 = 1
for k, v in pairs({
	Foundations = { "Foundations" },
	Structures = { "Structures", "Fences" },
	Furniture = { "Furniture" },
	Utility = { "Utility" }
}) do
	v41:AddFilter(k, function(p1) --[[ Line: 151 | Upvalues: v (copy) ]]
		return table.find(v, p1.Item.BuildingType)
	end)
end
local function setPlotPlacementErrors(p1, p2) --[[ setPlotPlacementErrors | Line: 156 | Upvalues: PlacePlotFrame (copy), PlacementFrame (copy), v5 (copy) ]]
	for k, v in pairs({ PlacePlotFrame.IssueFrame, PlacementFrame.Mobile.IssueFrame, PlacementFrame.Other.IssueFrame }) do
		local v1 = v:FindFirstChild(p1)
		if p2 then
			if v1 then
				break
			end
			local v2 = v.Default:Clone()
			v2.Name = p1
			v2.Content.TextLabel.Text = v5.ErrorCodes[p1]
			v2.Visible = true
			v2.Parent = v
			continue
		end
		if v1 then
			v1:Destroy()
		end
	end
end
local function setHiddenBuildFrame(p1) --[[ setHiddenBuildFrame | Line: 175 | Upvalues: v38 (ref), v42 (ref), BuildFrame (copy), v2 (copy) ]]
	if not p1 then
		v38 = tick()
	end
	v42 = p1
	for k, v in pairs(BuildFrame:GetChildren()) do
		v2.UpdateFrame(v)
	end
end
local function setTopFrameOptions() --[[ setTopFrameOptions | Line: 185 | Upvalues: v5 (copy), BuildGui (copy) ]]
	local v1 = v5:HasPlot()
	for k, v in pairs(BuildGui.TopFrame:GetChildren()) do
		for k2, v2 in pairs(v:GetChildren()) do
			if v2:IsA("ImageButton") then
				v2.Visible = if v2.Name == "CloseButton" then true else v1
			end
		end
	end
end
local function setMobileMovementControls() --[[ setMobileMovementControls | Line: 195 | Upvalues: v15 (copy), v2 (copy), ContainerFrame (copy), v33 (copy) ]]
	if not v15.IsMobileInputType() then
		return
	end
	if v2.IsFrameOpen(ContainerFrame) then
		v33:DisablePlayerControls()
		v33.Character.Humanoid.JumpPower = 0
	else
		v33:EnablePlayerControls()
		v33.Character.Humanoid.JumpPower = 75
	end
end
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 206 | Upvalues: Recipe (copy) ]]
	if p1 then
		Recipe.Content.Visible = true
		Recipe.NotSelected.Visible = false
	else
		Recipe.Content.Visible = false
		Recipe.NotSelected.Visible = true
	end
end
local function craftBuilding(p1) --[[ craftBuilding | Line: 216 | Upvalues: v16 (copy), v33 (copy), v17 (copy), v28 (copy), v1 (copy) ]]
	local v12 = v16.CanCraftBuilding(v33, p1)
	if v12 == true then
		return v1.GetRemoteFunction("CraftBuildingRemote"):InvokeServer(p1)
	end
	v17.NotifyIssue(v12)
	if v12 ~= "CannotAffordToCraft" then
		return
	end
	task.spawn(v28.FlashTweenButtons, true)
end
local function v47(p1) --[[ enableDraggerModel | Line: 230 | Upvalues: v16 (copy), v33 (copy), v43 (ref), v5 (copy), v17 (copy), v7 (copy), craftBuilding (copy), v47 (copy) ]]
	local v1 = v16.CanPlaceBuilding(v33, p1.Name)
	if v1 ~= true then
		v43 = true
		v5:Enable("Building")
		v17.NotifyIssue(v1)
		return
	end
	local v2 = v33:GetUnplacedBuildingValue(p1.Name)
	local t = {
		RefreshPlacement = true
	}
	t.ID = if v2 then v2.Name else v2
	t.Model = v7.Get(p1.Name)
	t.Name = p1.Name
	function t.GetID() --[[ GetID | Line: 245 | Upvalues: craftBuilding (ref), p1 (copy) ]]
		return craftBuilding(p1.Name)
	end
	function t.OnPlaced() --[[ OnPlaced | Line: 248 | Upvalues: v47 (ref), p1 (copy) ]]
		v47(p1)
	end
	v5:Enable("Building", t)
end
local function selectItem(p1) --[[ selectItem | Line: 254 | Upvalues: t2 (ref), v44 (ref), v35 (copy), v33 (copy), v9 (copy), Recipe (copy), v20 (copy), v47 (copy), v15 (copy), v42 (ref), BuildFrame (copy), v2 (copy), v43 (ref), v5 (copy) ]]
	local v1 = t2[v44]
	if v1 then
		v1:Deselect()
	end
	v35:DoCleaning()
	v44 = p1
	if p1 then
		local v22 = t2[p1]
		if v22 then
			v22:Select()
		end
		local v3 = v33:GetTrackedItemValue(p1.Name)
		v35:GiveTask(v9.new({
			Item = p1,
			DataValue = v3,
			Frame = Recipe.Content,
			GetAmount = function() --[[ GetAmount | Line: 274 | Upvalues: v33 (ref), p1 (copy) ]]
				return v33:GetTotalRemainingBuilding(p1.Name)
			end,
			AmountChanged = { v33:GetTotalPlacedBuildingChangedSignals(p1.Name), v33.PlotSaveChangedSignal },
			AmountColors = {
				None = Color3.fromRGB(255, 94, 97),
				Default = Color3.fromRGB(255, 255, 255)
			}
		}))
		if p1.PlacementLimit then
			local v4 = v33:GetTotalPlacedBuildingValue(p1.Name)
			local function setPlacementLimit() --[[ setPlacementLimit | Line: 289 | Upvalues: Recipe (ref), v4 (copy), p1 (copy) ]]
				Recipe.Content.Content.LimitLabel.Text = v4.Value .. "/" .. p1.PlacementLimit
				Recipe.Content.Content.LimitLabel.TextColor3 = v4.Value >= p1.PlacementLimit and Color3.fromRGB(255, 94, 97) or Color3.fromRGB(255, 255, 255)
			end
			for v52, v6 in v33:GetTotalPlacedBuildingChangedSignals(p1.Name) do
				v35:GiveTask(v6:Connect(setPlacementLimit))
			end
			v35:GiveTask(v4:GetPropertyChangedSignal("Value"):Connect(setPlacementLimit))
			setPlacementLimit()
			Recipe.Content.Content.LimitLabel.Visible = true
			Recipe.Content.Content.LimitTitle.Visible = true
		else
			Recipe.Content.Content.LimitLabel.Visible = false
			Recipe.Content.Content.LimitTitle.Visible = false
		end
		Recipe.Content.Content.CannotCraft.Visible = not p1.Crafting
		v20.ResetGamepadSelection()
		v47(p1)
		Recipe.Content.Visible = true
		Recipe.NotSelected.Visible = false
		if not v15.IsMobileInputType() then
			return
		end
		v42 = true
		for k, v in pairs(BuildFrame:GetChildren()) do
			v2.UpdateFrame(v)
		end
		return
	end
	v43 = false
	if v33:IsInAction("BuildMode") and v5:HasPlot() then
		v5:Enable("Building")
	end
	Recipe.Content.Visible = false
	Recipe.NotSelected.Visible = true
end
local function createItem(p1, p2) --[[ createItem | Line: 327 | Upvalues: v10 (copy), v33 (copy), ContainerFrame (copy), v12 (copy), v5 (copy), v44 (ref), v43 (ref), v16 (copy), v47 (copy), selectItem (copy), t2 (ref), v34 (copy), v41 (copy) ]]
	local v1
	if p2 then
		v1 = v10.new({
			ShowHotbarEquipped = true,
			Item = p1,
			DataValue = v33:GetTrackedItemValue(p1.Name),
			ParentFrame = ContainerFrame.Menu.Content.Items.ScrollingFrame,
			AmountColors = {
				None = Color3.fromRGB(255, 94, 97),
				Default = Color3.fromRGB(255, 255, 255)
			},
			GetAmount = function() --[[ GetAmount | Line: 340 | Upvalues: v33 (ref), p1 (copy) ]]
				return v33:GetTotalRemainingBuilding(p1.Name)
			end,
			AmountChanged = { v33:GetTotalPlacedBuildingChangedSignals(p1.Name), v33.PlotSaveChangedSignal }
		})
		v1:GiveTask(v12.new(v1.Frame, {
			Click = function() --[[ Click | Line: 350 | Upvalues: v5 (ref), v44 (ref), p1 (copy), v43 (ref), v16 (ref), v33 (ref), v47 (ref), selectItem (ref) ]]
				if not v5:HasPlot() then
					return
				end
				if v44 ~= p1 then
					selectItem(p1)
					return
				end
				if v43 and v16.CanPlaceBuilding(v33, p1.Name) == true then
					v47(p1)
				else
					selectItem()
				end
			end
		}))
		t2[p1] = v1
		v34:GiveTask(function() --[[ Line: 365 | Upvalues: v41 (ref), v1 (copy) ]]
			v41:Remove(v1)
		end)
		v34:GiveTask(v1)
		v41:Add(v1, p2)
		return
	end
	task.wait()
	v1 = v10.new({
		ShowHotbarEquipped = true,
		Item = p1,
		DataValue = v33:GetTrackedItemValue(p1.Name),
		ParentFrame = ContainerFrame.Menu.Content.Items.ScrollingFrame,
		AmountColors = {
			None = Color3.fromRGB(255, 94, 97),
			Default = Color3.fromRGB(255, 255, 255)
		},
		GetAmount = function() --[[ GetAmount | Line: 340 | Upvalues: v33 (ref), p1 (copy) ]]
			return v33:GetTotalRemainingBuilding(p1.Name)
		end,
		AmountChanged = { v33:GetTotalPlacedBuildingChangedSignals(p1.Name), v33.PlotSaveChangedSignal }
	})
	v1:GiveTask(v12.new(v1.Frame, {
		Click = function() --[[ Click | Line: 350 | Upvalues: v5 (ref), v44 (ref), p1 (copy), v43 (ref), v16 (ref), v33 (ref), v47 (ref), selectItem (ref) ]]
			if not v5:HasPlot() then
				return
			end
			if v44 ~= p1 then
				selectItem(p1)
				return
			end
			if v43 and v16.CanPlaceBuilding(v33, p1.Name) == true then
				v47(p1)
			else
				selectItem()
			end
		end
	}))
	t2[p1] = v1
	v34:GiveTask(function() --[[ Line: 365 | Upvalues: v41 (ref), v1 (copy) ]]
		v41:Remove(v1)
	end)
	v34:GiveTask(v1)
	v41:Add(v1, p2)
end
local function setLoadTimerLabel() --[[ setLoadTimerLabel | Line: 373 | Upvalues: v2 (copy), ManageFrame (copy), v46 (ref), v33 (copy), Selected (copy), v24 (copy) ]]
	if not v2.IsFrameOpen(ManageFrame) then
		return
	end
	if v46 == v33:GetPlotSave() then
		Selected.LoadButton.Top.TextLabel.Text = "Loaded"
		return
	end
	local v1 = (v33.NextPlotLoad or 0) - tick()
	if v1 > 0 then
		Selected.LoadButton.Top.TextLabel.Text = "Load (" .. v24.FormatString(v1) .. ")"
	else
		Selected.LoadButton.Top.TextLabel.Text = "Load"
	end
end
local function setSelectedSaveSlot(p1) --[[ setSelectedSaveSlot | Line: 388 | Upvalues: v40 (copy), v46 (ref), v39 (copy), v33 (copy), Selected (copy), v16 (copy), v22 (copy), v14 (copy), setLoadTimerLabel (copy) ]]
	v40:DoCleaning()
	v46 = p1
	v39:Fire()
	local v1 = v33:GetPlotSaveData(p1)
	Selected.SlotTitle.Text = "SLOT " .. p1 .. ":"
	local function setCapacityLabel() --[[ setCapacityLabel | Line: 398 | Upvalues: Selected (ref), v33 (ref), p1 (copy) ]]
		Selected.Capacity.CapacityLabel.Text = v33:GetTotalPlacedValue(p1).Value .. "/" .. v33:GetMaxPlacedBuildings(p1)
	end
	v40:GiveTask(v33.MaxPlacementChangedSignal:Connect(setCapacityLabel))
	v40:GiveTask(v33.TotalPlacedChangedSignal:Connect(setCapacityLabel))
	Selected.Capacity.CapacityLabel.Text = v33:GetTotalPlacedValue(p1).Value .. "/" .. v33:GetMaxPlacedBuildings(p1)
	local function setNameLabel() --[[ setNameLabel | Line: 405 | Upvalues: Selected (ref), v16 (ref), v1 (copy) ]]
		Selected.SlotNameLabel.Text = v16.GetCustomName(v1):upper()
	end
	v40:GiveTask(v1.CustomName:GetPropertyChangedSignal("Value"):Connect(setNameLabel))
	Selected.SlotNameLabel.Text = v16.GetCustomName(v1):upper()
	local function setEditLabel() --[[ setEditLabel | Line: 411 | Upvalues: Selected (ref), v22 (ref), v1 (copy) ]]
		Selected.LastEdit.Text = "Last edited " .. v22.GetFormattedTime("H:i A M. j", v1.LastEdit.Value)
		Selected.LastEdit.Visible = v1.LastEdit.Value > 0
	end
	v40:GiveTask(v1.LastEdit:GetPropertyChangedSignal("Value"):Connect(setEditLabel))
	Selected.LastEdit.Text = "Last edited " .. v22.GetFormattedTime("H:i A M. j", v1.LastEdit.Value)
	local LastEdit = Selected.LastEdit
	LastEdit.Visible = v1.LastEdit.Value > 0
	local function setLoadButtonColor() --[[ setLoadButtonColor | Line: 418 | Upvalues: v14 (ref), Selected (ref), v46 (ref), v33 (ref) ]]
		v14.SetButtonColor(Selected.LoadButton, "Diagonal", if v46 == v33:GetPlotSave() then "Blue" else "Green")
	end
	v40:GiveTask(v33.PlotSaveChangedSignal:Connect(setLoadButtonColor))
	local SetButtonColor = v14.SetButtonColor
	local LoadButton = Selected.LoadButton
	local v4 = if v46 == v33:GetPlotSave() then "Blue" else "Green"
	SetButtonColor(LoadButton, "Diagonal", v4)
	local function setIcon() --[[ setIcon | Line: 424 | Upvalues: Selected (ref), v16 (ref), v1 (copy) ]]
		Selected.Icon.Image = v16.GetCustomIcon(v1)
	end
	v40:GiveTask(v1.Icon:GetPropertyChangedSignal("Value"):Connect(setIcon))
	Selected.Icon.Image = v16.GetCustomIcon(v1)
	setLoadTimerLabel()
end
local function promptSaveSlotPurchase(p1) --[[ promptSaveSlotPurchase | Line: 433 | Upvalues: v16 (copy), v18 (copy), v25 (copy), v26 (copy), v33 (copy), v17 (copy), v1 (copy) ]]
	local v12 = v16.GetPlotSaveSlotPurchase(p1)
	v18.Prompt({
		Type = "BuyPlotSaveSlot",
		Setup = function(p1) --[[ Setup | Line: 437 | Upvalues: v12 (copy), v25 (ref), v26 (ref) ]]
			if v12.Stats then
				for k, v in pairs(v12.Stats) do
					p1.Content[k].Visible = true
				end
			else
				p1.Content.NodesHarvested.Visible = false
			end
			if v12.Price then
				p1.Content.Price.TextLabel.Text = v25.splice(v12.Price)
				p1.Content.Price.Visible = true
			else
				p1.Content.Price.Visible = false
			end
			if not v12.ProductId then
				p1.Content.RobuxLabel.Visible = false
				return
			end
			local v1 = v26.GetProductInfo(v12.ProductId, Enum.InfoType.Product)
			p1.Content.RobuxLabel.Text = "\238\128\130" .. (if v1 then v1.PriceInRobux or "N/A" else "N/A")
			p1.Content.RobuxLabel.Visible = true
		end,
		Run = function() --[[ Run | Line: 462 | Upvalues: v12 (copy), v33 (ref), v17 (ref), v1 (ref), p1 (copy) ]]
			if v12.Stats then
				for k, v in pairs(v12.Stats) do
					if v33:GetStatValue(k).Value < v then
						return v17.NotifyIssue("NotEnoughStats")
					end
				end
			end
			if v12.Price and not v33:CanAfford(v12.Price, v12.Currency) then
				return v17.NotifyIssue("CantAffordPlotSlot")
			else
				return v1.GetRemoteFunction("PurchasePlotSaveSlotsRemote"):InvokeServer(p1)
			end
		end,
		Cancel = function() --[[ Cancel | Line: 479 ]]
			return true
		end
	})
end
local function promptPlacementCapacityPurchase() --[[ promptPlacementCapacityPurchase | Line: 485 | Upvalues: v16 (copy), v33 (copy), v19 (copy), v18 (copy), v25 (copy), v26 (copy), v17 (copy), v1 (copy) ]]
	local v12 = v16.GetPlotCapacitySlotPurchase(v33)
	if v12 then
		v18.Prompt({
			Type = "UpgradePlotPlacement",
			Setup = function(p1) --[[ Setup | Line: 496 | Upvalues: v25 (ref), v12 (copy), v26 (ref) ]]
				p1.Content.Label.Text = string.format("Increase Placement Capacity by %s slots?", v25.suffix(v12.Amount))
				if v12.Price then
					p1.Content.Price.TextLabel.Text = v25.splice(v12.Price)
					p1.Content.Price.Visible = true
				else
					p1.Content.Price.Visible = false
				end
				if not v12.ProductId then
					p1.Content.RobuxLabel.Visible = false
					return
				end
				local v1 = v26.GetProductInfo(v12.ProductId, Enum.InfoType.Product)
				p1.Content.RobuxLabel.Text = "\238\128\130" .. (if v1 then v1.PriceInRobux or "N/A" else "N/A")
				p1.Content.RobuxLabel.Visible = true
			end,
			Run = function() --[[ Run | Line: 514 | Upvalues: v12 (copy), v33 (ref), v17 (ref), v1 (ref) ]]
				if v12.Price and not v33:CanAfford(v12.Price, v12.Currency) then
					return v17.NotifyIssue("CantAffordInventoryUpgrade")
				else
					return v1.GetRemoteFunction("PurchasePlotPlacementSlotsRemote"):InvokeServer()
				end
			end,
			Cancel = function() --[[ Cancel | Line: 523 ]]
				return true
			end
		})
	else
		v19.Notify({
			Message = "You have fully upgraded your Storage!"
		})
	end
end
local function promptCraftCapacityPurchase() --[[ promptCraftCapacityPurchase | Line: 529 | Upvalues: v16 (copy), v33 (copy), v19 (copy), v18 (copy), v25 (copy), v26 (copy), v17 (copy), v1 (copy) ]]
	local v12 = v16.GetBuildingStorageSlotPurchase(v33)
	if v12 then
		v18.Prompt({
			Type = "UpgradeBuildingStorage",
			Setup = function(p1) --[[ Setup | Line: 540 | Upvalues: v25 (ref), v12 (copy), v26 (ref) ]]
				p1.Content.Label.Text = string.format("Increase Storage Capacity by %s slots?", v25.suffix(v12.Amount))
				if v12.Price then
					p1.Content.Price.TextLabel.Text = v25.splice(v12.Price)
					p1.Content.Price.Visible = true
				else
					p1.Content.Price.Visible = false
				end
				if not v12.ProductId then
					p1.Content.RobuxLabel.Visible = false
					return
				end
				local v1 = v26.GetProductInfo(v12.ProductId, Enum.InfoType.Product)
				p1.Content.RobuxLabel.Text = "\238\128\130" .. (if v1 then v1.PriceInRobux or "N/A" else "N/A")
				p1.Content.RobuxLabel.Visible = true
			end,
			Run = function() --[[ Run | Line: 558 | Upvalues: v12 (copy), v33 (ref), v17 (ref), v1 (ref) ]]
				if v12.Price and not v33:CanAfford(v12.Price, v12.Currency) then
					return v17.NotifyIssue("CantAffordInventoryUpgrade")
				else
					return v1.GetRemoteFunction("PurchaseBuildingStorageSlotsRemote"):InvokeServer()
				end
			end,
			Cancel = function() --[[ Cancel | Line: 567 ]]
				return true
			end
		})
	else
		v19.Notify({
			Message = "You have fully upgraded your Storage!"
		})
	end
end
function t3.EnterMode(p1) --[[ EnterMode | Line: 573 | Upvalues: v33 (copy), v19 (copy), v16 (copy), v18 (copy), Sonar (copy), v25 (copy), v36 (ref), v37 (copy), v3 (copy), LocalPlayer (copy), v6 (copy), v2 (copy), TopFrame (copy), BuildFrame (copy), setHiddenBuildFrame (copy), v15 (copy), ContainerFrame (copy), v20 (copy), GamepadService (copy), ShowFrame (copy), v42 (ref), setTopFrameOptions (copy), v5 (copy), v45 (ref) ]]
	if v33:IsInAction("BossFight") or v33:IsInAction("GlobalBossFight") then
		v19.Notify({
			Message = "You cannot build whilst in the Spirit Tame!",
			Preset = "Red",
			Type = "BuildSpiritTame"
		})
		return
	end
	if v33:IsInAction("Race") then
		v19.Notify({
			Message = "You cannot build during a race!",
			Preset = "Red",
			Type = "BuildRace"
		})
		return
	end
	if v33:IsInAction("Maze") then
		v19.Notify({
			Message = "You cannot build while in the maze!",
			Preset = "Red",
			Type = "BuildMaze"
		})
		return
	end
	if not v16.HasUnlockedBuilding(v33) then
		v18.Prompt({
			Type = "FeatureLocked",
			Setup = function(p1, p2) --[[ Setup | Line: 602 | Upvalues: v16 (ref), Sonar (ref), v25 (ref), v33 (ref) ]]
				p1.Content.ProgressDescription.Description.Text = string.format("Tame %s horses to unlock Build Mode!", v16.GetTamesToUnlock())
				p1.Content.Description.Visible = false
				p1.Content.ProgressDescription.Visible = true
				p2.Maid:GiveTask(Sonar("StatBar").new({
					TweenAmount = true,
					Clipped = false,
					Frame = p1.Content.ProgressDescription.ProgressBar.Fill,
					AmountLabel = p1.Content.ProgressDescription.ProgressBar.Progress,
					GetText = function(p1, p2) --[[ GetText | Line: 613 | Upvalues: v25 (ref) ]]
						return v25.suffix(p1) .. "/" .. v25.suffix(p2)
					end,
					Get = function() --[[ Get | Line: 617 | Upvalues: v33 (ref) ]]
						return v33:GetStatValue("Tames").Value
					end,
					GetMax = function() --[[ GetMax | Line: 620 | Upvalues: v16 (ref) ]]
						return v16.GetTamesToUnlock()
					end,
					Changed = { v33:GetStatValue("Tames"):GetPropertyChangedSignal("Value") }
				}))
			end,
			Run = function() --[[ Run | Line: 628 ]]
				return true
			end
		})
		return
	end
	if v33:IsInAction("BuildMode") then
		return
	end
	v33:SetActionState("BuildMode", true)
	v36 = tick()
	v37:InvokeServer(true)
	v3:Disable()
	LocalPlayer.Character.Humanoid:UnequipTools()
	if v33:GetCurrentAnimal() then
		v33.Character.Humanoid.JumpPower = game.StarterPlayer.CharacterJumpPower
		v33.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
	v6:ChangeCommand("Stay", nil, true)
	v2.OpenMainFrame(TopFrame, {
		Blur = false,
		DisableControls = false,
		CloseAll = true
	})
	v2.OpenFrame(BuildFrame)
	for k, v in pairs(TopFrame:GetChildren()) do
		v2.UpdateFrame(v)
	end
	setHiddenBuildFrame(false)
	if v15.IsMobileInputType() then
		if v15.IsMobileInputType() then
			if v2.IsFrameOpen(ContainerFrame) then
				v33:DisablePlayerControls()
				v33.Character.Humanoid.JumpPower = 0
			else
				v33:EnablePlayerControls()
				v33.Character.Humanoid.JumpPower = 75
			end
		end
	else
		v33.Character.Humanoid.JumpPower = 75
	end
	v20.OverwriteUISelect(function(p1, p2) --[[ Line: 666 | Upvalues: v2 (ref), TopFrame (ref), GamepadService (ref), v20 (ref), ContainerFrame (ref), ShowFrame (ref), v42 (ref) ]]
		if not v2.IsFrameOpen(TopFrame) then
			return
		end
		if GamepadService.GamepadCursorEnabled then
			v20.ResetGamepadSelection()
			return
		end
		if p2.KeyCode ~= Enum.KeyCode.ButtonSelect then
			return
		end
		if not (v2.IsFrameOpen(ContainerFrame) or v2.IsFrameOpen(ShowFrame)) then
			v20.SetGamepadSelection(TopFrame.Other:FindFirstChild("CloseButton", true))
			return
		end
		if v42 then
			v20.SetGamepadSelectionInFrame(ShowFrame, ShowFrame.ShowButton)
		else
			v20.SetGamepadSelectionInFrame(ContainerFrame, ContainerFrame.Menu.Content.Items.ScrollingFrame)
		end
	end)
	v20.ResetGamepadSelection()
	setTopFrameOptions()
	if v5:HasPlot() then
		v5:Enable("Building")
	else
		v5:Enable("PlacePlot", {
			GetID = function() --[[ GetID | Line: 689 | Upvalues: v45 (ref) ]]
				return v45
			end,
			OnPlaced = function() --[[ OnPlaced | Line: 692 | Upvalues: setHiddenBuildFrame (ref), setTopFrameOptions (ref), v5 (ref) ]]
				setHiddenBuildFrame(false)
				setTopFrameOptions()
				v5:Enable("Building")
			end
		})
	end
end
function t3.ExitMode(p1) --[[ ExitMode | Line: 703 | Upvalues: v33 (copy), v37 (copy), v36 (ref), v1 (copy), t3 (copy), v20 (copy), selectItem (copy), v28 (copy), v6 (copy), v2 (copy), v5 (copy) ]]
	if v33:IsInAction("BuildMode") then
		v33:SetActionState("BuildMode", false)
		v37:InvokeServer(false)
		v33.Character.Humanoid.JumpPower = game.StarterPlayer.CharacterJumpPower
		local v12 = tick()
		v36 = v12
		task.delay(60, function() --[[ Line: 712 | Upvalues: v36 (ref), v12 (copy), v1 (ref) ]]
			if v36 ~= v12 then
				return
			end
			v1.GetRemoteEvent("ClearBuildingCacheRemote"):FireServer()
		end)
		t3.CloseManage()
		v20.ResetSelectionToTargetFrame()
		v20.OverwriteUISelect()
		selectItem()
		v28.Close()
		v6:ChangeCommand(nil, nil, true)
		v2.OpenHUD()
		v5:Disable()
	end
end
function t3.OnOpen(p1) --[[ OnOpen | Line: 737 | Upvalues: v2 (copy), TopFrame (copy), ContainerFrame (copy), v14 (copy), v41 (copy), v4 (copy), v25 (copy), v33 (copy), promptPlacementCapacityPurchase (copy), promptCraftCapacityPurchase (copy), v16 (copy), PlacePlotFrame (copy), v22 (copy), v45 (ref), ReplicatedStorage (copy), v39 (copy), promptSaveSlotPurchase (copy), v31 (copy), createItem (copy), selectItem (copy) ]]
	local v1 = v2.getFrameFromInstance(TopFrame)
	if not v1.Opened then
		v1.Opened = true
		for k, v in pairs(ContainerFrame.SortButtons:GetChildren()) do
			if v:IsA("ImageButton") then
				local function setSortButton() --[[ setSortButton | Line: 746 | Upvalues: v14 (ref), v (copy), v41 (ref) ]]
					v14.SetButtonColor(v, "Diagonal", if v.Name == v41.FilterType then "Yellow" elseif v.Name == "Utility" then "Blue" else "BlueGreen")
				end
				v41.FilterChangedSignal:Connect(setSortButton)
				local SetButtonColor = v14.SetButtonColor
				local v42 = if v.Name == v41.FilterType then "Yellow" elseif v.Name == "Utility" then "Blue" else "BlueGreen"
				SetButtonColor(v, "Diagonal", v42)
				v4.new(v, {
					Click = function() --[[ Click | Line: 755 | Upvalues: v41 (ref), v (copy) ]]
						v41:Filter(v.Name)
					end
				})
			end
		end
		local function setPlacedCapacityLabel() --[[ setPlacedCapacityLabel | Line: 762 | Upvalues: ContainerFrame (ref), v25 (ref), v33 (ref) ]]
			pcall(function() --[[ Line: 763 | Upvalues: ContainerFrame (ref), v25 (ref), v33 (ref) ]]
				ContainerFrame.PlacedCapacity.Content.TextLabel.Text = v25.suffix(v33:GetTotalPlacedValue().Value) .. "/" .. v25.suffix(v33:GetMaxPlacedBuildings())
			end)
		end
		v4.new(ContainerFrame.PlacedCapacity.Content.Button, {
			Click = function() --[[ Click | Line: 768 | Upvalues: promptPlacementCapacityPurchase (ref) ]]
				promptPlacementCapacityPurchase()
			end
		})
		v33.MaxPlacementChangedSignal:Connect(setPlacedCapacityLabel)
		v33.TotalPlacedChangedSignal:Connect(setPlacedCapacityLabel)
		pcall(function() --[[ Line: 763 | Upvalues: ContainerFrame (ref), v25 (ref), v33 (ref) ]]
			ContainerFrame.PlacedCapacity.Content.TextLabel.Text = v25.suffix(v33:GetTotalPlacedValue().Value) .. "/" .. v25.suffix(v33:GetMaxPlacedBuildings())
		end)
		local function setCraftCapacityLabel() --[[ setCraftCapacityLabel | Line: 777 | Upvalues: v33 (ref), ContainerFrame (ref), v25 (ref) ]]
			pcall(function() --[[ Line: 778 | Upvalues: v33 (ref), ContainerFrame (ref), v25 (ref) ]]
				local v1 = v33:GetItemLimit("Buildings")
				ContainerFrame.CraftCapacity.Content.TextLabel.Text = v25.suffix(v1.Get()) .. "/" .. v25.suffix(v1.GetLimit())
			end)
		end
		v4.new(ContainerFrame.CraftCapacity.Content.Button, {
			Click = function() --[[ Click | Line: 784 | Upvalues: promptCraftCapacityPurchase (ref) ]]
				promptCraftCapacityPurchase()
			end
		})
		v33.MaxBuildingStorageChangedSignal:Connect(setCraftCapacityLabel)
		for k, v in pairs({ "ChildAdded", "ChildRemoved" }) do
			v33:GetItemFolder("Buildings")[v]:Connect(setCraftCapacityLabel)
		end
		pcall(function() --[[ Line: 778 | Upvalues: v33 (ref), ContainerFrame (ref), v25 (ref) ]]
			local v1 = v33:GetItemLimit("Buildings")
			ContainerFrame.CraftCapacity.Content.TextLabel.Text = v25.suffix(v1.Get()) .. "/" .. v25.suffix(v1.GetLimit())
		end)
		for i = 1, 3 do
			local v5 = v33:GetPlotSaveData(i)
			local v6 = v16.GetPlotSaveSlotPurchase(i)
			local v7 = PlacePlotFrame.SaveSlots.Content.Default:Clone()
			PlacePlotFrame.SaveSlots.Content.Default.Visible = false
			local Menu = v7.Content.Menu
			Menu.SlotTitle.Text = "SLOT " .. i .. ":"
			local function setCapacityLabel() --[[ setCapacityLabel | Line: 806 | Upvalues: Menu (copy), v33 (ref), i (copy) ]]
				Menu.Capacity.CapacityLabel.Text = v33:GetTotalPlacedValue(i).Value .. "/" .. v33:GetMaxPlacedBuildings(i)
			end
			v33.MaxPlacementChangedSignal:Connect(setCapacityLabel)
			v33.TotalPlacedChangedSignal:Connect(setCapacityLabel)
			Menu.Capacity.CapacityLabel.Text = v33:GetTotalPlacedValue(i).Value .. "/" .. v33:GetMaxPlacedBuildings(i)
			local function setNameLabel() --[[ setNameLabel | Line: 813 | Upvalues: Menu (copy), v16 (ref), v5 (copy) ]]
				Menu.SlotNameLabel.Text = v16.GetCustomName(v5):upper()
			end
			v5.CustomName:GetPropertyChangedSignal("Value"):Connect(setNameLabel)
			Menu.SlotNameLabel.Text = v16.GetCustomName(v5):upper()
			local function setEditLabel() --[[ setEditLabel | Line: 819 | Upvalues: Menu (copy), v22 (ref), v5 (copy) ]]
				Menu.LastEdit.Text = "Last edited " .. v22.GetFormattedTime("H:i A M. j", v5.LastEdit.Value)
				Menu.LastEdit.Visible = v5.LastEdit.Value > 0
			end
			v5.LastEdit:GetPropertyChangedSignal("Value"):Connect(setEditLabel)
			Menu.LastEdit.Text = "Last edited " .. v22.GetFormattedTime("H:i A M. j", v5.LastEdit.Value)
			Menu.LastEdit.Visible = v5.LastEdit.Value > 0
			local Color = v7.Content.UIGradient.Color
			local function setSelected() --[[ setSelected | Line: 827 | Upvalues: v45 (ref), i (copy), v7 (copy), ReplicatedStorage (ref), Color (copy), Menu (copy) ]]
				if v45 == i then
					v7.Content.UIGradient.Color = ReplicatedStorage.Storage.Assets.SelectedPlotSave.Color
				else
					v7.Content.UIGradient.Color = Color
				end
				Menu.SlotTitle.TextColor3 = v45 == i and Color3.fromRGB(255, 225, 106) or Color3.fromRGB(180, 105, 236)
				Menu.Capacity.BackgroundColor3 = v45 == i and Color3.fromRGB(180, 105, 236) or Color3.fromRGB(255, 243, 226)
				v7.BackgroundColor3 = v45 == i and Color3.fromRGB(71, 54, 112) or Color3.fromRGB(91, 56, 53)
				for k, v in pairs({ Menu.SlotNameLabel, Menu.LastEdit, Menu.Capacity.CapacityLabel }) do
					v.TextColor3 = v45 == i and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(91, 56, 53)
				end
			end
			v39:Connect(setSelected)
			setSelected()
			local function setOwned() --[[ setOwned | Line: 844 | Upvalues: v5 (copy), v7 (copy) ]]
				if v5.Unlocked.Value then
					v7.Content.Visible = true
					v7.Unowned.Visible = false
				else
					v7.Content.Visible = false
					v7.Unowned.Visible = true
				end
			end
			v5.Unlocked:GetPropertyChangedSignal("Value"):Connect(setOwned)
			if v5.Unlocked.Value then
				v7.Content.Visible = true
				v7.Unowned.Visible = false
			else
				v7.Content.Visible = false
				v7.Unowned.Visible = true
			end
			local function setIcon() --[[ setIcon | Line: 856 | Upvalues: Menu (copy), v16 (ref), v5 (copy) ]]
				Menu.Icon.Image = v16.GetCustomIcon(v5)
			end
			v5.Icon:GetPropertyChangedSignal("Value"):Connect(setIcon)
			Menu.Icon.Image = v16.GetCustomIcon(v5)
			v7.Unowned.RobuxLabel.Visible = if v6 then v6.ProductId else v6
			v7.Unowned.PriceLabel.Visible = if v6 then v6.Price else v6
			v4.new(v7, {
				Click = function() --[[ Click | Line: 866 | Upvalues: v5 (copy), v45 (ref), i (copy), v39 (ref), promptSaveSlotPurchase (ref) ]]
					if v5.Unlocked.Value then
						v45 = i
						v39:Fire()
					else
						promptSaveSlotPurchase(i)
					end
				end
			})
			v7.Visible = true
			v7.Name = i
			v7.LayoutOrder = i
			v7.Parent = PlacePlotFrame.SaveSlots.Content
		end
	end
	if v1.ContentsLoaded then
		return
	end
	v1.ContentsLoaded = true
	for k, v in pairs(v31) do
		if not v.Locked or v33.PlayerData.UnlockedFurniture:FindFirstChild(k).Value then
			createItem(v, true)
		end
	end
	v41:Sort(v41.SortType or "Alphabet")
	v41:Filter("All")
	selectItem()
end
function t3.Cleanup(p1) --[[ Cleanup | Line: 903 | Upvalues: v34 (copy), t2 (ref), selectItem (copy), v2 (copy), TopFrame (copy) ]]
	v34:DoCleaning()
	t2 = {}
	selectItem()
	v2.CleanContents(TopFrame)
end
function t3.OnOpenManage(p1) --[[ OnOpenManage | Line: 912 | Upvalues: v2 (copy), ManageFrame (copy), v4 (copy), Selected (copy), v33 (copy), v46 (ref), v19 (copy), v16 (copy), v17 (copy), v1 (copy), t3 (copy), setLoadTimerLabel (copy), v24 (copy), v25 (copy), promptPlacementCapacityPurchase (copy), promptCraftCapacityPurchase (copy), v23 (copy), v18 (copy), v14 (copy), v27 (copy), v30 (copy), v32 (copy), v12 (copy), ReplicatedStorage (copy), v39 (copy), setSelectedSaveSlot (copy), promptSaveSlotPurchase (copy) ]]
	local v13 = v2.getFrameFromInstance(ManageFrame)
	if v13.Opened then
		return
	end
	v13.Opened = true
	v4.new(Selected.LoadButton, {
		Click = function() --[[ Click | Line: 919 | Upvalues: v33 (ref), v46 (ref), v19 (ref), v16 (ref), v17 (ref), v1 (ref), t3 (ref) ]]
			if v33:GetPlotSave() == v46 then
				v19.Notify({
					Message = string.format("This plot save is already loaded!"),
					Type = "LoadedPlotAlready" .. v46
				})
				return
			end
			local v12, v2 = v16.CanLoadPlot(v33)
			if v12 ~= true then
				v17.NotifyIssue(v12, v2)
				return
			end
			if not v1.GetRemoteFunction("SwapPlot"):InvokeServer(v46) then
				return
			end
			v16.SetNextPlotCooldown(v33)
			t3.CloseManage()
		end
	})
	v2.AddStateCallback(ManageFrame, "OnOpen", setLoadTimerLabel)
	v24.AttachToTime(setLoadTimerLabel)
	setLoadTimerLabel()
	local function setPlacedCapacityLabel() --[[ setPlacedCapacityLabel | Line: 947 | Upvalues: ManageFrame (ref), v25 (ref), v33 (ref) ]]
		ManageFrame.Menu.Content.PlacedCapacity.Content.TextLabel.Text = v25.suffix(v33:GetMaxPlacedBuildings())
	end
	v4.new(ManageFrame.Menu.Content.PlacedCapacity.Button, {
		Click = function() --[[ Click | Line: 951 | Upvalues: promptPlacementCapacityPurchase (ref) ]]
			promptPlacementCapacityPurchase()
		end
	})
	v33.MaxPlacementChangedSignal:Connect(setPlacedCapacityLabel)
	ManageFrame.Menu.Content.PlacedCapacity.Content.TextLabel.Text = v25.suffix(v33:GetMaxPlacedBuildings())
	local function setCraftCapacityLabel() --[[ setCraftCapacityLabel | Line: 959 | Upvalues: v33 (ref), ManageFrame (ref), v25 (ref) ]]
		ManageFrame.Menu.Content.CraftCapacity.Content.TextLabel.Text = v25.suffix(v33:GetItemLimit("Buildings").GetLimit())
	end
	v4.new(ManageFrame.Menu.Content.CraftCapacity.Button, {
		Click = function() --[[ Click | Line: 964 | Upvalues: promptCraftCapacityPurchase (ref) ]]
			promptCraftCapacityPurchase()
		end
	})
	v33.MaxBuildingStorageChangedSignal:Connect(setCraftCapacityLabel)
	local v22 = v33:GetItemLimit("Buildings")
	ManageFrame.Menu.Content.CraftCapacity.Content.TextLabel.Text = v25.suffix(v22.GetLimit())
	local v3 = 1
	local v42 = v23.new()
	local v5 = v18.GetPromptFrame("RenameSlot")
	v14.CreateInputTextBox(v5.Content.NameFrame.Content.TextBox, function(p1, p2, p3) --[[ Line: 975 | Upvalues: v27 (ref), v30 (ref) ]]
		p1.Text = v27.trimString(p2, v30.MaxPlotSaveNameLength)
	end, true)
	v4.new(ManageFrame.Menu.Content.Selected.EditButton, {
		Click = function() --[[ Click | Line: 979 | Upvalues: v18 (ref), v33 (ref), v46 (ref), v3 (ref), v16 (ref), v32 (ref), v12 (ref), v42 (copy), v1 (ref) ]]
			v18.Prompt({
				Type = "EditPlotSave",
				Setup = function(p1, p2) --[[ Setup | Line: 982 | Upvalues: v33 (ref), v46 (ref), v3 (ref), v16 (ref), v32 (ref), v12 (ref), v42 (ref) ]]
					local v1 = v33:GetPlotSaveData(v46)
					v3 = v1.Icon.Value
					p1.Content.NameFrame.Content.TextBox.Text = v16.GetCustomName(v1)
					for k, v in pairs(v32) do
						local v2 = p1.Content.Icons.Default:Clone()
						p1.Content.Icons.Default.Visible = false
						v2.Viewport.Image = v
						p2.Maid:GiveTask(v12.new(v2, {
							HoverUpLabel = v2.Viewport,
							Click = function() --[[ Click | Line: 994 | Upvalues: v3 (ref), k (copy), v42 (ref) ]]
								v3 = k
								v42:Fire()
							end
						}))
						local function setSelected() --[[ setSelected | Line: 1000 | Upvalues: v2 (copy), k (copy), v3 (ref) ]]
							v2.BackgroundColor3 = k == v3 and Color3.fromRGB(110, 255, 128) or Color3.fromRGB(222, 191, 172)
						end
						p2.Maid:GiveTask(v42:Connect(setSelected))
						v2.BackgroundColor3 = k == v3 and Color3.fromRGB(110, 255, 128) or Color3.fromRGB(222, 191, 172)
						v2.Visible = true
						v2.Name = k
						v2.Parent = p1.Content.Icons
						p2.Maid:GiveTask(v2)
					end
				end,
				Run = function(p1) --[[ Run | Line: 1013 | Upvalues: v1 (ref), v46 (ref), v3 (ref) ]]
					return v1.GetRemoteFunction("EditBuildSave"):InvokeServer(v46, p1.Content.NameFrame.Content.TextBox.Text, v3)
				end,
				Cancel = function() --[[ Cancel | Line: 1016 ]]
					return true
				end
			})
		end
	})
	for i = 1, 3 do
		local v6 = v33:GetPlotSaveData(i)
		local v7 = v16.GetPlotSaveSlotPurchase(i)
		local v8 = ManageFrame.Menu.Content.Slots.Default:Clone()
		ManageFrame.Menu.Content.Slots.Default.Visible = false
		local Owned = v8.Owned
		Owned.Content.SlotTitle.Text = "SLOT " .. i .. ":"
		local function setNameLabel() --[[ setNameLabel | Line: 1034 | Upvalues: Owned (copy), v16 (ref), v6 (copy) ]]
			Owned.Content.SlotNameLabel.Text = v16.GetCustomName(v6):upper()
		end
		v6.CustomName:GetPropertyChangedSignal("Value"):Connect(setNameLabel)
		Owned.Content.SlotNameLabel.Text = v16.GetCustomName(v6):upper()
		local Color = v8.Owned.UIGradient.Color
		local function setSelected() --[[ setSelected | Line: 1041 | Upvalues: v46 (ref), i (copy), Owned (copy), ReplicatedStorage (ref), Color (copy) ]]
			if v46 == i then
				Owned.UIGradient.Color = ReplicatedStorage.Storage.Assets.SelectedPlotSave.Color
			else
				Owned.UIGradient.Color = Color
			end
			Owned.Content.SlotTitle.TextColor3 = v46 == i and Color3.fromRGB(255, 225, 106) or Color3.fromRGB(180, 105, 236)
			for k, v in pairs({ Owned.Content.SlotNameLabel }) do
				v.TextColor3 = v46 == i and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(91, 56, 53)
			end
		end
		v39:Connect(setSelected)
		setSelected()
		local function setOwned() --[[ setOwned | Line: 1055 | Upvalues: v6 (copy), Owned (copy), v8 (copy) ]]
			if v6.Unlocked.Value then
				Owned.Visible = true
				v8.Unowned.Visible = false
			else
				Owned.Visible = false
				v8.Unowned.Visible = true
			end
		end
		v6.Unlocked:GetPropertyChangedSignal("Value"):Connect(setOwned)
		if v6.Unlocked.Value then
			Owned.Visible = true
			v8.Unowned.Visible = false
		else
			Owned.Visible = false
			v8.Unowned.Visible = true
		end
		local function setIcon() --[[ setIcon | Line: 1067 | Upvalues: Owned (copy), v16 (ref), v6 (copy) ]]
			Owned.Content.Icon.Image = v16.GetCustomIcon(v6)
		end
		v6.Icon:GetPropertyChangedSignal("Value"):Connect(setIcon)
		Owned.Content.Icon.Image = v16.GetCustomIcon(v6)
		v8.Unowned.RobuxLabel.Visible = if v7 then v7.ProductId else v7
		v8.Unowned.PriceLabel.Visible = if v7 then v7.Price else v7
		local function selectPlot() --[[ selectPlot | Line: 1076 | Upvalues: v6 (copy), v46 (ref), i (copy), setSelectedSaveSlot (ref), promptSaveSlotPurchase (ref) ]]
			if not v6.Unlocked.Value then
				promptSaveSlotPurchase(i)
				return
			end
			if v46 ~= i then
				setSelectedSaveSlot(i)
			end
		end
		v4.new(Owned.Content.ViewButton, {
			Rotate = false,
			Click = selectPlot
		})
		v12.new(v8, {
			NoHoverShadowLabel = true,
			NoHoverColor = true,
			Click = selectPlot
		})
		v8.Visible = true
		v8.Name = i
		v8.Parent = ManageFrame.Menu.Content.Slots
	end
	setSelectedSaveSlot(v33:GetPlotSave())
end
function t3.OpenManage(...) --[[ OpenManage | Line: 1104 | Upvalues: v2 (copy), ManageFrame (copy), t3 (copy) ]]
	if v2.IsFrameOpen(ManageFrame) then
		t3.CloseManage()
	else
		v2.OpenFrame(ManageFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	end
end
function t3.CloseManage() --[[ CloseManage | Line: 1116 | Upvalues: v2 (copy), ManageFrame (copy) ]]
	v2.CloseFrame(ManageFrame, {})
end
function t3.ListenForMinimisedFrame() --[[ ListenForMinimisedFrame | Line: 1122 | Upvalues: UserInputService (copy), v38 (ref), ContainerFrame (copy), v42 (ref), BuildFrame (copy), v2 (copy) ]]
	local function isPointInBounds(p1, p2, p3) --[[ isPointInBounds | Line: 1123 ]]
		local AbsolutePosition = p1.AbsolutePosition
		local AbsoluteSize = p1.AbsoluteSize
		local X = AbsolutePosition.X
		local Y = AbsolutePosition.Y
		return if X <= p2 and (p2 <= X + AbsoluteSize.X and Y <= p3) then p3 <= Y + AbsoluteSize.Y else false
	end
	return game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 1135 | Upvalues: UserInputService (ref), v38 (ref), ContainerFrame (ref), v42 (ref), BuildFrame (ref), v2 (ref) ]]
		local v1 = UserInputService:GetMouseLocation()
		local v3 = Vector2.new(v1.X, v1.Y - game:GetService("GuiService"):GetGuiInset().Y)
		if tick() - v38 < 1 then
			return
		end
		local v4 = ContainerFrame
		local X = v3.X
		local Y = v3.Y
		local AbsolutePosition = v4.AbsolutePosition
		local AbsoluteSize = v4.AbsoluteSize
		local X_2 = AbsolutePosition.X
		local Y_2 = AbsolutePosition.Y
		local v7 = if X_2 <= X and (X <= X_2 + AbsoluteSize.X and Y_2 <= Y) then Y <= Y_2 + AbsoluteSize.Y else false
		if not v7 then
			local ExtraHoverFrame = ContainerFrame.ExtraHoverFrame
			local X_3 = v3.X
			local Y_3 = v3.Y
			local AbsolutePosition_2 = ExtraHoverFrame.AbsolutePosition
			local AbsoluteSize_2 = ExtraHoverFrame.AbsoluteSize
			local X_4 = AbsolutePosition_2.X
			local Y_4 = AbsolutePosition_2.Y
			v7 = if X_4 <= X_3 and (X_3 <= X_4 + AbsoluteSize_2.X and Y_4 <= Y_3) then Y_3 <= Y_4 + AbsoluteSize_2.Y else false
		end
		if v7 or v42 then
			return
		end
		v42 = true
		for k, v in pairs(BuildFrame:GetChildren()) do
			v2.UpdateFrame(v)
		end
	end)
end
function t3.Init(p1) --[[ Init | Line: 1150 | Upvalues: v5 (copy), t3 (copy), v2 (copy), TopFrame (copy), BuildGui (copy), v4 (copy), v18 (copy), v1 (copy), v28 (copy), selectItem (copy), setHiddenBuildFrame (copy), v15 (copy), ShowFrame (copy), ContainerFrame (copy), v42 (ref), BuildFrame (copy), setPlotPlacementErrors (copy), ManageFrame (copy), v33 (copy), t (copy), v14 (copy), setMobileMovementControls (copy), PlacePlotFrame (copy), v21 (copy), v20 (copy), v31 (copy), t2 (ref), createItem (copy) ]]
	v5.ListenForMinimisedFrame = t3.ListenForMinimisedFrame
	v2.AddFrame(TopFrame, {
		TweenAnimation = true,
		OpenPosition = TopFrame.Position,
		ClosePosition = TopFrame.Position + UDim2.new(0, 0, -0.25, 0),
		TweenStyle = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	})
	for k, v in pairs(BuildGui.TopFrame:GetChildren()) do
		v2.AddFrame(v, {
			TweenAnimation = true,
			OpenPosition = v.Position,
			ClosePosition = v.Position + UDim2.new(0, 0, -0.25, 0),
			TweenStyle = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			InputType = v.Name
		})
		v4.new(v.CloseButton, {
			AddHoverButton = true,
			Click = function() --[[ Click | Line: 1171 | Upvalues: t3 (ref) ]]
				t3:ExitMode()
			end
		})
		v4.new(v.ClearBaseButton, {
			AddHoverButton = true,
			Click = function() --[[ Click | Line: 1178 | Upvalues: v18 (ref), v5 (ref), v1 (ref) ]]
				v18.Prompt({
					Type = "ClearBase",
					Run = function() --[[ Run | Line: 1181 | Upvalues: v5 (ref), v1 (ref) ]]
						v5:Enable("Building")
						return v1.GetRemoteFunction("ClearPlot"):InvokeServer()
					end,
					Cancel = function() --[[ Cancel | Line: 1185 ]]
						return true
					end
				})
			end
		})
		v4.new(v.PackUpButton, {
			AddHoverButton = true,
			Click = function() --[[ Click | Line: 1194 | Upvalues: v18 (ref), t3 (ref), v1 (ref) ]]
				v18.Prompt({
					Type = "PackUpBase",
					Run = function() --[[ Run | Line: 1197 | Upvalues: t3 (ref), v1 (ref) ]]
						t3:ExitMode()
						return v1.GetRemoteFunction("RemovePlot"):InvokeServer()
					end,
					Cancel = function() --[[ Cancel | Line: 1201 ]]
						return true
					end
				})
			end
		})
		v4.new(v.ManageButton, {
			AddHoverButton = true,
			Click = function() --[[ Click | Line: 1210 | Upvalues: t3 (ref) ]]
				t3.OpenManage()
			end
		})
		v4.new(v.ShopButton, {
			AddHoverButton = true,
			Click = function() --[[ Click | Line: 1217 | Upvalues: v28 (ref) ]]
				v28.Open()
			end
		})
	end
	v2.AddStateCallback(TopFrame, "OnOpen", function() --[[ Line: 1223 | Upvalues: t3 (ref) ]]
		t3:OnOpen()
	end)
	v2.AddStateCallback(TopFrame, "OnCleanup", function() --[[ Line: 1226 | Upvalues: t3 (ref) ]]
		t3:Cleanup()
	end)
	v2.AddStateCallback(TopFrame, "OnClose", function() --[[ Line: 1229 | Upvalues: t3 (ref) ]]
		t3:ExitMode()
	end)
	v5:GetSignal("UnselectBuilding"):Connect(function() --[[ Line: 1233 | Upvalues: selectItem (ref), setHiddenBuildFrame (ref) ]]
		selectItem()
		setHiddenBuildFrame(false)
	end)
	v5:GetSignal("ExitBuildMode"):Connect(function() --[[ Line: 1237 | Upvalues: t3 (ref) ]]
		t3:ExitMode()
	end)
	v5:GetSignal("SetFrameHidden"):Connect(function(p1) --[[ Line: 1241 | Upvalues: v15 (ref), v5 (ref), setHiddenBuildFrame (ref) ]]
		if not v15.IsMobileInputType() then
			return
		end
		if v5:HasPlot() then
			setHiddenBuildFrame(p1)
		end
	end)
	v4.new(ShowFrame.ShowButton, {
		Click = function() --[[ Click | Line: 1248 | Upvalues: setHiddenBuildFrame (ref) ]]
			setHiddenBuildFrame(false)
		end
	})
	v4.new(ContainerFrame.HideButton, {
		Click = function() --[[ Click | Line: 1254 | Upvalues: v42 (ref), BuildFrame (ref), v2 (ref) ]]
			v42 = true
			for k, v in pairs(BuildFrame:GetChildren()) do
				v2.UpdateFrame(v)
			end
		end
	})
	v5.ErrorSignal:Connect(setPlotPlacementErrors)
	v2.AddFrame(ManageFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ManageFrame.Position,
		ClosePosition = ManageFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = ManageFrame.Menu.Content.Slots
	})
	v2.AddStateCallback(ManageFrame, "OnOpen", function() --[[ Line: 1270 | Upvalues: t3 (ref), v42 (ref), BuildFrame (ref), v2 (ref) ]]
		t3:OnOpenManage()
		v42 = true
		for k, v in pairs(BuildFrame:GetChildren()) do
			v2.UpdateFrame(v)
		end
	end)
	v2.AddStateCallback(ManageFrame, "OnClose", function() --[[ Line: 1274 | Upvalues: setHiddenBuildFrame (ref) ]]
		setHiddenBuildFrame(false)
	end)
	v4.new(ManageFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 1278 | Upvalues: t3 (ref) ]]
			t3.CloseManage()
		end
	})
	v2.AddFrame(BuildFrame, {
		TweenAnimation = true,
		ResetSelectionOnOpen = true,
		OpenPosition = BuildFrame.Position,
		ClosePosition = BuildFrame.Position + UDim2.new(0, 0, 0.5, 0),
		TweenStyle = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	})
	v2.AddFrame(ShowFrame, {
		TweenAnimation = true,
		OpenPosition = ShowFrame.Position,
		ClosePosition = ShowFrame.Position + UDim2.new(0, 0, 0.5, 0),
		TweenStyle = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		CheckVisibility = function() --[[ CheckVisibility | Line: 1295 | Upvalues: v42 (ref), v33 (ref), v5 (ref) ]]
			return v42 and (v33:IsInAction("BuildMode") and v5:HasPlot())
		end
	})
	for k, v in pairs({ ContainerFrame.Toggles, ShowFrame.Toggles }) do
		for k2, v3 in pairs(v:GetChildren()) do
			if v3:IsA("Frame") then
				local function setMode() --[[ setMode | Line: 1303 | Upvalues: v5 (ref), v3 (copy), t (ref), v14 (ref) ]]
					local v1 = v5.BuildToggles[v3.Name]
					v3.TextLabel.Text = t[v3.Name][v1 or false]
					v3.ToggleButton.Top.Off.Visible = not v1
					v3.ToggleButton.Top.On.Visible = v1
					v14.SetButtonColor(v3.ToggleButton, "Diagonal", if v1 then "Green" else "Red")
				end
				v5:GetSignal(v3.Name):Connect(setMode)
				local v12 = v5.BuildToggles[v3.Name]
				v3.TextLabel.Text = t[v3.Name][v12 or false]
				v3.ToggleButton.Top.Off.Visible = not v12
				v3.ToggleButton.Top.On.Visible = v12
				local SetButtonColor = v14.SetButtonColor
				SetButtonColor(v3.ToggleButton, "Diagonal", if v12 then "Green" else "Red")
				v4.new(v3.ToggleButton, {
					Click = function() --[[ Click | Line: 1314 | Upvalues: v5 (ref), v3 (copy) ]]
						v5.BuildToggles[v3.Name] = not v5.BuildToggles[v3.Name]
						v5:GetSignal(v3.Name):Fire()
					end
				})
			end
		end
	end
	v2.AddFrame(ContainerFrame, {
		TweenAnimation = true,
		NavigateTarget = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.5, 0),
		TweenStyle = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		CheckVisibility = function() --[[ CheckVisibility | Line: 1326 | Upvalues: v42 (ref), v33 (ref), v5 (ref) ]]
			return not v42 and (v33:IsInAction("BuildMode") and v5:HasPlot())
		end
	})
	v2.AddStateCallback(ContainerFrame, "OnOpen", setMobileMovementControls)
	v2.AddStateCallback(ContainerFrame, "OnClose", setMobileMovementControls)
	v2.AddFrame(PlacePlotFrame, {
		TweenAnimation = true,
		OpenPosition = PlacePlotFrame.Position,
		ClosePosition = PlacePlotFrame.Position + UDim2.new(0, 0, 0.5, 0),
		TweenStyle = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		CheckVisibility = function() --[[ CheckVisibility | Line: 1340 | Upvalues: v33 (ref), v5 (ref) ]]
			return v33:IsInAction("BuildMode") and not v5:HasPlot()
		end
	})
	v21:AddControls("BuildTopFrame", { Enum.KeyCode.DPadUp }, function() --[[ Line: 1347 | Upvalues: v20 (ref), TopFrame (ref) ]]
		v20.SetGamepadSelection(TopFrame.Other:FindFirstChild("CloseButton", true))
	end, function() --[[ Line: 1349 | Upvalues: v20 (ref), v2 (ref), TopFrame (ref) ]]
		return v20.CanNavigateHUD() and v2.IsFrameOpen(TopFrame)
	end)
	v21:AddControls("BuildTogglesFrame", { Enum.KeyCode.DPadLeft }, function() --[[ Line: 1355 | Upvalues: v42 (ref), ShowFrame (ref), ContainerFrame (ref), v20 (ref) ]]
		v20.SetGamepadSelection((v42 and ShowFrame.Toggles or ContainerFrame.Toggles).GlobalSnapping.ToggleButton)
	end, function() --[[ Line: 1358 | Upvalues: v20 (ref), v2 (ref), ContainerFrame (ref), ShowFrame (ref) ]]
		return v20.CanNavigateHUD() and (v2.IsFrameOpen(ContainerFrame) or v2.IsFrameOpen(ShowFrame))
	end)
	v21:AddControls("BuildHideFrame", { Enum.KeyCode.DPadDown }, function() --[[ Line: 1364 | Upvalues: v2 (ref), ContainerFrame (ref), ShowFrame (ref), setHiddenBuildFrame (ref), v42 (ref), PlacePlotFrame (ref), v20 (ref), v33 (ref) ]]
		if v2.IsFrameOpen(ContainerFrame) or v2.IsFrameOpen(ShowFrame) then
			setHiddenBuildFrame(not v42)
			return
		end
		if not v2.IsFrameOpen(PlacePlotFrame) then
			return
		end
		v20.SetGamepadSelection(PlacePlotFrame.SaveSlots.Content:FindFirstChild(v33:GetPlotSave()).Content)
	end, function() --[[ Line: 1370 | Upvalues: v20 (ref) ]]
		return v20.CanNavigateHUD()
	end)
	for v43, v52 in v33.PlayerData.UnlockedFurniture:GetChildren() do
		if not v52.Value then
			v52:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1379 | Upvalues: v52 (copy), v31 (ref), t2 (ref), createItem (ref) ]]
				if not v52.Value then
					return
				end
				local v1 = v31[v52.Name]
				if not t2[v1] then
					createItem(v1, true)
				end
			end)
		end
	end
end
t3:Init()
return t3