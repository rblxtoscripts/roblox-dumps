-- https://lua.expert/
_G.MouseIcon = ""
local v1 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
require(game.ReplicatedStorage:WaitForChild("AssetLibraryManager"))
local v2 = Library:Load("Utility")
local v3 = Library:Load("Events")
local v4 = Library:Load("SoundFX")
local v5 = Library:Load("Tween")
local BubbleChatLocal = require(game.ReplicatedStorage:WaitForChild("BubbleChatLocal"))
Library:Load("Table")
local v6 = Library:Load("Network")
local v7 = Library:Load("Maid")
local LocalPlayer = game.Players.LocalPlayer
require(game.ReplicatedStorage:WaitForChild("Debug"))
local v8 = game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled and not game:GetService("UserInputService").KeyboardEnabled
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
require(game.ReplicatedStorage:WaitForChild("RagdollHandler"))
local CurrentCamera = game.Workspace.CurrentCamera
local LocalPlayer_2 = game.Players.LocalPlayer
local PlayerGui = LocalPlayer_2:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local StickerDatabase = require(game.ReplicatedStorage:WaitForChild("StickerDatabase"))
PlayerGui:WaitForChild("UIEvents")
game:GetService("UserInputService")
v2:SendData("SetPlateform", "PlayerChannel", nil, v1.Plateform)
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
local v9 = game.ReplicatedStorage:FindFirstChild("TheDumpInterior") or workspace.TheDump:FindFirstChild("TheDumpInterior")
_G.CanChat = true
spawn(function() --[[ Line: 95 | Upvalues: v3 (copy) ]]
	pcall(function() --[[ Line: 96 | Upvalues: v3 (ref) ]]
		if game:GetService("RunService"):IsStudio() then
			_G.CanChat = true
			v3:Fire("CanChat", true)
		else
			_G.CanChat = game:GetService("Chat"):CanUserChatAsync(game.Players.LocalPlayer.userId)
			v3:Fire("CanChat", false)
		end
	end)
end)
spawn(function() --[[ Line: 110 | Upvalues: v1 (copy), v3 (copy) ]]
	_G.IsNewPlayer = workspace.Main.IsNewPlayer:InvokeServer()
	if not v1.Sale or _G.IsNewPlayer then
		return
	end
	v3:Wait("PopupsEnded")
	wait(10)
	workspace.Main.OpenCatalogTab.OpenCatalogTab:Fire("GamePasses")
end)
workspace.Main.PopupsEnded.OnClientEvent:Connect(function() --[[ Line: 122 | Upvalues: v3 (copy) ]]
	_G.PopupsEnded = true
	v3:Fire("PopupsEnded")
end)
function AttachItem(p1, p2, p3, p4, p5, p6) --[[ AttachItem | Line: 128 | Upvalues: v1 (copy) ]]
	local ItemBillboard = game.ReplicatedStorage.ItemBillboardTemplate:clone()
	ItemBillboard.Image.Image = p2 == "Capsule" and v1.CapsuleTypeToImage[p3] or (p2 == "Present" and v1.PresentData[p4].ToolIcon or (if p2 == "PetPizza" then v1.FavoriteFoodImage[p5] else false))
	ItemBillboard.Name = "ItemBillboard"
	ItemBillboard.AlwaysOnTop = p6
	ItemBillboard.Adornee = p1
	ItemBillboard.Parent = p1
	if p2 ~= "PetPizza" then
		return
	end
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.AspectRatio = 0.913
	UIAspectRatioConstraint.Parent = ItemBillboard.Image
	ItemBillboard.Image.Size = UDim2.new(0.5, 0, 0.5, 0)
end
local function SetLeavesEnabled(p1) --[[ SetLeavesEnabled | Line: 145 | Upvalues: v8 (copy) ]]
	if v8 then
		return
	end
	for i, v in ipairs(workspace.Trees:GetChildren()) do
		if v:FindFirstChild("LeavesMain") and v.LeavesMain:FindFirstChild("LeafParticles") then
			v.LeavesMain.LeafParticles.Enabled = p1
		end
	end
end
workspace.Main.SetLeafParticlesEnabled.OnClientEvent:connect(function(p1) --[[ Line: 155 | Upvalues: SetLeavesEnabled (copy) ]]
	SetLeavesEnabled(p1)
end)
if game.ReplicatedStorage.GlobalData.TimeOfDay.Value ~= "Night" and (game.ReplicatedStorage.GlobalData.Season.Value == "Fall" and game.ReplicatedStorage.GlobalData.Holiday.Value ~= "Halloween") then
	SetLeavesEnabled(true)
end
workspace.Main.TripPlayer.OnClientEvent:connect(function(p1) --[[ Line: 163 | Upvalues: LocalPlayer_2 (copy) ]]
	LocalPlayer_2.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
	LocalPlayer_2.Character.HumanoidRootPart.Velocity = p1
end)
workspace.Main.Preload.OnClientEvent:connect(function(...) --[[ Line: 169 ]]
	local list = {}
	for i, v in ipairs(list) do
		if typeof(v) == "table" then
			for k, v2 in pairs(v) do
				table.insert(list, v2)
			end
			continue
		end
		if typeof(v) == "userdata" then
			table.insert(list, v)
		end
	end
	game:GetService("ContentProvider"):PreloadAsync(list)
end)
function _G.PlayChimes(p1) --[[ Line: 184 ]]
	local Chimes = Instance.new("Sound")
	Chimes.SoundId = "rbxassetid://1994098397"
	Chimes.EmitterSize = 5
	Chimes.RollOffMode = "LinearSquare"
	Chimes.Looped = true
	Chimes.MaxDistance = 150
	Chimes.Name = "Chimes"
	Chimes.Parent = p1
	Chimes:Play()
end
if game.ReplicatedStorage.GlobalData.Holiday.Value == "Thanksgiving" and workspace:FindFirstChild("Turkeys") then
	spawn(function() --[[ Line: 198 | Upvalues: LocalPlayer_2 (copy), v4 (copy), v2 (copy) ]]
		local CollectionCounter = LocalPlayer_2:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Notifications"):WaitForChild("CollectionCounter")
		local v1 = 0
		for i, v in ipairs(workspace.Turkeys:GetChildren()) do
			local v22 = nil
			v22 = v.TurkeyBody.Touched:connect(function(p1) --[[ Line: 203 | Upvalues: LocalPlayer_2 (ref), v22 (ref), v (copy), v4 (ref), v2 (ref), CollectionCounter (copy), v1 (ref) ]]
				if not p1 or (not p1.Parent or p1.Parent.Name ~= LocalPlayer_2.Name) then
					return
				end
				v22:disconnect()
				v:Destroy()
				v4:PlaySound("GotCandy")
				v2:SendData("TurkeyFound", "PlayerChannel", nil, v.Name)
				wait(0.5)
				CollectionCounter.Visible = true
				CollectionCounter.Text = v1 .. "/6"
				wait(1)
				v1 = v1 + 1
				CollectionCounter.Text = v1 .. "/6"
				wait(3)
				CollectionCounter.Visible = false
			end)
		end
		local v3 = v2:SendData("GetFoundTurkeys", "PlayerChannel", 5)
		for i, v in ipairs(v3) do
			workspace.Turkeys:FindFirstChild(v):Destroy()
		end
	end)
end
local v10 = nil
local v11 = nil
function RefreshOrderBoard(p1) --[[ RefreshOrderBoard | Line: 233 | Upvalues: v11 (ref), v10 (ref), v1 (copy) ]]
	local v12 = if p1 then p1 else v11
	if not v12 then
		return
	end
	v11 = v12
	if not workspace:FindFirstChild("Orders") then
		return
	end
	board_objects = game.Workspace.Orders:GetChildren()
	table.sort(board_objects, function(p1, p2) --[[ Line: 249 ]]
		return p1.LayoutOrder.Value < p2.LayoutOrder.Value
	end)
	if not v12 then
		v12 = workspace.GameService.GetOrders:InvokeServer()
	end
	v10 = v12
	for i, v in ipairs(board_objects) do
		v.SG.ImageLabel.Image = ""
		v.SG.ImageLabel.Visible = false
		v.Material = "Plastic"
		if v:FindFirstChild("X10") then
			v.X10:Destroy()
		end
		if v:FindFirstChild("X2") then
			v.X2:Destroy()
		end
		if v:FindFirstChild("Chimes") then
			v.Chimes:Destroy()
		end
		if v:FindFirstChild("ItemBillboard") then
			v.ItemBillboard:Destroy()
		end
		v.Color = Color3.fromRGB(168, 168, 168)
	end
	for i, v in ipairs(board_objects) do
		local v2
		local v3 = v12[i]
		if v3 then
			v2 = if v3.Order == "MountainDew" and game.ReplicatedStorage.GlobalData.Holiday.Value == "Halloween" then "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=2512441325" elseif v3.Order == "MountainDew" and game.ReplicatedStorage.GlobalData.Holiday.Value == "Christmas" then "rbxassetid://11874352009" else v1.OrderBoardImages[v3.Order]
			v.SG.ImageLabel.Image = v2
			v.SG.ImageLabel.Visible = true
			if v3.Multiplier and v3.Multiplier ~= 1 then
				if v3.Multiplier == 10 and v:FindFirstChild("X10") == nil then
					v.Material = "Neon"
					game.ReplicatedStorage.MultiplierEffects.OrderBoard.X10:clone().Parent = v
					local v4 = Random.new(tick()):NextInteger(1, 359)
					if not game.ReplicatedStorage.GlobalData.NeonTime.Value then
						_G.PlayChimes(v)
					end
					spawn(function() --[[ Line: 304 | Upvalues: v (copy), v4 (ref) ]]
						while v:FindFirstChild("X10") do
							v.Color = Color3.fromHSV(v4 / 359, 1, 1)
							if v4 > 359 then
								v4 = 0
							end
							v4 = v4 + 40
							wait(3)
						end
					end)
				elseif v3.Multiplier == 2 and v:FindFirstChild("X2") == nil then
					v.Material = "Plastic"
					v.Color = Color3.fromRGB(248, 165, 82)
				end
			end
			if v3.ItemType and not v:FindFirstChild("ItemBillboard") then
				AttachItem(v, v3.ItemType, v3.CapsuleType, v3.PresentType, v3.PetPizzaType, true)
				continue
			end
			if not v3.ItemType and v:FindFirstChild("ItemBillboard") then
				v.ItemBillboard:Destroy()
			end
		end
	end
