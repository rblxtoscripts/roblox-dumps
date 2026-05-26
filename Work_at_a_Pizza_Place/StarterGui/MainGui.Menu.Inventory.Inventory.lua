-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Table")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
local v3 = Library:Load("Network")
local LocalPlayer = game.Players.LocalPlayer
local v4 = script.Parent
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local ScrollingFrame = v4:WaitForChild("ScrollingFrame")
local List = ScrollingFrame:WaitForChild("List")
local Template = v4:WaitForChild("Template")
local DropDownButton = ScrollingFrame:WaitForChild("DropDownButton")
v4.Parent:WaitForChild("Backpack")
local ViewCollection = ScrollingFrame:WaitForChild("ViewCollection")
local Tabs = v4:WaitForChild("Tabs")
local VehiclePlacement = require(PlayerGui:WaitForChild("TopScreenGui"):WaitForChild("VehiclePlacement"):WaitForChild("VehiclePlacement"))
local v5 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local StickerDatabase = require(game.ReplicatedStorage:WaitForChild("StickerDatabase"))
local AssetLibraryManager = require(game.ReplicatedStorage:WaitForChild("AssetLibraryManager"))
local v6 = GuiManager:RegisterWindow(v4, "Right", "Right")
local v7 = GuiManager:RegisterTabs(v4, Tabs, true)
local v8 = GuiManager:RegisterListView(v4, List)
local v9 = GuiManager:RegisterDropdownMenu(v4, DropDownButton, "All")
local v10 = "Furniture"
local v11 = "All"
local v12 = nil
local v13 = nil
local v14 = nil
local v15 = false
v8.InternalHeader = DropDownButton
v8.AutoResize = true
local v16
if MainGui.AbsoluteSize.X < v4.AbsoluteSize.X * 3 then
	Template.Quantity.Size = UDim2.new(0.5, 0, 0.45, 0)
	Template.Size = UDim2.new(0, 65, 0, 65)
	v8:SetCellPadding(UDim2.new(0, 1, 0, 1))
	v16 = true
else
	v16 = false
end
if v5.GamepadEnabled then
	Template.Size = UDim2.new(0, 110, 0, 110)
	v8:SetCellPadding(UDim2.new(0, 3, 0, 3))
end
v6:SetConsoleSize(UDim2.new(0, 360, 1, 0))
v6.FirstSelectedObject = DropDownButton
v7:SetConsoleSize(UDim2.new(0, 240, 0, 50))
GuiService:AddSelectionTuple("InventoryGroup", List, DropDownButton, ViewCollection)
v9.MaxScreenCoverageScaleY = 1
local v17 = nil
local v18 = nil
local v19 = nil
local v20 = nil
local Presents = game.ReplicatedStorage._v6FiRE_Additions.Presents
local RefreshInventory = Presents.RefreshInventory
local t = {}
local v21 = true
local v22 = 0
local function updatePresentInfo(p1) --[[ updatePresentInfo | Line: 111 | Upvalues: t (copy), v22 (ref) ]]
	local v1 = p1.Name
	local v2 = string.match(p1.TextureId, "AssetID=(%d+)")
	if not v2 then
		warn((("present \'%*\' TextureId does not follow the normal format (http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=<ModelId>)"):format(v1)))
		v2 = "3942186680"
	end
	local v3 = t[v1] or {
		Quantity = 0,
		Type = "Gear",
		ModelId = v2,
		Name = v1,
		_Tools = {}
	}
	if not table.find(v3._Tools, p1) then
		v22 = v22 + 1
		table.insert(v3._Tools, p1)
		v3.Quantity = #v3._Tools
	end
	t[v1] = v3
end
local function getPresentSafeTools(p1) --[[ getPresentSafeTools | Line: 141 | Upvalues: t (copy) ]]
	local t2 = {}
	for k, v in pairs(t) do
		table.insert(t2, v)
	end
	for v1, v2 in p1 do
		table.insert(t2, v2)
	end
	return t2
