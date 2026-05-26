-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
Library:Load("Network")
local v3 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Debug = require(game.ReplicatedStorage:WaitForChild("Debug"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local ClothingIDs = require(game.ReplicatedStorage:WaitForChild("ClothingIDs"))
local Template = v3:WaitForChild("Template")
local ScrollingFrame = v3:WaitForChild("ScrollingFrame")
local List = ScrollingFrame:WaitForChild("List")
local Top = v3:WaitForChild("Top")
local SearchBox = Top:WaitForChild("Search"):WaitForChild("SearchBox")
local SearchIcon = Top.Search:WaitForChild("SearchIcon")
local DropDownButton = Top:WaitForChild("DropDownButton")
local WearingList = v3:WaitForChild("WearingList")
local Template_2 = WearingList:WaitForChild("Template")
local Reset = v3:WaitForChild("Reset")
local ResetButton = Reset:WaitForChild("ResetButton")
local CancelButton = v3:WaitForChild("CancelButton")
v3.Position = UDim2.new(1, 0, 0, -2)
local v5 = GuiManager:RegisterWindow(v3, "Right", "Right")
local v6 = GuiManager:RegisterListView(v3, List)
local v7 = GuiManager:RegisterDropdownMenu(v3, DropDownButton, "Hats")
local v8 = GuiManager:RegisterTextInput(v3, SearchBox)
local UserInputService = game:GetService("UserInputService")
local AvatarEditorSelection = PlayerGui:WaitForChild("TopScreenGui"):WaitForChild("AvatarEditorSelection")
AvatarEditorSelection.Visible = false
Template.Visible = false
Template_2.Visible = false
v8.NeedsToBeFiltered = false
v8.MinLength = 1
v8:Initialize()
v6.AutoResize = false
v6.Header = DropDownButton
v6.MinNumColumbs = 4
if MainGui.AbsoluteSize.X < 800 then
	v6:SetCellPadding(UDim2.new(0, 0, 0, 0))
end
spawn(function() --[[ Line: 70 | Upvalues: v4 (copy), DropDownButton (copy), SearchBox (copy) ]]
	if v4.IsEnglish() then
		return
	end
	DropDownButton.NextSelectionRight = nil
	SearchBox.Parent.Visible = false
end)
v5.FirstSelectedObject = DropDownButton
v7.MaxScreenCoverageScaleY = 1
local v9 = "Hats"
if Debug.Enabled and Debug.ShowAvatarEditorItemNames then
	local v10 = v3.DebugTemplate:Clone()
	v10.AutoLocalize = false
	v10.Visible = true
	v10.Parent = Template
end
function ListDisplayFunction(p1, p2, p3, p4) --[[ Line: 93 | Upvalues: Debug (copy) ]]
	p2.Thumbnail.Image = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?wd=75&ht=75&fmt=png&aid=" .. p3[1]
	if not (Debug.Enabled and Debug.ShowAvatarEditorItemNames) then
		return
	end
	p2.DebugTemplate.Text = p3[2]
end
local function RefreshSearch() --[[ RefreshSearch | Line: 107 | Upvalues: SearchBox (copy), ClothingIDs (copy), v9 (ref), v6 (copy), Template (copy) ]]
	if SearchBox.Text == "" then
		v6:UpdateData(ClothingIDs[v9], Template, ListDisplayFunction)
		return
	end
	local t = {}
	for i, v in ipairs(ClothingIDs[v9]) do
		if string.lower(v[2]):match(string.lower(SearchBox.Text)) then
			table.insert(t, { v[1] })
		end
	end
	v6:UpdateData(t, Template, ListDisplayFunction)
end
local v11 = 0
local t = {}
local function RefreshWearingList() --[[ RefreshWearingList | Line: 127 | Upvalues: t (ref), LocalPlayer (copy), v4 (copy), v9 (ref), v1 (copy), v11 (ref), Template_2 (copy), WearingList (copy), DropDownButton (copy), Reset (copy), ResetButton (copy) ]]
	for i, v in ipairs(t) do
		v:Destroy()
	end
	t = {}
	task.wait()
	local v12 = LocalPlayer.Character.Humanoid:GetAppliedDescription()
	local v2 = v4.AvatarCategoryToAssetType[v9]
	for i, v in ipairs(v1:ExplodeString(v12[v2])) do
		v11 = v11 - 1
		local v3 = Template_2:clone()
		v3.Thumbnail.Image = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?wd=75&ht=75&fmt=png&aid=" .. v
		v3.Visible = true
		v3.Parent = WearingList
		v3.LayoutOrder = v11
		v3.MouseButton1Click:connect(function() --[[ Line: 146 | Upvalues: DropDownButton (ref), v1 (ref), v (copy), v2 (copy) ]]
			if not _G.GamepadEnabled then
				v1:SendData("RemoveAvatarAsset", "PlayerChannel", nil, v, v2)
				return
			end
			game:GetService("GuiService").SelectedObject = DropDownButton
			v1:SendData("RemoveAvatarAsset", "PlayerChannel", nil, v, v2)
		end)
		table.insert(t, 1, v3)
	end
	local v5 = v4.AssetTypeToSlotSize[v2]
	if v5 == 0 then
		WearingList.Size = UDim2.new(0, 0, 0, 0)
	else
		WearingList.Size = UDim2.new(0, 70, 0, 70 * v5)
	end
	if not _G.GamepadEnabled then
		return
	end
	for i, v in ipairs(t) do
		if i > 1 then
			v.NextSelectionUp = t[i - 1]
			t[i - 1].NextSelectionDown = v
			continue
		end
		DropDownButton.NextSelectionLeft = v
	end
	Reset.Position = UDim2.new(0, -2, 0, WearingList.AbsolutePosition.Y + WearingList.AbsoluteSize.Y)
	Reset.AnchorPoint = Vector2.new(1, 0)
	if #t == 0 then
		DropDownButton.NextSelectionLeft = ResetButton
		return
	end
	t[#t].NextSelectionDown = ResetButton
	ResetButton.NextSelectionUp = t[#t]
end
UIEvents.DropDownMenuOptionSelected.Event:connect(function(p1, p2, p3) --[[ Line: 216 | Upvalues: v3 (copy), SearchBox (copy), v6 (copy), ClothingIDs (copy), Template (copy), v9 (ref), RefreshWearingList (copy) ]]
	if p1 ~= v3 then
		return
	end
	SearchBox.Text = ""
	v6:UpdateData(ClothingIDs[p3], Template, ListDisplayFunction)
	v9 = p3
	RefreshWearingList()
end)
SearchBox.Focused:connect(function() --[[ Line: 226 | Upvalues: RefreshSearch (copy) ]]
	wait()
	RefreshSearch()
end)
UIEvents.TextInputFocusLost.Event:connect(function(p1, p2, p3) --[[ Line: 231 | Upvalues: v3 (copy), RefreshSearch (copy) ]]
	if p1 ~= v3 then
		return
	end
	RefreshSearch()
end)
local v12 = nil
local v13 = nil
local v14 = nil
UIEvents.ListItemPressed.Event:connect(function(p1, p2, p3, p4) --[[ Line: 240 | Upvalues: v3 (copy), v12 (ref), v13 (ref), v14 (ref), v4 (copy), v9 (ref), v1 (copy) ]]
	if p1 ~= v3 then
		return
	end
	v12 = p4[1]
	v13 = p4[2]
	v14 = v4.AvatarCategoryToAssetType[v9]
	v1:SendData("LoadAvatarAsset", "PlayerChannel", nil, v12, v14)
end)
AvatarEditorSelection.Wear.MouseButton1Click:Connect(function() --[[ Line: 278 | Upvalues: v1 (copy), v12 (ref), v14 (ref), AvatarEditorSelection (copy) ]]
	v1:SendData("LoadAvatarAsset", "PlayerChannel", nil, v12, v14)
	AvatarEditorSelection.Visible = false
end)
AvatarEditorSelection.Buy.MouseButton1Click:Connect(function() --[[ Line: 283 | Upvalues: LocalPlayer (copy), v12 (ref) ]]
	game:GetService("MarketplaceService"):PromptPurchase(LocalPlayer, v12)
end)
ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 288 | Upvalues: AvatarEditorSelection (copy) ]]
	AvatarEditorSelection.Visible = false
end)
local CurrentCamera = workspace.CurrentCamera
local v15 = nil
local v16 = nil
local v17 = nil
local v18 = nil
local v19 = nil
local v20 = false
local function CameraLock(p1) --[[ CameraLock | Line: 299 | Upvalues: LocalPlayer (copy), v20 (ref), CurrentCamera (copy), MainGui (copy), v19 (ref), v15 (ref), UserInputService (copy), v16 (ref), v17 (ref), v18 (ref) ]]
	local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
	local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	v20 = p1
	if p1 and (HumanoidRootPart and HumanoidRootPart.Parent) then
		CurrentCamera.FieldOfView = 40
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		local function PositionCamera() --[[ PositionCamera | Line: 310 | Upvalues: HumanoidRootPart (copy), CurrentCamera (ref), MainGui (ref) ]]
			local v1 = 100
			for i = 2, 6, 0.1 do
				CurrentCamera.CFrame = (HumanoidRootPart.CFrame + HumanoidRootPart.CFrame.lookVector * 10 + HumanoidRootPart.CFrame.rightVector * -i + Vector3.new(0, 4, 0)) * CFrame.Angles(0.2617993877991494, math.pi, 0)
				local v2 = CurrentCamera:ScreenPointToRay(MainGui.AbsoluteSize.X / 4, MainGui.AbsoluteSize.Y / 2):Distance(HumanoidRootPart.Position)
				if v1 < v2 then
					break
				end
				v1 = v2
			end
		end
		PositionCamera()
		local Position = HumanoidRootPart.Position
		spawn(function() --[[ Line: 330 | Upvalues: v20 (ref), Position (copy), LocalPlayer (ref), PositionCamera (copy) ]]
			repeat
				if not v20 then
					return
				end
				wait(0.1)
			until (Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 2
			PositionCamera()
		end)
		v19 = Humanoid.JumpPower
		Humanoid.JumpPower = 0
		Humanoid.WalkSpeed = 0
		mousedown = false
		workspace.Main.CameraBodyLockEnabled:Fire(false)
		local v1 = 0
		v15 = UserInputService.InputBegan:connect(function(p1, p2) --[[ Line: 357 | Upvalues: v1 (ref) ]]
			if p1.UserInputType ~= Enum.UserInputType.MouseButton2 and p1.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			v1 = p1.Position.X
			mousedown = true
		end)
		v16 = UserInputService.InputEnded:connect(function(p1, p2) --[[ Line: 364 ]]
			if p1.UserInputType ~= Enum.UserInputType.MouseButton2 then
				return
			end
			mousedown = false
		end)
		local function rotate(p1, p2) --[[ rotate | Line: 370 | Upvalues: v1 (ref), HumanoidRootPart (copy) ]]
			v1 = p1.Position.X
			HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(-p2), 0)
		end
		local v2 = false
		v17 = UserInputService.InputChanged:connect(function(p1, p2) --[[ Line: 376 | Upvalues: v1 (ref), HumanoidRootPart (copy), v2 (ref) ]]
			if p1.UserInputType == Enum.UserInputType.MouseMovement then
				if mousedown then
					local v12 = v1 - p1.Position.X
					v1 = p1.Position.X
					HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(-v12), 0)
				end
			elseif p1.KeyCode == Enum.KeyCode.Thumbstick2 then
				if not v2 and math.abs(p1.Position.X) > 0.5 then
					v2 = true
					game:GetService("RunService"):BindToRenderStep("RotateCamera", Enum.RenderPriority.Character.Value, function() --[[ Line: 388 | Upvalues: p1 (copy), v1 (ref), HumanoidRootPart (ref) ]]
						v1 = p1.Position.X
						HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(-(p1.Position.X * 2)), 0)
					end)
					return
				end
				if not v2 then
					return
				end
				if math.abs(p1.Position.X) <= 0.5 then
					v2 = false
					game:GetService("RunService"):UnbindFromRenderStep("RotateCamera")
				end
			else
				if p2 or p1.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				local v22 = v1 - p1.Position.X
				v1 = p1.Position.X
				HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(-v22), 0)
			end
		end)
		return
	end
	CurrentCamera.FieldOfView = 70
	CurrentCamera.CameraType = Enum.CameraType.Custom
	if v17 then
		v17:disconnect()
	end
	if v16 then
		v16:disconnect()
	end
	if v15 then
		v15:disconnect()
	end
	workspace.Main.CameraBodyLockEnabled:Fire(true)
	Humanoid.WalkSpeed = v18 ~= 0 and v18 or 16
	Humanoid.JumpPower = v19
