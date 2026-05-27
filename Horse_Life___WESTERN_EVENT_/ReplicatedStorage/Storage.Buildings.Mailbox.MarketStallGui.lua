-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local CurrentCamera = workspace.CurrentCamera
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("GuiManager")
local v3 = Sonar("Maid")
Sonar("PlayerUtils")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("ItemGridButton")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("MarketStallService")
local v8 = Sonar("IssueResponseClient")
local v9 = Sonar("AnimalGridButton")
Sonar("InfoOverlayGui")
local v10 = Sonar("TabManager")
local v11 = Sonar("GuiUtils")
local v12 = Sonar("Button")
local v13 = Sonar("GridSort")
local v14 = Sonar("NotificationsClient")
local v15 = Sonar("FormatNumber")
Sonar("PromptClient")
Sonar("ItemInfoFrame")
Sonar("Constants")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v16 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MarketStallGui"):WaitForChild("ContainerFrame")
local Items = ContainerFrame.Menu.Items
local v17 = v16:GetItemFolder("Animals")
local v18 = v3.new()
v3.new()
v3.new()
local t2 = {}
local v19 = nil
local t3 = {
	Horses = v13.new({
		Priority = {},
		EmptyString = {
			Text = "You do not have any horses!",
			Label = Items.Content.TabFrames.Horses.EmptyLabel
		},
		Sorts = {
			Alphabet = {
				DisplayName = "Name",
				Reversable = true,
				Run = function(p1, p2, p3) --[[ Run | Line: 72 ]]
					local v1 = p1.NameLabel.Text:lower()
					local v2 = p2.NameLabel.Text:lower()
					if p3 then
						return v2 < v1
					else
						return v1 < v2
					end
				end,
				Changed = function(p1) --[[ Changed | Line: 83 ]]
					return p1.NameLabel:GetPropertyChangedSignal("Text")
				end
			}
		},
		Search = {
			TextBox = Items.Content.SearchBar.Content.TextBox,
			Run = function(p1, p2) --[[ Run | Line: 91 ]]
				return if #p1 <= 0 then true else string.find(p2.NameLabel.Text:lower(), p1:lower())
			end
		}
	}),
	Inventory = v13.new({
		Priority = {
			{
				Priority = -1,
				Run = function(p1) --[[ Run | Line: 100 ]]
					return if p1.Item.ItemType == "Equipment" then true else p1.Item.ItemType == "Flairs"
				end
			}
		},
		Filters = {
			All = true
		},
		EmptyString = {
			Text = "You do not have any items!",
			Label = Items.Content.TabFrames.Inventory.EmptyLabel
		},
		Sorts = {
			Alphabet = {
				Run = function(p1, p2, p3) --[[ Run | Line: 117 ]]
					return p1.NameLabel.Text:lower() < p2.NameLabel.Text:lower()
				end,
				Changed = function(p1) --[[ Changed | Line: 122 ]]
					return p1.NameLabel:GetPropertyChangedSignal("Text")
				end
			}
		},
		Search = {
			TextBox = Items.Content.SearchBar.Content.TextBox,
			Run = function(p1, p2) --[[ Run | Line: 130 ]]
				return if #p1 <= 0 then true else string.find(p2.NameLabel.Text:lower(), p1:lower())
			end
		}
	})
}
local function getItemName(p1) --[[ getItemName | Line: 137 ]]
	if p1:IsA("StringValue") then
		return p1.Value
	else
		return p1.Name
	end
end
local function setAmount(p1, p2, p3) --[[ setAmount | Line: 145 | Upvalues: v15 (copy), v19 (ref), v16 (copy) ]]
	if p2 and #tostring(p2) > 0 then
		local v1 = v15.SanitiseInput(p2)
		local v2 = if p3 and v19.DataValue:IsA("IntValue") then v16:GetAmountToUse(v19.DataValue, v1) else v1
		v19.Amount = v2
		if p3 then
			v2 = v15.splice(v2)
		end
		p1.Text = v2
	else
		if not v19 then
			p1.Text = ""
			return
		end
		v19.Amount = 1
		p1.Text = ""
	end
