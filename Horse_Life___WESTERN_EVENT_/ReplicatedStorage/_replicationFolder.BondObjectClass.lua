-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CurrentCamera = workspace.CurrentCamera
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Signal")
local v2 = Sonar("Maid")
local v3 = CFrame.Angles(0, -1.5707963267948966, 0)
local BondingObjects = ReplicatedStorage.Storage.Assets.BondingObjects
local v4 = game:GetService("Players").LocalPlayer:GetMouse()
local function isMouseWithinCenter() --[[ isMouseWithinCenter | Line: 27 | Upvalues: CurrentCamera (copy), v4 (copy) ]]
	local ViewportSize = CurrentCamera.ViewportSize
	local v1 = ViewportSize.X / 2
	local v2 = ViewportSize.Y / 2
	local X = v4.X
	local Y = v4.Y
	return if v1 - ViewportSize.X * 0.25 <= X and (X <= v1 + ViewportSize.X * 0.25 and v2 - ViewportSize.Y * 0.325 <= Y) then Y <= v2 + ViewportSize.Y * 0.325 else false
end
function t.new(p1) --[[ new | Line: 42 | Upvalues: t (copy), v2 (copy), BondingObjects (copy), CurrentCamera (copy), v1 (copy), v4 (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.Maid = v2.new()
	if v22.ScreenRayDistance then
		v22.ScreenRayDistance = v22.ScreenRayDistance - 3
	end
	v22.LookAt = Vector3.new()
	if p1.Type then
		v22.Model = BondingObjects[v22.CustomModel or v22.Type]:Clone()
		v22.Model.Parent = CurrentCamera
		v22.Maid:GiveTask(v22.Model)
		v22:_scaleModelWithDistance()
	end
	v22.MovingState = v1.new()
	v22.Maid:GiveTask(v22.MovingState)
	if not p1.Static then
		v4.TargetFilter = v22.Model
	end
	if p1.MouseIcon then
		v4.Icon = type(p1.MouseIcon) == "string" and p1.MouseIcon or "rbxassetid://9715418418"
	end
	if p1.PlayEffectsOnMove then
		v22.Maid:GiveTask(v22.MovingState:Connect(function(p1) --[[ Line: 74 | Upvalues: v22 (copy) ]]
			v22:_setParticles(p1)
			v22:_setSounds(p1)
		end))
		v22:_setParticles(false)
		v22:_setSounds(false)
	elseif p1.PlayEffects then
		v22:_setParticles(true)
		v22:_setSounds(true)
	end
	if not p1.Static then
		v22.Maid:GiveTask(v4.Move:Connect(function(p1) --[[ Line: 88 | Upvalues: v22 (copy) ]]
			if v22.Bound then
				local v1 = tick()
				v22.LastMove = v1
				v22:_setMoving(true)
				task.delay(0.5, function() --[[ Line: 94 | Upvalues: v22 (ref), v1 (copy) ]]
					if v22.LastMove ~= v1 then
						return
					end
					if v22._setMoving then
						v22:_setMoving(false)
					end
				end)
			end
		end))
	end
	if p1.Static then
		v22:_setStatic()
	end
	if not (p1.Static or p1.DontBind) then
		v22:BindToMouse()
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 115 | Upvalues: v4 (copy) ]]
	if not p1.MouseIcon then
		p1.Maid:Destroy()
		setmetatable(p1, nil)
		return
	end
	v4.Icon = ""
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.BindToMouse(p1) --[[ BindToMouse | Line: 125 | Upvalues: RunService (copy) ]]
	p1.Bound = true
	p1.BindConnection = RunService.Heartbeat:Connect(function() --[[ Line: 127 | Upvalues: p1 (copy) ]]
		if not p1.Bound then
			return
		end
		p1:SetMousePosition()
		if p1.MoveWithMouse == false or not p1.Model then
			return
		end
		p1:SetScreenCFrame()
	end)
	p1.Maid:GiveTask(p1.BindConnection)
	p1:SetMousePosition()
	return function() --[[ Line: 140 | Upvalues: p1 (copy) ]]
		p1:Unbind()
	end
end
function t.Unbind(p1) --[[ Unbind | Line: 146 ]]
	p1.Bound = false
	p1.BindConnection:Disconnect()
end
function t.SetMousePosition(p1) --[[ SetMousePosition | Line: 152 | Upvalues: UserInputService (copy) ]]
	local v1 = UserInputService:GetMouseLocation()
	p1.MousePosition = Vector2.new(v1.X, v1.Y)
end
function t.SetScreenCFrame(p1, p2, p3) --[[ SetScreenCFrame | Line: 158 | Upvalues: CurrentCamera (copy), v3 (copy) ]]
	local v1 = if p2 then p2 else p1.MousePosition
	local v2 = CurrentCamera:ScreenPointToRay(v1.X, v1.Y, p1.ScreenRayDistance or 13)
	p1.LookAt = p1.LookAt:lerp(v2.Origin + v2.Direction, p3 or 0.4)
	local v32 = CFrame.new(v2.Origin, p1.LookAt)
	p1:SetCFrame(v32 * (p1.Offset or v3))
end
function t.SetCFrame(p1, p2) --[[ SetCFrame | Line: 168 ]]
	if p1.Model:IsA("Model") then
		p1.Model:SetPrimaryPartCFrame(p2)
	else
		p1.Model.CFrame = p2
	end
end
function t._scaleModelWithDistance(p1, p2) --[[ _scaleModelWithDistance | Line: 177 ]]
	local v1 = p1.ModelScale or (p1.ScreenRayDistance or 13) / 13
	local v2 = if p2 then p2 else p1.Model
	local v3
	if v2:IsA("Model") then
		local p = v2.PrimaryPart.CFrame.p
		v3 = v2
		for k, v in pairs(v2:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Position = p:Lerp(v.Position, v1)
				v.Size = v.Size * v1
			end
		end
	else
		v2.Size = v2.Size * v1
		v3 = v2
	end
	local v4 = v3:GetDescendants()
	table.insert(v4, v3)
	for k, v in pairs(v4) do
		if not v:IsA("ParticleEmitter") and v:IsA("Trail") then
			local Attachment0 = v.Attachment0
			Attachment0.Position = Attachment0.Position * v1
			local Attachment1 = v.Attachment1
			Attachment1.Position = Attachment1.Position * v1
		end
	end
end
function t.IsNearPosition(p1, p2, p3) --[[ IsNearPosition | Line: 213 ]]
	return (p1.MousePosition - p2).Magnitude <= p3
end
function t._getScreenPointFromWorldPoint(p1, p2) --[[ _getScreenPointFromWorldPoint | Line: 218 | Upvalues: CurrentCamera (copy) ]]
	local v1 = CurrentCamera:WorldToViewportPoint(p2)
	return Vector2.new(v1.X, v1.Y)
end
function t._getOffsetPositionFromScale(p1, p2, p3) --[[ _getOffsetPositionFromScale | Line: 224 | Upvalues: CurrentCamera (copy) ]]
	return Vector2.new(p2 * CurrentCamera.ViewportSize.X, p3 * CurrentCamera.ViewportSize.Y)
end
function t._hasMoved(p1, p2) --[[ _hasMoved | Line: 231 | Upvalues: CurrentCamera (copy), v4 (copy) ]]
	if not p1.MousePosition then
		return
	end
	local ViewportSize = CurrentCamera.ViewportSize
	local v1 = ViewportSize.X / 2
	local v2 = ViewportSize.Y / 2
	local X = v4.X
	local Y = v4.Y
	if not (if v1 - ViewportSize.X * 0.25 <= X and (X <= v1 + ViewportSize.X * 0.25 and v2 - ViewportSize.Y * 0.325 <= Y) then Y <= v2 + ViewportSize.Y * 0.325 else false) then
		return
	end
	return (p1.MousePosition - p2).Magnitude > 2
end
function t._setMoving(p1, p2) --[[ _setMoving | Line: 238 ]]
	if p1.IsMoving ~= p2 then
		p1.IsMoving = p2
		p1.MovingState:Fire(p1.IsMoving)
	end
end
function t._setStatic(p1) --[[ _setStatic | Line: 246 ]]
	p1:_setParticles(false)
	p1:_setSounds(false)
end
function t._setParticles(p1, p2) --[[ _setParticles | Line: 252 ]]
	for k, v in pairs(p1.Model:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = p2
		end
	end
end
function t._setSounds(p1, p2) --[[ _setSounds | Line: 260 ]]
	for k, v in pairs(p1.Model:GetDescendants()) do
		if v:IsA("Sound") then
			if p2 then
				v:Play()
				continue
			end
			v:Stop()
		end
	end
end
function t._setMaterial(p1, p2) --[[ _setMaterial | Line: 272 ]]
	local v1 = p1.Model:GetDescendants()
	table.insert(v1, p1.Model)
	for k, v in pairs(v1) do
		if v:IsA("BasePart") then
			v.Material = p2
		end
	end
end
function t._setTextureID(p1, p2) --[[ _setTextureID | Line: 283 ]]
	local v1 = p1.Model:GetDescendants()
	table.insert(v1, p1.Model)
	for k, v in pairs(v1) do
		if v:IsA("BasePart") then
			v.TextureID = p2
		end
	end
end
function t._setCosmeticState(p1, p2) --[[ _setCosmeticState | Line: 294 ]]
	for k, v in pairs(p2) do
		if p1["_set" .. k] then
			p1["_set" .. k](p1, v)
		end
	end
end
function t._setTransparency(p1, p2) --[[ _setTransparency | Line: 302 ]]
	local v1 = p1.Model:GetDescendants()
	table.insert(v1, p1.Model)
	for k, v in pairs(v1) do
		if v:IsA("BasePart") then
			v.Transparency = p2
		end
	end
end
return t