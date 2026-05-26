-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("spr")
local v2 = Sonar("MathUtils")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("InstanceUtils")
local v5 = Sonar("StorageUtils")
local v6 = Sonar("Confetti")
local v7 = Sonar("EffectAnimationGroup")
local v8 = Sonar("SoundService")
local v9 = Sonar("ParticleConverter")
local v10 = Sonar("PackageImportUtils")
local v11 = v10.Import("EasyVisuals")()
local v12 = v10.Import("Emitter2D")()
local v13 = v5.GetFromPath("ReplicatedStorage/Storage/Assets/GuiTemplates")()
local v14 = v5.GetConfig("GuiAnimations")()
local PresetEffects = v14.PresetEffects
local PresetAnimations = v14.PresetAnimations
local v15 = v4.Create("ColorCorrectionEffect", {
	Name = "GuiColorCorrection",
	Parent = Lighting
})
local t2 = {}
local t3 = {
	Pivot = function(p1) --[[ Pivot | Line: 203 ]]
		return p1:GetPivot()
	end
}
local t4 = {}
local t5 = {
	BumpCamera = function(p1) --[[ BumpCamera | Line: 211 | Upvalues: t4 (copy), v1 (copy) ]]
		local v12 = p1.cframe or (p1.CFrame or p1.CF)
		if typeof(v12) ~= "CFrame" then
			return
		end
		local v2 = p1.damping or (p1.d or 0.65)
		local v3 = p1.frequency or (p1.f or 1)
		local CFrameValue = Instance.new("CFrameValue")
		CFrameValue.Value = v12
		local v4 = t4
		table.insert(v4, CFrameValue)
		local v5 = false
		local function cleanup() --[[ cleanup | Line: 225 | Upvalues: v5 (ref), v1 (ref), CFrameValue (copy), t4 (ref) ]]
			if v5 then
				return
			end
			v5 = true
			v1.stop(CFrameValue)
			local v12 = table.find(t4, CFrameValue)
			if v12 then
				table.remove(t4, v12)
			end
			CFrameValue:Destroy()
		end
		v1.target(CFrameValue, v2, v3, {
			Value = CFrame.new()
		})
		v1.completed(CFrameValue, cleanup)
		task.delay(math.clamp(6 / math.max(v2 * v3, 0.1), 2, 10), cleanup)
	end,
	BumpColorCorrection = function(p1) --[[ BumpColorCorrection | Line: 251 | Upvalues: v1 (copy), v15 (copy) ]]
		v1.stop(v15)
		local v12 = p1.damping or 0.65
		local v2 = p1.frequency or 1
		v15.TintColor = p1.tint or p1.color or Color3.new(255/255, 255/255, 255/255)
		v15.Saturation = p1.saturation or 0
		v15.Brightness = p1.brightness or 0
		task.delay(p1.delay or 0, function() --[[ Line: 262 | Upvalues: v1 (ref), v15 (ref), v12 (copy), v2 (copy) ]]
			v1.stop(v15)
			v1.target(v15, v12, v2, {
				Saturation = 0,
				Brightness = 0,
				TintColor = Color3.new(255/255, 255/255, 255/255)
			})
		end)
	end,
	BumpGui = function(p1) --[[ BumpGui | Line: 272 | Upvalues: v3 (copy), CollectionService (copy), t (copy), v1 (copy) ]]
		local container = p1.container
		if container and not v3.IsVisibleOnScreen(container) then
			return
		end
		local v12 = p1.damping or 0.4
		local v2 = p1.frequency or 5
		local v4 = p1.rotate or false
		local v5 = (p1.offsetmultiplier or p1.offsetMultiplier or 3) / 100
		local v6 = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
		for v7, v8 in CollectionService:GetTagged(p1.tag) do
			if v8:IsA("GuiObject") and (not container or v8:IsDescendantOf(container)) and v8.Visible ~= false then
				local v9 = t.GetProperties(v8, { "Position" }).Position or v8.Position
				local v10 = math.random() * 2 - 1
				local v11 = math.random() * 2 - 1
				if v10 == 0 and v11 == 0 then
					v10 = 1
				end
				local v14 = UDim2.new(v9.X.Scale, v9.X.Offset + v6.X * v5 * v10, v9.Y.Scale, v9.Y.Offset + v6.Y * v5 * v11)
				v1.stop(v8)
				v1.target(v8, v12, v2, {
					Position = v14
				})
				v1.completed(v8, function() --[[ Line: 317 | Upvalues: v1 (ref), v8 (copy), v9 (copy) ]]
					v1.target(v8, 0.35, 6, {
						Position = v9
					})
				end)
				if v4 then
					t.PlayEffect("Rotate", {
						Instance = v8,
						Rotation = math.random(-2 * v5, 2 * v5)
					})
				end
			end
		end
	end,
	BumpModel = function(p1) --[[ BumpModel | Line: 331 | Upvalues: t (copy), v1 (copy) ]]
		local v12 = if typeof(p1) == "table" and p1 then p1 else {
	model = p1
}
		local v2 = v12.model or (v12.Instance or (v12.Model or error("[bumpModel] model missing")))
		if v2:IsA("BasePart") then
			v2 = v2:FindFirstAncestorOfClass("Model") or error("[bumpModel] part has no model ancestor")
		end
		assert(v2:IsA("Model"), "[bumpModel] expected Model")
		local v5 = t.GetProperties(v2, { "Pivot" }).Pivot or v2:GetPivot()
		local v6 = v12.cframe or (v12.CFrame or (v12.CF or CFrame.new()))
		v1.stop(v2)
		v2:PivotTo(v5 * v6)
		v1.target(v2, v12.damping or (v12.d or 0.65), v12.frequency or (v12.f or 1), {
			Pivot = v5
		})
	end,
	Rotate = function(p1) --[[ Rotate | Line: 354 | Upvalues: v1 (copy) ]]
		local v12 = p1.Instance
		v1.stop(v12)
		v12.Rotation = p1.rotation or 0
		v1.target(v12, p1.damping or p1.d or 0.15, p1.frequency or (p1.f or 4), {
			Rotation = 0
		})
	end,
	SlideGradient = function(p1) --[[ SlideGradient | Line: 365 | Upvalues: t (copy), v1 (copy) ]]
		local v12 = p1.Instance
		local v2 = p1.delay or 0
		local v3 = p1.offset or Vector2.new(-1, 0)
		local v4 = p1.rotation or 0
		local v5 = t.GetProperties(v12, { "Offset", "Rotation" })
		local function animate() --[[ animate | Line: 376 | Upvalues: v1 (ref), v12 (copy), v5 (copy), v3 (copy), v4 (copy), p1 (copy) ]]
			v1.stop(v12)
			local v13 = v5.Offset or Vector2.new(0, 0)
			local v2 = v5.Rotation or 0
			v12.Offset = v13 + v3
			v12.Rotation = v2 + v4
			v1.target(v12, p1.damping or 0.4, p1.frequency or 1.5, {
				Offset = v13,
				Rotation = v2
			})
		end
		if v2 > 0 then
			task.delay(v2, animate)
		else
			animate()
		end
	end,
	SlideTextGradient = function(p1) --[[ SlideTextGradient | Line: 396 | Upvalues: v13 (copy), v2 (copy), v1 (copy) ]]
		local v12 = p1.Instance
		local v22 = p1.offset or Vector2.new(-0.75, 0)
		local v4 = v12:FindFirstChild("TextFlashGradient") or v13.TextFlashGradient:Clone()
		local v5 = v2.tintColorSequence(v4.Color, p1.color)
		v4.Parent = v12
		v1.stop(v4)
		v4.Offset = v22
		v1.target(v4, 1, p1.frequency or 2.5, {
			Offset = Vector2.new(-v22.X, -v22.Y),
			Color = v5
		})
	end,
	Bounce = function(p1) --[[ Bounce | Line: 416 | Upvalues: t (copy), v1 (copy) ]]
		local v12 = p1.Instance
		local v3 = p1.multiplier or 1
		local Position = t.GetProperties(v12, { "Position" }).Position
		task.delay(p1.delay or 0, function() --[[ Line: 427 | Upvalues: v1 (ref), v12 (copy), Position (copy), v3 (copy), p1 (copy) ]]
			v1.stop(v12)
			v1.target(v12, 1, 10, {
				Position = UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset - v12.AbsoluteSize.Y * 0.1 * v3)
			})
			v1.completed(v12, function() --[[ Line: 436 | Upvalues: v1 (ref), v12 (ref), p1 (ref), Position (ref) ]]
				v1.target(v12, p1.damping or 0.35, p1.frequency or 3, {
					Position = Position,
					Priority = p1.Priority or nil
				})
			end)
		end)
	end,
	PopScale = function(p1) --[[ PopScale | Line: 442 | Upvalues: t (copy), v1 (copy) ]]
		local v4 = p1.Instance:IsA("UIScale") and p1.Instance or p1.Instance:FindFirstChildOfClass("UIScale")
		if not v4 then
			local UIScale = Instance.new("UIScale")
			UIScale.Parent = p1.Instance
			v4 = UIScale
		end
		local v5 = t.GetProperties(v4, { "Scale" }).Scale or 1
		v1.stop(v4)
		v4.Scale = p1.Scale or 1.25
		v1.target(v4, p1.damping or 0.25, p1.frequency or 4, {
			Scale = v5,
			Priority = p1.Priority or nil,
			Stop = p1.Stop or nil
		})
	end,
	Confetti = function(p1) --[[ Confetti | Line: 464 | Upvalues: v6 (copy) ]]
		task.delay(p1.delay or 0, function() --[[ Line: 467 | Upvalues: p1 (copy), v6 (ref) ]]
			for i = 1, p1.count or 1 do
				v6.new(p1)
			end
		end)
	end,
	EffectGroup = function(...) --[[ EffectGroup | Line: 474 | Upvalues: v7 (copy) ]]
		return v7.new(...)
	end,
	Sound = function(p1) --[[ Sound | Line: 480 | Upvalues: v8 (copy), TweenService (copy) ]]
		local v1 = v8.playSoundOnce(p1.Name, p1)
		if p1.FadeDelay then
			task.delay(p1.FadeDelay, function() --[[ Line: 483 | Upvalues: TweenService (ref), v1 (copy), p1 (copy) ]]
				TweenService:Create(v1, TweenInfo.new(p1.FadeDuration or v1.TimeLength - v1.TimePosition - 0.1), {
					Volume = 0
				}):Play()
			end)
		end
		return v1
	end,
	Particle2D = function(p1) --[[ Particle2D | Line: 490 | Upvalues: v9 (copy) ]]
		p1.Properties = p1.Properties or {}
		if p1.Enabled == nil then
			p1.Properties.Enabled = true
		else
			p1.Properties.Enabled = p1.Enabled
		end
		local Particle = (p1.Particle:IsA("ParticleEmitter") and v9:Convert(p1.Particle, p1.Properties) or p1.Particle):Clone()
		Particle.Name = "Particle"
		for v3, v4 in p1.Properties do
			Particle:SetAttribute(v3, v4)
		end
		if p1.Emit then
			task.spawn(function() --[[ Line: 507 | Upvalues: Particle (ref), p1 (copy) ]]
				Particle:WaitForChild("Emit"):Fire(p1.Emit)
			end)
		end
		Particle.Parent = p1.Instance
		v9:AddTag(Particle)
		return Particle
	end,
	EasyVisuals = function(p1) --[[ EasyVisuals | Line: 518 | Upvalues: v11 (copy) ]]
		local v1 = p1.Properties or {}
		return v11.new(p1.Instance, p1.Effect, v1.speed, v1.size, v1.saveInstanceObjects, v1.customColor, v1.customTransparency, v1.resumesOnVisible)
	end,
	GradientOverlay = function(p1) --[[ GradientOverlay | Line: 533 | Upvalues: v3 (copy) ]]
		local v2 = v3.FindElement(p1.Tag and v3.FindElement(p1.Tag) or v3.GetPlayerGui("EffectsGui"), "OverlayLabel")
		local v32 = v2:Clone()
		v32.Parent = v2.Parent
		local v4 = task.spawn(p1.animated, v32)
		return function() --[[ Line: 541 | Upvalues: v4 (copy), p1 (copy), v32 (copy) ]]
			if v4 then
				task.cancel(v4)
			end
			if not p1.cleanup then
				return
			end
			task.spawn(p1.cleanup, v32)
		end
	end
}
function t.GetProperties(p1, p2) --[[ GetProperties | Line: 559 | Upvalues: t2 (copy), t3 (copy) ]]
	local v1 = t2[p1]
	if not v1 then
		v1 = {}
		t2[p1] = v1
		p1.Destroying:Once(function() --[[ Line: 565 | Upvalues: t2 (ref), p1 (copy) ]]
			t2[p1] = nil
		end)
	end
	for v2, v3 in p2 do
		if not v1[v3] then
			v1[v3] = t3[v3] and t3[v3](p1) or p1[v3]
		end
	end
	local t = {}
	for v6, v7 in p2 do
		t[v7] = v1[v7]
	end
	return t
