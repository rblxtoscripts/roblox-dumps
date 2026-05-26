-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Tween")
local v1 = Library:Load("Maid")
local v2 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("Gui")
local GuiTop = PlayerGui:WaitForChild("GuiTop")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local Library_2 = require(game.ReplicatedStorage:WaitForChild("Library"))
local v4 = Library_2:Load("Utility")
Library_2:Load("Events")
local v5 = Library_2:Load("SoundFX")
Library_2:Load("CameraUtil")
Library_2:Load("Signal")
local v6 = Library_2:Load("Network")
Library_2:Load("Table")
local Tabs = v2:WaitForChild("Tabs")
local ScrollingFrame = v2:WaitForChild("List"):WaitForChild("ScrollingFrame")
local LoadMore = ScrollingFrame:WaitForChild("LoadMore")
local SearchBox = v2:WaitForChild("Search"):WaitForChild("SearchBox")
local SearchIcon = SearchBox:WaitForChild("SearchIcon")
local CustomIDBox = v2:WaitForChild("CustomID"):WaitForChild("CustomIDBox")
local Favorites = Tabs:WaitForChild("TabButtons"):WaitForChild("Favorites")
local Settings = Tabs:WaitForChild("TabButtons"):WaitForChild("Settings")
local Defaults = Tabs:WaitForChild("TabButtons"):WaitForChild("Defaults")
local Popular = Tabs:WaitForChild("TabButtons"):WaitForChild("Popular")
local LoadingScreen = v2:WaitForChild("LoadingScreen")
local ColorPicker = require(game.ReplicatedStorage.ColorPicker)
local Settings_2 = v2:WaitForChild("Settings")
local List = v2:WaitForChild("List")
local AssetLibraryManager = require(game.ReplicatedStorage:WaitForChild("AssetLibraryManager"))
local Row1 = Settings_2:WaitForChild("Row1")
local Row2 = Settings_2:WaitForChild("Row2")
local Color = Row1:WaitForChild("Color"):WaitForChild("Color")
local ImageTemplate = ScrollingFrame:WaitForChild("ImageTemplate")
ImageTemplate.Visible = false
local AudioTemplate = ScrollingFrame:WaitForChild("AudioTemplate")
AudioTemplate.Visible = false
local v7 = GuiManager:RegisterWindow(v2, "Bottom", "Bottom", 0.3)
v7.UseCursor = true
v7.FirstSelectedObject = Popular
local v8 = GuiManager:RegisterTabs(v2, Tabs)
local v9 = GuiManager:RegisterTextInput(v2, CustomIDBox)
v9.NumbersOnly = true
v9.NeedsToBeFiltered = false
v9:Initialize()
local v10 = v4:SendData("GetHistory", "PlayerChannel", 10) or v4:SendData("GetHistory", "PlayerChannel", 10) or {}
local t, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20 = {}, 1, nil, Popular, nil, nil, {
	Filled = "rbxassetid://96629893793016",
	Empty = "rbxassetid://75237147091244"
}, {}, nil, nil, {}
for k, v in pairs(AssetLibraryManager.AssetLibrary) do
	if (v.Category == "Walls" or v.Category == "Floors") and (v.Name ~= "None" and v.Name ~= "Neon Floor") then
		table.insert(t, { k })
	end
end
table.insert(t, 1, { 1009993511 })
table.insert(t, 1, { 142751224 })
function IncrementButtonWrapper(p1, p2, p3, p4, p5) --[[ IncrementButtonWrapper | Line: 105 | Upvalues: v4 (copy) ]]
	local function Increment(p12, p2, p3) --[[ Increment | Line: 107 | Upvalues: v4 (ref), p1 (copy) ]]
		p12.Value = p12.Value + (p2 or 0)
		p12.Value = v4:Clamp(p12.Value, p12.MinValue, p12.MaxValue)
		p12.Value = tonumber(("%0.1f"):format((tostring(p12.Value))))
		p1.Incrementer.Num.Text = tostring(p12.Value)
		if p3 then
			return
		end
		p12.OnIncremented:Fire(p12.Value)
	end
	local t = {
		IncrementAmount = p5 or 1,
		MinValue = p3,
		MaxValue = p4,
		Value = p2,
		OnIncremented = Instance.new("BindableEvent"),
		Object = p1
	}
	p1.Incrementer.Plus.MouseButton1Click:Connect(function() --[[ Line: 124 | Upvalues: Increment (copy), t (copy) ]]
		Increment(t, t.IncrementAmount)
	end)
	p1.Incrementer.Minus.MouseButton1Click:Connect(function() --[[ Line: 127 | Upvalues: Increment (copy), t (copy) ]]
		Increment(t, -t.IncrementAmount)
	end)
	function t.SetValue(p1, p2, p3) --[[ SetValue | Line: 130 | Upvalues: Increment (copy) ]]
		p1.Value = p2
		Increment(p1, nil, p3)
	end
	Increment(t)
	return t