end
local function _unequipPresent(p1) --[[ _unequipPresent | Line: 158 | Upvalues: t (copy) ]]
	for v1, v2 in t[p1]._Tools do
		v2.Parent = nil
	end
	return true
end
local function _equipPresent(p1) --[[ _equipPresent | Line: 169 | Upvalues: v5 (copy), Dialog (copy), t (copy), LocalPlayer (copy) ]]
	if v5.PlaceSettings.GearsDisabled then
		Dialog:ShowMessage("This feature is disabled", "Gears are disabled in this place")
		return false
	end
	local v1 = t[p1]._Tools[1]
	if v1 then
		v1.Parent = LocalPlayer.Backpack
		return true
	else
		return false
	end
end
local function isHoldingPresent() --[[ isHoldingPresent | Line: 187 | Upvalues: LocalPlayer (copy), t (copy) ]]
	if not LocalPlayer.Character then
		return false
	end
	for v1, v2 in t do
		for v3, v4 in v2._Tools do
			if v4.Parent == LocalPlayer.Character then
				return true
			end
		end
	end
	return false
end
local function toggleEquipPresentsOfType(p1, p2) --[[ toggleEquipPresentsOfType | Line: 205 | Upvalues: v21 (ref), isHoldingPresent (copy), t (copy), v5 (copy), Dialog (copy), LocalPlayer (copy) ]]
	if v21 then
		return false
	end
	if isHoldingPresent() then
		return false
	end
	if p2 then
		for v1, v2 in t[p1]._Tools do
			v2.Parent = nil
		end
		return true
	else
		if v5.PlaceSettings.GearsDisabled then
			Dialog:ShowMessage("This feature is disabled", "Gears are disabled in this place")
			return false
		end
		local v3 = t[p1]._Tools[1]
		if v3 then
			v3.Parent = LocalPlayer.Backpack
			return true
		else
			return false
		end
	end
end
local function updatePresents(p1) --[[ updatePresents | Line: 227 | Upvalues: v5 (copy), updatePresentInfo (copy), v10 (ref), RefreshInventory (copy), v21 (ref), t (copy) ]]
	for v1, v2 in p1 do
		if v5.PresentData[v2.Name] then
			updatePresentInfo(v2)
		end
	end
	if v10 == "Gear" then
		RefreshInventory:Invoke()
	end
	if v21 == false then
		return
	end
	task.wait()
	for v3, v4 in t do
		for v52, v6 in t[v3]._Tools do
			v6.Parent = nil
		end
	end
end
local function awaitGiftReplicationComplete(p1) --[[ awaitGiftReplicationComplete | Line: 256 | Upvalues: v22 (ref) ]]
	while v22 < p1 do
		task.wait(0.1)
	end
end
local function stopTrackingPresent(p1) --[[ stopTrackingPresent | Line: 263 | Upvalues: t (copy), LocalPlayer (copy) ]]
	p1.AncestryChanged:Wait()
	local v1 = p1.Name
	local v2 = t[v1]
	if not v2 then
		return
	end
	local _Tools = v2._Tools
	local v3 = table.find(_Tools, p1)
	if v3 then
		table.remove(_Tools, v3)
	end
	v2.Quantity = #_Tools
	if v2.Quantity <= 0 then
		t[v1] = nil
	else
		_Tools[1].Parent = LocalPlayer.Backpack
	end
