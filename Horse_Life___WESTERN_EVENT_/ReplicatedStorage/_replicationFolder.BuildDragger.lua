-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("Maid")
local v3 = Sonar("spr")
local v4 = Sonar("CharacterControls")
local v5 = Sonar("Signal")
local v6 = Sonar("PositionUtils")
local v7 = Sonar("ItemDataService")
local v8 = Sonar("ItemReplicationService")
local v9 = Sonar("InputTypeDetector")
local v10 = Sonar("Button")
local v11 = Sonar("NoBuildZone")
local v12 = Sonar("UINavigator")
local v13 = Sonar("FormatNumber")
local v14 = Sonar("BuildService")
local v15 = Sonar("IssueResponseClient")
local v16 = Sonar("PromptClient")
local t2 = {
	["Bad Angle"] = "Ground is uneven!",
	Floating = "Placement cannot be floating!",
	Overlap = "Overlapping!",
	["Restricted Area"] = "This area is restricted!",
	IsInRestrictedZone = "You are in a restricted zone!",
	PlayerBase = "Another player is already building here!"
}
local LocalPlayer = game.Players.LocalPlayer
local v17 = Sonar("PlayerWrapper").GetClient()
local PlacementFrame = LocalPlayer.PlayerGui:WaitForChild("BuildGui").PlacementFrame
local t3 = {
	SmallGrid = false,
	GlobalSnapping = true,
	RotateIncrement = true
}
local v18 = false
local t4 = {}
local GhostBuilds = Instance.new("Folder", workspace.CurrentCamera)
GhostBuilds.Name = "GhostBuilds"
local Builds = workspace.Terrain:WaitForChild("Builds")
local v19 = false
local v20 = "PlacePlot"
local v21 = v2.new()
local v22 = v2.new()
local v23 = ReplicatedStorage.Storage.Assets:WaitForChild("Zone"):Clone()
local v24 = v23:Clone()
v24.Gui.Enabled = true
local v25 = nil
local Size = v23.Size
local v26 = nil
local v27 = nil
local v28 = 0
local Highlight = Instance.new("Highlight")
Highlight.FillTransparency = 1
Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
Highlight.FillColor = Color3.new(255/255, 0/255, 0/255)
Highlight.OutlineTransparency = 0
Highlight.Parent = GhostBuilds
local t5 = {
	Foundations = {
		Foundations = true,
		Structures = true
	},
	Structures = {
		Foundations = true,
		Structures = true
	},
	Fences = {
		Foundations = true,
		Structures = true
	}
}
local t6 = {
	Foundations = {
		Foundations = {
			Back = {
				CanSnap = true,
				Priority = -1
			},
			Front = {
				CanSnap = true,
				Priority = -1
			},
			Left = {
				CanSnap = true,
				Priority = -1
			},
			Right = {
				CanSnap = true,
				Priority = -1
			},
			Structure = {
				CanSnap = false,
				CanSnapFrom = false
			},
			Ceiling = {
				CanSnap = false
			}
		},
		Structures = {
			_Universal = {
				CanSnap = true,
				OneWay = true,
				Priority = -2
			}
		}
	},
	Structures = {
		Foundations = {
			Structure = {
				CanSnap = true,
				Priority = -2
			},
			Left = {
				CanSnap = false
			},
			Right = {
				CanSnap = false
			},
			Top = {
				CanSnap = false
			},
			Bottom = {
				CanSnap = false
			},
			Back = {
				CanSnap = false
			},
			Front = {
				CanSnap = false
			}
		},
		Structures = {
			Left = {
				CanSnap = true
			},
			Right = {
				CanSnap = true
			},
			Top = {
				CanSnap = true,
				Priority = -1
			},
			Bottom = {
				CanSnap = true,
				Priority = -1
			},
			Structure = {
				CanSnap = true,
				Priority = -2
			},
			Ceiling = {
				CanSnap = true,
				Priority = -2
			},
			Back = {
				CanSnap = true
			},
			Front = {
				CanSnap = true
			}
		}
	}
}
local function calculateBoundingBoxCorners(p1, p2) --[[ calculateBoundingBoxCorners | Line: 143 ]]
	local v1 = p2 / 2
	return {
		(p1 * CFrame.new(v1.X, p2.Y + 1, v1.Z)).Position,
		(p1 * CFrame.new(-v1.X, p2.Y + 1, v1.Z)).Position,
		(p1 * CFrame.new(-v1.X, p2.Y + 1, -v1.Z)).Position,
		(p1 * CFrame.new(v1.X, p2.Y + 1, -v1.Z)).Position
	}
end
local function pack(p1) --[[ pack | Line: 153 | Upvalues: v28 (ref) ]]
	return string.pack("ffff", p1.X, p1.Y, p1.Z, v28)
end
local function snapToGrid(p1, p2) --[[ snapToGrid | Line: 159 ]]
	return math.round(p1 / p2) * p2
end
local function makeAttachments(p1) --[[ makeAttachments | Line: 163 | Upvalues: v7 (copy) ]]
	if not p1 then
		return
	end
	local v1 = v7.GetByName(p1:FindFirstAncestorWhichIsA("Model").Name)
	if not v1 then
		warn("No build data for", p1:FindFirstAncestorWhichIsA("Model").Name)
	end
	if v1 and v1.DoNotCreateAttachments then
		return
	end
	local Size = p1.Size
	local function createAttachment(p12) --[[ createAttachment | Line: 176 | Upvalues: p1 (copy), Size (copy) ]]
		local Attachment = Instance.new("Attachment")
		Attachment.Name = p12
		Attachment.Parent = p1
		local t = {}
		t.Front = Vector3.new(0, 0, -Size.Z / 2)
		t.Back = Vector3.new(0, 0, Size.Z / 2)
		t.Top = Vector3.new(0, Size.Y / 2, 0)
		t.Bottom = Vector3.new(0, -Size.Y / 2, 0)
		t.Right = Vector3.new(Size.X / 2, 0, 0)
		t.Left = Vector3.new(-Size.X / 2, 0, 0)
		Attachment.Position = t[p12]
	end
	for i, v in ipairs({ "Front", "Back", "Top", "Bottom", "Right", "Left" }) do
		createAttachment(v)
	end
end
local v29 = v2.new()
function t._connectPlot(p1, p2) --[[ _connectPlot | Line: 200 | Upvalues: v29 (copy), makeAttachments (copy) ]]
	v29:DoCleaning()
	local function addAttachments(p1) --[[ addAttachments | Line: 203 | Upvalues: makeAttachments (ref) ]]
		if not p1:IsA("Model") then
			return
		end
		local PrimaryPart = p1.PrimaryPart
		if PrimaryPart then
			makeAttachments(PrimaryPart)
		else
			p1:GetPropertyChangedSignal("PrimaryPart"):Once(function() --[[ Line: 215 | Upvalues: PrimaryPart (ref), p1 (copy), makeAttachments (ref) ]]
				PrimaryPart = p1.PrimaryPart
				makeAttachments(PrimaryPart)
			end)
		end
	end
	v29:GiveTask(p2.ChildAdded:Connect(function(p1) --[[ Line: 224 | Upvalues: addAttachments (copy) ]]
		addAttachments(p1)
	end))
	for v1, v2 in p2:GetChildren() do
		addAttachments(v2)
	end