end
workspace.GameService.RefreshOrderBoard.OnClientEvent:connect(RefreshOrderBoard)
task.spawn(function() --[[ Line: 336 ]]
	while true do
		task.wait(15)
		RefreshOrderBoard()
	end
end)
workspace.GameService.ShowOrderBoardCheckmark.OnClientEvent:connect(function(p1) --[[ Line: 347 ]]
	local v1 = nil
	if not workspace:FindFirstChild("Orders") then
		return
	end
	board_objects = game.Workspace.Orders:GetChildren()
	for i, v in ipairs(board_objects) do
		if v.SG.ImageLabel.Image == p1 then
			v1 = v.SG.ImageLabel
			v.SG.ImageLabel.Image = "http://www.roblox.com/asset/?id=168401336"
			v.Sparkles.Enabled = true
			if v:FindFirstChild("Chimes") then
				v.Chimes:Destroy()
			end
			break
		end
	end
	wait(2)
	if v1 == nil then
		return
	end
	v1.Parent.Parent.Sparkles.Enabled = false
end)
spawn(function() --[[ Line: 378 | Upvalues: v1 (copy), LocalPlayer_2 (copy), v4 (copy) ]]
	workspace:WaitForChild("CornMaze", 5)
	local v12 = false
	local LOD = game.ReplicatedStorage.LOD
	if v1.IsPartyServer or not (workspace:FindFirstChild("CornMaze") and workspace.CornMaze:FindFirstChild("Trophy")) then
		return
	end
	local t = { game.ReplicatedStorage.LOD:WaitForChild("Corn"), game.ReplicatedStorage.LOD:WaitForChild("MazeDecorations") }
	local WallsLOD = workspace.CornMaze.WallsLOD
	workspace.CornMaze.Trophy.Touching.Touched:connect(function(p1) --[[ Line: 389 | Upvalues: LocalPlayer_2 (ref), v4 (ref) ]]
		if not p1 or (not p1.Parent or p1.Parent ~= LocalPlayer_2.Character) then
			return
		end
		workspace.Main.MazeComplete:FireServer()
		workspace.CornMaze.Trophy:Destroy()
		workspace.CornMaze.DeletingCorn:Destroy()
		workspace.CornMaze.DeletingCorn2:Destroy()
		workspace.CornMaze.DeletingPart:Destroy()
		v4:PlaySound("CapsuleCommonOpened")
	end)
	workspace.CornMaze.Load.Touched:connect(function(p1) --[[ Line: 400 | Upvalues: v12 (ref), LocalPlayer_2 (ref), t (copy), WallsLOD (copy) ]]
		if v12 or (not p1 or (not p1.Parent or p1.Parent ~= LocalPlayer_2.Character)) then
			return
		end
		for i, v in ipairs(t) do
			v.Parent = workspace.CornMaze
		end
		WallsLOD.Parent = game.ReplicatedStorage.LOD
		v12 = true
	end)
	workspace.CornMaze.Unload.Touched:connect(function(p1) --[[ Line: 411 | Upvalues: v12 (ref), LocalPlayer_2 (ref), t (copy), WallsLOD (copy) ]]
		if not v12 or (not p1 or (not p1.Parent or p1.Parent ~= LocalPlayer_2.Character)) then
			return
		end
		for i, v in ipairs(t) do
			v.Parent = game.ReplicatedStorage.LOD
		end
		WallsLOD.Parent = workspace.CornMaze
		v12 = false
	end)
end)
if not v1.IsPartyServer then
	task.spawn(function() --[[ Line: 519 | Upvalues: v1 (copy), LocalPlayer_2 (copy) ]]
		local Hideout = workspace:WaitForChild("Hideout")
		local WallPizzaPlaceRemove = workspace.WallPizzaPlaceRemove
		local WallPizzaPlaceRemove2 = workspace.WallPizzaPlaceRemove2
		local WallPizzaPlaceRemove3 = workspace.WallPizzaPlaceRemove3
		local function hideoutEnabled(p1) --[[ hideoutEnabled | Line: 526 | Upvalues: v1 (ref), Hideout (copy), WallPizzaPlaceRemove (copy), WallPizzaPlaceRemove2 (copy), WallPizzaPlaceRemove3 (copy) ]]
			if v1.IsPartyServer then
				return
			end
			for k, v in pairs(workspace.Ovens:GetChildren()) do
				local Back = v:WaitForChild("Back")
				Back.Transparency = if p1 then 0.7 else 0
			end
			for i, v in ipairs(workspace:GetChildren()) do
				if v.Name == "WallPizzaPlaceTransparent" then
					v.Transparency = if p1 then 0.7 else 0
				end
			end
			Hideout.Parent = p1 and workspace or game.ReplicatedStorage
			WallPizzaPlaceRemove.Parent = p1 and game.ReplicatedStorage or workspace
			WallPizzaPlaceRemove2.Parent = p1 and game.ReplicatedStorage or workspace
			WallPizzaPlaceRemove3.Parent = p1 and game.ReplicatedStorage or workspace
		end
		hideoutEnabled(false)
		workspace.Main.ShowHideout.OnClientEvent:connect(function() --[[ Line: 550 | Upvalues: Hideout (copy), hideoutEnabled (copy), LocalPlayer_2 (ref) ]]
			if Hideout.Parent == workspace then
				return
			end
			hideoutEnabled(true)
			while Hideout.Parent == workspace do
				wait(3)
				local Character = LocalPlayer_2.Character
				if not (Character and (Character:FindFirstChild("HumanoidRootPart") and (Character.HumanoidRootPart.Position - workspace.HideoutPoint.Position).magnitude > 20)) then
					continue
				end
				hideoutEnabled(false)
			end
		end)
	end)
end
workspace.GameService.WrongOrderMessage.OnClientEvent:connect(function(p1, p2, p3) --[[ Line: 575 ]]
	if not (p1 and p1.Parent) then
		return
	end
	local v1 = game.ReplicatedStorage.WrongOrder:clone()
	v1.TextLabel.Text = p2
	v1.Parent = p1
	wait(p3)
	v1:Destroy()
end)
local v12 = nil
function BannerMessage(p1, p2) --[[ BannerMessage | Line: 587 | Upvalues: PlayerGui (copy), v12 (ref) ]]
	local v1 = p2 or 5
	local BannerMessage = PlayerGui.Gui.BannerMessage
	BannerMessage.Text = p1
	BannerMessage.Visible = true
	BannerMessage.TextTransparency = 0
	if not v12 then
		task.wait(v1 / 2)
		v12 = game:GetService("TweenService"):Create(BannerMessage, TweenInfo.new(v1 / 2), {
			TextTransparency = 1
		})
		v12:Play()
		return
	end
	v12:Cancel()
	v12 = nil
	task.wait(v1 / 2)
	v12 = game:GetService("TweenService"):Create(BannerMessage, TweenInfo.new(v1 / 2), {
		TextTransparency = 1
	})
	v12:Play()
end
workspace.GameService.BannerMessage.OnClientEvent:connect(BannerMessage)
workspace.GameService.BannerMessage.BannerMessage.Event:connect(BannerMessage)
local function v13(p1, p2, p3) --[[ RecursiveTween | Line: 606 | Upvalues: v5 (copy), v13 (copy) ]]
	local v1 = p1:FindFirstChild(p3)
	v5(p2, "Position", "Vector3", v1.CFrame:pointToWorldSpace((Vector3.new(0, -v1.Size.Y / 2, 0))), v1.CFrame:pointToWorldSpace((Vector3.new(0, v1.Size.Y / 2, 0))), v1.Size.Y / 15, "Linear", "Out"):connect(function(p12, p22, p32) --[[ Line: 611 | Upvalues: p3 (ref), p1 (copy), v13 (ref), p2 (copy) ]]
		p3 = p3 + 1
		if p1:FindFirstChild(p3) then
			v13(p1, p2, p3)
		else
			p2:Destroy()
		end
	end)
end
workspace.GameService.StartWireAnimation.OnClientEvent:Connect(function(p1, p2, p3, p4, p5, p6, p7) --[[ Line: 622 | Upvalues: v13 (copy) ]]
	local v1 = game.ReplicatedStorage.WireTemplate:clone()
	v1.Parent = workspace.WireAnimationObjects
	v1.Billboard.ImageLabel.Image = p2
	if p3 and p3 == 10 then
		v1.X10.Enabled = true
	end
	if p4 then
		AttachItem(v1, p4, p5, p6, p7, true)
	end
	local v2 = if p1.Name == "Register1" then workspace.Wires1 else nil
	if p1.Name == "Register2" then
		v2 = workspace.Wires2
	end
	if p1.Name == "Register3" then
		v2 = workspace.Wires3
	end
	v13(v2, v1, 1)
end)
local function OnClientInvoke() --[[ OnClientInvoke | Line: 649 ]]
	return _G.TeleportData
end
workspace.Main.GetTeleportData.OnClientInvoke = OnClientInvoke
local function OnClientInvoke_2(p1) --[[ OnClientInvoke | Line: 653 ]]
	return game:GetService("GuiService"):IsTenFootInterface() or game:GetService("RunService"):IsStudio() and p1
end
workspace.Main.IsGamepadEnabled.OnClientInvoke = OnClientInvoke_2
workspace.GameService.ChangeCamera.OnClientEvent:Connect(function(p1, p2) --[[ Line: 659 | Upvalues: CurrentCamera (copy) ]]
	if p1 == nil then
		CurrentCamera.CameraType = "Custom"
		CurrentCamera.FieldOfView = 70
		workspace.Main.RealignCamera.RealignCamera:Fire(25, 12)
		return
	end
	CurrentCamera.CameraType = "Scriptable"
	CurrentCamera.FieldOfView = 60
	if p2 then
		CurrentCamera.CFrame = CFrame.new(p1.CFrame.p + p1.CFrame.lookVector * -4 + Vector3.new(-2, 6, -4.3), p1.CFrame.p + p1.CFrame.lookVector * 5 + Vector3.new(0, 4, 0))
	else
		CurrentCamera.CFrame = CFrame.new(p1.CFrame.p + p1.CFrame.lookVector * -4 + Vector3.new(2, 6, 4.3), p1.CFrame.p + p1.CFrame.lookVector * 5 + Vector3.new(0, 4, 0))
	end
end)
if not v1.IsPartyServer then
	workspace.Main.ShowBoatButton.OnClientEvent:Connect(function() --[[ Line: 691 ]]
		workspace.Dock["Spawn Boat"].Head.Transparency = 0
	end)