end
function RegisterColorPickerButton(p1) --[[ RegisterColorPickerButton | Line: 138 | Upvalues: ColorPicker (copy), GuiTop (copy), v6 (copy), v19 (ref) ]]
	p1.MouseButton1Click:Connect(function() --[[ Line: 139 | Upvalues: ColorPicker (ref), GuiTop (ref), p1 (copy), v6 (ref), v19 (ref) ]]
		local v1 = ColorPicker.New(GuiTop, {
			ZIndex = 10,
			Position = UDim2.new(1, 0, 1, 0)
		})
		local SelectedColor = p1:FindFirstChild("SelectedColor", true)
		local BackgroundColor3 = SelectedColor.BackgroundColor3
		v1:SetColor(SelectedColor.BackgroundColor3)
		v1.Finished:Connect(function(p1) --[[ Line: 148 | Upvalues: SelectedColor (copy), v6 (ref), v19 (ref) ]]
			SelectedColor.BackgroundColor3 = p1
			v6:FireServer("UpdatePattern", v19, "TextureColor", p1)
		end)
		v1.Canceled:Connect(function(p1) --[[ Line: 153 | Upvalues: SelectedColor (copy), BackgroundColor3 (copy) ]]
			SelectedColor.BackgroundColor3 = BackgroundColor3
		end)
	end)
end
local v21 = IncrementButtonWrapper(Row2:WaitForChild("Transparency"), 0, 0, 1, 0.1)
local v22 = IncrementButtonWrapper(Row2:WaitForChild("Length"), 4, 4, 80, 4)
local v23 = IncrementButtonWrapper(Row2:WaitForChild("Width"), 4, 4, 80, 4)
RegisterColorPickerButton(Color)
function RefreshHistoryIndex() --[[ RefreshHistoryIndex | Line: 168 | Upvalues: v17 (ref), v10 (ref) ]]
	v17 = {}
	for k, v in pairs(v10) do
		for i, v2 in ipairs(v) do
			v17[tostring(v2[1])] = true
		end
	end
end
function SelectAsset(p1, p2) --[[ SelectAsset | Line: 178 | Upvalues: AssetLibraryManager (copy), v19 (ref), v6 (copy), v18 (ref), v12 (ref) ]]
	local v1 = AssetLibraryManager:GetAssetById(p1)
	if v19 and v1 then
		v6:FireServer("SetLegacyPattern", v19, p1)
	elseif v19 then
		v6:FireServer("UpdatePattern", v19, "TextureId", p1)
	end
	if v1 then
		return
	end
	workspace.Main.AssetIdChanged.AssetIdChanged:Fire(v18, p2[1], p2[2])
	workspace.Main.AssetIdChanged:FireServer(v18, p2[1], p2[2])
	workspace.Main.AssetUsed:FireServer(v19 or v12, p2[1], p2[2])
