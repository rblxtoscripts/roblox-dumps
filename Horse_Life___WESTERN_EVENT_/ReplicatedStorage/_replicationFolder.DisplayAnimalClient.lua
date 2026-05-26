-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("GuiUtils")
local v3 = Sonar("AnimalInfoFrame")
local v4 = Sonar("Button")
local v5 = Sonar("ButtonTest")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("FormatString")
local v8 = Sonar("SellingAnimalClient")
local v9 = Sonar("FormatNumber")
local v10 = Sonar("AnimalDataService")
local v11 = Sonar("InputTypeDetector")
local v12 = Sonar("CharacterControls")
local v13 = Sonar("UINavigator")
local v14 = Sonar("Animal")
local v15 = Sonar("NotificationsClient")
local v16 = Sonar("SettingsService")
local v17 = Sonar("PromptClient")
local v18 = Sonar("GuiManager")
local v19 = Sonar("ItemDataService")
local v20 = Sonar("TutorialService")
Sonar("InstanceUtils")
local v21 = Sonar("Constants")
local v22 = Sonar("PlayerWrapper").GetClient()
local LocalPlayer = game:GetService("Players").LocalPlayer
local DisplayAnimalGui = LocalPlayer.PlayerGui:WaitForChild("DisplayAnimalGui")
local BottomFrame = DisplayAnimalGui.ContainerFrame.Content.BottomFrame
local TopFrame = DisplayAnimalGui.ContainerFrame.Content.TopFrame
local NameHorse = DisplayAnimalGui.ContainerFrame.Content.ContentFrame.HorseViewport.NameHorse
local Default = BottomFrame.Default
local v23 = v1.new()
local v24 = false
local v25 = false
local v26 = nil
local t2 = {}
function t.DisplaySlot(p1, ...) --[[ DisplaySlot | Line: 53 | Upvalues: t (copy) ]]
	if t:CanRun(...) then
		t:Start(...)
	end