end
workspace.Main.SetWindowVisible.OnClientEvent:Connect(function(p1, p2) --[[ Line: 697 | Upvalues: GuiManager (copy) ]]
	local v1 = GuiManager:GetWindowDataByName(p1)
	if v1.Object.Visible == p2 then
		return
	end
	v1:SetVisible(p2)
end)
workspace.Main.OpenDevConsole.OnClientEvent:Connect(function() --[[ Line: 704 ]]
	game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
end)
local t = {}
workspace.GameService.ResetOvenProgress.OnClientEvent:Connect(function(p1) --[[ Line: 710 | Upvalues: t (copy) ]]
	t[p1] = false
	p1.Size = UDim2.new(0, 28, 1, 0)
end)
workspace.GameService.StartOvenProgressBar.OnClientEvent:Connect(function(p1, p2) --[[ Line: 718 | Upvalues: t (copy) ]]
	t[p1] = true
	local Offset = p1.Size.X.Offset
	local sum = 0
	repeat
		if not t[p1] then
			break
		end
		sum = sum + wait(0.05)
		p1.Size = UDim2.new(sum / p2, (1 - sum / p2) * Offset, 1, 0)
	until p2 <= sum
	if t[p1] ~= false then
		return
	end
	p1.Size = UDim2.new(0, 28, 1, 0)
end)
local v14 = false
local v15 = Color3.fromRGB(89, 0, 0)
local v16 = Color3.fromRGB(255, 0, 0)
workspace.GameService.SetAlarmEnabled.OnClientEvent:Connect(function(p1) --[[ Line: 737 | Upvalues: v14 (ref), v15 (copy), v16 (copy) ]]
	if v14 == p1 then
		return
	end
	v14 = p1
	if p1 then
		local sum = 0
		while p1 do
			wait(0.05)
			sum = sum + 0.1
			workspace.Alarm.Alarm.Color = v15:Lerp(v16, sum % 0.7)
		end
		workspace.Alarm.Alarm.Color = v15
	else
		if not workspace.Alarm.Alarm:FindFirstChild("Alarm") then
			return
		end
		workspace.Alarm.Alarm.Alarm:Stop()
	end
end)
workspace.GameService.SpawnExtinguisherPart.OnClientEvent:Connect(function(p1, p2, p3, p4) --[[ Line: 762 ]]
	local Part = Instance.new("Part")
	Part.CFrame = CFrame.new(p4)
	Part.CanCollide = false
	Part.Size = Vector3.new(0.2, 0.2, 0.2)
	Part.Anchored = if p1 then false else true
	Part.Color = Color3.fromRGB(255, 255, 255)
	Part.Transparency = 0.2
	Part.TopSurface = "Smooth"
	Part.BottomSurface = "Smooth"
	local SpecialMesh = Instance.new("SpecialMesh")
	SpecialMesh.MeshType = "Sphere"
	SpecialMesh.Scale = Vector3.new(17, 17, 17)
	SpecialMesh.Parent = Part
	Part.Parent = workspace
	if p1 then
		local Weld = Instance.new("Weld")
		Weld.Name = "Weld"
		Weld.Part0 = Part
		Weld.Part1 = p1
		Weld.C0 = p2
		Weld.C1 = p3
		Weld.Parent = Part
	end
	wait(3)
	Part:Destroy()
end)
local t2 = {}
local v17 = 0
local v18 = -2
workspace.GameService.AnimateBugs.OnClientEvent:Connect(function(p1) --[[ Line: 798 | Upvalues: t2 (copy), v17 (ref), v18 (ref) ]]
	for i, v in ipairs(p1) do
		table.insert(t2, v)
	end
	if #t2 ~= #p1 then
		v17 = 0
		return
	end
	while #t2 > 0 do
		wait(0.05)
		v17 = v17 + v18
		for i, v in ipairs(t2) do
			if v and (v.Parent and (v.Parent.Parent.Parent.Parent and v.ImageColor3 ~= Color3.fromRGB(31, 31, 31))) then
				v.Rotation = v.Rotation + v18
			else
				table.remove(t2, i)
				break
			end
		end
		if v17 == 20 then
			v18 = -2
			continue
		end
		if v17 ~= -20 then
			continue
		end
		v18 = 2
	end
	v17 = 0
end)
spawn(function() --[[ Line: 844 | Upvalues: LocalPlayer_2 (copy) ]]
	local v1_2
	while true do
		for i, v1_2 in ipairs(workspace.Houses:GetChildren()) do
			if v1_2:FindFirstChild("Owner") and v1_2.Owner.Value == LocalPlayer_2 then
				_G.House = v1_2
				return
			end
		end
		wait(0.1)
	end
	_G.House = v1_2
end)
local v19 = LocalPlayer_2:GetMouse()
local v20 = nil
_G.ClickDetectorsDisabled = false
game:GetService("UserInputService").InputBegan:Connect(function(p1, p2) --[[ Line: 862 | Upvalues: v19 (copy), v20 (ref) ]]
	if p2 or (_G.ClickDetectorsDisabled or p1.UserInputType ~= Enum.UserInputType.Touch and (p1.UserInputType ~= Enum.UserInputType.MouseButton1 and (p1.UserInputType ~= Enum.UserInputType.Gamepad1 or p1.KeyCode ~= Enum.KeyCode.ButtonR2))) then
		return
	end
	if not (v19 and v19.Target) then
		return
	end
	v20 = v19.Target:FindFirstChild("ClickDetector") or (v19.Target.Parent:FindFirstChild("ClickDetector") or v19.Target.Parent.Parent:FindFirstChild("ClickDetector"))
end)
game:GetService("UserInputService").InputEnded:Connect(function(p1, p2) --[[ Line: 873 | Upvalues: v19 (copy), v20 (ref), LocalPlayer_2 (copy) ]]
	if p2 or (_G.ClickDetectorsDisabled or p1.UserInputType ~= Enum.UserInputType.Touch and (p1.UserInputType ~= Enum.UserInputType.MouseButton1 and (p1.UserInputType ~= Enum.UserInputType.Gamepad1 or p1.KeyCode ~= Enum.KeyCode.ButtonR2))) then
		return
	end
	if not (v19 and v19.Target) then
		return
	end
	local v1 = v19.Target:FindFirstChild("ClickDetector") or (v19.Target.Parent:FindFirstChild("ClickDetector") or v19.Target.Parent.Parent:FindFirstChild("ClickDetector"))
	if v20 == nil or (v1 ~= v20 or not (LocalPlayer_2:DistanceFromCharacter(v19.Hit.p) <= v1.Value)) then
		return
	end
	if v20:FindFirstChild("Detector") then
		if v20.Detector:IsA("RemoteEvent") then
			v20.Detector:FireServer()
		else
			v20.Detector:Fire()
		end
	else
		error("No Detector inside" .. v20.Parent)
	end
end)
local v21 = nil
spawn(function() --[[ Line: 895 | Upvalues: v1 (copy), v21 (ref) ]]
	if not v1.IsPartyServer then
		local v12 = workspace:FindFirstChild("Halloween") and workspace.Halloween:FindFirstChild("Trick-or-Treat")
		if v12 then
			v12.Name = "Trick-or-Treat"
		end
	end
	v21 = workspace:FindFirstChild("Buy")
	if not v21 or v1.IsPartyServer then
		pcall(function() --[[ Line: 908 ]] end)
		return
	end
	v21.Name = "Buy"
	pcall(function() --[[ Line: 908 ]] end)
end)
spawn(function() --[[ Line: 915 | Upvalues: v1 (copy) ]]
	if v1.IsEnglish() then
		return
	end
	if v1.IsStudio then
		return
	end
	local IsPartyServer = v1.IsPartyServer
end)
workspace.Main.HideDeliveryBike.OnClientEvent:Connect(function() --[[ Line: 947 | Upvalues: v21 (ref) ]]
	if not workspace:FindFirstChild("BuyBike") then
		return
	end
	v21.Parent = game.ReplicatedStorage
end)
local t3 = {}
function CreateProximityPrompt(p1) --[[ CreateProximityPrompt | Line: 1094 | Upvalues: t3 (copy), v2 (copy), LocalPlayer_2 (copy) ]]
	task.wait()
	if t3[p1] then
		return
	end
	if p1.Parent and (p1.Parent.Name == "PresentTable" and p1.Parent.ClassName == "Script") then
		return
	end
	t3[p1] = true
	local v1 = v2:FindFirstAncestor(p1, "ClickDetector")
	if not v1 then
		return
	end
	local ProximityPrompt = Instance.new("ProximityPrompt")
	ProximityPrompt.Enabled = p1.Value
	ProximityPrompt.RequiresLineOfSight = v1:FindFirstChild("RequiresLineOfSight") ~= nil
	ProximityPrompt.ActionText = ""
	ProximityPrompt.MaxActivationDistance = v1.Value
	ProximityPrompt.Style = Enum.ProximityPromptStyle.Custom
	ProximityPrompt.UIOffset = p1:FindFirstChild("Offset") and Vector2.new(0, p1.Offset.Value) or Vector2.new(0, 0)
	ProximityPrompt.Triggered:Connect(function() --[[ Line: 1112 | Upvalues: v1 (copy) ]]
		if v1.Detector:IsA("RemoteEvent") then
			v1.Detector:FireServer()
		else
			v1.Detector:Fire()
		end
	end)
	ProximityPrompt.Parent = p1.Parent
	if p1:FindFirstChild("OwnerOnly") then
		ProximityPrompt.Enabled = p1.Value and (if p1.OwnerOnly.Value == LocalPlayer_2 then true else false)
		p1.OwnerOnly:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1124 | Upvalues: ProximityPrompt (copy), p1 (copy), LocalPlayer_2 (ref) ]]
			ProximityPrompt.Enabled = p1.Value and p1.OwnerOnly.Value == LocalPlayer_2
		end)
	end
	p1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1129 | Upvalues: ProximityPrompt (copy), p1 (copy) ]]
		ProximityPrompt.Enabled = p1.Value
	end)
	v1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1134 | Upvalues: ProximityPrompt (copy), v1 (copy) ]]
		ProximityPrompt.MaxActivationDistance = v1.Value
	end)
end
for i, v in ipairs(workspace:GetDescendants()) do
	if v.Name == "MobileTouchDetector" and not t3[v] then
		spawn(function() --[[ Line: 1144 | Upvalues: v (copy) ]]
			CreateProximityPrompt(v)
		end)
	end
end
for i, v in ipairs(v2:GetContainers()) do
	v.DescendantAdded:Connect(function(p1) --[[ Line: 1152 ]]
		if not p1:IsA("Sound") or p1.SoundGroup ~= nil then
			return
		end
		p1.SoundGroup = game.SoundService.SoundEffects
	end)
	for i2, v22 in ipairs(v:GetDescendants()) do
		if v22:IsA("Sound") and v22.SoundGroup == nil then
			v22.SoundGroup = game.SoundService.SoundEffects
		end
	end
end
workspace.DescendantAdded:Connect(function(p1) --[[ Line: 1165 ]]
	if p1.Name ~= "MobileTouchDetector" then
		return
	end
	CreateProximityPrompt(p1)
end)
local v22 = false
local function PlaceSticker(p1, p2) --[[ PlaceSticker | Line: 1344 | Upvalues: StickerDatabase (copy), v19 (copy), CurrentCamera (copy), LocalPlayer_2 (copy), v1 (copy), v4 (copy) ]]
	if not _G.SelectedStickerIndex then
		workspace.MessageService.ShowHint.ShowHint:Fire("Choose a sticker", 2)
		return
	end
	local v12 = StickerDatabase[_G.SelectedStickerIndex]
	local v2 = Vector2.new(v19.X, v19.Y)
	local v3 = CurrentCamera:ScreenPointToRay(v2.X, v2.Y)
	local v5, v6, v7, _ = workspace:FindPartOnRayWithIgnoreList(Ray.new(v3.Origin, v3.Direction * 40), {
		LocalPlayer_2.Character,
		workspace.Cars,
		workspace.Trucks,
		workspace.PizzaPlaceDoors,
		workspace.Stickers
	})
	if not (v5 and string.match(v5.Name, "Wall")) then
		return
	end
	if v5.Parent ~= workspace and (v5.Parent.Parent.Parent:FindFirstChild("Owner") and v5.Parent.Parent.Parent.Owner.Value ~= LocalPlayer_2) then
		return
	end
	local v8 = v12.SizeAdjustment or 1
	local Part = Instance.new("Part")
	Part.Anchored = true
	Part.CanCollide = false
	Part.CanTouch = false
	Part.CanQuery = false
	Part.Locked = true
	Part.Transparency = 1
	Part.Size = Vector3.new(3.85 * v8, 5 * v8, 0.1)
	Part.CFrame = CFrame.new(v6, v6 + v7)
	Part.Color = v1.CapsuleTypeToColor[v12.Rarity]
	local list = {}
	for i = -1, 1, 2 do
		for j = -1, 1, 2 do
			local v122 = Part.CFrame:pointToWorldSpace((Vector3.new(Part.Size.X / 2 * j, Part.Size.Y / 2 * i, 0)))
			local Part_2 = Instance.new("Part")
			Part_2.Anchored = true
			Part_2.Transparency = 1
			Part_2.Size = Vector3.new(0.5, 0.5, 0.5)
			Part_2.Parent = workspace
			Part_2.CFrame = CFrame.new(v122)
			table.insert(list, Part_2)
			if #Part_2:GetTouchingParts() == 0 then
				for i2, v in ipairs(list) do
					v:Destroy()
				end
				Part:Destroy()
				return
			end
		end
	end
	for i, v in ipairs(list) do
		v:Destroy()
	end
	Part.Parent = workspace
	local Decal = Instance.new("Decal")
	Decal.Texture = "rbxassetid://" .. v12.ImageId
	Decal.Color3 = Color3.fromRGB(255, 255, 255)
	Decal.Parent = Part
	if StickerDatabase[_G.SelectedStickerIndex].OutlineImage then
		local Decal_2 = Instance.new("Decal")
		Decal_2.Texture = "rbxassetid://" .. v12.OutlineImage
		Decal_2.Parent = Part
	end
	local Attachment = Instance.new("Attachment")
	Attachment.Parent = Part
	local v13 = nil
	pcall(function() --[[ Line: 1428 | Upvalues: v13 (ref), LocalPlayer_2 (ref) ]]
		v13 = LocalPlayer_2.Character.RightHand.RightGripAttachment
	end)
	if v13 == nil then
		pcall(function() --[[ Line: 1430 | Upvalues: v13 (ref), LocalPlayer_2 (ref) ]]
			v13 = LocalPlayer_2.Character["Right Arm"].RightGripAttachment
		end)
	end
	local v14
	if v13 then
		local Beam = Instance.new("Beam")
		Beam.LightInfluence = 0
		Beam.CurveSize0 = 0
		Beam.CurveSize1 = 0
		Beam.Width1 = 0
		Beam.Width0 = 0.1
		Beam.Transparency = NumberSequence.new(0, 0.5)
		Beam.FaceCamera = true
		Beam.Attachment0 = v13
		Beam.Attachment1 = Attachment
		Beam.Color = ColorSequence.new(v1.CapsuleTypeToColor[v12.Rarity])
		Beam.Parent = workspace
		game:GetService("TweenService"):Create(Beam, TweenInfo.new(0.27, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
			Width1 = 3
		}):Play()
		v14 = Beam
	else
		v14 = nil
	end
	local Size = Part.Size
	Part.Size = Vector3.new(0.1, 0.1, 0.1)
	game:GetService("TweenService"):Create(Part, TweenInfo.new(0.27, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Size = Size
	}):Play()
	v4:PlaySound("Sticker")
	wait(0.27)
	workspace.Main.PlaceSticker:FireServer(v5, v6, v7, _G.SelectedStickerIndex)
	workspace.Main.PlaceSticker.OnClientEvent:Wait()
	wait(0.1)
	if v14 then
		v14:Destroy()
	end
	Attachment:Destroy()
	Part:Destroy()
