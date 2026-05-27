-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CurrentCamera = workspace.CurrentCamera
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local ContentProvider = game:GetService("ContentProvider")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("MathUtils")
local v3 = Sonar("GuiManager")
local v4 = Sonar("BeamService")
local v5 = Sonar("Constants")
local v6 = CFrame.Angles(0, -1.5707963267948966, 0)
local v7 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 1, true)
local v8 = 5 + v7.Time * v7.RepeatCount
local t2 = {
	Mounted = 12,
	Dismounted = 5
}
local Neon = Enum.Material.Neon
local t3 = {
	Up = 0,
	Right = 90,
	Down = 180,
	Left = 270
}
local t4 = {
	Up = Vector2.new(0.5, 0),
	Right = Vector2.new(1, 0.5),
	Down = Vector2.new(0.5, 1),
	Left = Vector2.new(0, 0.5)
}
local v9 = Color3.fromRGB(76, 139, 33)
local LocalPlayer = game:GetService("Players").LocalPlayer
local v10 = Sonar("PlayerWrapper").GetClient()
local ContextualGui = LocalPlayer.PlayerGui:WaitForChild("ContextualGui")
local TextLabel = ContextualGui:WaitForChild("ArrowFrame"):WaitForChild("TextLabel")
local ViewportFrame = ContextualGui:WaitForChild("ArrowFrame"):WaitForChild("ViewportFrame")
local Position = ContextualGui.ArrowFrame.Position
local Camera = Instance.new("Camera")
Camera.FieldOfView = 35
Camera.Parent = ViewportFrame
ViewportFrame.CurrentCamera = Camera
local v11 = v1.new()
local v12 = v1.new()
local WorldspaceArrow = script:WaitForChild("WorldspaceArrow")
local Size = WorldspaceArrow.Size
local v13 = Instance.new("NumberValue")
local v14 = nil
local DefaultArrow = ContextualGui.DefaultArrow
local function v15(p1) --[[ isActuallyVisible | Line: 80 | Upvalues: v15 (copy) ]]
	if p1 == nil then
		return false
	end
	if p1.ClassName == "PlayerGui" then
		return true
	end
	if p1:IsA("LayerCollector") and p1.Enabled then
		return v15(p1.Parent)
	end
	if p1:IsA("GuiObject") and p1.Visible then
		return v15(p1.Parent)
	else
		return false
	end
end
local function getPositionFromPointTo(p1) --[[ getPositionFromPointTo | Line: 89 ]]
	if typeof(p1) == "Instance" then
		if p1:IsA("Attachment") then
			return p1.WorldPosition
		else
			return p1.Position
		end
	elseif type(p1) == "function" then
		return p1()
	else
		return p1
	end
end
function t.PreloadAssets() --[[ PreloadAssets | Line: 103 | Upvalues: t (copy), ContentProvider (copy), ContextualGui (copy), v4 (copy) ]]
	if not t.PreloadedAssets then
		t.PreloadedAssets = true
		task.spawn(ContentProvider.PreloadAsync, ContentProvider, { ContextualGui, script.ClickIndicatorGui, v4.TemplateBeam })
	end