end
local v30 = nil
function t.HasPlot(p1) --[[ HasPlot | Line: 233 | Upvalues: Builds (copy), LocalPlayer (copy), v30 (ref) ]]
	local v1 = Builds:FindFirstChild(LocalPlayer.Name)
	if v1 ~= v30 and v1 then
		p1:_connectPlot(v1)
	end
	v30 = v1
	return v1
end
local v31 = v24:Clone()
v31.Size = Vector3.new(v24.Size.X * 1.015, 30, v24.Size.Z * 1.015)
v31.CanQuery = true
local v34 = OverlapParams.new()
v34.IncludeInstances = { Builds }
function t.IsInsidePlot(p1) --[[ IsInsidePlot | Line: 248 | Upvalues: v31 (copy), v24 (copy), v34 (copy), Builds (copy) ]]
	v31.CFrame = v24.CFrame
	local v1 = nil
	for v2, v3 in workspace:GetPartsInPart(v31, v34) do
		if v3:IsDescendantOf(Builds) and v3.Parent.Name ~= "NoBuildZones" then
			v1 = true
		end
	end
	return v1
end
function t.SetSnapping(p1, p2) --[[ SetSnapping | Line: 260 | Upvalues: t3 (copy) ]]
	t3.GlobalSnapping = p2
	p1:GetSignal("GlobalSnapping"):Fire()
end
function t.SetRotateIncrement(p1, p2) --[[ SetRotateIncrement | Line: 265 | Upvalues: t3 (copy) ]]
	t3.RotateIncrement = p2
	p1:GetSignal("RotateIncrement"):Fire()
end
function t.SetMode(p1, p2) --[[ SetMode | Line: 270 | Upvalues: v20 (ref), v24 (copy), GhostBuilds (copy), PlacementFrame (copy), v11 (copy), v9 (copy) ]]
	v20 = p2
	if p2 == "PlacePlot" then
		if p1.VisualModel then
			p1.VisualModel.Parent = nil
		end
		v24.Parent = GhostBuilds
		PlacementFrame.Visible = not p1:HasPlot()
		v11:EnableAll()
		p1:SetRotateIncrement(true)
		p1:_setEditOptions({ "Rotate", "RotateLeft", "RotateRight", "Move", "Cancel", "Confirm" })
	else
		p1._snapCooldown = tick()
		v11:DisableAll()
		v24.Parent = nil
		if p2 ~= "Building" then
			return
		end
		p1.Plot = p1:HasPlot()
		if p1.Plot then
			p1.Plot:WaitForChild("Zone").Gui.Enabled = true
			p1.Plot:WaitForChild("Zone").CanQuery = false
		end
		if not p1.VisualModel then
			return
		end
		p1:_updateModel()
		p1.VisualModel.Parent = GhostBuilds
		PlacementFrame.Visible = true
		local t = {}
		local v4 = if v9.IsMobileInputType() and p1.CurrentPlacement.EditModel then "PutAway" else "Cancel"
		t[1] = "Rotate"
		t[2] = "RotateLeft"
		t[3] = "RotateRight"
		t[4] = v4
		t[5] = "Move"
		t[6] = "Confirm"
		p1:_setEditOptions(t)
	end
end
function t.SetError(p1, p2, p3) --[[ SetError | Line: 321 | Upvalues: t4 (copy), t (copy) ]]
	if t4[p2] ~= p3 then
		t.ErrorSignal:Fire(p2, p3)
		debug.traceback(p2)
	end
	t4[p2] = p3
end
function t.CanPlace(p1) --[[ CanPlace | Line: 332 | Upvalues: t4 (copy) ]]
	local v1 = true
	for v2, v3 in t4 do
		if v2 and v3 then
			warn("Could not place due to", v2)
			v1 = false
		end
	end
	return v1
end
function t.Enable(p1, p2, p3) --[[ Enable | Line: 343 | Upvalues: v19 (ref), v21 (copy), v25 (ref), v26 (ref), v27 (ref), v17 (copy), LocalPlayer (copy), ReplicatedStorage (copy), v7 (copy), makeAttachments (copy), PlacementFrame (copy), Highlight (copy) ]]
	if p2 == "Building" and v19 then
		v21:DoCleaning()
	end
	v25 = nil
	if not (v26 and v27) then
		v26 = v17.PrimaryPart.Position
		v27 = LocalPlayer:GetMouse().UnitRay.Direction
	end
	p1:_resetEditModel()
	v19 = true
	local v1 = p1.CurrentPlacement and p1.CurrentPlacement.Name or nil
	p1.CurrentPlacement = p3
	p1:Unselect()
	if p2 == "Building" and p1.CurrentPlacement then
		local v2
		if p3 and (p3.EditModel and p3.ID == p3.ID) then
			p1._snapCooldown = tick() + 0.1
			p1.SelectedPlacementPos = p3.EditModel:GetPivot().p
			p3.EditModel.Parent = ReplicatedStorage
			v2 = true
		else
			v2 = false
		end
		p1.BuildingData = v7.GetByName(p3.Name)
		p1.BuildingType = p1.BuildingData.BuildingType
		local v3 = p3.Model:Clone()
		v3.Name = p3.Name
		p1.GhostModel = v3
		p1.VisualModel = v3:Clone()
		if p3.Name ~= v1 and (p3.RefreshPlacement and (p1.BuildingType == "Foundations" or p1.BuildingType == "Structures")) then
			p1:SetSnapping(true)
		end
		if v2 then
			local v4 = p3.EditModel:GetPivot()
			p1.GhostModel:PivotTo(v4)
			p1.VisualModel:PivotTo(v4)
			p1.BuildCF = v4
		end
		if p1.BuildCF and not v2 then
			p1.VisualModel:PivotTo(p1.BuildCF + Vector3.new(0, if v2 then 0 else 100, 0))
		end
		p1.Highlight = Instance.new("Highlight", p1.VisualModel)
		p1.Highlight.FillTransparency = 1
		p1.Highlight.FillColor = Color3.new(255/255, 0/255, 0/255)
		p1.Highlight.OutlineTransparency = 0
		p1.IntersectionPart = p1.VisualModel.PrimaryPart:Clone()
		p1.IntersectionPart.CanTouch = true
		p1.IntersectionPart.CanCollide = false
		p1.IntersectionPart.Touched:Connect(function() --[[ Line: 406 ]] end)
		local IntersectionPart = p1.IntersectionPart
		IntersectionPart.Size = IntersectionPart.Size * 0.675
		p1.IntersectionPart.Parent = workspace.CurrentCamera
		for k, v in pairs(p1.GhostModel:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
				if v == p1.GhostModel.PrimaryPart or (v.Name == "Root" or v.Name == "Base") then
					makeAttachments(v)
				end
			end
		end
		for k, v in pairs(p1.VisualModel:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
				if v == p1.GhostModel.PrimaryPart or (v.Name == "Root" or v.Name == "Base") then
					makeAttachments(v)
				end
			end
		end
		v21:GiveTask(v3)
		v21:GiveTask(p1.VisualModel)
		v21:GiveTask(p1.IntersectionPart)
		v21:GiveTask(p1.ListenForMinimisedFrame())
	else
		p1:_resetEditModel()
		p1.GhostModel = nil
		p1.VisualModel = nil
		PlacementFrame.Visible = false
		if p2 == "Building" then
			v21:GiveTask(game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 440 | Upvalues: LocalPlayer (ref), p1 (copy), Highlight (ref) ]]
				local Target = LocalPlayer:GetMouse().Target
				local v1 = if Target then Target.Parent else Target
				if not v1 or v1.Parent ~= p1.Plot then
					Highlight.Adornee = nil
					Highlight.Enabled = false
					return
				end
				if (not p1.SelectedPlacement or v1 == p1.SelectedPlacement.Model) and p1.SelectedPlacement then
					Highlight.Adornee = nil
					Highlight.Enabled = false
					return
				end
				Highlight.Adornee = v1
				Highlight.Enabled = true
			end))
		end
	end
	p1:SetMode(p2)
	p1:_setPlacementFramesPosition()