end
local v23 = nil
local v24 = nil
local v25 = nil
local StickerIcon = MainGui:WaitForChild("Other"):WaitForChild("StickerIcon")
local v26 = nil
local v27 = false
local function StickerPlacementMode(p1) --[[ StickerPlacementMode | Line: 1482 | Upvalues: v27 (ref), v8 (copy), v25 (ref), v22 (ref), PlaceSticker (copy), v19 (copy), StickerIcon (copy), v24 (ref), CurrentCamera (copy), v23 (ref) ]]
	v27 = p1
	if p1 then
		if v8 then
			v25 = game:GetService("UserInputService").TouchTap:connect(function(p1, p2) --[[ Line: 1491 | Upvalues: v22 (ref), PlaceSticker (ref), v19 (ref) ]]
				if v22 then
					return
				end
				v22 = true
				delay(0.3, function() --[[ Line: 1496 | Upvalues: v22 (ref) ]]
					v22 = false
				end)
				PlaceSticker(v19.X, v19.Y)
			end)
		else
			v19.TargetFilter = workspace.PizzaPlaceDoors
			StickerIcon.Visible = true
			v24 = v19.Move:connect(function() --[[ Line: 1510 | Upvalues: v19 (ref), CurrentCamera (ref), StickerIcon (ref) ]]
				if v19 and (v19.Target and (v19.Target.Parent and (_G.SelectedStickerIndex and ((v19.Hit.p - CurrentCamera.CFrame.Position).magnitude < 40 and string.match(v19.Target.Name, "Wall"))))) or v19.Target.Name == "Sticker" then
					StickerIcon.Position = UDim2.new(0, v19.X, 0, v19.Y)
				else
					StickerIcon.Position = UDim2.new(0, -32, 0, -32)
				end
			end)
			v23 = v19.Button1Down:connect(function() --[[ Line: 1517 | Upvalues: v22 (ref), v19 (ref), PlaceSticker (ref) ]]
				if v22 or not (v19 and (v19.Target and v19.Target.Parent)) then
					return
				end
				v22 = true
				delay(0.3, function() --[[ Line: 1520 | Upvalues: v22 (ref) ]]
					v22 = false
				end)
				PlaceSticker(v19.X, v19.Y)
			end)
		end
	else
		if v23 then
			v23:disconnect()
			v24:disconnect()
			StickerIcon.Visible = false
		end
		if not v25 then
			return
		end
		v25:disconnect()
	end
end
local v28 = v7.new()
function ChildRemoved(p1) --[[ ChildRemoved | Line: 1561 | Upvalues: v28 (copy) ]]
	v28:DoCleaning()
end
local v29 = nil
local function ChildAdded(p1) --[[ ChildAdded | Line: 1567 | Upvalues: v29 (ref), LocalPlayer_2 (copy), v26 (ref), v27 (ref), v23 (ref), v24 (ref), StickerIcon (copy), v25 (ref), StickerPlacementMode (copy) ]]
	if p1.Name ~= "StickerTool" then
		return
	end
	if v29 and v29.Parent == LocalPlayer_2.Character then
		v26:disconnect()
		v27 = false
		if v23 then
			v23:disconnect()
			v24:disconnect()
			StickerIcon.Visible = false
		end
		if v25 then
			v25:disconnect()
		end
		v29:Destroy()
		v29 = nil
	end
	if not v27 then
		StickerPlacementMode(true)
	end
	v29 = p1
	v26 = p1.Unequipped:connect(function() --[[ Line: 1624 | Upvalues: v26 (ref), v27 (ref), v23 (ref), v24 (ref), StickerIcon (ref), v25 (ref), v29 (ref), p1 (copy) ]]
		v26:disconnect()
		v27 = false
		if v23 then
			v23:disconnect()
			v24:disconnect()
			StickerIcon.Visible = false
		end
		if not v25 then
			v29 = nil
			wait()
			p1:Destroy()
			return
		end
		v25:disconnect()
		v29 = nil
		wait()
		p1:Destroy()
	end)
end
local v30 = false
LocalPlayer_2.CharacterAdded:connect(function(p1) --[[ Line: 1635 | Upvalues: v30 (ref), ChildAdded (copy) ]]
	v30 = true
	p1.ChildAdded:connect(ChildAdded)
	p1.ChildRemoved:Connect(ChildRemoved)
end)
if not v30 and LocalPlayer_2.Character then
	LocalPlayer_2.Character.ChildAdded:connect(ChildAdded)
	LocalPlayer_2.Character.ChildRemoved:connect(ChildRemoved)
end
local list = { workspace.TheDump, workspace.PetShop }
if not (v1.IsPartyServer or v1.PlaceSettings.CloseShops) then
	if game.ReplicatedStorage.GlobalData.Holiday.Value == "Halloween" and workspace.Halloween:FindFirstChild("HalloweenShop") then
		table.insert(list, workspace.Halloween.HalloweenShop)
	end
	for i, v in ipairs(list) do
		local v31 = false
		local v32 = false
		local v33 = game.ReplicatedStorage.Zones:FindFirstChild(v.Name)
		local v34 = v:FindFirstChild(v.Name .. "Interior") or game.ReplicatedStorage:FindFirstChild(v.Name .. "Interior")
		if v33 then
			if v34 then
				if not v:FindFirstChild("Entrance") then
					error(v.Name .. " needs an entrance part")
				end
			else
				error(v.Name .. " does not have an interior")
			end
		else
			error(v.Name .. " does not have a zone")
		end
		local function WindowsVisible(p1) --[[ WindowsVisible | Line: 1677 | Upvalues: v (copy) ]]
			for i, v2 in ipairs(v:GetDescendants()) do
				if v.Name == "TheDump" or v.Name == "PetShop" then
					if v2.Name == "Window" then
						v2.Transparency = if p1 then 0 else 0.8
						continue
					end
					if v2.Name == "Entrance" then
						v2.Transparency = if p1 and game.ReplicatedStorage.GlobalData.TimeOfDay.Value == "Night" then 0 else 1
					end
					continue
				end
				if v.Name == "HalloweenShop" then
					if v2.Name == "Window" then
						v2.Transparency = if p1 then 0 else 0.8
						continue
					end
					if v2.Name == "TentEntrance1" or v2.Name == "TentEntrance2" then
						v2.Transparency = if p1 then 0 else 1
					end
				end
			end
		end
		local function EntrancePartTouched(p1) --[[ EntrancePartTouched | Line: 1696 | Upvalues: v32 (ref), LocalPlayer_2 (copy), v2 (copy), v31 (ref), v33 (copy), v (copy), v34 (copy), MainGui (copy), v4 (copy), WindowsVisible (copy) ]]
			if v32 or (not p1 or (not p1.Parent or (not p1.Parent:FindFirstChild("Humanoid") or game.Players:GetPlayerFromCharacter(p1.Parent) ~= LocalPlayer_2))) then
				return
			end
			v32 = true
			local IsPointInsideBox = v2.IsPointInsideBox
			local v1 = false
			if not v31 and (not IsPointInsideBox(v33, LocalPlayer_2.Character.HumanoidRootPart.Position) and (v.Name == "TheDump" or v.Name == "PetShop")) then
				v34.Parent = v
			end
			for i = 1, 30 do
				local v22 = IsPointInsideBox(v33, LocalPlayer_2.Character.HumanoidRootPart.Position)
				if v31 and not v22 then
					v31 = false
					v1 = true
					break
				elseif v31 or not v22 then
					wait()
				else
					v31 = true
					v1 = true
					break
				end
			end
			v32 = false
			if v1 then
				local CandyCount = MainGui:WaitForChild("Notifications"):WaitForChild("CandyCount")
				if v.Name == "HalloweenShop" then
					if v31 or LocalPlayer_2.Character:FindFirstChild("CandyBucket") then
						CandyCount.Visible = true
					else
						CandyCount.Visible = false
					end
				end
				local CurrentCamera = workspace.CurrentCamera
				if v31 then
					if v.Name == "TheDump" or v.Name == "PetShop" then
						v4:PlaySound("EntranceTone")
					end
					game:GetService("RunService"):UnbindFromRenderStep("UpdateWindows")
					game:GetService("RunService"):BindToRenderStep("UpdateWindows", Enum.RenderPriority.First.Value, function() --[[ Line: 1757 | Upvalues: IsPointInsideBox (copy), v33 (ref), CurrentCamera (copy), WindowsVisible (ref) ]]
						if not IsPointInsideBox(v33, CurrentCamera.CFrame.p) then
							return
						end
						game:GetService("RunService"):UnbindFromRenderStep("UpdateWindows")
						WindowsVisible(false)
					end)
				else
					game:GetService("RunService"):UnbindFromRenderStep("UpdateWindows")
					while not v31 and IsPointInsideBox(v33, CurrentCamera.CFrame.p) do
						wait(0.2)
					end
					if v31 then
						return
					end
					WindowsVisible(true)
				end
				v34.Parent = v31 and v or game.ReplicatedStorage
			else
				v34.Parent = v31 and v or game.ReplicatedStorage
			end
		end
		v.Entrance.Touched:connect(EntrancePartTouched)
		if v and v.Name == "TheDump" then
			v.DumpTeleportSpot.Touched:connect(EntrancePartTouched)
		end
		v34.Parent = game.ReplicatedStorage
	end
end
local function RefreshLocks() --[[ RefreshLocks | Line: 1799 | Upvalues: v9 (copy) ]]
	if not _G.UnlockedFurniture then
		return
	end
	for i, v in ipairs(v9.Displays:GetChildren()) do
		local UnlockedFurniture = _G.UnlockedFurniture
		if UnlockedFurniture[tostring(v.AssetId.Value)] or v.Rarity.Value ~= "" then
			v.Plateform.Tag.Lock.Visible = false
			if v.Rarity.Value == "" and v.Plateform.Tag.Discount.Percent.Text ~= "-0%" then
				v.Plateform.Tag.Discount.Visible = true
			end
			continue
		end
		v.Plateform.Tag.Lock.Visible = true
		v.Plateform.Tag.Discount.Visible = false
	end