end
function t.SetWorldspacePointTo(p1, p2) --[[ SetWorldspacePointTo | Line: 115 | Upvalues: v11 (copy), v14 (ref), WorldspaceArrow (copy), v9 (copy), Neon (copy), CurrentCamera (copy), RunService (copy), v10 (copy), v8 (copy), TweenService (copy), v13 (copy), v7 (copy), v2 (copy), v5 (copy), t2 (copy), Size (copy), v6 (copy), t (copy) ]]
	v11:DoCleaning()
	if not p1 then
		v14 = nil
		WorldspaceArrow.Parent = script
		return
	end
	local v22 = p2 or {}
	v14 = p1
	local v3 = 0
	local v4 = WorldspaceArrow
	v4.Color = v22.Color or v9
	local v62 = WorldspaceArrow
	v62.Material = v22.Material or Neon
	WorldspaceArrow.Transparency = 0
	WorldspaceArrow.Parent = CurrentCamera
	local v82 = nil
	v11:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 135 | Upvalues: v10 (ref), p1 (copy), v82 (ref), v3 (ref), v8 (ref), TweenService (ref), v13 (ref), v7 (ref), v22 (ref), WorldspaceArrow (ref), v2 (ref), v5 (ref), t2 (ref), Size (ref), v6 (ref) ]]
		if not v10.PrimaryPart then
			return
		end
		local v1 = p1
		local v23 = if typeof(v1) == "Instance" then if v1:IsA("Attachment") then v1.WorldPosition else v1.Position elseif type(v1) == "function" then v1() else v1
		if v23 then
			v82 = v23
		else
			v23 = v82
		end
		if not v23 then
			return
		end
		if v8 <= tick() - v3 then
			v3 = tick()
			TweenService:Create(v13, TweenInfo.new(), {
				Value = 0
			}):Play()
			TweenService:Create(v13, v7, {
				Value = 1.5
			}):Play()
		end
		if not v22.AlwaysVisible then
			WorldspaceArrow.Transparency = math.clamp(1 - v2.map((v23 - WorldspaceArrow.CFrame.p).Magnitude + 0.25, v22.MinRange or 5, v22.MaxRange or 20, v22.MaxTransparency or 0, 1), 0, 1)
		end
		local v72 = v5.GetMountedEntity and v5.GetMountedEntity()
		WorldspaceArrow.Size = v22.Size and Size * v22.Size or (v72 and Size * 2 or Size)
		WorldspaceArrow.CFrame = CFrame.new(v10.PrimaryPart.CFrame.p, v23) * CFrame.new(0, v22.YOffset or -3, -((v22.DistanceFromCharacter or (v72 and t2.Mounted or t2.Dismounted)) + v13.Value)) * v6
	end))
	if not v22.Wait then
		return
	end
	task.delay(v22.Wait, function() --[[ Line: 169 | Upvalues: t (ref), p1 (copy) ]]
		if not t.IsWorldspacePointTo(p1) then
			return
		end
		t.SetWorldspacePointTo()
	end)
end
function t.SetGuiWorldspacePointTo(p1, p2, p3) --[[ SetGuiWorldspacePointTo | Line: 178 | Upvalues: v12 (copy), TweenService (copy), ViewportFrame (copy), TextLabel (copy), v3 (copy), ContextualGui (copy), Position (copy), v9 (copy), Neon (copy), RunService (copy), Camera (copy), CurrentCamera (copy) ]]
	v12:DoCleaning()
	local v2 = p2 or {}
	if not p1 then
		TweenService:Create(ViewportFrame, TweenInfo.new(0.5), {
			Size = UDim2.new(0, 0, 0, 0)
		}):Play()
		TextLabel.Visible = false
		return
	end
	ViewportFrame.Size = UDim2.new(0, 0, 0, 0)
	local v32 = v3.getFrameFromInstance(ContextualGui.ArrowFrame)
	v32.OpenPosition = v2.GuiPosition or Position
	ContextualGui.ArrowFrame.Position = v32.OpenPosition
	ViewportFrame.Visible = true
	TweenService:Create(ViewportFrame, TweenInfo.new(0.75, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 1, 0)
	}):Play()
	local Arrow = ViewportFrame.Arrow
	Arrow.Color = v2.Color or v9
	local Arrow_2 = ViewportFrame.Arrow
	Arrow_2.Material = v2.Material or Neon
	if p3 then
		TextLabel.Text = p3
		TextLabel.Visible = true
	else
		TextLabel.Visible = false
	end
	local v7 = nil
	v12:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 209 | Upvalues: p1 (copy), v7 (ref), Camera (ref), CurrentCamera (ref), ViewportFrame (ref), v2 (ref), v32 (copy) ]]
		local v1 = p1
		local v22 = if typeof(v1) == "Instance" then if v1:IsA("Attachment") then v1.WorldPosition else v1.Position elseif type(v1) == "function" then v1() else v1
		if v22 then
			v7 = v22
		else
			v22 = v7
		end
		if not v22 then
			return
		end
		Camera.CFrame = CurrentCamera.CFrame
		ViewportFrame.Arrow.CFrame = CFrame.new((CurrentCamera.CFrame * CFrame.new(0, 0, -10)).p, v22) * CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0)
		if typeof(v2) ~= "table" then
			return
		end
		if typeof(v2.Visible) ~= "function" then
			return
		end
		v32.Frame.Visible = v2.Visible() and true or false
	end))