end
local v24 = v1.new()
function LoadList(p1, p2, p3) --[[ LoadList | Line: 197 | Upvalues: v24 (copy), v20 (copy), v19 (ref), v12 (ref), v2 (copy), ScrollingFrame (copy), AudioTemplate (copy), ImageTemplate (copy), v13 (ref), Defaults (copy), v14 (ref), v16 (copy), v17 (ref), Dialog (copy), v10 (ref), v4 (copy), Favorites (copy), LocalPlayer (copy) ]]
	if not p3 then
		v24:DoCleaning()
	end
	if p2 then
		local v3 = v20[v19 or v12]
		if not v3 then
			v3 = workspace.Main.GetTop100:InvokeServer(v19 or v12)
		end
		v20[v19 or v12] = v3
		p1 = v3
	end
	if not p1 then
		return
	end
	if v12 == "Audio" then
		v2.Size = UDim2.new(0.372, 0, 1, 0)
	else
		v2.Size = UDim2.new(0.372, 0, 0.4, 0)
	end
	local v7 = if v12 == "Audio" then true else false
	ScrollingFrame.UIListLayout.FillDirection = v7 and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal
	ScrollingFrame.UIListLayout.HorizontalAlignment = v7 and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Left
	ScrollingFrame.ScrollingDirection = v7 and Enum.ScrollingDirection.Y or Enum.ScrollingDirection.X
	ScrollingFrame.AutomaticCanvasSize = v7 and Enum.AutomaticSize.Y or Enum.AutomaticSize.X
	for i, v in ipairs(p1) do
		local v142 = v7 and AudioTemplate:Clone() or ImageTemplate:clone()
		local v162 = v7 and v142.Row.FavoriteButton or v142.FavoriteButton
		v162.Visible = if v13 == Defaults then v14 ~= nil else true
		v162:GetAttributeChangedSignal("Filled"):Connect(function() --[[ Line: 231 | Upvalues: v162 (copy), v16 (ref) ]]
			v162.Icon.Image = v162:GetAttribute("Filled") and v16.Filled or v16.Empty
		end)
		v162.MouseButton1Click:connect(function() --[[ Line: 235 | Upvalues: v17 (ref), v (copy), Dialog (ref), v162 (copy), v10 (ref), v4 (ref), v19 (ref), v12 (ref), v13 (ref), Favorites (ref) ]]
			if v17[tostring(v[1])] then
				if Dialog:GetChoice("", "Remove Favorite?", "Yes", "No") then
					v162:SetAttribute("Filled", false)
					v10 = v4:SendData("RemoveAssetFromHistory", "PlayerChannel", 10, v19 or v12, v[1], v[2])
				end
			else
				v162:SetAttribute("Filled", true)
				v10 = v4:SendData("AddAssetToHistory", "PlayerChannel", 10, v19 or v12, v[1], v[2])
			end
			RefreshHistoryIndex()
			if v13 ~= Favorites then
				return
			end
			RefreshList()
		end)
		local v18 = v17
		if v18[tostring(v[1])] then
			v162:SetAttribute("Filled", true)
		end
		(v7 and v142.Row.PlayButton or v142.Icon).MouseButton1Click:connect(function() --[[ Line: 257 | Upvalues: v (copy) ]]
			SelectAsset(v[1], v)
		end)
		if v7 then
			v142.Row.AudioName.MouseButton1Click:connect(function() --[[ Line: 262 | Upvalues: v (copy) ]]
				SelectAsset(v[1], v)
			end)
		end
		if not v7 then
			if tonumber(v[1]) == 142751224 then
				v142.Icon.ImageTransparency = 1
				v142.None.Visible = true
			else
				v142.None:Destroy()
			end
			if tonumber(v[1]) == 1009993511 then
				v142.VIP.Visible = true
			else
				v142.VIP:Destroy()
			end
		end
		if v7 then
			if LocalPlayer:FindFirstChild("IsMod") then
				v142.Row.AudioName.Text = v[2] .. " " .. v[1]
			else
				v142.Row.AudioName.Text = v[2]
			end
		else
			if LocalPlayer:FindFirstChild("IsMod") then
				v142.AssetId.Visible = true
				v142.AssetId.Text = v[1]
			end
			v142.Icon.Image = "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. v[1]
		end
		v142.Visible = true
		v142.Parent = ScrollingFrame
		v24:GiveTask(v142)
	end
end
function RefreshList() --[[ RefreshList | Line: 309 | Upvalues: v14 (ref), v13 (ref), Popular (copy), Defaults (copy), t (copy), Favorites (copy), v10 (ref), v19 (ref), v12 (ref) ]]
	if v14 then
		LoadList(v14)
		return
	end
	if v13 == Popular then
		RefreshHistoryIndex()
		LoadList(nil, true)
		return
	end
	if v13 == Defaults then
		LoadList(t)
		return
	end
	if v13 ~= Favorites then
		return
	end
	LoadList(v10[v19 or v12])
