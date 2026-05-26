-- https://lua.expert/
local t = {}
t.__index = t
local RunService = game:GetService("RunService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("Maid")
local v3 = Sonar("Signal")
local v4 = Sonar("CameraShaker")
local v5 = Sonar("spr")
local v6 = Sonar("FoVService")
local v7 = v1.GetClient()
v7:SetActionState("Minigame", (Instance.new("BoolValue")))
local ContainerFrame = game.Players.LocalPlayer.PlayerGui:WaitForChild("SearchMinigame").ContainerFrame
local DefaultTarget = ContainerFrame.DefaultTarget
local ClickSound = game.ReplicatedStorage.Storage.SFX.ClickSound
local CurrentCamera = workspace.CurrentCamera
local v8 = v4.new(Enum.RenderPriority.Camera.Value, "SearchShaker", function(p1) --[[ Line: 35 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v8:Start()
local v9 = nil
function t.new(p1) --[[ new | Line: 41 | Upvalues: v9 (ref), v7 (copy), t (copy), v2 (copy), v3 (copy), ClickSound (copy), RunService (copy), v6 (copy), v5 (copy) ]]
	local v22
	if not (v9 and v9.Destroy) then
		local v1
		v7:SetActionState("Minigame", true)
		v1 = t
		v22 = setmetatable({}, t)
		v22.Maid = v2.new()
		v22.ActiveTargets = {}
		v22.TargetPositions = {}
		v22.CurrentPositionIndex = 0
		v22.TargetClicked = v3.new()
		v22.Maid:GiveTask(v22.TargetClicked)
		v22.LastTargetTime = 0
		v22.TARGET_SPAWN_RATE = 0
		v22.MAX_TARGETS = 1
		v22.TOTAL_POSITIONS = 10
		v22.Progress = 0
		v22.Max = 20
		v22.LastHitTime = 0
		v22.CurrentPitch = 0.5
		v22.TargetPitch = 0.5
		ClickSound.PlaybackSpeed = 0.5
		v22:_generatePositions()
		v22.Maid:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 76 | Upvalues: v22 (copy), v6 (ref), v5 (ref) ]]
			local v1
			if not (#v22.ActiveTargets < v22.MAX_TARGETS and tick() - v22.LastTargetTime > v22.TARGET_SPAWN_RATE) then
				v1 = v22.Progress / v22.Max * -12
				v6.setModifierValue("SearchMinigame", v1)
				v5.target(game.Lighting.ColorCorrection, 0.5, 1.5, {
					Brightness = 0.1 * (v22.Progress / v22.Max)
				})
				v22:_updatePitch()
				return
			end
			v22:_createTarget()
			v1 = v22.Progress / v22.Max * -12
			v6.setModifierValue("SearchMinigame", v1)
			v5.target(game.Lighting.ColorCorrection, 0.5, 1.5, {
				Brightness = 0.1 * (v22.Progress / v22.Max)
			})
			v22:_updatePitch()
		end))
		v6.setModifier("SearchMinigame", true)
		v9 = v22
		return v22
	end
	v9:Destroy()
	v7:SetActionState("Minigame", true)
	v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.ActiveTargets = {}
	v22.TargetPositions = {}
	v22.CurrentPositionIndex = 0
	v22.TargetClicked = v3.new()
	v22.Maid:GiveTask(v22.TargetClicked)
	v22.LastTargetTime = 0
	v22.TARGET_SPAWN_RATE = 0
	v22.MAX_TARGETS = 1
	v22.TOTAL_POSITIONS = 10
	v22.Progress = 0
	v22.Max = 20
	v22.LastHitTime = 0
	v22.CurrentPitch = 0.5
	v22.TargetPitch = 0.5
	ClickSound.PlaybackSpeed = 0.5
	v22:_generatePositions()
	v22.Maid:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 76 | Upvalues: v22 (copy), v6 (ref), v5 (ref) ]]
		local v1
		if not (#v22.ActiveTargets < v22.MAX_TARGETS and tick() - v22.LastTargetTime > v22.TARGET_SPAWN_RATE) then
			v1 = v22.Progress / v22.Max * -12
			v6.setModifierValue("SearchMinigame", v1)
			v5.target(game.Lighting.ColorCorrection, 0.5, 1.5, {
				Brightness = 0.1 * (v22.Progress / v22.Max)
			})
			v22:_updatePitch()
			return
		end
		v22:_createTarget()
		v1 = v22.Progress / v22.Max * -12
		v6.setModifierValue("SearchMinigame", v1)
		v5.target(game.Lighting.ColorCorrection, 0.5, 1.5, {
			Brightness = 0.1 * (v22.Progress / v22.Max)
		})
		v22:_updatePitch()
	end))
	v6.setModifier("SearchMinigame", true)
	v9 = v22
	return v22
