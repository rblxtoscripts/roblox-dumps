-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("ResourceBreakEffect")
local v4 = Sonar("NotificationsClient")
local v5 = Sonar("GuiManager")
local v6 = Sonar("Constants")
local v7 = Sonar("spr")
local v8 = Sonar("Animal")
local v9 = Sonar("PlayerWrapper").GetClient()
local v10 = Sonar("FormatString")
local v11 = Sonar("InputTypeDetector")
local v12 = Sonar("CharacterControls")
local v13 = Sonar("Signal")
local ResourceData = v6.ResourceData
local LocalPlayer = game.Players.LocalPlayer
local v14 = Sonar("WorldspaceGuiUtils")
local v15 = Sonar("Effects")
local v16 = Sonar("ItemDataService")
local v17 = Sonar("Octree")
local v18 = Sonar("EventUtils")
local v19 = Sonar("TutorialService")
local v20 = Sonar("DamageIndicator")
local v21 = Sonar("SearchMinigame")
local t = {}
t.__index = t
local v22 = v17.new("Jump", 4, 512)
local v23 = nil
local v24 = nil
local v25 = nil
local t2 = {}
local v26 = tick()
local function getGradientColor(p1) --[[ getGradientColor | Line: 43 ]]
	return game.ReplicatedStorage.Storage.Assets.ResourceGradients[if p1 < 0.33 then "Low" elseif p1 < 0.66 then "Medium" else "High"].Color
end
local function sanitizeModel(p1) --[[ sanitizeModel | Line: 55 ]]
	for k, v in pairs(p1:GetChildren()) do
		if v:IsA("BasePart") then
			v.CanCollide = v == p1:FindFirstChild("Hitbox")
			v.CanTouch = false
			v.CanQuery = if v.Name == "Hitbox" then true else false
			v.CastShadow = false
			v.Anchored = true
			v.CollisionGroup = "Resource"
			game:GetService("CollectionService"):AddTag(v, "CameraIgnore")
		end
	end
end
function t.new(p1, p2) --[[ new | Line: 69 | Upvalues: t (copy), v2 (copy), v13 (copy), t2 (copy) ]]
	local v1 = if p2 then p2 else {}
	local v3 = setmetatable(v1, t)
	v3.Type = v3.Type or p1.Name
	v3.DisplayName = v1.DisplayName or v3.Type
	v3.Maid = v2.new()
	v3.Root = p1
	v3.Untargetted = v13.new()
	v3.Hovered = v13.new()
	v3.TargettedSignal = v13.new()
	v3.MinigameMaid = v2.new()
	v3.Maid:GiveTask(v3.MinigameMaid)
	v3.DivideBy = 2
	v3:_spawn()
	t2[v3] = true
	return v3