end
local v35 = nil
local t4 = {}
local Assets = v9.Assets
local v36 = false
local Pop5Clone = v4:GetSoundObject("Pop5"):Clone()
Pop5Clone.Name = "Pop5Clone"
Pop5Clone.Parent = v4:GetSoundObject("Pop5").Parent
local SwishClone = v4:GetSoundObject("Swish"):Clone()
SwishClone.Name = "SwishClone"
SwishClone.Parent = v4:GetSoundObject("Swish").Parent
local function LocationChanged(p1, p2) --[[ LocationChanged | Line: 1838 | Upvalues: v35 (ref), v2 (copy), v36 (ref), v1 (copy), v9 (copy), v4 (copy), t4 (ref), LocalPlayer_2 (copy), SwishClone (copy), Pop5Clone (copy) ]]
	if not v35 then
		local v12 = v2:SendData("GetActions", "PlayerChannel", 5)
		v35 = v2:Clamp(40 - (if v12 then v12.BoughtDumpItem or 0 else 0) * 2, 20, 40)
	end
	if p1 == "TheDump" and not (v36 or v1.PlaceSettings.CloseShops) then
		local v3 = v9.Displays:GetChildren()
		spawn(function() --[[ Line: 1855 | Upvalues: v36 (ref) ]]
			while v36 do
				wait(2)
			end
		end)
		v36 = true
		for i, v in ipairs(v3) do
			if v.Rarity.Value and (v.Rarity.Value == "Rare" or v.Rarity.Value == "Legendary") then
				v4:Preload("CapsuleOpening")
			end
		end
		v4:Preload("Swish")
		v4:Preload("Pop5")
		while v36 do
			for i, v in ipairs(v3) do
				if not t4[v] and (LocalPlayer_2:DistanceFromCharacter(v.Plateform.Position) < v35 and (not v.Plateform.Tag.Crown.Visible or LocalPlayer_2:FindFirstChild("VIP"))) then
					t4[v] = true
					if v.Rarity.Value and (v.Rarity.Value == "Rare" or v.Rarity.Value == "Legendary") then
						v4:PlaySound("CapsuleOpening")
						wait(0.15)
					else
						SwishClone.Pitch = SwishClone.Pitch + 0.05
						SwishClone:Play()
					end
					for i2, v5 in ipairs(v.Curtains:GetChildren()) do
						local TweenService = game:GetService("TweenService")
						local v42 = TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
						local t = {}
						t.Position = Vector3.new(v5.Position.X, v5.Position.Y + (v5.Size.Y - 3), v5.Position.Z)
						TweenService:Create(v5, v42, t):Play()
					end
					v2:SendData("CurtainUnveiled", "PlayerChannel", nil, v.Asset.Value.Name)
					if v.Asset.Value then
						v.Asset.Value:FindFirstChild("MobileTouchDetector", true).Value = true
					end
					delay(0.2, function() --[[ Line: 1900 | Upvalues: v (copy), Pop5Clone (ref) ]]
						v.Plateform.Tag.Size = UDim2.new(0, 0, 0, 0)
						game:GetService("TweenService"):Create(v.Plateform.Tag, TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
							Size = UDim2.new(6, 0, 7, 0)
						}):Play()
						v.Plateform.Tag.Enabled = true
						Pop5Clone.Pitch = Pop5Clone.Pitch + 0.1
						Pop5Clone:Play()
					end)
					break
				end
			end
			wait(0.5)
		end
	else
		v36 = false
	end
	if not (LocalPlayer_2:FindFirstChild("House") and LocalPlayer_2.House.Value) then
		return
	end
	local HouseIcon = LocalPlayer_2.House.Value.MailboxPointer.Value:FindFirstChild("HouseIcon", true)
	HouseIcon.Enabled = p1 == nil
end
workspace.Main.LocationChanged.OnClientEvent:connect(LocationChanged)
function BasementTouchTransition(p1) --[[ BasementTouchTransition | Line: 1934 | Upvalues: v2 (copy), LocalPlayer_2 (copy) ]]
	p1.Touched:connect(v2:Debounce(function(p1) --[[ Line: 1935 | Upvalues: LocalPlayer_2 (ref) ]]
		if not p1 or (not p1.Parent or (not p1.Parent:FindFirstChild("Humanoid") or game.Players:GetPlayerFromCharacter(p1.Parent) ~= LocalPlayer_2)) then
			return
		end
		local v1 = workspace.BasePlate:FindFirstChild("Texture") and workspace.BasePlate.Texture.Transparency
		print("CANCOLLIDEFALSE")
		for i, v in ipairs(workspace:GetChildren()) do
			if v.Name == "BasePlate" then
				if v:FindFirstChild("Texture") then
					v.Texture.Transparency = 1
				end
				v.Transparency = 1
				v.CanCollide = false
			end
		end
		if workspace:FindFirstChild("OceanWater") then
			workspace.OceanWater.Transparency = 1
		end
		while p1.Parent.HumanoidRootPart.Position.Y < 6 and p1.Parent.Humanoid.Health > 0 do
			print("WAITING")
			wait(0.5)
		end
		print("CANCLIDETRUE")
		for i, v in ipairs(workspace:GetChildren()) do
			if v.Name == "BasePlate" then
				if v:FindFirstChild("Texture") then
					v.Texture.Transparency = v1
				end
				v.Transparency = 0
				v.CanCollide = true
			end
		end
		if not workspace:FindFirstChild("OceanWater") then
			return
		end
		workspace.OceanWater.Transparency = 0
	end))
end
for i, v in ipairs(game:GetService("CollectionService"):GetTagged("GoingToBasement")) do
	BasementTouchTransition(v)
end
game:GetService("CollectionService"):GetInstanceAddedSignal("GoingToBasement"):Connect(function(p1) --[[ Line: 1985 ]]
	BasementTouchTransition(p1)
end)
workspace.Main.DisplayAssetIds.OnClientEvent:Connect(function() --[[ Line: 1990 ]]
	local IDDisplay = game.ReplicatedStorage.IDDisplay
	for i, v in ipairs(workspace:GetDescendants()) do
		if v.Name == "IdDisplay" then
			local Config = v.Parent.Parent:FindFirstChild("Config")
			if Config then
				if v.Parent:FindFirstChild("IDDisplay") then
					v.Parent.IDDisplay:Destroy()
				end
				local v1 = IDDisplay:Clone()
				v1.TextLabel.Text = Config.Value
				v1.Parent = v.Parent
			end
		end
	end
end)
workspace.Main.DumpInventoryChanged.OnClientEvent:connect(function() --[[ Line: 2017 | Upvalues: t4 (ref), v9 (copy) ]]
	t4 = {}
	for i, v in ipairs(v9.Displays:GetChildren()) do
		v.Plateform.Tag.Enabled = false
	end
end)
workspace.Main.ShowUnveiledCurtains.OnClientEvent:connect(function(p1) --[[ Line: 2030 | Upvalues: v9 (copy), t4 (ref) ]]
	delay(1, function() --[[ Line: 2032 | Upvalues: v9 (ref), p1 (copy), t4 (ref) ]]
		for i, v in ipairs(v9.Displays:GetChildren()) do
			if v.Asset.Value.Name == p1 then
				for i2, v2 in ipairs(v.Curtains:GetChildren()) do
					v2.Position = Vector3.new(v2.Position.X, v2.Position.Y + (v2.Size.Y - 3), v2.Position.Z)
					v.Plateform.Tag.Enabled = true
					if v.Asset.Value and v.Asset.Value:FindFirstChild("MobileTouchDetector", true) then
						v.Asset.Value:FindFirstChild("MobileTouchDetector", true).Value = true
					end
					t4[v] = true
				end
			end
		end
	end)
end)
workspace.Main.ShowSoldOut.OnClientEvent:connect(function(p1) --[[ Line: 2050 | Upvalues: Assets (copy) ]]
	while #Assets:GetChildren() == 0 do
		wait(2)
	end
	if not p1 then
		return
	end
	local v1 = Assets:FindFirstChild(p1)
	if not v1 then
		return
	end
	local Plateform = v1.Display.Value.Plateform
	Plateform.Tag.Enabled = false
	if v1:IsA("Model") then
		v1:ClearAllChildren()
	else
		v1:ClearAllChildren()
		v1.Transparency = 1
	end
	local v2 = game.ReplicatedStorage.SoldOut:clone()
	v2.Parent = v1
	v2:SetPrimaryPartCFrame(Plateform.CFrame + Vector3.new(0, v2.PrimaryPart.Size.Y / 2 + Plateform.Size.Y / 2, 0))
end)
if not (v1.IsPartyServer or v1.PlaceSettings.GearsDisabled) then
	task.spawn(function() --[[ Line: 2082 | Upvalues: v2 (copy), LocalPlayer_2 (copy), v1 (copy) ]]
		local v12 = v2:SendData("GetGamePasses", "PlayerChannel", 10) or {}
		if not v12.PontoonBoat then
			local DisplayBoat = game.ReplicatedStorage.DisplayBoat
			DisplayBoat.Parent = workspace
			DisplayBoat.Driverr:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 2089 | Upvalues: DisplayBoat (copy), LocalPlayer_2 (ref) ]]
				if not workspace:FindFirstChild(DisplayBoat.Name) then
					return
				end
				local Occupant = workspace[DisplayBoat.Name].Driverr.Occupant
				if not Occupant or game.Players:GetPlayerFromCharacter(Occupant.Parent) ~= LocalPlayer_2 then
					return
				end
				workspace.Main.ShowGamePassPrompt:Fire("PontoonBoat")
			end)
		end
		if not v12.HangGlider then
			local HangGliderGamepass = game.ReplicatedStorage.HangGliderGamepass
			HangGliderGamepass.Parent = workspace
			HangGliderGamepass.ClickDetector.Detector.Event:connect(function() --[[ Line: 2102 | Upvalues: LocalPlayer_2 (ref), v1 (ref) ]]
				game:GetService("MarketplaceService"):PromptGamePassPurchase(LocalPlayer_2, v1.GamePasses.HangGlider.ProductId)
			end)
		end
		if v12.ManagerTeleport then
			return
		end
		local ManagerGamepass = game.ReplicatedStorage.ManagerGamepass
		ManagerGamepass.Parent = workspace
		ManagerGamepass.ClickDetector.Detector.Event:connect(function() --[[ Line: 2111 ]]
			workspace.Main.ShowGamePassPrompt:Fire("ManagerTeleport")
		end)
	end)
end
local v37 = nil
local v38 = nil
workspace.Main.LoadIgloo.OnClientEvent:connect(function(p1) --[[ Line: 2125 | Upvalues: v37 (ref), v38 (ref), LocalPlayer_2 (copy) ]]
	p1.Parent = workspace
	task.wait(0.5)
	v37 = p1
	v38 = p1.DoorInside.Touched:connect(function(p12) --[[ Line: 2130 | Upvalues: LocalPlayer_2 (ref), v38 (ref), p1 (copy) ]]
		if not p12 or (not p12.Parent or (not p12.Parent:FindFirstChild("Humanoid") or p12.Parent.Name ~= LocalPlayer_2.Name)) then
			return
		end
		v38:Disconnect()
		local v1 = p1.Parent and p1.CorispondingModel.Value and p1.CorispondingModel.Value.ReturnSpawn or workspace.StreetMiddle
		p12.Parent.HumanoidRootPart.CFrame = v1.CFrame + Vector3.new(math.random(-300, 300) / 100, 3, math.random(-300, 300) / 100)
		p1.Parent = game.ReplicatedStorage
	end)
end)
local TeleportService = game:GetService("TeleportService")
local TeleportGui = game.ReplicatedStorage:WaitForChild("TeleportGui")
TeleportService:SetTeleportGui(TeleportGui)
workspace.Main.Teleporting.OnClientEvent:connect(function(p1) --[[ Line: 2145 | Upvalues: TeleportGui (copy), LocalPlayer_2 (copy) ]]
	TeleportGui.Parent = LocalPlayer_2:WaitForChild("PlayerGui")
	local count = 1
	while true do
		wait(1)
		count = count + 1
		local _, v1 = math.modf(count / 3)
		TeleportGui.Black.TextLabel.Text = "Loading" .. string.rep(".", v1 * 3)
	end
end)
function Smooth(p1) --[[ Smooth | Line: 2156 ]]
	for i, v in ipairs(p1) do
		if v:IsA("BasePart") then
			v.Material = Enum.Material.SmoothPlastic
			if v.Name == "BasePlate" then
				v.Texture:Destroy()
				continue
			end
			if v.Name == "Floor" and v.Parent == workspace then
				v.Texture:Destroy()
			end
		end
	end