end
function TabChanged(p1, p2, p3) --[[ TabChanged | Line: 325 | Upvalues: v2 (copy), v15 (ref), v13 (ref), v14 (ref), SearchBox (copy), v11 (ref), ScrollingFrame (copy), LoadMore (copy), v12 (ref), List (copy), Settings (copy), Settings_2 (copy) ]]
	if p1 ~= v2 then
		return
	end
	v15 = nil
	v13 = p2
	v14 = nil
	SearchBox.Text = ""
	v11 = 1
	ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
	LoadMore.Visible = false
	SearchBox.Parent.Visible = if v12 == "Place" then false else true
	RefreshList()
	List.Visible = if p2 == Settings then false else true
	Settings_2.Visible = if p2 == Settings then true else false
	if p3 and p3 ~= p2 then
		p3.ZIndex = p3.ZIndex - 2
		p3.BackgroundColor3 = Color3.fromRGB(221, 208, 185)
	end
	p2.BackgroundColor3 = Color3.fromRGB(254, 239, 212)
	if p2 ~= p3 then
		p2.ZIndex = p2.ZIndex + 2
	end
	if not _G.GamepadEnabled then
		return
	end
	game:GetService("GuiService").SelectedObject = p2
end
UIEvents.TabChanged.Event:connect(TabChanged)
function Search() --[[ Search | Line: 359 | Upvalues: ScrollingFrame (copy), v15 (ref), v11 (ref), SearchBox (copy), v14 (ref), LoadingScreen (copy), v6 (copy), v12 (ref), LoadMore (copy) ]]
	ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
	v15 = nil
	v11 = 1
	if SearchBox.Text == "" then
		v14 = nil
		return
	end
	LoadingScreen.Visible = true
	local v1, v2 = v6:InvokeServer("SearchPublicAssets", v12, SearchBox.Text, v11, v15)
	v14 = v1
	v15 = v2
	RefreshList()
	LoadMore.Visible = if v2 == nil then #v1 == 100 else true
	LoadingScreen.Visible = false
end
SearchIcon.MouseButton1Click:Connect(Search)
SearchBox.FocusLost:Connect(Search)
local v25 = nil
function LoadMoreResults() --[[ LoadMoreResults | Line: 378 | Upvalues: v11 (ref), LoadingScreen (copy), v25 (ref), v15 (ref), v6 (copy), v12 (ref), SearchBox (copy), LoadMore (copy) ]]
	v11 = v11 + 1
	LoadingScreen.Visible = true
	local v1, v2 = v6:InvokeServer("SearchPublicAssets", v12, SearchBox.Text, v11, v15)
	v25 = v1
	v15 = v2
	if v12 ~= "Audio" and (v12 ~= "Decal" and v2 == nil) then
		LoadMore.Visible = false
	end
	LoadList(v1, false, true)
	LoadingScreen.Visible = false
