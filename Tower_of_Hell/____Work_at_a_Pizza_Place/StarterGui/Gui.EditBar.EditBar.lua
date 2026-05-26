-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
local v2 = Library:Load("Maid")
Library:Load("SoundFX")
local v3 = Library:Load("Network")
local v4 = Library:Load("Table")
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local Gui = PlayerGui:WaitForChild("Gui")
local GuiTop = PlayerGui:WaitForChild("GuiTop")
local EditSideBar = Gui:WaitForChild("EditSideBar")
local EditBar = Gui:WaitForChild("EditBar")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIEvents")
local v5 = require(game.ReplicatedStorage:WaitForChild("Enums"))
require(game.ReplicatedStorage:WaitForChild("Debug"))
game:GetService("ContextActionService")
game:GetService("UserInputService")
local ColorPicker = require(game.ReplicatedStorage.ColorPicker)
local EditClasses = require(game.ReplicatedStorage.EditBar.EditClasses)
EditBar:WaitForChild("ToolBar")
local EditButton = MainGui:WaitForChild("Menu"):WaitForChild("Backpack"):WaitForChild("EditButton")
local RotationSlider = EditBar:WaitForChild("Options"):WaitForChild("RotationSlider")
local ConfigBillboards = PlayerGui:WaitForChild("ConfigBillboards")
local ConfigTemplate = ConfigBillboards:WaitForChild("ConfigTemplate")
local Edit = EditClasses.Edit
local CurrentCamera = workspace.CurrentCamera
LocalPlayer:GetMouse()
local MemoryUsage = MainGui:WaitForChild("MemoryUsage")
local v6 = GuiManager:RegisterWindow(EditBar, "Bottom", "Bottom", 0.1)
v6.IsCoreGuiWindow = true
Edit.SliderData = GuiManager:RegisterSlider(EditBar, RotationSlider, 0.5)
local v7 = v2.new()
local ContextActionService = game:GetService("ContextActionService")
house = _G.House
Edit.AllButtons = {}
for i, v in ipairs(EditBar:GetDescendants()) do
	if v:IsA("TextButton") then
		Edit.AllButtons[v.Name] = v
		v.Visible = false
	end
end
for i, v in ipairs(EditSideBar:GetDescendants()) do
	if v:IsA("TextButton") then
		Edit.AllButtons[v.Name] = v
		v.Visible = false
	end
