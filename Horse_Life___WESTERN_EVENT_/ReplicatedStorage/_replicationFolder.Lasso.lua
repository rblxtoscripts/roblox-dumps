-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("FoVService")
Sonar("GuiManager")
local v3 = Sonar("GuiUtils")
local v4 = Sonar("InputTypeDetector")
Sonar("InventoryGui")
local v5 = Sonar("IssueResponseClient")
local v6 = Sonar("ItemDataService")
Sonar("LeaderboardGui")
local v7 = Sonar("Maid")
local v8 = Sonar("MathUtils")
local v9 = Sonar("MessagesClient")
local v10 = Sonar("MobAnimator")
local v11 = Sonar("NotificationsClient")
local v12 = Sonar("SettingsService")
local v13 = Sonar("PlayerWrapper")
local v14 = Sonar("PromptClient")
local v15 = Sonar("TameUtils")
local v16 = Sonar("WorldspaceGuiUtils")
local v17 = Sonar("UINavigator")
local v18 = Sonar("ParticleUtils")
local v19 = Sonar("CameraUtils")
local v20 = Sonar("ColorCorrectionUtils")
local TamingFailDistance = Sonar("Constants").MobData.Fae.TamingFailDistance
local v21 = v13.GetClient()
local v22 = Players.LocalPlayer:GetMouse()
local MobFolder = Workspace:WaitForChild("MobFolder")
local Storage = ReplicatedStorage:WaitForChild("Storage")
local LassoDisplay = Storage.Assets.LassoDisplay
local SFX = Storage.SFX
local v23 = tick()
local v24 = tick()
local v25 = tick()
local v26 = nil
local t2 = { Workspace.Terrain }
local t3 = { "Missed it!", "So close!", "Whoops!", "Slipped away!", "Dang it!", "Fumbled it!", "Too slow!" }
local t4 = { "Good Throw", "Wow!", "Bullseye!", "Yeehaw!", "Nailed it!", "Roped in!", "Gotcha!" }
local t5 = {
	Fae = {
		Hit = function(p1) --[[ Hit | Line: 86 ]] end,
		RenderStepped = function(p1) --[[ RenderStepped | Line: 89 | Upvalues: LassoDisplay (copy), TamingFailDistance (copy), v23 (ref), v10 (copy) ]]
			local Position = p1.Object.Parent.HumanoidRootPart.Position
			if p1.LastTarget and p1.LastTarget.Parent then
				local Position_2 = p1.LastTarget.Position
				if Position_2 and Position then
					if p1.RangeFinder or not Position_2 then
						p1.RangeFinder.Position = p1.LastTarget.Position
					else
						p1.RangeFinder = LassoDisplay.LassoRangePart:Clone()
						p1.RangeFinder.Size = Vector3.new(0.1, TamingFailDistance * 2, TamingFailDistance * 2)
						p1.RangeFinder.Position = p1.LastTarget.Position
						p1.RangeFinder.LassoSurfaceGui.Frame.UIStroke.Color = Color3.fromRGB(255, 46, 49)
						p1.RangeFinder.Parent = workspace
						p1.Maid:GiveTask(p1.RangeFinder)
					end
					if not (TamingFailDistance < (Position_2 - Position).Magnitude and p1.LastTarget) then
						return
					end
					warn(p1.LastTarget)
					if tick() - v23 > 1 then
						local v3 = v10.getMobFromModel(p1.LastTarget)
						warn(v3)
						v23 = tick()
						if v3 then
							warn("canceling")
							v3:RunAction("Cancel")
						end
					end
					p1.LastTarget = nil
				end
			end
			if not p1.RangeFinder then
				return
			end
			p1.RangeFinder:Destroy()
			p1.RangeFinder = nil
		end
	}
}
function t.new(p1, p2) --[[ new | Line: 149 | Upvalues: t (ref), v7 (copy), RunService (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Tool = p1
	p1.RepeatActions = true
	v2.RepeatActions = true
	v2.Object = p1.Object
	v2.ToolInterfaceHandlers = p2
	v2.Maid = v7.new()
	if RunService:IsServer() then
		v2:_initServer()
	else
		v2:_initClient()
	end
	return v2
end
function t._initServer(p1) --[[ _initServer | Line: 169 ]] end
function t._initClient(p1) --[[ _initClient | Line: 173 | Upvalues: v6 (copy), v4 (copy), v16 (copy), Sonar (copy), v21 (copy), v10 (copy) ]]
	p1.NextUse = 0
	p1.Data = v6.GetByName(p1.Object.Name)
	p1.MaxLassoDistance = p1.Data.Distance
	local v1 = if v4.IsGamepadInputType() or v4.IsMobileInputType() then 1.5 else 1
	p1.LassoHitRange = p1.Data.Hit * v1
	local v2 = game.ReplicatedStorage.Storage.Assets.ToolBillboard:Clone()
	v16.AddWorldspaceGui(v2)
	v2.Parent = p1.Object:WaitForChild("Handle")
	p1.ToolUI = v2
	p1.Maid:GiveTask(v2)
	local v3 = Sonar("DebounceMeter").new(v2.DebounceMeter)
	p1.Maid:GiveTask(v3)
	p1.debounceMeter = v3
	p1.Maid:GiveTask(v4.InputTypeChanged:Connect(function() --[[ Line: 192 | Upvalues: p1 (copy), v4 (ref) ]]
		p1.LassoHitRange = p1.Data.Hit * (if v4.IsGamepadInputType() or v4.IsMobileInputType() then 1.5 else 1)
		p1:_setControls()
	end))
	p1.Maid:GiveTask(v21.CurrentAnimalChangedSignal:Connect(function() --[[ Line: 199 | Upvalues: p1 (copy), v10 (ref) ]]
		p1:_setControls()
		if not p1.LastTarget then
			return
		end
		local v1 = v10.getMobFromModel(p1.LastTarget)
		if v1 then
			v1:RunAction("Cancel")
		end
		p1.LastTarget = nil
		if not p1.RangeFinder then
			return
		end
		p1.RangeFinder:Destroy()
		p1.RangeFinder = nil
	end))
	p1:_setControls()
	p1.RopeConstraint = Instance.new("RopeConstraint")
	p1.RopeConstraint.Enabled = false
	p1.RopeConstraint.Visible = true
	p1.RopeConstraint.Length = 5
	p1.RopeConstraint.Color = p1.Data.RopeColor or BrickColor.new(1, 0.792157, 0.611765)
	p1.RopeConstraint.Parent = p1.Object
end
function t._setControls(p1) --[[ _setControls | Line: 230 | Upvalues: v21 (copy), v4 (copy) ]]
	p1.ToolUI.ControlsFrame.Visible = v21:GetCurrentAnimal()
	p1.ToolUI.ControlsFrame.Release.Visible = false
	p1.ToolUI.ControlsFrame.Position = v4.IsMobileInputType() and UDim2.new(0.05, 0, 0.8, 0) or UDim2.new(0.05, 0, 0.7, 0)
end
function t._startMinigame(p1) --[[ _startMinigame | Line: 237 | Upvalues: v7 (copy), v4 (copy), v17 (copy), v22 (copy), RunService (copy), t2 (copy), v1 (copy), MobFolder (copy), v10 (copy), v16 (copy), t5 (copy) ]]
	local v12 = v7.new()
	p1.Maid.MinigameMaid = v12
	local LassoDisplay = game.ReplicatedStorage.Storage.Assets.LassoDisplay
	p1.LassoPart = LassoDisplay.LassoRangePart:Clone()
	p1.LassoPart.Name = "LassoRange"
	p1.LassoPartSize = Vector3.new(0.1, p1.MaxLassoDistance, p1.MaxLassoDistance)
	p1.LassoPart.Size = p1.LassoPartSize
	p1.LassoPart.Transparency = 1
	p1.MousePart = LassoDisplay.LassoCursorPart:Clone()
	p1.MousePartSize = Vector3.new(0.9, p1.LassoHitRange, p1.LassoHitRange)
	p1.MousePart.Size = p1.MousePartSize
	p1.DefaultMouseColor = Color3.new(0.94902, 1, 0)
	p1.HitColor = Color3.new(0/255, 255/255, 0/255)
	p1.MissColor = Color3.new(1, 0.478431, 0.384314)
	p1.LassoSurfaceGui = p1.LassoPart.LassoSurfaceGui
	p1.MouseSurfaceGui = p1.MousePart.LassoSurfaceGui
	p1.MouseSurfaceGui.Enabled = not v4.IsMobileInputType()
	v12:GiveTask(p1.LassoPart)
	v12:GiveTask(p1.MousePart)
	local v2 = Instance.new("NumberValue")
	v2.Value = v2.Value - 1
	v12:GiveTask(v2.Changed:Connect(function(p12) --[[ Line: 265 | Upvalues: p1 (copy) ]]
		local v1 = Color3.new(255/255, 255/255, 255/255):Lerp(Color3.new(0/255, 255/255, 0/255), p12)
		p1.MouseSurfaceGui.Frame.UIStroke.Color = v1
		p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Rotation = p12 * 135
	end))
	v2.Value = 0
	v12:GiveTask(v2)
	local function getHit() --[[ getHit | Line: 278 | Upvalues: v4 (ref), v17 (ref), v22 (ref) ]]
		local _ = v4.IsMobileInputType() or v17.InGamepadSelection()
		return v22.Hit.p
	end
	local function updateCursorTransparency() --[[ updateCursorTransparency | Line: 286 | Upvalues: p1 (copy) ]]
		if tick() >= p1.NextUse then
			p1.MouseSurfaceGui.Frame.UIStroke.Transparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundTransparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundTransparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundTransparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundTransparency = 0
		else
			p1.MouseSurfaceGui.Frame.UIStroke.Transparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundTransparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundTransparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundTransparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundTransparency = 0.8
		end
	end
	local function updateCursorPosition() --[[ updateCursorPosition | Line: 302 | Upvalues: p1 (copy), v4 (ref), v17 (ref), v22 (ref), v2 (copy) ]]
		local Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
		local v1 = p1.MaxLassoDistance / 2 - p1.LassoHitRange / 2
		local v3 = (p1.CursorLocation or (if v4.IsMobileInputType() or v17.InGamepadSelection() then v22.Hit.p else v22.Hit.p)) - Position
		local v42 = math.min(v3.magnitude, v1)
		local v5 = CFrame.new(Position + v3.unit * v42) * CFrame.Angles(0, 0, 1.5707963267948966)
		if v4.IsMobileInputType() then
			p1.LassoSurfaceGui.Frame.UIStroke.Transparency = 0
		else
			p1.LassoSurfaceGui.Frame.UIStroke.Transparency = math.clamp((v1 - v42) / p1.LassoHitRange, 0, 1)
		end
		p1.MousePart.Position = v5.Position:Lerp(p1.LastTargetPos or v5.Position, v2.Value)
		return v5
	end
	v12:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 336 | Upvalues: p1 (copy), t2 (ref), updateCursorPosition (copy), v1 (ref), v2 (copy), updateCursorTransparency (copy) ]]
		if not p1.Equipped then
			return
		end
		local Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
		p1.Origin = Position
		local _, v22 = workspace:FindPartOnRayWithWhitelist(Ray.new(Position, Vector3.new(0, -100, 0)), t2)
		p1.LassoPart.CFrame = CFrame.new(Position) * CFrame.new(0, -(Position - v22).Y - 3, 0) * CFrame.Angles(0, 0, 1.5707963267948966)
		local v4 = updateCursorPosition()
		local v5 = p1:_getMouseSize()
		local v6, v7 = p1:_checkTarget(v4.Position)
		p1.MousePartSize = Vector3.new(0.9, v5, v5)
		if v6 or v7 then
			local v8
			if v6 then
				p1.LastTargetPos = v6.Model.Position - Vector3.new(0, v6.Model.Size.Y / 2, 0)
				v8 = Vector3.new(0.9, v6.Model.Size.Z * 3, v6.Model.Size.Z * 3)
			else
				p1.LastTargetPos = v7.Position - Vector3.new(0, v7.Size.Y / 2, 0)
				v8 = Vector3.new(0.9, v7.Size.Z * 3, v7.Size.Z * 3)
			end
			v1.target(v2, 1, 3, {
				Value = 1
			})
			v1.target(p1.MousePart, 1, 3, {
				Size = v8
			})
		else
			p1.LastTargetPos = p1.LastTargetPos or v4.Position
			v1.target(v2, 1, 3, {
				Value = 0
			})
			v1.target(p1.MousePart, 0.5, 3, {
				Size = p1.MousePartSize
			})
		end
		updateCursorTransparency()
	end))
	v12:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 381 | Upvalues: p1 (copy), MobFolder (ref), v10 (ref), v4 (ref), v16 (ref), t5 (ref) ]]
		local Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
		local v1 = p1.MaxLassoDistance / 2 - p1.LassoHitRange / 2 * 1.25
		for v2, v3 in MobFolder:GetChildren() do
			local v42 = v10.getMobFromModel(v3)
			if v42 then
				if (v42.Model.Position - Position).Magnitude <= v1 and v4.IsMobileInputType() then
					if not v42.MobileTameUI then
						v42.MobileTameUI = game.ReplicatedStorage.Storage.Assets.MobileTameUI:Clone()
						v42.MobileTameUI.Adornee = v42.CosmeticModel
						v16.AddWorldspaceGui(v42.MobileTameUI)
						v42.MobileTameUI.Parent = v42.CosmeticModel
					end
					continue
				end
				if v42.MobileTameUI then
					v42.MobileTameUI:Destroy()
					v42.MobileTameUI = nil
				end
			end
		end
		if not (p1.LastTarget and t5[p1.LastClass.MobType]) then
			return
		end
		t5[p1.LastClass.MobType].RenderStepped(p1)
	end))
	v12:GiveTask(function() --[[ Line: 412 | Upvalues: v10 (ref) ]]
		for k, v in pairs(v10.GetAll()) do
			if v.MobileTameUI then
				v.MobileTameUI:Destroy()
				v.MobileTameUI = nil
			end
		end
	end)
	v12:GiveTask(game:GetService("UserInputService").TouchTapInWorld:Connect(function(p12, p2) --[[ Line: 422 | Upvalues: p1 (copy), updateCursorPosition (copy) ]]
		if p2 then
			return
		end
		local CurrentCamera = workspace.CurrentCamera
		local v1 = Vector3.new(p12.X, p12.Y, 0)
		local v2 = CurrentCamera:ViewportPointToRay(v1.X, v1.Y)
		local v3 = RaycastParams.new()
		v3.ExcludeInstances = { CurrentCamera }
		local v4 = workspace:Raycast(v2.Origin, v2.Direction * 1000, v3)
		if v4 then
			p1.CursorLocation = v4.Position
		else
			p1.CursorLocation = v2.Origin + v2.Direction * 100
		end
		updateCursorPosition()
		p1:OnInput()
	end))
	p1.LassoPart.Parent = workspace.CurrentCamera
	p1.MousePart.Parent = workspace.CurrentCamera
	p1.LassoPart.Size = Vector3.new(0, 0, 0)
	p1.MousePart.Size = Vector3.new(0, 0, 0)
	p1.MousePart.Position = v22.Hit.Position
	v1.target(p1.LassoPart, 0.5, 3.5, {
		Size = p1.LassoPartSize
	})
	v1.target(p1.MousePart, 0.5, 5, {
		Size = p1.MousePartSize
	})
	local Animation = Instance.new("Animation")
	Animation.AnimationId = "rbxassetid://16385033879"
	local v3 = p1.Object.Parent
	local v42 = v3.Humanoid.Animator:LoadAnimation(Animation)
	v42:Play()
	local Animation_2 = Instance.new("Animation")
	Animation_2.AnimationId = "rbxassetid://16385045159"
	p1.throwTrack = v3.Humanoid.Animator:LoadAnimation(Animation_2)
	p1.Maid.MinigameMaid:GiveTask(function() --[[ Line: 463 | Upvalues: v42 (copy), Animation (copy), p1 (copy), Animation_2 (copy) ]]
		v42:Stop()
		Animation:Destroy()
		p1.throwTrack:Stop()
		p1.throwTrack = nil
		Animation_2:Destroy()
	end)