end
function t._generatePositions(p1) --[[ _generatePositions | Line: 98 | Upvalues: ContainerFrame (copy) ]]
	local AbsoluteSize = ContainerFrame.AbsoluteSize
	local count = 0
	while #p1.TargetPositions < p1.TOTAL_POSITIONS and count < 9999 do
		local v1 = math.random(0, AbsoluteSize.X)
		local v2 = math.random(0, AbsoluteSize.Y)
		local v3 = false
		for i, v in ipairs(p1.TargetPositions) do
			local v4 = v1 - v.X * AbsoluteSize.X
			local v5 = v2 - v.Y * AbsoluteSize.Y
			if v4 * v4 + v5 * v5 < 10000 then
				v3 = true
				break
			end
		end
		if not v3 then
			table.insert(p1.TargetPositions, Vector2.new(v1 / AbsoluteSize.X, v2 / AbsoluteSize.Y))
		end
		count = count + 1
	end
end
function t._getNextPosition(p1) --[[ _getNextPosition | Line: 124 ]]
	p1.CurrentPositionIndex = p1.CurrentPositionIndex % p1.TOTAL_POSITIONS + 1
	return p1.TargetPositions[p1.CurrentPositionIndex]
end
function t._getNextPositionVector(p1) --[[ _getNextPositionVector | Line: 129 ]]
	return p1.TargetPositions[p1.CurrentPositionIndex % p1.TOTAL_POSITIONS + 1]
end
function t._createTarget(p1) --[[ _createTarget | Line: 134 | Upvalues: DefaultTarget (copy), v5 (copy), ContainerFrame (copy) ]]
	p1.LastTargetTime = tick()
	local v1 = DefaultTarget:Clone()
	v1.Visible = true
	v1.AnchorPoint = Vector2.new(0.5, 0.5)
	local v2 = p1:_getNextPosition()
	v1.Position = UDim2.fromScale(v2.X, v2.Y)
	v5.target(v1, 0.4, 2.25, {
		Rotation = 0
	})
	table.insert(p1.ActiveTargets, v1)
	v1.Parent = ContainerFrame
	v1.InputBegan:Connect(function(p12) --[[ Line: 150 | Upvalues: p1 (copy), v1 (copy) ]]
		if not table.find(p1.ActiveTargets, v1) then
			return
		end
		p1:_hit(v1)
	end)
	p1.Maid:GiveTask(v1)
	pcall(function() --[[ Line: 158 | Upvalues: v5 (ref), v1 (copy), ContainerFrame (ref) ]]
		v5.target(v1.UIScale, 0.8, 1.5, {
			Scale = 1.15
		})
		v5.completed(v1.UIScale, function() --[[ Line: 160 | Upvalues: v1 (ref), ContainerFrame (ref), v5 (ref) ]]
			if v1.Parent ~= ContainerFrame or not v1.Visible then
				return
			end
			v5.target(v1.UIScale, 0.8, 1.5, {
				Scale = 1
			})
		end)
	end)