end
function t.GetInOrderOfLayout(p1) --[[ GetInOrderOfLayout | Line: 589 ]]
	local t = {}
	for k, v in pairs(p1) do
		local v1 = nil
		if type(v) == "table" then
			v1 = v.LayoutOrder
			if v1 ~= nil then
				table.insert(t, v)
			end
		elseif v:IsA("GuiObject") then
			if not v:HasTag("DefaultTemplate") then
				v1 = v.LayoutOrder
				if v1 ~= nil then
					table.insert(t, v)
				end
			end
		elseif v1 ~= nil then
			table.insert(t, v)
		end
	end
	table.sort(t, function(p1, p2) --[[ Line: 614 ]]
		return p1.LayoutOrder < p2.LayoutOrder
	end)
	return t
end
function t.PlayEffect(p1, p2, ...) --[[ PlayEffect | Line: 627 | Upvalues: t5 (copy), PresetEffects (copy), v3 (copy) ]]
	local v1 = if p2 then p2 else {}
	local v2 = t5[p1] or PresetEffects[p1]
	if not v2 then
		return
	end
	if type(v2) == "function" then
		return v2(v1, v3, ...)
	else
		warn("\226\154\160\239\184\143 GuiAnimations, " .. p1 .. " is not a function, preset effects called by this method MUST be a function")
	end