end
function t._spawn(p1) --[[ _spawn | Line: 95 | Upvalues: ResourceData (copy), sanitizeModel (copy), v13 (copy), v14 (copy), v24 (ref), v6 (copy), v11 (copy), v7 (copy), v10 (copy), v3 (copy), v8 (copy), v19 (copy), v9 (copy), v5 (copy), v4 (copy), v26 (ref), v15 (copy), v22 (copy) ]]
	local v1 = ResourceData[p1.Type]
	local v2 = p1.MaxHealth or v1.Value or (1 / 0)
	p1.Drops = v1.Drops
	p1.ItemDisplayIndex = 0
	p1.Data = v1
	p1.PrimaryPart = p1.Root.PrimaryPart or p1.Root:WaitForChild("Base")
	if p1.IsLocal then
		if not p1.DoNotSanitiseModel then
			sanitizeModel(p1.Root)
		end
		p1.Data = ResourceData[p1.Type]
		p1.Value = v2
		p1.Root:SetAttribute("Value", p1.Value)
		p1.Maid:GiveTask(p1.Root:GetAttributeChangedSignal("Value"):Connect(function() --[[ Line: 116 | Upvalues: p1 (copy) ]]
			if not ((p1.Root:GetAttribute("Value") or 0) <= 0) then
				return
			end
			if p1.Harvested == true then
				return
			end
			p1.Harvested = true
			p1.OnHarvested(p1.PrimaryPart)
			p1.Root:Destroy()
			p1:Destroy()
		end))
	end
	local v42 = game.ReplicatedStorage.Storage.Assets.DefaultResourceNodeGui:Clone()
	v42.Parent = p1.Root
	p1.Gui = v42
	p1.DisplayChangedSignal = v13.new()
	p1.Maid:GiveTask(p1.DisplayChangedSignal)
	p1.Maid:GiveTask(v14.AddWorldspaceGui(v42, {
		Check = function() --[[ Check | Line: 138 | Upvalues: v24 (ref), p1 (copy) ]]
			return if v24 == p1 then true else p1.Targetted or p1.Hovering
		end,
		Changed = p1.DisplayChangedSignal
	}))
	p1.Maid:GiveTask(p1.Gui)
	p1.Hitbox = p1.Root:FindFirstChild("Hitbox")
	if p1.Hitbox then
		if not p1.Hitbox:GetAttribute("OriginalSize") then
			p1.Hitbox:SetAttribute("OriginalSize", p1.Hitbox.Size)
		end
		local function setHitboxSize() --[[ setHitboxSize | Line: 150 | Upvalues: p1 (copy) ]]
			if p1.Hitbox:GetAttribute("OriginalSize") then
				p1.Hitbox.Size = p1.Hitbox:GetAttribute("OriginalSize") * (p1:GetHitboxSizeScale() or 1)
			end
		end
		if p1.IsLocal then
			p1.Maid:GiveTask(v6.GameStateChangedSignal:Connect(setHitboxSize))
		end
		p1.Maid:GiveTask(v11.InputTypeChanged:Connect(setHitboxSize))
		if p1.Hitbox:GetAttribute("OriginalSize") then
			p1.Hitbox.Size = p1.Hitbox:GetAttribute("OriginalSize") * (p1:GetHitboxSizeScale() or 1)
		end
	end
	local t = {}
	local v52 = 0
	local v62 = 0
	for v72, v82 in p1.Root:GetChildren() do
		if v82:IsA("BasePart") then
			local v102 = tonumber(v82.Name)
			if v102 then
				t[v102] = v82
				v52 = math.max(v102, v52)
			end
		end
	end
	local function update(p12, p2) --[[ update | Line: 177 | Upvalues: p1 (copy), v2 (copy), v42 (copy), v7 (ref), v10 (ref), v52 (ref), v62 (ref), t (copy), v3 (ref) ]]
		local v1 = p1.Root:GetAttribute("Value") or 0
		local v32 = math.min(v1 / v2, 1)
		if not v42:FindFirstChild("Bar") then
			return
		end
		v7.target(v42.Bar.Background.Fill, 0.7, 2, {
			Size = UDim2.new(v32, 0, 1, 0)
		})
		v42.Bar.Background.HP.Text = math.round(v1)
		local UIGradient = v42.Bar.Background.Fill.UIGradient
		UIGradient.Color = game.ReplicatedStorage.Storage.Assets.ResourceGradients[if v32 < 0.33 then "Low" elseif v32 < 0.66 then "Medium" else "High"].Color
		v42.HoverLabel.Type.Text = v10.separateWordsInString(p1.DisplayName)
		if p12 then
			local v5 = game.TweenService:Create(v42.Bar.Background.HP.UIScale, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
				Scale = 1.5
			})
			v5.Completed:Connect(function() --[[ Line: 194 | Upvalues: v42 (ref) ]]
				if v42:FindFirstChild("Bar") then
					game.TweenService:Create(v42.Bar.Background.HP.UIScale, TweenInfo.new(0.075, Enum.EasingStyle.Linear), {
						Scale = 1
					}):Play()
				end
			end)
			v5:Play()
		end
		v42.HoverLabel.Visible = p1.Hovering
		local Bar = v42.Bar
		Bar.Visible = p1.Hovering or not p1.Hovering and (if v32 < 1 then true else false)
		local ItemList = v42.ItemList
		ItemList.Position = v42.Bar.Visible and UDim2.new(0.5, 0, -0.25, 0) or UDim2.new(0.5, 0, 0.2, 0)
		p1.DisplayChangedSignal:Fire()
		if p12 then
			if p1.Targetted then
				game.ReplicatedStorage.Storage.SFX.HarvestSelected:Play()
			end
			task.delay(0.025, function() --[[ Line: 215 | Upvalues: v42 (ref) ]]
				if v42:FindFirstChild("Bar") then
					local v1 = v42.Bar.Background.PulseLabel:Clone()
					v1.Name = tick()
					v1.UIScale.Scale = 0.75
					local v2 = game.TweenService:Create(v1.UIScale, TweenInfo.new(0.2), {
						Scale = 2.5
					})
					game.TweenService:Create(v1, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
						ImageTransparency = 1
					}):Play()
					v2.Completed:Connect(function() --[[ Line: 222 | Upvalues: v1 (copy) ]]
						v1:Destroy()
					end)
					v1.Visible = true
					v1.Parent = v42.Bar.Background
					v2:Play()
				end
			end)
		end
		if not (p12 or p2) then
			return
		end
		local v9 = math.ceil((1 - v32) * v52)
		if not (v62 < v9) then
			return
		end
		for i = v62 + 1, v9 do
			if t[i - 1] then
				v3.new(t[i - 1])
			end
		end
		v62 = v9
	end
	p1.Update = update
	p1.Maid:GiveTask(p1.Hovered:Connect(update))
	p1.Maid:GiveTask(p1.TargettedSignal:Connect(update))
	p1.Maid:GiveTask(p1.Untargetted:Connect(update))
	p1.Maid:GiveTask(p1.Root:GetAttributeChangedSignal("Value"):Connect(function() --[[ Line: 248 | Upvalues: update (copy) ]]
		update(true)
	end))
	update(false, true)
	p1.Maid:GiveTask(p1.Untargetted:Connect(function() --[[ Line: 253 | Upvalues: v8 (ref), p1 (copy) ]]
		v8.UntargetHarvestResource(p1)
	end))
	p1.ClickDetector = Instance.new("ClickDetector")
	local function setClickDetector() --[[ setClickDetector | Line: 259 | Upvalues: v19 (ref), v9 (ref), p1 (copy) ]]
		local v1 = v19.GetGameState("HarvestingRange")
		if type(v1) ~= "number" then
			v1 = nil
		end
		local v2 = if v9:IsInAction("BuildMode") then 0 else not p1:CheckGameState() and 0
		if not v2 then
			v2 = v1 or 150
		end
		p1.ClickDetector.MaxActivationDistance = v2
	end
	p1.Maid:GiveTask(v6.GameStateChangedSignal:Connect(setClickDetector))
	p1.Maid:GiveTask(v9:OnActionChanged("BuildMode"):Connect(setClickDetector))
	local v112 = v19.GetGameState("HarvestingRange")
	if type(v112) ~= "number" then
		v112 = nil
	end
	local v12 = if v9:IsInAction("BuildMode") then 0 else not p1:CheckGameState() and 0
	if not v12 then
		v12 = v112 or 150
	end
	p1.ClickDetector.MaxActivationDistance = v12
	p1.ClickDetector.Parent = p1.Root
	p1.ClickDetector.CursorIcon = "rbxassetid://16537656265"
	p1.Maid:GiveTask(p1.ClickDetector)
	p1.Maid:GiveTask(p1.ClickDetector.MouseHoverEnter:Connect(function(p12) --[[ Line: 280 | Upvalues: v11 (ref), v5 (ref), p1 (copy) ]]
		if v11.IsMobileInputType() then
			return
		end
		if not v5.IsHUDOpen() then
			return
		end
		if p1:CheckGameState() then
			p1:Hover()
		end
	end))
	p1.Maid:GiveTask(p1.ClickDetector.MouseHoverLeave:Connect(function(p12) --[[ Line: 289 | Upvalues: v11 (ref), v5 (ref), p1 (copy) ]]
		if v11.IsMobileInputType() then
			return
		end
		if not v5.IsHUDOpen() then
			return
		end
		if p1:CheckGameState() then
			p1:HoverLeave()
		end
	end))
	p1.Maid:GiveTask(p1.ClickDetector.MouseClick:Connect(function() --[[ Line: 298 | Upvalues: v19 (ref), v9 (ref), v4 (ref), v5 (ref), v11 (ref), p1 (copy) ]]
		if not v19.HasCompletedPrimaryTutorial(v9) then
			v4.Notify({
				Message = "You must complete the tutorial to interact with this resource!",
				Preset = "Red"
			})
			return
		end
		if not v5.IsHUDOpen() then
			return
		end
		if not v11.IsGamepadInputType() then
			p1:Interact()
		end
	end))
	if tick() - v26 > 5 then
		v15.emitEffectAt("NodeSpawn", workspace.Terrain, p1.Root:WaitForChild("Base").CFrame)
	end
	v22:Add(p1, p1.Root:GetPivot().p)
	p1.Maid:GiveTask(function() --[[ Line: 319 | Upvalues: v22 (ref), p1 (copy) ]]
		v22:Remove(p1)
	end)