end
workspace.Main.StartSmoothMode.OnClientEvent:connect(function() --[[ Line: 2170 | Upvalues: v8 (copy), Dialog (copy) ]]
	local SavedQualityLevel = UserSettings():GetService("UserGameSettings").SavedQualityLevel
	if (SavedQualityLevel == Enum.SavedQualitySetting.Automatic or (SavedQualityLevel == Enum.SavedQualitySetting.QualityLevel1 or SavedQualityLevel == Enum.SavedQualitySetting.QualityLevel2)) and v8 then
		for i, v in ipairs({ workspace:GetDescendants(), game.ReplicatedStorage:GetDescendants() }) do
			Smooth(v)
		end
		game.ReplicatedStorage.StreamingFurnitureStorage.ChildAdded:connect(function(p1) --[[ Line: 2181 ]]
			Smooth(p1:GetDescendants())
		end)
		game:GetService("GuiService").MenuClosed:connect(function() --[[ Line: 2186 | Upvalues: SavedQualityLevel (ref), Dialog (ref) ]]
			SavedQualityLevel = UserSettings():GetService("UserGameSettings").SavedQualityLevel
			if SavedQualityLevel == Enum.SavedQualitySetting.Automatic or (SavedQualityLevel == Enum.SavedQualitySetting.QualityLevel1 or SavedQualityLevel == Enum.SavedQualitySetting.QualityLevel2) then
				return
			end
			Dialog:ShowMessage("Rejoin Game", "Leave the game and come back")
		end)
	end
end)
local t5 = {}
local v39 = nil
for i, v in ipairs(workspace.TelephoneRooms:GetChildren()) do
	table.insert(t5, v)
	v.Parent = game.ReplicatedStorage
	v.Guy:Destroy()
end
local t6 = {}
function StopRing(p1) --[[ StopRing | Line: 2233 | Upvalues: t6 (copy), v4 (copy), BubbleChatLocal (copy) ]]
	if t6[p1] then
		t6[p1]:Disconnect()
	end
	v4:StopSound("Telephone", p1.Base)
	BubbleChatLocal:ClearChatBubbles(p1.Dial)
	p1.Dial.MobileTouchDetector.Value = false
end
local t7 = {
	DoTranslation = false,
	PlayPopSound = false
}
local function StartRing(p1) --[[ StartRing | Line: 2253 | Upvalues: v2 (copy), LocalPlayer_2 (copy), v4 (copy), BubbleChatLocal (copy), t7 (copy), t6 (copy) ]]
	if not v2.IsPointInsideBox(game.ReplicatedStorage.LibraryResources.SoundFXResources.SoundZones.Cashier, LocalPlayer_2.Character.HumanoidRootPart.Position) then
		return
	end
	local v1 = v4:PlaySound("Telephone", p1.Base)
	local v22 = 0
	p1.Dial.MobileTouchDetector.Value = true
	local function ringer(p1) --[[ ringer | Line: 2262 | Upvalues: BubbleChatLocal (ref), t7 (ref) ]]
		BubbleChatLocal:ShowChatBubbleLocal(p1.Dial, "\240\159\142\181", t7)
		local v1 = true
		local Base = p1.Base
		local v2 = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 2269 | Upvalues: Base (copy), v1 (ref) ]]
			Base.CFrame = Base.CFrame * CFrame.Angles(math.rad(if v1 then -10 else 10), 0, 0)
			v1 = not v1
		end)
		delay(1.5, function() --[[ Line: 2274 | Upvalues: v2 (ref), Base (copy) ]]
			v2:disconnect()
			Base.CFrame = Base.CFrame + Vector3.new(0, 0.3, 0)
		end)
	end
	if t6[p1] then
		t6[p1]:Disconnect()
	end
	t6[p1] = v1.DidLoop:Connect(function() --[[ Line: 2284 | Upvalues: v22 (ref), p1 (copy), ringer (copy) ]]
		v22 = v22 + 1
		if v22 == 5 then
			StopRing(p1)
		else
			ringer(p1)
		end
	end)
	ringer(p1)
end
local t8 = {}
local t9 = {}
for i, v in ipairs(game.ReplicatedStorage.LODLow:GetChildren()) do
	t8[game.ReplicatedStorage.LODReigons[v.Name]] = v
	v.Parent = workspace
end
for i, v in ipairs(game.ReplicatedStorage.LODHigh:GetChildren()) do
	t9[game.ReplicatedStorage.LODReigons[v.Name]] = v
end
spawn(function() --[[ Line: 2314 | Upvalues: LocalPlayer_2 (copy), v1 (copy) ]]
	local v12 = workspace.Main.List.OnClientEvent:Wait()
	if not v12 then
		return
	end
	v12.SelfieMode = true
	v12.IngameCatalog = true
	LocalPlayer_2.PlayerGui.ChildAdded:Connect(function(p1) --[[ Line: 2319 | Upvalues: v12 (copy), v1 (ref) ]]
		task.wait(1e-6)
		if not p1:IsA("ScreenGui") or v12[p1.Name] then
			return
		end
		if v1.IsStudio then
			task.spawn(function() --[[ Line: 2323 | Upvalues: p1 (copy) ]]
				error("DELETED SCREENGUI " .. p1.Name)
			end)
		end
		p1:Destroy()
	end)
end)
local function onSetHighLODRegionVisible(p1, p2) --[[ onSetHighLODRegionVisible | Line: 2335 | Upvalues: t9 (copy), t8 (copy) ]]
	if not (t9[p1] and t8[p1]) then
		return
	end
	if p2 then
		t8[p1].Parent = game.ReplicatedStorage.LODLow
		t9[p1].Parent = workspace
		return
	end
	if p2 then
		return
	end
	t8[p1].Parent = workspace
	t9[p1].Parent = game.ReplicatedStorage.LODHigh
end
workspace.GameService.SetHighLODRegionVisible.OnClientEvent:Connect(onSetHighLODRegionVisible)
workspace.GameService.SetHighLODRegionVisible.SetHighLODRegionVisible.Event:Connect(onSetHighLODRegionVisible)
workspace.GameService.StopPhoneRing.OnClientEvent:Connect(function(p1) --[[ Line: 2351 ]]
	StopRing(p1)
end)
workspace.GameService.StartRinging.OnClientEvent:Connect(function(p1) --[[ Line: 2356 | Upvalues: StartRing (copy) ]]
	StartRing(p1)
end)
workspace.GameService.ShowTelephoneRoom.OnClientEvent:Connect(function(p1, p2) --[[ Line: 2360 | Upvalues: v39 (ref), CurrentCamera (copy) ]]
	if not v39 then
		v39 = p1
		p1.Parent = workspace
		CurrentCamera.CameraType = "Scriptable"
		CurrentCamera.CFrame = p1.Camera.CFrame
		wait(1)
		workspace.Main.StartConversation:Fire(p2.Head)
		return
	end
	v39.Parent = game.ReplicatedStorage
	v39 = p1
	p1.Parent = workspace
	CurrentCamera.CameraType = "Scriptable"
	CurrentCamera.CFrame = p1.Camera.CFrame
	wait(1)
	workspace.Main.StartConversation:Fire(p2.Head)
end)
for i, v in ipairs(LocalPlayer_2.PlayerGui.Objects:GetChildren()) do
	v.Parent = v.Destination.Value
end
LocalPlayer_2.PlayerGui.Objects.ChildAdded:Connect(function(p1) --[[ Line: 2379 ]]
	wait()
	p1.Parent = p1.Destination.Value
end)
if workspace:FindFirstChild("Flap5") then
	function FlapTouched(p1) --[[ FlapTouched | Line: 2389 | Upvalues: LocalPlayer_2 (copy), v4 (copy) ]]
		if not (p1 and p1.Parent) then
			return
		end
		local v1 = p1.Parent:FindFirstChild("HumanoidRootPart") or p1.Parent.Parent:FindFirstChild("HumanoidRootPart")
		if not v1 or game.Players:GetPlayerFromCharacter(p1.Parent) ~= LocalPlayer_2 then
			return
		end
		v4:PlaySoundInsideZone("Incorrect", "Boxer")
		v1.AssemblyLinearVelocity = Vector3.new(0, 50, 300)
	end
	workspace.Flap5.Touched:Connect(FlapTouched)
	workspace.Flap6.Touched:Connect(FlapTouched)
end
task.spawn(function() --[[ Line: 2402 | Upvalues: v1 (copy), v2 (copy), LocalPlayer_2 (copy) ]]
	if v1.IsPartyServer then
		return
	end
	if not workspace:FindFirstChild("JobButtons") then
		return
	end
	local v12 = workspace.JobButtons:GetChildren()
	for i, v in ipairs(v12) do
		v.Touched:Connect(function(p1) --[[ Line: 2419 | Upvalues: v2 (ref), LocalPlayer_2 (ref), v (copy) ]]
			if LocalPlayer_2 ~= v2:GetPlayerFromBodyPart(p1) then
				return
			end
			v2:SendData("ChangeJob", "PlayerChannel", nil, v.Name)
		end)
	end
	LocalPlayer_2:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 2427 | Upvalues: LocalPlayer_2 (ref), v12 (copy) ]]
		local v1 = LocalPlayer_2.Team.Name
		for i, v in ipairs(v12) do
			v.Parent = v.Name ~= v1 and workspace.JobButtons or game.ReplicatedStorage
		end
	end)
end)
delay(if v1.IsStudio then 4 else 0, function() --[[ Line: 2437 | Upvalues: v1 (copy), v2 (copy) ]]
	for k, v in pairs(v1.Moneyz) do
		v.Amount = v2:Round(v.Amount * game.ReplicatedStorage.CoinPriceMultiplier.Value, 10)
		v.Name = v1.FormatNumber("Int", v.Amount)
	end
end)
function SetRating(p1) --[[ SetRating | Line: 2448 | Upvalues: LocalPlayer_2 (copy) ]]
	if not (LocalPlayer_2.Character and LocalPlayer_2.Character:FindFirstChild("HumanoidRootPart")) then
		return
	end
	local Stars = LocalPlayer_2.Character.HumanoidRootPart.StarRating.Stars
	Stars.One.Image = if p1 >= 1 then "rbxassetid://9971953193" else "rbxassetid://9971952827"
	Stars.Two.Image = if p1 >= 2 then "rbxassetid://9971953193" else "rbxassetid://9971952827"
	Stars.Three.Image = if p1 == 3 then "rbxassetid://9971953193" else "rbxassetid://9971952827"
end
function RatingChanged(p1, p2) --[[ RatingChanged | Line: 2461 | Upvalues: LocalPlayer_2 (copy) ]]
	if not (LocalPlayer_2.Character and LocalPlayer_2.Character:FindFirstChild("HumanoidRootPart")) then
		return
	end
	local StarRating = LocalPlayer_2.Character.HumanoidRootPart.StarRating
	StarRating.Enabled = true
	SetRating(p1)
	task.wait(1.5)
	SetRating(p2)
	StarRating.Stars.PayChange.Text = if p1 < p2 then "Pay Increased!" else "Pay Decreased"
	StarRating.Stars.PayChange.TextColor3 = p1 < p2 and Color3.fromRGB(38, 255, 0) or Color3.fromRGB(255, 0, 0)
	StarRating.Stars.PayChange.TextStrokeColor3 = p1 < p2 and Color3.fromRGB(0, 80, 13) or Color3.fromRGB(80, 16, 16)
	StarRating.Stars.PayChange.Visible = true
	task.wait(2.5)
	StarRating.Stars.PayChange.Visible = false
	StarRating.Enabled = false
