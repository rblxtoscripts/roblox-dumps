-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("AnimalCosmetics")
local v3 = Sonar("AnimalDataService")
local v4 = Sonar("AnimalRiggerService")
local v5 = Sonar("Button")
local v6 = Sonar("ButtonTest")
local v7 = Sonar("DisplayUtils")
local v8 = Sonar("FormatNumber")
local v9 = Sonar("GuiManager")
local v10 = Sonar("IssueResponseClient")
local v11 = Sonar("ItemDataService")
local v12 = Sonar("Maid")
local v13 = Sonar("PlayerWrapper")
local v14 = Sonar("RemoteUtils")
local v15 = Sonar("State")
local v16 = Sonar("ViewportModel")
local v17 = Sonar("VirtualizedList")
local v18 = Sonar("PlaceTypeService")
local v19 = RunService:IsStudio() and false
local v20 = Sonar("Constants")
local v21 = v19 or v18.IsMarketWorld()
local t = {
	Horses = { "Animals" },
	Gear = { "Tools", "Seeds" },
	Food = { "Food" },
	Potions = { "Potions" },
	Materials = { "Resources", "StackableChests", "Chests", "Miscellaneous" },
	Equipment = { "Equipment" }
}
local PlayerGui = Players.LocalPlayer.PlayerGui
local v22 = v13.GetClient()
local v23 = setmetatable({}, {
	__index = function(p1, p2) --[[ __index | Line: 62 | Upvalues: PlayerGui (copy) ]]
		local TradingCatalogGui = PlayerGui:FindFirstChild("TradingCatalogGui")
		local v1 = TradingCatalogGui[p2]
		if typeof(v1) == "function" then
			local v2 = v1
			v1 = function(p1, ...) --[[ Line: 71 | Upvalues: v2 (copy), TradingCatalogGui (copy) ]]
				return v2(TradingCatalogGui, ...)
			end
		end
		return v1
	end
})
local v24 = v14.GetRemoteFunction("AnnounceTradeRemote")
local v25 = v14.GetRemoteEvent("TradeAnnouncedRemote")
local v26 = nil
local v27 = 0
local v28 = v15.new(false)
local v29 = v15.new(false)
local v30 = v15.new(nil)
local v31 = v15.new("Horses")
local t3 = {}
local v32 = v15.new({})
local RBXGeneral = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
local t4 = {
	Equipment = true,
	Seeds = true,
	Chests = true,
	Buildings = true
}
local function getAnimalCountBySpecies(p1) --[[ getAnimalCountBySpecies | Line: 112 | Upvalues: v22 (copy) ]]
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
local function getFlairCountByName(p1) --[[ getFlairCountByName | Line: 131 | Upvalues: v22 (copy) ]]
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
local function getThemedEquipmentCount(p1) --[[ getThemedEquipmentCount | Line: 150 | Upvalues: v22 (copy) ]]
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
local function getAmountOwned(p1, p2) --[[ getAmountOwned | Line: 166 | Upvalues: getThemedEquipmentCount (copy), getAnimalCountBySpecies (copy), v22 (copy), t4 (copy) ]]
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
		if not (pcall(function() --[[ Line: 202 | Upvalues: v6 (ref), v22 (ref), p1 (copy), ItemType (copy) ]]
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
local function setupButtonVisuals(p1, p2, p3) --[[ setupButtonVisuals | Line: 220 | Upvalues: v7 (copy), t3 (copy), v12 (copy), v3 (copy), v22 (copy), v4 (copy), v2 (copy), v16 (copy), getAmountOwned (copy), v8 (copy) ]]
	local ViewportFrame = p1.ViewportFrame
	local ImageLabel = p1.ImageLabel
	local v1 = p2.Name
	local Image = p2.Image
	p1.TitleLabel.Text = v7.GetDisplayName(v1, p2)
	for v23, v32 in ViewportFrame:GetChildren() do
		v32.Parent = nil
	end
	if p2.ItemType == "Animals" then
		ImageLabel.Visible = false
		ViewportFrame.Visible = true
		if not p3 then
			t3[v1] = t3[v1] or v12.new()
		end
		local v6 = p3 or t3[v1]
		local Model = v6.Model
		if not Model then
			local v72 = v6:GiveTask(v3.CreateSlot(v22, {
				Origin = "Wild",
				DoNotParent = true,
				DoNotIncrementCount = true,
				Age = 100,
				Gender = "Male",
				Species = v1,
				Preset = p2.DiscoveryPreset or "Brown",
				Seed = v22.Player.UserId
			}))
			local v82, v9 = v4.CreateAnimalModel({
				SlotValue = v72
			})
			Model = v82
			v6:GiveTask(v82)
			v6:GiveTask(v9)
			v6:GiveTask(v2.new(v82, {
				InViewport = true,
				SlotValue = v72
			}))
		end
		local v11 = v6.Camera or Instance.new("Camera")
		v11.FieldOfView = 1
		v11.Parent = ViewportFrame
		v11.Parent.CurrentCamera = v11
		v6.Camera = v11
		v6.Model = Model
		v6._thread = task.spawn(function() --[[ Line: 279 | Upvalues: Model (ref), v6 (copy), v11 (ref), v16 (ref), ViewportFrame (copy) ]]
			local Head = Model:FindFirstChild("Head", true)
			local v1 = Model
			if Head then
				local v2 = v6:GiveTask(Instance.new("Model"))
				local v3 = v6:GiveTask(Instance.new("Part", v2))
				v3.CFrame = Head.WorldCFrame - Vector3.new(0, 1.35, 0)
				v3.Size = Vector3.new(4.5, 0, 4.5)
				v1 = v2
			end
			v11.CFrame = v16(v1, ViewportFrame, -130, -8)
			ViewportFrame.LightDirection = v11.CFrame.LookVector
			Model.Parent = ViewportFrame
		end)
	else
		ImageLabel.Image = Image or ImageLabel.Image
		ImageLabel.Visible = Image and true or false
		ViewportFrame.Visible = false
	end
	p1.Name = v1
	p1.Visible = true
	local AmountLabel = p1.AmountLabel
	if AmountLabel then
		local v13 = getAmountOwned(v1, p2)
		if type(v13) == "number" and v13 > 0 then
			AmountLabel.Text = "x" .. v8.splice(v13)
			AmountLabel.Visible = true
		else
			AmountLabel.Text = ""
			AmountLabel.Visible = false
		end
	end
	local v14 = if p2.ItemType == "EquipmentThemes" then true else false
	local ImageLabel_2 = p1.Theme.ImageLabel
	if v14 then
		ImageLabel_2.Image = p2.Icon or (p2.Image or (p2.Texture or ""))
		ImageLabel_2.UIGradient.Color = p2.ColorSequence or ColorSequence.new(Color3.new(255/255, 255/255, 255/255))
	end
	p1.Theme.Visible = v14
end
local function getReify(p1) --[[ getReify | Line: 342 | Upvalues: v12 (copy), setupButtonVisuals (copy), v5 (copy), v30 (copy) ]]
	local t = {}
	return function(p12_2_2, p2_2_2, p3_2_2) --[[ Line: 346 | Upvalues: t (copy), p1 (copy), v12 (ref), setupButtonVisuals (ref), v5 (ref), v30 (ref) ]]
		if t[p12_2_2] then
			t[p12_2_2]:DoCleaning()
		end
		if p1 then
			t[p12_2_2] = v12.new()
			setupButtonVisuals(p12_2_2, p2_2_2)
			t[p12_2_2]:GiveTask(v5.new(p12_2_2, {
				Click = function() --[[ Click | Line: 366 | Upvalues: v30 (ref), p2_2_2 (copy) ]]
					v30:set(p2_2_2.Name)
				end
			}))
		else
			t[p12_2_2] = nil
		end
	end
end
local function setupVirtualizedItems() --[[ setupVirtualizedItems | Line: 374 | Upvalues: t (copy), v11 (copy), v31 (copy), v30 (copy), v15 (copy), v26 (ref), v29 (copy), v28 (copy), v32 (copy), getAmountOwned (copy), v7 (copy) ]]
	local t2 = {}
	for v1, v2 in t do
		for v3, v4 in v2 do
			local v5 = v11.GetType(v4)
			if v5 then
				for v6, v72 in v5 do
					if not (v72.Tradelocked or v72.NotReleasedYet) then
						table.insert(t2, v72)
					end
				end
			end
		end
	end
	v31:subscribe(function() --[[ Line: 394 | Upvalues: v30 (ref) ]]
		v30:set(nil)
	end)
	v15.subscribeMulti({ v26, v31, v29, v28 }, function(p1, p2, p3, p4) --[[ Line: 399 | Upvalues: v32 (ref), v11 (ref), t (ref), t2 (copy), getAmountOwned (ref), v7 (ref) ]]
		task.defer(function() --[[ Line: 400 | Upvalues: p4 (copy), v32 (ref), p2 (copy), v11 (ref), t (ref), t2 (ref), p1 (copy), p3 (copy), getAmountOwned (ref), v7 (ref) ]]
			if not p4 then
				v32:set({})
				return
			end
			local t3 = {}
			if p2 == "Themes" then
				local v1 = v11.GetType("EquipmentThemes")
				if v1 then
					for v2, v3 in v1 do
						if not (v3.Tradelocked or v3.NotReleasedYet) then
							table.insert(t3, v3)
						end
					end
				end
			else
				local t4 = {}
				for v5, v6 in t[p2] or {} do
					t4[v6] = true
				end
				for v72, v8 in t2 do
					if t4[v8.ItemType] then
						table.insert(t3, v8)
					end
				end
			end
			if p1 and #p1 > 0 then
				for i = #t3, 1, -1 do
					local v9 = t3[i]
					local t4 = {}
					if v9.Name then
						table.insert(t4, v9.Name)
					end
					if v9.ItemType then
						table.insert(t4, v9.ItemType)
					end
					if v9.Description then
						table.insert(t4, v9.Description)
					end
					if v9.SearchTerms then
						table.move(v9.SearchTerms, 1, #v9.SearchTerms, #t4 + 1, t4)
					end
					local v112 = false
					for v12, v13 in t4 do
						if string.find(string.lower((string.gsub(v13, "%s", ""))), p1, 1, true) then
							v112 = true
							break
						end
					end
					if not v112 then
						table.remove(t3, i)
					end
				end
			end
			if p3 then
				for j = #t3, 1, -1 do
					local v16 = t3[j]
					if getAmountOwned(v16.Name, v16) < 1 then
						table.remove(t3, j)
					end
				end
			end
			table.sort(t3, function(p1, p2) --[[ Line: 496 | Upvalues: v7 (ref) ]]
				local v1 = p1.Rarity and p1.Rarity.Index or 0
				local v2 = p2.Rarity and p2.Rarity.Index or 0
				if v2 < v1 then
					return true
				end
				if v1 < v2 then
					return false
				end
				return v7.GetDisplayName(p1.Name, p1):lower() < v7.GetDisplayName(p2.Name, p2):lower()
			end)
			v32:set(t3)
		end)
	end)
end
local function canAnnounce(p1, p2, p3) --[[ canAnnounce | Line: 521 | Upvalues: v27 (ref), v11 (copy), getAmountOwned (copy) ]]
	if p3 and tick() < v27 then
		return nil, "AnnounceCooldown"
	end
	local v1 = v11.GetByName(p2)
	if not v1 then
		return nil
	end
	if p1 == "Trading" and getAmountOwned(p2, v1) < 1 then
		return nil, "NoOwnership"
	else
		return true
	end
end
local function announceTradeForItem(p1) --[[ announceTradeForItem | Line: 547 | Upvalues: v30 (copy), v27 (ref), v11 (copy), getAmountOwned (copy), v10 (copy), v24 (copy) ]]
	local v1 = v30:get()
	if not v1 then
		return
	end
	local v2, v3
	if tick() < v27 then
		v2 = nil
		v3 = "AnnounceCooldown"
	else
		local v4 = v11.GetByName(v1)
		if v4 then
			if p1 == "Trading" and getAmountOwned(v1, v4) < 1 then
				v2 = nil
				v3 = "NoOwnership"
			else
				v2 = true
				v3 = nil
			end
		else
			v2 = nil
			v3 = nil
		end
	end
	if v2 then
		v27 = tick() + 5
		if not v24:InvokeServer(p1, v1) then
			v27 = 0
		end
	else
		if not v3 then
			return
		end
		v10.NotifyIssue(v3)
	end
end
function v23._setupActionButtons(p1) --[[ _setupActionButtons | Line: 578 | Upvalues: v6 (copy), announceTradeForItem (copy) ]]
	for v1, v2 in p1.Container.Catalog.Menu.SpeechOptions.Actions:GetChildren() do
		if v2:IsA("GuiButton") and v2.Name ~= "Shout" then
			if v2.Name == "Trading" or v2.Name == "TradingFor" then
				v6.new(v2, {
					Click = function() --[[ Click | Line: 591 | Upvalues: announceTradeForItem (ref), v2 (copy) ]]
						announceTradeForItem(v2.Name)
					end
				})
				continue
			end
			v6.new(v2, {
				Click = function() --[[ Click | Line: 597 ]] end
			})
		end
	end
end
function v23._setupCloseButton(p1) --[[ _setupCloseButton | Line: 606 | Upvalues: v6 (copy) ]]
	v6.new(p1.Container.CloseButton, {
		Click = function() --[[ Click | Line: 608 | Upvalues: p1 (copy) ]]
			p1.Close()
		end
	})
end
function v23._setupSelectedButton(p1) --[[ _setupSelectedButton | Line: 615 | Upvalues: v12 (copy), v30 (copy), v11 (copy), setupButtonVisuals (copy) ]]
	local Actions = p1.Container.Catalog.Menu.SpeechOptions.Actions
	local Selected = Actions.Selected
	local Divider = Actions.Divider
	if Selected:IsA("GuiButton") then
		Selected.Active = false
		Selected.AutoButtonColor = false
	end
	local v1 = v12.new()
	v30:subscribe(function(p1) --[[ Line: 630 | Upvalues: v1 (copy), Selected (copy), Divider (copy), v11 (ref), setupButtonVisuals (ref) ]]
		v1:DoCleaning()
		if not p1 then
			Selected.Visible = false
			Divider.Visible = false
			return
		end
		local v12 = v11.GetByName(p1)
		if v12 then
			Selected.Visible = true
			Divider.Visible = true
			setupButtonVisuals(Selected, v12, v1)
		else
			Selected.Visible = false
			Divider.Visible = false
		end
	end)
end
function v23._setupSearchBar(p1) --[[ _setupSearchBar | Line: 659 | Upvalues: v15 (copy), v26 (ref) ]]
	v26 = v15.fromProperty(p1.Container.Catalog.Menu.TabFrames.SearchBar.Content.TextBox, "ContentText"):derive(function(p1) --[[ Line: 664 ]]
		return string.lower((string.gsub(p1, "%s", "")))
	end)
end
function v23._setupOwnedButton(p1) --[[ _setupOwnedButton | Line: 673 | Upvalues: v5 (copy), v29 (copy), v20 (copy), v15 (copy), v1 (copy) ]]
	local OwnedButton = p1.Container.Catalog.Menu.TabFrames.OwnedButton
	v5.new(OwnedButton, {
		Click = function() --[[ Click | Line: 677 | Upvalues: v29 (ref) ]]
			v29:set(not v29:get())
		end
	})
	v29:subscribe(function(p1) --[[ Line: 682 | Upvalues: OwnedButton (copy), v20 (ref) ]]
		OwnedButton:SetAttribute(v20.TabSelectedAttribute, p1)
	end)
	v15.fromAttribute(OwnedButton, v20.TabSelectedAttribute):subscribe(function(p1) --[[ Line: 686 | Upvalues: v1 (ref), OwnedButton (copy) ]]
		local t = {
			AnchorPoint = Vector2.zero,
			Position = UDim2.new()
		}
		if p1 then
			t.AnchorPoint = Vector2.yAxis
			t.Position = UDim2.fromScale(0, 1)
		end
		v1.target(OwnedButton.Top, 1, 3, t)
	end)
end
function v23._setupTabButtons(p1) --[[ _setupTabButtons | Line: 699 | Upvalues: v5 (copy), v31 (copy), v20 (copy), v15 (copy), v1 (copy) ]]
	for v12, v2 in p1.Container.TabButtons:GetChildren() do
		if v2:IsA("GuiButton") then
			v5.new(v2, {
				Click = function() --[[ Click | Line: 706 | Upvalues: v31 (ref), v2 (copy) ]]
					v31:set(v2.Name)
				end
			})
			v31:subscribe(function(p1) --[[ Line: 711 | Upvalues: v2 (copy), v20 (ref) ]]
				v2:SetAttribute(v20.TabSelectedAttribute, p1 == v2.Name)
			end)
			v15.fromAttribute(v2, v20.TabSelectedAttribute):subscribe(function(p1) --[[ Line: 717 | Upvalues: v1 (ref), v2 (copy) ]]
				local t = {
					AnchorPoint = Vector2.zero,
					Position = UDim2.new()
				}
				if p1 then
					t.AnchorPoint = Vector2.yAxis
					t.Position = UDim2.fromScale(0, 1)
				end
				v1.target(v2.Top, 1, 3, t)
			end)
		end
	end
end
function v23._setupTabFrame(p1) --[[ _setupTabFrame | Line: 731 | Upvalues: v31 (copy) ]]
	v31:subscribe(function(p12) --[[ Line: 732 | Upvalues: p1 (copy) ]]
		p1.Container.Catalog.Menu.TabFrames.Title.Text = p12
	end)
end
function v23._setupVirtualizedList(p1) --[[ _setupVirtualizedList | Line: 738 | Upvalues: v12 (copy), setupButtonVisuals (copy), v5 (copy), v30 (copy), v17 (copy), v32 (copy) ]]
	local ScrollingFrame = p1.Container.Catalog.Menu.TabFrames.ScrollingFrame
	local v1 = v12.new()
	local t = {}
	local v2 = nil
	local function f3(p12_2_2, p2_2_2, p3_2_2) --[[ Line: 346 | Upvalues: t (copy), v2 (copy), v12 (ref), setupButtonVisuals (ref), v5 (ref), v30 (ref) ]]
		if t[p12_2_2] then
			t[p12_2_2]:DoCleaning()
		end
		if v2 then
			t[p12_2_2] = v12.new()
			setupButtonVisuals(p12_2_2, p2_2_2)
			t[p12_2_2]:GiveTask(v5.new(p12_2_2, {
				Click = function() --[[ Click | Line: 366 | Upvalues: v30 (ref), p2_2_2 (copy) ]]
					v30:set(p2_2_2.Name)
				end
			}))
		else
			t[p12_2_2] = nil
		end
	end
	local t2 = {}
	local v4 = true
	local function f5(p12_2_2, p2_2_2, p3_2_2) --[[ Line: 346 | Upvalues: t2 (copy), v4 (copy), v12 (ref), setupButtonVisuals (ref), v5 (ref), v30 (ref) ]]
		if t2[p12_2_2] then
			t2[p12_2_2]:DoCleaning()
		end
		if v4 then
			t2[p12_2_2] = v12.new()
			setupButtonVisuals(p12_2_2, p2_2_2)
			t2[p12_2_2]:GiveTask(v5.new(p12_2_2, {
				Click = function() --[[ Click | Line: 366 | Upvalues: v30 (ref), p2_2_2 (copy) ]]
					v30:set(p2_2_2.Name)
				end
			}))
		else
			t2[p12_2_2] = nil
		end
	end
	local v6 = v17.new({
		ItemsPerRow = 4,
		ItemSpacing = 8,
		UpdateThrottle = 0.3,
		ScrollingFrame = ScrollingFrame,
		TemplateFrame = p1.Container.Catalog.Menu.TabFrames.Folder.Template,
		GetItemHeight = function(p1, p2) --[[ GetItemHeight | Line: 755 | Upvalues: ScrollingFrame (copy) ]]
			return ScrollingFrame.AbsoluteSize.Y * 0.45
		end,
		GetItemWidth = function(p1, p2) --[[ GetItemWidth | Line: 765 | Upvalues: ScrollingFrame (copy) ]]
			return ScrollingFrame.AbsoluteSize.X / 4 - 6
		end,
		OnItemHidden = f3,
		OnItemVisible = f5,
		UpdateContent = f5
	})
	v1:GiveTask(v32:subscribe(function(p1) --[[ Line: 782 | Upvalues: v6 (ref) ]]
		v6:SetData(p1)
	end))
end
function v23._setupGui(p1) --[[ _setupGui | Line: 788 | Upvalues: v9 (copy), v28 (copy), v30 (copy), v31 (copy) ]]
	p1:_setupActionButtons()
	p1:_setupCloseButton()
	p1:_setupOwnedButton()
	p1:_setupSearchBar()
	p1:_setupSelectedButton()
	p1:_setupTabButtons()
	p1:_setupTabFrame()
	p1:_setupVirtualizedList()
	v9.AddFrame(p1.Container, {
		ClosePosition = UDim2.fromScale(0.5, 1.1),
		OpenPosition = UDim2.new(0.5, 0, 0.97, -10)
	})
	v9.AddStateCallback(p1.Container, "OnOpen", function() --[[ Line: 803 | Upvalues: v28 (ref) ]]
		task.delay(0.2, function() --[[ Line: 805 | Upvalues: v28 (ref) ]]
			v28:set(true)
		end)
	end)
	v9.AddStateCallback(p1.Container, "OnClose", function() --[[ Line: 810 | Upvalues: v28 (ref), v30 (ref), v31 (ref) ]]
		v28:set(false)
		v30:set(nil)
		v31:set("Horses")
	end)
end
function v23.Close(p1) --[[ Close | Line: 821 | Upvalues: v21 (copy), v9 (copy), v23 (copy) ]]
	if v21 then
		v9.CloseMainFrame(v23.Container)
	end
end
function v23.Open(p1) --[[ Open | Line: 831 | Upvalues: v21 (copy), v9 (copy), v23 (copy) ]]
	if v21 then
		v9.OpenMainFrame(v23.Container, {
			Blur = false
		})
	end
end
function v23.Init(p1) --[[ Init | Line: 842 | Upvalues: v21 (copy), setupVirtualizedItems (copy), v25 (copy), RBXGeneral (copy), TextChatService (copy) ]]
	if v21 then
		p1:_setupGui()
		setupVirtualizedItems()
		v25.OnClientEvent:Connect(function(p1) --[[ Line: 851 | Upvalues: v21 (ref), RBXGeneral (ref), TextChatService (ref) ]]
			if not v21 then
				return
			end
			local Sender = p1.Sender
			local Character = Sender.Character
			local UserId = Sender.UserId
			if Character then
				local Message = p1.Message
				RBXGeneral:DisplaySystemMessage((("tradeAnnouncement_%*_%*"):format(UserId, Message)))
				TextChatService:DisplayBubble(Character, Message)
			end
		end)
	end
end
v23:Init()
return v23