end
function t.Disable(p1) --[[ Disable | Line: 459 | Upvalues: v25 (ref), v19 (ref), v21 (copy), v11 (copy), Highlight (copy), v20 (ref), v24 (copy), t2 (copy) ]]
	v25 = nil
	v19 = false
	v21:DoCleaning()
	v11:DisableAll()
	p1:Unselect()
	p1.CurrentPlacement = nil
	p1.GhostModel = nil
	p1.VisualModel = nil
	Highlight.Adornee = nil
	Highlight.Enabled = false
	if v20 == "PlacePlot" then
		v24.Parent = nil
	end
	for v1, v2 in t2 do
		p1:SetError(v1, false)
	end
	if not (p1.Plot and p1.Plot.PrimaryPart) then
		return
	end
	p1.Plot.PrimaryPart.Gui.Enabled = false
end
function t.Select(p1, p2) --[[ Select | Line: 490 | Upvalues: v22 (copy), PlacementFrame (copy), v9 (copy) ]]
	v22:DoCleaning()
	p1.SelectedPlacement = p2
	p1.SelectedHighlight = Instance.new("Highlight", p2.Model)
	p1.SelectedHighlight.FillTransparency = 1
	p1.SelectedHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	p1.SelectedHighlight.FillColor = Color3.new(255/255, 0/255, 0/255)
	p1.SelectedHighlight.OutlineTransparency = 0
	v22:GiveTask(p1.SelectedHighlight)
	PlacementFrame.Mobile.IssueFrame.Visible = false
	PlacementFrame.Other.IssueFrame.Visible = false
	PlacementFrame.Visible = true
	if v9.IsMobileInputType() then
		p1:_setEditOptions({ "Move", "PutAway", "Delete" })
	else
		p1:_setEditOptions({ "Edit", "PutAway", "Delete" })
	end
end
function t.SelectTarget(p1) --[[ SelectTarget | Line: 525 | Upvalues: LocalPlayer (copy) ]]
	local Target = LocalPlayer:GetMouse().Target
	local v1 = if Target then Target.Parent else Target
	warn("I\'ve selected a target")
	if (not v1 or (not p1.SelectedPlacement or v1 ~= p1.SelectedPlacement.Model)) and (v1 and v1.Parent == p1.Plot) then
		p1:Select({
			ID = v1:GetAttribute("ID"),
			Model = v1,
			Name = v1.Name,
			EditModel = v1
		})
		return
	end
	p1:Unselect()
end
function t._resetEditModel(p1) --[[ _resetEditModel | Line: 547 | Upvalues: v30 (ref) ]]
	local v1 = if p1.CurrentPlacement == nil then false else p1.CurrentPlacement.EditModel and p1.CurrentPlacement
	if not (v1 and v1.EditModel) then
		return
	end
	v1.EditModel.Parent = v30
end
function t.Unselect(p1, p2) --[[ Unselect | Line: 554 | Upvalues: v22 (copy), PlacementFrame (copy) ]]
	v22:DoCleaning()
	if not p2 then
		p1:_resetEditModel()
	end
	p1.SelectedPlacement = nil
	PlacementFrame.Visible = false
end
function t._setPlacementFramesPosition(p1) --[[ _setPlacementFramesPosition | Line: 566 | Upvalues: v20 (ref), PlacementFrame (copy) ]]
	if v20 == "PlacePlot" then
		PlacementFrame.Other.IssueFrame.AnchorPoint = Vector2.new(0.5, 1)
		PlacementFrame.Other.IssueFrame.Position = UDim2.new(0.5, 0, 0.55, 0)
		PlacementFrame.Other.List.AnchorPoint = Vector2.new(0.5, 0.5)
		PlacementFrame.Other.List.Position = UDim2.new(0.5, 0, 0.5, 0)
		PlacementFrame.Other.List.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		PlacementFrame.Mobile.Position = UDim2.new(0.5, 0, 0.3, 0)
		PlacementFrame.Mobile.IssueFrame.Visible = false
		PlacementFrame.Other.IssueFrame.Visible = false
	else
		PlacementFrame.Other.IssueFrame.AnchorPoint = Vector2.new(0.5, 0)
		PlacementFrame.Other.IssueFrame.Position = UDim2.new(0.5, 0, 0.25, 0)
		PlacementFrame.Other.List.AnchorPoint = Vector2.new(1, 0.5)
		PlacementFrame.Other.List.Position = UDim2.new(1, 0, 0.5, 0)
		PlacementFrame.Other.List.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		PlacementFrame.Mobile.Position = UDim2.new(0.5, 0, 0.5, 0)
		PlacementFrame.Mobile.IssueFrame.Visible = true
		PlacementFrame.Other.IssueFrame.Visible = true
	end
end
function t._setEditOptions(p1, p2) --[[ _setEditOptions | Line: 594 | Upvalues: PlacementFrame (copy) ]]
	for k, v in pairs(PlacementFrame.Other.List:GetChildren()) do
		if v:IsA("ImageLabel") then
			v.Visible = table.find(p2, v.Name)
		end
	end
	for k, v in pairs(PlacementFrame.Mobile:GetChildren()) do
		if v:IsA("ImageButton") then
			v.Visible = table.find(p2, v.Name)
		end
	end
end
function t.GetProjectedExtents(p1, p2) --[[ GetProjectedExtents | Line: 606 ]]
	local v1 = p1.VisualModel.PrimaryPart.CFrame
	local Size = p1.VisualModel.PrimaryPart.Size
	local v2 = if p2 then p2 else p1.Plot.PrimaryPart
	local list = {}
	for i = -0.5, 0.5 do
		for j = -0.5, 0.5 do
			for k = -0.5, 0.5 do
				table.insert(list, (Vector3.new(Size.X * i, Size.Y * j, Size.Z * k)))
			end
		end
	end
	local v7 = Vector3.new(inf, inf, inf)
	local v8 = Vector3.new(-inf, -inf, -inf)
	for i, v in ipairs(list) do
		local v9 = v2.CFrame:PointToObjectSpace(v1 * v)
		v7, v8 = Vector3.new(math.min(v7.X, v9.X), math.min(v7.Y, v9.Y), (math.min(v7.Z, v9.Z))), Vector3.new(math.max(v8.X, v9.X), math.max(v8.Y, v9.Y), (math.max(v8.Z, v9.Z)))
	end
	return v7, v8