end
local t10 = {}
function ManagerProximityPromptsEnabled(p1) --[[ ManagerProximityPromptsEnabled | Line: 2485 | Upvalues: LocalPlayer_2 (copy), t10 (ref), GuiManager (copy) ]]
	if p1 then
		local function AddTrigger(p1) --[[ AddTrigger | Line: 2488 | Upvalues: LocalPlayer_2 (ref), t10 (ref), GuiManager (ref) ]]
			local v1 = game.Players:GetPlayerFromCharacter(p1.Parent.Parent)
			if v1 == LocalPlayer_2 then
				p1.Enabled = false
			else
				p1.Enabled = true
				local function f3(p1) --[[ Line: 2492 | Upvalues: LocalPlayer_2 (ref), v1 (copy), GuiManager (ref) ]]
					if p1 ~= LocalPlayer_2 then
						return
					end
					game.Players.LocalPlayer.PlayerGui.Gui.ManagerPowers.Current_Player.Value = v1
					GuiManager:GetWindowDataByName("ManagerPowers"):SetVisible(true)
				end
				table.insert(t10, p1.Triggered:Connect(f3))
			end
		end
		for i, v in ipairs(game:GetService("CollectionService"):GetTagged("ManagerProxy")) do
			AddTrigger(v)
		end
		game:GetService("CollectionService"):GetInstanceAddedSignal("ManagerProxy"):Connect(AddTrigger)
	else
		for i, v in ipairs(t10) do
			v:Disconnect()
		end
		t10 = {}
		for i, v in ipairs(game:GetService("CollectionService"):GetTagged("ManagerProxy")) do
			v.Enabled = false
		end
	end
end
pcall(function() --[[ Line: 2521 | Upvalues: GuiManager (copy) ]]
	workspace.MorphProxy.ProximityPrompt.Triggered:Connect(function(p1) --[[ Line: 2522 | Upvalues: GuiManager (ref) ]]
		GuiManager:GetWindowDataByName("Morph"):SetVisible(true)
	end)
end)
local v42 = nil
function ShowLevel(p1) --[[ ShowLevel | Line: 2528 | Upvalues: v42 (ref) ]]
	if v42 then
		v42.Parent = game.ReplicatedStorage
	end
	if p1 == workspace then
		v42 = nil
		return
	end
	p1.Parent = workspace
	for i, v in ipairs(p1:GetChildren()) do
		if v:IsA("LocalScript") then
			v.Parent = game.Players.LocalPlayer.PlayerScripts
		end
	end
	v42 = p1
end
local t11 = {
	Tail1 = true,
	Tail2 = true,
	Tail3 = true
}
local v43 = false
function ConnectRatTeleporter(p1) --[[ ConnectRatTeleporter | Line: 2547 | Upvalues: v43 (ref), t11 (copy), v2 (copy), v4 (copy), v6 (copy) ]]
	if not (p1 and (p1.Parent and p1.TeleportTo.Value)) then
		return
	end
	p1.TeleportTo.Value.Transparency = 1
	p1.TeleportTo.Value.CanCollide = false
	p1.Touched:Connect(function(p12) --[[ Line: 2551 | Upvalues: v43 (ref), t11 (ref), p1 (copy), v2 (ref), v4 (ref), v6 (ref) ]]
		if v43 or (not p12 or (t11[p12.Name] or (not p12.Parent or (not p12.Parent:FindFirstChild("Humanoid") or p12.Parent:GetAttribute("CharacterType") ~= "Rat")))) then
			return
		end
		local v1 = game.Players:GetPlayerFromCharacter(p12.Parent)
		if not v1 or v1 ~= game.Players.LocalPlayer then
			return
		end
		v43 = true
		delay(0.5, function() --[[ Line: 2556 | Upvalues: v43 (ref) ]]
			v43 = false
		end)
		ShowLevel(p1.TeleportTo.Value.Parent)
		v2:TeleportHumanoid(p12.Parent.Humanoid, p1.TeleportTo.Value)
		workspace.Main.RealignCamera.RealignCamera:Fire(20, 8)
		if p1.Name ~= "Cheese" then
			return
		end
		p12.Parent.Humanoid.WalkSpeed = 13
		p12.Parent.Humanoid.HipHeight = 0.38
		p12.Parent.Humanoid.JumpHeight = 6
		v4:PlaySound("Tada2")
		workspace.GameService.BannerMessage.BannerMessage:Fire("Got Cheese!")
		v6:FireServer("GotCheese")
	end)
end
for i, v in ipairs(game:GetService("CollectionService"):GetTagged("RatHoleTeleporter")) do
	ConnectRatTeleporter(v)
end
local t12 = {
	RatNest = true,
	SpeedRun = true
}
workspace.Main.LocationChanged.OnClientEvent:connect(function(p1, p2) --[[ Line: 2595 | Upvalues: v42 (ref), t12 (copy) ]]
	if not v42 or p1 ~= nil and t12[p1] then
		return
	end
	v42.Parent = game.ReplicatedStorage
end)
if not v1.IsPartyServer then
	task.spawn(function() --[[ Line: 2616 | Upvalues: LocalPlayer_2 (copy), v2 (copy) ]]
		local Leaderboards = game.ReplicatedStorage.Leaderboards
		local Leaderboards_2 = workspace.Leaderboards
		Leaderboards:WaitForChild("MostOrders")
		task.wait(2)
		local t = { Leaderboards_2.MostCoinsWeekly, Leaderboards_2.MostLikesWeekly, Leaderboards_2.MostOrdersWeekly }
		local t2 = { Leaderboards.MostCoins, Leaderboards.MostLikes, Leaderboards.MostOrders }
		LocalPlayer_2:GetAttributeChangedSignal("CoinsSpent"):Connect(function() --[[ Line: 2628 | Upvalues: Leaderboards (copy), LocalPlayer_2 (ref), Leaderboards_2 (copy) ]]
			Leaderboards.MostCoins.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("CoinsSpent") or ""
			Leaderboards_2.MostCoinsWeekly.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("CoinsSpentWeekly") or ""
		end)
		if LocalPlayer_2:GetAttribute("CoinsSpent") then
			Leaderboards.MostCoins.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("CoinsSpent") or ""
			Leaderboards_2.MostCoinsWeekly.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("CoinsSpentWeekly") or ""
		end
		LocalPlayer_2:GetAttributeChangedSignal("TotalLikeCountWeekly"):Connect(function() --[[ Line: 2638 | Upvalues: Leaderboards (copy), LocalPlayer_2 (ref), Leaderboards_2 (copy) ]]
			Leaderboards.MostLikes.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("TotalLikeCount") or ""
			Leaderboards_2.MostLikes.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("TotalLikeCountWeekly") or ""
		end)
		if LocalPlayer_2:GetAttribute("TotalLikeCountWeekly") then
			Leaderboards.MostLikes.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("TotalLikeCount") or ""
			Leaderboards_2.MostLikesWeekly.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("TotalLikeCountWeekly") or ""
		end
		LocalPlayer_2:GetAttributeChangedSignal("OrdersCompleted"):Connect(function() --[[ Line: 2648 | Upvalues: Leaderboards (copy), LocalPlayer_2 (ref), Leaderboards_2 (copy) ]]
			Leaderboards.MostOrders.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("OrdersCompleted") or ""
			Leaderboards_2.MostOrdersWeekly.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("OrdersCompletedWeekly") or ""
		end)
		local v1, _
		if not LocalPlayer_2:GetAttribute("OrdersCompleted") then
			v1 = function(p1_2, p2_2) --[[ Swap | Line: 2660 ]]
				for i2, v in ipairs(p1_2) do
					v.Parent = game.ReplicatedStorage.Leaderboards
				end
				for i2, v in ipairs(p2_2) do
					v.Parent = workspace.Leaderboards
				end
			end
			_ = function(p1_2) --[[ ButtonActivated | Line: 2670 | Upvalues: v1 (copy), t2 (copy), t (copy) ]]
				if p1_2 == "Weekly" then
					v1(t2, t)
					workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(163, 32, 23)
					workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(255, 0, 0)
				else
					v1(t, t2)
					workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(255, 0, 0)
					workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(163, 32, 23)
				end
			end
			workspace.SwapLeaderboards.Weekly.Touched:Connect(function(p1_2) --[[ Line: 2681 | Upvalues: v2 (ref), LocalPlayer_2 (ref), v1 (copy), t2 (copy), t (copy) ]]
				if v2:GetPlayerFromBodyPart(p1_2) ~= LocalPlayer_2 then
					return
				end
				v1(t2, t)
				workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(163, 32, 23)
				workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(255, 0, 0)
			end)
			workspace.SwapLeaderboards.AllTime.Touched:Connect(function(p1_2) --[[ Line: 2687 | Upvalues: v2 (ref), LocalPlayer_2 (ref), v1 (copy), t (copy), t2 (copy) ]]
				if v2:GetPlayerFromBodyPart(p1_2) ~= LocalPlayer_2 then
					return
				end
				v1(t, t2)
				workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(255, 0, 0)
				workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(163, 32, 23)
			end)
			workspace.SwapLeaderboards.AllTime.ClickDetector2.MouseClick:Connect(function(p1_2) --[[ Line: 2693 | Upvalues: LocalPlayer_2 (ref), v1 (copy), t (copy), t2 (copy) ]]
				if p1_2 ~= LocalPlayer_2 then
					return
				end
				v1(t, t2)
				workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(255, 0, 0)
				workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(163, 32, 23)
			end)
			workspace.SwapLeaderboards.Weekly.ClickDetector2.MouseClick:Connect(function(p1_2) --[[ Line: 2699 | Upvalues: LocalPlayer_2 (ref), v1 (copy), t2 (copy), t (copy) ]]
				if p1_2 ~= LocalPlayer_2 then
					return
				end
				v1(t2, t)
				workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(163, 32, 23)
				workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(255, 0, 0)
			end)
			return
		end
		Leaderboards.MostOrders.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("OrdersCompleted") or ""
		Leaderboards_2.MostOrdersWeekly.MyScore.SurfaceGui.TextLabel.Text = "Your Score: " .. LocalPlayer_2:GetAttribute("OrdersCompletedWeekly") or ""
		v1 = function(p1_2, p2_2) --[[ Swap | Line: 2660 ]]
			for i2, v in ipairs(p1_2) do
				v.Parent = game.ReplicatedStorage.Leaderboards
			end
			for i2, v in ipairs(p2_2) do
				v.Parent = workspace.Leaderboards
			end
		end
		_ = function(p1_2) --[[ ButtonActivated | Line: 2670 | Upvalues: v1 (copy), t2 (copy), t (copy) ]]
			if p1_2 == "Weekly" then
				v1(t2, t)
				workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(163, 32, 23)
				workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(255, 0, 0)
			else
				v1(t, t2)
				workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(255, 0, 0)
				workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(163, 32, 23)
			end
		end
		workspace.SwapLeaderboards.Weekly.Touched:Connect(function(p1_2) --[[ Line: 2681 | Upvalues: v2 (ref), LocalPlayer_2 (ref), v1 (copy), t2 (copy), t (copy) ]]
			if v2:GetPlayerFromBodyPart(p1_2) ~= LocalPlayer_2 then
				return
			end
			v1(t2, t)
			workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(163, 32, 23)
			workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(255, 0, 0)
		end)
		workspace.SwapLeaderboards.AllTime.Touched:Connect(function(p1_2) --[[ Line: 2687 | Upvalues: v2 (ref), LocalPlayer_2 (ref), v1 (copy), t (copy), t2 (copy) ]]
			if v2:GetPlayerFromBodyPart(p1_2) ~= LocalPlayer_2 then
				return
			end
			v1(t, t2)
			workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(255, 0, 0)
			workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(163, 32, 23)
		end)
		workspace.SwapLeaderboards.AllTime.ClickDetector2.MouseClick:Connect(function(p1_2) --[[ Line: 2693 | Upvalues: LocalPlayer_2 (ref), v1 (copy), t (copy), t2 (copy) ]]
			if p1_2 ~= LocalPlayer_2 then
				return
			end
			v1(t, t2)
			workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(255, 0, 0)
			workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(163, 32, 23)
		end)
		workspace.SwapLeaderboards.Weekly.ClickDetector2.MouseClick:Connect(function(p1_2) --[[ Line: 2699 | Upvalues: LocalPlayer_2 (ref), v1 (copy), t2 (copy), t (copy) ]]
			if p1_2 ~= LocalPlayer_2 then
				return
			end
			v1(t2, t)
			workspace.SwapLeaderboards.AllTime.Color = Color3.fromRGB(163, 32, 23)
			workspace.SwapLeaderboards.Weekly.Color = Color3.fromRGB(255, 0, 0)
		end)
	end)