end
function t._endMinigame(p1) --[[ _endMinigame | Line: 473 ]]
	p1.Maid.MinigameMaid = nil
end
function t._getMouseSize(p1) --[[ _getMouseSize | Line: 478 | Upvalues: v26 (ref), v8 (copy) ]]
	if not v26 then
		return p1.LassoHitRange
	end
	local v1 = v26.Model:GetAttribute("TamingHealth") or Vector2.new(0, 1)
	return v8.map(v1.X, 0, v1.Y, p1.LassoHitRange, p1.LassoHitRange * 0.425)
end
function t._hit(p1, p2, p3) --[[ _hit | Line: 487 | Upvalues: SFX (copy), v5 (copy), v11 (copy), v21 (copy), v10 (copy), v26 (ref), v8 (copy), v20 (copy), t5 (copy), v14 (copy), v9 (copy), t4 (copy) ]]
	if p1:_checkTarget(p3) ~= p2 then
		p1:_miss()
		return
	end
	if not p1:_checkCapacity(p2) then
		SFX.Error:Play()
		v5.NotifyIssue("AtAnimalLimit")
		return
	end
	p1:_animateHit(p2.Model)
	if not p1:_isRequiredLasso(p2) then
		v11.Notify({
			Message = "You cannot tame this species using this lasso!",
			Type = "LassoRequirement",
			Preset = "Yellow"
		})
		return
	end
	local Model = p2.Model
	local v1 = Model:GetAttribute("TamingId")
	if v1 and not Model:HasTag("Boss") then
		local v2 = Model:GetAttribute("TamingType")
		if v2 and v2 ~= 2 then
			v11.Notify({
				Message = "You need to feed this horse to assist!",
				Type = "NotLassoTaming"
			})
			return
		end
		if v21:GetStatValue("Tames").Value <= 0 and tonumber(v1) ~= v21.Player.UserId then
			v11.Notify({
				Message = "You haven\'t unlocked co-taming yet! Tame a different horse!",
				Preset = "Red"
			})
			return
		end
	end
	local function doLasso() --[[ doLasso | Line: 539 | Upvalues: p1 (copy), p2 (copy), v10 (ref), v1 (copy), v11 (ref), v26 (ref), Model (copy), SFX (ref), v8 (ref), v20 (ref) ]]
		if p1.LastTarget and p1.LastTarget ~= p2.Model then
			local v12 = v10.getMobFromModel(p1.LastTarget)
			if v12 then
				v12:RunAction("Cancel")
			end
			p1.LastTarget = nil
			if p1.RangeFinder then
				p1.RangeFinder:Destroy()
				p1.RangeFinder = nil
			end
		end
		if v1 and (tonumber(v1) ~= game.Players.LocalPlayer.UserId and not v10.getCurrentTamingTarget()) then
			v11.Notify({
				Message = "You are now assisting this tame!",
				Type = "AssistTame"
			})
		end
		v26 = p2
		p1.LastClass = p2
		p1.LastTarget = Model
		p1.LastTargetRelative = Model.CFrame:ToObjectSpace(p1.MousePart.CFrame)
		if not (v1 or Model:HasTag("Boss")) then
			SFX.QuestIncrement2.PlaybackSpeed = 0.85
			SFX.QuestIncrement2:Play()
			SFX.Whinny1:Play()
			p2:RunAction("BeginAggro")
			return
		end
		local v3 = Model:GetAttribute("TamingHealth")
		if not v3 then
			v20.Tween()
			p2:RunAction("SuccessfulFeed")
			return
		end
		local Y = v3.Y
		SFX.QuestIncrement2.PlaybackSpeed = v8.map(math.min(v3.X + v3.Z, Y), 0, Y, 0.85, 1.25)
		SFX.QuestIncrement2:Play()
		v20.Tween()
		p2:RunAction("SuccessfulFeed")
	end
	if t5[p2.MobType] then
		t5[p2.MobType].Hit(p2)
	end
	local v3 = v10.getCurrentTamingTarget()
	if v3 and v3 ~= Model then
		v14.Prompt({
			Type = "TameOtherHorse",
			BackgroundNotVisible = true,
			Run = function() --[[ Run | Line: 603 | Upvalues: doLasso (copy) ]]
				doLasso()
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 607 ]]
				return true
			end
		})
		return
	end
	local v4 = Model:GetAttribute("IsGlobalBoss")
	if Model:HasTag("Boss") and not (v4 or (v21:IsInAction("BossFight") or v21:IsInAction("GlobalBossFight"))) then
		v14.Prompt({
			Type = "CantTameBoss",
			BackgroundNotVisible = true,
			Run = function() --[[ Run | Line: 619 ]]
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 622 ]]
				return true
			end
		})
		return
	end
	if Model:HasTag("Boss") or not v21.PlayerData.Settings.States.TopNotifications.Value then
		doLasso()
		return
	end
	v9:AddNotification({
		Type = "LassoSuccess",
		Duration = 1.5,
		Text = t4[math.random(1, #t4)]
	})
	doLasso()
end
function t._miss(p1) --[[ _miss | Line: 646 | Upvalues: v26 (ref), v21 (copy), v9 (copy), t3 (copy), SFX (copy), v10 (copy) ]]
	local function cleanup(p12) --[[ cleanup | Line: 647 | Upvalues: v26 (ref), p1 (copy) ]]
		v26 = nil
		p1.LastTarget = nil
		if not (p12 and p1.RangeFinder) then
			return
		end
		p1.RangeFinder:Destroy()
		p1.RangeFinder = nil
	end
	if v26 and (not v26.Model:HasTag("Boss") and v21.PlayerData.Settings.States.TopNotifications.Value) then
		v9:AddNotification({
			Type = "LassoFailed",
			Duration = 1.5,
			Text = t3[math.random(1, #t3)]
		})
	end
	SFX.Error:Play()
	if not (v26 and (p1 and p1.LastTarget)) then
		return
	end
	if v26.Model then
		local v1 = v10.getMobFromModel(p1.LastTarget)
		if v1 then
			v1:RunAction("Failure")
			local v2 = p1.LastTarget:GetAttribute("TamingHealth")
			if (not p1.LastTarget or p1.LastTarget:GetAttribute("TamingId")) and not (p1.LastTarget and v2.X <= 1) then
				if p1.RangeFinder then
					return
				end
				v26 = nil
				p1.LastTarget = nil
				return
			end
		end
	end
	v26 = nil
	p1.LastTarget = nil
	if not p1.RangeFinder then
		return
	end
	p1.RangeFinder:Destroy()
	p1.RangeFinder = nil
end
function t._animateHit(p1, p2) --[[ _animateHit | Line: 704 | Upvalues: v21 (copy), v18 (copy), v19 (copy), SFX (copy), v4 (copy), TweenService (copy) ]]
	if p2 then
		if v21.PlayerData.Settings.States.VisualEffects.Value then
			v18.CreateParticleAtPosition({
				ParticleName = "TameParticles",
				Duration = 5,
				Position = p2.Position
			})
		end
		v19.Shake("Bump")
		SFX.Pop:Play()
	end
	if not v4.IsMobileInputType() then
		return
	end
	local v1 = game.ReplicatedStorage.Storage.Assets.LassoDisplay.LassoTargetPart:Clone()
	v1.Position = p1.MousePart.Position
	v1.Size = p1.MousePart.Size
	v1.Parent = workspace
	local v5 = Color3.new(255/255, 255/255, 255/255):Lerp(Color3.new(0/255, 255/255, 0/255), if p2 then 1 else 0)
	v1.LassoSurfaceGui.Frame.UIStroke.Color = v5
	v1.LassoSurfaceGui.Frame.Crosshair1.BackgroundColor3 = v5
	v1.LassoSurfaceGui.Frame.Crosshair2.BackgroundColor3 = v5
	v1.LassoSurfaceGui.Frame.Crosshair3.BackgroundColor3 = v5
	v1.LassoSurfaceGui.Frame.Crosshair4.BackgroundColor3 = v5
	local v6 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
	TweenService:Create(v1, v6, {
		Transparency = 1,
		Size = v1.Size / 2
	}):Play()
	TweenService:Create(v1.LassoSurfaceGui.Frame.UIStroke, v6, {
		Transparency = 1,
		Color = Color3.new(0/255, 0/255, 0/255)
	}):Play()
	TweenService:Create(v1.LassoSurfaceGui.Frame, v6, {
		Rotation = -45
	}):Play()
	for i = 1, 4 do
		TweenService:Create(v1.LassoSurfaceGui.Frame:FindFirstChild("Crosshair" .. i), v6, {
			BackgroundTransparency = 1
		}):Play()
	end
	game.Debris:AddItem(v1, 1)
end
function t._animateMiss(p1) --[[ _animateMiss | Line: 760 | Upvalues: TweenService (copy), v21 (copy), v18 (copy) ]]
	local v1 = game.ReplicatedStorage.Storage.Assets.LassoDisplay.LassoMissPart:Clone()
	v1.Position = p1.MousePart.Position
	v1.Size = p1.MousePart.Size
	v1.Parent = workspace
	local v2 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
	TweenService:Create(v1, v2, {
		Transparency = 1,
		Size = v1.Size / 2
	}):Play()
	TweenService:Create(v1.LassoSurfaceGui.Frame.UIStroke, v2, {
		Transparency = 1,
		Color = Color3.new(0/255, 0/255, 0/255)
	}):Play()
	TweenService:Create(v1.LassoSurfaceGui.Frame.StrikeThrough, v2, {
		BackgroundTransparency = 1,
		Rotation = -45,
		BackgroundColor3 = Color3.new(0/255, 0/255, 0/255)
	}):Play()
	if v21.PlayerData.Settings.States.VisualEffects.Value then
		v18.CreateParticleAtPosition({
			ParticleName = "LassoMiss",
			Duration = 5,
			Position = v1.Position
		})
	end
	game.Debris:AddItem(v1, 1)
end
function t._checkTarget(p1, p2) --[[ _checkTarget | Line: 792 | Upvalues: MobFolder (copy), v10 (copy) ]]
	local v1 = false
	local v2 = (1 / 0)
	local v3 = nil
	for v4, v5 in MobFolder:GetChildren() do
		if not v1 then
			local v6 = v10.getMobFromModel(v5)
			if v6 then
				local Magnitude = (v6.Model.Position - v6.Model.Size * Vector3.new(0, 0.5, 0) - p2).Magnitude
				local v7 = v5:HasTag("Boss")
				local v8 = v5:GetAttribute("IsGlobalBoss")
				local v9 = p1.LassoHitRange / 2
				if v7 then
					v9 = if v8 then v9 * 2.5 else v9 * 1.5
				end
				if Magnitude <= v9 and Magnitude < v2 then
					if v7 then
						v1 = true
						v2 = Magnitude
						v3 = v6
						continue
					end
					v2 = Magnitude
					v3 = v6
				end
			end
		end
	end
	return v3
end
function t.OnInput(p1, p2) --[[ OnInput | Line: 833 | Upvalues: v24 (ref), v21 (copy), v25 (ref), v11 (copy), v4 (copy) ]]
	if p2 and (p2.UserInputType ~= Enum.UserInputType.MouseButton1 and p2.KeyCode ~= Enum.KeyCode.ButtonX) then
		return
	end
	if tick() < p1.NextUse then
		if not (tick() - v24 > 1) then
			return
		end
		v24 = tick()
		p1.debounceMeter:earlyFlash()
	elseif p1:_isOnHorse() then
		p1:_triggerInterfaceHandler("Activated")
		local v1 = p1.Data.Cooldown or 2
		p1.NextUse = tick() + v1
		p1.debounceMeter:startTimer(v1)
		if p1.throwTrack then
			p1.throwTrack:Play()
		end
		game.SoundService.Effects.Whip:Play()
		local v2 = p1:_checkTarget(p1.MousePart.Position)
		if _G.InTutorial then
			local _ = tick() - (p1._lastTutorialHit or 0) > 15
		end
		if v2 then
			task.spawn(function() --[[ Line: 882 | Upvalues: p1 (copy), v2 (copy) ]]
				p1:_hit(v2, p1.MousePart.Position)
			end)
			p1._lastTutorialHit = tick()
			return
		end
		if v4.IsMobileInputType() then
			p1:_animateHit()
		else
			p1:_miss()
			p1:_animateMiss()
		end
	else
		if not (v21:GetStatValue("Tames").Value <= 0 and tick() - v25 > 2) then
			return
		end
		v25 = tick()
		v11.Notify({
			Message = "You must be riding a horse to use a lasso!"
		})
	end
end
function t._isOnHorse(p1) --[[ _isOnHorse | Line: 897 ]]
	local Character = game.Players.LocalPlayer.Character
	if not Character then
		return false
	end
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	if not Humanoid then
		return false
	end
	local SeatPart = Humanoid.SeatPart
	if SeatPart and SeatPart:IsDescendantOf(Character.Animals) then
		return true
	else
		return false
	end
end
function t._isRequiredLasso(p1, p2) --[[ _isRequiredLasso | Line: 915 | Upvalues: v15 (copy) ]]
	if p2.Model:HasTag("Boss") then
		return true
	else
		return v15.IsRequiredLasso(p2.Data.Name, p1.Data.Name)
	end
end
function t._checkCapacity(p1, p2) --[[ _checkCapacity | Line: 926 | Upvalues: v21 (copy) ]]
	if _G.InTutorial then
		return true
	end
	if p2.Model:HasTag("Boss") then
		return true
	end
	if p2.Model.Name == "Fairy" then
		return true
	end
	local v1 = p2.Model:GetAttribute("TamingId")
	if v1 == nil or v1 == v21.Player.UserId then
		return v21:CanGiveItem("Animals")
	else
		return true
	end
end
function t._checkQuestRequirement(p1, p2) --[[ _checkQuestRequirement | Line: 941 | Upvalues: v21 (copy) ]]
	if p2.Model:HasTag("Boss") then
		return true
	end
	if v21:HasUnlockedSpecies(p2.MobType) then
		return true
	end
end
function t._triggerInterfaceHandler(p1, p2) --[[ _triggerInterfaceHandler | Line: 952 ]]
	if not p1.ToolInterfaceHandlers then
		warn((("No tool interface handlers found for %*"):format(p1.Object.Name)))
		return
	end
	local Lasso = p1.ToolInterfaceHandlers.Lasso
	local v1 = p1.ToolInterfaceHandlers.Lasso and Lasso[p2] or nil
	if not v1 then
		warn((("No interface handler found for %* on %*"):format(p2, p1.Object.Name)))
		return
	end
	for v2, v3 in v1 do
		v3(Lasso, p1)
	end
end
function t.Equip(p1) --[[ Equip | Line: 974 | Upvalues: v12 (copy), v21 (copy), v2 (copy), v3 (copy), v11 (copy) ]]
	p1.Equipped = true
	p1.LastLassoable = nil
	p1:_setControls()
	local Character = game.Players.LocalPlayer.Character
	assert(Character, "Running equip code without character")
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	assert(Humanoid, "Running equip code on character without humanoid")
	p1.Character = Character
	if p1:_isOnHorse() then
		if v12.GetSetting(v21, "VisualEffects") then
			p1:_triggerInterfaceHandler("Equipped")
			v2.setModifier("Lassoing", true)
			game.SoundService.Effects.Whip:Play()
			v3.SetGameElements({
				Lassoing = true,
				Currency = false,
				PlayerLeaderboard = false,
				TopBar = false,
				TopBarAction = false,
				EquipmentShop = false,
				Shop = false,
				Stables = false,
				Inventory = false,
				Event = false,
				PremiumShop = false,
				Menu = false,
				Build = false
			}, true)
		end
		p1:_startMinigame()
	else
		v11.Notify({
			Message = "You must be riding a horse to use a lasso!",
			Type = "LassoEquipped"
		})
	end
	p1.Maid._checkSeatedTask = Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function() --[[ Line: 1024 | Upvalues: p1 (copy) ]]
		if p1:_isOnHorse() then
			p1:_startMinigame()
		else
			p1:_endMinigame()
		end
	end)
	p1.RopeConstraint.Attachment0 = Character.LeftHand:FindFirstChildOfClass("Attachment")
	p1.RopeConstraint.Attachment1 = Character.RightHand:FindFirstChildOfClass("Attachment")
	p1.RopeConstraint.Enabled = true
	v21._lastLassoColor = p1.RopeConstraint.Color
end
function t.Unequip(p1) --[[ Unequip | Line: 1039 | Upvalues: v12 (copy), v21 (copy), v2 (copy), v3 (copy) ]]
	p1.Equipped = false
	if v12.GetSetting(v21, "VisualEffects") then
		if v2.getModifierEnabled("Lassoing") then
			v2.setModifier("Lassoing", false)
		end
		v3.SetGameElements({
			Lassoing = false,
			Currency = true,
			PlayerLeaderboard = true,
			TopBar = true,
			TopBarAction = true,
			EquipmentShop = true,
			Shop = true,
			Stables = true,
			Inventory = true,
			Event = true,
			PremiumShop = true,
			Menu = true,
			Build = true
		}, true)
		p1:_triggerInterfaceHandler("Unequipped")
	end
	if p1.RangeFinder then
		p1.RangeFinder:Destroy()
		p1.RangeFinder = nil
	end
	p1:_setControls()
	p1.Maid._checkSeatedTask = nil
	p1:_endMinigame()
	p1.RopeConstraint.Enabled = false
end
function t.Destroy(p1) --[[ Destroy | Line: 1084 ]]
	if p1.Equipped and p1.Unequip then
		p1:Unequip()
	end
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.GetTarget() --[[ GetTarget | Line: 1094 | Upvalues: v26 (ref), v10 (copy) ]]
	if v26 then
		return v10.getMobFromModel(v26.Model)
	end
end
return t