-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
local v3 = Library:Load("Network")
local v4 = Library:Load("Table")
local v5 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local GuiService = game:GetService("GuiService")
game:GetService("TextService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local Gui = PlayerGui:WaitForChild("Gui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v6 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local AssetLibraryManager = require(game.ReplicatedStorage:WaitForChild("AssetLibraryManager"))
local Admins = require(game.ReplicatedStorage.Admins)
local CategoryTabs = v5:WaitForChild("CategoryTabs")
local Template = CategoryTabs:WaitForChild("TabButtons"):WaitForChild("Template")
local CatalogTabs = v5:WaitForChild("CatalogTabs")
local ScrollingFrame = v5:WaitForChild("ScrollingFrame")
local List = ScrollingFrame:WaitForChild("List")
local Template_2 = List:WaitForChild("Template")
local GamePassTemplate = List:WaitForChild("GamePassTemplate")
local MoneyzTemplate = List:WaitForChild("MoneyzTemplate")
local Title = v5:WaitForChild("Title")
local CoinText = v5:WaitForChild("CoinCount"):WaitForChild("CoinText")
local CoinPurchaseWindow = v5:WaitForChild("CoinPurchaseWindow")
Template_2.Visible = false
GamePassTemplate.Visible = false
MoneyzTemplate.Visible = false
Template.Visible = false
local v7 = nil
task.spawn(function() --[[ Line: 52 | Upvalues: v6 (copy) ]]
	local t = { Enum.InfoType.GamePass, Enum.InfoType.Product }
	for i, v in ipairs({ v6.GamePasses, v6.Moneyz }) do
		for k, v2 in pairs(v) do
			local v1 = game:GetService("MarketplaceService"):GetProductInfo(v2.ProductId, t[i])
			if v1 and v1.PriceInRobux then
				game.ReplicatedStorage:SetAttribute(tostring(k), v1.PriceInRobux)
			end
		end
	end
end)
local v8 = GuiManager:RegisterWindow(v5, "Left", "Right", nil, nil, true)
v8.UseCursor = true
local v9 = GuiManager:RegisterTabs(v5, CatalogTabs)
local v10 = GuiManager:RegisterTabs(v5, CategoryTabs)
local v11 = GuiManager:RegisterListView(v5, List)
v11.MinNumColumbs = 4
v11.MaxNumColumbs = 6
local v12 = "Furniture"
local v13 = "All"
local v14 = nil
local CatalogLibrary = AssetLibraryManager.CatalogLibrary
_G.UnlockedFurniture = {}
local t = {
	Furniture = "All",
	WallsFloors = "Walls",
	Clothing = "Hats",
	Gear = "All",
	Vehicles = "All",
	GamePasses = "All",
	Moneyz = "All"
}
if _G.CanChat == false then
	CatalogLibrary["157972955"] = nil
end
for k, v in pairs(CatalogLibrary) do
	CatalogLibrary[k].Type = v6.CategoryToType[v.Category]
	CatalogLibrary[k].AssetId = tonumber(k)
end
local function MakeList(p1) --[[ MakeList | Line: 138 ]]
	local t = {}
	for k, v in pairs(p1) do
		v.AssetId = k
		t[v.Index] = v
	end
	return t
end
local t2 = {}
local v15 = false
for k, v in pairs(v6.GamePasses) do
	v.AssetId = k
	t2[v.Index] = v
end
local v16 = t2
local t3 = {}
for k, v in pairs(v6.Moneyz) do
	v.AssetId = k
	t3[v.Index] = v
end
for i, v in ipairs(v16) do
	if v.NameId == "PontoonBoat" and v6.IsPartyServer then
		table.remove(v16, i)
	end
end
workspace.Main.ProductPurchaseComplete.OnClientEvent:Connect(function(p1) --[[ Line: 165 | Upvalues: v2 (copy), v16 (copy), v6 (copy), v8 (copy), v14 (ref), v5 (copy) ]]
	if p1 == nil then
		return
	end
	v2:PlaySound("CashRegister")
	for i, v in ipairs(v16) do
		if v.NameId == p1 then
			v16[i].Owned = true
		end
	end
	if v6.Moneyz[p1] then
		v8:SetVisible(false)
	end
	if not v14 then
		return
	end
	TabChanged(v5, v14)
end)
UIEvents.ListItemPressed.Event:connect(function(p1, p2, p3, p4) --[[ Line: 195 | Upvalues: v5 (copy), List (copy), v6 (copy), Admins (copy), LocalPlayer (copy), Dialog (copy), v7 (ref), v2 (copy), v9 (copy), CatalogTabs (copy), v8 (copy) ]]
	if p1 ~= v5 or p2 ~= List then
		return
	end
	if p4.Category == "Moneyz" then
		if not v6.FreeMode and (not Admins[LocalPlayer.UserId] and (not LocalPlayer:FindFirstChild("IsQATester") and v6.IsTestPlace)) then
			Dialog:ShowMessage("Error", "You cannot buy items right now. Try rejoining the game.")
			return
		end
		if not _G.StartedPlaying then
			Dialog:ShowMessage("Error", "You cannot buy items right now. Try rejoining the game.")
			return
		end
		local v1 = workspace.Main.CheckForUncashedChecks:InvokeServer()
		if v6.FreeMode then
			workspace.Main.FreeProducts:FireServer(p4.ProductId)
			return
		end
		if v1 then
			Dialog:ShowMessage("", "You need to cash your check first before buying another.")
		else
			game:GetService("MarketplaceService"):PromptProductPurchase(LocalPlayer, p4.ProductId)
		end
	elseif p4.Category == "GamePasses" or p4.GamepassId and not v7[p4.GamepassId] then
		local ShowGamePassPrompt = workspace.Main.ShowGamePassPrompt
		ShowGamePassPrompt:Fire(p4.GamepassId or p4.NameId)
	elseif p4.VIP and not LocalPlayer:FindFirstChild("VIP") then
		v2:PlaySound("Invalid")
		if Dialog:GetChoice("VIP only", "This item is for VIP only", "Ok", "Get VIP") then
			return
		end
		v9:SetFirstTabPressed(CatalogTabs.TabButtons.GamePasses)
		workspace.Main.ShowGamePassPrompt:Fire("VIP")
	else
		local v3 = game.ReplicatedStorage:GetAttribute(p4.AssetId)
		if v3 and p4.Price ~= 0 then
			workspace.Main.ShowItemAdvertisement.ShowItemAdvertisement:Fire(p4)
			return
		end
		if v3 and p4.Price == 0 then
			game:GetService("MarketplaceService"):PromptProductPurchase(LocalPlayer, p4.ProductId)
			return
		end
		if p4.Price == 0 then
			return
		end
		if p4.Category ~= "Gear" then
			local AssetId = p4.AssetId
			game.ReplicatedStorage._v6FiRE_Additions.BulkFurniture.StartBulkPurchase:Fire(AssetId, "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. p4.ModelId or AssetId, p4.Price, tostring(p4.Name), p4)
			return
		end
		if not Dialog:GetChoice(p4.Name, tostring(p4.Price), "Buy", "Cancel") then
			return
		end
		v8.Object.BuyButtonPressed:Fire(p3, p4)
	end
end)
local isFurnitureSeasonal = require(ReplicatedStorage._v6FiRE_Additions.FurnitureSorting.isFurnitureSeasonal)
function GetSortedCatalog(p1) --[[ GetSortedCatalog | Line: 264 | Upvalues: CatalogLibrary (copy), v6 (copy), v12 (ref), v13 (ref), isFurnitureSeasonal (copy), v4 (copy) ]]
	local t = {}
	local tbl = {}
	for k, v in pairs(CatalogLibrary) do
		if not (v.DisabledOnConsole and _G.GamepadEnabled) and (v6.CategoryToType[v.Category] == v12 or v13 == "New") then
			local v1 = v.New and (if v.New > tick() then true else false)
			if v.Category == v13 or (v13 == "All" or v13 == "VIP only" and v.VIP) or (v13 == "New" and v1 or (if v13 == "Seasonal" and v.Category ~= "Seasonal" then v.Name and isFurnitureSeasonal(v.Name) else false)) then
				if v1 then
					table.insert(t, v)
					continue
				end
				if p1 and #tbl ~= 0 then
					local v3 = false
					for k2, v5 in pairs(tbl) do
						if v.Price < v5.Price then
							table.insert(tbl, k2, v)
							v3 = true
							break
						end
					end
					if not v3 then
						table.insert(tbl, v)
					end
					continue
				end
				table.insert(tbl, v)
			end
		end
	end
	return v4:Merge(t, tbl)
end
function SortByFurnitureSet() --[[ SortByFurnitureSet | Line: 305 | Upvalues: CatalogLibrary (copy) ]]
	local tbl = {}
	for i, v in ipairs(CatalogLibrary) do
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
function DisplayFunction(p1, p2, p3, p4) --[[ Line: 328 | Upvalues: v6 (copy), v7 (ref) ]]
	local v1 = game.ReplicatedStorage:GetAttribute(p3.AssetId)
	p2.RobuxPrice.Visible = if v1 == nil then false else not p3.Owned
	if p3.Category == "GamePasses" then
		p2.ItemName.Text = p3.Name
		p2.Thumbnail.Image = "rbxassetid://" .. p3.ImageId
		p2.RobuxPrice.PriceText.Text = v6.FormatNumber("Number", v1, p2.RobuxPrice.PriceText) or "???"
		p2.Owned.Visible = p3.Owned
		p2.Visible = v7[p3.NameId] or not v6.GamePasses[p3.NameId].Offsale
		p1.Disabled = false
	else
		if p3.Category == "Moneyz" then
			p2.Thumbnail.Image = "rbxassetid://" .. p3.ImageId
			p2.RobuxPrice.PriceText.Text = v6.FormatNumber("Number", v1, p2.RobuxPrice.PriceText) or "???"
			p2.Owned.Visible = p3.Owned
			p2.Amount.AmountText.Text = "+" .. v6.FormatNumber("Number", p3.Amount, p2.Amount.AmountText)
			p1.Disabled = false
			return
		end
		p2.Thumbnail.Image = "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. p3.ModelId
		p2.Thumbnail.New.Visible = p3.New and p3.New > tick() and true or false
		p2.Price.PriceText.Text = v6.FormatNumber("Number", math.floor(p3.Price), p2.Price.PriceText) or "???"
		p2.RobuxPrice.PriceText.Text = v1 or ""
		p2.Thumbnail.VIPIcon.Visible = p3.VIP and true or false
		p2.RobuxPrice.Visible = if v1 == nil then false else not p3.GamepassId or v7[p3.GamepassId]
		p2.Price.Visible = if p3.Price == 0 then false else not p3.GamepassId or v7[p3.GamepassId]
		p2.View.Visible = p3.GamepassId and not v7[p3.GamepassId]
		p2.RobuxPrice.Position = p3.Price ~= 0 and UDim2.new(0.5, 0, 0.85, -4) or UDim2.new(0.5, 0, 1, -4)
		p2.Thumbnail.ImageColor3 = Color3.new(255/255, 255/255, 255/255)
		p2.ItemName.Text = (if p3.GamepassId and not v7[p3.GamepassId] then " \240\159\148\146" else "") .. p3.Name
		p2.Visible = not p3.GamepassId or v7[p3.GamepassId] or not v6.GamePasses[p3.GamepassId].Offsale
	end
end
function UpdateListViewData() --[[ UpdateListViewData | Line: 394 | Upvalues: v7 (ref), v1 (copy), v16 (copy), v12 (ref), v11 (copy), GamePassTemplate (copy), Template_2 (copy) ]]
	if not v7 then
		v7 = v1:SendData("GetGamePasses", "PlayerChannel", 10) or (v1:SendData("GetGamePasses", "PlayerChannel", 10) or {})
		for i, v in ipairs(v16) do
			if v7[v.NameId] then
				v16[i].Owned = true
			end
		end
	end
	if v12 == "GamePasses" then
		v11:UpdateData(v16, GamePassTemplate, DisplayFunction)
	else
		v11:UpdateData(GetSortedCatalog(true), Template_2, DisplayFunction)
	end
end
UpdateListViewData()
local t4 = {}
local t5 = {
	Furniture = "Furniture",
	GamePasses = "Shop",
	Gear = "Gear",
	Moneyz = "Coins",
	WallsFloors = "Walls and Floors"
}
function TabChanged(p1, p2) --[[ TabChanged | Line: 433 | Upvalues: v5 (copy), CategoryTabs (copy), v13 (ref), CatalogTabs (copy), v12 (ref), t (copy), v14 (ref), Title (copy), t5 (copy), t4 (ref), ScrollingFrame (copy), CoinPurchaseWindow (copy), v15 (ref), v6 (copy), LocalPlayer (copy), Template (copy), v10 (copy), v11 (copy), GuiService (copy) ]]
	if p1 ~= v5 then
		return
	end
	if p2.Parent.Parent == CategoryTabs then
		v13 = p2.Name
		UpdateListViewData()
		return
	end
	if p2.Parent.Parent ~= CatalogTabs then
		return
	end
	v12 = p2.Name
	v13 = t[v12]
	v14 = p2
	Title.Text = t5[p2.Name]
	for i, v in ipairs(t4) do
		v:Destroy()
	end
	ScrollingFrame.Visible = p2.Name ~= "Moneyz"
	CoinPurchaseWindow.Visible = p2.Name == "Moneyz"
	if not v15 and p2.Name == "Moneyz" then
		v15 = true
		for i, v in ipairs(CoinPurchaseWindow:GetChildren()) do
			local v3 = v6.Moneyz[v.Name]
			if v3 then
				local v4 = game.ReplicatedStorage:GetAttribute(v.Name)
				if not v4 then
					error("NO PRICE FOR " .. v.name)
				end
				if v3.Sale then
					v.RobuxValue.Text = v6.FormatNumber("Int", math.floor(v4 / (1 - v3.Sale / 100)), v.RobuxValue)
				end
				v.Price.Text = v6.FormatNumber("Number", v3.Amount, v.Price)
				v.Buy.Foreground.Price.Text = v6.FormatNumber("Number", v4, v.Buy.Foreground.Price)
				v.Buy.MouseButton1Click:Connect(function() --[[ Line: 472 | Upvalues: LocalPlayer (ref), v3 (copy) ]]
					game:GetService("MarketplaceService"):PromptProductPurchase(LocalPlayer, v3.ProductId)
				end)
			end
		end
	end
	t4 = {}
	local v7 = nil
	for i, v in ipairs(v6.TypeToCatalogCategoryList[v12]) do
		local v8 = Template:Clone()
		v8.TextLabel.Text = v
		v8.Visible = true
		v8.Name = v
		v8.Parent = CategoryTabs.TabButtons
		if _G.GamepadEnabled then
			if v7 then
				v7.NextSelectionDown = v8
				v8.NextSelectionUp = v7
			end
			v7 = v8
		end
		table.insert(t4, v8)
	end
	if #t4 > 0 then
		v10:Refresh()
		v10:SelectTab(CategoryTabs.TabButtons[v13])
	else
		UpdateListViewData()
	end
	if not v6.GamepadEnabled then
		return
	end
	if #v6.TypeToCatalogCategoryList[v12] == 0 and v11.ListItems[1] then
		GuiService.SelectedObject = v11.ListItems[1].Object
	end
	game:GetService("GuiService").GuiNavigationEnabled = true
end
UIEvents.TabChanged.Event:connect(TabChanged)
local v17 = nil
local function _onBuyButtonPressed(p1, p2, p3) --[[ _onBuyButtonPressed | Line: 598 | Upvalues: v3 (copy), v2 (copy) ]]
	if not v3:InvokeServer("BuyCatalogItem", p2.AssetId, p3 or 1) then
		return
	end
	v2:PlaySound("CashRegister")
end
v5.BuyButtonPressed.Event:connect(_onBuyButtonPressed)
workspace.Main.BuyButtonPressed.BuyButtonPressed.Event:Connect(_onBuyButtonPressed)
local v18 = true
local v19 = nil
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 616 | Upvalues: v5 (copy), v17 (ref), v18 (ref), v9 (copy), CatalogTabs (copy), v19 (ref), Gui (copy) ]]
	if p1 == v5 and p2 then
		v17 = nil
		if not v18 then
			v19 = Gui.Changed:connect(function(p1_2) --[[ Line: 626 ]] end)
			wait()
			return
		end
		v18 = false
		v9:SetFirstTabPressed(CatalogTabs.TabButtons.Furniture)
		v19 = Gui.Changed:connect(function(p1_2) --[[ Line: 626 ]] end)
		wait()
	end
