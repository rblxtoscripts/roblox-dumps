-- https://lua.expert/
local t = {}
local LocalPlayer = game.Players.LocalPlayer
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
Library:Load("SoundFX")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Slider = require(script:WaitForChild("Slider"))
local RadialMenu = require(script:WaitForChild("RadialMenu"))
local TabGroup = require(script:WaitForChild("TabGroup"))
local ListView = require(script:WaitForChild("ListView"))
local ToggleButton = require(script:WaitForChild("ToggleButton"))
local TextInput = require(script:WaitForChild("TextInput"))
local DropdownMenu = require(script:WaitForChild("DropdownMenu"))
local Window = require(script:WaitForChild("Window"))
local UIEvents = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIEvents")
local v2 = game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled and not game:GetService("UserInputService").KeyboardEnabled
t.Data = {}
t.DataNames = {}
t.WindowFocusStack = {}
function t.RegisterWindow(p1, p2, ...) --[[ RegisterWindow | Line: 31 | Upvalues: Window (copy) ]]
	local v1 = p1.Data[p2] or Window.new(p1, p2, ...)
	p1.Data[p2] = v1
	p1.DataNames[p2.Name] = v1
	return v1
end
function t.OnGlobalClientEvent(p1) --[[ OnGlobalClientEvent | Line: 38 ]]
	workspace.GameService.GlobalConnector.OnClientEvent:connect(function(p12, ...) --[[ Line: 39 | Upvalues: p1 (copy) ]]
		p1(p12, ...)
	end)
end
function t.FireServer(p1, p2, p3, ...) --[[ FireServer | Line: 44 ]]
	workspace.GameService.GlobalConnector:FireServer(p2, p3, ...)
end
function t.TouchControlsEnabled(p1, p2) --[[ TouchControlsEnabled | Line: 49 | Upvalues: v2 (copy), PlayerGui (copy) ]]
	if not v2 then
		return
	end
	local TouchGui = PlayerGui:WaitForChild("TouchGui", 2)
	if not TouchGui then
		return
	end
	local TouchControlFrame = TouchGui:WaitForChild("TouchControlFrame", 2)
	if not TouchControlFrame then
		return
	end
	TouchControlFrame.Visible = p2
end
function t.RegisterTabs(p1, p2, p3, p4) --[[ RegisterTabs | Line: 61 | Upvalues: TabGroup (copy) ]]
	local v1 = p1.Data[p3] or TabGroup.new(p3, p1.Data[p2], p4)
	p1.Data[p3] = v1
	return v1
end
function t.RegisterTextInput(p1, p2, p3) --[[ RegisterTextInput | Line: 67 | Upvalues: TextInput (copy) ]]
	local v1 = p1.Data[p3] or TextInput.new(p3, p1.Data[p2])
	p1.Data[p3] = v1
	return v1
end
function t.RegisterListView(p1, p2, p3, p4, p5) --[[ RegisterListView | Line: 74 | Upvalues: ListView (copy) ]]
	local v1 = p1.Data[p3] or ListView.new(p3, p1.Data[p2], p4, p5)
	p1.Data[p3] = v1
	return v1
end
function t.RegisterRadialMenu(p1, p2) --[[ RegisterRadialMenu | Line: 80 | Upvalues: RadialMenu (copy) ]]
	local v1 = RadialMenu.new(p2, p1)
	p1.Data[p2] = v1
	return v1
end
function t.RegisterDropdownMenu(p1, p2, p3) --[[ RegisterDropdownMenu | Line: 86 | Upvalues: DropdownMenu (copy) ]]
	local v1 = p1.Data[p3] or DropdownMenu.new(p3, p1.Data[p2])
	p1.Data[p3] = v1
	return v1
end
function t.RegisterToggleButton(p1, p2, p3, p4) --[[ RegisterToggleButton | Line: 92 | Upvalues: ToggleButton (copy) ]]
	local v1 = p1.Data[p3] or ToggleButton.new(p3, p1.Data[p2], p4)
	p1.Data[p3] = v1
	return v1
end
function t.RegisterSlider(p1, p2, p3, p4) --[[ RegisterSlider | Line: 98 | Upvalues: Slider (copy) ]]
	local v1 = p1.Data[p3] or Slider.new(p3, p1.Data[p2], p4)
	p1.Data[p3] = v1
	return v1