end
function t.SetSelectedItem(p1, p2) --[[ SetSelectedItem | Line: 169 | Upvalues: v19 (ref), Items (copy), v15 (copy) ]]
	v19 = p2
	if not p2 then
		Items.SelectFrame.SelectedFrame.Visible = false
		Items.SelectFrame.NotSelected.Visible = true
		return
	end
	if p2.DataValue:IsA("IntValue") then
		Items.SelectFrame.SelectedFrame.AmountDescription.Visible = true
		Items.SelectFrame.SelectedFrame.AmountContainer.Visible = true
	else
		Items.SelectFrame.SelectedFrame.AmountDescription.Visible = false
		Items.SelectFrame.SelectedFrame.AmountContainer.Visible = false
	end
	local Input = Items.SelectFrame.SelectedFrame.AmountContainer.TextContainer.Input
	local v1 = nil
	if v1 and #tostring(v1) > 0 then
		local v2 = v15.SanitiseInput(v1)
		p2.Amount = v2
		Input.Text = v2
	else
		if p2 then
			p2.Amount = 1
		end
		Input.Text = ""
	end
	Items.SelectFrame.SelectedFrame.Visible = true
	Items.SelectFrame.NotSelected.Visible = false
end
function t.CreateInventoryTab(p1, p2) --[[ CreateInventoryTab | Line: 190 | Upvalues: Sonar (copy), v4 (copy), v9 (copy), LocalPlayer (copy), v12 (copy), v7 (copy), v16 (copy), v8 (copy), t (copy), t2 (copy), t3 (copy), v17 (copy), v5 (copy) ]]
	if p2.Name == "Horses" then
		local function createAnimal(p1, p22) --[[ createAnimal | Line: 192 | Upvalues: Sonar (ref), v4 (ref), v9 (ref), LocalPlayer (ref), p2 (copy), v12 (ref), v7 (ref), v16 (ref), v8 (ref), t (ref), t2 (ref), t3 (ref) ]]
			if not p22 then
				Sonar("EventUtils").waitForFirstChild(p1)
			end
			local v1 = v4.GetByName(p1:WaitForChild("Species").Value)
			local v2 = v9.new({
				DisableAccessories = true,
				SlotValue = p1,
				Owner = LocalPlayer,
				ParentFrame = p2
			})
			v2:GiveTask(v12.new(v2.Frame, {
				Click = function() --[[ Click | Line: 205 | Upvalues: v7 (ref), v16 (ref), p1 (copy), v1 (copy), v8 (ref), t (ref) ]]
					local v12 = v7:CanListSale(v16, {
						Amount = 1,
						Price = 1,
						Name = p1.Name,
						ItemType = v1.ItemType,
						ItemData = v1,
						DataValue = p1
					})
					if v12 == true then
						t:SetSelectedItem({
							Amount = 1,
							Name = p1.Name,
							ItemData = v1,
							DataValue = p1,
							ItemType = v1.ItemType
						})
					else
						v8.NotifyIssue(v12)
					end
				end
			}))
			t2[p1] = v2
			t3.Horses:Add(v2, true)
		end
		local function removeAnimal(p1) --[[ removeAnimal | Line: 233 | Upvalues: t2 (ref), t3 (ref) ]]
			if t2[p1] then
				t3.Horses:Remove(t2[p1])
				t2[p1]:Destroy()
				t2[p1] = nil
			end
		end
		v17.ChildRemoved:Connect(removeAnimal)
		v17.ChildAdded:Connect(createAnimal)
		for k, v in pairs(v16:GetItemFolder("Animals"):GetChildren()) do
			createAnimal(v)
		end
		t3.Horses:Sort(t3.Horses.SortType or "Alphabet")
	else
		for k, v in pairs({
			"Food",
			"Tools",
			"Equipment",
			"EquipmentPalettes",
			"Flairs",
			"Resources",
			"Miscellaneous",
			"Potions",
			"Chests",
			"StackableChests",
			"Seeds"
		}) do
			local v1 = v16:GetItemFolder(v)
			if v1 then
				local t4 = {}
				local function createItem(p1, p22) --[[ createItem | Line: 268 | Upvalues: t2 (ref), t4 (copy), v4 (ref), v5 (ref), p2 (copy), v12 (ref), v7 (ref), v16 (ref), v8 (ref), t (ref), t3 (ref) ]]
					if t2[p1] then
						return
					end
					if t4[p1] then
						return
					end
					t4[p1] = true
					if not p22 then
						task.wait(0.5)
					end
					local v2 = v4.GetByName(if p1:IsA("StringValue") then p1.Value else p1.Name)
					local v3 = v5.new({
						IgnoreBackgroundColor = true,
						Item = v2,
						DataValue = p1,
						ParentFrame = p2
					})
					v3:GiveTask(v12.new(v3.Frame, {
						Click = function() --[[ Click | Line: 288 | Upvalues: v7 (ref), v16 (ref), p1 (copy), v2 (copy), v8 (ref), t (ref) ]]
							local v1 = v7:CanListSale(v16, {
								Price = 1,
								Name = p1.Name,
								ItemType = v2.ItemType,
								ItemData = v2,
								Amount = p1.Value,
								DataValue = p1
							})
							if v1 == true then
								t:SetSelectedItem({
									Name = p1.Name,
									ItemData = v2,
									DataValue = p1,
									ItemType = v2.ItemType,
									Amount = p1.Value
								})
							else
								v8.NotifyIssue(v1)
							end
						end
					}))
					t2[p1] = v3
					t4[p1] = nil
					t3.Inventory:Add(v3, true)
				end
				local function removeItem(p1) --[[ removeItem | Line: 318 | Upvalues: t2 (ref), t3 (ref) ]]
					if t2[p1] then
						t3.Inventory:Remove(t2[p1])
						t2[p1]:Destroy()
						t2[p1] = nil
					end
				end
				local v2 = true
				for k2, v3 in pairs(v1:GetChildren()) do
					v2 = tonumber(v3.Name)
					break
				end
				if v2 then
					v16:GetItemFolder(v).ChildRemoved:Connect(removeItem)
					v16:GetItemFolder(v).ChildAdded:Connect(createItem)
					for k2, v3 in pairs(v16:GetItemFolder(v):GetChildren()) do
						createItem(v3, true)
					end
					continue
				end
				for k2, v3 in pairs(v4.GetType(v)) do
					local v52 = v16:GetItemValue(k2, v)
					if v52 then
						v52:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 347 | Upvalues: v52 (copy), createItem (copy), t2 (ref), t3 (ref) ]]
							if v52.Value > 0 then
								createItem(v52)
								return
							end
							local v1 = v52
							if t2[v1] then
								t3.Inventory:Remove(t2[v1])
								t2[v1]:Destroy()
								t2[v1] = nil
							end
						end)
						if v52.Value > 0 then
							createItem(v52, true)
						end
						continue
					end
					warn("No item value found for", k2, v)
				end
			end
		end
		t3.Inventory:Sort(t3.Inventory.SortType or "Alphabet")
	end