end
function t.Start(p1, p2) --[[ Start | Line: 58 | Upvalues: v26 (ref), t (copy), LocalPlayer (copy), v24 (ref), v25 (ref), v16 (copy), v22 (copy), v14 (copy), BottomFrame (copy), TopFrame (copy), v20 (copy), t2 (copy), v21 (copy), Sonar (copy), DisplayAnimalGui (copy), v19 (copy), v2 (copy), v23 (copy), v3 (copy), Default (copy), v9 (copy), v10 (copy), v11 (copy), NameHorse (copy), v18 (copy), v13 (copy), v15 (copy) ]]
	if v26 then
		t:Stop(true)
	end
	local Character = LocalPlayer.Character
	v26 = p2
	if p2.MobileClickBackgroundToClose == nil then
		p2.MobileClickBackgroundToClose = true
	end
	v24 = true
	v25 = false
	if v16.GetSetting(v22, "TameStopMovement") then
		v14:StopMovement()
	end
	local v1 = BottomFrame:FindFirstChild(p2.Type) or BottomFrame.Default
	for k, v in pairs(BottomFrame:GetChildren()) do
		if v:IsA("Frame") then
			v.Visible = false
		end
	end
	for k, v in pairs(TopFrame:GetChildren()) do
		if v:IsA("Frame") then
			v.Visible = false
		end
	end
	if not (p2.HideTopFrame or v20.GetGameState("HideDisplayTopFrame")) then
		local v27 = TopFrame:FindFirstChild(p2.Type) or TopFrame.Default
		local Stance = v27:FindFirstChild("Stance")
		if Stance then
			if not t2[Stance] then
				t2[Stance] = Stance.Text
			end
			local v32 = Stance
			local Description = p2.Description
			v32.Text = if Description then Description else v32.Text
		end
		v27.Visible = true
	end
	if (not v21.IsEventWorld or v21.MainWorldIsEventWorld) and (p2.ShowTameContestPoints and (v22.TameContestData and v22.TameContestData.Entered.Value)) then
		local ScoresPerSpecies = Sonar("TameContestService").ScoresPerSpecies
		TopFrame.TameContestPoints.PointsLabel.Text = string.format("\240\159\143\134 You received %s points! \240\159\143\134", ScoresPerSpecies[p2.Slot.Species.Value] or 1)
		TopFrame.TameContestPoints.Visible = true
	end
	DisplayAnimalGui.ContainerFrame.Content.MaxWarning.Visible = false
	if p2.FullViewportSize or v20.GetGameState("FullViewportDisplaySize") then
		for v6, v7 in DisplayAnimalGui.ContainerFrame.Content.ContentFrame:GetChildren() do
			if v7:IsA("GuiObject") then
				v7.Visible = v7 == DisplayAnimalGui.ContainerFrame.Content.ContentFrame.HorseViewport
			end
		end
		DisplayAnimalGui.ContainerFrame.Content.ContentFrame.HorseViewport.Size = UDim2.new(1, 0, 1, 0)
		DisplayAnimalGui.ContainerFrame.Content.ContentFrame.HorseViewport.Position = UDim2.new(0.5, 0, 0.5, 0)
	else
		local v8 = v19.GetByName(p2.Currency or "Coins")
		DisplayAnimalGui.ContainerFrame.Content.ContentFrame.Coins.Content.Icon.Image = v8.Image
		for k, v in pairs(v2.CreateCurrencyLabel({
			GuiObject = DisplayAnimalGui.ContainerFrame.Content.ContentFrame.Coins.Content.TextLabel,
			Value = v22:GetCurrencyValue(v8.Name),
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 140 ]] end
		})) do
			v23:GiveTask(v)
		end
		DisplayAnimalGui.ContainerFrame.Content.ContentFrame.HorseViewport.Size = UDim2.new(0.458, 0, 0.656, 0)
		DisplayAnimalGui.ContainerFrame.Content.ContentFrame.HorseViewport.Position = UDim2.new(0.241, 0, 0.285, 0)
		for v92, v102 in DisplayAnimalGui.ContainerFrame.Content.ContentFrame:GetChildren() do
			if v102:IsA("GuiObject") then
				v102.Visible = true
			end
		end
	end
	v23:GiveTask(v3.new({
		SlotValue = p2.Slot,
		Owner = LocalPlayer,
		Frame = DisplayAnimalGui.ContainerFrame.Content.ContentFrame,
		ForceAdult = p2.ForceAdult,
		DoAnimatedIntro = p2.DoAnimatedIntro
	}))
	Default.SellButton.Top.TextLabel.Text = "Sell ($" .. v9.suffix(v10.GetPriceForSlot(p2.Slot)) .. ")"
	if p2.AllowNaming and not v11.IsGamepadInputType() then
		NameHorse.Content.TextBox.Text = ""
		NameHorse.Visible = true
	else
		NameHorse.Content.TextBox.Text = ""
		NameHorse.Visible = false
	end
	Default.SellButton.EventCurrencyLabel.Visible = false
	if v21.CurrentEvent then
		if table.find(v21.CurrentEvent.SellSpecies, p2.Slot.Species.Value) then
			Default.SellButton.EventCurrencyLabel.Viewport.Image = v21.CurrentEventUICosmetics.CurrencyImage
			Default.SellButton.EventCurrencyLabel.Viewport.AmountLabel.Text = "+" .. v21.CurrentEvent.SellAmount
			Default.SellButton.EventCurrencyLabel.Visible = true
		end
	else
		Default.SellButton.EventCurrencyLabel.Visible = false
	end
	Default.SellButton.Locked.Visible = false
	DisplayAnimalGui.Enabled = true
	v18.CloseHUD()
	v13.SetHUDNavigationEnabled(false)
	v13.ResetGamepadSelection()
	v15.ClearNotifications()
	task.delay(p2.DismissDelay or 1, function() --[[ Line: 197 | Upvalues: v25 (ref), v1 (copy), p2 (copy), v22 (ref), DisplayAnimalGui (ref) ]]
		v25 = true
		v1.Visible = true
		if not p2.ShowMaxWarning or v22:CanGiveItem("Animals") then
			return
		end
		DisplayAnimalGui.ContainerFrame.Content.MaxWarning.Visible = true
	end)
end
function t.Stop(p1, p2) --[[ Stop | Line: 207 | Upvalues: v23 (copy), v24 (ref), v26 (ref), DisplayAnimalGui (copy), t2 (copy), v18 (copy), v13 (copy) ]]
	v23:DoCleaning()
	v24 = false
	local v1 = v26 and v26.KeepMainFrameOpen
	if not p2 then
		DisplayAnimalGui.Enabled = false
		for v2, v3 in t2 do
			v2.Text = v3
		end
		if not v1 then
			local t = {}
			t.DoNotCloseMainFrame = v18.MainFrameOpen ~= nil
			v18.OpenHUD(t)
		end
	end
	if not v1 then
		v13.SetHUDNavigationEnabled(true)
	end
	v13.ResetSelectionToTargetFrame()
	if v26 and v26.DestroySlot then
		v26.Slot:Destroy()
	end
	v26 = nil
end
function t.CanRun(p1, p2) --[[ CanRun | Line: 238 | Upvalues: v26 (ref), v24 (ref) ]]
	if p2.ContinueIfType and (v26 and v26.Type == p2.Type) then
		return true
	end
	if v24 then
	else
		return true
	end
end
function t.CanDismiss() --[[ CanDismiss | Line: 250 | Upvalues: v25 (ref) ]]
	return v25
end
function t.GetDismissFrameType(p1) --[[ GetDismissFrameType | Line: 254 | Upvalues: BottomFrame (copy) ]]
	return BottomFrame:FindFirstChild(p1)
