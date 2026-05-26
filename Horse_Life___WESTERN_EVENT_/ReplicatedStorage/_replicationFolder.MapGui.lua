-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("Binder")
local v4 = Sonar("Button")
local v5 = Sonar("GuiManager")
local v6 = Sonar("Maid")
local v7 = Sonar("RemoteUtils")
local v8 = Sonar("State")
local v9 = Sonar("StorageUtils")
local v10 = Sonar("PlaceTypeService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local v11 = LocalPlayer:GetMouse()
local v12 = setmetatable({}, {
	__index = function(p1, p2) --[[ __index | Line: 30 | Upvalues: PlayerGui (copy) ]]
		local MapGui = PlayerGui:WaitForChild("MapGui")
		local v1 = MapGui[p2]
		if typeof(v1) == "function" then
			return function(p1, ...) --[[ Line: 35 | Upvalues: v1 (copy), MapGui (copy) ]]
				return v1(MapGui, ...)
			end
		else
			return v1
		end
	end
})
local v13 = Sonar("Constants")
local v14 = Sonar(v9.Get("MapData"))
local Data = v14.Data
local Legend = v14.Legend
local t2 = { "Home", "MinimapMarker" }
local t3 = { "Help", "Home", "HorseSpawn", "LostItem" }
local v15 = v7.GetUnreliableRemoteEvent("ReportClientAnalyticsRemote")
local v16 = false
local zero = Vector2.zero
local Vector3Value = Instance.new("Vector3Value")
local v17 = 1
local v18 = Instance.new("NumberValue")
local v19 = v17
local v20 = nil
local t4 = {}
local v21 = v8.fromProperty(v12, "AbsoluteSize")
local v22 = v8.new(Workspace:FindFirstChild("DynamicNPCs"))
local v23 = v8.new(ReplicatedStorage:FindFirstChild("WorldStorage"))
local function worldPositionToScreenPosition(p1) --[[ worldPositionToScreenPosition | Line: 93 | Upvalues: Data (copy) ]]
	return UDim2.fromScale((p1.X - Data.xMin) / (Data.xMax - Data.xMin), (p1.Z - Data.zTop) / (Data.zBottom - Data.zTop))
end
local function createZoomThread(p1, p2) --[[ createZoomThread | Line: 102 | Upvalues: v20 (ref), v19 (ref) ]]
	return function() --[[ Line: 103 | Upvalues: v20 (ref), p1 (copy), p2 (copy), v19 (ref) ]]
		if v20 then
			v20 = task.cancel(v20)
		end
		repeat
			local v1 = task.wait()
			if p1.GuiState ~= Enum.GuiState.Press then
				break
			end
			p2(v1 * 10)
		until v19 == 5 or v19 == 1
	end
end
local t5 = {
	Reset = function() --[[ Reset | Line: 126 | Upvalues: zero (ref), v19 (ref) ]]
		zero = Vector2.zero
		v19 = 1
	end,
	ZoomIn = function(p1) --[[ ZoomIn | Line: 130 | Upvalues: v19 (ref), v20 (ref) ]]
		local function f1(p1) --[[ Line: 131 | Upvalues: v19 (ref) ]]
			v19 = v19 + 0.25 * p1
			v19 = math.clamp(v19, 1, 5)
		end
		local function f2() --[[ Line: 103 | Upvalues: v20 (ref), p1 (copy), f1 (copy), v19 (ref) ]]
			if v20 then
				v20 = task.cancel(v20)
			end
			repeat
				local v1 = task.wait()
				if p1.GuiState ~= Enum.GuiState.Press then
					break
				end
				f1(v1 * 10)
			until v19 == 5 or v19 == 1
		end
		v20 = task.spawn(f2)
	end,
	ZoomOut = function(p1) --[[ ZoomOut | Line: 139 | Upvalues: v19 (ref), v20 (ref) ]]
		local function f1(p1) --[[ Line: 140 | Upvalues: v19 (ref) ]]
			v19 = v19 - 0.25 * p1
			v19 = math.clamp(v19, 1, 5)
		end
		local function f2() --[[ Line: 103 | Upvalues: v20 (ref), p1 (copy), f1 (copy), v19 (ref) ]]
			if v20 then
				v20 = task.cancel(v20)
			end
			repeat
				local v1 = task.wait()
				if p1.GuiState ~= Enum.GuiState.Press then
					break
				end
				f1(v1 * 10)
			until v19 == 5 or v19 == 1
		end
		v20 = task.spawn(f2)
	end
}
function v12._setupGui(p1) --[[ _setupGui | Line: 150 | Upvalues: v21 (copy), v4 (copy), v12 (copy), v5 (copy) ]]
	p1:_setupLegend()
	p1:_setupMap()
	v21:subscribe(function(p12, p2) --[[ Line: 154 | Upvalues: p1 (copy) ]]
		p2:add(task.defer(function() --[[ Line: 155 | Upvalues: p1 (ref), p12 (copy) ]]
			p1.Container.UIAspectRatioConstraint.AspectRatio = p12.X / p12.Y
		end))
	end)
	v4.new(p1.Container.CloseButton, {
		Click = v12.Close
	})
	v5.AddFrame(p1.Container, {
		Blur = true,
		CloseAll = "CloseOverlay",
		TweenAnimation = true,
		OpenPosition = UDim2.fromScale(0.5, 0.5),
		ClosePosition = UDim2.fromScale(0.5, 1.5)
	})
end
function v12._setupLegend(p1) --[[ _setupLegend | Line: 176 | Upvalues: Legend (copy), t3 (copy), t4 (copy), v8 (copy), v16 (ref), v1 (copy) ]]
	local Legend_2 = p1.Container.Content.Content.Legend
	local Template = Legend_2.Template
	for v12, v2 in Legend do
		for v5, v6 in v2.Items do
			local v3, v4
			local v7 = v6.Name
			local v82 = v6.Content
			local v9 = nil
			if not table.find(t3, v7) then
				local v10 = Template:Clone()
				local v11 = t4
				v11[v7] = t4[v7] or v8.new(false)
				v10.Activated:Connect(function() --[[ Line: 193 | Upvalues: v16 (ref), t4 (ref), v7 (copy) ]]
					v16 = false
					t4[v7]:set(not t4[v7]:get())
				end)
				t4[v7]:subscribe(function(p1) --[[ Line: 199 | Upvalues: v1 (ref), v10 (ref) ]]
					local v12, v2
					if p1 then
						v12, v2 = Color3.fromRGB(255, 243, 226), 0
					else
						v12, v2 = Color3.fromRGB(128, 128, 128), 0.5
					end
					v1.target(v10.TextLabel, 1, 2, {
						TextColor3 = v12,
						TextTransparency = v2
					})
					v1.target(v10.TextLabel.UIStroke, 1, 2, {
						Transparency = v2
					})
					v10.Visible = v10.Visible or p1
				end)
				local v162 = v6.DisplayName or string.gsub(string.gsub(if v9 then v9 else v6.Name, "(%l)(%u)", "%1 %2"), "(%u)(%u)", "%1 %2")
				local ImageLabel = v10.Image.ImageLabel
				ImageLabel.ImageColor3 = v6.ImageColor or v10.Image.ImageLabel.ImageColor3
				v10.Image.ImageLabel.Visible = string.find(v82, "rbxassetid") and true or false
				local ImageLabel_2 = v10.Image.ImageLabel
				v3 = if v10.Image.ImageLabel.Visible and v82 then v82 else v10.Image.ImageLabel.Image
				ImageLabel_2.Image = v3
				v10.Image.TextLabel.Visible = not string.find(v82, "rbxassetid")
				local TextLabel = v10.Image.TextLabel
				v4 = if v10.Image.TextLabel.Visible and v82 then v82 else v10.Image.TextLabel.Text
				TextLabel.Text = v4
				v10.TextLabel.Text = v162
				v10.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
				v10.LayoutOrder = #Legend_2:GetChildren() + 1
				v10.Name = ("%*_%*"):format(v2.Name, v6.Name)
				v8.fromProperty(v10, "GuiState"):subscribe(function(p1) --[[ Line: 241 | Upvalues: v1 (ref), v10 (ref) ]]
					local t = {}
					t.BackgroundTransparency = if p1 == Enum.GuiState.Press then 0.2 else 1
					v1.target(v10, 1, 2, t)
				end)
				v10.Parent = Template.Parent
			end
		end
	end
end
function v12._setupMap(p1) --[[ _setupMap | Line: 251 | Upvalues: v3 (copy), v13 (copy), Players (copy), v8 (copy), LocalPlayer (copy), Workspace (copy), RunService (copy), Data (copy), v6 (copy), ReplicatedStorage (copy), v2 (copy), Legend (copy), t4 (copy), t2 (copy), v22 (copy), CollectionService (copy) ]]
	local Template = p1.Container.Content.Content.Map.Icons.Template
	p1:_setupMapZoom()
	v3.new(v13.CharacterTag, function(p1) --[[ Line: 257 | Upvalues: Players (ref), v8 (ref), Template (copy), LocalPlayer (ref), Workspace (ref), RunService (ref), Data (ref) ]]
		local v1 = Players:GetPlayerFromCharacter(p1)
		if v1 then
			local v2 = v8.fromProperty(p1, "PrimaryPart")
			local v3 = v2:subscribe(function(p1, p2) --[[ Line: 267 | Upvalues: Template (ref), v1 (copy), LocalPlayer (ref), v8 (ref), Workspace (ref), RunService (ref), Data (ref) ]]
				p2:add(task.defer(function() --[[ Line: 268 | Upvalues: p1 (copy), Template (ref), v1 (ref), LocalPlayer (ref), p2 (copy), v8 (ref), Workspace (ref), RunService (ref), Data (ref) ]]
					if not p1 then
						return
					end
					local Player_Local = Template:Clone()
					local v12 = v1 == LocalPlayer
					local v2 = p2:add(v8.fromAttribute(Workspace, "IsSocialsEventEnabled"))
					p2:add(RunService.Heartbeat:Connect(function() --[[ Line: 277 | Upvalues: Player_Local (copy), p1 (ref), Data (ref), v12 (copy), Workspace (ref) ]]
						local Position = p1.Position
						Player_Local.Position = UDim2.fromScale((Position.X - Data.xMin) / (Data.xMax - Data.xMin), (Position.Z - Data.zTop) / (Data.zBottom - Data.zTop))
						if v12 then
							local LookVector = Workspace.CurrentCamera.CFrame.LookVector
							Player_Local.ImageLabel.Rotation = -math.deg((math.atan2(-LookVector.Z, LookVector.X))) + 90
						end
					end))
					if v12 then
						Player_Local.HoverLabel.Text = "You"
						Player_Local.ImageLabel.Image = "rbxassetid://90270643657846"
						Player_Local.ImageLabel.ImageColor3 = Color3.fromRGB(102, 214, 96)
						Player_Local.Name = "Player_Local"
					else
						Player_Local.HoverLabel.Text = v1.DisplayName
						Player_Local.ImageLabel.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=48&h=48"):format((math.abs(v1.UserId)))
						Player_Local.Glow.Visible = true
						Player_Local.Name = ("Player_%*"):format(v1.UserId)
					end
					Player_Local.HoverLabel.Visible = true
					Player_Local.ImageLabel.Visible = true
					Player_Local.ZIndex = if v12 then 9000000 else 900000
					Player_Local.Parent = Template.Parent
					p2:add(v2:subscribe(function(p1) --[[ Line: 311 | Upvalues: v12 (copy), Player_Local (copy) ]]
						Player_Local.Visible = if v12 then true else not p1
					end))
					p2:add(function() --[[ Line: 327 | Upvalues: Player_Local (copy) ]]
						Player_Local:Destroy()
					end)
				end))
			end)
			return {
				Destroy = function() --[[ Destroy | Line: 334 | Upvalues: v2 (copy), v3 (ref) ]]
					v2:destroy()
					v3()
				end
			}
		end
	end):Init()
	local v1 = v6.new()
	local t = {}
	local t3 = {}
	local function removeNode(p1) --[[ removeNode | Line: 349 | Upvalues: t3 (copy), t (copy) ]]
		if t3[p1] then
			t3[p1]:DoCleaning()
			t3[p1] = nil
		end
		t[p1] = nil
	end
	local function ensureNodeIcon(p1) --[[ ensureNodeIcon | Line: 357 | Upvalues: t (copy), ReplicatedStorage (ref), v2 (ref), Legend (ref), v6 (ref), t3 (copy), Template (copy), v8 (ref), t4 (ref), t2 (ref) ]]
		if t[p1] then
			return
		end
		if not (if p1:IsA("Model") then p1.PrimaryPart else p1) then
			return
		end
		if p1:IsDescendantOf(ReplicatedStorage) and (p1.Name == "Alex" or (p1.Name == "Lyric" or p1.Name == "Aurelia")) then
			return
		end
		local v22 = nil
		local v3 = nil
		local v5 = nil or p1:GetAttribute("BlipType") or p1.Name
		if v2.GetByName(v5) then
			v3 = ("%*Spawn"):format(v5)
			v5 = "HorseSpawn"
		end
		local v62 = string.gsub(v5, " ", "")
		for v7, v82 in Legend do
			for v9, v10 in v82.Items do
				if v10.Name == v62 then
					v22 = v10
					break
				end
			end
		end
		if not v22 then
			return
		end
		local v11 = v6.new()
		t3[p1] = v11
		local v12 = p1:GetAttribute("Size") or 1
		local v13 = v11:GiveTask(Template:Clone())
		local v14 = v11:GiveTask(v8.fromProperty(v13, "GuiState"))
		t4[v62] = t4[v62] or v8.new(false)
		t4[v62]:set(true)
		v11:GiveTask(v14:subscribe(function(p1) --[[ Line: 418 | Upvalues: v3 (ref), t2 (ref), v62 (ref), v13 (copy) ]]
			local v1 = v3 and true or false
			local v2 = (if v1 then v1 else p1 ~= Enum.GuiState.Idle) or table.find(t2, v62) and true or false
			v13.HoverLabel.Visible = v2
			v13.ZIndex = if v2 then if v62 == "LEGO" then 900000000 else 90000000 else 1
		end))
		v11:GiveTask(t4[v62]:subscribe(function(p1) --[[ Line: 440 | Upvalues: v13 (copy) ]]
			v13.Visible = p1
		end))
		local v18 = string.gsub(nil or v3 or v62, "(%l)(%u)", "%1 %2")
		v13.HoverLabel.Text = v22.DisplayName or string.gsub(v18, "(%u)(%u)", "%1 %2")
		v13.ImageLabel.ImageColor3 = v22.ImageColor or v13.ImageLabel.ImageColor3
		v13.ImageLabel.Visible = string.find(v22.Content, "rbxassetid") and true or false
		v13.ImageLabel.Image = v22.Content
		v13.TextLabel.Visible = not string.find(v22.Content, "rbxassetid")
		v13.TextLabel.Text = v22.Content
		v13.Size = UDim2.fromScale(v13.Size.X.Scale * v12, v13.Size.Y.Scale * v12)
		v13.Name = v3 or v62
		v13.Parent = Template.Parent
		t[p1] = v13
	end
	v1:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 468 | Upvalues: t (copy), Data (ref), t3 (copy) ]]
		for v1, v2 in t do
			if v1.Parent then
				local Position = v1:GetPivot().Position
				v2.Position = UDim2.fromScale((Position.X - Data.xMin) / (Data.xMax - Data.xMin), (Position.Z - Data.zTop) / (Data.zBottom - Data.zTop))
				continue
			end
			if t3[v1] then
				t3[v1]:DoCleaning()
				t3[v1] = nil
			end
			t[v1] = nil
		end
	end))
	local function onNodesChanged() --[[ onNodesChanged | Line: 478 | Upvalues: v22 (ref), CollectionService (ref), ensureNodeIcon (copy), t (copy), t3 (copy) ]]
		local v1 = v22:get()
		local v2 = CollectionService:GetTagged("MinimapBlip")
		local t2 = {}
		for v4, v5 in { v2, if v1 then v1:GetChildren() or nil else nil } do
			for v6, v7 in v5 do
				if v7:IsA("PVInstance") then
					t2[v7] = true
					ensureNodeIcon(v7)
				end
			end
		end
		for v8 in t do
			if not t2[v8] then
				if t3[v8] then
					t3[v8]:DoCleaning()
					t3[v8] = nil
				end
				t[v8] = nil
			end
		end
	end
	CollectionService:GetInstanceAddedSignal("MinimapBlip"):Connect(onNodesChanged)
	CollectionService:GetInstanceRemovedSignal("MinimapBlip"):Connect(onNodesChanged)
	v22:subscribe(function(p1, p2) --[[ Line: 506 | Upvalues: onNodesChanged (copy) ]]
		if not p1 then
			onNodesChanged()
			return
		end
		p2:add(p1.ChildAdded:Connect(onNodesChanged))
		p2:add(p1.ChildRemoved:Connect(onNodesChanged))
		onNodesChanged()
	end)
	for v23, v32 in p1:GetDescendants() do
		if v32:IsA("UIAspectRatioConstraint") and v32:HasTag("MapAspectRatioConstraint") then
			v32.AspectRatio = Data.AspectRatio
		end
	end
	p1.Container.Content.Content.Map.Map.Image = Data.Image
