-- https://lua.expert/
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local CurrentCamera = workspace.CurrentCamera
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("MathUtils")
local v3 = Sonar("GuiManager")
local t = {}
t.__index = t
local v4 = ReplicatedStorage.Storage.Assets.Marker.MarkerGui:Clone()
local ContainerFrame = v4.ContainerFrame
v4.Parent = Players.LocalPlayer.PlayerGui
local v5 = Sonar("PlayerWrapper").GetClient()
local HUDGui = Players.LocalPlayer.PlayerGui:WaitForChild("HUDGui")
local t2 = {}
function t.new(p1) --[[ new | Line: 24 | Upvalues: t (copy), t2 (copy), v1 (copy), ReplicatedStorage (copy), ContainerFrame (copy) ]]
	local v2 = setmetatable({}, t)
	if not p1 then
		return {}
	end
	v2.Data = p1
	v2.Root = p1.Root
	if not v2.Root or t2[v2.Root] then
		return
	end
	v2.Maid = v1.new()
	v2.Frame = ReplicatedStorage.Storage.Assets.Marker.Default:Clone()
	v2.Frame.Name = p1.Root:GetFullName()
	v2.Frame.UIScale.Scale = 0
	v2.Frame.ImageLabel.Image = v2.Data.Image or ""
	v2.Frame.ImageLabel.ImageColor3 = v2.Data.Color or Color3.new(255/255, 255/255, 255/255)
	v2.Frame.ImageLabel.Size = v2.Data.ImageSize or UDim2.new(0.6, 0, 0.6, 0)
	v2.Frame.Parent = ContainerFrame
	local v5 = v2.Data.PositionOffset or Vector3.new(0, 0, 0)
	if v2.Data.Refreshes then
		v2.Position = nil
	else
		v2.Position = v2.Root:GetPivot().p + v5
	end
	if v2.Data.NameText then
		local NameText = v2.Data.NameText
		if v2.Data.PrefixText then
			NameText = v2.Data.PrefixText .. "\n" .. NameText
		end
		v2.Frame.RotateLabel.NameLabel.Text = NameText
	end
	if v2.Data.IconColor then
		v2.Frame.ImageLabel.ImageColor3 = v2.Data.IconColor
	end
	if v2.Data.Username then
		v2.Frame.RotateLabel.UsernameLabel.Text = v2.Data.Username
	end
	v2.Maid:GiveTask(v2.Frame)
	t2[v2.Root] = v2
	v2:_fadeIn()
	if not v2.Data.IgnoreAutoDestroy and (type(v2.Data.Duration) ~= "boolean" or v2.Data.Duration) then
		task.delay(v2.Data.Duration or 8, function() --[[ Line: 79 | Upvalues: v2 (copy) ]]
			if not v2.Destroyed then
				v2:_fadeOut()
			end
		end)
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 91 | Upvalues: t2 (copy) ]]
	p1.Maid:Destroy()
	p1.Destroyed = true
	t2[p1.Root] = nil
	setmetatable(p1, nil)
end
function t._fadeIn(p1) --[[ _fadeIn | Line: 98 | Upvalues: TweenService (copy) ]]
	p1.Visible = true
	TweenService:Create(p1.Frame.UIScale, TweenInfo.new(0.75, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
		Scale = 1
	}):Play()
end
function t._fadeOut(p1) --[[ _fadeOut | Line: 108 | Upvalues: TweenService (copy) ]]
	p1.Visible = false
	local v1 = TweenService:Create(p1.Frame.UIScale, TweenInfo.new(2, Enum.EasingStyle.Elastic, Enum.EasingDirection.In), {
		Scale = 0
	})
	v1:Play()
	local v2 = nil
	v2 = v1.Completed:Connect(function() --[[ Line: 117 | Upvalues: p1 (copy), v2 (ref) ]]
		if p1.Destroy then
			p1:Destroy()
		end
		v2:Disconnect()
	end)
