-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ItemInfoFrame")
local v2 = Sonar("DynamicNPCService")
local v3 = Sonar("IssueResponseClient")
local v4 = Sonar("PremiumShopGui")
local v5 = Sonar("ItemDataService")
local v6 = Sonar("ItemGridButton")
local v7 = Sonar("GuiManager")
local v8 = Sonar("ButtonTest")
local v9 = Sonar("ShopService")
local v10 = Sonar("GuiUtils")
local v11 = Sonar("Maid")
local v12 = Sonar("TimeUtils")
local v13 = Sonar("TabManager")
local v14 = Sonar("AnimalGridButton")
local v15 = Sonar("InfoOverlayGui")
local v16 = Sonar("DisplayAnimalClient")
local v17 = Sonar("PromptClient")
local v18 = Sonar("DisplayUtils")
local v19 = Sonar("FormatNumber")
local BondsNeeded = Sonar("Constants").BondsNeeded
local LocalPlayer = game:GetService("Players").LocalPlayer
local v20 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local ContainerFrame = PlayerGui:WaitForChild("NPCShopGui").ContainerFrame
local Menu = ContainerFrame.Menu
local v21 = v11.new()
local t2 = {
	Items = v11.new(),
	Horses = v11.new()
}
local v22 = nil
local v23 = v11.new()
local v24 = nil
local t3 = {}
local v25 = nil
local v26 = false
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 56 | Upvalues: Menu (copy) ]]
	if p1 then
		Menu.Content.Items.Info.Content.Visible = true
		Menu.Content.Items.Info.NotSelected.Visible = false
	else
		Menu.Content.Items.Info.Content.Visible = false
		Menu.Content.Items.Info.NotSelected.Visible = true
	end
end
local function oneTimePurchaseDisable(p1) --[[ oneTimePurchaseDisable | Line: 66 | Upvalues: v20 (copy), t3 (copy), v24 (ref), Menu (copy) ]]
	local v1 = false
	if p1.ItemType ~= "Buildings" then
		return v1
	end
	local v2 = v20.PlayerData.UnlockedFurniture:FindFirstChild(p1.Name)
	if v2.Value then
		return true
	end
	v2:GetPropertyChangedSignal("Value"):Once(function() --[[ Line: 74 | Upvalues: t3 (ref), v24 (ref), Menu (ref) ]]
		local v1 = t3[v24.Name]
		if v1 then
			v1.Frame.Visible = false
			Menu.Content.Items.Info.Content.Visible = false
			Menu.Content.Items.Info.NotSelected.Visible = true
			v24 = nil
		end
	end)
	return v1
end
local function selectItem(p1, p2) --[[ selectItem | Line: 90 | Upvalues: v23 (copy), v24 (ref), Menu (copy), v1 (copy), v5 (copy), v20 (copy) ]]
	v23:DoCleaning()
	v24 = p1
	if p1 then
		v24 = p1
		Menu.Content.Items.Info.Content.Visible = true
		Menu.Content.Items.Info.NotSelected.Visible = false
		v23:GiveTask(v1.new({
			Item = v5.GetByName(p1.Name),
			DataValue = v20:GetItemValue(p1.Name),
			Theme = p1.Theme,
			Frame = Menu.Content.Items.Info.Content,
			Price = p1.Cost
		}))
	else
		Menu.Content.Items.Info.Content.Visible = false
		Menu.Content.Items.Info.NotSelected.Visible = true
	end
