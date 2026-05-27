-- https://lua.expert/
local t = {}
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("InputTypeDetector")
local v2 = nil
local v3 = Sonar("GuiUtils")
local v4 = Sonar("FoVService")
local v5 = nil
local v6 = Sonar("Constants")
local t2 = {
	OpenPosition = UDim2.new(0.5, 0, 0.5, 0),
	ClosePosition = UDim2.new(0.5, 0, -1.5, 0),
	TweenStyle = TweenInfo.new(0.175, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
}
local t3 = {
	Open = {
		Size = 20
	},
	Close = {
		Size = 0
	}
}
local t4 = {
	Close = {
		ImageTransparency = 1
	},
	Open = {
		ImageTransparency = 0.4
	}
}
local v7 = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local t5 = {
	[3] = "Mobile",
	[2] = "Other",
	[1] = "Other"
}
local v8 = Sonar("PlayerWrapper").GetClient()
local t6 = {}
local t7 = {
	HUD = {},
	Main = {},
	Sub = {},
	Overlay = {},
	CloseOverlay = {}
}
local t8 = {}
local t9 = {}
function t.RegisterAfterOpenHUD(p1) --[[ RegisterAfterOpenHUD | Line: 224 | Upvalues: t9 (copy) ]]
	table.insert(t9, p1)
end
local t10 = {
	{
		Key = "HUD",
		Frames = t7.HUD
	},
	{
		Key = "Overlay",
		Frames = t7.Overlay
	},
	{
		Key = "CheckVisibility",
		Frames = t7.Sub
	}
}
local InterfaceBlur = Instance.new("BlurEffect")
InterfaceBlur.Name = "InterfaceBlur"
InterfaceBlur.Size = 0
InterfaceBlur.Parent = game:GetService("Lighting")
local BackgroundLabel = v8.Player.PlayerGui.BackgroundGui.BackgroundFrame.BackgroundLabel
local function canMakeVisibleFromInput(p1) --[[ canMakeVisibleFromInput | Line: 252 | Upvalues: t5 (copy), v1 (copy) ]]
	if not p1.InputType then
		return true
	end
	local isInputType = p1.InputType == t5[v1.GetInputType()]
	return isInputType
end
local function addFrameToSets(p1) --[[ addFrameToSets | Line: 260 | Upvalues: t7 (copy), t6 (copy), t10 (copy) ]]
	if t7[t6[p1].CloseAll] then
		t7[t6[p1].CloseAll][p1] = true
	end
	for i, v in ipairs(t10) do
		if t6[p1][v.Key] then
			v.Frames[p1] = true
			return
		end
	end
	t7.Main[p1] = true
end
local function runCallbacksForFrame(p1, p2, p3) --[[ runCallbacksForFrame | Line: 276 ]]
	local v2 = if p3 then p3 else {}
	for k, v in pairs(p2) do
		v(table.unpack(v2))
	end
end
local function setMobileFramePositions() --[[ setMobileFramePositions | Line: 287 | Upvalues: t6 (copy), t (copy) ]]
	for k, v in pairs(t6) do
		if v.IsOpen and not v.Overlay then
			t.SetFrame(k, true, false, nil, v.KeepPosition)
		end
	end
end
local function setInputTypeFrameVisibility() --[[ setInputTypeFrameVisibility | Line: 300 | Upvalues: t6 (copy), t5 (copy), v1 (copy) ]]
	for k, v in pairs(t6) do
		local v12
		if v.InputType and v.IsOpen then
			v12 = if v.InputType then v.InputType == t5[v1.GetInputType()] else true
			k.Visible = v12
		end
	end
end
local function waitForCleanup(p1, p2) --[[ waitForCleanup | Line: 310 | Upvalues: runCallbacksForFrame (copy) ]]
	local v1 = tick()
	p2.CloseTick = v1
	local count = 0
	while p2.CloseTick == v1 and count < 120 do
		wait(1)
		count = count + 1
	end
	if p2.CloseTick == v1 then
		print("Gui Manager - Running Cleanup on", p1:GetFullName())
		runCallbacksForFrame(p1, p2.OnCleanup)
	end
end
local function areFramesInLayerCollectorVisible(p1) --[[ areFramesInLayerCollectorVisible | Line: 327 ]]
	for k, v in pairs(p1) do
		if k.Visible then
			return true
		end
	end
	return false
end
local function setLayerCollectorEnabled(p1, p2) --[[ setLayerCollectorEnabled | Line: 337 | Upvalues: t8 (copy) ]]
	local v1 = t8[p1]
	local v2 = false
	for k, v in pairs(v1) do
		if k.Visible then
			v2 = true
			break
		end
	end
	if v2 then
		p1.Enabled = true
	else
		task.delay(1, function() --[[ Line: 339 | Upvalues: p1 (copy), t8 (ref) ]]
			local v3_2 = false
			for k2, v in pairs(t8[p1]) do
				if k2.Visible then
					v3_2 = true
					break
				end
			end
			p1.Enabled = v3_2
		end)
	end
end
function t.AddFrame(p1, p2) --[[ AddFrame | Line: 355 | Upvalues: t6 (copy), t2 (copy), t8 (copy), t (copy), v5 (ref), addFrameToSets (copy) ]]
	local v1 = p2 or {}
	if t6[p1] then
		warn(p1:GetFullName(), "has already been added!")
		return
	end
	t6[p1] = {}
	t6[p1].Frame = p1
	local v2 = v1
	for k, v in pairs(v1) do
		t6[p1][k] = v
	end
	for k, v in pairs(t2) do
		if not t6[p1][k] then
			t6[p1][k] = v
		end
	end
	local v3 = p1:FindFirstAncestorWhichIsA("LayerCollector")
	if v3 then
		if not v2.IgnoreLayerCollector and v3 then
			if not t8[v3] then
				t8[v3] = {}
			end
			t8[v3][p1] = true
			p1:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 384 | Upvalues: v3 (copy), t8 (ref) ]]
				local v1 = v3
				local v2 = t8[v1]
				local v32 = false
				for k, v in pairs(v2) do
					if k.Visible then
						v32 = true
						break
					end
				end
				if v32 then
					v1.Enabled = true
				else
					task.delay(1, function() --[[ Line: 339 | Upvalues: v1 (copy), t8 (ref) ]]
						local v3_2 = false
						for k2, v in pairs(t8[v1]) do
							if k2.Visible then
								v3_2 = true
								break
							end
						end
						v1.Enabled = v3_2
					end)
				end
			end)
			local v4 = t8[v3]
			local v52 = false
			for k, v in pairs(v4) do
				if k.Visible then
					v52 = true
					break
				end
			end
			if v52 then
				v3.Enabled = true
			else
				task.delay(1, function() --[[ Line: 339 | Upvalues: v3 (copy), t8 (ref) ]]
					local v3_2 = false
					for k2, v in pairs(t8[v3]) do
						if k2.Visible then
							v3_2 = true
							break
						end
					end
					v3.Enabled = v3_2
				end)
			end
		end
	elseif v3 then
		v3.Enabled = true
	end
	t.AddStateCallback(p1, "OnClose", function() --[[ Line: 396 | Upvalues: v5 (ref), p1 (copy) ]]
		v5.ResetTargetFrame(p1)
	end)
	addFrameToSets(p1)
