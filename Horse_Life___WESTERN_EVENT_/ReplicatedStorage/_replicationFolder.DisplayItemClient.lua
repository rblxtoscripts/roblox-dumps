-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Animal")
local v2 = Sonar("Button")
local v3 = Sonar("CharacterControls")
local v4 = Sonar("Confetti")
local v5 = Sonar("GuiManager")
local v6 = Sonar("InputTypeDetector")
local v7 = Sonar("ItemDataService")
local v8 = Sonar("Maid")
local v9 = Sonar("NotificationsClient")
local v10 = Sonar("PlayerWrapper")
local v11 = Sonar("UINavigator")
local ScreenFlashes = v10.GetClient().PlayerData.Settings.States.ScreenFlashes
local DisplayItemGui = Players.LocalPlayer.PlayerGui:WaitForChild("DisplayItemGui")
local ContainerFrame = DisplayItemGui.ContainerFrame
local v12 = ContainerFrame.Content
local ItemViewport = v12.ContentFrame.ItemViewport
local v13 = false
local v14 = false
local v15 = nil
local v16 = v8.new()
local v17 = nil
function t.CanDismiss() --[[ CanDismiss | Line: 48 | Upvalues: v14 (ref) ]]
	return v14
end
function t.CanRun(p1, p2) --[[ CanRun | Line: 53 | Upvalues: v15 (ref), v13 (ref) ]]
	if p2.ContinueIfType and (v15 and v15.Type == p2.Type) then
		return true
	end
	if v13 then
	else
		return true
	end
end
function t.GetDisplay() --[[ GetDisplay | Line: 66 | Upvalues: v15 (ref) ]]
	return v15
end
function t.DisplayItem(p1, ...) --[[ DisplayItem | Line: 71 | Upvalues: t (copy) ]]
	if t:CanRun(...) then
		t:Start(...)
	end
end
function t.KeepItemOrClose() --[[ KeepItemOrClose | Line: 80 | Upvalues: v14 (ref), t (copy) ]]
	if v14 then
		t:Stop()
	end
end
function t.Start(p1, p2) --[[ Start | Line: 89 | Upvalues: v15 (ref), t (copy), v14 (ref), v13 (ref), ItemViewport (copy), DisplayItemGui (copy), v1 (copy), v5 (copy), v9 (copy), v11 (copy), v7 (copy), v17 (ref), ScreenFlashes (copy), v4 (copy) ]]
	if v15 then
		t:Stop(true)
	end
	p2.MobileClickBackgroundToClose = p2.MobileClickBackgroundToClose == nil
	p2.Type = p2.Type or "Default"
	v15 = p2
	v14 = false
	v13 = true
	ItemViewport.Position = UDim2.fromScale(0.5, 0.5)
	ItemViewport.Size = UDim2.fromScale(1, 1)
	DisplayItemGui.Enabled = true
	v1:StopMovement()
	v5.CloseHUD()
	v9.ClearNotifications()
	v11.SetHUDNavigationEnabled(false)
	v11.ResetGamepadSelection()
	local ItemData = p2.ItemData
	local v2 = if ItemData then ItemData else v7.GetByName(p2.ItemName or (if ItemData then ItemData.Name else ItemData))
	if v2 then
		if not v17 then
			v17 = ItemViewport.Stance.Text
		end
		local Description = p2.Description
		local v3 = if Description then Description else ItemViewport.Stance.Text
		local DoAnimatedIntro = p2.DoAnimatedIntro
		if if DoAnimatedIntro then ScreenFlashes.Value else DoAnimatedIntro then
			v4.Emit(100)
		end
		ItemViewport.Stance.Text = v3
		ItemViewport.Viewport.Image = v2.Image
	end
	task.delay(p2.DismissDelay or 1, function() --[[ Line: 140 | Upvalues: v14 (ref) ]]
		v14 = true
	end)
end
function t.Stop(p1, p2) --[[ Stop | Line: 146 | Upvalues: v16 (copy), v13 (ref), DisplayItemGui (copy), v17 (ref), ItemViewport (copy), v5 (copy), v11 (copy), v15 (ref) ]]
	v16:DoCleaning()
	v13 = false
	if p2 then
		v11.SetHUDNavigationEnabled(true)
		v11.ResetSelectionToTargetFrame()
		v15 = nil
		return
	end
	DisplayItemGui.Enabled = false
	if v17 then
		ItemViewport.Stance.Text = v17
	end
	v5.OpenHUD()
	v11.SetHUDNavigationEnabled(true)
	v11.ResetSelectionToTargetFrame()
	v15 = nil
end
function t.YieldForNoDisplay() --[[ YieldForNoDisplay | Line: 168 | Upvalues: v15 (ref) ]]
	if not v15 then
		return
	end
	repeat
		task.wait()
	until not v15
	return true
end
function t._setupControls(p1) --[[ _setupControls | Line: 178 | Upvalues: DisplayItemGui (copy), v13 (ref), v11 (copy), v12 (copy), t (copy), v3 (copy) ]]
	local function canUseCallback() --[[ canUseCallback | Line: 179 | Upvalues: DisplayItemGui (ref), v13 (ref) ]]
		return DisplayItemGui.Enabled and v13
	end
	local function onInputBegan() --[[ onInputBegan | Line: 183 | Upvalues: v11 (ref), v12 (ref) ]]
		v11.SetGamepadSelection(v12)
	end
	local function onDismissInput() --[[ onDismissInput | Line: 187 | Upvalues: t (ref) ]]
		t.KeepItemOrClose()
	end
	v3:AddControls("GamepadSelectItemDisplay", { Enum.KeyCode.ButtonSelect, Enum.KeyCode.ButtonA, Enum.KeyCode.ButtonB }, {
		InputBegan = function() --[[ InputBegan | Line: 196 | Upvalues: v11 (ref), v12 (ref), t (ref) ]]
			v11.SetGamepadSelection(v12)
			t.KeepItemOrClose()
		end
	}, canUseCallback, nil, true)
end
function t._setupGui(p1) --[[ _setupGui | Line: 206 | Upvalues: v2 (copy), ContainerFrame (copy), v6 (copy), v15 (ref), t (copy), DisplayItemGui (copy) ]]
	v2.new(ContainerFrame, {
		Selectable = true,
		Click = function() --[[ Click | Line: 210 | Upvalues: v6 (ref), v15 (ref), t (ref) ]]
			if not v6.IsMobileInputType() or v15.MobileClickBackgroundToClose then
				t.KeepItemOrClose()
			end
		end
	})
	ContainerFrame.Visible = true
	DisplayItemGui.Enabled = false
end
function t.Init(p1) --[[ Init | Line: 223 ]]
	p1:_setupControls()
	p1:_setupGui()
end
t:Init()
return t