end
local t4 = {
	Items = function() --[[ Items | Line: 110 | Upvalues: t2 (copy), selectItem (copy), v2 (copy), v20 (copy), v22 (ref), v9 (copy), Menu (copy), v5 (copy), v6 (copy), ContainerFrame (copy), t3 (copy), oneTimePurchaseDisable (copy), BondsNeeded (copy), v8 (copy), v24 (ref), v21 (copy) ]]
		local function createItems() --[[ createItems | Line: 112 | Upvalues: t2 (ref), selectItem (ref), v2 (ref), v20 (ref), v22 (ref), v9 (ref), Menu (ref), v5 (ref), v6 (ref), ContainerFrame (ref), t3 (ref), oneTimePurchaseDisable (ref), BondsNeeded (ref), v8 (ref), v24 (ref) ]]
			t2.Items:DoCleaning()
			selectItem()
			local v1 = v2.GetBondPercentage(v20, v22.Name)
			local v23 = v9.GetShopItems(v22.Name)
			local t = {}
			for v3, v4 in Menu.Content.Items.Menu.Content:GetChildren() do
				if v4:IsA("ImageButton") then
					table.insert(t, v4)
				end
			end
			for i = 1, math.max(#v23, 12) do
				local v52 = v23[i]
				local v62 = nil
				for v7, v82 in t do
					if v82.Name == tostring(i) then
						v62 = v82
					end
				end
				if v52 then
					v62.Visible = true
					local v92 = v5.GetByName(v52.Name)
					if v92 then
						local v10 = v6.new({
							DoNotClone = true,
							Item = v92,
							DataValue = v20:GetItemValue(v52.Name),
							ParentFrame = ContainerFrame.Menu.Content.Items.Menu,
							Price = v52.Cost,
							GuiObject = v62
						})
						t2.Items:GiveTask(v10)
						t3[v92.Name] = v10
						v10.Frame.Visible = not oneTimePurchaseDisable(v92)
					else
						warn("No item data found for " .. v52.Name)
					end
					if v52.Theme then
						local v11 = v5.GetByName(v52.Theme)
						v62.Content.Viewport.Theme.Visible = true
						v62.Content.Viewport.Theme.ImageLabel.Image = v11.Texture or ""
						v62.Content.Viewport.Theme.ImageLabel.UIGradient.Color = v11.ColorSequence or ColorSequence.new(Color3.fromRGB(255, 255, 255))
						v62.Content.Viewport.Theme.ImageLabel.UIGradient.Enabled = true
					else
						v62.Content.Viewport.Theme.Visible = false
					end
					if BondsNeeded[tonumber(v62.Name)].BondNeeded <= v1 and BondsNeeded[tonumber(v62.Name)].StreakNeeded <= v20.PlayerData.DynamicNPCs[v22.Name].Streak.Value then
						v62.LockedOverlay.Visible = false
						t2.Items:GiveTask(v8.new(v62, {
							Click = function() --[[ Click | Line: 178 | Upvalues: v24 (ref), v52 (copy), selectItem (ref) ]]
								if v24 == v52 then
									selectItem()
								else
									selectItem(v52)
								end
							end
						}))
						continue
					end
					v62.LockedOverlay.Visible = true
					local v19 = BondsNeeded[tonumber(v62.Name)].BondNeeded .. "% Bond"
					local v222 = BondsNeeded[tonumber(v62.Name)].StreakNeeded .. " Day Streak"
					if v1 < BondsNeeded[tonumber(v62.Name)].BondNeeded and BondsNeeded[tonumber(v62.Name)].StreakNeeded > v20.PlayerData.DynamicNPCs[v22.Name].Streak.Value then
						v62.LockedOverlay.Title.Text = v19 .. " & " .. v222
						continue
					end
					if v1 < BondsNeeded[tonumber(v62.Name)].BondNeeded then
						v62.LockedOverlay.Title.Text = v19
						continue
					end
					v62.LockedOverlay.Title.Text = v222
					continue
				end
				v62.Visible = false
			end
		end
		v21:GiveTask(v2.RefreshTimer.SeedChanged:Connect(createItems))
		createItems()
	end,
	Horses = function() --[[ Horses | Line: 205 | Upvalues: v20 (copy), v22 (ref), Menu (copy), v11 (copy), t2 (copy), v2 (copy), v14 (copy), LocalPlayer (copy), v5 (copy), v19 (copy), v18 (copy), v8 (copy), v3 (copy), v17 (copy), Sonar (copy), v15 (copy), v16 (copy) ]]
		local v1 = v20.PlayerData.DynamicNPCs[v22.Name]
		for k, v in pairs(v1.HorseSlots:GetChildren()) do
			local v23 = Menu.Content.Horses.Content:FindFirstChild(v.Name)
			local HorseSlots = v22.HorseSlots
			local v4 = HorseSlots[tonumber(v.Name)]
			local v52 = tick()
			local v6 = v11.new()
			t2.Horses:GiveTask(v6)
			local v7 = nil
			local function updateSlot() --[[ updateSlot | Line: 217 | Upvalues: v52 (ref), v6 (copy), v7 (ref), v2 (ref), v20 (ref), v22 (ref), v (copy), v14 (ref), LocalPlayer (ref), v23 (copy) ]]
				local v1 = tick()
				v52 = v1
				task.wait()
				if v1 ~= v1 then
					return
				end
				v6:DoCleaning()
				v7 = v2.CreateOrGetHorseSlotInfo(v20, v22.Name, tonumber(v.Name), true)[1]
				v6:GiveTask(v14.new({
					DoNotClone = true,
					IgnoreBackgroundColor = true,
					Age = 100,
					SlotValue = v7,
					Owner = LocalPlayer,
					GuiObject = v23
				}))
				if v20.PlayerData.DynamicNPCs[v22.Name].Streak.Value >= 4 then
					v23.LockedOverlay.Visible = false
				else
					v23.LockedOverlay.Visible = true
					v23.LockedOverlay.Title.Text = 4 .. " Day Streak"
				end
			end
			t2.Horses:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(updateSlot))
			t2.Horses:GiveTask(v1.LastShopSeed:GetPropertyChangedSignal("Value"):Connect(updateSlot))
			updateSlot()
			if v4.Item then
				local v82 = v5.GetByName(v4.Item)
				if v82 then
					v23.BuyButton.Top.TextLabel.Text = string.format("Buy (%s)", v19.splice(v4.Price) .. " " .. v18.GetDisplayName(v82.Name, v82))
				end
			else
				v23.BuyButton.Top.TextLabel.Text = "$" .. v4.Price
			end
			t2.Horses:GiveTask(v8.new(v23.BuyButton, {
				Click = function() --[[ Click | Line: 261 | Upvalues: v20 (ref), v22 (ref), v3 (ref), v2 (ref), v (copy), v17 (ref), v7 (ref), v18 (ref), Sonar (ref), v15 (ref), v16 (ref) ]]
					if v20.PlayerData.DynamicNPCs[v22.Name].Streak.Value < 4 then
						v3.NotifyIssue("Need 4 Day Streak")
						return
					end
					local v1 = v20
					local v4 = v2.CanPurchaseHorseSlot(v1, v22.Name, (tonumber(v.Name)))
					if v4 == true then
						local v8 = v2:PurchaseHorseSlot(v22.Name, (tonumber(v.Name)))
						if v8 then
							task.spawn(function() --[[ Line: 298 | Upvalues: v15 (ref), v16 (ref), v20 (ref), v8 (copy) ]]
								v15.Close()
								v16:DisplaySlot({
									Type = "Purchased",
									AllowNaming = true,
									ShowMaxWarning = true,
									MobileClickBackgroundToClose = true,
									Slot = v20:GetItemFolder("Animals"):WaitForChild(v8)
								})
							end)
						end
					elseif v4 == "LockedSpecies" then
						v17.Prompt({
							Type = "LockedJournal",
							Setup = function(p1) --[[ Setup | Line: 273 | Upvalues: v7 (ref), v18 (ref) ]]
								local v1 = AnimalDataService.GetByName(v7.Species.Value)
								p1.Content.Description.Text = string.format("To buy this species you must complete the %s Quests!", (v18.GetDisplayName(v1.Name, v1)))
							end,
							Run = function() --[[ Run | Line: 278 | Upvalues: Sonar (ref) ]]
								Sonar("NotificationsClient").Notify({
									Type = "OpenJournalNPC",
									Message = "You cannot open that right now!"
								})
								return true
							end,
							Cancel = function() --[[ Cancel | Line: 285 ]]
								return true
							end
						})
					else
						v3.NotifyIssue(v4)
					end
				end
			}))
			t2.Horses:GiveTask(v8.new(v23.InspectButton, {
				Click = function() --[[ Click | Line: 312 | Upvalues: v15 (ref), v2 (ref), v20 (ref), v22 (ref), v (copy) ]]
					local t = {
						SpeciesAsName = true
					}
					t.SlotValue = v2.CreateOrGetHorseSlotInfo(v20, v22.Name, (tonumber(v.Name)))[1]
					t.Disabled = {
						Pedigree = true,
						InfoPopup = true,
						Favorite = true,
						Birthday = true
					}
					t.ActionButtons = {}
					v15.Open(t)
				end
			}))
		end
	end
}
function t.Cleanup(p1) --[[ Cleanup | Line: 332 | Upvalues: t2 (copy), v21 (copy), selectItem (copy), v13 (copy), ContainerFrame (copy), Menu (copy) ]]
	for k, v in pairs(t2) do
		v:DoCleaning()
	end
	v21:DoCleaning()
	selectItem()
	v13.CloseAllTabs(ContainerFrame)
	for k, v in pairs(Menu.Content.TabButtons:GetChildren()) do
		if v:IsA("ImageButton") then
			local v1 = Menu.Content:FindFirstChild(v.Name)
			if v1 then
				v13.CleanContents(v1)
			end
		end
	end