end
function t.GetHitboxSizeScale(p1) --[[ GetHitboxSizeScale | Line: 324 | Upvalues: v19 (copy), v11 (copy) ]]
	local v1 = p1.IsLocal and v19.GetGameState("HarvestingHitboxScale")
	if type(v1) ~= "number" then
		v1 = nil
	end
	local v2
	if v1 then
		v2 = v1
	else
		if v11.IsGamepadInputType() then
			return 2
		end
		v2 = 1
	end
	return v2
end
function t.CheckGameState(p1) --[[ CheckGameState | Line: 333 | Upvalues: v19 (copy) ]]
	local v1 = v19.GetGameState("ResourceHarvesting")
	if v1 == "Local" then
		return p1.IsLocal
	else
		return v1
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 342 | Upvalues: v25 (ref), v4 (copy), t2 (copy) ]]
	p1.DisplayTick = nil
	if p1.Targetted then
		game.ReplicatedStorage.Storage.SFX.NodeCompleted:Play()
		game.ReplicatedStorage.Storage.SFX.HarvestedSound:Play()
	end
	p1._destroyed = true
	if v25 == p1 then
		v25 = nil
	end
	if p1.MinigameAffected and not p1.IsLocal then
		v4.Notify({
			Message = "+1 Extra Harvest!",
			Preset = "Green"
		})
	end
	t2[p1] = nil
	p1:UnTarget()
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.GetAll() --[[ GetAll | Line: 366 | Upvalues: t2 (copy) ]]
	return t2