end
local v21 = nil
local v22 = nil
local t2 = {}
local PlayerClones = workspace.PlayerClones
local v23 = nil
_G.EditingAvatar = false
function EditorWindowEnabled(p1) --[[ EditorWindowEnabled | Line: 430 | Upvalues: GuiManager (copy), LocalPlayer (copy), v18 (ref), CameraLock (copy), v22 (ref), v9 (ref), SearchBox (copy), v7 (copy), v4 (copy), v6 (copy), ClothingIDs (copy), Template (copy), v21 (ref), v23 (ref), RefreshWearingList (copy), v1 (copy), t2 (ref), PlayerClones (copy), v20 (ref), CurrentCamera (copy), v17 (ref), v16 (ref), v15 (ref), v19 (ref) ]]
	local v12 = GuiManager:GetWindowDataByName("ChatWindow")
	if p1 then
		GuiManager:TouchControlsEnabled(false)
		_G.EditingAvatar = true
		if LocalPlayer.Character.Humanoid.WalkSpeed ~= 0 then
			v18 = LocalPlayer.Character.Humanoid.WalkSpeed
			LocalPlayer.Character.Humanoid.WalkSpeed = 0
			workspace.Main.FadeInBlack:Fire(0.5)
			wait(0.5)
			workspace.Main.FadeOutBlack:Fire(0.8)
		end
		CameraLock(true)
		v22 = v12.Object.Visible
		v12:SetVisible(false)
		v12.Disabled = true
		v9 = "Hats"
		SearchBox.Text = ""
		v7:SetList(v4.AvatarCategories, v9, v4.AvatarCategoryIcons, v4.AvatarCategoryIcons.Hats)
		v6:UpdateData(ClothingIDs.Hats, Template, ListDisplayFunction)
		if not _G.GamepadEnabled then
			v7:Open()
		end
		v21 = LocalPlayer:GetAttribute("UniformEnabled")
		if v21 then
			workspace.Main.ChangeSetting:Fire("UniformEnabled", false)
		end
		if v23 then
			v23:Disconnect()
		end
		v23 = LocalPlayer.Character.Humanoid.ChildAdded:connect(RefreshWearingList)
		RefreshWearingList()
		v1:SendData("PlayerEditingAvatar", "PlayerChannel", nil, true)
		for i, v in ipairs(game.Players:GetChildren()) do
			if v ~= LocalPlayer and (v.Character and (v.Character:FindFirstChild("Humanoid") and v.Character.Parent == workspace)) then
				v.Character.Parent = game.ReplicatedStorage
				table.insert(t2, v)
			end
		end
		PlayerClones.Parent = game.ReplicatedStorage
	else
		GuiManager:TouchControlsEnabled(true)
		workspace.Main.FadeInBlack:Fire(0.5)
		wait(0.5)
		workspace.Main.FadeOutBlack:Fire(0.8)
		local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
		LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		v20 = false
		CurrentCamera.FieldOfView = 70
		CurrentCamera.CameraType = Enum.CameraType.Custom
		if v17 then
			v17:disconnect()
		end
		if v16 then
			v16:disconnect()
		end
		if v15 then
			v15:disconnect()
		end
		workspace.Main.CameraBodyLockEnabled:Fire(true)
		Humanoid.WalkSpeed = v18 ~= 0 and v18 or 16
		Humanoid.JumpPower = v19
		if _G.IsPartyServer then
			_G.RefreshLocalCharacters()
		else
			for i, v in ipairs(t2) do
				if v ~= nil and (v ~= LocalPlayer and (v.Character and v.Character:FindFirstChild("Humanoid"))) then
					v.Character.Parent = workspace
				end
			end
		end
		PlayerClones.Parent = workspace
		t2 = {}
		v12.Disabled = false
		v12:SetVisible(v22)
		if v21 then
			workspace.Main.ChangeSetting:Fire("UniformEnabled", true)
		end
		v1:SendData("PlayerEditingAvatar", "PlayerChannel", nil, false)
		_G.EditingAvatar = false
	end