end
function t._updatePitch(p1) --[[ _updatePitch | Line: 168 | Upvalues: ClickSound (copy) ]]
	if tick() - p1.LastHitTime > 0.55 then
		p1.TargetPitch = 0.5
	end
	p1.CurrentPitch = math.clamp(p1.CurrentPitch + (p1.TargetPitch - p1.CurrentPitch) * 0.2, 0.5, 2)
	ClickSound.PlaybackSpeed = p1.CurrentPitch
end
function t._hit(p1, p2) --[[ _hit | Line: 186 | Upvalues: t (copy), ClickSound (copy), v8 (copy), v4 (copy) ]]
	p1.LastHitTime = tick()
	p1.TargetPitch = math.min(2, p1.CurrentPitch + 0.35)
	p1.Progress = p1.Progress + 0.15
	if not (p1.Progress >= p1.Max) then
		ClickSound:Play()
		v8:Shake(v4.Presets.SmallBump)
		p1.TargetClicked:Fire(p2)
		p1:_destroyTarget(p2, true)
		return
	end
	local _ = math.random() <= 0.25
	t.ResultSignal:Fire(true)
	if not p1.Destroy then
		return
	end
	p1:Destroy(true)
end
function t._destroyTarget(p1, p2, p3) --[[ _destroyTarget | Line: 208 | Upvalues: v5 (copy) ]]
	local v1 = table.find(p1.ActiveTargets, p2)
	if not v1 then
		return
	end
	table.remove(p1.ActiveTargets, v1)
	local Ring = p2.Ring
	Ring.Visible = true
	if p3 then
		v5.target(Ring.UIScale, 0.8, 1, {
			Scale = 2
		})
	else
		v5.target(Ring.UIScale, 0.8, 1, {
			Scale = 1
		})
	end
	v5.target(Ring, 0.8, 0.8, {
		ImageTransparency = 1
	})
	local function fadeOut(p1) --[[ fadeOut | Line: 224 | Upvalues: p2 (copy), v5 (ref) ]]
		if p1:IsA("GuiObject") then
			local v1 = if p1:IsA("ImageButton") or p1:IsA("ImageLabel") then "ImageTransparency" else "BackgroundTransparency"
			if p1 == p2 then
				v5.target(p1, 0.8, 1.25, {
					ImageTransparency = 1,
					BackgroundTransparency = 1
				})
			else
				v5.target(p1, 0.8, 1.25, {
					[v1] = 1
				})
			end
		else
			if not p1:IsA("UIStroke") then
				return
			end
			v5.target(p1, 0.8, 1.25, {
				Thickness = 0
			})
		end
	end
	for v2, v3 in p2:GetDescendants() do
		fadeOut(v3)
	end
	fadeOut(p2)
	v5.completed(p2, function() --[[ Line: 243 | Upvalues: p2 (copy) ]]
		p2:Destroy()
	end)
end
function t.Destroy(p1, p2) --[[ Destroy | Line: 249 | Upvalues: v8 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy) ]]
	if not p2 then
		v6.setModifierValue("SearchMinigame", 0)
		v6.setModifier("SearchMinigame", false)
		p1._destroyed = true
		p1.Maid:Destroy()
		setmetatable(p1, nil)
		table.clear(p1)
		v7:SetActionState("Minigame", false)
		return
	end
	v8:Shake(v4.Presets.RotationBump)
	game.Lighting.ColorCorrection.TintColor = Color3.new(0, 0.882353, 1)
	v5.target(game.Lighting.ColorCorrection, 0.5, 1.5, {
		Brightness = 0,
		TintColor = Color3.new(255/255, 255/255, 255/255)
	})
	v6.setModifierValue("SearchMinigame", 0)
	v6.setModifier("SearchMinigame", false)
	p1._destroyed = true
	p1.Maid:Destroy()
	setmetatable(p1, nil)
	table.clear(p1)
	v7:SetActionState("Minigame", false)
end
function t.init() --[[ init | Line: 266 | Upvalues: t (copy), v3 (copy) ]]
	t.ResultSignal = v3.new()
end
t.init()
return t