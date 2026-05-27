-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local t = {}
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ItemInfoFrame")
local v2 = Sonar("ItemDataService")
local v3 = Sonar("ItemGridButton")
local v4 = Sonar("GuiManager")
local v5 = Sonar("ButtonTest")
local v6 = Sonar("GuiUtils")
local v7 = Sonar("Maid")
local v8 = Sonar("TimeUtils")
local v9 = Sonar("GachaService")
local v10 = Sonar("RemoteUtils")
local v11 = Sonar("IssueResponseClient")
local v12 = Sonar("Constants")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v13 = Sonar("PlayerWrapper").GetClient()
local v14 = v10.GetRemoteFunction("PurchasePlushie")
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("GachaMachineGui").ContainerFrame
local Menu = ContainerFrame.Menu
local v15 = v7.new()
local v16 = v7.new()
local v17 = v7.new()
local v18 = nil
local v19 = 0
local v20 = nil
local GachaRefreshTimer = v9.GachaRefreshTimer
function t.Cleanup(p1) --[[ Cleanup | Line: 47 | Upvalues: v15 (copy) ]]
	v15:DoCleaning()
end
local function setTimeLabel() --[[ setTimeLabel | Line: 51 | Upvalues: Menu (copy), v8 (copy), GachaRefreshTimer (ref) ]]
	Menu.Content.Timer.TextLabel.Text = "Resets in " .. v8.FormatString(GachaRefreshTimer:GetTime())
end
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 55 | Upvalues: Menu (copy) ]]
	if p1 then
		Menu.Content.Items.Info.Content.Visible = true
		Menu.Content.Items.Info.NotSelected.Visible = false
	else
		Menu.Content.Items.Info.Content.Visible = false
		Menu.Content.Items.Info.NotSelected.Visible = true
	end
end
local function selectItem(p1) --[[ selectItem | Line: 65 | Upvalues: v17 (copy), v18 (ref), Menu (copy), v1 (copy), v2 (copy), v13 (copy) ]]
	v17:DoCleaning()
	v18 = p1
	if p1 then
		v18 = p1
		Menu.Content.Items.Info.Content.Visible = true
		Menu.Content.Items.Info.NotSelected.Visible = false
		v17:GiveTask(v1.new({
			Item = v2.GetByName(p1.Name),
			DataValue = v13:GetItemValue(p1.Name),
			Theme = p1.Theme,
			Frame = Menu.Content.Items.Info.Content,
			Price = p1.Cost
		}))
	else
		Menu.Content.Items.Info.Content.Visible = false
		Menu.Content.Items.Info.NotSelected.Visible = true
	end