end
function t.OnOpen(p1, p2) --[[ OnOpen | Line: 365 | Upvalues: t (copy), v2 (copy), ContainerFrame (copy), Items (copy), v10 (copy), v11 (copy), v1 (copy) ]]
	t:SetSelectingItems(false)
	local v12 = v2.getFrameFromInstance(ContainerFrame)
	if v12.Opened then
		return
	end
	v12.Opened = true
	for k, v in pairs(Items.Content.TabFrames:GetChildren()) do
		local v22 = Items.Content.TabButtons:FindFirstChild(v.Name)
		if v22 then
			v10.AddTab(v, {
				ParentFrame = Items,
				Button = v22
			})
			v10.AddStateCallback(v, "OnOpen", function() --[[ Line: 381 | Upvalues: Items (ref), v11 (ref), v10 (ref), v (copy), t (ref) ]]
				for k, v2 in pairs(Items.Content.TabFrames:GetChildren()) do
					local v1 = Items.Content.TabButtons:FindFirstChild(v2.Name)
					if v1 then
						v11.SetButtonColor(v1, "Diagonal", if v10.IsTabOpen(v2) then "Yellow" else "Blue")
					end
				end
				local v4 = v10.getTabFromInstance(v)
				if v4.Opened then
					return
				end
				v4.Opened = true
				t:CreateInventoryTab(v)
			end)
			v10.AddStateCallback(v, "OnClose", function() --[[ Line: 397 ]] end)
			v1.new(v22, {
				Click = function() --[[ Click | Line: 402 | Upvalues: v10 (ref), v (copy) ]]
					if not v10.IsTabOpen(v) then
						v10.OpenTab(v)
					end
				end
			})
		end
	end