end
Edit.CurrentClass = nil
local Placement = require(game.ReplicatedStorage.EditBar.Placement)
local Delete = require(game.ReplicatedStorage.EditBar.Delete)
local Paint = require(game.ReplicatedStorage.EditBar.Paint)
local RotateMode = require(game.ReplicatedStorage.EditBar.RotateMode)
function Edit.Start(p1) --[[ Start | Line: 77 | Upvalues: Edit (copy), v7 (copy), GuiManager (copy), ContextActionService (copy), UIEvents (copy) ]]
	Edit.CurrentClass = Edit
	v7.Delete = Edit.AllButtons.Delete.MouseButton1Click:Connect(function() --[[ Line: 80 | Upvalues: Edit (ref) ]]
		Edit:SetMode("Delete")
	end)
	v7.Cancel = Edit.AllButtons.Cancel.MouseButton1Click:Connect(function() --[[ Line: 81 | Upvalues: Edit (ref) ]]
		Edit:SetMode("Cancel")
	end)
	v7.Paint = Edit.AllButtons.Paint.MouseButton1Click:Connect(function() --[[ Line: 84 | Upvalues: Edit (ref) ]]
		Edit:SetMode("Paint")
	end)
	v7.RotateMode = Edit.AllButtons.RotateMode.MouseButton1Click:Connect(function() --[[ Line: 85 | Upvalues: Edit (ref) ]]
		Edit:SetMode("RotateMode")
	end)
	Edit:ClickDetectorsEnabled(false)
	Edit:ConfigButtonsEnabled(true)
	local v1 = GuiManager:GetWindowDataByName("Inventory")
	local function ShowPatternOptions() --[[ ShowPatternOptions | Line: 92 | Upvalues: Edit (ref), ContextActionService (ref), UIEvents (ref), v7 (ref) ]]
		if Edit.AllButtons.Wall.Visible then
			Edit:SetMode("Edit")
		else
			Edit:ShowButtons("Wall", "Floor", "Ceiling", "Furniture", "Delete", "Paint", "Patterns", "Cancel", "RotateMode")
			local function ShowPicker(p1) --[[ ShowPicker | Line: 96 | Upvalues: Edit (ref), ContextActionService (ref), UIEvents (ref) ]]
				workspace.Main.OpenAssetPicker.OpenAssetPicker:Fire(nil, "Decal", p1)
				Edit:ShowButtons("Cancel")
				ContextActionService:UnbindAction("Ceiling")
				ContextActionService:UnbindAction("Wall")
				ContextActionService:UnbindAction("Floor")
				Edit:ConfigButtonsEnabled(false)
				UIEvents.WindowManuallyClosed.Event:Wait()
				Edit:SetMode("Edit")
			end
			v7.Wall = Edit.AllButtons.Wall.MouseButton1Click:Connect(function() --[[ Line: 107 | Upvalues: ShowPicker (copy) ]]
				ShowPicker("Wallpaper")
			end)
			v7.Floor = Edit.AllButtons.Floor.MouseButton1Click:Connect(function() --[[ Line: 108 | Upvalues: ShowPicker (copy) ]]
				ShowPicker("Floor")
			end)
			v7.Ceiling = Edit.AllButtons.Ceiling.MouseButton1Click:Connect(function() --[[ Line: 109 | Upvalues: ShowPicker (copy) ]]
				ShowPicker("Ceiling")
			end)
			ContextActionService:BindAction("Ceiling", function(p1, p2, p3) --[[ Line: 111 | Upvalues: ShowPicker (copy) ]]
				if p2 ~= Enum.UserInputState.Begin then
					return
				end
				ShowPicker("Ceiling")
			end, false, Enum.KeyCode.DPadUp, Enum.KeyCode.Z)
			ContextActionService:BindAction("Wall", function(p1, p2, p3) --[[ Line: 117 | Upvalues: ShowPicker (copy) ]]
				if p2 ~= Enum.UserInputState.Begin then
					return
				end
				ShowPicker("Wallpaper")
			end, false, Enum.KeyCode.DPadLeft, Enum.KeyCode.C)
			ContextActionService:BindAction("Floor", function(p1, p2, p3) --[[ Line: 123 | Upvalues: ShowPicker (copy) ]]
				if p2 ~= Enum.UserInputState.Begin then
					return
				end
				ShowPicker("Floor")
			end, false, Enum.KeyCode.DPadDown, Enum.KeyCode.X)
			ContextActionService:BindAction("Cancel2", function(p1, p2, p3) --[[ Line: 129 | Upvalues: Edit (ref) ]]
				if p2 ~= Enum.UserInputState.Begin then
					return
				end
				Edit:SetMode("Edit")
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Q)
		end
	end
	v7.Patterns = Edit.AllButtons.Patterns.MouseButton1Click:Connect(function() --[[ Line: 140 | Upvalues: ShowPatternOptions (copy) ]]
		ShowPatternOptions()
	end)
	v7.Furniture = Edit.AllButtons.Furniture.MouseButton1Click:Connect(function() --[[ Line: 145 | Upvalues: v1 (copy) ]]
		v1:SetVisible(not v1:IsVisible())
	end)
	ContextActionService:BindAction("Furniture", function(p1, p2, p3) --[[ Line: 155 | Upvalues: v1 (copy) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		v1:SetVisible(not v1:IsVisible())
	end, false, Enum.KeyCode.ButtonY, Enum.KeyCode.One)
	ContextActionService:BindAction("Delete", function(p1, p2, p3) --[[ Line: 161 | Upvalues: Edit (ref) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		Edit:SetMode("Delete")
	end, false, Enum.KeyCode.DPadDown, Enum.KeyCode.Two)
	ContextActionService:BindAction("Paint", function(p1, p2, p3) --[[ Line: 167 | Upvalues: Edit (ref) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		Edit:SetMode("Paint")
	end, false, Enum.KeyCode.DPadRight, Enum.KeyCode.Three)
	ContextActionService:BindAction("Patterns", function(p1, p2, p3) --[[ Line: 181 | Upvalues: ShowPatternOptions (copy) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		ShowPatternOptions()
	end, false, Enum.KeyCode.DPadUp, Enum.KeyCode.Four)
	ContextActionService:BindAction("RotateMode", function(p1, p2, p3) --[[ Line: 188 | Upvalues: Edit (ref) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		Edit:SetMode("RotateMode")
	end, false, Enum.KeyCode.DPadLeft, Enum.KeyCode.Five)
	ContextActionService:BindAction("Cancel", function(p1, p2, p3) --[[ Line: 194 | Upvalues: Edit (ref) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		Edit:SetMode("Cancel")
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Q)
end
function Edit.End(p1) --[[ End | Line: 204 | Upvalues: v7 (copy), ContextActionService (copy), Edit (copy) ]]
	v7:DoCleaning()
	ContextActionService:UnbindAction("Cancel")
	ContextActionService:UnbindAction("Cancel2")
	ContextActionService:UnbindAction("Ceiling")
	ContextActionService:UnbindAction("Wall")
	ContextActionService:UnbindAction("Floor")
	ContextActionService:UnbindAction("Patterns")
	ContextActionService:UnbindAction("Furniture")
	ContextActionService:UnbindAction("Delete")
	ContextActionService:UnbindAction("Paint")
	ContextActionService:UnbindAction("RotateMode")
	Edit:ConfigButtonsEnabled(false)
	Edit:ClickDetectorsEnabled(true)
end
function Edit.HideAllButtons(p1) --[[ HideAllButtons | Line: 225 | Upvalues: Edit (copy) ]]
	for k, v in pairs(Edit.AllButtons) do
		v.Visible = false
	end
end
function Edit.ShowButtons(p1, ...) --[[ ShowButtons | Line: 231 | Upvalues: Edit (copy), v5 (copy), LocalPlayer (copy) ]]
	Edit:HideAllButtons()
	for i, v in ipairs({ ... }) do
		local v1 = Edit.AllButtons[v]
		local v2 = v5.EditToolUnlockIndex[v1.Name]
		if v1 and (not v2 or v2 <= LocalPlayer:GetAttribute("CurrentHouseUpgradeIndex")) then
			v1.Visible = true
		end
	end
end
function IsNearHouse() --[[ IsNearHouse | Line: 244 | Upvalues: LocalPlayer (copy) ]]
	local House = _G.House
	return if House then House.CurrentUpgrade and (LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("Humanoid") and (LocalPlayer.Character.HumanoidRootPart.Position * Vector3.new(1, 0, 1) - House.CurrentUpgrade.Value.GivePizza.Position * Vector3.new(1, 0, 1)).magnitude < 120)) else House
end
function Edit.RefreshMemoryUsage(p1, p2) --[[ RefreshMemoryUsage | Line: 252 | Upvalues: MemoryUsage (copy), v3 (copy) ]]
	MemoryUsage.Visible = p2
	task.spawn(function() --[[ Line: 254 | Upvalues: v3 (ref), MemoryUsage (ref) ]]
		local v1, v2, v32 = v3:InvokeServer("GetFurnitureMemory")
		MemoryUsage.Usage.Text = "Memory: <b>" .. ("%0.1f"):format(v1 / v2 * 100) .. "%</b>"
		if not (v32 > 3500) then
			return
		end
		MemoryUsage.MaxFurniture.Visible = true
		MemoryUsage.MaxFurniture.Text = "Max Furniture: <b>" .. v32 .. "/4094</b>"
	end)
end
function Edit.EnableBorders(p1, p2) --[[ EnableBorders | Line: 266 | Upvalues: Edit (copy) ]]
	Edit:RefreshMemoryUsage(p2)
	for i, v in ipairs(house.Furniture:GetChildren()) do
		local v1
		v1 = if p2 and v then v else game.ReplicatedStorage.BorderStorage
		v.BorderPointer.Value.Parent = v1
		if p2 then
			v.PrimaryPart = v.BorderPointer.Value
		end
	end
end
local t = {}
function Edit.ClickDetectorsEnabled(p1, p2) --[[ ClickDetectorsEnabled | Line: 277 | Upvalues: t (ref), v1 (copy) ]]
	for k, v in pairs(t) do
		v1:RevertState(v)
	end
	t = {}
	if p2 then
		return
	end
	for i, v in ipairs(house.Furniture:GetDescendants()) do
		if v:IsA("ProximityPrompt") then
			t[v] = v1:SaveState(v, "Enabled")
			v.Enabled = false
			continue
		end
		if v.Name == "ClickDetector" and v:IsA("IntValue") then
			t[v] = v1:SaveState(v, "Value")
			v.Value = 0
		end
	end
end
local v8 = v2.new()
function Edit.ConfigButtonsEnabled(p1, p2) --[[ ConfigButtonsEnabled | Line: 299 | Upvalues: ConfigBillboards (copy), v8 (copy), ConfigTemplate (copy), LocalPlayer (copy), ColorPicker (copy), GuiTop (copy), v7 (copy) ]]
	local v1 = 1
	local v2 = ConfigBillboards:GetChildren()
	if p2 then
		local function AddBillboard(p1) --[[ AddBillboard | Line: 308 | Upvalues: v2 (copy), v1 (ref), ConfigTemplate (ref), ConfigBillboards (ref), v8 (ref), LocalPlayer (ref), ColorPicker (ref), GuiTop (ref) ]]
			local Config = p1:FindFirstChild("Config")
			local t = {}
			if not Config and #t == 0 then
				return
			end
			local v12 = if Config == nil then false else true
			local v22 = v2[v1] or ConfigTemplate:Clone()
			v22.Enabled = true
			v22.Parent = ConfigBillboards
			v22.ConfigButton.ImageLabel.Image = v12 and v22.ConfigButton.ImageLabel.Image or "rbxassetid://124422285947284"
			v22.Adornee = v12 and p1.BorderPointer.Value or t[1].Parent
			v8:GiveTask(v22.ConfigButton.MouseButton1Click:Connect(function() --[[ Line: 323 | Upvalues: Config (copy), p1 (copy), LocalPlayer (ref), v22 (copy), t (copy), ColorPicker (ref), GuiTop (ref) ]]
				if Config then
					p1.StartConfig:FireServer(LocalPlayer)
					if not Config:FindFirstChild("IsToggle") then
						v22.Enabled = false
						workspace.Main.ConfigEnded.Event:Wait()
						v22.Enabled = true
					end
				else
					local v1 = t[1]
					local v2 = ColorPicker.New(GuiTop, {
						ZIndex = 10,
						Position = UDim2.new(1, 0, 1, 0)
					})
					v2:SetColor(v1.Color)
					v2.BrightnessUpdated:Connect(function(p1) --[[ Line: 340 ]] end)
					v2.Updated:Connect(function(p1) --[[ Line: 343 | Upvalues: v1 (copy) ]]
						v1.Color = p1
					end)
					v2.Finished:Connect(function(p1) --[[ Line: 346 ]] end)
					v2.Canceled:Connect(function(p1) --[[ Line: 350 ]] end)
				end
			end))
			v1 = v1 + 1
		end
		for i, v in ipairs(house.Furniture:GetChildren()) do
			AddBillboard(v)
		end
		v7.NewFurniture = house.Furniture.ChildAdded:Connect(function(p1) --[[ Line: 361 | Upvalues: AddBillboard (copy) ]]
			AddBillboard(p1)
		end)
	else
		for i, v in ipairs(v2) do
			v.Adornee = nil
		end
		v8:DoCleaning()
	end
end
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 369 | Upvalues: EditBar (copy), Placement (copy), EditSideBar (copy), EditButton (copy), Edit (copy), GuiManager (copy) ]]
	if p1 ~= EditBar then
		return
	end
	if p2 then
		GuiManager:GetWindowDataByName("Backpack"):SetVisible(false)
		EditButton.Visible = false
		EditSideBar.Visible = true
	else
		Placement:FurnitureVisible(true, true)
		EditSideBar.Visible = false
		EditButton.Visible = IsNearHouse()
		if not Edit.CurrentClass then
			GuiManager:GetWindowDataByName("Backpack"):SetVisible(true)
			return
		end
		Edit.CurrentClass:End()
		GuiManager:GetWindowDataByName("Backpack"):SetVisible(true)
	end
end)
function Edit.SetMode(p1, p2, ...) --[[ SetMode | Line: 391 | Upvalues: Edit (copy), v6 (copy), Delete (copy), Placement (copy), Paint (copy), RotateMode (copy) ]]
	if Edit.CurrentClass then
		Edit.CurrentClass:End()
	end
	if not v6:IsVisible() then
		v6:SetVisible(true)
	end
	house = _G.House
	if p2 == "Edit" then
		Edit:ShowButtons("Furniture", "Paint", "Delete", "Patterns", "Cancel", "RotateMode")
		Edit:Start(...)
		return
	end
	if p2 == "Delete" then
		Delete:Start(...)
		Edit:ShowButtons("Cancel", "SellMode")
		return
	end
	if p2 == "Cancel" then
		v6:SetVisible(false)
		return
	end
	if p2 == "Placement" then
		Edit:ShowButtons("Place", "Tilt", "Rotate", "Grid", "FurnitureVisible", "Cancel")
		Placement:Start(...)
		return
	end
	if p2 == "Paint" then
		Edit:ShowButtons("ColorSelection", "MaterialSelection", "FillMode", "PaintMode", "DropperMode", "ColorWheel", "Cancel")
		Paint:Start(...)
		return
	end
	if p2 == "RotateMode" then
		Edit:ShowButtons("Cancel")
		RotateMode:Start(...)
		return
	end
	if p2 ~= "Patterns" then
		return
	end
	Edit:ShowButtons()
	Edit.CurrentClass = nil
	workspace.Main.OpenAssetPicker.OpenAssetPicker:Fire(nil, "Decal", "Patterns")
end
EditButton.MouseButton1Click:Connect(function() --[[ Line: 438 | Upvalues: Edit (copy), EditButton (copy) ]]
	Edit:SetMode("Edit")
	EditButton.Visible = false
end)
v3:BindEvents({})
function NewCharacter(p1) --[[ NewCharacter | Line: 452 | Upvalues: Edit (copy), ContextActionService (copy) ]]
	p1.ChildAdded:Connect(function(p1) --[[ Line: 453 | Upvalues: Edit (ref), ContextActionService (ref) ]]
		if p1.Name ~= "Paint Bucket" then
			return
		end
		if not _G.GamepadEnabled then
			Edit:SetMode("Paint")
			return
		end
		ContextActionService:BindAction("ActivatePaint", function(p1, p2, p3) --[[ Line: 458 | Upvalues: Edit (ref) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			Edit:SetMode("Paint")
		end, false, Enum.KeyCode.ButtonR2)
	end)
	p1.ChildRemoved:Connect(function(p1) --[[ Line: 466 | Upvalues: ContextActionService (ref) ]]
		if p1.Name ~= "Paint Bucket" or not _G.GamepadEnabled then
			return
		end
		ContextActionService:UnbindAction("ActivatePaint")
	end)
end
LocalPlayer.CharacterAdded:Connect(NewCharacter)
if LocalPlayer.Character then
	NewCharacter(LocalPlayer.Character)
end
task.spawn(function() --[[ Line: 479 | Upvalues: LocalPlayer (copy), v6 (copy), EditButton (copy) ]]
	while true do
		while true do
			repeat
				task.wait(3)
			until LocalPlayer and (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
			if IsNearHouse() and not v6:IsVisible() then
				break
			end
			EditButton.Visible = false
		end
		EditButton.Visible = true
	end
end)
for i, v in ipairs(v4:Merge(EditBar:GetDescendants(), EditSideBar:GetDescendants(), MainGui:WaitForChild("Menu"):WaitForChild("Backpack"):GetDescendants())) do
	if v.Name == "PCKey" and v5.Plateform ~= "Computer" or v.Name == "GamepadButton" and not _G.GamepadEnabled then
		v.Visible = false
	end
end
game:GetService("ContextActionService"):BindAction("EditMode", function(p1, p2, p3) --[[ Line: 501 | Upvalues: EditButton (copy), Edit (copy) ]]
	if p2 ~= Enum.UserInputState.Begin or not EditButton.Visible then
		return
	end
	Edit:SetMode("Edit")
end, false, Enum.KeyCode.ButtonY, Enum.KeyCode.Q)