end
function t.KeepSlotOrClose() --[[ KeepSlotOrClose | Line: 259 | Upvalues: v25 (ref), v20 (copy), NameHorse (copy), v26 (ref), v6 (copy), t (copy) ]]
	if not v25 then
		return
	end
	if not v20.CanDoActionInTutorial("KeepHorseAction") then
		return
	end
	if not (#NameHorse.Content.TextBox.Text > 0 and v26.AllowNaming) then
		t:Stop()
		return
	end
	local v1, v2 = pcall(function() --[[ Line: 267 | Upvalues: v6 (ref), v26 (ref), NameHorse (ref) ]]
		return v6.GetRemoteFunction("NameSlotRemote"):InvokeServer(v26.Slot.Name, NameHorse.Content.TextBox.Text)
	end)
	if v1 then
		t:Stop()
		return
	end
	warn("ERROR WITH NAMING", v2)
	t:Stop()
end
function t.SellSlotOrClose() --[[ SellSlotOrClose | Line: 277 | Upvalues: v17 (copy), v25 (ref), Default (copy), v20 (copy), v26 (ref), t (copy), v8 (copy) ]]
	if v17.IsActive() then
		return
	end
	if not v25 then
		return
	end
	if not Default.Visible then
		t:Stop()
		return
	end
	if v20.CanDoActionInTutorial("SellHorsesAction") then
		task.wait()
		t:Stop()
		v8:SellSlots({ v26.Slot.Name }, true)
	else
		warn("CANNOT SELL SLOT OR CLOSE, CUZ TUTORIAL")
	end
end
function t.GetDisplay() --[[ GetDisplay | Line: 297 | Upvalues: v26 (ref) ]]
	return v26
end
function t.YieldForNoDisplay() --[[ YieldForNoDisplay | Line: 301 | Upvalues: v26 (ref) ]]
	if not v26 then
		return
	end
	repeat
		task.wait()
	until not v26
	return true
end
function t.Init(p1) --[[ Init | Line: 310 | Upvalues: v4 (copy), DisplayAnimalGui (copy), v11 (copy), v26 (ref), v20 (copy), t (copy), v5 (copy), Default (copy), v21 (copy), v2 (copy), NameHorse (copy), v7 (copy), v12 (copy), v25 (ref), v24 (ref), v13 (copy) ]]
	v4.new(DisplayAnimalGui.ContainerFrame, {
		Selectable = false,
		Click = function() --[[ Click | Line: 313 | Upvalues: v11 (ref), v26 (ref), v20 (ref), t (ref) ]]
			if v11.IsMobileInputType() and not v26.MobileClickBackgroundToClose then
				return
			end
			if v20.GetGameState("KeepHorseAction") then
				t.KeepSlotOrClose()
			end
		end
	})
	v5.new(Default.SellButton, {
		Click = t.SellSlotOrClose
	})
	v5.new(Default.KeepButton, {
		Click = t.KeepSlotOrClose
	})
	v21.GameStateChangedSignal:Connect(function() --[[ Line: 334 | Upvalues: Default (ref), v20 (ref) ]]
		Default.KeepButton.InactiveFrame.Visible = not v20.GetGameState("KeepHorseAction")
	end)
	v21.GameStateChangedSignal:Connect(function() --[[ Line: 337 | Upvalues: Default (ref), v20 (ref) ]]
		Default.SellButton.InactiveFrame.Visible = not v20.GetGameState("SellHorsesAction")
	end)
	v2.CreateInputTextBox(NameHorse.Content.TextBox, function(p1, p2, p3) --[[ Line: 341 | Upvalues: v7 (ref), v21 (ref) ]]
		p1.Text = v7.trimString(p2, v21.MaxAnimalNameLength)
	end, true)
	v12:AddControls("GamepadKeepSlot", { Enum.KeyCode.ButtonY }, {
		InputBegan = function() --[[ InputBegan | Line: 348 | Upvalues: v26 (ref), v25 (ref), t (ref) ]]
			if not v26.OnContinue then
				t.KeepSlotOrClose()
				return
			end
			if v25 then
				v26.OnContinue()
			end
		end
	}, function() --[[ Line: 356 | Upvalues: v25 (ref), v24 (ref) ]]
		return v25 and v24
	end, nil, true)
	v12:AddControls("GamepadSellSlot", { Enum.KeyCode.ButtonB }, {
		InputBegan = function() --[[ InputBegan | Line: 362 | Upvalues: t (ref) ]]
			t.SellSlotOrClose()
		end
	}, function() --[[ Line: 365 | Upvalues: v25 (ref), v24 (ref) ]]
		return v25 and v24
	end, nil, true)
	v12:AddControls("GamepadSelectAnimalDisplay", { Enum.KeyCode.ButtonSelect }, {
		InputBegan = function() --[[ InputBegan | Line: 371 | Upvalues: v13 (ref), DisplayAnimalGui (ref) ]]
			v13.SetGamepadSelection(DisplayAnimalGui.ContainerFrame.Content)
		end
	}, function() --[[ Line: 374 | Upvalues: DisplayAnimalGui (ref), v24 (ref) ]]
		return DisplayAnimalGui.Enabled and v24
	end, nil, true)
	DisplayAnimalGui.ContainerFrame.Visible = true
	DisplayAnimalGui.Enabled = false
end
t:Init()
return t