end
local function localGrid(p1, p2, p3) --[[ localGrid | Line: 641 | Upvalues: t3 (copy) ]]
	local v2 = p3 * (if t3.SmallGrid then 0.25 else 1)
	local v3 = CFrame.new()
	if p2 then
		v3 = p2.CFrame
	end
	local v4 = v3:PointToObjectSpace(p1)
	return v3:PointToWorldSpace((Vector3.new(math.round(v4.X / v2) * v2, v4.Y, math.round(v4.Z / v2) * v2)))
end
function roundToNearest(p1, p2) --[[ roundToNearest | Line: 661 ]]
	return math.floor(p1 / p2) * p2
end
function t.GetClampedPoint(p1, p2, p3, p4, p5) --[[ GetClampedPoint | Line: 665 | Upvalues: localGrid (copy) ]]
	local v1, v2 = p1:GetProjectedExtents()
	local PrimaryPart = p1.Plot.PrimaryPart
	local v3 = PrimaryPart.CFrame
	local Size = PrimaryPart.Size
	local PrimaryPart_2 = p1.VisualModel.PrimaryPart
	local v4 = math.min(PrimaryPart_2.Size.x, PrimaryPart_2.Size.z)
	local v7 = localGrid(p2, p4, (roundToNearest(v4, if v4 < 6 then 0.2 else 2)))
	local v9 = v3:PointToObjectSpace(if p3 and v7 then v7 else p2)
	local v16 = math.clamp(v9.X, -Size.X / 2 + (v2.X - v1.X) / 2, Size.X / 2 - (v2.X - v1.X) / 2)
	local v17 = nil
	local v18
	if p5 then
		local v20 = 100
		local v21 = math.min(v3:PointToObjectSpace((Vector3.new(0, p5.Y, 0))).Y + (v2.Y - v1.Y) / 2, v20)
		local v22 = math.max(v21, v20)
		if v22 < v9.Y then
			v17 = true
		end
		v18 = math.clamp(v9.Y, v21, v22)
	else
		v18 = v9.Y
	end
	return v3:PointToWorldSpace((Vector3.new(v16, v18, (math.clamp(v9.Z, -Size.Z / 2 + (v2.Z - v1.Z) / 2, Size.Z / 2 - (v2.Z - v1.Z) / 2))))), v17
end
local v35 = RaycastParams.new()
v35.IncludeInstances = { workspace.Terrain }
v35.IgnoreWater = true
local v36 = RaycastParams.new()
v36.IncludeInstances = {}
v36.IgnoreWater = true
local v37 = OverlapParams.new()
v37.IncludeInstances = { workspace.Terrain }
v37.MaxParts = 50
function t.CastBoundingBox(p1, p2, p3) --[[ CastBoundingBox | Line: 722 | Upvalues: calculateBoundingBoxCorners (copy), v35 (copy) ]]
	local t = {}
	for i, v in ipairs((calculateBoundingBoxCorners(p2, p3))) do
		local v2 = workspace:Raycast(v, Vector3.new(0, -100, 0), v35)
		if v2 then
			table.insert(t, {
				Instance = v2.Instance,
				Position = v2.Position,
				Normal = v2.Normal,
				Material = v2.Material
			})
			continue
		end
		table.insert(t, {
			Instance = nil,
			Normal = Vector3.new(0, 0, 0),
			Position = v + Vector3.new(0, -100, 0),
			Material = Enum.Material.Air
		})
	end
	return t
end
function t.Cast(p1, p2, p3, p4) --[[ Cast | Line: 751 | Upvalues: v35 (copy) ]]
	local v3 = workspace:Shapecast(p2, p3, if p4 then p4 else v35)
	if v3 then
		return v3.Instance, v3.Position, v3.Normal, v3.Material, v3.Distance
	else
		return nil, p3, Vector3.new(0, 0, 0), Enum.Material.Air, 0
	end
end
local v38 = Vector3.new(0, 0, 0)
function t._updatePlot(p1) --[[ _updatePlot | Line: 763 | Upvalues: v28 (ref), v26 (ref), v27 (ref), v23 (copy), Size (copy), v38 (ref), v11 (copy), v3 (copy), v24 (copy) ]]
	local v1 = CFrame.Angles(0, v28, 0)
	local v2 = v26
	local v32 = v27
	v23.CFrame = CFrame.new(v2) * v1
	v23.Size = Size
	local v4, _, _2, _3, v5 = p1:Cast(v23, v32.Unit * 1000)
	local v6 = nil
	local v7
	if v4 then
		v7 = v2 + v32.Unit * v5
		v38 = v7
		v6 = v4
	else
		v7 = v38
	end
	v23.CFrame = CFrame.new(v7) * v1
	v23.Size = Size * 0.9
	local v8, _4, _5, _6, v9 = p1:Cast(v23, Vector3.new(-0, -1000, -0))
	if not v8 then
		v7 = v38
	end
	local v10 = v7 + Vector3.new(-0, -1, -0) * v9
	local v112 = v10 - v2
	local v12 = (v2 + v112.unit * math.min(v112.magnitude, 300)) * Vector3.new(1, 0, 1) + v10 * Vector3.new(0, 1, 0)
	local v13 = nil
	local v14 = nil
	local v15 = nil
	local v16 = nil
	for v17, v18 in p1:CastBoundingBox(CFrame.new(v12) * v23.CFrame.Rotation, Size) do
		if v18.Instance then
			if math.abs(v12.Y - v18.Position.Y) > Size.Y * 6 then
				v13 = true
				break
			elseif v18.Instance:HasTag("NoBuild") then
				v15 = true
				break
			end
		else
			v14 = true
			break
		end
	end
	local v20 = v6 or v8
	if v20 and v20:HasTag("NoBuild") then
		v15 = true
	end
	if v11:IsInZone(v12) then
		v15 = true
	end
	if p1:IsInsidePlot() then
		v16 = true
	end
	p1:SetError("Restricted Area", v15)
	p1:SetError("Floating", v14)
	p1:SetError("Bad Angle", v13)
	p1:SetError("PlayerBase", v16)
	local v22 = not (v13 or (v14 or (v15 or v16))) and Color3.new(0/255, 255/255, 0/255) or Color3.new(255/255, 0/255, 0/255)
	v23.CFrame = CFrame.new(v12) * v1
	v3.target(v24, 0.8, 7, {
		CFrame = CFrame.new(v12) * v1
	})
	v24.Color = v22
	v38 = v12
	v23.Size = Size