end
function v12._setupMapZoom(p1) --[[ _setupMapZoom | Line: 534 ]]
	p1:_setupZoomButtons()
	p1:_setupZoom()
end
function v12._setupZoom(p1) --[[ _setupZoom | Line: 540 | Upvalues: v8 (copy), v6 (copy), v16 (ref), Data (copy), ReplicatedStorage (copy), RunService (copy), Workspace (copy), LocalPlayer (copy), v19 (ref), UserInputService (copy), v11 (copy), zero (ref), v17 (ref), v1 (copy), v18 (copy), Vector3Value (copy) ]]
	local Background = p1.Container.Content.Background
	local UIScale = p1.Container.Content.Content.Map.UIScale
	local Map = p1.Container.Content.Content.Map
	local v12 = v8.fromProperty(Map, "AbsoluteSize")
	local v2 = nil
	local t = {}
	local v3 = nil
	local v4 = false
	local v5 = v6.new()
	p1.Container.Content.Content.Map.Map.InputEnded:Connect(function(p12) --[[ Line: 555 | Upvalues: v16 (ref), v4 (ref), v5 (copy), p1 (copy), Data (ref), ReplicatedStorage (ref), RunService (ref), Workspace (ref), LocalPlayer (ref) ]]
		if v16 then
			return
		end
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 and p12.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		if v4 then
			v5:DoCleaning()
			v4 = false
			return
		end
		v4 = true
		local Map = p1.Container.Content.Content.Map.Map
		local AbsolutePosition = Map.AbsolutePosition
		local AbsoluteSize = Map.AbsoluteSize
		local Position = p12.Position
		local v1 = Vector2.new(Position.X - AbsolutePosition.X, Position.Y - AbsolutePosition.Y)
		local v2, v3
		if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
			v2 = v1.X / AbsoluteSize.X
			v3 = v1.Y / AbsoluteSize.Y
		else
			v2 = 0
			v3 = 0
		end
		local v42 = math.clamp(v2, 0, 1)
		local v52 = math.clamp(v3, 0, 1)
		local v6 = Data.xMin + v42 * (Data.xMax - Data.xMin)
		local v7 = Data.zTop + v52 * (Data.zBottom - Data.zTop)
		local MinimapMarker = v5:GiveTask(ReplicatedStorage.Storage.Assets.MinimapMarker:Clone())
		v5:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 594 | Upvalues: Workspace (ref), v6 (copy), v7 (copy), LocalPlayer (ref), MinimapMarker (copy), v5 (ref), v4 (ref) ]]
			local CurrentCamera = Workspace.CurrentCamera
			if not CurrentCamera then
				return
			end
			local v3 = Vector3.new(v6, CurrentCamera.CFrame.Position.Y, v7)
			local Character = LocalPlayer.Character
			local v42 = if Character then Character.PrimaryPart or nil else nil
			local v52 = v42 and v42.Position or nil
			if not v52 then
				return
			end
			local v62 = v52 and v52 - v3 or nil
			local v72 = v62 and v62.Magnitude or nil
			MinimapMarker.BillboardGui.ContainerFrame.TextLabel.Text = ("%* studs"):format((string.format("%d", v72)))
			MinimapMarker:PivotTo(CFrame.identity + v3)
			if not (v72 <= 50) then
				return
			end
			v5:DoCleaning()
			v4 = false
		end))
		MinimapMarker.Name = "MinimapMarker"
		MinimapMarker:AddTag("MinimapBlip")
		MinimapMarker.Parent = Workspace
	end)
	Background.InputEnded:Connect(function(p1) --[[ Line: 628 | Upvalues: v16 (ref), v2 (ref) ]]
		if not v16 then
			return
		end
		if p1.UserInputType == Enum.UserInputType.MouseButton1 or p1.UserInputType == Enum.UserInputType.Touch then
			v16 = false
			v2 = nil
		end
	end)
	Background.InputChanged:Connect(function(p1) --[[ Line: 640 | Upvalues: v19 (ref), v16 (ref), UserInputService (ref), v2 (ref) ]]
		if p1.UserInputType == Enum.UserInputType.MouseWheel then
			v19 = math.clamp(v19 + p1.Position.Z * 0.25, 1, 5)
			return
		end
		if v16 then
			return
		end
		local t = {}
		local v22 = nil
		for v3, v4 in UserInputService:GetMouseButtonsPressed() do
			t[v4.KeyCode] = true
			t[v4.UserInputType] = true
		end
		if (if v22 then v22 elseif p1.UserInputType == Enum.UserInputType.Touch then true else false) or t[Enum.UserInputType.MouseButton1] then
			v16 = true
			v2 = p1.Position
		end
	end)
	RunService.Heartbeat:Connect(function() --[[ Line: 668 | Upvalues: v16 (ref), v11 (ref), v2 (ref), zero (ref), v17 (ref) ]]
		if v16 then
			local v1 = v11.X - v2.X
			local v22 = v11.Y - v2.Y
			v2 = Vector2.new(v11.X, v11.Y)
			zero = zero + Vector2.new(v1, v22) / v17
		end
	end)
	UserInputService.TouchStarted:Connect(function(p1) --[[ Line: 691 | Upvalues: v16 (ref), t (copy), v17 (ref), zero (ref) ]]
		if v16 then
			local v1 = t
			table.insert(v1, 1, p1)
			local Position = p1.Position
			local v2 = p1:GetPropertyChangedSignal("Position"):connect(function() --[[ Line: 701 | Upvalues: p1 (copy), Position (ref), v17 (ref), t (ref), zero (ref) ]]
				local v1 = (p1.Position - Position) / v17
				Position = p1.Position
				if table.find(t, p1) ~= 1 then
					return
				end
				zero = zero + Vector2.new(v1.X, v1.Y)
			end)
			local v3 = nil
			v3 = p1:GetPropertyChangedSignal("UserInputState"):connect(function() --[[ Line: 719 | Upvalues: p1 (copy), t (ref), v3 (ref), v2 (copy) ]]
				if p1.UserInputState ~= Enum.UserInputState.End then
					return
				end
				local v1 = table.find(t, p1)
				v3:disconnect()
				v2:disconnect()
				if not v1 then
					return
				end
				table.remove(t, v1)
			end)
		end
	end)
	UserInputService.TouchPinch:connect(function(p1, p2, p3, p4) --[[ Line: 733 | Upvalues: v3 (ref), v19 (ref) ]]
		if p4 == Enum.UserInputState.End or p4 == Enum.UserInputState.Cancel then
			v3 = nil
			return
		end
		if v3 then
			v19 = v19 + (p2 - v3) * math.min(2, (math.abs(p3)))
			v19 = math.clamp(v19, 1, 5)
		end
		v3 = p2
	end)
	RunService.Heartbeat:Connect(function() --[[ Line: 750 | Upvalues: v1 (ref), v18 (ref), v19 (ref), v17 (ref), UIScale (copy), v12 (copy), zero (ref), Vector3Value (ref), Map (copy) ]]
		v1.target(v18, 0.75, 1.75, {
			Value = v19
		})
		v17 = v18.Value
		UIScale.Scale = v17
		local v13 = v12:get()
		zero = Vector2.new(math.clamp(zero.X, -v13.X / 2, v13.X / 2), (math.clamp(zero.Y, -v13.Y / 2, v13.Y / 2)))
		local t = {}
		t.Value = Vector3.new(zero.X, zero.Y, 0)
		v1.target(Vector3Value, 0.725, 2.65, t)
		local v9 = Vector3Value.Value
		Map.Position = UDim2.new(0.5, v9.X * v17, 0.5, v9.Y * v17)
	end)
