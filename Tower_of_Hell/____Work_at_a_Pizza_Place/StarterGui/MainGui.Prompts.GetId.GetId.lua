-- https://lua.expert/
local v1 = script.Parent
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v2 = Library:Load("Utility")
Library:Load("Events")
local v3 = Library:Load("SoundFX")
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Layout = v1:WaitForChild("Layout")
local Loading = v1:WaitForChild("Loading")
local Title = Layout:WaitForChild("Title")
local Tabs = Layout:WaitForChild("Tabs")
local Favorites = Tabs:WaitForChild("Favorites")
local Popular = Tabs:WaitForChild("Popular")
local PasteId = Layout:WaitForChild("PasteId")
local Help = PasteId:WaitForChild("Help")
local TextBox = PasteId:WaitForChild("TextBox")
local ScrollingFrame = Layout:WaitForChild("ScrollingFrame")
local List = ScrollingFrame:WaitForChild("List")
local Template = ScrollingFrame:WaitForChild("Template")
if _G.GamepadEnabled then
	ScrollingFrame.Size = UDim2.new(1, 0, 0.78, 0)
	Tabs.Size = UDim2.new(0.7, 0, 0.09, 0)
	Template.Size = UDim2.new(1, 0, 0, 40)
end
if v1.AbsoluteSize.Y > MainGui.AbsoluteSize.Y then
	v1.UIAspectRatioConstraint:Destroy()
	v1.Size = UDim2.new(0, 200, 1, 0)
end
local v5 = GuiManager:RegisterWindow(v1, "Left", "Left")
local v6 = GuiManager:RegisterListView(v1, List)
GuiManager:RegisterTabs(v1, Tabs, true)
local v7 = GuiManager:RegisterTextInput(v1, TextBox)
v7.NumbersOnly = true
v6.GamepadSelectFirstItemOnRefresh = true
v5:SetConsoleSize(UDim2.new(1, 0, 0, 430))
PasteId.Visible = false
v7:Initialize()
asset_types = {
	Shirt = 11,
	Pants = 12,
	Audio = 3,
	Decal = 13,
	Place = 9,
	Face = 18,
	["Head Accessory"] = {
		[8] = true,
		[41] = true,
		[42] = true
	},
	Accessory = {
		[8] = true,
		[41] = true,
		[42] = true,
		[43] = true,
		[44] = true,
		[45] = true,
		[46] = true,
		[47] = true
	}
}
local v8 = workspace.Main.GetTop50:InvokeServer()
local v9 = v2:SendData("GetHistory", "PlayerChannel", 10) or v2:SendData("GetHistory", "PlayerChannel", 10) or {}
local v10 = nil
local v11 = Popular
local v12 = nil
local t = {}
local v13 = nil
function DisplayFunction(p1, p2, p3, p4) --[[ Line: 138 | Upvalues: v13 (ref), v11 (ref), Popular (copy), t (ref), Favorites (copy) ]]
	if v13 then
		p2.AssetNameButton.TextLabel.Text = "  " .. p3[2] .. " " .. p3[1]
	else
		p2.AssetNameButton.TextLabel.Text = "  " .. p3[2]
	end
	if v11 == Popular then
		if t[tostring(p3[1])] then
			p2.FavoriteButton.Icon.Image = "rbxassetid://905979446"
		else
			p2.FavoriteButton.Icon.Image = "rbxassetid://906018985"
		end
	else
		if v11 ~= Favorites then
			return
		end
		p2.FavoriteButton.Icon.Image = "rbxassetid://906143958"
	end
end
function RefreshHash() --[[ RefreshHash | Line: 161 | Upvalues: t (ref), v9 (ref) ]]
	t = {}
	for k, v in pairs(v9) do
		for i, v2 in ipairs(v) do
			t[tostring(v2[1])] = true
		end
	end
end
function RefreshList() --[[ RefreshList | Line: 171 | Upvalues: v11 (ref), Popular (copy), v6 (copy), v8 (copy), v10 (ref), Template (copy), v9 (ref) ]]
	if v11 == Popular then
		RefreshHash()
		v6:UpdateData(v8[v10], Template, DisplayFunction)
	else
		v6:UpdateData(v9[v10], Template, DisplayFunction)
	end