end
local function playerRespawnInit(p1) --[[ playerRespawnInit | Line: 291 | Upvalues: v17 (ref), v18 (ref), v19 (ref), v20 (ref), v22 (ref), t (copy), LocalPlayer (copy), updatePresents (copy), v10 (ref), RefreshInventory (copy), v21 (ref), Dialog (copy) ]]
	if v17 then
		v17:Disconnect()
	end
	if v18 then
		v18:Disconnect()
	end
	if v19 then
		v19:Disconnect()
	end
	if v20 then
		v20:Disconnect()
	end
	v22 = 0
	table.clear(t)
	local Backpack = LocalPlayer:WaitForChild("Backpack")
	task.spawn(function() --[[ Line: 304 | Upvalues: updatePresents (ref), Backpack (copy) ]]
		updatePresents(Backpack:GetChildren())
	end)
	v17 = Backpack.ChildAdded:Connect(function(p1) --[[ Line: 308 | Upvalues: updatePresents (ref) ]]
		updatePresents({ p1 })
	end)
	v18 = Backpack.ChildRemoved:Connect(function(p1) --[[ Line: 313 | Upvalues: v10 (ref), RefreshInventory (ref) ]]
		if not p1:IsA("Tool") or v10 ~= "Gear" then
			return
		end
		RefreshInventory:Invoke()
	end)
	v19 = p1.ChildAdded:Connect(function(p1) --[[ Line: 320 | Upvalues: v10 (ref), RefreshInventory (ref) ]]
		if not p1:IsA("Tool") or v10 ~= "Gear" then
			return
		end
		RefreshInventory:Invoke()
	end)
	v20 = p1.ChildRemoved:Connect(function(p1) --[[ Line: 326 | Upvalues: v10 (ref), RefreshInventory (ref) ]]
		if not p1:IsA("Tool") or v10 ~= "Gear" then
			return
		end
		RefreshInventory:Invoke()
	end)
	p1:WaitForChild("Humanoid").Died:Once(function() --[[ Line: 334 | Upvalues: v21 (ref) ]]
		v21 = true
	end)
	local v1 = p1:WaitForChild("ReplicatedPresents").Value
	while v22 < v1 do
		task.wait(0.1)
	end
	v21 = false
	if not (v1 >= 80) then
		return
	end
	Dialog:ShowMessage("Inventory Warning", (("You have %* Presents. You can only store a maximum of 100. Consider opening some."):format(v1)))
end
local function getNextPresent(p1, p2) --[[ getNextPresent | Line: 350 | Upvalues: t (copy) ]]
	for v1, v2 in t[p2]._Tools do
		if v2 ~= p1 then
			return v2
		end
	end
end
local function onOpenCancel(p1) --[[ onOpenCancel | Line: 358 | Upvalues: LocalPlayer (copy) ]]
	task.wait()
	p1.Parent = LocalPlayer.Backpack
	task.wait()
	p1.Parent = nil
end
Presents.RemovePresentFromInventory.Event:Connect(stopTrackingPresent)
Presents.GetNextPresent.OnInvoke = getNextPresent
Presents.PresentOpenCancel.Event:Connect(onOpenCancel)
task.spawn(function() --[[ Line: 370 | Upvalues: LocalPlayer (copy), playerRespawnInit (copy), v21 (ref) ]]
	local v1 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	LocalPlayer.CharacterAdded:Connect(playerRespawnInit)
	LocalPlayer.CharacterRemoving:Connect(function() --[[ Line: 374 | Upvalues: v21 (ref) ]]
		v21 = true
	end)
	playerRespawnInit(v1)
end)
function StickerDisplayFunction(p1, p2, p3, p4) --[[ Line: 384 | Upvalues: v5 (copy) ]]
	p2.Thumbnail.Image = "rbxassetid://" .. p3.ImageId
	p2.Rarity.Visible = true
	p2.Rarity.Text = p3.Rarity
	p2.Rarity.BackgroundColor3 = v5.CapsuleTypeToColor[p3.Rarity]
	p2.Quantity.Text = ""
	local _ = _G.SelectedStickerIndex == p3.Index
