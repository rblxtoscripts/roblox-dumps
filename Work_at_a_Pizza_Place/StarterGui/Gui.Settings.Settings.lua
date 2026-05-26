-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Tween")
local v1 = Library:Load("Maid")
local v2 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("Gui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local Library_2 = require(game.ReplicatedStorage:WaitForChild("Library"))
local v4 = Library_2:Load("Utility")
Library_2:Load("Events")
Library_2:Load("SoundFX")
Library_2:Load("CameraUtil")
Library_2:Load("Signal")
local v5 = Library_2:Load("Network")
Library_2:Load("Table")
local ScrollingFrame = v2:WaitForChild("List"):WaitForChild("ScrollingFrame")
local More = v2:WaitForChild("More")
local VIPCrown = ScrollingFrame:WaitForChild("Style"):WaitForChild("VIPCrown")
local ManagerTeleportPopup = ScrollingFrame:WaitForChild("Popups"):WaitForChild("ManagerTeleportPopup")
ScrollingFrame:WaitForChild("Sound"):WaitForChild("MusicVersion"):WaitForChild("DropDownButton")
VIPCrown.Visible = false
ManagerTeleportPopup.Visible = false
local v6 = nil
local v7 = false
local v8 = v4:SendData("GetSettings", "PlayerChannel", 10) or v4:SendData("GetSettings", "PlayerChannel", 10) or v4:DeepCopy(v3.DefaultSettingValues)
for k, v in pairs(v3.DefaultSettingValues) do
	if v8[k] == nil then
		v8[k] = v
	end
	LocalPlayer:SetAttribute(k, v8[k])
end
LocalPlayer:SetAttribute("AttributesCreated", true)
local v9 = GuiManager:RegisterWindow(v2, "Left", "Right", 0.3, nil, true)
v9.FirstSelectedObject = ScrollingFrame:WaitForChild("Sound"):WaitForChild("Music"):WaitForChild("Slider")
local t = {}
({}).BackgroundColor3 = {
	{
		Dark = Color3.fromRGB(25, 25, 25),
		Light = Color3.fromRGB(140, 167, 176)
	},
	{
		Dark = Color3.fromRGB(50, 50, 50),
		Light = Color3.fromRGB(254, 239, 212)
	},
	{
		Dark = Color3.fromRGB(51, 51, 51),
		Light = Color3.fromRGB(232, 219, 195)
	},
	TextStrokeTransparency = {
		{
			Dark = 1,
			Light = 0
		}
	}
}
function DarkModeEnabled(p1) --[[ DarkModeEnabled | Line: 71 | Upvalues: PlayerGui (copy) ]]
	for i, v in ipairs(PlayerGui:GetDescendants()) do

	end
end
function RefreshDependencies() --[[ RefreshDependencies | Line: 78 ]] end
function Update(p1, p2, p3) --[[ Update | Line: 89 | Upvalues: LocalPlayer (copy), v4 (copy), v6 (ref) ]]
	LocalPlayer:SetAttribute(p1, p2)
	if p3 then
		v4:SendData("SettingChanged", "PlayerChannel", nil, p1, p2)
	end
	if v6[p1] then
		v6[p1](p2, p3)
	end
	RefreshDependencies()
end
local Padding = ScrollingFrame.UIListLayout.Padding
local v10 = nil
function ExpandedSettingsEnabled(p1) --[[ ExpandedSettingsEnabled | Line: 107 | Upvalues: v7 (ref), ScrollingFrame (copy), v2 (copy), v3 (copy), More (copy), Padding (copy), ManagerTeleportPopup (copy), v10 (ref), VIPCrown (copy) ]]
	if _G.GamepadEnabled then
		p1 = true
	end
	v7 = p1
	if p1 then
		ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
		v2.UISizeConstraint.MaxSize = Vector2.new(10000, 600)
	else
		v2.UISizeConstraint.MaxSize = Vector2.new(10000, 300)
	end
	for i, v in ipairs(ScrollingFrame:GetChildren()) do
		if v:FindFirstChild("Category") then
			v.Category.Visible = p1
		end
	end
	for i, v in ipairs(ScrollingFrame:GetDescendants()) do
		if v:GetAttribute("IsPrimarySetting") == false and (v.Name ~= "OldCustomerDialog" or v3.IsEnglish()) then
			v.Visible = p1
		end
	end
	More.Visible = not p1
	if p1 then
		ScrollingFrame.UIListLayout.Padding = Padding
	else
		ScrollingFrame.UIListLayout.Padding = UDim.new(0, 0)
	end
	if not p1 then
		RefreshDependencies()
		return
	end
	ManagerTeleportPopup.Visible = v10.ManagerTeleport ~= nil
	VIPCrown.Visible = v10.VIP ~= nil
	RefreshDependencies()
end
delay(2, function() --[[ Line: 156 ]]
	ExpandedSettingsEnabled(false)
end)
v2.CancelButton.MouseButton1Click:Connect(function() --[[ Line: 161 ]]
	print(tick())
end)
UIEvents.SliderMoved.Event:connect(function(p1, p2, p3) --[[ Line: 166 | Upvalues: t (copy) ]]
	if not t[p2.Parent.Name] then
		return
	end
	Update(p2.Parent.Name, ("%0.3f"):format(p3), false)
end)
UIEvents.SliderStopped.Event:connect(function(p1, p2, p3) --[[ Line: 173 | Upvalues: t (copy) ]]
	if not t[p2.Parent.Name] then
		return
	end
	Update(p2.Parent.Name, ("%0.3f"):format(p3), true)
end)
UIEvents.ToggleButtonPressed.Event:connect(function(p1, p2, p3) --[[ Line: 180 | Upvalues: t (copy) ]]
	if not t[p2.Parent.Name] then
		return
	end
	print(p2.Parent.Name, "TOGGLE", p3)
	Update(p2.Parent.Name, p3, true)
end)
UIEvents.DropDownMenuOptionSelected.Event:connect(function(p1, p2, p3) --[[ Line: 187 | Upvalues: t (copy) ]]
	if not t[p2.Parent.Name] then
		return
	end
	Update(p2.Parent.Name, p3, true)
end)
function SetWidgetValue(p1, p2) --[[ SetWidgetValue | Line: 194 | Upvalues: t (copy), UIEvents (copy), v2 (copy) ]]
	local v1 = t[p1]
	if v1.Type == "Slider" then
		v1:SetPositionAlpha(p2)
		UIEvents.SliderStopped:Fire(v2, v1.Object, p2)
		return
	end
	if v1.Type == "ToggleButton" then
		v1:SetValue(p2, true)
		return
	end
	if v1.Type ~= "DropDownMenu" or p1 ~= "MusicVersion" then
		return
	end
	v1:SetList({ "Newest Music", "Old Music", "Oldest Music" }, p2)
end
v1.new()
local _ = {
	SoundEffects = function(p1, p2) --[[ SoundEffects | Line: 221 ]]
		game.SoundService.SoundEffects.Volume = p1 * 2
	end,
	CarRadio = function(p1, p2) --[[ CarRadio | Line: 225 ]]
		game.SoundService.CarRadios.Volume = p1 * 2
	end,
	VIPCrown = function(p1, p2) --[[ VIPCrown | Line: 229 ]]
		for i, v in ipairs(game.Players:GetPlayers()) do
			if v:FindFirstChild("VIP") and (v.Character and (v.Character.Head and v.Character.Head:FindFirstChild("ChatBubble"))) then
				v.Character.Head.ChatBubble.Header.Visible = p1
			end
		end
	end,
	Textures = function(p1, p2) --[[ Textures | Line: 238 ]]
		if p1 then
			return
		end
		local function Smooth(p1) --[[ Smooth | Line: 240 ]]
			for i, v in ipairs(p1) do
				if v:IsA("BasePart") then
					v.Material = Enum.Material.SmoothPlastic
					if v.Name == "BasePlate" and v:FindFirstChild("Texture") then
						v.Texture:Destroy()
						continue
					end
					if v.Name == "Floor" and (v.Parent == workspace and v:FindFirstChild("Texture")) then
						v.Texture:Destroy()
					end
				end
			end
		end
		for i, v in ipairs({ workspace:GetDescendants(), game.ReplicatedStorage:GetDescendants() }) do
			Smooth(v)
		end
		game.ReplicatedStorage.StreamingFurnitureStorage.ChildAdded:connect(function(p1) --[[ Line: 257 | Upvalues: Smooth (copy) ]]
			Smooth(p1:GetDescendants())
		end)
	end,
	OldCustomerDialog = function(p1, p2) --[[ OldCustomerDialog | Line: 269 | Upvalues: Dialog (copy) ]]
		if not (p1 and p2) then
			return
		end
		Dialog:ShowMessage("Text-only Customers", "Customers will now tell you their order with text instead of pictures")
	end
}
ScrollingFrame:WaitForChild("Style"):WaitForChild("EditAvatar"):WaitForChild("Edit").MouseButton1Click:connect(function() --[[ Line: 311 | Upvalues: v3 (copy), Dialog (copy), LocalPlayer (copy), v9 (copy), GuiManager (copy) ]]
	if v3.PlaceSettings.DisableAdvantageousFeatures then
		Dialog:ShowMessage("This feature is disabled", "The avatar editor is disabled in this place")
		return
	end
	if not LocalPlayer or (not LocalPlayer.Character or (not LocalPlayer.Character:FindFirstChild("Humanoid") or LocalPlayer.Character.Humanoid.Sit)) then
		return
	end
	v9:SetVisible(false)
	GuiManager:GetWindowDataByName("AvatarEditor"):SetVisible(true)
end)
ScrollingFrame:WaitForChild("Style"):WaitForChild("Morph"):WaitForChild("Morph").MouseButton1Click:connect(function() --[[ Line: 325 | Upvalues: LocalPlayer (copy), v9 (copy), GuiManager (copy) ]]
	if not LocalPlayer or (not LocalPlayer.Character or (not LocalPlayer.Character:FindFirstChild("Humanoid") or LocalPlayer.Character.Humanoid.Sit)) then
		return
	end
	v9:SetVisible(false)
	GuiManager:GetWindowDataByName("Morph"):SetVisible(true)
end)
More.MouseButton1Click:Connect(function() --[[ Line: 335 ]]
	ExpandedSettingsEnabled(true)
end)
v5:BindEvents({
	SettingChanged = function(p1, p2) --[[ SettingChanged | Line: 344 ]]
		Update(p1, p2, false)
	end,
	AllPurchasedGamepasses = function(p1) --[[ AllPurchasedGamepasses | Line: 347 | Upvalues: v10 (ref) ]]
		v10 = p1
	end
})
workspace.Main.ChangeSetting.Event:Connect(function(p1, p2) --[[ Line: 353 ]]
	SetWidgetValue(p1, p2)
	Update(p1, p2, true)
end)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 364 | Upvalues: v2 (copy) ]]
	if p1 ~= v2 or p2 then
		return
	end
	ExpandedSettingsEnabled(false)
end)
for i, v in ipairs(ScrollingFrame:GetDescendants()) do
	local v11 = v.Parent.Name
	if v.Name == "Slider" then
		t[v11] = GuiManager:RegisterSlider(v2, v, LocalPlayer:GetAttribute(v11))
		Update(v11, LocalPlayer:GetAttribute(v11))
		continue
	end
	if v.Name == "ToggleButton" then
		t[v11] = GuiManager:RegisterToggleButton(v2, v, LocalPlayer:GetAttribute(v11))
		Update(v11, LocalPlayer:GetAttribute(v11))
		continue
	end
	if v.Name == "DropDownButton" then
		t[v11] = GuiManager:RegisterDropdownMenu(v2, v)
		Update(v11, LocalPlayer:GetAttribute(v11))
		SetWidgetValue(v11, LocalPlayer:GetAttribute(v11))
	end
end
if v3.IsEnglish() then
	return
end
ScrollingFrame:WaitForChild("Gameplay"):WaitForChild("OldCustomerDialog").Visible = false