end
function t.OnClose(p1) --[[ OnClose | Line: 411 | Upvalues: t (copy), v2 (copy), ContainerFrame (copy), v10 (copy), Items (copy) ]]
	t:SetSelectingItems(false)
	if v2.MainFrameOpen ~= ContainerFrame then
		v10.CloseAllTabs(Items)
		return
	end
	t.Close(true)
	v10.CloseAllTabs(Items)
end
function t.Cleanup(p1) --[[ Cleanup | Line: 421 | Upvalues: v18 (copy), v2 (copy), ContainerFrame (copy) ]]
	v18:DoCleaning()
	v2.CleanContents(ContainerFrame)
end
function t.Open(...) --[[ Open | Line: 426 | Upvalues: v2 (copy), ContainerFrame (copy), t (copy) ]]
	if v2.IsFrameOpen(ContainerFrame) then
		t.Close()
	else
		v2.OpenMainFrame(ContainerFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	end
end
function t.Close(p1) --[[ Close | Line: 438 | Upvalues: v2 (copy), ContainerFrame (copy) ]]
	v2.CloseFrame(ContainerFrame, {})
	v2.OpenHUD({
		DoNotCloseMainFrame = p1
	})
end
function t.Init(p1) --[[ Init | Line: 448 | Upvalues: v2 (copy), ContainerFrame (copy), t (copy), v1 (copy), v7 (copy), v16 (copy), v8 (copy), Items (copy), v19 (ref), v6 (copy), v14 (copy), v11 (copy), setAmount (copy) ]]
	v2.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v2.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 460 | Upvalues: t (ref) ]]
		t:OnOpen(...)
	end)
	v2.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 463 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
	v2.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 466 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v1.new(ContainerFrame.Menu.Listings.Content.Content.Content.Items.AddButton.AddButton, {
		Rotate = false,
		Click = function() --[[ Click | Line: 472 | Upvalues: v7 (ref), v16 (ref), v8 (ref), t (ref) ]]
			if v7:IsAtMaxSales(v16) then
				v8.NotifyIssue("AtMaxSales")
			else
				t:SetSelectingItems(true)
			end
		end
	})
	v1.new(Items.Content.TabButtons.ReturnButton, {
		Click = function() --[[ Click | Line: 484 | Upvalues: t (ref) ]]
			t:SetSelectingItems(false)
		end
	})
	v1.new(Items.SelectFrame.SelectedFrame.ConfirmButton, {
		Click = function() --[[ Click | Line: 490 | Upvalues: v19 (ref), v7 (ref), v16 (ref), v8 (ref), v6 (ref), v14 (ref), t (ref) ]]
			if not v19.Price then
				return
			end
			local v1 = v7:CanListSale(v16, v19)
			if v1 ~= true then
				warn(v1)
				v8.NotifyIssue(v1)
				return
			end
			if v6.GetRemoteFunction("ListSaleRemote"):InvokeServer({
				Name = v19.Name,
				ItemType = v19.ItemType,
				Amount = v19.Amount,
				Price = v19.Price
			}) ~= true then
				return
			end
			v14.Notify({
				Message = "You have succesfully created a listing!",
				Preset = "Green"
			})
			t:SetSelectingItems(false)
		end
	})
	v11.CreateInputTextBox(Items.SelectFrame.SelectedFrame.AmountContainer.TextContainer.Input, setAmount, true)
	v1.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 519 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
end
t:Init()
return t