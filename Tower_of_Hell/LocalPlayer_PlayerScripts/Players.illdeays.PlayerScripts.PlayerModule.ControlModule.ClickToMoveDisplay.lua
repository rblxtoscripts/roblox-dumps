-- https://lua.expert/
local t = {}
local v1 = "rbxasset://textures/ui/traildot.png"
local v2 = "rbxasset://textures/ui/waypoint.png"
local v3 = false
local v4 = UDim2.new(0, 42, 0, 50)
local v5 = Vector2.new(0, 0.5)
local v6 = Vector2.new(0, 1)
local v7 = Vector2.new(0, 0.5)
local v8 = Vector2.new(0.1, 0.5)
local v9 = Vector2.new(-0.1, 0.5)
local v10 = Vector2.new(1.5, 1.5)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local function CreateWaypointTemplates() --[[ CreateWaypointTemplates | Line: 44 | Upvalues: v10 (ref), v3 (ref), v1 (ref), v4 (copy), v5 (copy), v2 (ref), v7 (copy) ]]
	local TrailDot = Instance.new("Part")
	TrailDot.Size = Vector3.new(1, 1, 1)
	TrailDot.Anchored = true
	TrailDot.CanCollide = false
	TrailDot.Name = "TrailDot"
	TrailDot.Transparency = 1
	local TrailDotImage = Instance.new("ImageHandleAdornment")
	TrailDotImage.Name = "TrailDotImage"
	TrailDotImage.Size = v10
	TrailDotImage.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
	TrailDotImage.AlwaysOnTop = v3
	TrailDotImage.Image = v1
	TrailDotImage.Adornee = TrailDot
	TrailDotImage.Parent = TrailDot
	local EndWaypoint = Instance.new("Part")
	EndWaypoint.Size = Vector3.new(2, 2, 2)
	EndWaypoint.Anchored = true
	EndWaypoint.CanCollide = false
	EndWaypoint.Name = "EndWaypoint"
	EndWaypoint.Transparency = 1
	local TrailDotImage_2 = Instance.new("ImageHandleAdornment")
	TrailDotImage_2.Name = "TrailDotImage"
	TrailDotImage_2.Size = v10
	TrailDotImage_2.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
	TrailDotImage_2.AlwaysOnTop = v3
	TrailDotImage_2.Image = v1
	TrailDotImage_2.Adornee = EndWaypoint
	TrailDotImage_2.Parent = EndWaypoint
	local EndWaypointBillboard = Instance.new("BillboardGui")
	EndWaypointBillboard.Name = "EndWaypointBillboard"
	EndWaypointBillboard.Size = v4
	EndWaypointBillboard.LightInfluence = 0
	EndWaypointBillboard.SizeOffset = v5
	EndWaypointBillboard.AlwaysOnTop = true
	EndWaypointBillboard.Adornee = EndWaypoint
	EndWaypointBillboard.Parent = EndWaypoint
	local ImageLabel = Instance.new("ImageLabel")
	ImageLabel.Image = v2
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel.Parent = EndWaypointBillboard
	local FailureWaypoint = Instance.new("Part")
	FailureWaypoint.Size = Vector3.new(2, 2, 2)
	FailureWaypoint.Anchored = true
	FailureWaypoint.CanCollide = false
	FailureWaypoint.Name = "FailureWaypoint"
	FailureWaypoint.Transparency = 1
	local TrailDotImage_3 = Instance.new("ImageHandleAdornment")
	TrailDotImage_3.Name = "TrailDotImage"
	TrailDotImage_3.Size = v10
	TrailDotImage_3.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
	TrailDotImage_3.AlwaysOnTop = v3
	TrailDotImage_3.Image = v1
	TrailDotImage_3.Adornee = FailureWaypoint
	TrailDotImage_3.Parent = FailureWaypoint
	local FailureWaypointBillboard = Instance.new("BillboardGui")
	FailureWaypointBillboard.Name = "FailureWaypointBillboard"
	FailureWaypointBillboard.Size = v4
	FailureWaypointBillboard.LightInfluence = 0
	FailureWaypointBillboard.SizeOffset = v7
	FailureWaypointBillboard.AlwaysOnTop = true
	FailureWaypointBillboard.Adornee = FailureWaypoint
	FailureWaypointBillboard.Parent = FailureWaypoint
	local Frame = Instance.new("Frame")
	Frame.BackgroundTransparency = 1
	Frame.Size = UDim2.new(0, 0, 0, 0)
	Frame.Position = UDim2.new(0.5, 0, 1, 0)
	Frame.Parent = FailureWaypointBillboard
	local ImageLabel_2 = Instance.new("ImageLabel")
	ImageLabel_2.Image = v2
	ImageLabel_2.BackgroundTransparency = 1
	ImageLabel_2.Position = UDim2.new(0, -v4.X.Offset / 2, 0, -v4.Y.Offset)
	ImageLabel_2.Size = v4
	ImageLabel_2.Parent = Frame
	return TrailDot, EndWaypoint, FailureWaypoint
