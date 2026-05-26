-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CurrentCamera = workspace.CurrentCamera
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Octree")
local v3 = Sonar("EventUtils")
local v4 = Sonar("Binder")
local v5 = Sonar("CameraShaker")
local v6 = Sonar("MathUtils")
local v7 = Sonar("spr")
Sonar("Constants")
local v8 = Sonar("ColorCorrectionUtils")
local v9 = Sonar("RacePowerupData", {
	PlaceType = "CompHub"
})
local v10 = Sonar("RacePowerupClient", {
	PlaceType = "CompHub"
})
local v11 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 1, true)
local v12 = 1.5 + v11.Time * v11.RepeatCount
local v13 = Sonar("PlayerWrapper").GetClient()
local v14 = v2.new("BoostPad", 4, 512)
local v15 = nil
local v16 = 9000000000
local Particles = ReplicatedStorage.Storage.Assets.Particles
local v17 = Particles and Particles:FindFirstChild("BoostedPad")
local v18 = v5.new(Enum.RenderPriority.Camera.Value + 1, "BoostShaker", function(p1) --[[ Line: 48 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v18:Start()
local v19 = tick()
local t2 = {
	Stamina = {
		ParticleColor = Color3.fromRGB(255, 170, 0),
		OnTouched = function(p1) --[[ OnTouched | Line: 56 | Upvalues: v13 (copy) ]]
			local v1 = v13:GetCurrentAnimal()
			if not v1 then
				return
			end
			local StaminaTracker = v1.StaminaTracker
			local FlyStaminaTracker = v1.FlyStaminaTracker
			if StaminaTracker.GetMaxStamina then
				StaminaTracker:Increment(StaminaTracker:GetMaxStamina())
			end
			local NotifyBoosts_2
			if not FlyStaminaTracker.GetMaxStamina then
				local NotifyBoosts_2 = _G.NotifyBoosts
				return
			end
			FlyStaminaTracker:Increment(FlyStaminaTracker:GetMaxStamina())
			local NotifyBoosts_2 = _G.NotifyBoosts
		end
	},
	Speed = {
		ParticleColor = Color3.fromRGB(85, 255, 0),
		OnTouched = function(p1) --[[ OnTouched | Line: 80 | Upvalues: v13 (copy), v18 (copy), v5 (copy), Sonar (copy) ]]
			if not v13:GetCurrentAnimal() then
				return
			end
			p1.Model.RemoteEvent:FireServer()
			local v1 = v13.CurrentHorse and v13.CurrentHorse.Model and v13.CurrentHorse.Model:FindFirstChild("Ailments")
			if v1 then
				v1:SetAttribute("SpeedBoostPad", workspace:GetServerTimeNow() + 5)
			end
			v18:Shake(v5.Presets.RotationBump)
			if not (_G.NotifyBoosts or v13:IsInAction("Race")) then
				return
			end
			Sonar("NotificationsClient").Notify({
				Preset = "Blue",
				ChatMessage = false,
				Message = "[SPEED BOOST] +" .. 25 .. "% speed!"
			})
		end
	},
	MysteryBox = {
		ParticleColor = Color3.fromRGB(200, 0, 255),
		OnTouched = function(p1) --[[ OnTouched | Line: 103 | Upvalues: Sonar (copy), v13 (copy), v10 (copy), v9 (copy), v19 (ref), v18 (copy), v5 (copy), v7 (copy) ]]
			if not Sonar("RacesClient"):GetActiveRace() then
				return
			end
			if not v13:GetCurrentAnimal() then
				return
			end
			local v1 = v10.CanHoldMore()
			local t = {}
			for v2, v3 in v9.Skills do
				if v3.Type == "Passive" then
					table.insert(t, v2)
					continue
				end
				if v1 then
					table.insert(t, v2)
				end
			end
			v19 = tick()
			p1.Model.RemoteEvent:FireServer()
			v18:Shake(v5.Presets.RotationBump)
			if #t == 0 then
				return
			end
			v10.OnPowerupUsed(t[math.random(1, #t)])
			p1.Model:SetAttribute("Cooldown", workspace:GetServerTimeNow() + 5)
			if not p1.OriginalScale then
				return
			end
			v7.target(p1.Model, 1, 3, {
				Scale = 0.01
			})
			task.spawn(function() --[[ Line: 133 | Upvalues: v7 (ref), p1 (copy) ]]
				task.wait(1)
				v7.target(p1.Model, 3, 1, {
					Scale = p1.OriginalScale
				})
			end)
		end
	},
	Slowdown = {
		ParticleColor = Color3.fromRGB(255, 0, 0),
		OnTouched = function(p1) --[[ OnTouched | Line: 142 | Upvalues: v13 (copy), v18 (copy), v5 (copy), Sonar (copy) ]]
			if not v13:GetCurrentAnimal() then
				return
			end
			v18:Shake(v5.Presets.RotationBump)
			local v2 = math.round(workspace:GetServerTimeNow() + 5)
			local v3 = v13.CurrentHorse and v13.CurrentHorse.Model and v13.CurrentHorse.Model:FindFirstChild("Ailments")
			if v3 then
				v3:SetAttribute("SpeedDebuff", v2)
			end
			Sonar("NotificationsClient").Notify({
				Preset = "Red",
				ChatMessage = false,
				Message = "[SPEED DEBUFF] -" .. 25 .. "% speed!"
			})
			task.delay(5, function() --[[ Line: 161 | Upvalues: v13 (ref), v2 (copy) ]]
				local CurrentHorse = v13.CurrentHorse
				if not (CurrentHorse and CurrentHorse.Model) then
					return
				end
				local Ailments = CurrentHorse.Model:FindFirstChild("Ailments")
				if not Ailments then
					return
				end
				if Ailments:GetAttribute("SpeedDebuff") == v2 then
					Ailments:SetAttribute("SpeedDebuff", nil)
				end
			end)
		end
	}
}
function t.new(p1) --[[ new | Line: 177 | Upvalues: t (copy), v1 (copy), t2 (copy), v13 (copy), v19 (ref), v7 (copy), v3 (copy), RunService (copy), v14 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Model = p1.Parent
	v2.BoostPadData = t2[v2.Model.Name]
	if not v2.BoostPadData then
		warn("No boost pad data can be found for", v2.Model:GetFullName())
		v2.Maid:Destroy()
		return nil
	end
	v2.Arrows = {}
	v2.Active = true
	v2.Destroyed = false
	v2.PrimaryPart = v2.Model:WaitForChild("TouchPart")
	v2.PrimaryPart.CollisionGroup = "Boosts"
	v2.ArrowAttach = v2.PrimaryPart:WaitForChild("ArrowAttachment")
	v2.ColorPart = v2.Model:WaitForChild("ColorPart")
	v2.OriginalColor = v2.ColorPart.Color
	if v2.Model.Name == "MysteryBox" then
		v2.OriginalScale = v2.Model:GetScale()
	end
	v2.TweenValue = v2.Maid:GiveTask(Instance.new("NumberValue"))
	v2.BounceTweenValue = v2.Maid:GiveTask(Instance.new("NumberValue"))
	v2.PrimaryPart.CanTouch = true
	v2.Maid:GiveTask(v2.PrimaryPart.Touched:Connect(function(p1) --[[ Line: 210 | Upvalues: v13 (ref), v2 (copy), v19 (ref) ]]
		if not v13:GetCurrentAnimal() then
			return
		end
		if not v13:IsLocalPlayerFromTouched(p1) then
			return
		end
		local v1 = v2.Model:GetAttribute("Cooldown")
		if v1 and workspace:GetServerTimeNow() < v1 then
			return
		end
		if tick() - v19 < 0.25 then
			return
		end
		if v2:CanFocus() then
			v2:Success()
		end
	end))
	local function setEnabled() --[[ setEnabled | Line: 228 | Upvalues: v2 (copy) ]]
		if v2.Model:GetAttribute("Enabled") == nil then
			v2.Enabled = true
		else
			v2.Enabled = v2.Model:GetAttribute("Enabled")
		end
	end
	v2.Maid:GiveTask(v2.Model:GetAttributeChangedSignal("Enabled"):Connect(setEnabled))
	if v2.Model:GetAttribute("Enabled") == nil then
		v2.Enabled = true
	else
		v2.Enabled = v2.Model:GetAttribute("Enabled")
	end
	v2.OriginalCF = v2.Model:GetPivot()
	local function updateCooldownState() --[[ updateCooldownState | Line: 240 | Upvalues: v2 (copy), v7 (ref) ]]
		local v1 = v2.Model:GetAttribute("Cooldown")
		if v1 and workspace:GetServerTimeNow() < v1 then
			v7.target(v2.Model, 0.8, 2, {
				Pivot = v2.OriginalCF * CFrame.new(0, 20, 0) * CFrame.Angles(math.random(-1, 1), math.random(-3, 3), math.random(-1, 1))
			})
			return
		end
		v7.target(v2.Model, 0.8, 8, {
			Pivot = v2.OriginalCF
		})
		if v2.Model.Name ~= "MysteryBox" or not v2.OriginalScale then
			return
		end
		v7.target(v2.Model, 0.5, 1, {
			Scale = v2.OriginalScale
		})
	end
	v2.Maid:GiveTask(v2.Model:GetAttributeChangedSignal("Cooldown"):Connect(updateCooldownState))
	if v2.Model.Name == "MysteryBox" then
		v2.Maid:GiveTask(v3.spawnLoop(function() --[[ Line: 259 | Upvalues: v2 (copy), updateCooldownState (copy) ]]
			local v1 = v2.Model:GetAttribute("Cooldown")
			if v1 and not (v1 <= workspace:GetServerTimeNow()) or not (v2.Model:GetPivot().Position.Y > v2.OriginalCF.Position.Y + 10) then
				return
			end
			updateCooldownState()
		end, 0.5))
		v2.RotationStartTick = tick()
		v2.Maid:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 270 | Upvalues: v2 (copy) ]]
			if not v2.Model.Parent then
				return
			end
			local v1 = v2.Model:GetAttribute("Cooldown")
			if v1 and workspace:GetServerTimeNow() < v1 then
				return
			end
			if not (v2.Focused and (v2.BoostPadData and v2.BoostPadData.AnimateRotation)) then
				local v22 = tick() - v2.RotationStartTick
				v2.Model:PivotTo(v2.OriginalCF * CFrame.Angles(0, v22 * 2.25, 0) * CFrame.new(0, math.sin(v22 * 3) * 1.5, 0))
			end
		end))
	end
	v14:Add(v2, v2.PrimaryPart.Position)
	v2.Maid:GiveTask(function() --[[ Line: 289 | Upvalues: v2 (copy) ]]
		for v1, v22 in v2.Arrows do
			v22:Destroy()
			v2.Arrows[v1] = nil
		end
		v2.Arrow = nil
	end)
	v2:Unfocus()
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 302 | Upvalues: v14 (copy) ]]
	p1.Destroyed = true
	v14:Remove(p1)
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.GetDistanceFrom(p1, p2) --[[ GetDistanceFrom | Line: 309 | Upvalues: v13 (copy) ]]
	local v1 = v13:IsInRange(p1.PrimaryPart.Position, p2)
	return v1 and true, v1
end
function t.WithinBounds(p1, p2) --[[ WithinBounds | Line: 314 ]]
	return p2 > 20
end
function t.CanFocus(p1) --[[ CanFocus | Line: 318 ]]
	if not p1.Enabled then
		return
	end
	if p1.LastCompleted and tick() - p1.LastCompleted < 5 then
		return
	end
	if p1.Active then
		return true
	end
end
function t.SetActive(p1, p2, p3) --[[ SetActive | Line: 329 | Upvalues: TweenService (copy) ]]
	p1.Active = p2
	local v2 = TweenInfo.new(0.6)
	local t = {}
	t.Color = p2 and p1.OriginalColor or Color3.fromRGB(27, 42, 53)
	TweenService:Create(p1.ColorPart, v2, t):Play()
	for k, v in pairs(p1.ColorPart:GetChildren()) do
		if v:IsA("ParticleEmitter") or v:IsA("PointLight") then
			v.Enabled = p2
		end
	end
end
function t.Focus(p1) --[[ Focus | Line: 340 | Upvalues: v1 (copy), ReplicatedStorage (copy), RunService (copy), v12 (copy), TweenService (copy), v11 (copy), v13 (copy), v7 (copy) ]]
	if p1.Focused then
		return
	end
	p1.Focused = true
	if not p1.Model:IsDescendantOf(workspace) then
		p1:Unfocus()
		return
	end
	p1.LastBounce = 0
	if not p1.Arrow then
		local v14 = v1.new()
		local v2 = ReplicatedStorage.Storage.Assets.JumpArrow:Clone()
		v2:PivotTo(CFrame.new(p1.ArrowAttach.WorldPosition) * CFrame.Angles(math.pi, 0, 0))
		v2.Parent = workspace.CurrentCamera
		v14:GiveTask(p1.TweenValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 358 | Upvalues: v2 (copy), p1 (copy) ]]
			v2:ScaleTo(p1.TweenValue.Value)
		end))
		v14:GiveTask(v2)
		p1.StartCFrame = v2:GetPivot()
		v14:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 365 | Upvalues: p1 (copy), v12 (ref), TweenService (ref), v11 (ref), v13 (ref), v2 (copy), v7 (ref) ]]
			if not p1.Model:IsDescendantOf(workspace) and p1.ArrowAttach:IsDescendantOf(workspace) then
				p1:Unfocus(true)
				return
			end
			if v12 <= tick() - p1.LastBounce then
				p1.LastBounce = tick()
				TweenService:Create(p1.BounceTweenValue, TweenInfo.new(), {
					Value = 0
				}):Play()
				TweenService:Create(p1.BounceTweenValue, v11, {
					Value = 3
				}):Play()
			end
			local unit = (v13.PrimaryPart.Position - v2.PrimaryPart.Position).unit
			local v22 = CFrame.Angles(math.pi, -math.atan2(unit.z, unit.x), 0)
			local v6 = v2:GetPivot():Lerp(CFrame.new(p1.StartCFrame.Position + Vector3.new(0, p1.BounceTweenValue.Value, 0)) * v22, 0.1)
			if p1.BoostPadData and p1.BoostPadData.AnimateRotation then
				local v72 = p1.Model:GetPivot()
				if (v72.p - p1.OriginalCF.p).Magnitude < 0.15 then
					v7.stop(p1.Model)
				end
				local v8 = v72 * CFrame.Angles(0, 0.03, 0)
				p1.Model:PivotTo(v8 + Vector3.new(0, math.sin(tick() * 10) * 0.1, 0))
			end
			v2:PivotTo(v6)
		end))
		p1.TweenValue.Value = 0.01
		p1.Arrows[v2] = v14
		p1.Arrow = v2
	end
	TweenService:Create(p1.TweenValue, TweenInfo.new(0.375, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
		Value = 1
	}):Play()