end
function t.Interact(p1) --[[ Interact | Line: 370 | Upvalues: v9 (copy), LocalPlayer (copy), v24 (ref), v8 (copy), v19 (copy), v4 (copy) ]]
	if v9:IsInAction("Race") then
		return
	end
	if v9.CurrentHorse and v9.CurrentHorse.Flying then
		return
	end
	if p1.Targetted or v24 == p1 then
		if p1.OnTarget and p1.AlreadyRan then
			return
		end
		p1:UnTarget()
		v8.SetHarvestTargets({})
		task.spawn(p1.Update)
		return
	end
	if not p1:CheckGameState() then
		v19.NotifyCannotDoAction("ResourceHarvesting")
		return
	end
	if #LocalPlayer.Character.Animals:GetChildren() == 0 then
		v4.Notify({
			Message = "You need to equip a horse to collect this!",
			Type = "HarvestNoHorses"
		})
		return
	end
	if v24 then
		v24:UnTarget()
	end
	if p1.OnTarget then
		if p1.AlreadyRan then
			return
		end
		p1.OnTarget(p1)
		p1.AlreadyRan = true
		v24 = p1
		return
	end
	p1:Target()
	v8.SetHarvestTargets({ p1 })
	task.spawn(p1.Update)
	if not v9.CurrentHorse then
		return
	end
	v9.CurrentHorse.TargetOverride = p1
end
function t.SetItemDisplay(p1) --[[ SetItemDisplay | Line: 424 | Upvalues: v16 (copy) ]]
	if not p1.Drops then
		return
	end
	p1.ItemDisplayIndex = p1.ItemDisplayIndex + 1
	if p1.ItemDisplayIndex > #p1.Drops then
		p1.ItemDisplayIndex = 1
	end
	local v1 = v16.GetByName(p1.Drops[p1.ItemDisplayIndex].Name)
	p1.Gui.ItemList.Viewport.Image = v1.Image
	p1.Gui.ItemList.Viewport.Viewport.Image = v1.Image
end
function t.LoopDisplay(p1) --[[ LoopDisplay | Line: 437 ]]
	local v1 = tick()
	p1.DisplayTick = v1
	if p1.ItemDisplayIndex <= 0 then
		p1:SetItemDisplay()
	end
	task.spawn(function() --[[ Line: 445 | Upvalues: p1 (copy), v1 (copy) ]]
		while p1.DisplayTick == v1 do
			local v12 = game.TweenService:Create(p1.Gui.ItemList.Bar.Fill, TweenInfo.new(0, Enum.EasingStyle.Linear), {
				Size = UDim2.new(1, 0, 1, 0)
			})
			v12:Play()
			v12.Completed:Wait()
			local v2 = game.TweenService:Create(p1.Gui.ItemList.Bar.Fill, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {
				Size = UDim2.new(0, 0, 1, 0)
			})
			v2:Play()
			v2.Completed:Wait()
			if p1.DisplayTick ~= v1 or not p1.SetItemDisplay then
				continue
			end
			p1:SetItemDisplay()
		end
	end)