end)
function OpenTab(p1) --[[ OpenTab | Line: 643 | Upvalues: v5 (copy), v8 (copy), v9 (copy), CatalogTabs (copy) ]]
	if v5.Visible then
		wait()
		v9:SetFirstTabPressed(CatalogTabs.TabButtons[p1])
		return
	end
	v8:SetVisible(true)
	wait()
	v9:SetFirstTabPressed(CatalogTabs.TabButtons[p1])
end
workspace.Main.OpenCatalogTab.OpenCatalogTab.Event:Connect(OpenTab)
workspace.Main.OpenCatalogTab.OnClientEvent:Connect(OpenTab)
v5:WaitForChild("Sunburst")
v3:BindEvents({
	GamepassPurchased = function(p1) --[[ GamepassPurchased | Line: 766 | Upvalues: v7 (ref), v16 (copy) ]]
		v7[p1] = true
		for i, v in ipairs(v16) do
			if v7[v.NameId] then
				v16[i].Owned = true
			end
		end
		UpdateListViewData()
	end
})
function MoneyzChanged() --[[ MoneyzChanged | Line: 780 | Upvalues: LocalPlayer (copy), v6 (copy), CoinText (copy) ]]
	local match = string.match
	if match(tostring(LocalPlayer.Moneyz.Value), ",") then
		return
	end
	CoinText.Text = v6.FormatNumber("Number", LocalPlayer.Moneyz.Value, CoinText)
end
LocalPlayer:WaitForChild("Moneyz"):GetPropertyChangedSignal("Value"):connect(function() --[[ Line: 787 ]]
	MoneyzChanged()
end)
MoneyzChanged()