end
function ListDisplayFunction(p1, p2, p3, p4) --[[ Line: 403 | Upvalues: v5 (copy), Template (copy), LocalPlayer (copy) ]]
	p2.Thumbnail.Image = if p3.AssetId == 142751224 then "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=8020362267" else "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. p3.ModelId
	if p3.Year or p3.Rarity then
		p2.Rarity.Visible = true
		p2.Rarity.Text = p3.Year or p3.Rarity
		p2.Rarity.BackgroundColor3 = v5.CapsuleTypeToColor[p3.Rarity] or p3.Year and v5.CapsuleTypeToColor.Limited or Color3.fromRGB(0, 0, 0)
	else
		p2.Rarity.Visible = false
	end
	if p3.Quantity > 1 then
		local v4 = v5.FormatNumber("Multiplier", p3.Quantity, p2.Quantity)
		if not v4 then
			v4 = tostring(p3.Quantity)
		end
		p2.Quantity.Text = v4
	else
		p2.Quantity.Text = ""
	end
	if p2:FindFirstChild("None") then
		p2.Thumbnail.Visible = true
		p2.None:Destroy()
	end
	p2.Visible = true
	p2.Thumbnail.ImageTransparency = 0
	p2.ImageColor3 = Template.ImageColor3
	p2.Active = true
	p2.Lock.Visible = false
	if LocalPlayer.Backpack:FindFirstChild(p3.Name) or LocalPlayer.Character:FindFirstChild(p3.Name) then
		p2.ImageColor3 = Color3.fromRGB(247, 169, 90)
	end
	local _ = p1.ListView.MultiSelectMode and (not LocalPlayer.Backpack:FindFirstChild(p3.Name) and LocalPlayer.Character:FindFirstChild(p3.Name))
end
local isFurnitureSeasonal = require(ReplicatedStorage._v6FiRE_Additions.FurnitureSorting.isFurnitureSeasonal)
function GetSortedItemsFromInventory() --[[ GetSortedItemsFromInventory | Line: 472 | Upvalues: v12 (ref), v5 (copy), v10 (ref), v11 (ref), isFurnitureSeasonal (copy), getPresentSafeTools (copy) ]]
	local t = {}
	if not v12 then
		return
	end
	for i, v in ipairs(v12) do
		if v5.CategoryToType[v.Category] == v10 and (v.Category == v11 or (v11 == "All" or (if v11 == "Seasonal" and v.Category ~= "Seasonal" then v.Name and isFurnitureSeasonal(v.Name) else false))) then
			table.insert(t, v)
		end
	end
	if v10 == "Gear" then
		t = getPresentSafeTools(t)
	end
	return t
end
function SortByFurnitureSet() --[[ SortByFurnitureSet | Line: 495 | Upvalues: v12 (ref) ]]
	local tbl = {}
	if not v12 then
		return
	end
	for i, v in ipairs(v12) do
		local v1 = v.Name:match("%a+")
		tbl[v1] = tbl[v1] or {}
		table.insert(tbl[v.Name:match("%a+")], v)
	end
	local t = {}
	for k, v in pairs(tbl) do
		if #v >= 3 then
			for i, v2 in ipairs(v) do
				table.insert(t, v2)
			end
		end
	end
	return t
end
local t2 = {
	Furniture = "All",
	WallsFloors = "Walls",
	Clothing = "Hats",
	Gear = "All",
	Vehicles = "All",
	Stickers = "All"
}
function RefreshScrollingFrame() --[[ RefreshScrollingFrame | Line: 531 | Upvalues: v8 (copy), ViewCollection (copy), DropDownButton (copy), v15 (ref), v10 (ref), Template (copy), v14 (ref) ]]
	v8.MultiSelectMode = false
	ViewCollection.Visible = false
	v8.InternalHeader = DropDownButton
	if v15 or v10 == "Gear" then
		v8.MultiSelectMode = true
	elseif v10 == "Stickers" then
		ViewCollection.Visible = true
		v8.InternalHeader = ViewCollection
	end
	if v10 == "Stickers" then
		v8:UpdateData(v14, Template, StickerDisplayFunction, not _G.GamepadEnabled)
	else
		v8:UpdateData(GetSortedItemsFromInventory(v10), Template, ListDisplayFunction, not _G.GamepadEnabled)
	end