end
local v11, v12, v13 = CreateWaypointTemplates()
local function getTrailDotParent() --[[ getTrailDotParent | Line: 130 | Upvalues: Workspace (copy) ]]
	local CurrentCamera = Workspace.CurrentCamera
	local ClickToMoveDisplay = CurrentCamera:FindFirstChild("ClickToMoveDisplay")
	if not ClickToMoveDisplay then
		local ClickToMoveDisplay_2 = Instance.new("Model")
		ClickToMoveDisplay_2.Name = "ClickToMoveDisplay"
		ClickToMoveDisplay_2.Parent = CurrentCamera
		ClickToMoveDisplay = ClickToMoveDisplay_2
	end
	return ClickToMoveDisplay
end
local function placePathWaypoint(p1, p2) --[[ placePathWaypoint | Line: 141 | Upvalues: Workspace (copy), LocalPlayer (copy) ]]
	local v1, v2, v3 = Workspace:FindPartOnRayWithIgnoreList(Ray.new(p2 + Vector3.new(0, 2.5, 0), Vector3.new(0, -10, 0)), { Workspace.CurrentCamera, LocalPlayer.Character })
	if not v1 then
		return
	end
	p1.CFrame = CFrame.new(v2, v2 + v3)
	local CurrentCamera = Workspace.CurrentCamera
	local ClickToMoveDisplay = CurrentCamera:FindFirstChild("ClickToMoveDisplay")
	if not ClickToMoveDisplay then
		local ClickToMoveDisplay_2 = Instance.new("Model")
		ClickToMoveDisplay_2.Name = "ClickToMoveDisplay"
		ClickToMoveDisplay_2.Parent = CurrentCamera
		ClickToMoveDisplay = ClickToMoveDisplay_2
	end
	p1.Parent = ClickToMoveDisplay
end
local t2 = {}
t2.__index = t2
function t2.Destroy(p1) --[[ Destroy | Line: 156 ]]
	p1.DisplayModel:Destroy()
end
function t2.NewDisplayModel(p1, p2) --[[ NewDisplayModel | Line: 160 | Upvalues: v11 (ref), placePathWaypoint (copy) ]]
	local v1 = v11:Clone()
	placePathWaypoint(v1, p2)
	return v1
end
function t2.new(p1, p2) --[[ new | Line: 166 | Upvalues: t2 (copy) ]]
	local v2 = setmetatable({}, t2)
	v2.DisplayModel = v2:NewDisplayModel(p1)
	v2.ClosestWayPoint = p2
	return v2
end
local t3 = {}
t3.__index = t3
function t3.Destroy(p1) --[[ Destroy | Line: 178 ]]
	p1.Destroyed = true
	p1.Tween:Cancel()
	p1.DisplayModel:Destroy()
end
function t3.NewDisplayModel(p1, p2) --[[ NewDisplayModel | Line: 184 | Upvalues: v12 (ref), placePathWaypoint (copy) ]]
	local v1 = v12:Clone()
	placePathWaypoint(v1, p2)
	return v1