end
function t.AddStateCallback(p1, p2, p3) --[[ AddStateCallback | Line: 405 | Upvalues: t (copy) ]]
	local v1 = t.getFrameFromInstance(p1)
	if not v1 then
		warn("No Frame can be found for", p1:GetFullName())
		return
	end
	if not v1[p2] then
		v1[p2] = {}
	end
	v1[p2][#v1[p2] + 1] = p3
end
function t.OpenFrame(p1, p2) --[[ OpenFrame | Line: 423 | Upvalues: t (copy), v5 (ref), Sonar (copy), runCallbacksForFrame (copy) ]]
	local v1 = if p2 then p2 else {}
	local v2 = t.getFrameFromInstance(p1)
	v2.CloseTick = tick()
	local v3
	if v1.TweenAnimation == nil then
		local v4
		if type(v2.TweenAnimation) == "boolean" then
			v4 = v2.TweenAnimation
			if v4 then
				v3 = v1
			elseif v2.TweenAnimation == "Open" then
				v3 = v1
				v4 = true
			else
				v3 = v1
				v4 = false
			end
		elseif v2.TweenAnimation == "Open" then
			v3 = v1
			v4 = true
		else
			v3 = v1
			v4 = false
		end
		v3.TweenAnimation = v4
	else
		v1.TweenAnimation = v1.TweenAnimation
		v3 = v1
	end
	t.SetFrame(p1, v3.State or true, v3.TweenAnimation, v3.Position, v2.KeepPosition)
	if v3.Blur ~= nil then
		t.SetBlur(v3.Blur, true)
	end
	if v3.DepthOfField ~= nil then
		t.SetDepthOfField(v3.DepthOfField, true)
	end
	if not (v2.HUD or v2.Overlay) then
		if v3.Background == nil then
			v3.Background = v2.Background or false
		end
		if v3.Background ~= nil then
			if not v5 then
				v5 = Sonar("UINavigator")
			end
			if v3.Background ~= false or v5.TargetFrame == p1 then
				t.SetBackground(v3.Background, true)
			end
		end
	end
	local IsOpen = v2.IsOpen
	v2.IsOpen = true
	if v2.ResetSelectionOnOpen then
		if not v5 then
			v5 = Sonar("UINavigator")
		end
		v5.ResetGamepadSelection()
	else
		if not v5 then
			v5 = Sonar("UINavigator")
		end
		local v52 = type(v2.SelectOnOpen) == "function" and v2.SelectOnOpen(p1) or v2.SelectOnOpen
		if v52 or v2.ShortcutToClose and not v2.DoNotSelectOnOpen then
			task.delay(v2.TweenStyle.Time / 2, function() --[[ Line: 479 | Upvalues: t (ref), p1 (copy), v5 (ref), v52 (copy) ]]
				if t.IsFrameOpen(p1) then
					v5.SetGamepadSelectionInFrame(p1, v52)
				end
			end)
		end
	end
	if v2.ShortcutToClose or v2.NavigateTarget then
		v5.SetTargetFrame(p1)
	end
	if not IsOpen and v2.OnOpen then
		task.spawn(runCallbacksForFrame, p1, v2.OnOpen, v3.CallbackArgs)
	end
	if v3.UpdateOverlays ~= nil then
		t.SetOverlayFrames(true)
	end
	if v3.CloseAll == nil then
		return
	end
	v3.CloseAll = if type(v3.CloseAll) == "boolean" then "Main" else v3.CloseAll
	v3.CloseAll = type(v3.CloseAll) == "table" and v3.CloseAll or { v3.CloseAll }
	v3.Exclusion = v3.Exclusion or p1
	for k, v in pairs(v3.CloseAll) do
		t.CloseAllFrames(v, v3)
	end
end
function t.CloseFrame(p1, p2) --[[ CloseFrame | Line: 523 | Upvalues: t (copy), v5 (ref), Sonar (copy), runCallbacksForFrame (copy), waitForCleanup (copy) ]]
	local v1 = if p2 then p2 else {}
	local v2 = t.getFrameFromInstance(p1)
	local v3
	if v1.TweenAnimation == nil then
		local v4
		if type(v2.TweenAnimation) == "boolean" then
			v4 = v2.TweenAnimation
			if v4 then
				v3 = v1
			elseif v2.TweenAnimation == "Close" then
				v3 = v1
				v4 = true
			else
				v3 = v1
				v4 = false
			end
		elseif v2.TweenAnimation == "Close" then
			v3 = v1
			v4 = true
		else
			v3 = v1
			v4 = false
		end
		v3.TweenAnimation = v4
	else
		v1.TweenAnimation = v1.TweenAnimation
		v3 = v1
	end
	t.SetFrame(p1, v3.State or false, v3.TweenAnimation, v3.Position, v2.KeepPosition, v3.KeepVisible)
	if v3.Blur ~= nil then
		t.SetBlur(v3.Blur, false)
	end
	if v3.DepthOfField ~= nil then
		t.SetDepthOfField(v3.DepthOfField, true)
	end
	if not v2.Overlay and (not v2.HUD and v3.Exclusion == nil) then
		if not v5 then
			v5 = Sonar("UINavigator")
		end
		if not v5.TargetFrame or v5.TargetFrame == p1 then
			t.SetBackground(v3.Background, true)
		end
	end
	local v52 = if v2.IsOpen == true then true else false
	v2.IsOpen = false
	if v52 and v2.OnClose then
		task.spawn(runCallbacksForFrame, p1, v2.OnClose, v3.CallbackArgs)
	end
	if not (v52 and v2.OnCleanup) then
		return
	end
	task.spawn(waitForCleanup, p1, v2)
end
function t.SetFrame(p1, p2, p3, p4, p5, p6) --[[ SetFrame | Line: 580 | Upvalues: t (copy), t5 (copy), v1 (copy), TweenService (copy) ]]
	local v12 = t.getFrameFromInstance(p1)
	if p2 then
		p1.Visible = if v12.InputType then v12.InputType == t5[v1.GetInputType()] else true
	end
	local v3 = p5 and p1.Position or (p4 or (p2 and (v1.IsMobileInputType() and v12.MobileOpenPosition or v12.OpenPosition) or v12.ClosePosition))
	if p3 then
		local v4
		if v12.RunTween then
			v4 = v12.RunTween(p2)
		else
			local v6 = TweenService:Create(p1, v12.TweenStyle, {
				Position = v3
			})
			v6:Play()
			v4 = v6
		end
		if not p2 and v4 then
			v4.Completed:Connect(function(p12) --[[ Line: 611 | Upvalues: p6 (copy), p1 (copy) ]]
				if p12 ~= Enum.PlaybackState.Completed then
					return
				end
				if not p6 then
					p1.Visible = false
				end
			end)
		end
	else
		p1.Position = v3
		if p2 then
			return
		end
		p1.Visible = false
	end
end
function t.SetBlur(p1, p2, p3) --[[ SetBlur | Line: 628 | Upvalues: t (copy), t3 (copy), TweenService (copy), InterfaceBlur (copy), v7 (copy) ]]
	t.BlurActive = p1
	local v1 = p1 and t3.Open or t3.Close
	if p2 then
		TweenService:Create(InterfaceBlur, v7, p3 or v1):Play()
	else
		TweenService:Create(InterfaceBlur, TweenInfo.new(0.01), p3 or v1):Play()
	end
end
function t.SetDepthOfField(p1, p2, p3) --[[ SetDepthOfField | Line: 642 | Upvalues: t (copy), v4 (copy) ]]
	t.DepthOfFieldActive = p1
	v4.setModifier("GuiOpen", p1)
end
function t.SetBackground(p1, p2, p3) --[[ SetBackground | Line: 648 | Upvalues: t4 (copy), TweenService (copy), BackgroundLabel (copy), v7 (copy) ]]
	local v1 = p1 and t4.Open or t4.Close
	if p2 then
		TweenService:Create(BackgroundLabel, v7, p3 or v1):Play()
	else
		TweenService:Create(BackgroundLabel, TweenInfo.new(0.01), p3 or v1):Play()
	end
end
function t.CloseAllFrames(p1, p2) --[[ CloseAllFrames | Line: 660 | Upvalues: t7 (copy), t6 (copy), t (copy) ]]
	local v3 = if p2 then p2 else {}
	for k, v in pairs(p1 and t7[p1] or t6) do
		if k ~= v3.Exclusion then
			t.CloseFrame(k, {
				Exclusion = v3.Exclusion
			})
		end
	end
	if v3.Blur ~= nil then
		t.SetBlur(v3.Blur, true)
	end
	if v3.DepthOfField ~= nil then
		t.SetDepthOfField(v3.DepthOfField, true)
	end
	if not v3.Exclusion then
		t.SetBackground(false, true)
	end
	if p1 ~= "Main" then
		return
	end
	if (not v3.Exclusion or t7.Main[v3.Exclusion]) and v3.Exclusion then
		return
	end
	t.MainFrameOpen = nil
end
function t.OpenSubFrames(p1) --[[ OpenSubFrames | Line: 693 | Upvalues: t6 (copy), t7 (copy), t (copy) ]]
	for k, v in pairs(t6) do
		if t7.Sub[k] then
			if v.CheckVisibility(p1) then
				t.OpenFrame(k)
				continue
			end
			t.CloseFrame(k)
		end
	end
end
function t.SetOverlayFrames(p1) --[[ SetOverlayFrames | Line: 707 | Upvalues: t6 (copy), t7 (copy), t (copy) ]]
	for k, v in pairs(t6) do
		if t7.Overlay[k] then
			local v1 = p1 and v.OverlayOpenPosition or v.OverlayClosedPosition
			if v.CheckVisibility and not v.CheckVisibility() then
				t.CloseFrame(k, {
					Position = v1,
					KeepPosition = v.KeepPosition
				})
				continue
			end
			t.OpenFrame(k, {
				State = p1,
				Position = v1,
				KeepPosition = v.KeepPosition
			})
		end
	end
end
function t.OpenMainFrame(p1, p2) --[[ OpenMainFrame | Line: 730 | Upvalues: v1 (copy), t (copy) ]]
	local v12 = if p2 then p2 else {}
	if v12.DisableControls == nil then
		v12.DisableControls = v1.IsMobileInputType()
	end
	local v2 = v12
	t.MainFrameOpen = p1
	t.CloseHUD(v2)
	local t2 = {
		CloseAll = true,
		UpdateOverlays = true
	}
	t2.Blur = if v2.Blur == nil then true else v2.Blur
	t2.CallbackArgs = v2.CallbackArgs
	t.OpenFrame(p1, t2)
	t.MainFrameOpen = p1
end
function t.CloseMainFrame(p1, p2) --[[ CloseMainFrame | Line: 752 | Upvalues: t (copy) ]]
	t.MainFrameOpen = nil
	t.CloseFrame(p1)
	t.OpenHUD({
		SubFramesFromHUD = false,
		ExcludeInteractMenu = (if p2 then p2 else {}).ExcludeInteractMenu
	})
end
function t.OpenHUD(p1) --[[ OpenHUD | Line: 767 | Upvalues: v8 (copy), Sonar (copy), v1 (copy), UserInputService (copy), t (copy), t7 (copy), v5 (ref), t9 (copy) ]]
	local v12 = if p1 then p1 else {}
	local v2 = v8:GetCurrentAnimal()
	local v3, v4
	if v2 and v2.Flying then
		v3 = "Thumbstick"
		v4 = v12
	else
		v3 = Sonar("SettingsService").GetSetting(v8, "MobileMovementControls")
		v4 = v12
	end
	if v1.IsMobileInputType() and (v2 and v3 ~= "Thumbstick") then
		v8:DisablePlayerControls()
	else
		v8:EnablePlayerControls()
	end
	UserInputService.ModalEnabled = false
	if not v4.DoNotCloseMainFrame then
		t.CloseAllFrames("Main", v4)
	end
	local isHUDMenu = v4.HUDMenu == false
	t.SetBlur(v4.Blur ~= nil and v4.Blur or false, true)
	t.SetDepthOfField(v4.DepthOfField ~= nil and v4.DepthOfField or false, true)
	if not v4.DoNotCloseMainFrame then
		t.SetBackground(v4.Background ~= nil and v4.Background or false, true)
	end
	if not v4.ExcludeInteractMenu then
		t.OpenInteractMenu()
	end
	for k, v in pairs(t7.HUD) do
		local v82 = t.getFrameFromInstance(k)
		if v82.CheckVisibility and not v82.CheckVisibility() then
			t.CloseFrame(k)
			continue
		end
		t.OpenFrame(k)
	end
	if not v5 then
		v5 = Sonar("UINavigator")
	end
	v5.ResetGamepadSelection()
	t.OpenSubFrames(if v4.SubFramesFromHUD == nil then true else not v4.SubFramesFromHUD or true)
	t.SetOverlayFrames(false)
	for v10, v11 in t9 do
		task.defer(v11)
	end
end
function t.CloseHUD(p1) --[[ CloseHUD | Line: 831 | Upvalues: v8 (copy), UserInputService (copy), t (copy), v2 (ref), Sonar (copy), ProximityPromptService (copy) ]]
	local v1 = if p1 then p1 else {}
	if v1.DisableControls then
		v8:DisablePlayerControls()
		UserInputService.ModalEnabled = true
	end
	t.CloseAllFrames("HUD", v1)
	t.CloseAllFrames("Sub", v1)
	local isHUDMenu = v1.HUDMenu == false
	if not v2 then
		v2 = Sonar("InteractMenu")
	end
	v2:Disable()
	ProximityPromptService.Enabled = false
	if v1.Blur ~= nil then
		t.SetBlur(v1.Blur, true)
	end
	local v22 = v1
	if v22.DepthOfField ~= nil then
		t.SetDepthOfField(v22.DepthOfField, true)
	end
	if v22.Background == nil then
		return
	end
	t.SetBackground(v22.Background, true)
end
function t.UpdateFrame(p1, ...) --[[ UpdateFrame | Line: 867 | Upvalues: t (copy) ]]
	local v1 = t.getFrameFromInstance(p1)
	if not v1 then
		return
	end
	if v1.CheckVisibility and not v1.CheckVisibility() then
		t.CloseFrame(p1, ...)
	else
		t.OpenFrame(p1, ...)
	end
end
function t.IsFrameOpen(p1) --[[ IsFrameOpen | Line: 882 | Upvalues: t (copy) ]]
	local v1 = t.getFrameFromInstance(p1)
	if v1 then
		return v1.IsOpen
	end
end
function t.IsHUDOpen() --[[ IsHUDOpen | Line: 889 | Upvalues: t (copy) ]]
	if t.MainFrameOpen then
		return not t.IsFrameOpen(t.MainFrameOpen)
	else
		return true
	end
end
function t.CleanContents(p1) --[[ CleanContents | Line: 898 | Upvalues: t (copy) ]]
	local v1 = t.getFrameFromInstance(p1)
	if v1 then
		v1.ContentsLoaded = false
	end
end
function t.getFrameFromInstance(p1) --[[ getFrameFromInstance | Line: 905 | Upvalues: t6 (copy) ]]
	return t6[p1]
end
function t.GetAll() --[[ GetAll | Line: 909 | Upvalues: t6 (copy) ]]
	return t6
end
function t.OpenInteractMenu() --[[ OpenInteractMenu | Line: 914 | Upvalues: v3 (copy), v2 (ref), Sonar (copy), ProximityPromptService (copy) ]]
	if not v3.CanShowInteractMenu() then
		return
	end
	if v2 then
		v2:Enable()
		ProximityPromptService.Enabled = true
		return
	end
	v2 = Sonar("InteractMenu")
	v2:Enable()
	ProximityPromptService.Enabled = true
end
function t.YieldForMainFrameClose() --[[ YieldForMainFrameClose | Line: 924 | Upvalues: RunService (copy), t (copy) ]]
	repeat
		RunService.Heartbeat:Wait()
	until not t.MainFrameOpen
end
v6.ResetHUDSignal:Connect(t.OpenHUD)
v1.InputTypeChanged:Connect(function() --[[ Line: 932 | Upvalues: setMobileFramePositions (copy), setInputTypeFrameVisibility (copy) ]]
	setMobileFramePositions()
	setInputTypeFrameVisibility()
end)
return t