end
local Furniture = v4:WaitForChild("Tabs"):WaitForChild("TabButtons"):WaitForChild("Furniture")
function TabChanged(p1, p2) --[[ TabChanged | Line: 560 | Upvalues: v4 (copy), v12 (ref), v10 (ref), v11 (ref), t2 (copy), Furniture (ref), v5 (copy), DropDownButton (copy), v8 (copy), ViewCollection (copy), v9 (copy), GuiService (copy) ]]
	if p1 ~= v4 or not v12 then
		return
	end
	v10 = p2.Name
	v11 = t2[v10]
	Furniture = p2
	local v1 = v5.TypeToCategoryInventoryList[v10]
	if v1 == nil or #v1 == 0 then
		DropDownButton.Visible = false
		DropDownButton.NextSelectionDown = nil
		v8.InternalHeader = nil
		if p2.Name == "Stickers" then
			v8.InternalHeader = ViewCollection
		end
	else
		DropDownButton.Visible = true
		v8.InternalHeader = DropDownButton
	end
	v9:SetList(v1, v11, v5.InventorySubcategoryIcons, v5.InventorySubcategoryIcons[v11])
	RefreshScrollingFrame()
	if not (_G.GamepadEnabled and v4.Visible) then
		return
	end
	if DropDownButton.Visible and #v8.ListItems > 0 then
		GuiService.SelectedObject = DropDownButton
		return
	end
	if DropDownButton.Visible or not (#v8.ListItems > 0) then
		return
	end
	GuiService.SelectedObject = v8.ListItems[1].Object
end
UIEvents.TabChanged.Event:connect(TabChanged)
function v6.StartStickerPlacement(p1, p2, p3) --[[ StartStickerPlacement | Line: 674 | Upvalues: StickerDatabase (copy), MainGui (copy), v4 (copy), v6 (copy), v5 (copy) ]]
	local v1 = StickerDatabase[p2]
	_G.SelectedStickerIndex = v1.Index
	spawn(function() --[[ Line: 680 | Upvalues: v1 (copy) ]]
		local Decal = Instance.new("Decal")
		Decal.Texture = "rbxassetid://" .. v1.ImageId
		game:GetService("ContentProvider"):PreloadAsync({ Decal })
		Decal:Destroy()
	end)
	if p3 and (_G.GamepadEnabled or MainGui.AbsoluteSize.X < v4.AbsoluteSize.X * 4) then
		v6:SetVisible(false)
	end
	workspace.Main.GiveStickerTool:FireServer(v5.CapsuleTypeToColor[v1.Rarity], v1.Index)
	if not game:GetService("UserInputService").TouchEnabled then
		return
	end
	workspace.MessageService.ShowHint.ShowHint:Fire("Tap on wall to place sticker", 2)
end
local v23 = nil
UIEvents.ListItemPressed.Event:connect(function(p1, p2, p3, p4) --[[ Line: 704 | Upvalues: v4 (copy), v12 (ref), List (copy), v6 (copy), v5 (copy), Dialog (copy), LocalPlayer (copy), VehiclePlacement (copy), v15 (ref), v8 (copy), AssetLibraryManager (copy), v23 (ref), v2 (copy), v3 (copy), v16 (ref), v1 (copy), t (copy), v21 (ref), isHoldingPresent (copy), RefreshInventory (copy) ]]
	if p1 ~= v4 or (not v12 or p2 ~= List) then
		return
	end
	if p4.ImageId ~= nil then
		v6:StartStickerPlacement(p4.Index, true)
		return
	end
	if p4.Type == "Vehicles" then
		if v5.PlaceSettings.CarPlacementDisabled then
			Dialog:ShowMessage("This feature is disabled", "Vehicle spawning is disabled in this place")
			return
		end
		v6:SetVisible(false)
		if p4.Category == "Boats" and not LocalPlayer:GetAttribute("WaterEnabled") then
			Dialog:ShowMessage("Enable \'Swimable Water\'", "You must turn on \'Swimable Water\' in settings to spawn boat")
		else
			VehiclePlacement:StartPlacement(p4)
		end
	elseif v15 then
		v8:DisableListItems(true)
		local v13 = AssetLibraryManager:GetAssetById(p4.AssetId)
		if v13 and not p4.Unsellable then
			v23 = nil
			local Price = v13.Price
			if Price then
				local v22 = if v13.AssetId == 142751224 then "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=8020362267" else "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. v13.ModelId
				local StartBulkSell = game.ReplicatedStorage._v6FiRE_Additions.BulkFurniture.StartBulkSell
				StartBulkSell:Fire(tonumber(v13.AssetId), v22, math.floor(Price / 4), v13.Name)
			end
		else
			v2:PlaySound("Invalid")
			Dialog:ShowMessage("Unsellable", "You cannot sell this item.")
		end
		v8:DisableListItems(false)
	else
		v23 = p4
		if p4.Type == "Furniture" then
			v3:Fire("InventoryItemSelected", p4.AssetId, v16)
			return
		end
		if p4.Type == "WallsFloors" then
			v1:SendData("SetWallFloor", "HouseChannel", nil, p4.AssetId)
			return
		end
		if p4.Type ~= "Gear" then
			return
		end
		local v32 = LocalPlayer.Backpack:FindFirstChild(p4.Name) or LocalPlayer.Character:FindFirstChild(p4.Name)
		local v42 = if t[p4.Name] == nil then false else true
		if v32 then
			if not v42 then
				v1:SendData("RemoveGear", "PlayerChannel", nil, v32, v42)
				return
			end
			local v52 = p4.Name
			local v62
			if v21 or isHoldingPresent() then
				v62 = false
			else
				for v7, v82 in t[v52]._Tools do
					v82.Parent = nil
				end
				v62 = true
			end
			if not v62 then
				RefreshInventory:Invoke()
			end
		elseif v42 then
			local v9 = p4.Name
			local v10
			if v21 or isHoldingPresent() then
				v10 = false
			elseif v5.PlaceSettings.GearsDisabled then
				Dialog:ShowMessage("This feature is disabled", "Gears are disabled in this place")
				v10 = false
			else
				local v11 = t[v9]._Tools[1]
				if v11 then
					v11.Parent = LocalPlayer.Backpack
					v10 = true
				else
					v10 = false
				end
			end
			if not v10 then
				RefreshInventory:Invoke()
			end
		else
			if v5.PlaceSettings.GearsDisabled then
				Dialog:ShowMessage("This feature is disabled", "Gears are disabled in this place")
				return
			end
			v1:SendData("GiveItem", "PlayerChannel", nil, p4.AssetId, v42)
		end
	end
end)
workspace.Main.SellItemsMode.OnClientEvent:connect(function() --[[ Line: 824 | Upvalues: v4 (copy), v15 (ref), v6 (copy) ]]
	v4.Sell.Visible = true
	v15 = true
	v6:SetVisible(true)
end)
workspace.Main.InventoryItemQuantityChanged.OnClientEvent:connect(function(p1, p2) --[[ Line: 832 | Upvalues: v12 (ref), Furniture (ref), v8 (copy), Template (copy) ]]
	if not v12 then
		return
	end
	for i, v in ipairs(v12) do
		if v.AssetId == p1 then
			v.Quantity = p2
			if not (v.Quantity <= 0) then
				v8:UpdateData(GetSortedItemsFromInventory(Furniture.Name), Template, ListDisplayFunction, true)
				return
			end
			table.remove(v12, i)
			v8:UpdateData(GetSortedItemsFromInventory(Furniture.Name), Template, ListDisplayFunction, true)
			return
		end
	end
end)
workspace.Main.InventoryItemAdded.OnClientEvent:connect(function(p1) --[[ Line: 862 | Upvalues: v12 (ref), Furniture (ref), v5 (copy), v4 (copy) ]]
	if not (v12 and Furniture) then
		return
	end
	p1.Type = v5.CategoryToType[p1.Category]
	table.insert(v12, 1, p1)
	TabChanged(v4, Furniture)
end)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 875 | Upvalues: v4 (copy), v23 (ref), v12 (ref), v13 (ref), v1 (copy), v14 (ref), Dialog (copy), v5 (copy), LocalPlayer (copy), Furniture (ref), v15 (ref) ]]
	if p1 == v4 and p2 then
		if _G.TutorialEnabled then
			workspace.TutorialService.PlayerAction:FireServer("InventoryOpened", true)
		end
		v23 = nil
		local v16, v2 = v1:SendData("GetInventory", "PlayerChannel", 5)
		v12 = v16
		v13 = v2
		v14 = v1:SendData("GetOwnedStickers", "PlayerChannel", 5) or v1:SendData("GetOwnedStickers", "PlayerChannel", 5) or {}
		local t = {}
		for i, v in ipairs(v14) do
			table.insert(t, 1, v)
		end
		v14 = t
		if v16 == nil then
			Dialog:ShowMessage("Error", "There was a error while loading your inventory. Try again later")
			return
		end
		for i, v in ipairs(v16) do
			v16[i].Type = v5.CategoryToType[v.Category]
		end
		RefreshScrollingFrame()
		if LocalPlayer.Character:FindFirstChild("Shortcut") then
			LocalPlayer.Character.Shortcut.Parent = LocalPlayer.Backpack
		end
		TabChanged(v4, Furniture)
	else
		if p1 ~= v4 or p2 then
			return
		end
		v4.Sell.Visible = false
		v15 = false
		v4.BackpackList.Visible = false
	end
