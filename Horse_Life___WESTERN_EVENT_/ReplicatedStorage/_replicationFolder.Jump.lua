-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Octree")
local v3 = Sonar("EventUtils")
local v4 = Sonar("Binder")
local v5 = Sonar("MessagesClient")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("Signal")
local v8 = Sonar("TutorialService")
local v9 = Sonar("ColorCorrectionUtils")
local v10 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 1, true)
local v11 = 1.5 + v10.Time * v10.RepeatCount
local v12 = Sonar("PlayerWrapper").GetClient()
local v13 = v2.new("Jump", 4, 512)
local v14 = nil
local v15 = 9000000000
local CompleteJump = ReplicatedStorage.Storage.Assets.Particles.CompleteJump
local t2 = { "Great work!", "Jump complete!", "Awesome!", "PERFECT!", "Amazing!" }
local v16 = tick()
local t3 = {}
function t.new(p1) --[[ new | Line: 51 | Upvalues: t (copy), v1 (copy), v13 (copy), t3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Arrows = {}
	v2.Model = p1
	v2.PrimaryPart = p1:WaitForChild("BasePart")
	v2.ArrowAttach = v2.PrimaryPart:WaitForChild("ArrowAttachment")
	v2.TweenValue = Instance.new("NumberValue")
	v2.BounceTweenValue = Instance.new("NumberValue")
	v13:Add(v2, v2.PrimaryPart.Position)
	v2.Maid:GiveTask(function() --[[ Line: 66 | Upvalues: v13 (ref), v2 (copy) ]]
		v13:Remove(v2)
	end)
	v2:Unfocus()
	t3[p1] = v2
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 77 | Upvalues: t3 (copy) ]]
	t3[p1.Model] = nil
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.GetDistanceFrom(p1, p2) --[[ GetDistanceFrom | Line: 83 | Upvalues: v12 (copy) ]]
	local v1 = v12:IsInRange(p1.PrimaryPart.Position, p2)
	return v1 and true, v1
end
function t.WithinBounds(p1, p2) --[[ WithinBounds | Line: 88 ]]
	return p2 > 30
end
function t.CanFocus(p1) --[[ CanFocus | Line: 92 | Upvalues: Workspace (copy), v8 (copy) ]]
	if not p1.Model:IsDescendantOf(Workspace) then
		return
	end
	if p1.LastCompleted and tick() - p1.LastCompleted < 2 then
		return
	end
	if v8.GetGameState("JumpObstacles") then
		return true
	end
