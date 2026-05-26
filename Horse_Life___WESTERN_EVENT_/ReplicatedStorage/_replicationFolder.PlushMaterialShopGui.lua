-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local t = {}
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("GuiUtils")
local v3 = Sonar("GuiManager")
local v4 = Sonar("Maid")
local v5 = Sonar("PlushMachineService")
local v6 = Sonar("TimeUtils")
local v7 = Sonar("IssueResponseClient")
local v8 = Sonar("ItemGridButton")
local v9 = Sonar("ItemDataService")
local v10 = Sonar("ItemInfoFrame")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v11 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("PlushMaterialShopGui").ContainerFrame
local Menu = ContainerFrame.Menu
local v12 = v4.new()
local v13 = v4.new()
local v14 = v4.new()
local v15 = nil
local function setTimeLabel() --[[ setTimeLabel | Line: 35 | Upvalues: Menu (copy), v6 (copy), v5 (copy) ]]
	Menu.Content.Timer.TextLabel.Text = "Resets in " .. v6.FormatString(v5.ShopRefreshTimer:GetTime())
end
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 39 | Upvalues: Menu (copy) ]]
	if p1 then
		Menu.Content.Items.Info.Content.Visible = true
		Menu.Content.Items.Info.NotSelected.Visible = false
	else
		Menu.Content.Items.Info.Content.Visible = false
		Menu.Content.Items.Info.NotSelected.Visible = true
	end
end
local function selectItem(p1) --[[ selectItem | Line: 49 | Upvalues: v14 (copy), v15 (ref), Menu (copy), v10 (copy), v9 (copy), v11 (copy) ]]
	v14:DoCleaning()
	v15 = p1
	if p1 then
		v15 = p1
		Menu.Content.Items.Info.Content.Visible = true
		Menu.Content.Items.Info.NotSelected.Visible = false
		v14:GiveTask(v10.new({
			Item = v9.GetByName(p1.Name),
			DataValue = v11:GetItemValue(p1.Name),
			Theme = p1.Theme,
			Frame = Menu.Content.Items.Info.Content,
			Price = p1.Cost
		}))
	else
		Menu.Content.Items.Info.Content.Visible = false
		Menu.Content.Items.Info.NotSelected.Visible = true
	end
end
local function setLocked() --[[ setLocked | Line: 69 | Upvalues: Menu (copy), v5 (copy), v11 (copy) ]]
	Menu.Content.Items.Locked.Visible = v5.HasReachedPurchaseLimit(v11)
	Menu.Content.Items.Locked.Description.Text = string.format("Only purchase %s materials per cycle.", v5.MaxMaterialPurchases)
end
local function createItems() --[[ createItems | Line: 75 | Upvalues: v13 (copy), v5 (copy), Menu (copy), v9 (copy), v8 (copy), v11 (copy), v1 (copy), v15 (ref), selectItem (copy) ]]
	v13:DoCleaning()
	for k, v in pairs(v5.GetMaterialShopItems()) do
		local v12 = Menu.Content.Items.Menu.Content.Default:Clone()
		local v2 = v9.GetByName(k)
		if v2 then
			v13:GiveTask(v8.new({
				DoNotClone = true,
				Item = v2,
				DataValue = v11:GetItemValue(k),
				ParentFrame = Menu.Content.Items.Menu.Content,
				Price = v,
				GuiObject = v12
			}))
			v13:GiveTask(v1.new(v12, {
				Click = function() --[[ Click | Line: 96 | Upvalues: v15 (ref), v2 (copy), selectItem (ref) ]]
					if v15 == v2 then
						selectItem()
					else
						selectItem(v2)
					end
				end
			}))
			v12.Visible = true
			v12.Parent = Menu.Content.Items.Menu.Content
			v13:GiveTask(v12)
			continue
		end
		warn("No item data can be found for", k)
	end
end
function t.OnOpen(p1) --[[ OnOpen | Line: 112 | Upvalues: v3 (copy), ContainerFrame (copy), v12 (copy), v11 (copy), setLocked (copy), Menu (copy), v5 (copy), setTimeLabel (copy), v6 (copy), createItems (copy) ]]
	local v1 = v3.getFrameFromInstance(ContainerFrame)
	if v1.ContentsLoaded then
		return
	end
	v1.ContentsLoaded = true
	v12:GiveTask(v11.PlayerData.PlushMachine.MaterialPurchases:GetPropertyChangedSignal("Value"):Connect(setLocked))
	Menu.Content.Items.Locked.Visible = v5.HasReachedPurchaseLimit(v11)
	Menu.Content.Items.Locked.Description.Text = string.format("Only purchase %s materials per cycle.", v5.MaxMaterialPurchases)
	v12:GiveTask(v5.ShopRefreshTimer.TimeChanged:Connect(setTimeLabel))
	Menu.Content.Timer.TextLabel.Text = "Resets in " .. v6.FormatString(v5.ShopRefreshTimer:GetTime())
	v12:GiveTask(v5.ShopRefreshTimer.SeedChanged:Connect(createItems))
	createItems()
end
function t.Cleanup(p1) --[[ Cleanup | Line: 128 | Upvalues: v3 (copy), ContainerFrame (copy), v12 (copy), selectItem (copy) ]]
	v3.CleanContents(ContainerFrame)
	v12:DoCleaning()
	selectItem()
end
function t.Open(p1) --[[ Open | Line: 135 | Upvalues: v3 (copy), ContainerFrame (copy) ]]
	v3.OpenFrame(ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
end
function t.Close() --[[ Close | Line: 141 | Upvalues: v3 (copy), ContainerFrame (copy) ]]
	v3.CloseFrame(ContainerFrame)
end
function t.Init(p1) --[[ Init | Line: 145 | Upvalues: v3 (copy), ContainerFrame (copy), v2 (copy), v11 (copy), t (copy), v1 (copy), Menu (copy), v15 (ref), v5 (copy), v7 (copy), selectItem (copy) ]]
	v3.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v2.CreateCurrencyLabel({
		GuiObject = ContainerFrame.Menu.Content.Coins.Content.TextLabel,
		Value = v11:GetCurrencyValue("Coins"),
		OnChanged = function(p1, p2) --[[ OnChanged | Line: 158 ]] end
	})
	v3.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 163 | Upvalues: t (ref) ]]
		t:OnOpen(...)
	end)
	v3.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 167 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v1.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 172 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v1.new(Menu.Content.Items.Info.Content.Buttons.Buy, {
		Click = function() --[[ Click | Line: 178 | Upvalues: v15 (ref), v5 (ref), v11 (ref), v7 (ref) ]]
			if not v15 then
				return
			end
			local v1 = v5.CanPurchaseMaterial(v11, v15.Name)
			if v1 == true then
				v5:PurchaseMaterialShop(v15.Name)
			else
				v7.NotifyIssue(v1)
			end
		end
	})
	selectItem()
end
t:Init()
return t