end
function t.Create(...) --[[ Create | Line: 648 | Upvalues: t (copy) ]]
	return t.PlayEffect(...)
end
function t.CreateEffect(...) --[[ CreateEffect | Line: 653 | Upvalues: t (copy) ]]
	return t.Create(...)
end
function t.GetPresetEffects() --[[ GetPresetEffects | Line: 660 | Upvalues: PresetEffects (copy) ]]
	return PresetEffects
end
function t.GetPresetAnimations() --[[ GetPresetAnimations | Line: 667 | Upvalues: PresetAnimations (copy) ]]
	return PresetAnimations
end
function t.Init(p1) --[[ Init | Line: 674 | Upvalues: v11 (copy), PresetEffects (copy), t5 (copy), RunService (copy), t4 (copy), v12 (copy) ]]
	for v1, v2 in v11.GetEffects() do
		if PresetEffects[v1] then
			warn("\226\154\160\239\184\143 GuiAnimations/EasyVisuals, " .. v1 .. " is already a preset effect and must be renamed")
			continue
		end
		PresetEffects[v1] = function(p1) --[[ Line: 681 | Upvalues: v1 (copy), t5 (ref) ]]
			p1.Effect = v1
			return t5.EasyVisuals(p1)
		end
	end
	for v3, v4 in PresetEffects do
		if t5[v3] then
			warn("\226\154\160\239\184\143 GuiAnimations, " .. v3 .. " is already a base effect and must be renamed")
		end
	end
	RunService:BindToRenderStep("CameraBump", Enum.RenderPriority.Camera.Value, function() --[[ Line: 694 | Upvalues: t4 (ref) ]]
		local CurrentCamera = workspace.CurrentCamera
		local v1 = CFrame.new()
		for v2, v3 in t4 do
			v1 = v1 * v3.Value
		end
		CurrentCamera.CFrame = CurrentCamera.CFrame * v1
	end)
	v12:Init()
end
t:Init()
return t