end
function t.Focus(p1) --[[ Focus | Line: 108 | Upvalues: Workspace (copy), v1 (copy), ReplicatedStorage (copy), RunService (copy), v11 (copy), TweenService (copy), v10 (copy), v12 (copy) ]]
	if p1.Focused then
		return
	end
	p1.Focused = true
	p1.LastBounce = 0
	if not p1.Model:IsDescendantOf(Workspace) then
		p1:Unfocus()
		return
	end
	if not p1.Arrow then
		local v13 = v1.new()
		local v2 = ReplicatedStorage.Storage.Assets.JumpArrow:Clone()
		v2:PivotTo(CFrame.new(p1.ArrowAttach.WorldPosition))
		v2.Parent = workspace.CurrentCamera
		v13:GiveTask(p1.TweenValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 125 | Upvalues: v2 (copy), p1 (copy) ]]
			v2:ScaleTo(p1.TweenValue.Value)
		end))
		v13:GiveTask(v2)
		p1.StartCFrame = v2:GetPivot()
		v13:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 132 | Upvalues: p1 (copy), Workspace (ref), v11 (ref), TweenService (ref), v10 (ref), v12 (ref), v2 (copy) ]]
			if not p1.Model:IsDescendantOf(Workspace) and p1.ArrowAttach:IsDescendantOf(Workspace) then
				p1:Unfocus(true)
				return
			end
			local v1, v22, v3, v4, v5, v6, v7, v8, v9
			if v11 <= tick() - p1.LastBounce then
				p1.LastBounce = tick()
				TweenService:Create(p1.BounceTweenValue, TweenInfo.new(), {
					Value = 0
				}):Play()
				TweenService:Create(p1.BounceTweenValue, v10, {
					Value = 3
				}):Play()
			end
			v1 = (v12.PrimaryPart.Position - v2.PrimaryPart.Position).unit
			v22 = v1.z
			v3 = v1.x
			v4 = -math.atan2(v22, v3)
			v5 = CFrame.Angles(0, v4, 0)
			v6 = v2:GetPivot()
			v7 = p1.BounceTweenValue.Value
			v8 = Vector3.new(0, v7, 0)
			v9 = p1.StartCFrame.Position + v8
			v2:PivotTo((v6:Lerp(CFrame.new(v9) * v5, 0.1)))
		end))
		p1.PrimaryPart.CanTouch = true
		p1.TouchConnection = p1.PrimaryPart.Touched:Connect(function(p12) --[[ Line: 172 | Upvalues: v12 (ref), p1 (copy) ]]
			if not p12:IsDescendantOf(v12.Character) then
				return
			end
			p1.Failed = if p1.Failed then p1.Failed + 1 or 1 else 1
			if not (p1.Failed >= 2) then
				return
			end
			p1.TouchConnection:Disconnect()
			p1.PrimaryPart.CanTouch = false
		end)
		p1.TweenValue.Value = 0.01
		p1.Arrows[v2] = v13
		p1.Arrow = v2
	end
	TweenService:Create(p1.TweenValue, TweenInfo.new(0.375, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
		Value = 1
	}):Play()
end
function t.Unfocus(p1, p2) --[[ Unfocus | Line: 192 | Upvalues: TweenService (copy) ]]
	if not p1.Focused then
		return
	end
	p1.Focused = false
	if p1.TouchConnection then
		task.delay(10, function() --[[ Line: 197 | Upvalues: p1 (copy) ]]
			if not p1.Focused then
				p1.Failed = nil
				p1.PrimaryPart.CanTouch = false
				p1.TouchConnection:Disconnect()
			end
		end)
	end
	if p2 and (p1.Arrow and p1.Arrows[p1.Arrow]) then
		p1.Arrows[p1.Arrow]:Destroy()
		p1.Arrows[p1.Arrow] = nil
		p1.Arrow = nil
		return
	end
	local v1 = TweenService:Create(p1.TweenValue, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		Value = 0.01
	})
	v1.Completed:Connect(function(p12) --[[ Line: 218 | Upvalues: p1 (copy) ]]
		if p12 ~= Enum.PlaybackState.Completed then
			return
		end
		if not (p1.Arrow and p1.Arrows[p1.Arrow]) then
			return
		end
		p1.Arrows[p1.Arrow]:Destroy()
		p1.Arrows[p1.Arrow] = nil
		p1.Arrow = nil
	end)
	v1:Play()
end
function t.GetClosestJump(p1) --[[ GetClosestJump | Line: 229 | Upvalues: v14 (ref), v15 (ref) ]]
	return v14, v15
