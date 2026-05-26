-- https://lua.expert/
local v1 = script.Parent
v1:WaitForChild("Emotions")
v1:WaitForChild("Inventory")
v1:WaitForChild("PetPanel")
v1:WaitForChild("Settings")
v1:WaitForChild("Upgrade")
v1:WaitForChild("Catalog")
local Leave = v1:WaitForChild("Leave")
local Teleport = v1:WaitForChild("Teleport")
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
for v4, v5 in v3.PlaceSettings.DisabledMenuElements do
	local v6 = v1[v5]
	v6.Visible = false
	v6:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 19 | Upvalues: v6 (copy) ]]
		task.wait()
		v6.Visible = false
	end)
end
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v7 = Library:Load("Utility")
local v8 = Library:Load("Network")
Library:Load("Events")
Library:Load("SoundFX")
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v9 = _G.GamepadEnabled and v1.Parent:WaitForChild("GamepadMoneyz") or v1.Parent:WaitForChild("CoinCounter"):WaitForChild("Moneyz")
local v10 = GuiManager:RegisterWindow(v1)
v10.IsCoreGuiWindow = true
local v11 = GuiManager:GetWindowDataByName("GamepadMoneyz")
MainGui:WaitForChild("TopbarHoverText")
if _G.GamepadEnabled then
	v1.Parent:WaitForChild("CoinCounter"):WaitForChild("Moneyz").Visible = false
end
local v12, _ = game:GetService("GuiService"):GetGuiInset()
local Y = v12.Y
local function RefreshWindowSizeAndPosition() --[[ RefreshWindowSizeAndPosition | Line: 55 ]] end
v10:SetVisible(true)
if _G.GamepadEnabled then
	v11:SetVisible(true)
end
if not v3.IsNormalServer then
	Leave.Visible = true
	Teleport.Visible = true
end
if game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled then
	local _2 = not game:GetService("UserInputService").KeyboardEnabled
end
v1.Position = UDim2.new(v1.Position.X.Scale, v1.Position.X.Offset, 0, -Y)
if not _G.GamepadEnabled then
	v9.Parent.Position = UDim2.new(v9.Parent.Position.X.Scale, v9.Parent.Position.X.Offset, 0, -Y)
end
if MainGui.AbsoluteSize.Y <= 500 then
	v1.Size = UDim2.new(v1.Size.X.Scale, v1.Size.X.Offset, 0, Y)
end
local v13 = nil
local v14 = nil
function ButtonPressed(p1) --[[ ButtonPressed | Line: 118 | Upvalues: v1 (copy), v9 (copy), GuiManager (copy), Dialog (copy), v3 (copy), v7 (copy), v13 (ref), v14 (ref) ]]
	if p1.Parent ~= v1 and p1 ~= v9 then
		return
	end
	local v12 = p1.Name
	if p1.Name == "Moneyz" then
		delay(0.1, function() --[[ Line: 132 | Upvalues: GuiManager (ref) ]]
			local Object = GuiManager:GetWindowDataByName("Catalog").Object
			GuiManager.Data[Object.CatalogTabs]:SetFirstTabPressed(Object.CatalogTabs.TabButtons.Moneyz)
		end)
		v12 = "Catalog"
	elseif p1.Name == "Leave" then
		if Dialog:GetChoice("Go back to the previous place?", "Are you sure you want to leave?", "Yes", "No") then
			v7:SendData("TeleportToPlace", "PlayerChannel", nil, v3.PlaceSettings and v3.PlaceSettings.LeaveRedirectPlaceId or v3.MainPlaceId)
		end
		p1.Selected = false
		return
	elseif p1.Name == "Teleport" then
		if not Dialog:GetChoice("Teleport", "Are you sure you want to teleport to your house?", "Yes", "No") then
			p1.Selected = false
			return
		end
		v7:SendData("TeleportHome", "PlayerChannel", nil, nil)
		p1.Selected = false
		return
	end
	local v32 = GuiManager:GetWindowDataByName(v12)
	currentWindow = v32.Object
	p1.Selected = true
	if v13 and v13 ~= v32 then
		v13:SetVisible(false)
	end
	v32:SetVisible(not v32.RealVisibility)
	v13 = v32
	if v14 and p1 ~= v14 then
		v14.Selected = false
	end
	v14 = p1