end
function t._findClosestAttachmentsWithMaxDistance(p1, p2, p3, p4, p5) --[[ _findClosestAttachmentsWithMaxDistance | Line: 854 | Upvalues: t6 (copy) ]]
	local function getSnapInfoWithPriority(p1, p2, p3) --[[ getSnapInfoWithPriority | Line: 860 ]]
		local v1 = true
		local v2 = (1 / 0)
		if p1[p2] then
			if p1[p2].CanSnap ~= nil then
				v1 = p1[p2].CanSnap
			end
			v2 = p1[p2].Priority or v2
		elseif p1._Universal then
			v1 = p1._Universal.CanSnap ~= false
			v2 = p1._Universal.Priority or v2
		end
		if p1[p3] and (p1[p3].CanSnapFrom ~= nil and v1) then
			v1 = p1[p3].CanSnapFrom
		end
		return v1, v2
	end
	local v1 = (1 / 0)
	local v2 = (1 / 0)
	local v3 = nil
	local v4 = nil
	for i, v in ipairs(p2:GetDescendants()) do
		if v:IsA("Attachment") then
			local BuildingType = p1.BuildingData.BuildingType
			local v5 = t6[BuildingType] and t6[BuildingType][p5]
			for i2, v6 in ipairs(p3:GetDescendants()) do
				if v6:IsA("Attachment") then
					local v7, v8 = getSnapInfoWithPriority(if v5 then v5 else {}, v6.Name, v.Name)
					if v7 then
						local magnitude = (v.WorldPosition - v6.WorldPosition).magnitude
						if magnitude <= p4 then
							if not (v8 < v2 and (if magnitude < v1 * 0.75 then true else false)) and ((v8 ~= v2 or not (magnitude < v1)) and not (v2 <= v8 and (if magnitude < v1 * 0.35 then true else false))) then
								continue
							end
							if magnitude < 0.35 then
								return v, v6, v8
							end
							v1 = magnitude
							v2 = v8
							v3 = v
							v4 = v6
						end
					end
				end
			end
		end
	end
	return v3, v4, v2
end
function t._calculateTranslationVectorForSnapping(p1, p2, p3, p4, p5) --[[ _calculateTranslationVectorForSnapping | Line: 930 ]]
	local v2, v3, v4 = p1:_findClosestAttachmentsWithMaxDistance(p2, p3, if p5 then p5 else p2.Size.Magnitude * 0.9, p4)
	if v2 and v3 then
		return v3.WorldPosition - v2.WorldPosition, v2, v3, v4
	else
		return Vector3.new(0, 0, 0)
	end
end
function t._isOverlapping(p1, p2, p3, p4) --[[ _isOverlapping | Line: 942 | Upvalues: v37 (copy) ]]
	local IntersectionPart = p1.IntersectionPart
	IntersectionPart:PivotTo(p2)
	p1.IntersectionPart.Size = p1.VisualModel.PrimaryPart.Size * (p4 or 0.675)
	local v1 = workspace:GetPartsInPart(IntersectionPart, v37)
	if p3 then
		for v2, v3 in p1.IntersectionPart:GetTouchingParts() do
			if v3.Name == "Terrain" then
				return true
			end
		end
	end
	if #v1 > 0 then
		return v1
	end
end
function t._updateModel(p1) --[[ _updateModel | Line: 964 | Upvalues: v28 (ref), v26 (ref), v27 (ref), Builds (copy), v36 (copy), v6 (copy), v30 (ref), t3 (copy), v7 (copy), t5 (copy), v3 (copy) ]]
	local VisualModel = p1.VisualModel
	local GhostModel = p1.GhostModel
	if not GhostModel then
		return
	end
	local PrimaryPart = GhostModel.PrimaryPart
	if not PrimaryPart then
		return
	end
	local v1 = CFrame.Angles(0, v28, 0)
	local v2 = v26
	local v32 = v27
	local Size = PrimaryPart.Size
	local v4 = (Size - Size * 1.1) / 2
	local v5 = -Vector3.new(v4.X, v4.Y, v4.Z).Magnitude
	local v72, v8, v9 = workspace:FindPartOnRayWithWhitelist(Ray.new(v2, v27 * 1000), { Builds })
	GhostModel:ScaleTo(1.1)
	GhostModel:PivotTo(CFrame.new(v2) * v1)
	local v10, _, _2, _3, v11 = p1:Cast(PrimaryPart, v32.Unit * 1000)
	local v12 = v26
	local v13 = v26
	local v14
	if v10 then
		v12 = v2 + v32.Unit * (v11 + v5)
		if p1.BuildingData.SnapOffset then
			v12 = (CFrame.new(v12) * v1 * CFrame.new(PrimaryPart.Size * p1.BuildingData.SnapOffset)).p
		end
		v13, v14 = p1:GetClampedPoint(v12, false, false), v10
	else
		v14 = nil
	end
	if v72 then
		local v16 = CFrame.new(v8 + v9.Unit * 10) * v1
		GhostModel:ScaleTo(1)
		GhostModel:PivotTo(v16)
		v36.IncludeInstances = { v72 }
		local _4, _5, _6, _7, v17 = p1:Cast(PrimaryPart, -v9.Unit * 100, v36)
		local v18 = v16.p + -v9.Unit * v17
		local Magnitude = (v26 - v18).Magnitude
		GhostModel:PivotTo(CFrame.new(v18) * v1)
		v12 = v18
		v14 = v72
	end
	local v19 = v12 * Vector3.new(1, 1, 1)
	GhostModel:PivotTo(CFrame.new(v13) * v1)
	GhostModel:ScaleTo(0.5)
	local _4, v20, _5, _6, v21 = p1:Cast(PrimaryPart, Vector3.new(-0, -1000, -0))
	local v22 = v6.isPointInsideCFrame(p1.Plot.PrimaryPart.CFrame, p1.Plot.PrimaryPart.Size * Vector3.new(1, 9000000000, 1), v19)
	local v23 = if v14 then v14:IsDescendantOf(v30) else v14
	local sum = CFrame.new((Vector3.new(v19.X, v22 and v23 and v19.Y or (Vector3.new(v19.X, v13.Y, v19.Z) + Vector3.new(-0, -1, -0) * v21).Y, v19.Z))) * v1
	GhostModel:ScaleTo(1)
	GhostModel:PivotTo(sum)
	local v282 = nil
	local v29 = p1:_isOverlapping(sum, nil, 2)
	local v302 = nil
	local v31 = nil
	local v322 = (1 / 0)
	if t3.GlobalSnapping then
		local v33 = if v14 == nil then false else v14:IsDescendantOf(v30) and v14
		if v33 and (v29 and not table.find(v29, v33)) then
			table.insert(v29, v33)
		end
		for v39, v40 in v72 and { v72 } or (if v29 then v29 else { v33 }) do
			local v35, v362, v37, v38
			if v40 and v40:IsDescendantOf(v30) then
				if v40.Parent:IsA("Model") then
					v35 = v40.Parent
					v362 = v35.PrimaryPart or v40
				else
					v35 = nil
					v362 = v40
				end
				local v41 = nil
				local v42 = true
				local v44 = v7.GetByName(if v35 then v35.Name else v35)
				if v44 then
					v41 = v44.BuildingType
					local v45 = t5[v41]
					local v46 = t5[p1.BuildingData.BuildingType]
					if v45 and not v45[p1.BuildingData.BuildingType] then
						v42 = false
					end
					if v46 and not v46[v41] then
						v42 = false
					end
				end
				if v42 then
					v37 = PrimaryPart
					v38 = if v72 then nil else PrimaryPart.Size.Magnitude * 1.65
					local v47, v48, v49, v50 = p1:_calculateTranslationVectorForSnapping(PrimaryPart, v362, v41, v38)
					if v47 and (v48 and v49) then
						if not v302 then
							v302 = Vector3.new(1, 1, 1) * (1 / 0)
							v322 = (1 / 0)
						end
						if (if v50 < v322 then true else false) or ((if v50 == v322 then if v47.Magnitude < v302.Magnitude then true else false else false) or (if v47.Magnitude < v302.Magnitude * 0.35 then true else false)) then
							v322 = v50
							v302 = v47
							PrimaryPart = v37
							v31 = v40
							continue
						end
						PrimaryPart = v37
						continue
					end
					PrimaryPart = v37
				end
			end
		end
		if v31 and (v302 and v302.Magnitude > 0) then
			sum = sum + v302
			if p1:_isOverlapping(sum) then
				sum = sum - v302
				v282 = false
			else
				v282 = true
			end
		end
	end
	local v55, v56 = p1:GetClampedPoint(sum.p, not v282, v14, v20)
	local v57 = v55 * Vector3.new(1, 1, 1)
	if v282 and not v56 then
		v57 = v57 * Vector3.new(1, 0, 1) + Vector3.new(0, sum.p.Y, 0)
	end
	local v58 = CFrame.new(v57) * v1
	local v59 = p1:_isOverlapping(v58, not v282)
	p1:SetError("Overlap", v59)
	p1.Highlight.FillTransparency = if v59 then 0.25 else 1
	p1.BuildCF = v58
	v3.target(VisualModel, 0.875, 9, {
		Pivot = p1.BuildCF
	})