end
function TrophyAwardAnimation(p1, p2, p3) --[[ TrophyAwardAnimation | Line: 2711 | Upvalues: PlayerGui (copy), v4 (copy) ]]
	local TrophyAward = PlayerGui:WaitForChild("GuiTop"):WaitForChild("TrophyAward")
	local v1 = "rbxthumb://type=Asset&id=" .. p1 .. "&w=420&h=420"
	game:GetService("ContentProvider"):PreloadAsync({ v1, TrophyAward.Sunburst })
	TrophyAward.Claim.Visible = false
	TrophyAward.Visible = true
	TrophyAward.Sunburst.Size = UDim2.new(0, 0, 0, 0)
	game:GetService("TweenService"):Create(TrophyAward.Sunburst, TweenInfo.new(0.5), {
		Size = UDim2.new(2, 0, 2, 0)
	}):Play()
	game:GetService("RunService"):BindToRenderStep("Sunburst2", Enum.RenderPriority.First.Value, function() --[[ Line: 2720 | Upvalues: TrophyAward (copy) ]]
		TrophyAward.Sunburst.Rotation = TrophyAward.Sunburst.Rotation + 1
	end)
	v4:PlaySound("CapsuleCommonOpened")
	TrophyAward.Trophy.Image = v1
	TrophyAward.Trophy.Message.Text = p2
	TrophyAward.Trophy.Description.Text = p3
	task.wait(1)
	TrophyAward.Claim.Visible = true
	if _G.GamepadEnabled then
		game:GetService("GuiService").SelectedObject = TrophyAward.Claim
	end
	TrophyAward.Claim.MouseButton1Click:Wait()
	game:GetService("RunService"):UnbindFromRenderStep("Sunburst2")
	TrophyAward.Visible = false
end
delay(5, function() --[[ Line: 2741 ]] end)
function PropmtGameInvite() --[[ PropmtGameInvite | Line: 2749 | Upvalues: LocalPlayer_2 (copy), v1 (copy) ]]
	local ExperienceInviteOptions = Instance.new("ExperienceInviteOptions")
	ExperienceInviteOptions.PromptMessage = "Earn a trophy when they join!"
	ExperienceInviteOptions.LaunchData = LocalPlayer_2.Name
	if v1.IsStudio then
		game:GetService("SocialService"):PromptGameInvite(LocalPlayer_2, ExperienceInviteOptions)
	else
		pcall(function() --[[ Line: 2757 | Upvalues: LocalPlayer_2 (ref), ExperienceInviteOptions (copy) ]]
			game:GetService("SocialService"):PromptGameInvite(LocalPlayer_2, ExperienceInviteOptions)
		end)
	end
end
if not v1.IsPartyServer then
	(workspace:FindFirstChild("Computer") or game.ReplicatedStorage:FindFirstChild("Computer")).Keyboard.ProximityPrompt.Triggered:Connect(function(p1) --[[ Line: 2766 ]]
		if p1 ~= game.Players.LocalPlayer then
			return
		end
		PropmtGameInvite()
	end)
end
local v45 = nil
local t13 = {}
v6:BindEvents({
	StarRatingChanged = RatingChanged,
	TrophyAwardAnimation = TrophyAwardAnimation,
	SetPetShopItemPrice = function(p1, p2) --[[ SetPetShopItemPrice | Line: 2815 ]]
		p1.Text = tostring(p2)
	end,
	LocalPropertyChange = function(p1, p2, p3) --[[ LocalPropertyChange | Line: 2820 ]]
		p1[p2] = p3
	end,
	RemovePaidRandomItems = function() --[[ RemovePaidRandomItems | Line: 2825 ]]
		for i, v in ipairs(game:GetService("CollectionService"):GetTagged("PaidRandomItem")) do
			if v:IsDescendantOf(workspace) then
				v:Destroy()
			end
		end
		game:GetService("CollectionService"):GetInstanceAddedSignal("PaidRandomItem"):Connect(function(p1) --[[ Line: 2831 ]]
			if not p1:IsDescendantOf(workspace) then
				return
			end
			p1:Destroy()
		end)
	end,
	ShowVIPIcon = function(p1) --[[ ShowVIPIcon | Line: 2840 ]]
		if not (p1:GetAttribute("VIPCrown") and (p1 and (p1.Parent and (p1.Character and (p1.Character:FindFirstChild("Head") and p1.Character.Head:WaitForChild("ChatBubble")))))) then
			return
		end
		p1.Character.Head.ChatBubble.Header.VIP.Visible = true
	end,
	LickingStarted = function(p1) --[[ LickingStarted | Line: 2847 | Upvalues: LocalPlayer_2 (copy), v45 (ref), v1 (copy), v6 (copy) ]]
		local Character = LocalPlayer_2.Character
		if v45 then
			v45:Disconnect()
		end
		v45 = p1.Touched:Connect(function(p1) --[[ Line: 2852 | Upvalues: Character (copy), v1 (ref), v6 (ref), v45 (ref) ]]
			if not p1 or (not p1.Parent or (p1.Parent == Character or (p1.Anchored ~= false or not v1.LickableObjects[p1.Name] and (p1.Parent.Name ~= "CustomerTemplate" and (not p1.Parent:FindFirstChild("Humanoid") or p1.Parent.Humanoid:GetState() ~= Enum.HumanoidStateType.Physics))))) then
				return
			end
			v6:FireServer("LickedBlock", Character.Tongue, p1, p1.CFrame:ToObjectSpace(Character.Tongue.CFrame))
			if not p1:FindFirstChild("CurrentDragger") then
				return
			end
			local v12 = nil
			v12 = p1.CurrentDragger:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2857 | Upvalues: p1 (copy), v12 (ref), v6 (ref) ]]
				if p1:IsDescendantOf(workspace) then
					return
				end
				v12:Disconnect()
				v6:FireServer("StopLicking")
			end)
			v45:Disconnect()
		end)
	end,
	ItemHiddenLocally = function(p1, p2) --[[ ItemHiddenLocally | Line: 2875 | Upvalues: t13 (copy) ]]
		if not t13[p1] then
			t13[p1] = p1.Parent
		end
		p1.Parent = p2 and game.ReplicatedStorage or t13[p1]
	end,
	HideShopItem = function(p1) --[[ HideShopItem | Line: 2882 ]]
		p1:Destroy()
	end,
	OwnsAnimalMorph = function() --[[ OwnsAnimalMorph | Line: 2886 ]] end,
	SpectatePlayer = function(p1) --[[ SpectatePlayer | Line: 2892 | Upvalues: CurrentCamera (copy) ]]
		CurrentCamera.CameraSubject = p1.Character.Humanoid
	end,
	StopSpectating = function() --[[ StopSpectating | Line: 2895 | Upvalues: CurrentCamera (copy), LocalPlayer_2 (copy) ]]
		CurrentCamera.CameraSubject = LocalPlayer_2.Character.Humanoid
	end,
	BecameManager = function() --[[ BecameManager | Line: 2899 ]]
		ManagerProximityPromptsEnabled(true)
	end,
	LostManagerJob = function() --[[ LostManagerJob | Line: 2902 ]]
		ManagerProximityPromptsEnabled(false)
	end,
	ShowLevel = ShowLevel,
	AnimateHighlightColor = function(p1) --[[ AnimateHighlightColor | Line: 2907 ]]
		local v1 = 1
		local v2 = nil
		v2 = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 2910 | Upvalues: p1 (copy), v2 (ref), v1 (ref) ]]
			if p1 and p1.Parent then
				v1 = v1 + 1.5
				p1.FillColor = Color3.fromHSV(v1 % 359 / 359, 1, 1)
				return
			end
			v2:Disconnect()
			v1 = v1 + 1.5
			p1.FillColor = Color3.fromHSV(v1 % 359 / 359, 1, 1)
		end)
	end
})
workspace.Main.TrophyAwardAnimation.OnClientInvoke = TrophyAwardAnimation
if v1.PlaceSettings.DisableAdvantageousFeatures then
	task.spawn(function() --[[ Line: 2926 ]]
		workspace:WaitForChild("MorphProxy"):Destroy()
		workspace:WaitForChild("DogDisplay"):Destroy()
		workspace:WaitForChild("GubbyDisplay"):Destroy()
		workspace:WaitForChild("RatDisplay"):Destroy()
	end)
end
local t14 = {
	ButtonA = "rbxassetid://663428369",
	ButtonB = "rbxassetid://663551304",
	ButtonX = "rbxassetid://808317359",
	ButtonY = "rbxassetid://687473309",
	ButtonRS = "rbxassetid://2662539289",
	ButtonLS = "rbxassetid://2478427590",
	ButtonRT = "rbxassetid://808316572",
	ButtonLT = "rbxassetid://871841926",
	ButtonRB = "rbxassetid://685454225",
	ButtonLB = "rbxassetid://685454136",
	ButtonStart = "rbxassetid://91616399978425",
	ButtonCross = "rbxassetid://99780250084449",
	ButtonCircle = "rbxassetid://89942194151145",
	ButtonSquare = "rbxassetid://101497936929440",
	ButtonTriangle = "rbxassetid://131066351690421",
	ButtonL1 = "rbxassetid://136223295603122",
	ButtonL2 = "rbxassetid://101883435541019",
	ButtonL3 = "rbxassetid://112586233055416",
	ButtonR1 = "rbxassetid://124531661617642",
	ButtonR2 = "rbxassetid://100070621442082",
	ButtonR3 = "rbxassetid://82491258169914",
	ButtonOptions = "rbxassetid://90847545044640",
	ButtonShare = "rbxassetid://120528414122278",
	ButtonTouchpad = "rbxassetid://125608887720337"
}
function Update(p1) --[[ Update | Line: 2986 | Upvalues: t14 (copy) ]]
	local v1 = p1:GetAttribute("KeyCode")
	p1.Image = t14[game:GetService("UserInputService"):GetStringForKeyCode(v1)] or game:GetService("UserInputService"):GetImageForKeyCode(v1)
	local v3 = p1:GetAttribute("Color")
	if not v3 then
		return
	end
	p1.ImageColor3 = v3
end
for i, v in ipairs(game:GetService("CollectionService"):GetTagged("GamepadButton")) do
	Update(v)
end
game:GetService("CollectionService"):GetInstanceAddedSignal("GamepadButton"):Connect(function(p1) --[[ Line: 3002 ]]
	Update(p1)
end)
local t15 = {}
local v46 = false
for i, v in ipairs(game:GetService("CollectionService"):GetTagged("OutsideDisplay")) do
	if v1.PlaceSettings.DisableAdvantageousFeatures then
		v.Parent = nil
		continue
	end
	if v:GetAttribute("EndTick") > os.time() and v:FindFirstChild("Sign") then
		t15[v.Sign.BillboardGui] = v:GetAttribute("EndTick")
		if not v46 then
			task.spawn(function() --[[ Line: 3020 | Upvalues: t15 (copy) ]]
				while true do
					task.wait(1)
					for k, v in pairs(t15) do
						local v1 = DateTime.fromUnixTimestamp(v - os.time())
						k.Countdown.Text = string.format("%02d", tonumber(v1:FormatUniversalTime("DDD", "en-us")) - 1) .. ":" .. v1:FormatUniversalTime("HH", "en-us") .. ":" .. v1:FormatUniversalTime("mm", "en-us") .. ":" .. v1:FormatUniversalTime("ss", "en-us")
					end
				end
			end)
			v46 = true
		end
	end
end