end
function t.SetVerticalWorldspaceArrow(p1) --[[ SetVerticalWorldspaceArrow | Line: 228 | Upvalues: v9 (copy), Neon (copy), CurrentCamera (copy), TweenService (copy) ]]
	local v1 = script.WorldspaceArrow:Clone()
	v1.Color = p1.Color or v9
	v1.Material = p1.Material or Neon
	v1.Size = p1.Size or v1.Size
	v1.Position = p1.StartPosition
	v1.Orientation = p1.StartOrientation
	v1.Parent = CurrentCamera
	TweenService:Create(v1, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
		Position = p1.StartPosition - p1.DownPosition
	}):Play()
	TweenService:Create(v1, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
		Orientation = p1.TargetOrientation
	}):Play()
	return v1
end
function t.SetWorldspaceClickPointTo(p1) --[[ SetWorldspaceClickPointTo | Line: 247 | Upvalues: ContextualGui (copy), CollectionService (copy), TweenService (copy), RunService (copy) ]]
	local v1 = script.ClickIndicatorGui:Clone()
	local ClickLabel = v1.Frame.ClickLabel
	v1.Enabled = false
	v1.Parent = ContextualGui
	CollectionService:AddTag(v1.MobileScale, "MobileUIScale")
	ClickLabel.PromptLabels.Visible = p1.ShowPrompt
	v1.StudsOffsetWorldSpace = p1.StudsOffsetWorldSpace or v1.StudsOffsetWorldSpace
	task.spawn(function() --[[ Line: 259 | Upvalues: v1 (copy), TweenService (ref), ClickLabel (copy) ]]
		while v1.Parent do
			local v12 = TweenService:Create(ClickLabel, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Position = UDim2.new(0.5, 0, 1, 0)
			})
			v12:Play()
			v12.Completed:Wait()
			local v2 = TweenService:Create(ClickLabel, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Position = UDim2.new(0.5, 0, 0.5, 0)
			})
			v2:Play()
			v2.Completed:Wait()
		end
	end)
	local v3 = RunService.Heartbeat:Connect(function() --[[ Line: 276 | Upvalues: p1 (copy), v1 (copy) ]]
		if type(p1.Adornee) == "function" then
			v1.Adornee = p1.Adornee()
		else
			v1.Adornee = p1.Adornee
		end
		v1.Enabled = v1.Adornee and (if p1.CheckVisibility then p1.CheckVisibility() else true)
	end)
	local function f4() --[[ Line: 292 | Upvalues: v3 (copy), v1 (copy) ]]
		v3:Disconnect()
		v1:Destroy()
	end
	if p1.Delay then
		task.delay(p1.Delay, f4)
	end
	return f4
end
function t.HasWorldspacePointTo() --[[ HasWorldspacePointTo | Line: 304 | Upvalues: v14 (ref) ]]
	return v14
end
function t.IsWorldspacePointTo(p1) --[[ IsWorldspacePointTo | Line: 308 | Upvalues: v14 (ref) ]]
	return v14 == p1