end
function t.GetRegisteredObjectData(p1, p2) --[[ GetRegisteredObjectData | Line: 105 ]]
	return p1.Data[p2]
end
function t.GetWindowDataByName(p1, p2) --[[ GetWindowDataByName | Line: 110 ]]
	while p1.DataNames[p2] == nil do
		wait()
	end
	return p1.DataNames[p2]
end
local t2 = {}
function t.RegisterTopbarButton(p1, p2, p3) --[[ RegisterTopbarButton | Line: 121 | Upvalues: PlayerGui (copy), UIEvents (copy) ]]
	local TopbarHoverText = PlayerGui.MainGui:WaitForChild("TopbarHoverText")
	p2.MouseButton1Click:Connect(function() --[[ Line: 125 | Upvalues: p3 (copy), p2 (copy), UIEvents (ref) ]]
		p3(p2)
		UIEvents.TopbarButtonPressed:Fire(p2)
	end)
	local v1 = nil
	p2.MouseEnter:Connect(function() --[[ Line: 131 | Upvalues: TopbarHoverText (copy), p2 (copy), v1 (ref) ]]
		TopbarHoverText.Visible = true
		TopbarHoverText.TextLabel.Text = if p2.Name == "Emotions" then "Emotes" elseif p2.Name == "ToggleChat" then "View" elseif p2.Name == "PetPanel" then "Pets" elseif p2.Name == "Catalog" then "Shop" elseif p2.Name == "Moneyz" then "Buy Coins" else p2.Name
		TopbarHoverText.Position = UDim2.new(0, p2.AbsolutePosition.X + p2.AbsoluteSize.X / 2, 0, p2.AbsolutePosition.Y + p2.AbsoluteSize.Y + 3)
		v1 = TopbarHoverText.Position
	end)
	p2.MouseLeave:Connect(function() --[[ Line: 138 | Upvalues: v1 (ref), TopbarHoverText (copy) ]]
		if v1 ~= TopbarHoverText.Position then
			return
		end
		TopbarHoverText.Visible = false
	end)
end
local UserInputService = game:GetService("UserInputService")
local function FindButton(p1) --[[ FindButton | Line: 180 | Upvalues: t2 (copy), v1 (copy) ]]
	for i, v in ipairs(t2) do
		if v1:PointInsideGui(v, p1, false) and v.Visible then
			return v
		end
	end
end
function t.CoreGuiGamepadActionsEnabed(p1, p2) --[[ CoreGuiGamepadActionsEnabed | Line: 189 | Upvalues: t (copy) ]]
	for k, v in pairs(t.Data) do
		if v.Type == "Window" and v.IsCoreGuiWindow then
			v:GamepadActionsEnabled(p2)
		end
	end
end
function t.CloseAllWindows(p1) --[[ CloseAllWindows | Line: 197 | Upvalues: t (copy), UIEvents (copy) ]]
	for k, v in pairs(t.Data) do
		if v.Type == "Window" and (k.Visible and (not v.IsCoreGuiWindow and (k.Name ~= "Paycheck" and (k.Name ~= "CustomizePet" and k.Name ~= "Tutorial")))) then
			UIEvents.WindowManuallyClosed:Fire(v.Object)
			v:SetVisible(false)
		end
	end
end
local v3 = nil
local v4
if not game:GetService("UserInputService").MouseEnabled then
	v4 = {
		__index = t.Data,
		__newindex = t.Data
	}
	setmetatable(t, v4)
	return t
end
UserInputService.InputChanged:connect(function(p1, p2) --[[ Line: 227 | Upvalues: FindButton (copy), v3 (ref) ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseMovement then
		return
	end
	local Position = p1.Position
	if not (Position.Y <= 10) then
		return
	end
	local v1 = FindButton(Position)
	if v1 and not v1.Selectable then
		v1.Selectable = true
		if not v3 then
			v3 = v1
			return
		end
		v3.Selectable = false
		v3 = v1
	else
		if v1 or not v3 then
			return
		end
		v3.Selectable = false
		v3 = nil
	end
end)
v4 = {
	__index = t.Data,
	__newindex = t.Data
}
setmetatable(t, v4)
return t