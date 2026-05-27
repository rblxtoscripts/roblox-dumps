-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("LayoutUtil")
local v2 = Sonar("InputTypeDetector")
local v3 = Sonar("FormatNumber")
local v4 = Sonar("Constants")
local WorkspaceGui = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("WorkspaceGui")
local t2 = {}
local v5 = Sonar("Signal").new()
local function layoutAdded(p1) --[[ layoutAdded | Line: 30 | Upvalues: t (copy) ]]
	t.manageScrollFrame(p1)
end
function t.manageCanvasSize(p1, p2, p3) --[[ manageCanvasSize | Line: 34 | Upvalues: t2 (copy) ]]
	if t2[p1] then
		warn("We have already connected to this layout", p1:GetFullName())
		return
	end
	t2[p1] = true
	local v2 = p2 or p1.Parent
	local v3 = v2:IsA("ScrollingFrame")
	local v4 = "Passed frame to manageContentSize must be a ScrollingFrame " .. v2:GetFullName()
	assert(v3, v4)
	local UIPadding = v2:FindFirstChild("UIPadding")
	local v5 = UIPadding and UIPadding.PaddingBottom.Offset or 5
	local v6 = UIPadding and UIPadding.PaddingLeft.Offset + UIPadding.PaddingRight.Offset or 0
	local v7 = not p3 or p3.x
	local v8 = not p3 or p3.y
	local function update() --[[ update | Line: 52 | Upvalues: p1 (copy), v6 (copy), v5 (copy), v2 (ref), v7 (copy), v8 (copy) ]]
		v2.CanvasSize = UDim2.fromOffset(if v7 then p1.AbsoluteContentSize.X + v6 else 0, if v8 then p1.AbsoluteContentSize.Y + v5 else 0)
	end
	p1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(update)
	v2.CanvasSize = UDim2.fromOffset(if v7 then p1.AbsoluteContentSize.X + v6 else 0, if v8 then p1.AbsoluteContentSize.Y + v5 else 0)
end
function t.manageUILayout(p1, p2) --[[ manageUILayout | Line: 63 | Upvalues: v1 (copy) ]]
	p2.ChildAdded:Connect(function() --[[ Line: 64 | Upvalues: v1 (ref), p1 (copy), p2 (copy) ]]
		v1(p1, p2)
	end)
	v1(p1, p2)
end
function t.manageScrollFrame(p1, p2) --[[ manageScrollFrame | Line: 71 | Upvalues: t (copy) ]]
	local v1 = if p2 then p2 else p1.Parent
	t.manageCanvasSize(p1, v1)
	t.manageUILayout(p1, v1)
end
function t.CreateCurrencyLabel(p1) --[[ CreateCurrencyLabel | Line: 79 | Upvalues: v3 (copy), TweenService (copy) ]]
	local GuiObject = p1.GuiObject
	local v1 = p1.Value
	p1.InitTween = if p1.InitTween == nil then true else p1.InitTween
	local t = {}
	local v32 = Instance.new("IntValue")
	v32.Value = -1
	local v4 = GuiObject:FindFirstChild("AmountLabel") or GuiObject
	local function setLabel() --[[ setLabel | Line: 92 | Upvalues: v4 (copy), p1 (copy), v3 (ref), v32 (copy) ]]
		local v2, v33
		if p1.Suffix then
			local v42 = v3.suffix(v32.Value)
			if v42 then
				v2 = v42
			else
				v33 = v3.splice(v32.Value)
				v2 = v33
			end
		else
			v33 = v3.splice(v32.Value)
			v2 = v33
		end
		v4.Text = v2 .. (p1.Append or "")
	end
	t[#t + 1] = v32:GetPropertyChangedSignal("Value"):Connect(setLabel)
	local v5 = v1.Value
	local function setAmount(p12) --[[ setAmount | Line: 98 | Upvalues: p1 (copy), v1 (copy), v5 (ref), TweenService (ref), v32 (copy), GuiObject (copy) ]]
		local v12 = if p12 then p1.InitTween or not p12 else not p12
		if v12 and (p1.TweenDown and v5 < v1.Value) then
			v12 = false
		end
		local v2 = if v1.Value < v5 then true else false
		v5 = v1.Value
		if v12 then
			TweenService:Create(v32, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Value = v1.Value
			}):Play()
		else
			v32.Value = v1.Value
			TweenService:Create(v32, TweenInfo.new(), {
				Value = v1.Value
			}):Play()
		end
		if not p1.OnChanged then
			return
		end
		p1.OnChanged(GuiObject, v2)
	end
	t[#t + 1] = v1:GetPropertyChangedSignal("Value"):Connect(setAmount)
	setAmount(true)
	t[#t + 1] = v32
	return t
end
function t.SetGameElements(p1, p2) --[[ SetGameElements | Line: 127 | Upvalues: v4 (copy) ]]
	for k, v in pairs(p1) do
		v4.GameStates[k] = v
	end
	if not p2 then
		v4.GameStateChangedSignal:Fire()
		return
	end
	v4.ResetHUDSignal:Fire()
	v4.GameStateChangedSignal:Fire()
end
function t.GetGameState(p1) --[[ GetGameState | Line: 139 | Upvalues: v4 (copy) ]]
	if v4.GameStates[p1] == nil then
		return true
	else
		return v4.GameStates[p1]
	end
end
function t.ParentToWorkspaceGui(p1) --[[ ParentToWorkspaceGui | Line: 148 | Upvalues: WorkspaceGui (copy) ]]
	p1.Parent = WorkspaceGui
end
function t.GetChatVisiblityChanged(p1) --[[ GetChatVisiblityChanged | Line: 152 | Upvalues: v2 (copy), v5 (copy) ]]
	if v2.IsGamepadInputType() then
		return
	end
	local _ = game:GetService("TextChatService"):FindFirstChildOfClass("ChatWindowConfiguration")
	return v5:Connect(p1)
end
function t.IsChatOpen() --[[ IsChatOpen | Line: 170 | Upvalues: StarterGui (copy) ]]
	local v1, v2 = pcall(StarterGui.GetCore, StarterGui, "ChatActive")
	return v1 and v2
end
function t.SetChatVisibility(p1) --[[ SetChatVisibility | Line: 183 | Upvalues: v2 (copy), StarterGui (copy) ]]
	if v2.IsGamepadInputType() then
		return
	end
	repeat
		local v1 = pcall(StarterGui.SetCore, StarterGui, "ChatActive", p1)
		if v1 then
			continue
		end
		task.wait()
	until v1
end
function t.CreateInputTextBox(p1, p2, p3) --[[ CreateInputTextBox | Line: 193 ]]
	p1.Active = true
	local t = {}
	table.insert(t, p1:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 196 | Upvalues: p1 (copy), p2 (copy) ]]
		if p1:IsFocused() then
			p2(p1, p1.Text)
		end
	end))
	table.insert(t, p1.FocusLost:Connect(function() --[[ Line: 200 | Upvalues: p2 (copy), p1 (copy), p3 (copy) ]]
		p2(p1, p1.Text, p3 and true)
	end))
	p2(p1, p1.Text)
	return function() --[[ Line: 204 | Upvalues: t (copy) ]]
		for v1, v2 in t do
			v2:Disconnect()
		end
	end