end)
ViewCollection.MouseButton1Click:connect(function() --[[ Line: 947 | Upvalues: v6 (copy), GuiManager (copy) ]]
	v6:SetVisible(false)
	wait(0.3)
	GuiManager:GetWindowDataByName("StickerCollection"):SetVisible(true)
end)
UIEvents.DropDownMenuOpened.Event:connect(function(p1) --[[ Line: 955 | Upvalues: v4 (copy), ScrollingFrame (copy) ]]
	if p1 ~= v4 then
		return
	end
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
end)
UIEvents.DropDownMenuOptionSelected.Event:connect(function(p1, p2, p3) --[[ Line: 962 | Upvalues: v4 (copy), v11 (ref), t2 (copy), v10 (ref) ]]
	if p1 ~= v4 then
		return
	end
	v11 = p3
	t2[v10] = p3
	RefreshScrollingFrame()
end)
function RefreshData() --[[ RefreshData | Line: 974 | Upvalues: v12 (ref), v13 (ref), v1 (copy), v14 (ref) ]]
	local v15, v2 = v1:SendData("GetInventory", "PlayerChannel", 5)
	v12 = v15
	v13 = v2
	v14 = v1:SendData("GetOwnedStickers", "PlayerChannel", 5) or v1:SendData("GetOwnedStickers", "PlayerChannel", 5)
end
RefreshData()
workspace.Main.RefreshInventory.OnClientEvent:connect(RefreshData)
v7:SetFirstTabPressed(Tabs.TabButtons.Furniture)
local function getAssetQuantity(p1) --[[ getAssetQuantity | Line: 988 | Upvalues: v12 (ref) ]]
	local v2 = tostring(p1)
	for k, v in pairs(v12) do
		if tostring(v.AssetId) == v2 then
			return v.Quantity
		end
	end
end
game.ReplicatedStorage._v6FiRE_Additions.BulkFurniture.Client_GetAssetQuantity.OnInvoke = getAssetQuantity
RefreshInventory.OnInvoke = RefreshScrollingFrame
workspace.Main.CloseBackpack.Event:Connect(function() --[[ Line: 1000 | Upvalues: v6 (copy) ]]
	v6:SetVisible(false)
end)