end
function t.SetGuiPointTo(p1) --[[ SetGuiPointTo | Line: 312 | Upvalues: DefaultArrow (copy), t3 (copy), CollectionService (copy), t4 (copy), RunService (copy), v15 (copy), ContextualGui (copy) ]]
	local Direction = p1.Direction
	local Offset = p1.Offset
	local v1 = DefaultArrow:Clone()
	local ImageLabel = v1.ImageContainer.ImageLabel
	v1.ImageContainer.Rotation = t3[Direction]
	CollectionService:AddTag(ImageLabel, "PointingArrow")
	CollectionService:AddTag(v1.MobileScale, "MobileUIScale")
	v1.AnchorPoint = t4[Direction]
	local function getGuiElement() --[[ getGuiElement | Line: 325 | Upvalues: p1 (copy) ]]
		if p1.ParentFrame then
			local v1 = p1.ParentFrame:FindFirstChild(p1.WaitingElement)
			if not v1 then
				return
			end
			return p1.ChildElement and v1:FindFirstChild(p1.ChildElement) or v1
		elseif type(p1.GuiElement) == "function" then
			return p1.GuiElement()
		else
			return p1.GuiElement
		end
	end
	local v2 = RunService.Heartbeat:Connect(function() --[[ Line: 340 | Upvalues: getGuiElement (copy), Direction (copy), v1 (copy), Offset (copy), p1 (copy), v15 (ref), ImageLabel (copy) ]]
		local v12 = getGuiElement()
		if v12 then
			local AbsolutePosition = v12.AbsolutePosition
			local AbsoluteSize = v12.AbsoluteSize
			if Direction == "Up" then
				v1.Position = UDim2.new(0, AbsolutePosition.X + AbsoluteSize.X / 2, 0, AbsolutePosition.Y + AbsoluteSize.Y - Offset)
			elseif Direction == "Right" then
				v1.Position = UDim2.new(0, AbsolutePosition.X + Offset, 0, AbsolutePosition.Y + AbsoluteSize.Y / 2)
			elseif Direction == "Down" then
				v1.Position = UDim2.new(0, AbsolutePosition.X + AbsoluteSize.X / 2, 0, AbsolutePosition.Y + Offset)
			elseif Direction == "Left" then
				v1.Position = UDim2.new(0, AbsolutePosition.X + AbsoluteSize.X - Offset, 0, AbsolutePosition.Y + AbsoluteSize.Y / 2)
			end
		end
		if p1.NextElement then
			local v2 = type(p1.NextElement) == "function"
			if v2 and not p1.NextElement() or not v2 and v15(p1.NextElement) then
				v1.Visible = false
				return
			end
		end
		v1.Visible = v15(v12)
		ImageLabel.NotLoadedLabel.Visible = not ImageLabel.IsLoaded
	end)
	v1.Parent = ContextualGui
	local function f3() --[[ Line: 372 | Upvalues: v1 (copy), v2 (copy), CollectionService (ref), ImageLabel (copy) ]]
		if v1.Parent then
			v2:Disconnect()
			CollectionService:RemoveTag(ImageLabel, "PointingArrow")
			v1:Destroy()
		end
	end
	if p1.Delay then
		task.delay(p1.Delay, f3)
	end
	return f3
end
for v16, v17 in v4 do
	if not t[v16] then
		t[v16] = v17
	end
end
CollectionService:GetInstanceAddedSignal("PointingArrow"):Connect(function(p1) --[[ Line: 391 | Upvalues: CollectionService (copy), TweenService (copy) ]]
	while CollectionService:HasTag(p1, "PointingArrow") do
		local v1 = TweenService:Create(p1, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			Position = UDim2.new(0.5, 0, -0.1, 0)
		})
		v1:Play()
		v1.Completed:Wait()
		local v2 = TweenService:Create(p1, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			Position = UDim2.new(0.5, 0, 0.25, 0)
		})
		v2:Play()
		v2.Completed:Wait()
	end
end)
v3.AddFrame(ContextualGui.ArrowFrame, {
	Overlay = true,
	TweenAnimation = false,
	KeepPosition = true
})
return t