end
function t.GetGuiInset(p1) --[[ GetGuiInset | Line: 125 | Upvalues: HUDGui (copy) ]]
	return HUDGui.BottomFrame.Other.AbsoluteSize.Y
end
function t.Update(p1) --[[ Update | Line: 129 | Upvalues: CurrentCamera (copy), v5 (copy), v2 (copy) ]]
	local ViewportSize = CurrentCamera.ViewportSize
	local v22 = p1.Position or p1.Root:GetPivot().p + (p1.Data.PositionOffset or Vector3.new(0, 0, 0))
	local v4 = math.ceil(((v5.PrimaryPart and v5.PrimaryPart.Position or CurrentCamera.CFrame.p) - v22).Magnitude)
	local v52 = if v4 < 100 then true else false
	local v6 = if v4 < 200 then true else false
	local v7 = 1
	if v4 < 50 then
		if not p1.Data.IgnoreAutoDestroy then
			p1:Destroy()
			return
		end
	else
		v7 = math.clamp(v2.map(v4, 500, 50, 0.85, 1.5), 0.85, 1.5)
	end
	local _checkVisibility = p1.Data._checkVisibility
	local v10 = if _checkVisibility then _checkVisibility() else true
	if v10 then
		if _checkVisibility and v10 then
			p1.Frame.Visible = true
		end
	else
		p1.Frame.Visible = false
	end
	local v12, v13 = CurrentCamera:WorldToScreenPoint(v22)
	local _, v14, v15 = CurrentCamera.CFrame:ToOrientation()
	local v16 = CurrentCamera.CameraSubject:IsA("BasePart") and CurrentCamera.CameraSubject or CurrentCamera.CameraSubject.Parent.PrimaryPart
	local v17 = (CFrame.new(v16.Position) * CFrame.fromEulerAnglesYXZ(0, v14, v15)):ToObjectSpace(CFrame.new(v22))
	local v18 = math.atan2(v17.Z, v17.X)
	local v19 = ViewportSize.X * 0.26
	local v20 = ViewportSize.Y * 0.27
	local X_2 = v12.X
	local Y = v12.Y
	if v13 then
		if p1.Data.NameText then
			p1.Frame.RotateLabel.NameLabel.Visible = v6
		else
			p1.Frame.RotateLabel.TextLabel.Text = v4
		end
		if p1.Data.Username then
			p1.Frame.RotateLabel.UsernameLabel.Visible = v52
		end
		p1.Frame.RotateLabel.Arrow.Visible = false
		p1.Frame.RotateLabel.Rotation = 0
	else
		X_2 = ViewportSize.X / 2 + math.cos(v18) * v19
		Y = ViewportSize.Y / 2 - p1:GetGuiInset() + math.sin(v18) * v20
		p1.Frame.RotateLabel.Rotation = math.deg(v18) + 90
		p1.Frame.RotateLabel.Arrow.Visible = true
		p1.Frame.RotateLabel.NameLabel.Visible = false
		p1.Frame.RotateLabel.UsernameLabel.Visible = false
		p1.Frame.RotateLabel.TextLabel.Text = ""
	end
	if p1.Visible then
		p1.Frame.UIScale.Scale = v2.lerp(p1.Frame.UIScale.Scale, v7, 0.1)
	end
	p1.Frame.Position = UDim2.fromOffset(X_2, Y)
end
function t.Clear(p1) --[[ Clear | Line: 206 | Upvalues: t2 (copy) ]]
	for k, v in pairs(t2) do
		if not v.Data.IgnoreAutoDestroy then
			v:Destroy()
		end
	end
end
function t.GetMarkers() --[[ GetMarkers | Line: 215 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetMarkerFor(p1) --[[ GetMarkerFor | Line: 219 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
RunService.RenderStepped:Connect(function() --[[ Line: 223 | Upvalues: t2 (copy) ]]
	for k, v in pairs(t2) do
		v:Update()
	end
end)
v3.AddFrame(ContainerFrame, {
	HUD = true,
	TweenAnimation = false,
	KeepPosition = true
})
return t