end
for i, v in ipairs(v1:GetChildren()) do
	if v:IsA("TextButton") then
		GuiManager:RegisterTopbarButton(v, ButtonPressed)
	end
end
if not _G.GamepadEnabled then
	GuiManager:RegisterTopbarButton(v9, ButtonPressed)
end
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 209 | Upvalues: v13 (ref), v14 (ref), v1 (copy) ]]
	if v13 and (p1 == v13.Object and not p2) then
		currentWindow = nil
		v14.Selected = false
	end
end)
local MoneyzCount = v9.MoneyzCount
function MoneyzChanged() --[[ MoneyzChanged | Line: 232 | Upvalues: LocalPlayer (copy), v3 (copy), MoneyzCount (copy) ]]
	local match = string.match
	if match(tostring(LocalPlayer.Moneyz.Value), ",") then
		return
	end
	MoneyzCount.Text = v3.FormatNumber("Number", LocalPlayer.Moneyz.Value, MoneyzCount)
end
LocalPlayer:WaitForChild("Moneyz").Changed:connect(function() --[[ Line: 303 ]]
	MoneyzChanged()
end)
workspace.Main.PlayerHasVIP.OnClientEvent:connect(function(p1) --[[ Line: 307 | Upvalues: LocalPlayer (copy), v3 (copy), Teleport (copy), v1 (copy) ]]
	if p1 ~= LocalPlayer or v3.IsPartyServer then
		return
	end
	if not table.find(v3.PlaceSettings.DisabledMenuElements, "Teleport") then
		Teleport.Visible = true
	end
	v1.UIListLayout:ApplyLayout()
	MoneyzChanged()
end)
MainGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ Line: 321 ]] end)
MoneyzChanged()
if not v3.GamepadEnabled then
	v8:BindEvents({
		AnimateArrows = function(p1_2) --[[ AnimateArrows | Line: 338 | Upvalues: v1 (copy), UIEvents (copy) ]]
			local ArrowAnimation = v1[p1_2].ArrowAnimation
			ArrowAnimation.Visible = true
			local Position = ArrowAnimation.Position
			spawn(function() --[[ Line: 345 | Upvalues: ArrowAnimation (copy), Position (copy) ]]
				while ArrowAnimation and ArrowAnimation.Visible do
					ArrowAnimation:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset - 10), "Out", "Sine", 0.5, true)
					wait(0.5)
					if not (ArrowAnimation and ArrowAnimation.Parent) then
						continue
					end
					ArrowAnimation:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset), "Out", "Sine", 0.5, true)
					wait(0.5)
				end
			end)
			local v12 = nil
			v12 = UIEvents.TopbarButtonPressed.Event:connect(function(p12_2) --[[ Line: 357 | Upvalues: v1 (ref), p1_2 (copy), v12 (ref), ArrowAnimation (copy) ]]
				if p12_2 ~= v1[p1_2] then
					return
				end
				v12:disconnect()
				ArrowAnimation.Visible = false
			end)
		end
	})
	return
end
v10:SetVisible(false)
v10.Disabled = true
v8:BindEvents({
	AnimateArrows = function(p1_2) --[[ AnimateArrows | Line: 338 | Upvalues: v1 (copy), UIEvents (copy) ]]
		local ArrowAnimation = v1[p1_2].ArrowAnimation
		ArrowAnimation.Visible = true
		local Position = ArrowAnimation.Position
		spawn(function() --[[ Line: 345 | Upvalues: ArrowAnimation (copy), Position (copy) ]]
			while ArrowAnimation and ArrowAnimation.Visible do
				ArrowAnimation:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset - 10), "Out", "Sine", 0.5, true)
				wait(0.5)
				if not (ArrowAnimation and ArrowAnimation.Parent) then
					continue
				end
				ArrowAnimation:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset), "Out", "Sine", 0.5, true)
				wait(0.5)
			end
		end)
		local v12 = nil
		v12 = UIEvents.TopbarButtonPressed.Event:connect(function(p12_2) --[[ Line: 357 | Upvalues: v1 (ref), p1_2 (copy), v12 (ref), ArrowAnimation (copy) ]]
			if p12_2 ~= v1[p1_2] then
				return
			end
			v12:disconnect()
			ArrowAnimation.Visible = false
		end)
	end
})