end
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 551 | Upvalues: v3 (copy), LocalPlayer (copy), Dialog (copy), v5 (copy), AvatarEditorSelection (copy) ]]
	if p1 ~= v3 then
		return
	end
	if p2 and LocalPlayer.Character:GetAttribute("CharacterType") ~= nil then
		Dialog:ShowMessage("Cannot Edit Avatar", "You cannot edit your avatar as an animal")
		task.wait()
		v5:SetVisible(false)
		return
	end
	EditorWindowEnabled(p2)
	if p2 then
		return
	end
	AvatarEditorSelection.Visible = false
end)
local function OpenLocker(p1) --[[ OpenLocker | Line: 567 | Upvalues: LocalPlayer (copy), v18 (ref), v2 (copy), v5 (copy), v1 (copy), Dialog (copy) ]]
	if _G.EditingAvatar then
		return
	end
	if LocalPlayer.Character:GetAttribute("CharacterType") == nil then
		v18 = LocalPlayer.Character.Humanoid.WalkSpeed
		LocalPlayer.Character.Humanoid.WalkSpeed = 0
		workspace.Main.CameraBodyLockEnabled:Fire(false)
		v2:PlaySound("LockerOpen")
		workspace.Main.FadeInBlack:Fire(0.5)
		wait(0.5)
		workspace.Main.FadeOutBlack:Fire(0.8)
		local Character = LocalPlayer.Character
		local _, _2, _3, v12, v22, v3, v4, v52, v6, v7, v8, v9 = p1.CFrame:GetComponents()
		local v10 = p1.Position + p1.CFrame.lookVector * 4
		Character.HumanoidRootPart.CFrame = CFrame.new(v10.X, Character.HumanoidRootPart.Position.Y, v10.Z, v12, v22, v3, v4, v52, v6, v7, v8, v9)
		v5:SetVisible(true)
		v1:SendData("ChangeJob", "PlayerChannel", nil, "On Break")
		return
	end
	Dialog:ShowMessage("Cannot Edit Avatar", "You cannot edit your avatar as an animal")
end
workspace.Locker1.ClickDetector.Detector.Event:connect(v1:Debounce(function() --[[ Line: 597 | Upvalues: OpenLocker (copy) ]]
	OpenLocker(workspace.Locker1.Main)
end))
workspace.Locker2.ClickDetector.Detector.Event:connect(v1:Debounce(function() --[[ Line: 602 | Upvalues: OpenLocker (copy) ]]
	OpenLocker(workspace.Locker2.Main)
end))
SearchIcon.MouseButton1Click:connect(function() --[[ Line: 608 | Upvalues: RefreshSearch (copy) ]]
	RefreshSearch()
end)
ResetButton.MouseButton1Click:connect(function() --[[ Line: 612 | Upvalues: v1 (copy) ]]
	v1:SendData("ResetAvatarAppearance", "PlayerChannel", nil, true)
end)
if not _G.GamepadEnabled then
	return
end
CancelButton.Visible = false
script.Parent:WaitForChild("AvatarHelp").Visible = true