end
UIEvents.ListItemPressed.Event:connect(function(p1, p2, p3, p4) --[[ Line: 185 | Upvalues: v11 (ref), Popular (copy), t (ref), v9 (ref), v2 (copy), v10 (ref), Favorites (copy), v12 (ref) ]]
	if p3.Name == "FavoriteButton" then
		if v11 == Popular then
			if t[tostring(p4[1])] then
				p3.Icon.Image = "rbxassetid://906018985"
				v9 = v2:SendData("RemoveAssetFromHistory", "PlayerChannel", 10, v10, p4[1], p4[2])
			else
				p3.Icon.Image = "rbxassetid://905979446"
				v9 = v2:SendData("AddAssetToHistory", "PlayerChannel", 10, v10, p4[1], p4[2])
			end
			RefreshHash()
		elseif v11 == Favorites then
			v9 = v2:SendData("RemoveAssetFromHistory", "PlayerChannel", 10, v10, p4[1], p4[2])
			RefreshList()
		end
	else
		if p3.Name ~= "AssetNameButton" then
			return
		end
		workspace.Main.AssetIdChanged.AssetIdChanged:Fire(v12, p4[1], p4[2] or "")
		workspace.Main.AssetIdChanged:FireServer(v12, p4[1], p4[2] or "")
		workspace.Main.AssetUsed:FireServer(v10, p4[1], p4[2] or "")
	end
end)
UIEvents.TextInputFocusLost.Event:connect(function(p1, p2) --[[ Line: 219 | Upvalues: v1 (copy), v7 (copy), Loading (copy), v10 (ref), v9 (ref), v2 (copy), v3 (copy), Dialog (copy) ]]
	if p1 ~= v1 or not v7.IsValid then
		return
	end
	Loading.Visible = true
	local v12 = tonumber(v7.UnfilteredText)
	local v22, v32 = pcall(function() --[[ Line: 228 | Upvalues: v12 (copy) ]]
		return game:GetService("MarketplaceService"):GetProductInfo(v12, 0)
	end)
	local v4 = false
	if v22 and type(asset_types[v10]) == "table" then
		if asset_types[v10][v32.AssetTypeId] then
			v4 = true
		end
	elseif v22 then
		v4 = if v32.AssetTypeId == asset_types[v10] then true else false
	end
	if v22 and v4 then
		v9 = v2:SendData("AddAssetToHistory", "PlayerChannel", 10, v10, tonumber(v7.UnfilteredText), (string.sub(v32.Name, 1, 20)))
		RefreshList()
		Loading.Visible = false
		return
	end
	if v22 and not v4 then
		v3:PlaySound("Invalid")
		Dialog:ShowMessage("Error", "The item Id you entered is the wrong type")
		Loading.Visible = false
	else
		v3:PlaySound("Invalid")
		Loading.Visible = false
		Dialog:ShowMessage("Error", "The item with the given ID could not be found.")
	end
end)
local function OpenWindow(p1, p2) --[[ OpenWindow | Line: 263 | Upvalues: v13 (ref), LocalPlayer (copy), v10 (ref), v12 (ref), Title (copy), TextBox (copy), v5 (copy) ]]
	if not _G.StartedPlaying then
		return
	end
	v13 = if LocalPlayer:FindFirstChild("IsMod") == nil then false else true
	v10 = p2
	v12 = p1
	Title.Text = p2
	TextBox.Text = "Enter Id"
	v5:SetVisible(true)
	RefreshList()
end
workspace.Main.OpenAssetPicker.OnClientEvent:connect(OpenWindow)
workspace.Main.OpenAssetPicker.OpenAssetPicker.Event:connect(OpenWindow)
function TabChanged(p1, p2) --[[ TabChanged | Line: 294 | Upvalues: v1 (copy), v11 (ref), PasteId (copy), Favorites (copy) ]]
	if p1 ~= v1 then
		return
	end
	v11 = p2
	RefreshList()
	PasteId.Visible = p2 == Favorites
end
UIEvents.TabChanged.Event:connect(TabChanged)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 306 | Upvalues: v1 (copy), TextBox (copy) ]]
	if p1 ~= v1 then
		return
	end
	if p2 then
		game:GetService("ContextActionService"):BindAction("CtrlPressed2", function(p1, p2, p3) --[[ Line: 310 | Upvalues: TextBox (ref) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			TextBox:CaptureFocus()
		end, false, Enum.KeyCode.RightControl, Enum.KeyCode.LeftControl)
		RefreshList()
		return
	end
	game:GetService("ContextActionService"):UnbindAction("CtrlPressed2")
end)
spawn(function() --[[ Line: 323 | Upvalues: v4 (copy), Help (copy), v1 (copy) ]]
	if v4.IsEnglish() then
		Help.MouseButton1Click:connect(function() --[[ Line: 325 | Upvalues: v1 (ref) ]]
			v1.Parent.IdHelp.Visible = true
		end)
	else
		Help.Visible = false
	end
end)