end
function v12._setupZoomButtons(p1) --[[ _setupZoomButtons | Line: 771 | Upvalues: t5 (copy), v4 (copy), v16 (ref) ]]
	for v1, v2 in p1.Container.Content.Controls:GetChildren() do
		if v2:IsA("GuiButton") then
			local v3 = t5[v2.Name]
			local v42 = v3 == nil
			v4.new(v2, {
				OnDown = function() --[[ OnDown | Line: 781 | Upvalues: v16 (ref), v42 (copy), v2 (copy), v3 (copy) ]]
					v16 = false
					if v42 then
						warn(v2.Name)
					end
					if not v3 then
						return
					end
					v3(v2)
				end
			})
		end
	end
end
function v12._toggle() --[[ _toggle | Line: 797 | Upvalues: v12 (copy), v5 (copy) ]]
	local Container = v12.Container
	if v5.IsFrameOpen(Container) then
		v5.CloseMainFrame(Container)
	else
		v5.OpenMainFrame(Container)
	end
end
function v12.Close() --[[ Close | Line: 808 | Upvalues: v5 (copy), v12 (copy), v15 (copy) ]]
	if v5.IsFrameOpen(v12.Container) then
		v15:FireServer("ClosedMajorInterface", "Map")
		v12._toggle()
	end