end
function t3.CreateTween(p1) --[[ CreateTween | Line: 190 | Upvalues: TweenService (copy), v6 (copy) ]]
	local v2 = TweenService:Create(p1.DisplayModel.EndWaypointBillboard, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true), {
		SizeOffset = v6
	})
	v2:Play()
	return v2
end
function t3.TweenInFrom(p1, p2) --[[ TweenInFrom | Line: 201 | Upvalues: TweenService (copy) ]]
	p1.DisplayModel.EndWaypointBillboard.StudsOffset = Vector3.new(0, (p2 - p1.DisplayModel.Position).Y, 0)
	local v3 = TweenService:Create(p1.DisplayModel.EndWaypointBillboard, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		StudsOffset = Vector3.new(0, 0, 0)
	})
	v3:Play()
	return v3
end
function t3.new(p1, p2, p3) --[[ new | Line: 215 | Upvalues: t3 (copy) ]]
	local v2 = setmetatable({}, t3)
	v2.DisplayModel = v2:NewDisplayModel(p1)
	v2.Destroyed = false
	if p3 and (p3 - p1).Magnitude > 5 then
		v2.Tween = v2:TweenInFrom(p3)
		coroutine.wrap(function() --[[ Line: 222 | Upvalues: v2 (copy) ]]
			v2.Tween.Completed:Wait()
			if v2.Destroyed then
				return
			end
			v2.Tween = v2:CreateTween()
		end)()
	else
		v2.Tween = v2:CreateTween()
	end
	v2.ClosestWayPoint = p2
	return v2
end
local t4 = {}
t4.__index = t4
function t4.Hide(p1) --[[ Hide | Line: 239 ]]
	p1.DisplayModel.Parent = nil
end
function t4.Destroy(p1) --[[ Destroy | Line: 243 ]]
	p1.DisplayModel:Destroy()
end
function t4.NewDisplayModel(p1, p2) --[[ NewDisplayModel | Line: 247 | Upvalues: v13 (ref), placePathWaypoint (copy), Workspace (copy), LocalPlayer (copy) ]]
	local v1 = v13:Clone()
	placePathWaypoint(v1, p2)
	local v2, v3, v4 = Workspace:FindPartOnRayWithIgnoreList(Ray.new(p2 + Vector3.new(0, 2.5, 0), Vector3.new(0, -10, 0)), { Workspace.CurrentCamera, LocalPlayer.Character })
	if v2 then
		v1.CFrame = CFrame.new(v3, v3 + v4)
		local CurrentCamera = Workspace.CurrentCamera
		local ClickToMoveDisplay = CurrentCamera:FindFirstChild("ClickToMoveDisplay")
		if not ClickToMoveDisplay then
			local ClickToMoveDisplay_2 = Instance.new("Model")
			ClickToMoveDisplay_2.Name = "ClickToMoveDisplay"
			ClickToMoveDisplay_2.Parent = CurrentCamera
			ClickToMoveDisplay = ClickToMoveDisplay_2
		end
		v1.Parent = ClickToMoveDisplay
	end
	return v1
end
function t4.RunFailureTween(p1) --[[ RunFailureTween | Line: 261 | Upvalues: TweenService (copy), v8 (copy), v9 (copy), v7 (copy) ]]
	wait(0.125)
	local v1 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local v2 = TweenService:Create(p1.DisplayModel.FailureWaypointBillboard, v1, {
		SizeOffset = v8
	})
	v2:Play()
	TweenService:Create(p1.DisplayModel.FailureWaypointBillboard.Frame, v1, {
		Rotation = 10
	}):Play()
	v2.Completed:wait()
	local v4 = TweenService:Create(p1.DisplayModel.FailureWaypointBillboard, TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true), {
		SizeOffset = v9
	})
	v4:Play()
	local v5 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true)
	TweenService:Create(p1.DisplayModel.FailureWaypointBillboard.Frame.ImageLabel, v5, {
		ImageColor3 = Color3.new(0.75, 0.75, 0.75)
	}):Play()
	TweenService:Create(p1.DisplayModel.FailureWaypointBillboard.Frame, v5, {
		Rotation = -10
	}):Play()
	v4.Completed:wait()
	local v6 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local v72 = TweenService:Create(p1.DisplayModel.FailureWaypointBillboard, v6, {
		SizeOffset = v7
	})
	v72:Play()
	TweenService:Create(p1.DisplayModel.FailureWaypointBillboard.Frame, v6, {
		Rotation = 0
	}):Play()
	v72.Completed:wait()
	wait(0.125)