end
function t.Unfocus(p1) --[[ Unfocus | Line: 422 | Upvalues: TweenService (copy), v7 (copy) ]]
	if not p1.Focused then
		return
	end
	p1.Focused = false
	local v1 = TweenService:Create(p1.TweenValue, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		Value = 0.01
	})
	v1.Completed:Once(function(p12) --[[ Line: 427 | Upvalues: p1 (copy) ]]
		if p12 ~= Enum.PlaybackState.Completed then
			return
		end
		if p1.Destroyed then
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
	if p1.Model:GetAttribute("Cooldown") then
		return
	end
	v7.stop(p1.Model)
	v7.target(p1.Model, 1, 1, {
		Pivot = p1.OriginalCF
	})
end
function t.GetClosestBoostPad(p1) --[[ GetClosestBoostPad | Line: 444 | Upvalues: v15 (ref), v16 (ref) ]]
	return v15, v16
end
local v20 = tick()
local v21 = 0
function t.Success(p1) --[[ Success | Line: 451 | Upvalues: v20 (ref), v17 (copy), v8 (copy), ReplicatedStorage (copy), v6 (copy), v21 (ref) ]]
	p1.LastCompleted = tick()
	v20 = tick()
	local ParticleAttachment = p1.Model:FindFirstChild("ParticleAttachment", true)
	if ParticleAttachment and (v17 and p1.BoostPadData) then
		if not next(ParticleAttachment:GetChildren()) then
			for k, v in pairs(v17:GetChildren()) do
				local v1 = v:Clone()
				v1.Color = ColorSequence.new(p1.BoostPadData.ParticleColor)
				v1.Parent = ParticleAttachment
			end
		end
		for k, v in pairs(ParticleAttachment:GetChildren()) do
			v:Emit(v:GetAttribute("EmitCount") or 1)
		end
	end
	v8:Tween(game.Lighting.ColorCorrection, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
		Brightness = 0.15
	}, true)
	ReplicatedStorage.Storage.SFX.ChargeEffectSound.PlaybackSpeed = v6.map(v21, 0, 4, 1.25, 1.9)
	ReplicatedStorage.Storage.SFX.ChargeEffectSound:Play()
	v21 = v21 + 1
	p1:SetActive(false)
	p1.Maid:GiveTask(task.delay(5, function() --[[ Line: 475 | Upvalues: p1 (copy) ]]
		if not p1.Destroyed then
			p1:SetActive(true)
		end
	end))
	if not (p1.BoostPadData and p1.BoostPadData.OnTouched) then
		return
	end
	p1.BoostPadData.OnTouched(p1)