end
function t.Open(p1, p2) --[[ Open | Line: 85 | Upvalues: v4 (copy), ContainerFrame (copy), GachaRefreshTimer (ref), v9 (copy), v12 (copy), v20 (ref), v16 (copy), LocalPlayer (copy), Menu (copy), v2 (copy), v3 (copy), v13 (copy), v5 (copy), v18 (ref), selectItem (copy), v15 (copy), setTimeLabel (copy), v8 (copy) ]]
	v4.OpenFrame(ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
	if p2 == "Event" then
		GachaRefreshTimer = v9.EventGachaRefreshTimer
		ContainerFrame.Menu.Content.Items.Menu.Content.Default.Content.Viewport.PriceLabel.Normal.Visible = false
		ContainerFrame.Menu.Content.Items.Menu.Content.Default.Content.Viewport.PriceLabel.EventCurrency.Visible = true
		ContainerFrame.Menu.Content.Items.Menu.Content.Default.Content.Viewport.PriceLabel.EventCurrency.Image = v12.CurrentEventUICosmetics.CurrencyImage
		ContainerFrame.Menu.Content.Items.Locked.Description.Text = "Only purchase 1 item per cycle."
		v20 = "Event"
		ContainerFrame.Menu.Content.EventCurrency.Visible = true
		ContainerFrame.Menu.Content.Coins.Visible = false
	else
		GachaRefreshTimer = v9.GachaRefreshTimer
		ContainerFrame.Menu.Content.Items.Menu.Content.Default.Content.Viewport.PriceLabel.Normal.Visible = true
		ContainerFrame.Menu.Content.Items.Menu.Content.Default.Content.Viewport.PriceLabel.EventCurrency.Visible = false
		ContainerFrame.Menu.Content.Items.Locked.Description.Text = "Only purchase 1 plush per cycle."
		v20 = nil
		ContainerFrame.Menu.Content.EventCurrency.Visible = false
		ContainerFrame.Menu.Content.Coins.Visible = true
	end
	local function CreateItems() --[[ CreateItems | Line: 115 | Upvalues: v16 (ref), v9 (ref), p2 (copy), LocalPlayer (ref), Menu (ref), v2 (ref), v3 (ref), v13 (ref), v5 (ref), v18 (ref), selectItem (ref) ]]
		v16:DoCleaning()
		local v1 = v9.GetShopItems(p2)
		local v22
		if v9.CanPurchase(LocalPlayer, p2) then
			Menu.Content.Items.Locked.Visible = false
			v22 = true
		else
			Menu.Content.Items.Locked.Visible = true
			v22 = false
		end
		for v32, v4 in v1 do
			local v52 = Menu.Content.Items.Menu.Content.Default:Clone()
			local v6 = v2.GetByName(v4.Name)
			if v6 then
				v16:GiveTask(v3.new({
					DoNotClone = true,
					Item = v6,
					DataValue = v13:GetItemValue(v4.Name),
					ParentFrame = Menu.Content.Items.Menu.Content,
					Price = v4.Cost,
					GuiObject = v52
				}))
				if v4.Theme then
					local v7 = v2.GetByName(v4.Theme)
					v52.Content.Viewport.Theme.Visible = true
					v52.Content.Viewport.Theme.ImageLabel.Image = v7.Texture or ""
					v52.Content.Viewport.Theme.ImageLabel.UIGradient.Color = v7.ColorSequence or ColorSequence.new(Color3.fromRGB(255, 255, 255))
					v52.Content.Viewport.Theme.ImageLabel.UIGradient.Enabled = true
				else
					v52.Content.Viewport.Theme.Visible = false
				end
				v16:GiveTask(v52)
				if v22 then
					v16:GiveTask(v5.new(v52, {
						Click = function() --[[ Click | Line: 159 | Upvalues: v18 (ref), v4 (copy), selectItem (ref) ]]
							if v18 == v4 then
								selectItem()
							else
								selectItem(v4)
							end
						end
					}))
				end
				v52.Visible = true
				v52.Parent = Menu.Content.Items.Menu.Content
				continue
			end
			warn("No item data found for", v4.Name)
		end
	end
	Menu.Content.Coins.Content.TextLabel.Text = v13:GetItemValue("PlushCoin").Value or 0
	if not v13:GetItemValue("PlushCoin") then
		v15:GiveTask(v13.PlayerData.Gacha.LastSeed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 182 | Upvalues: v9 (ref), LocalPlayer (ref), Menu (ref) ]]
			if v9.CanPurchase(LocalPlayer) then
				Menu.Content.Items.Locked.Visible = false
			else
				Menu.Content.Items.Locked.Visible = true
			end
		end))
		v15:GiveTask(v13.PlayerData.Gacha.EventSeed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 190 | Upvalues: v9 (ref), LocalPlayer (ref), Menu (ref) ]]
			if v9.CanPurchase(LocalPlayer, "Event") then
				Menu.Content.Items.Locked.Visible = false
			else
				Menu.Content.Items.Locked.Visible = true
			end
		end))
		v15:GiveTask(GachaRefreshTimer.SeedChanged:Connect(CreateItems))
		v15:GiveTask(GachaRefreshTimer.TimeChanged:Connect(setTimeLabel))
		CreateItems()
		Menu.Content.Items.Info.Content.Visible = false
		Menu.Content.Items.Info.NotSelected.Visible = true
		Menu.Content.Timer.TextLabel.Text = "Resets in " .. v8.FormatString(GachaRefreshTimer:GetTime())
		return
	end
	v15:GiveTask(v13:GetItemValue("PlushCoin"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 177 | Upvalues: Menu (ref), v13 (ref) ]]
		Menu.Content.Coins.Content.TextLabel.Text = v13:GetItemValue("PlushCoin").Value
	end))
	v15:GiveTask(v13.PlayerData.Gacha.LastSeed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 182 | Upvalues: v9 (ref), LocalPlayer (ref), Menu (ref) ]]
		if v9.CanPurchase(LocalPlayer) then
			Menu.Content.Items.Locked.Visible = false
		else
			Menu.Content.Items.Locked.Visible = true
		end
	end))
	v15:GiveTask(v13.PlayerData.Gacha.EventSeed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 190 | Upvalues: v9 (ref), LocalPlayer (ref), Menu (ref) ]]
		if v9.CanPurchase(LocalPlayer, "Event") then
			Menu.Content.Items.Locked.Visible = false
		else
			Menu.Content.Items.Locked.Visible = true
		end
	end))
	v15:GiveTask(GachaRefreshTimer.SeedChanged:Connect(CreateItems))
	v15:GiveTask(GachaRefreshTimer.TimeChanged:Connect(setTimeLabel))
	CreateItems()
	Menu.Content.Items.Info.Content.Visible = false
	Menu.Content.Items.Info.NotSelected.Visible = true
	Menu.Content.Timer.TextLabel.Text = "Resets in " .. v8.FormatString(GachaRefreshTimer:GetTime())