end
function t.CanEditText() --[[ CanEditText | Line: 212 ]]
	return true
end
function t.CanShowInteractMenu() --[[ CanShowInteractMenu | Line: 217 ]]
	return true
end
function t.CanShowHUD(p1) --[[ CanShowHUD | Line: 222 | Upvalues: t (copy) ]]
	if _G.HideHUD then
		return
	end
	if p1 and _G.HideTopHUD then
		return
	end
	if t.GetGameState("Lassoing") then
	else
		return true
	end
end
function t.SetCoreGui(p1, p2) --[[ SetCoreGui | Line: 237 | Upvalues: StarterGui (copy) ]]
	repeat
		local v1 = pcall(StarterGui.SetCoreGuiEnabled, StarterGui, p1, p2)
		if v1 then
			continue
		end
		wait()
	until v1
end
function t.SetButtonColor(p1, p2, p3) --[[ SetButtonColor | Line: 248 ]]
	local v1 = game.ReplicatedStorage.Storage.Assets.ButtonColorPresets[p2 or "Flat"][p3]
	p1.Shadow.BackgroundColor3 = v1.Shadow.BackgroundColor3
	p1.Top.UIGradient.Color = v1.Top.UIGradient.Color
	local TextLabel = p1.Top:FindFirstChildOfClass("TextLabel", true)
	local TextLabel_2 = v1.Top:FindFirstChildOfClass("TextLabel", true)
	if not (TextLabel and TextLabel_2) then
		return
	end
	TextLabel.TextColor3 = TextLabel_2.TextColor3
end
function t.scrollToGuiElement(p1, p2, p3) --[[ scrollToGuiElement | Line: 261 | Upvalues: TweenService (copy) ]]
	local UIListLayout = p1:FindFirstChildOfClass("UIListLayout")
	if not UIListLayout then
		warn("No UIListLayout found in the ScrollingFrame!")
		return
	end
	local list = {}
	for k, v in pairs(p1:GetChildren()) do
		if v:IsA("GuiObject") and v ~= UIListLayout then
			table.insert(list, v)
		end
	end
	table.sort(list, function(p1, p2) --[[ Line: 279 ]]
		return p1.LayoutOrder < p2.LayoutOrder
	end)
	local v1 = 0
	for i, v in ipairs(list) do
		if v == p2 then
			break
		end
		local v2 = v1 + v.AbsoluteSize.Y
		v1 = if UIListLayout.FillDirection == Enum.FillDirection.Horizontal then v2 + UIListLayout.Padding.Scale * p1.AbsoluteSize.X else v2 + UIListLayout.Padding.Scale * p1.AbsoluteSize.Y
	end
	if p3 then
		p1.CanvasPosition = Vector2.new(0, v1)
	else
		TweenService:Create(p1, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			CanvasPosition = Vector2.new(0, v1)
		}):Play()
	end
end
function t.Init(p1) --[[ Init | Line: 317 | Upvalues: CollectionService (copy), layoutAdded (copy), RunService (copy), t (copy), v5 (copy) ]]
	CollectionService:GetInstanceAddedSignal("AutoResizeLayout"):Connect(layoutAdded)
	for k, v in pairs(CollectionService:GetTagged("AutoResizeLayout")) do
		task.spawn(layoutAdded, v)
	end
	if not RunService:IsClient() then
		return
	end
	local RunService_2 = game:GetService("RunService")
	local StarterGui = game:GetService("StarterGui")
	local v1 = nil
	local function setChatOpen() --[[ setChatOpen | Line: 329 | Upvalues: StarterGui (copy), v1 (ref), t (ref), v5 (ref) ]]
		local v12 = StarterGui:GetCore("ChatActive")
		if v12 == v1 then
			return
		end
		v1 = v12
		t.ChatOpen = v12
		v5:Fire(v12)
	end
	RunService_2.Heartbeat:Connect(function() --[[ Line: 341 | Upvalues: setChatOpen (copy) ]]
		pcall(setChatOpen)
	end)
	pcall(setChatOpen)
end
t:Init()
return t