end
function t.Hover(p1) --[[ Hover | Line: 461 | Upvalues: v25 (ref), v7 (copy) ]]
	if p1.Hovering then
		return
	end
	p1.Hovering = true
	v25 = p1
	v7.target(p1.Root, 0.8, 3, {
		Scale = if p1.Data.HoverScale then p1.Data.HoverScale else 1.75
	})
	if p1.IsLocal then
		p1.Gui.ItemList.Viewport.Visible = false
		p1.Gui.ItemList.ShadowLabel.Visible = false
		p1.Gui.ItemList.ShadowLabel1.Visible = false
		p1.Gui.ItemList.Bar.Visible = false
	end
	p1.Gui.Bar.Visible = true
	p1.DisplayChangedSignal:Fire()
	p1.Hovered:Fire()
end
function t.HoverLeave(p1) --[[ HoverLeave | Line: 492 | Upvalues: v25 (ref), v7 (copy) ]]
	if not p1.Hovering then
		return
	end
	p1.Hovering = false
	p1.DisplayTick = nil
	if v25 == p1 then
		v25 = nil
	end
	local v1 = if p1.Data.DefaultScale then p1.Data.DefaultScale else 1
	p1.DisplayChangedSignal:Fire()
	v7.target(p1.Root, 1, 2, {
		Scale = v1
	})
	p1.Gui.Controls.Visible = false
	p1.Gui.ItemList.Visible = false
	p1.Hovered:Fire()
end
function t.Damage(p1, p2, p3, p4) --[[ Damage | Line: 516 | Upvalues: v20 (copy) ]]
	if p3 then
		p1.MinigameAffected = true
	end
	if p4 then
		local v6 = math.max(math.ceil((math.min(if type(p2) == "number" then p2 else 1 * p2.AnimalData:GetWithModifiers("HarvestStrength"), p1.Value))), 1)
		local v8 = math.max(p1.Value - v6, 0)
		p1.Value = v8
		p1.Root:SetAttribute("Value", v8)
		v20.new(p1.Root, {
			Amount = v6
		})
	else
		v20.new(p1.Root, {
			Amount = p1.Root.RemoteEvent:InvokeServer(if type(p2) == "number" and p2 then p2 else p2.Model or p2, p3)
		})
	end
end
function t.Target(p1) --[[ Target | Line: 551 | Upvalues: v24 (ref), v7 (copy), v21 (copy) ]]
	v24 = p1
	game.ReplicatedStorage.Storage.SFX.Pop:Play()
	p1.Targetted = true
	if not p1.NodeTargetPart then
		p1.NodeTargetPart = game.ReplicatedStorage.Storage.Assets.NodeTargetPart:Clone()
		p1.OriginalSize = p1.NodeTargetPart.Size
		p1.NodeTargetPart.Size = Vector3.new(0, 0, 0)
		p1.NodeTargetPart.Parent = workspace.CurrentCamera
	end
	v7.target(p1.NodeTargetPart, 0.8, 3, {
		Size = p1.OriginalSize * 1.3
	})
	p1.NodeTargetPart.Position = p1.Root:GetPivot().p
	if p1.MinigameRunning then
		return
	end
	p1.MinigameRunning = true
	p1.Minigame = v21.new()
	p1.MinigameMaid:GiveTask(p1.Minigame)
	p1.MinigameMaid:GiveTask(p1.Minigame.TargetClicked:Connect(function() --[[ Line: 573 | Upvalues: p1 (copy) ]]
		p1:Damage(5, true, p1.IsLocal)
	end))
end
function t.GetDivide(p1) --[[ GetDivide | Line: 580 ]]
	return p1.DivideBy
end
function t.Harvest(p1, p2) --[[ Harvest | Line: 584 ]]
	if p1.IsLocal then
		p1:Damage(p2, false, true)
	else
		p1:Damage(p2)
	end