end
function t.Close() --[[ Close | Line: 207 | Upvalues: v4 (copy), ContainerFrame (copy) ]]
	v4.CloseFrame(ContainerFrame)
end
function t.Init() --[[ Init | Line: 211 | Upvalues: v4 (copy), ContainerFrame (copy), t (copy), v12 (copy), v13 (copy), v6 (copy), v5 (copy), Menu (copy), v19 (ref), v14 (copy), v18 (ref), v20 (ref), v11 (copy) ]]
	v4.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v4.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 221 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	local v1 = v12.EventCurrencyName and v13:GetCurrencyValue(v12.EventCurrencyName)
	if not (v12.EventCurrencyName and v1) then
		v5.new(ContainerFrame.Menu.CloseButton, {
			Click = function() --[[ Click | Line: 240 | Upvalues: t (ref) ]]
				t.Close()
			end
		})
		v5.new(Menu.Content.Items.Info.Content.Buttons.Buy, {
			Click = function() --[[ Click | Line: 246 | Upvalues: v19 (ref), v14 (ref), v18 (ref), v20 (ref), v11 (ref) ]]
				if v19 ~= 0 and not (tick() - v19 > 1) then
					return
				end
				v19 = tick()
				local v1 = v14:InvokeServer(v18.Name, v20)
				if v1 == true then
					return
				end
				v11.NotifyIssue(v1)
			end
		})
		return
	end
	ContainerFrame.Menu.Content.EventCurrency.Content.Icon.Image = v12.CurrentEventUICosmetics.CurrencyImage
	v6.CreateCurrencyLabel({
		GuiObject = ContainerFrame.Menu.Content.EventCurrency.Content.TextLabel,
		Value = v1,
		OnChanged = function(p1, p2) --[[ OnChanged | Line: 233 ]] end
	})
	v5.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 240 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v5.new(Menu.Content.Items.Info.Content.Buttons.Buy, {
		Click = function() --[[ Click | Line: 246 | Upvalues: v19 (ref), v14 (ref), v18 (ref), v20 (ref), v11 (ref) ]]
			if v19 ~= 0 and not (tick() - v19 > 1) then
				return
			end
			v19 = tick()
			local v1 = v14:InvokeServer(v18.Name, v20)
			if v1 == true then
				return
			end
			v11.NotifyIssue(v1)
		end
	})
end
t.Init()
return t