end
function t.Success(p1) --[[ Success | Line: 233 | Upvalues: v8 (copy), v5 (copy), t2 (copy), v16 (ref), ReplicatedStorage (copy), CompleteJump (copy), v9 (copy), v6 (copy), TweenService (copy), t (copy) ]]
	if not v8.GetGameState("JumpObstacles") then
		return
	end
	p1.LastCompleted = tick()
	if v8.GetGameState("FailJumpObstacle") and (p1.Failed and p1.Failed >= 2) then
		v5:AddNotification({
			Type = "JumpFailed",
			Text = "Jump missed!",
			Duration = 1,
			CheckSetting = true
		})
		p1.Failed = nil
		return
	end
	v5:AddNotification({
		Type = "JumpCompleted",
		Duration = 2,
		CheckSetting = true,
		Text = t2[math.random(#t2)],
		RunBefore = function() --[[ RunBefore | Line: 255 | Upvalues: v16 (ref), ReplicatedStorage (ref), p1 (copy), CompleteJump (ref), v9 (ref) ]]
			if tick() - v16 < 4 then
				ReplicatedStorage.Storage.SFX.JumpSuccess.Pitch = math.min(ReplicatedStorage.Storage.SFX.JumpSuccess.Pitch + 0.5, 3)
			else
				ReplicatedStorage.Storage.SFX.JumpSuccess.Pitch = 1
			end
			ReplicatedStorage.Storage.SFX.JumpSuccess:Play()
			v16 = tick()
			local ParticleAttachment = p1.Model:FindFirstChild("ParticleAttachment", true)
			if ParticleAttachment then
				if not next(ParticleAttachment:GetChildren()) then
					for k, v in pairs(CompleteJump:GetChildren()) do
						v:Clone().Parent = ParticleAttachment
					end
				end
				for k, v in pairs(ParticleAttachment:GetChildren()) do
					v:Emit(v:GetAttribute("EmitCount"))
				end
			end
			v9:Tween(game.Lighting.ColorCorrection, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
				Brightness = 0.15
			}, true)
		end
	})
	v6.GetRemoteEvent("JumpedObstacleRemote"):FireServer(p1.Model)
	local Blocker = p1.Model:FindFirstChild("Blocker")
	if not Blocker then
		t.JumpCompletedSignal:Fire(p1.Model)
		return
	end
	TweenService:Create(Blocker, TweenInfo.new(0.15), {
		Transparency = 1
	}):Play()
	Blocker.CanCollide = false
	t.JumpCompletedSignal:Fire(p1.Model)
end
function t.IsFocused(p1) --[[ IsFocused | Line: 295 ]]
	return p1.Focused
end
function t.Init(p1) --[[ Init | Line: 299 | Upvalues: t (copy), v7 (copy), RunService (copy), v12 (copy), v14 (ref), Workspace (copy), v15 (ref), v3 (copy), v13 (copy), v4 (copy) ]]
	t.JumpCompletedSignal = v7.new()
	local v1 = nil
	RunService.Heartbeat:Connect(function(p1) --[[ Line: 304 | Upvalues: v12 (ref), v1 (ref), v14 (ref), Workspace (ref), v15 (ref) ]]
		if not v12:GetCurrentAnimal() then
			return
		end
		if not v1 then
			return
		end
		if v14 and (v14.Model and not v14.Model:IsDescendantOf(Workspace)) then
			if v14.Unfocus then
				v14:Unfocus(true)
			end
			v14 = nil
		end
		local v13 = 75
		local v2 = nil
		for v3, v4 in v1 do
			if v4.CanFocus and v4:CanFocus() then
				local v5, v6 = v4:GetDistanceFrom(v13)
				if v5 then
					v13 = v6
					v2 = v4
				end
			end
		end
		if v2 then
			if not v2:IsFocused() and (v14 and v14.Unfocus) then
				v14:Unfocus()
			end
		elseif v14 and v14.Unfocus then
			v14:Unfocus()
		end
		if v2 and v2:WithinBounds(v13) then
			if not v2:IsFocused() and v2.Focus then
				v2:Focus()
			end
		elseif v2 and (v2:IsFocused() and (v2.Unfocus and v2.Unfocus)) then
			v2:Unfocus()
		end
		v15 = v13
		v14 = v2
	end)
	v3.spawnLoopWithoutYielding(function() --[[ Line: 357 | Upvalues: v12 (ref), v1 (ref), v13 (ref) ]]
		if v12.PrimaryPart then
			v1 = v13:RadiusSearch(v12.PrimaryPart.Position, 150)
		end
	end, 0.5)
	v4.new("Jump", t):Init()
end
function t.GetAll() --[[ GetAll | Line: 365 | Upvalues: t3 (copy) ]]
	return t3
end
t:Init()
return t