end
function t.UnTarget(p1, p2) --[[ UnTarget | Line: 594 | Upvalues: v24 (ref), v7 (copy) ]]
	if v24 == p1 then
		v24 = nil
	end
	if p1.OnUnTarget then
		p1.OnUnTarget(p1)
		p1.AlreadyRan = false
	end
	p1.MinigameRunning = false
	p1.MinigameMaid:DoCleaning()
	if not p1.Targetted then
		return
	end
	p1.Targetted = false
	if not p2 then
		p1.Untargetted:Fire()
	end
	p1.DisplayChangedSignal:Fire()
	game.ReplicatedStorage.Storage.SFX.HarvestTarget:Play()
	if not p1.NodeTargetPart then
		return
	end
	v7.target(p1.NodeTargetPart, 0.4, 3, {
		Size = Vector3.new(0, 0, 0)
	})
	v7.completed(p1.NodeTargetPart, function() --[[ Line: 621 | Upvalues: p1 (copy) ]]
		if p1.Targetted then
			return
		end
		if not p1.NodeTargetPart then
			return
		end
		p1.NodeTargetPart:Destroy()
		p1.NodeTargetPart = nil
	end)
end
function t.GetDistanceFrom(p1, p2) --[[ GetDistanceFrom | Line: 631 | Upvalues: v9 (copy) ]]
	local v1 = v9:IsInRange(p1.Root:GetPivot().p, p2)
	return v1 and true, v1
end
function t.CancelCurrentTarget() --[[ CancelCurrentTarget | Line: 636 | Upvalues: v24 (ref), v8 (copy), v25 (ref) ]]
	if v24 then
		v24:UnTarget()
		if v24 and v24.Update then
			task.spawn(v24.Update)
		end
	end
	v8.SetHarvestTargets({})
	for v1, v2 in v8.GetAllAnimals() do
		v2.TargetOverride = nil
	end
	if not v25 then
		return
	end
	v25:HoverLeave()
end
function t.WithinBounds(p1, p2) --[[ WithinBounds | Line: 659 ]]
	if p1:CheckGameState() then
		return true
	end
end
function t.Init(p1) --[[ Init | Line: 664 | Upvalues: v11 (copy), v23 (ref), v18 (copy), v9 (copy), v22 (copy), v12 (copy), v25 (ref), v5 (copy), v24 (ref), v26 (ref), v1 (copy), t (copy) ]]
	local v13 = nil
	if v11.IsMobileInputType() then
		game:GetService("RunService").Heartbeat:Connect(function(p1) --[[ Line: 668 | Upvalues: v13 (ref), v23 (ref) ]]
			if not v13 then
				return
			end
			local v1 = 50
			local v2 = nil
			for k, v in pairs(v13) do
				if v.GetDistanceFrom then
					local v3, v4 = v:GetDistanceFrom(v1)
					if v3 then
						v1 = v4
						v2 = v
					end
				end
			end
			if v2 then
				if not v2.Hovering and (v23 and v23.HoverLeave) then
					v23:HoverLeave()
				end
			elseif v23 and v23.HoverLeave then
				v23:HoverLeave()
			end
			if v2 and (v2.WithinBounds and v2:WithinBounds(v1)) then
				v2:Hover()
			elseif v2 and v2.HoverLeave then
				v2:HoverLeave()
			end
			v23 = v2
		end)
		v18.spawnLoopWithoutYielding(function() --[[ Line: 707 | Upvalues: v9 (ref), v13 (ref), v22 (ref) ]]
			if v9.PrimaryPart then
				v13 = v22:RadiusSearch(v9.PrimaryPart.Position, 150)
			end
		end, 0.5)
	end
	v12:AddControls("GamepadHarvest", { Enum.KeyCode.ButtonX }, {
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 716 | Upvalues: v25 (ref) ]]
			v25:Interact()
		end
	}, function() --[[ Line: 719 | Upvalues: v5 (ref), v25 (ref) ]]
		return v5.IsHUDOpen() and v25
	end)
	v9.EquippedToolChangedSignal:Connect(function() --[[ Line: 723 | Upvalues: v9 (ref), v11 (ref), v25 (ref), v24 (ref) ]]
		if not v9.EquippedTool then
			return
		end
		if not v11.IsGamepadInputType() then
			return
		end
		if v25 and v24.Targetted then
			v25:UnTarget()
		end
		if not v25 then
			return
		end
		v25:HoverLeave()
	end)
	v26 = tick()
	v1.new("Resource", t):Init()
end
t:Init()
return t