end
function v12.Open() --[[ Open | Line: 818 | Upvalues: v5 (copy), v12 (copy), v15 (copy) ]]
	if not v5.IsFrameOpen(v12.Container) then
		v15:FireServer("AccessedMajorInterface", "Map")
		v12._toggle()
	end
end
function v12.Init(p1) --[[ Init | Line: 829 | Upvalues: UserInputService (copy), v5 (copy), v12 (copy), v16 (ref), ReplicatedStorage (copy), v23 (copy), v22 (copy), v13 (copy), v10 (copy), Workspace (copy) ]]
	p1:_setupGui()
	UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 833 | Upvalues: v5 (ref), v12 (ref) ]]
		if p2 then
			return
		end
		if p1.KeyCode ~= Enum.KeyCode.M then
			return
		end
		if v5.IsFrameOpen(v12.Container) then
			task.defer(v12.Close)
		end
	end)
	UserInputService.InputEnded:Connect(function(p1) --[[ Line: 849 | Upvalues: v16 (ref) ]]
		if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		if v16 then
			v16 = false
		end
	end)
	ReplicatedStorage.ChildAdded:Connect(function(p1) --[[ Line: 861 | Upvalues: v23 (ref) ]]
		if p1.Name == "WorldStorage" then
			v23:set(p1)
		end
	end)
	if v22:get() then
		return
	end
	task.spawn(function() --[[ Line: 870 | Upvalues: v13 (ref), v10 (ref), Workspace (ref), v22 (ref) ]]
		if v13.IsEventWorld then
			return
		end
		if v10.IsMarketWorld() then
			return
		end
		while not Workspace:FindFirstChild("DynamicNPCs") do
			task.wait()
		end
		v22:set(Workspace:FindFirstChild("DynamicNPCs"))
	end)
end
v12:Init()
return v12