end
function t.IsFocused(p1) --[[ IsFocused | Line: 485 ]]
	return p1.Focused
end
function t.Init(p1) --[[ Init | Line: 489 | Upvalues: RunService (copy), v13 (copy), v20 (ref), v21 (ref), v15 (ref), v16 (ref), v3 (copy), v14 (copy), v4 (copy), t (copy) ]]
	local v1 = nil
	RunService.Heartbeat:Connect(function(p1) --[[ Line: 492 | Upvalues: v13 (ref), v1 (ref), v20 (ref), v21 (ref), v15 (ref), v16 (ref) ]]
		if not v13:GetCurrentAnimal() then
			return
		end
		if not v1 then
			return
		end
		if tick() - v20 > 1.25 then
			v21 = 0
		end
		local v12 = 75
		local v2 = nil
		for k, v in pairs(v1) do
			if v.CanFocus and v:CanFocus() then
				local v3, v4 = v:GetDistanceFrom(v12)
				if v3 then
					v12 = v4
					v2 = v
				end
			end
		end
		if v2 then
			if not (v2 and (v2.IsFocused and v2:IsFocused())) then
				if v15 and v15.Unfocus then
					v15:Unfocus()
				else
					v15 = nil
				end
			end
		elseif v15 and v15.Unfocus then
			v15:Unfocus()
		end
		if v2 and v2.WithinBounds then
			if v2:WithinBounds(v12) then
				if not v2:IsFocused() then
					v2:Focus()
				end
			elseif v2:IsFocused() and v2.Unfocus then
				v2:Unfocus()
			end
		end
		v16 = v12
		v15 = v2
	end)
	v3.spawnLoopWithoutYielding(function() --[[ Line: 545 | Upvalues: v13 (ref), v1 (ref), v14 (ref) ]]
		if v13.PrimaryPart then
			v1 = v14:RadiusSearch(v13.PrimaryPart.Position, 150)
		end
	end, 0.5)
	v4.new("BoostPad", t):Init()
end
t:Init()
return t