end
function t.Open(p1, p2) --[[ Open | Line: 349 | Upvalues: v26 (ref), v7 (copy), PlayerGui (copy), v22 (ref), v25 (ref), Menu (copy), v12 (copy), v2 (copy), v21 (copy), v13 (copy), selectItem (copy) ]]
	v26 = false
	v7.OpenFrame(PlayerGui.NPCShopGui.ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
	if p1 then
		v22 = p1
		v25 = p2
		Menu.Content.Title.Text = p1.Name .. "\'s Shop"
		local function setTimeLabel() --[[ setTimeLabel | Line: 363 | Upvalues: Menu (ref), v12 (ref), v2 (ref) ]]
			Menu.Content.Timer.TextLabel.Text = "Resets in " .. v12.FormatString(v2.RefreshTimer:GetTime())
		end
		v21:GiveTask(v2.RefreshTimer.TimeChanged:Connect(setTimeLabel))
		Menu.Content.Timer.TextLabel.Text = "Resets in " .. v12.FormatString(v2.RefreshTimer:GetTime())
		Menu.Content.TabButtons.Visible = true
		v13.OpenTab(Menu.Content.Items)
		selectItem()
	end
end
function t.Close() --[[ Close | Line: 375 | Upvalues: v7 (copy), ContainerFrame (copy) ]]
	v7.CloseFrame(ContainerFrame)
end
function t.Init(p1) --[[ Init | Line: 379 | Upvalues: v7 (copy), ContainerFrame (copy), Menu (copy), v13 (copy), v8 (copy), v10 (copy), t4 (copy), v26 (ref), t (copy), PlayerGui (copy), v25 (ref), v20 (copy), v4 (copy), v24 (ref), v5 (copy), v9 (copy), v22 (ref), v3 (copy) ]]
	v7.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = Menu.Content.Items.Menu.Content
	})
	for k, v in pairs(Menu.Content.TabButtons:GetChildren()) do
		if v:IsA("ImageButton") then
			local v1 = Menu.Content:FindFirstChild(v.Name)
			if v1 then
				v13.AddTab(v1, {
					ParentFrame = ContainerFrame,
					Button = v
				})
				v8.new(v, {
					Click = function() --[[ Click | Line: 401 | Upvalues: v13 (ref), v1 (copy) ]]
						v13.OpenTab(v1)
					end
				})
				local function setColorTab() --[[ setColorTab | Line: 406 | Upvalues: v10 (ref), v (copy), v13 (ref), v1 (copy) ]]
					v10.SetButtonColor(v, "Diagonal", if v13.IsTabOpen(v1) then "Green" else "Blue")
				end
				v13.AddStateCallback(v1, "OnOpen", setColorTab)
				v13.AddStateCallback(v1, "OnClose", setColorTab)
				local SetButtonColor = v10.SetButtonColor
				local v32 = if v13.IsTabOpen(v1) then "Green" else "Blue"
				SetButtonColor(v, "Diagonal", v32)
				v13.AddStateCallback(v1, "OnOpen", function() --[[ Line: 413 | Upvalues: v13 (ref), v1 (copy), t4 (ref), v (copy) ]]
					local v12 = v13.getTabFromInstance(v1)
					if v12.ContentsLoaded then
						return
					end
					v12.ContentsLoaded = true
					t4[v.Name](v1, v)
				end)
			end
		end
	end
	v7.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 423 | Upvalues: v26 (ref), t (ref), v7 (ref), PlayerGui (ref), v25 (ref) ]]
		if not v26 then
			t:Cleanup()
		end
		if not v26 then
			v7.OpenFrame(PlayerGui.DynamicNPCGui.ContainerFrame)
		end
		v26 = false
		if v25 == nil then
			return
		end
		v25()
		v25 = nil
	end)
	v8.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 440 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v10.CreateCurrencyLabel({
		GuiObject = Menu.Content.Coins.Content.TextLabel,
		Value = v20:GetCurrencyValue("Coins")
	})
	v8.new(Menu.Content.Coins.PurchaseButton, {
		Click = function() --[[ Click | Line: 451 | Upvalues: v26 (ref), v4 (ref) ]]
			v26 = true
			v4.Open("Coins")
		end
	})
	v8.new(Menu.Content.Items.Info.Content.Buttons.Buy, {
		Click = function() --[[ Click | Line: 458 | Upvalues: v24 (ref), v5 (ref), v20 (ref), v9 (ref), v22 (ref), t (ref), v26 (ref), v4 (ref), v3 (ref) ]]
			if not v24 then
				return
			end
			local v1 = v5.GetByName(v24.Name)
			local v2, v32 = v20:CanGiveItem(v1.ItemType)
			local v42 = if v2 then false else "Max" .. v32
			if not v42 and (type(v24.Cost) == "number" and not v20:CanAfford(v24.Cost, "Coins")) then
				v42 = "CantAfford"
			end
			if v42 then
				if v42 == "MaxInventory" or v42 == "MaxEquipment" then
					t.UpgradeSlots()
				else
					v26 = true
					v4.Open("Coins")
				end
				v3.NotifyIssue(v42)
			elseif v1.ItemType == "Equipment" then
				v9:PurchaseNpcEquipment(v24.Name, v22.Name)
			else
				v9:PurchaseNpcItem(v24.Name, v22.Name)
			end
		end
	})
end
t:Init()
return t