end
function t.GetSignal(p1, p2) --[[ GetSignal | Line: 1168 | Upvalues: v5 (copy) ]]
	if not p1.Signals[p2] then
		p1.Signals[p2] = v5.new()
	end
	return p1.Signals[p2]
end
function t._getRotateIncrement(p1) --[[ _getRotateIncrement | Line: 1175 | Upvalues: t3 (copy) ]]
	if t3.RotateIncrement then
		return 15
	else
		return 45
	end
end
function t.IsEnabled(p1) --[[ IsEnabled | Line: 1183 | Upvalues: v19 (ref) ]]
	return v19
end
function t.PlayCraftedEffect(p1, p2, p3) --[[ PlayCraftedEffect | Line: 1187 | Upvalues: v7 (copy), ReplicatedStorage (copy), v13 (copy) ]]
	task.spawn(function() --[[ Line: 1188 | Upvalues: v7 (ref), p2 (copy), ReplicatedStorage (ref), p3 (copy), v13 (ref) ]]
		local t = {
			TextLabel = {
				TextTransparency = 1,
				TextStrokeTransparency = 1
			},
			ImageLabel = {
				BackgroundTransparency = 1,
				ImageTransparency = 1
			}
		}
		local v1 = v7.GetByName(p2)
		if not v1.Crafting then
			return
		end
		local v2 = ReplicatedStorage.Storage.Assets.Effects.Crafted:Clone()
		local MaterialsGui = v2.MaterialsGui
		MaterialsGui.Enabled = true
		v2.WorldPosition = p3
		v2.Parent = workspace.Terrain
		local tbl = {}
		for k, v in pairs(v1.Crafting) do
			local v3 = v7.GetByName(k)
			local v4 = MaterialsGui.Default:Clone()
			v4.Name = k
			v4.Viewport.Image = v3.Image
			v4.Viewport.Viewport.Image = v3.Image
			v4.Viewport.AmountLabel.Text = "-" .. v13.suffix(v)
			v4.UIScale.Scale = 0
			v4.Visible = true
			v4.Parent = MaterialsGui
			local t2 = {}
			for k2, v5 in pairs(v4:GetDescendants()) do
				local v52 = t[v5.ClassName]
				if v52 then
					t2[v5] = {}
					for k3, v6 in pairs(v52) do
						t2[v5][k3] = v5[k3]
						v5[k3] = v6
					end
				end
			end
			tbl[v4] = t2
		end
		for k, v in pairs(tbl) do
			game.TweenService:Create(k.UIScale, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Scale = 1
			}):Play()
			for k2, v3 in pairs(v) do
				game.TweenService:Create(k2, TweenInfo.new(0.15), v3):Play()
			end
		end
		task.wait(0.45)
		local v6 = nil
		for k, v in pairs(tbl) do
			for k2, v3 in pairs(v) do
				local v72 = game.TweenService:Create(k2, TweenInfo.new(0.6), t[k2.ClassName])
				v72:Play()
				v6 = v72
			end
		end
		v6.Completed:Wait()
		v2:Destroy()
	end)