end
LoadMore.MouseButton1Click:Connect(LoadMoreResults)
UIEvents.TextInputFocusLost.Event:connect(function(p1, p2) --[[ Line: 395 | Upvalues: v2 (copy), CustomIDBox (copy), v9 (copy), LoadingScreen (copy), v3 (copy), v12 (ref), v10 (ref), v4 (copy), v19 (ref), v8 (copy), Tabs (copy), v5 (copy), Dialog (copy) ]]
	if p1 ~= v2 or (p2 ~= CustomIDBox or not v9.IsValid) then
		return
	end
	LoadingScreen.Visible = true
	local v1 = tonumber(CustomIDBox.Text)
	local v22, v32 = pcall(function() --[[ Line: 400 | Upvalues: v1 (copy) ]]
		return game:GetService("MarketplaceService"):GetProductInfo(v1, 0)
	end)
	local v42 = false
	if v22 and type(v3.ValidAssetTypeNumbers[v12]) == "table" then
		if v3.ValidAssetTypeNumbers[v12][v32.AssetTypeId] then
			v42 = true
		end
	elseif v22 then
		v42 = if v32.AssetTypeId == v3.ValidAssetTypeNumbers[v12] then true else false
	end
	if v22 and v42 then
		v10 = v4:SendData("AddAssetToHistory", "PlayerChannel", 10, v19 or v12, tonumber(CustomIDBox.Text), (string.sub(v32.Name, 1, 20)))
		RefreshList()
		LoadingScreen.Visible = false
		v8:SelectTab(Tabs.TabButtons.Favorites)
	elseif v22 and not v42 then
		v5:PlaySound("Invalid")
		Dialog:ShowMessage("Error", "The item Id you entered is the wrong type")
		LoadingScreen.Visible = false
	else
		warn(v32)
		v5:PlaySound("Invalid")
		LoadingScreen.Visible = false
		Dialog:ShowMessage("Error", "The item with the given ID could not be found.")
	end
end)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 441 | Upvalues: v2 (copy), CustomIDBox (copy) ]]
	if p1 ~= v2 then
		return
	end
	if p2 then
		game:GetService("ContextActionService"):BindAction("CtrlPressed2", function(p1, p2, p3) --[[ Line: 445 | Upvalues: CustomIDBox (ref) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			CustomIDBox:CaptureFocus()
		end, false, Enum.KeyCode.RightControl, Enum.KeyCode.LeftControl)
		return
	end
	workspace.Main.ConfigEnded:Fire()
	game:GetService("ContextActionService"):UnbindAction("CtrlPressed2")
end)
local v26 = nil
local v27 = nil
local function OpenWindow(p1, p2, p3) --[[ OpenWindow | Line: 460 | Upvalues: v19 (ref), v6 (copy), Color (copy), v21 (copy), v23 (copy), v22 (copy), v26 (ref), v27 (ref), v12 (ref), v11 (ref), v15 (ref), v8 (copy), Tabs (copy), Settings_2 (copy), Defaults (copy), Settings (copy), List (copy), v7 (copy), v18 (ref) ]]
	v19 = p3
	if not _G.StartedPlaying then
		return
	end
	if v19 then
		task.spawn(function() --[[ Line: 467 | Upvalues: v6 (ref), v19 (ref), Color (ref), v21 (ref), v23 (ref), v22 (ref) ]]
			local v1 = v6:InvokeServer("GetPatternInfo", v19)
			local SelectedColor = Color:FindFirstChild("SelectedColor", true)
			SelectedColor.BackgroundColor3 = v1 and v1.TextureColor or Color3.fromRGB(255, 255, 255)
			v21:SetValue(v1 and v1.Transparency or 0, true)
			v23:SetValue(v1 and v1.StudsPerTileU or 4, true)
			v22:SetValue(if v1 then v1.StudsPerTileV or 4 else 4, true)
		end)
	end
	if p2 == v26 and v27 == v19 then
		if not v7:IsVisible() then
			v7:SetVisible(true)
		end
	else
		v12 = p2
		v11 = 1
		v15 = nil
		v8:SelectTab(Tabs.TabButtons.Popular)
		Settings_2.Visible = false
		Defaults.Visible = if v19 == nil then false else true
		Settings.Visible = if v19 == nil then false else true
		List.Visible = true
		v7:SetVisible(true)
	end
	v26 = p2
	v27 = p3
	v18 = p1
end
workspace.Main.OpenAssetPicker.OnClientEvent:connect(OpenWindow)
workspace.Main.OpenAssetPicker.OpenAssetPicker.Event:connect(OpenWindow)
v21.OnIncremented.Event:Connect(function(p1) --[[ Line: 507 | Upvalues: v6 (copy), v19 (ref) ]]
	v6:FireServer("UpdatePattern", v19, "Transparency", p1)
end)
v23.OnIncremented.Event:Connect(function(p1) --[[ Line: 511 | Upvalues: v6 (copy), v19 (ref) ]]
	v6:FireServer("UpdatePattern", v19, "StudsPerTileU", p1)
end)
v22.OnIncremented.Event:Connect(function(p1) --[[ Line: 515 | Upvalues: v6 (copy), v19 (ref) ]]
	v6:FireServer("UpdatePattern", v19, "StudsPerTileV", p1)
end)