end
function t4.new(p1) --[[ new | Line: 310 | Upvalues: t4 (copy) ]]
	local v2 = setmetatable({}, t4)
	v2.DisplayModel = v2:NewDisplayModel(p1)
	return v2
end
local Animation = Instance.new("Animation")
Animation.AnimationId = "rbxassetid://2874840706"
local v14 = nil
local function getFailureAnimationTrack(p1) --[[ getFailureAnimationTrack | Line: 324 | Upvalues: v14 (ref), Animation (copy) ]]
	if p1 ~= nil then
		v14 = p1:LoadAnimation(Animation)
		assert(v14, "")
		v14.Priority = Enum.AnimationPriority.Action
		v14.Looped = false
	end
	return v14
end
local function findPlayerHumanoid() --[[ findPlayerHumanoid | Line: 335 | Upvalues: LocalPlayer (copy) ]]
	local Character = LocalPlayer.Character
	if Character then
		return Character:FindFirstChildOfClass("Humanoid")
	end
end
local function createTrailDots(p1, p2) --[[ createTrailDots | Line: 342 | Upvalues: t2 (copy), t3 (copy) ]]
	local t = {}
	local count = 1
	for i = 1, #p1 - 1 do
		if if i % 2 == 0 then not (if (p1[i].Position - p1[#p1].Position).Magnitude < 3 then true else false) else false then
			t[count] = t2.new(p1[i].Position, i)
			count = count + 1
		end
	end
	table.insert(t, (t3.new(p1[#p1].Position, #p1, p2)))
	local t4 = {}
	local count_2 = 1
	for j = #t, 1, -1 do
		t4[count_2] = t[j]
		count_2 = count_2 + 1
	end
	return t4
end
local function getTrailDotScale(p1, p2) --[[ getTrailDotScale | Line: 367 ]]
	return p2 * (math.clamp(p1 - 10, 0, 90) / 90 * 1.5 + 1)
end
local v15 = 0
function t.CreatePathDisplay(p1, p2) --[[ CreatePathDisplay | Line: 376 | Upvalues: v15 (ref), createTrailDots (copy), RunService (copy), Workspace (copy), v10 (ref) ]]
	v15 = v15 + 1
	local v1 = createTrailDots(p1, p2)
	local function removePathBeforePoint(p1) --[[ removePathBeforePoint | Line: 380 | Upvalues: v1 (copy) ]]
		for i = #v1, 1, -1 do
			local v12 = v1[i]
			if not (v12.ClosestWayPoint <= p1) then
				break
			end
			v12:Destroy()
			v1[i] = nil
		end
	end
	local v2 = "ClickToMoveResizeTrail" .. v15
	local function resizeTrailDots() --[[ resizeTrailDots | Line: 394 | Upvalues: v1 (copy), RunService (ref), v2 (copy), Workspace (ref), v10 (ref) ]]
		if #v1 == 0 then
			RunService:UnbindFromRenderStep(v2)
			return
		end
		local p = Workspace.CurrentCamera.CFrame.p
		for i = 1, #v1 do
			local TrailDotImage = v1[i].DisplayModel:FindFirstChild("TrailDotImage")
			if TrailDotImage then
				TrailDotImage.Size = v10 * (math.clamp((v1[i].DisplayModel.Position - p).Magnitude - 10, 0, 90) / 90 * 1.5 + 1)
			end
		end
	end
	RunService:BindToRenderStep(v2, Enum.RenderPriority.Camera.Value - 1, resizeTrailDots)
	return function() --[[ removePath | Line: 410 | Upvalues: removePathBeforePoint (copy), p1 (copy) ]]
		removePathBeforePoint(#p1)
	end, removePathBeforePoint
end
local v16 = nil
function t.DisplayFailureWaypoint(p1) --[[ DisplayFailureWaypoint | Line: 418 | Upvalues: v16 (ref), t4 (copy) ]]
	local v1
	if not v16 then
		v1 = t4.new(p1)
		v16 = v1
		coroutine.wrap(function() --[[ Line: 424 | Upvalues: v1 (ref) ]]
			v1:RunFailureTween()
			v1:Destroy()
			v1 = nil
		end)()
		return
	end
	v16:Hide()
	v1 = t4.new(p1)
	v16 = v1
	coroutine.wrap(function() --[[ Line: 424 | Upvalues: v1 (ref) ]]
		v1:RunFailureTween()
		v1:Destroy()
		v1 = nil
	end)()
end
function t.CreateEndWaypoint(p1) --[[ CreateEndWaypoint | Line: 431 | Upvalues: t3 (copy) ]]
	return t3.new(p1)
end
function t.PlayFailureAnimation() --[[ PlayFailureAnimation | Line: 435 | Upvalues: LocalPlayer (copy), v14 (ref), Animation (copy) ]]
	local Character = LocalPlayer.Character
	local v1 = if Character then Character:FindFirstChildOfClass("Humanoid") else nil
	if not v1 then
		return
	end
	if v1 ~= nil then
		v14 = v1:LoadAnimation(Animation)
		assert(v14, "")
		v14.Priority = Enum.AnimationPriority.Action
		v14.Looped = false
	end
	v14:Play()
end
function t.CancelFailureAnimation() --[[ CancelFailureAnimation | Line: 443 | Upvalues: v14 (ref) ]]
	if v14 == nil or not v14.IsPlaying then
		return
	end
	v14:Stop()
end
function t.SetWaypointTexture(p1) --[[ SetWaypointTexture | Line: 449 | Upvalues: v1 (ref), v11 (ref), v12 (ref), v13 (ref), CreateWaypointTemplates (copy) ]]
	v1 = p1
	local v14, v2, v3 = CreateWaypointTemplates()
	v11 = v14
	v12 = v2
	v13 = v3
end
function t.GetWaypointTexture() --[[ GetWaypointTexture | Line: 454 | Upvalues: v1 (ref) ]]
	return v1
end
function t.SetWaypointRadius(p1) --[[ SetWaypointRadius | Line: 458 | Upvalues: v10 (ref), v11 (ref), v12 (ref), v13 (ref), CreateWaypointTemplates (copy) ]]
	v10 = Vector2.new(p1, p1)
	local v1, v2, v3 = CreateWaypointTemplates()
	v11 = v1
	v12 = v2
	v13 = v3
end
function t.GetWaypointRadius() --[[ GetWaypointRadius | Line: 463 | Upvalues: v10 (ref) ]]
	return v10.X
end
function t.SetEndWaypointTexture(p1) --[[ SetEndWaypointTexture | Line: 467 | Upvalues: v2 (ref), v11 (ref), v12 (ref), v13 (ref), CreateWaypointTemplates (copy) ]]
	v2 = p1
	local v1, v22, v3 = CreateWaypointTemplates()
	v11 = v1
	v12 = v22
	v13 = v3
end
function t.GetEndWaypointTexture() --[[ GetEndWaypointTexture | Line: 472 | Upvalues: v2 (ref) ]]
	return v2
end
function t.SetWaypointsAlwaysOnTop(p1) --[[ SetWaypointsAlwaysOnTop | Line: 476 | Upvalues: v3 (ref), v11 (ref), v12 (ref), v13 (ref), CreateWaypointTemplates (copy) ]]
	v3 = p1
	local v1, v2, v32 = CreateWaypointTemplates()
	v11 = v1
	v12 = v2
	v13 = v32
end
function t.GetWaypointsAlwaysOnTop() --[[ GetWaypointsAlwaysOnTop | Line: 481 | Upvalues: v3 (ref) ]]
	return v3
end
return t