end
function t.Init(p1) --[[ Init | Line: 1264 | Upvalues: t (copy), t2 (copy), v5 (copy), t3 (copy), v25 (ref), v28 (ref), v18 (ref), v20 (ref), v8 (copy), v1 (copy), v14 (copy), v17 (copy), v15 (copy), v38 (ref), v9 (copy), v30 (ref), ReplicatedStorage (copy), v16 (copy), v4 (copy), v19 (ref), v12 (copy), LocalPlayer (copy), UserInputService (copy), v11 (copy), v24 (copy), PlacementFrame (copy), v26 (ref), v27 (ref), v10 (copy) ]]
	t.Signals = {}
	t.ErrorCodes = t2
	t.ErrorSignal = v5.new()
	t.BuildToggles = t3
	local v13 = nil
	v13 = {
		Rotate = {
			InputBegan = function(p12, p2, p3) --[[ InputBegan | Line: 1276 | Upvalues: v25 (ref), v28 (ref), p1 (copy) ]]
				local v1 = tick()
				v25 = v1
				local v2 = v28
				local v3 = p1:_getRotateIncrement()
				v28 = v2 + math.rad(v3)
				if p3 ~= "Gamepad" then
					return
				end
				task.delay(0.3, function() --[[ Line: 1282 | Upvalues: v25 (ref), v1 (copy), v28 (ref), p1 (ref) ]]
					while v25 == v1 do
						v28 = v28 + math.rad((p1:_getRotateIncrement()))
						task.wait(0.175)
					end
				end)
			end,
			InputEnded = function(p1, p2, p3) --[[ InputEnded | Line: 1290 | Upvalues: v25 (ref) ]]
				if p3 == "Gamepad" then
					v25 = nil
				end
			end
		},
		RotateLeft = {
			InputBegan = function(p12, p2, p3) --[[ InputBegan | Line: 1296 | Upvalues: v28 (ref), p1 (copy) ]]
				v28 = v28 + math.rad((p1:_getRotateIncrement()))
			end
		},
		RotateRight = {
			InputBegan = function(p12, p2, p3) --[[ InputBegan | Line: 1301 | Upvalues: v28 (ref), p1 (copy) ]]
				v28 = v28 - math.rad((p1:_getRotateIncrement()))
			end
		},
		Move = {
			InputBegan = function() --[[ InputBegan | Line: 1306 | Upvalues: v18 (ref), p1 (copy), v20 (ref), v8 (ref) ]]
				if v18 then
					return
				end
				v18 = true
				p1:GetSignal("SetFrameHidden"):Fire(true)
				if v20 ~= "Building" or not p1.SelectedPlacement then
					p1:_setEditOptions({ "Rotate", "RotateLeft", "RotateRight", "Cancel", "Move", "Confirm" })
					return
				end
				p1:Enable("Building", {
					ID = p1.SelectedPlacement.ID,
					Model = v8.Get(p1.SelectedPlacement.Name),
					Name = p1.SelectedPlacement.Name,
					EditModel = p1.SelectedPlacement.Model
				})
				p1:_setEditOptions({ "Rotate", "RotateLeft", "RotateRight", "Cancel", "Move", "Confirm" })
			end
		},
		Cancel = {
			InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 1331 | Upvalues: v20 (ref), t (ref) ]]
				if v20 == "Building" then
					t:GetSignal("UnselectBuilding"):Fire()
				else
					t:GetSignal("ExitBuildMode"):Fire()
				end
			end
		},
		PutAway = {
			InputBegan = function(p12, p2, p3) --[[ InputBegan | Line: 1340 | Upvalues: p1 (copy), v1 (ref) ]]
				local v2 = v1.GetRemoteFunction("RemoveBuild")
				if not v2:InvokeServer((tonumber((p1.CurrentPlacement or p1.SelectedPlacement).ID))) then
					return
				end
				if p1.CurrentPlacement then
					p1.CurrentPlacement.EditModel = nil
				end
				p1:Enable("Building")
			end
		},
		Confirm = {
			InputBegan = function() --[[ InputBegan | Line: 1353 | Upvalues: v13 (ref) ]]
				v13.PlaceDown.InputBegan()
			end
		},
		PlaceDown = {
			InputBegan = function(p12, p2) --[[ InputBegan | Line: 1358 | Upvalues: v20 (ref), p1 (copy), v14 (ref), v17 (ref), v15 (ref), v38 (ref), v28 (ref), v1 (ref), v9 (ref), v30 (ref), ReplicatedStorage (ref) ]]
				if v20 == "PlacePlot" then
					if not p1:CanPlace() then
						return
					end
					local v12, v2 = v14.CanLoadPlot(v17)
					if v12 ~= true then
						v15.NotifyIssue(v12, v2)
						return
					end
					local v3 = v38
					local v4 = string.pack("ffff", v3.X, v3.Y, v3.Z, v28)
					local v5 = v1.GetRemoteEvent("PlacePlot")
					if not v5:InvokeServer(v4, p1.CurrentPlacement.GetID and p1.CurrentPlacement.GetID(p1)) then
						return
					end
					v14.SetNextPlotCooldown(v17)
					if p1.CurrentPlacement.OnPlaced then
						p1.CurrentPlacement.OnPlaced()
					end
				else
					if v20 ~= "Building" then
						return
					end
					if p1.CurrentPlacement then
						if p1:CanPlace() then
							local v7 = p1.CurrentPlacement.ID or p1.CurrentPlacement.GetID and p1.CurrentPlacement.GetID(p1)
							if not v7 then
								return
							end
							local p = p1.BuildCF.p
							local v8 = string.pack("ffff", p.X, p.Y, p.Z, v28)
							local v92 = p1.VisualModel:Clone()
							v92:PivotTo(p1.BuildCF)
							v92.Parent = v30
							local v10 = v1.GetRemoteEvent("PlaceBuild"):InvokeServer(v8, (tonumber(v7)))
							v92:Destroy()
							if not v10 then
								return
							end
							if not p1.CurrentPlacement.ID then
								p1:PlayCraftedEffect(p1.CurrentPlacement.Name, p1.BuildCF.p)
							end
							if p1.CurrentPlacement.EditModel then
								p1:GetSignal("SetFrameHidden"):Fire(false)
							end
							ReplicatedStorage.Storage.SFX.ItemPlacement.Pitch = Random.new():NextNumber(0.8, 1.2)
							ReplicatedStorage.Storage.SFX.ItemPlacement:Play()
							if p1.CurrentPlacement.OnPlaced and not p1.CurrentPlacement.EditModel then
								p1.CurrentPlacement.OnPlaced()
							else
								if not p1.CurrentPlacement.EditModel then
									p1:_resetEditModel()
									return
								end
								p1:Enable("Building")
							end
						else
							if not v9.IsMobileInputType() then
								return
							end
							p1:GetSignal("SetFrameHidden"):Fire(false)
							p1:Enable("Building")
						end
						p1:_resetEditModel()
						return
					end
					p1:SelectTarget()
				end
			end
		},
		DeletePlacement = {
			InputBegan = function() --[[ InputBegan | Line: 1424 | Upvalues: v16 (ref), p1 (copy), v1 (ref) ]]
				v16.Prompt({
					Type = "DeleteBuildable",
					Run = function() --[[ Run | Line: 1428 | Upvalues: p1 (ref), v1 (ref) ]]
						local v2 = v1.GetRemoteFunction("DeleteBuild")
						if not v2:InvokeServer((tonumber((p1.CurrentPlacement or p1.SelectedPlacement).ID))) then
							return true
						end
						if p1.CurrentPlacement then
							p1.CurrentPlacement.EditModel = nil
						end
						p1:Enable("Building")
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 1441 ]]
						return true
					end
				})
			end
		}
	}
	v4:AddControls("BaseLMB", { Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonX }, v13.PlaceDown, function() --[[ Line: 1455 | Upvalues: v19 (ref), v12 (ref) ]]
		return v19 and not v12.InGamepadSelection()
	end)
	v4:AddControls("BaseRotate", { Enum.KeyCode.R, Enum.KeyCode.ButtonY }, v13.Rotate, function() --[[ Line: 1462 | Upvalues: v19 (ref), p1 (copy), v12 (ref) ]]
		return v19 and (p1.CurrentPlacement and not v12.InGamepadSelection())
	end)
	v4:AddControls("RemovePlacement", { Enum.KeyCode.X, Enum.KeyCode.ButtonL1 }, v13.PutAway, function() --[[ Line: 1469 | Upvalues: v19 (ref), p1 (copy), v12 (ref) ]]
		return v19 and (p1.SelectedPlacement and not v12.InGamepadSelection())
	end)
	v4:AddControls("EditPlacement", { Enum.KeyCode.E, Enum.KeyCode.ButtonY }, {
		InputBegan = function(p12, p2, p3) --[[ InputBegan | Line: 1478 | Upvalues: p1 (copy), v8 (ref) ]]
			p1:Enable("Building", {
				ID = p1.SelectedPlacement.ID,
				Model = v8.Get(p1.SelectedPlacement.Name),
				Name = p1.SelectedPlacement.Name,
				EditModel = p1.SelectedPlacement.Model
			})
		end
	}, function() --[[ Line: 1486 | Upvalues: v19 (ref), p1 (copy), v12 (ref) ]]
		return v19 and (p1.SelectedPlacement and not v12.InGamepadSelection())
	end)
	v4:AddControls("CancelPlacement", { Enum.KeyCode.Q, Enum.KeyCode.ButtonB }, v13.Cancel, function() --[[ Line: 1493 | Upvalues: v19 (ref), v12 (ref) ]]
		return v19 and not v12.InGamepadSelection()
	end)
	v4:AddControls("DeletePlacement", { Enum.KeyCode.Z, Enum.KeyCode.ButtonX }, v13.DeletePlacement, function() --[[ Line: 1500 | Upvalues: v19 (ref), p1 (copy), v12 (ref) ]]
		return v19 and (p1.SelectedPlacement and not v12.InGamepadSelection())
	end)
	v4:AddControls("BaseToggleGrid", { Enum.KeyCode.V }, {
		InputBegan = function(p12, p2, p3) --[[ InputBegan | Line: 1507 | Upvalues: t3 (ref), p1 (copy) ]]
			t3.SmallGrid = not t3.SmallGrid
			p1:GetSignal("SmallGrid"):Fire()
		end
	}, function() --[[ Line: 1511 | Upvalues: v19 (ref) ]]
		return v19
	end)
	v4:AddControls("BaseToggleSnap", { Enum.KeyCode.T }, {
		InputBegan = function(p12, p2, p3) --[[ InputBegan | Line: 1517 | Upvalues: p1 (copy), t3 (ref) ]]
			p1:SetSnapping(not t3.GlobalSnapping)
		end
	}, function() --[[ Line: 1520 | Upvalues: v19 (ref) ]]
		return v19
	end)
	v4:AddControls("BaseToggleRotate", { Enum.KeyCode.B }, {
		InputBegan = function(p12, p2, p3) --[[ InputBegan | Line: 1527 | Upvalues: p1 (copy), t3 (ref) ]]
			p1:SetRotateIncrement(not t3.RotateIncrement)
		end
	}, function() --[[ Line: 1530 | Upvalues: v19 (ref) ]]
		return v19
	end)
	local v2 = LocalPlayer:GetMouse()
	local v3 = UserInputService:GetMouseLocation() + Vector2.new(0, game.GuiService.TopbarInset)
	local v42 = Vector2.new()
	local v52 = UDim2.new()
	local v6 = nil
	game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 1540 | Upvalues: v19 (ref), p1 (copy), v12 (ref), v11 (ref), LocalPlayer (ref), UserInputService (ref), v20 (ref), v24 (ref), PlacementFrame (ref), v18 (ref), v6 (ref), v42 (ref), v52 (ref), v3 (ref), v26 (ref), v27 (ref), v2 (copy) ]]
		if not v19 then
			p1:SetError("IsInRestrictedZone", false)
			return
		end
		if v12.InGamepadSelection() then
			return
		end
		p1:SetError("IsInRestrictedZone", v11:IsInZone(LocalPlayer.Character.PrimaryPart.Position))
		local v1 = UserInputService:GetMouseLocation() + Vector2.new(0, game.GuiService.TopbarInset)
		local v22 = p1.SelectedPlacement and p1.SelectedPlacement.Model.PrimaryPart or (v20 == "Building" and p1.VisualModel and p1.VisualModel.PrimaryPart or v24)
		if PlacementFrame.Mobile.Visible then
			if v18 then
				if not v6 then
					v42 = Vector2.new()
					v6 = v52
					v3 = v1
				end
				v42 = v42 + (v1 - v3)
				PlacementFrame.Mobile.Position = UDim2.fromOffset(v6.X.Offset + v42.X, v6.Y.Offset + v42.Y)
				v3 = v1
				v52 = PlacementFrame.Mobile.Position
			else
				v6 = nil
				v42 = Vector2.new()
				local v32 = workspace.Camera:WorldToScreenPoint(v22.Position)
				PlacementFrame.Mobile.Position = UDim2.new(0, v32.X, 0, v32.Y)
				v3 = Vector2.new(math.round(v32.X), (math.round(v32.Y)))
				v52 = UDim2.fromOffset(math.round(v32.X), (math.round(v32.Y)))
			end
		elseif PlacementFrame.Other.Visible then
			local v7 = workspace.Camera:WorldToScreenPoint(v22.Position)
			PlacementFrame.Other.Position = UDim2.new(0, v7.X, 0, v7.Y + game.GuiService.TopbarInset.Height)
		end
		if v18 then
			local v10 = Vector2.new(math.round(v52.X.Offset), (math.round(v52.Y.Offset)))
			local v112 = workspace.Camera:ScreenPointToRay(v10.X, v10.Y)
			v26 = v112.Origin
			v27 = v112.Direction.Unit * 1000
		elseif not PlacementFrame.Mobile.Visible then
			v26 = v2.UnitRay.Origin
			v27 = v2.UnitRay.Direction
		end
		if v20 == "PlacePlot" then
			p1:_updatePlot()
			return
		end
		if v20 ~= "Building" or not p1.GhostModel then
			return
		end
		p1:_updateModel()
	end)
	for k, v in pairs(PlacementFrame.Mobile:GetChildren()) do
		if v:IsA("ImageButton") then
			local v7 = v13[v.Name]
			v10.new(v, {
				Sound = false,
				HoverSound = false,
				NoHoverShadowLabel = true,
				NoHoverColor = true
			})
			v10:RegisterAction(v, "OnDown", function() --[[ Line: 1612 | Upvalues: v7 (copy), v17 (ref) ]]
				if v7 then
					v7.InputBegan(v17, Enum.UserInputType.Touch, "Mobile")
				end
			end)
			v10:RegisterAction(v, "OnEnded", function() --[[ Line: 1616 | Upvalues: v7 (copy), v17 (ref) ]]
				if not v7 then
					return
				end
				if v7.InputEnded then
					v7.InputEnded(v17, Enum.UserInputType.Touch, "Mobile")
				end
			end)
		end
	end
	UserInputService.TouchTapInWorld:Connect(function(p12, p2) --[[ Line: 1623 | Upvalues: v19 (ref), v20 (ref), p1 (copy) ]]
		if not v19 then
			return
		end
		if v20 ~= "Building" then
			return
		end
		if p2 then
			return
		end
		p1:SelectTarget()
	end)
	UserInputService.InputEnded:Connect(function(p1) --[[ Line: 1630 | Upvalues: v18 (ref), v19 (ref), v20 (ref) ]]
		if not v18 then
			return
		end
		if not v19 then
			return
		end
		if p1.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		v18 = false
	end)
	local function setPlacementControlsFrame() --[[ setPlacementControlsFrame | Line: 1643 | Upvalues: PlacementFrame (ref), v9 (ref) ]]
		PlacementFrame.Mobile.Visible = v9.IsMobileInputType()
		PlacementFrame.Other.Visible = not PlacementFrame.Mobile.Visible
	end
	v9.InputTypeChanged:Connect(setPlacementControlsFrame)
	PlacementFrame.Mobile.Visible = v9.IsMobileInputType()
	PlacementFrame.Other.Visible = not PlacementFrame.Mobile.Visible
end
t:Init()
return t