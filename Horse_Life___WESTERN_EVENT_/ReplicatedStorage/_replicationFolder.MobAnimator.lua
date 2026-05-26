-- https://lua.expert/
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local SFX = ReplicatedStorage.Storage.SFX
local Assets = ReplicatedStorage.Storage:WaitForChild("Assets")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Signal")
local v2 = Sonar("Maid")
local v3 = Sonar("MathUtils")
local v4 = Sonar("Weld")
local v5 = Sonar("PlayerWrapper").GetClient()
local v6 = Sonar("InteractMenu")
local v7 = Sonar("TamingOverhead")
local v8 = Sonar("NotificationsClient")
local v9 = Sonar("PromptClient")
local v10 = Sonar("AnimalDataService")
local v11 = Sonar("IssueResponseClient")
local v12 = Sonar("AnimalRiggerService")
local v13 = Sonar("MutationUtils")
local v14 = Sonar("InputTypeDetector")
local v15 = Sonar("CameraShaker")
local v16 = Sonar("Effects")
local v17 = Sonar("MessagesClient")
local v18 = Sonar("Table")
local v19 = Sonar("MobProjectile")
local v20 = Sonar("MobMeteor")
local v21 = Sonar("Mob")
local v22 = Sonar("spr")
local v23 = Sonar("ParticleUtils")
local v24 = Sonar("Constants")
local MobData = v24.MobData
local TouchEnabled = UserInputService.TouchEnabled
local t = {}
t.__index = t
local MobFolder = workspace:FindFirstChild("MobFolder") or Instance.new("Folder", workspace)
MobFolder.Name = "MobFolder"
local CosmeticMobsFolder = workspace:FindFirstChild("CosmeticMobsFolder") or Instance.new("Folder", workspace)
CosmeticMobsFolder.Name = "CosmeticMobsFolder"
local AnimationTrackCache = Instance.new("Folder", ReplicatedStorage)
AnimationTrackCache.Name = "AnimationTrackCache"
local MobRenderBin = Instance.new("Folder", game.ReplicatedStorage)
MobRenderBin.Name = "MobRenderBin"
local CurrentCamera = workspace.CurrentCamera
local v25 = v15.new(Enum.RenderPriority.Camera.Value + 1, "MobShaker", function(p1) --[[ Line: 54 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v25:Start()
v25._permanent = true
local SFX_2 = ReplicatedStorage.Storage.SFX
local t2 = {}
local t3 = {}
local v26 = nil
local v27 = tick()
local t4 = {}
local function setActiveMobs() --[[ setActiveMobs | Line: 71 | Upvalues: t3 (copy) ]]
	for v1, v2 in t3 do
		v2:SetActive()
	end
end
function t._updateNearbyState(p1) --[[ _updateNearbyState | Line: 77 | Upvalues: CurrentCamera (copy) ]]
	local Magnitude = (CurrentCamera.CFrame.p - p1.Model.Position).Magnitude
	p1._lastDistance = Magnitude
	p1.IsNearby = Magnitude < math.max(p1.BoundingBoxSize.Magnitude * 2, 400)
end
function t._updateParent(p1) --[[ _updateParent | Line: 83 | Upvalues: CosmeticMobsFolder (copy), TouchEnabled (copy), MobRenderBin (copy), CurrentCamera (copy) ]]
	local v1 = p1.CosmeticModel.Parent
	local v2 = CosmeticMobsFolder
	p1._isRendered = true
	if not p1.IsLocal and (if TouchEnabled then 800 else 1200) < p1._lastDistance then
		v2 = MobRenderBin
		p1._isRendered = false
	end
	if p1._isRendered then
		local _, v4 = CurrentCamera:WorldToScreenPoint(p1.Model.Position)
		p1._isRendered = v4
	end
	if not (tick() - (p1._lastReparent or 0) > 1.5) then
		return
	end
	if p1.Active then
		p1:_updateNearbyState()
	end
	if v1 == v2 then
		return
	end
	p1._lastReparent = tick()
	p1.CosmeticModel.Parent = v2
end
function t._getVisualMobData(p1) --[[ _getVisualMobData | Line: 113 ]]
	return p1.YoungData or p1.SpeciesData
end
function t._init(p1) --[[ _init | Line: 117 | Upvalues: v1 (copy), v10 (copy), MobData (copy), v12 (copy), ReplicatedStorage (copy), Sonar (copy), v24 (copy), t4 (copy), CosmeticMobsFolder (copy), v18 (copy), v13 (copy), t2 (copy), v19 (copy), v5 (copy), v26 (ref), SFX_2 (copy), v6 (copy), SFX (copy), v11 (copy), v9 (copy), v8 (copy), v3 (copy), v14 (copy), v7 (copy), v27 (ref), v23 (copy), v16 (copy), t3 (copy) ]]
	p1.Died = v1.new()
	p1.Maid:GiveTask(p1.Died)
	p1.IsFairy = p1.Model:HasTag("Fairy")
	p1.SpeciesData = v10.GetByName(p1.MobType)
	p1.Data = MobData[p1.MobType]
	p1.CanFly = p1.Data.Flier
	p1.SlotValue = p1.Model:WaitForChild("SlotInfo", 2)
	p1.IsYoung = v10.IsFoal(p1.SlotValue)
	local v15, v2 = v12.CreateAnimalModel({
		SlotValue = p1.SlotValue,
		IsFairy = p1.IsFairy
	})
	v15.Name = p1.MobType
	p1.Maid:GiveTask(v2)
	p1.CosmeticModel = v15
	local RootReference = Instance.new("ObjectValue", p1.CosmeticModel)
	RootReference.Name = "RootReference"
	RootReference.Value = p1.Model
	for v32, v4 in p1.CosmeticModel:GetDescendants() do
		if v4:IsA("BasePart") then
			v4.Massless = true
			v4.CanCollide = false
			v4.CanTouch = false
			v4.CanQuery = false
			v4.EnableFluidForces = false
			if v4.Name ~= "RootPart" then
				v4.RootPriority = -127
			end
		end
	end
	p1.IsBoss = p1.Model:HasTag("Boss")
	if p1.IsBoss then
		local v52 = p1.Model:GetAttribute("CustomPresetName")
		if v52 then
			local v62 = ReplicatedStorage.Storage.BossPresets:FindFirstChild(v52)
			if v62 then
				p1.BossPreset = Sonar(v62)
			else
				warn("CustomPresetName \'" .. v52 .. "\' not found in BossPresets, using default tier preset")
			end
		end
		if not p1.BossPreset then
			local v82 = ReplicatedStorage.Storage.BossPresets:FindFirstChild((p1.Model:GetAttribute("BossType") or "") .. "Tier" .. p1.Model:GetAttribute("Tier"))
			if not v82 then
				v82 = ReplicatedStorage.Storage.BossPresets:FindFirstChild("Tier" .. p1.Model:GetAttribute("Tier"))
			end
			p1.BossPreset = Sonar(v82)
		end
		p1.AttackSequences = v24.MobAnimationInfo[p1.MobType].AttackSequences
		p1._attackHitboxCache = {}
		t4[p1.Model] = {}
	end
	local HumanoidRootPart = p1.CosmeticModel:WaitForChild("HumanoidRootPart")
	local Y = HumanoidRootPart.Size.Y
	local v102 = p1.CosmeticModel:GetScale()
	local v112 = CFrame.new(0, 0, 0)
	if not p1.IsFairy then
		local v122 = p1.IsBoss and p1.BossPreset.Scale or not p1.IsFairy and v10.GetScale(p1.SlotValue)
		local v132 = if p1.IsBoss then 0 else v122 - v102
		p1.CosmeticModel:ScaleTo(v122)
		v112 = CFrame.new(0, v132 * Y / 2, 0)
	end
	local _, v152 = p1.CosmeticModel:GetBoundingBox()
	p1.BoundingBoxSize = v152
	p1.CosmeticModel:PivotTo(p1.Model.CFrame)
	local Motor = p1.Model:WaitForChild("Motor")
	Motor.Part1 = HumanoidRootPart
	Motor.C0 = Motor.C0 * v112
	p1.Motor = Motor
	p1.ProjectileRNG = Random.new(p1.Model:GetAttribute("ID"))
	p1.CosmeticModel.PrimaryPart.CanCollide = false
	p1.PrimaryPart = p1.CosmeticModel.PrimaryPart
	p1.Model.CanCollide = true
	p1.Model.CanTouch = false
	p1.Model.CanQuery = false
	p1.CosmeticModel.PrimaryPart.BodyVelocity:Destroy()
	p1.CosmeticModel.PrimaryPart.BodyGyro:Destroy()
	p1.CosmeticModel.Parent = CosmeticMobsFolder
	p1._lastDistance = 0
	p1.AnimationController = p1.CosmeticModel:FindFirstChild("AnimationController") or Instance.new("AnimationController", p1.CosmeticModel)
	p1.Animator = p1.AnimationController:FindFirstChild("Animator") or Instance.new("Animator", p1.AnimationController)
	p1.Animations = {}
	local v192 = v24.MobAnimationInfo[if p1.IsYoung then "Foal" else p1.Model.Name]
	p1.Animations = v18.Merge(v192.Animations, v192.AttackSequences)
	local v20, v21 = v13.GetMutationOfType(p1.SlotValue, "Wings")
	p1.WingData = v20
	p1.WingValue = v21
	p1.WingModel = if v20 then p1.CosmeticModel:WaitForChild(v20.Name) else v20
	p1.WingAnimationController = if v20 then p1.WingModel:WaitForChild("AnimationController") else v20
	p1.WingAnimationTracks = {}
	task.defer(function() --[[ Line: 241 | Upvalues: v20 (copy), p1 (copy), v24 (ref), t2 (ref) ]]
		if v20 then
			local t = {
				Idle = Enum.AnimationPriority.Idle,
				FlyForward = Enum.AnimationPriority.Action
			}
			for v1, v2 in v20.Animations do
				if v1 == "Idle" and p1.SlotValue.UpliftedWings.Value then
					v2 = v20.Animations.UPLIFTED_WING_IDLE_ANIMATION or v24.UPLIFTED_WING_IDLE_ANIMATION
				end
				local Animation = Instance.new("Animation")
				Animation.Name = v1
				Animation.AnimationId = v2
				p1.Maid:GiveTask(Animation)
				local v4 = p1.WingAnimationController:LoadAnimation(Animation)
				p1.WingAnimationTracks[v1] = v4
				if t[v1] then
					v4.Priority = t[v1] or Enum.AnimationPriority.Idle
				end
				task.wait()
			end
			task.wait()
			p1.WingAnimationTracks.Idle:Play()
		end
		local v6
		if p1.IsFairy then
			local FlyIdle = Instance.new("Animation")
			FlyIdle.Name = "FlyIdle"
			FlyIdle.AnimationId = "rbxassetid://" .. p1.Animations.FlyIdle.ID
			p1.Maid:GiveTask(FlyIdle)
			p1.WingAnimationTracks.FlyIdle = p1.AnimationController:LoadAnimation(FlyIdle)
			task.wait()
			p1.WingAnimationTracks.FlyIdle:Play()
		end
		v6 = function() --[[ setAwake | Line: 280 | Upvalues: p1 (ref), t2 (ref) ]]
			pcall(function() --[[ Line: 281 | Upvalues: p1 (ref), t2 (ref) ]]
				local v1 = not p1.Model.Anchored
				p1.IsAwake = v1
				if v1 then
					t2[p1] = true
					p1.AnimationController.Parent = p1.CosmeticModel
					if p1.WingAnimationController then
						p1.WingAnimationController.Parent = p1.WingModel
					end
				else
					t2[p1] = nil
					local v2 = pairs
					for v4, v5 in v2(p1.ActiveTracks or {}) do
						v5:Stop()
					end
					local v6 = pairs
					for v8, v9 in v6(p1.WingActiveTracks or {}) do
						v9:Stop()
					end
					if not p1.AnimationController then
						return
					end
					for v10, v11 in p1.AnimationController:GetPlayingAnimationTracks() do
						v11:Stop()
					end
					p1.AnimationController.Parent = nil
					if not p1.WingAnimationController then
						return
					end
					p1.WingAnimationController.Parent = nil
				end
			end)
		end
		pcall(function() --[[ Line: 281 | Upvalues: p1 (ref), t2 (ref) ]]
			local v1 = not p1.Model.Anchored
			p1.IsAwake = v1
			if v1 then
				t2[p1] = true
				p1.AnimationController.Parent = p1.CosmeticModel
				if p1.WingAnimationController then
					p1.WingAnimationController.Parent = p1.WingModel
				end
			else
				t2[p1] = nil
				local v2 = pairs
				for v4, v5 in v2(p1.ActiveTracks or {}) do
					v5:Stop()
				end
				local v6 = pairs
				for v8, v9 in v6(p1.WingActiveTracks or {}) do
					v9:Stop()
				end
				if not p1.AnimationController then
					return
				end
				for v10, v11 in p1.AnimationController:GetPlayingAnimationTracks() do
					v11:Stop()
				end
				p1.AnimationController.Parent = nil
				if not p1.WingAnimationController then
					return
				end
				p1.WingAnimationController.Parent = nil
			end
		end)
		p1.Maid:GiveTask(p1.Model:GetPropertyChangedSignal("Anchored"):Connect(v6))
	end)
	p1.IdleAnimations = {}
	for v242, v25 in p1.Animations do
		if v25.Idle then
			table.insert(p1.IdleAnimations, v242)
		end
	end
	local Eyelid = p1.CosmeticModel:FindFirstChild("Eyelid")
	if Eyelid then
		Eyelid:Destroy()
	end
	p1.ActiveTracks = {}
	p1.WingActiveTracks = {}
	p1:_updateNearbyState()
	p1.Maid:GiveTask(p1.Model:GetAttributeChangedSignal("Warning"):Connect(function() --[[ Line: 335 | Upvalues: p1 (copy) ]]
		if p1._destroyed then
			return
		end
		if not p1.IsNearby then
			return
		end
		local v1 = p1:GetState("Warning")
		if not v1 then
			return
		end
		p1:_visualizeAttack(v1)
	end))
	p1.Maid:GiveTask(p1.Model:GetAttributeChangedSignal("Attacking"):Connect(function() --[[ Line: 348 | Upvalues: p1 (copy) ]]
		p1:_updateNearbyState()
		local v1 = p1:GetState("Attacking")
		if not v1 then
			task.delay(0.1, function() --[[ Line: 367 | Upvalues: p1 (ref) ]]
				local _ = p1._destroyed
			end)
			return
		end
		if p1._attacking then
			return
		end
		if not p1._destroyed then
			p1._attacking = true
			p1:PlayTrack(v1)
			task.delay(p1.AttackSequences[v1].AttackDuration, function() --[[ Line: 363 | Upvalues: p1 (ref) ]]
				p1._attacking = false
			end)
		end
	end))
	p1.Maid:GiveTask(p1.Model:GetAttributeChangedSignal("Bucking"):Connect(function() --[[ Line: 376 | Upvalues: p1 (copy) ]]
		p1:_tryFling()
	end))
	p1.Maid:GiveTask(v19.LocalHitSignal:Connect(function(p12) --[[ Line: 380 | Upvalues: p1 (copy), v5 (ref) ]]
		if p12 ~= p1 then
			return
		end
		if v5:IsInAction("BossFight") or v5:IsInAction("GlobalBossFight") then
			p1:_tryFling()
		end
	end))
	p1.Maid:GiveTask(p1.Model:GetAttributeChangedSignal("TamingContributors"):Connect(function() --[[ Line: 390 | Upvalues: p1 (copy) ]]
		p1:setCurrentTamingTarget()
	end))
	p1.Maid:GiveTask(p1.Model:GetAttributeChangedSignal("TamingId"):Connect(function() --[[ Line: 394 | Upvalues: p1 (copy) ]]
		p1:setCurrentTamingTarget()
	end))
	p1.Maid:GiveTask(function() --[[ Line: 399 | Upvalues: v26 (ref), p1 (copy) ]]
		if v26 ~= p1.Model then
			return
		end
		v26 = nil
	end)
	p1.Maid:GiveTask(p1.Model.Destroying:Connect(function() --[[ Line: 406 | Upvalues: p1 (copy) ]]
		if not p1.Destroy then
			return
		end
		p1:Destroy()
	end))
	p1.IdleSounds = {}
	for v272, v28 in { "Snort1", "Neigh1", "Neigh2", "Neigh3" } do
		local v262
		local v29 = p1.SpeciesData.CallSounds and p1.SpeciesData.CallSounds[v28]
		if v29 then
			local Sound = Instance.new("Sound")
			Sound.SoundId = v29.Id
			Sound.PlaybackSpeed = 1
			Sound.Volume = 0.5
			Sound.RollOffMaxDistance = 300
			Sound.RollOffMinDistance = 10
			Sound.RollOffMode = Enum.RollOffMode.InverseTapered
			Sound:AddTag("EffectsSound")
			v262 = Sound
		else
			v262 = SFX_2[v28]:Clone()
		end
		if v24.SoundModifiers[p1.MobType] then
			if game.SoundService.Effects:FindFirstChild(p1.MobType) then
				p1.SoundGroup = game.SoundService.Effects:FindFirstChild(p1.MobType)
			else
				p1.SoundGroup = Instance.new("SoundGroup")
				p1.SoundGroup.Name = p1.MobType
				p1.SoundGroup.Volume = 1
				for v31, v32 in v24.SoundModifiers[p1.MobType] do
					local v33 = Instance.new(v31)
					for v34, v35 in v32 do
						v33[v34] = v35
						v33.Parent = p1.SoundGroup
					end
				end
				p1.SoundGroup.Parent = game.SoundService.Effects
			end
		else
			warn("No sound data found for ", p1.MobType)
		end
		v262.SoundGroup = p1.SoundGroup
		table.insert(p1.IdleSounds, v262)
		v262.Parent = p1.Model
	end
	p1.Maid:GiveTask(v6.new(p1.CosmeticModel.PrimaryPart:WaitForChild("MiddleBody"):WaitForChild("UpperBody"), {
		ShowHintLabel = true,
		Scale = 0.75,
		Run = function() --[[ Run | Line: 471 | Upvalues: p1 (copy), SFX (ref), v11 (ref), v9 (ref), Sonar (ref), v5 (ref), v8 (ref), ReplicatedStorage (ref), v3 (ref), v26 (ref) ]]
			local v1 = p1.Model:GetAttribute("State")
			if v1 ~= "taming" and v1 ~= "curious" then
				return
			end
			if not p1:_checkCapacity() then
				SFX.Error:Play()
				v11.NotifyIssue("AtAnimalLimit")
				return
			end
			if not p1:_checkQuestRequirement() then
				v9.Prompt({
					Type = "LockedJournal",
					Setup = function(p12) --[[ Setup | Line: 487 | Upvalues: Sonar (ref), p1 (ref) ]]
						if Sonar("ItemDataService").GetByType(p1.MobType, "Animals").Event then
							p12.Content.Description.Text = "To tame this species you must complete the #5 Alces Quests!"
						else
							p12.Content.Description.Text = string.format("To tame this species you must complete the %s Quests!", p1.MobType)
						end
					end,
					Run = function() --[[ Run | Line: 496 | Upvalues: Sonar (ref), p1 (ref) ]]
						if Sonar("ItemDataService").GetByType(p1.MobType, "Animals").Event then
							return true
						end
						Sonar("JournalGui").Open("Horses")
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 506 ]]
						return true
					end
				})
				return
			end
			if not p1:_isRequiredFood() then
				return
			end
			local function doTaming() --[[ doTaming | Line: 518 | Upvalues: p1 (ref), v5 (ref), v8 (ref), ReplicatedStorage (ref), Sonar (ref), SFX (ref), v3 (ref) ]]
				local v1 = p1.Model:GetAttribute("TamingId")
				local v2
				if not v1 or v1 == v5.Player.UserId then
					p1:RunAction("Begin")
					v2 = ReplicatedStorage.Storage.Assets.SpinGameUI:Clone()
					Sonar("SpinGame").new(v2, p1, function() --[[ Line: 534 | Upvalues: p1 (ref), SFX (ref), v3 (ref), ReplicatedStorage (ref) ]]
						local v1 = p1.Model:GetAttribute("TamingHealth")
						local Y = v1.Y
						SFX.QuestIncrement2.PlaybackSpeed = v3.map(math.min(v1.X + v1.Z, Y), 0, Y, 0.85, 1.25)
						SFX.QuestIncrement2:Play()
						local v2 = ReplicatedStorage.Storage.SFX.Feeding:GetChildren()
						v2[math.random(1, #v2)]:Play()
						p1:RunAction("SuccessfulFeed")
					end, function() --[[ Line: 554 | Upvalues: SFX (ref), p1 (ref) ]]
						SFX.Error:Play()
						p1:RunAction("Failure")
					end, function() --[[ Line: 563 | Upvalues: p1 (ref) ]]
						return p1:_isRequiredFood()
					end)
					return
				end
				v8.Notify({
					Message = "You are now assisting this tame!",
					Type = "AssistTame"
				})
				p1:RunAction("Begin")
				v2 = ReplicatedStorage.Storage.Assets.SpinGameUI:Clone()
				Sonar("SpinGame").new(v2, p1, function() --[[ Line: 534 | Upvalues: p1 (ref), SFX (ref), v3 (ref), ReplicatedStorage (ref) ]]
					local v1 = p1.Model:GetAttribute("TamingHealth")
					local Y = v1.Y
					SFX.QuestIncrement2.PlaybackSpeed = v3.map(math.min(v1.X + v1.Z, Y), 0, Y, 0.85, 1.25)
					SFX.QuestIncrement2:Play()
					local v2 = ReplicatedStorage.Storage.SFX.Feeding:GetChildren()
					v2[math.random(1, #v2)]:Play()
					p1:RunAction("SuccessfulFeed")
				end, function() --[[ Line: 554 | Upvalues: SFX (ref), p1 (ref) ]]
					SFX.Error:Play()
					p1:RunAction("Failure")
				end, function() --[[ Line: 563 | Upvalues: p1 (ref) ]]
					return p1:_isRequiredFood()
				end)
			end
			if v26 and (v26:IsDescendantOf(workspace) and v26 ~= p1.Model) then
				v9.Prompt({
					Type = "TameOtherHorse",
					BackgroundNotVisible = true,
					Run = function() --[[ Run | Line: 574 | Upvalues: doTaming (copy) ]]
						doTaming()
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 578 ]]
						return true
					end
				})
			else
				doTaming()
			end
		end,
		Visibility = function() --[[ Visibility | Line: 589 | Upvalues: p1 (copy), v14 (ref), v5 (ref) ]]
			local v1 = p1.Model:GetAttribute("TamingType")
			if v1 and v1 ~= 1 then
				return
			end
			if v14.IsMobileInputType() and v5:IsInAction("FeedTaming") then
				return
			end
			if not v5.EquippedTool then
				return
			end
			if v5.EquippedTool.ToolData.ItemType ~= "Food" then
				return
			end
			return not p1.Model:GetAttribute("Fleeing") and (not p1.Maid.spinGame and not (v5.Humanoid and v5.Humanoid.SeatPart and true or false))
		end,
		GetRange = function() --[[ GetRange | Line: 606 ]]
			return 18
		end,
		HintChanged = p1.Model:GetAttributeChangedSignal("TamingId"),
		Hint = function() --[[ Hint | Line: 610 | Upvalues: p1 (copy), v5 (ref) ]]
			if p1.Model:GetAttribute("TamingId") == nil or p1.Model:GetAttribute("TamingId") == v5.Player.UserId then
				return "Feed"
			else
				return "Help"
			end
		end
	}))
	if not p1.Model:HasTag("Boss") then
		p1.Maid:GiveTask(v7.new(p1.Model))
	end
	p1.CanBlink = true
	p1:SetActive()
	p1:_updateParent()
	if tick() - v27 > 5 and (tick() - p1.InitTime < 5 and p1._isRendered) then
		if p1.Model:HasTag("Boss") and p1.Model:GetAttribute("IsGlobalBoss") then
			if v5.PlayerData.Settings.States.VisualEffects.Value then
				v23.CreateParticleAtPosition({
					ParticleName = "BossSpawn",
					Duration = 5,
					Position = p1.Model.Position
				})
			end
		else
			v16.emitEffectAt(if p1.Model:HasTag("Boss") then "BossSpawn" else "MobSpawn", workspace.Terrain, p1.Model.CFrame)
		end
	end
	p1.CosmeticModel:AddTag("LocalMob")
	p1.Model.Massless = false
	t3[p1.Model] = p1
	if p1.IsFairy then
		return
	end
	p1.CosmeticModel:AddTag(v24.AnimalWithCosmeticsTag)
end
function t.new(p1) --[[ new | Line: 657 | Upvalues: t (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.MobType = p1.Name
	v22.Model = p1
	v22.IsLocal = v22.Model:GetAttribute("Local")
	v22.InitTime = tick()
	v22:_init()
	return v22
end
function t.RunAction(p1, ...) --[[ RunAction | Line: 684 | Upvalues: v21 (copy), v5 (copy) ]]
	if p1.Model:FindFirstChild("TameEvent") then
		p1.Model.TameEvent:FireServer(...)
		return
	end
	local v1 = v21.getMobFromModel(p1.Model)
	if v1 then
		local t = { ... }
		task.spawn(function() --[[ Line: 692 | Upvalues: v1 (copy), v5 (ref), t (copy) ]]
			v1:RunAction(v5.Player, table.unpack(t))
		end)
	end
end
function t._tryFling(p1, p2) --[[ _tryFling | Line: 698 | Upvalues: v5 (copy), v25 (ref), Sonar (copy) ]]
	if p1._destroyed then
		return
	end
	if not p1.IsNearby then
		return
	end
	if v5:IsInAction("Race") then
		return
	end
	local v1 = p1.Model:GetAttribute("Bucking") or p1.IsBoss
	if not v1 or (v5.Bucking or v5.Humanoid:HasTag("Ragdoll")) then
		return
	end
	v5.Bucking = true
	if p2 then
		p1:UpdateState("Buck")
		p1:PlayTrack("Buck")
		task.wait(0.425)
	end
	local Character = v5.Character
	local v2 = p1.Model.Position - Character.PrimaryPart.Position
	if v2.Magnitude <= 28 or p1.IsBoss then
		local SoundService = game:GetService("SoundService")
		local Effects = game.SoundService.Effects
		SoundService:PlayLocalSound(Effects[if math.random() < 0.1 then "VThud" else "Thud"])
		v25:Shake(v25.Presets.BigBump)
		v5:Ragdoll()
		task.wait()
		local BodyForce = Character.Head:FindFirstChildOfClass("BodyForce")
		local v4 = if BodyForce then BodyForce else Instance.new("BodyForce", Character.Head)
		local v52 = math.random(-1, 3) / 10
		v4.Force = (-v2.Unit.Unit + Vector3.new(0, v52, 0)) * Character.PrimaryPart.AssemblyMass * workspace.Gravity * math.random(12, 15)
		if not BodyForce then
			local v6 = math.random(-1, 1)
			local v7 = math.random(-1, 1)
			local random = math.random
			Character.PrimaryPart:ApplyAngularImpulse(Vector3.new(v6, v7, random(-1, 1)).Unit * math.random(-3, 3))
		end
		if p1.IsBoss and (v5:IsInAction("BossFight") or v5:IsInAction("GlobalBossFight")) then
			Sonar("RemoteUtils").GetRemoteEvent("MobBuckedOffRemote"):FireServer()
		end
		task.wait(0.15)
		v4:Destroy()
		task.wait(1.5)
		v5:Ragdoll(true)
	end
	task.wait(0.1)
	v5.Bucking = Character.Head:FindFirstChildOfClass("BodyForce")
end
function t._createSingleProjectile(p1, p2, p3) --[[ _createSingleProjectile | Line: 749 | Upvalues: v19 (copy) ]]
	local v1 = v19.new(p2, p1)
	v1.SourceModel = p1.Model
	v1.Model:PivotTo(p3)
	return v1
end
function t._makeCachedHitbox(p1, p2) --[[ _makeCachedHitbox | Line: 756 | Upvalues: Assets (copy), v4 (copy) ]]
	local v1 = Assets.MobHitboxes[p2.Hitbox]:Clone()
	p1._attackHitboxCache[p2.Hitbox] = v1
	v1.CFrame = p1.Model.CFrame * CFrame.new(0, -p1.Model.Size.Y / 2, -v1.Size.Z / 2)
	v1.Anchored = false
	v1.CanCollide = false
	v1.CanTouch = false
	v1.CastShadow = false
	v1.CanQuery = true
	v1.Massless = true
	v1.RootPriority = -127
	if p1.BossPreset.AttackColor then
		v1.Color = p1.BossPreset.AttackColor
	end
	v4:Weld(p1.CosmeticModel.PrimaryPart, v1)
	p1.Maid:GiveTask(v1)
	v1.Parent = p1.CosmeticModel
	return v1
end
function t._visualizeAttack(p1, p2) --[[ _visualizeAttack | Line: 786 | Upvalues: v22 (copy), TweenService (copy) ]]
	local v1 = p1.AttackSequences[p2]
	local Hitbox = v1.Hitbox
	if not Hitbox then
		return
	end
	local v2 = p1._attackHitboxCache[Hitbox] or p1:_makeCachedHitbox(v1)
	p1._lastHitbox = v2
	v2.Material = Enum.Material.SmoothPlastic
	v2.Transparency = 1
	if v2:FindFirstChild("SurfaceGui") then
		local Fill = v2.SurfaceGui.Frame.Fill
		v2.SurfaceGui.Frame.GroupTransparency = 1
		v2.SurfaceGui.Enabled = true
		Fill.Size = UDim2.fromScale(0, 0)
		v22.target(v2.SurfaceGui.Frame, 1, 0.85, {
			GroupTransparency = 0
		})
		p1._CurrentAttackTween = TweenService:Create(v2.SurfaceGui.Frame.Fill, TweenInfo.new(1.25, Enum.EasingStyle.Linear), {
			Size = UDim2.fromScale(1, 1)
		}):Play()
	else
		v22.target(v2, 0.8, 0.5, {
			Transparency = 0
		})
		v22.completed(v2, function() --[[ Line: 818 | Upvalues: v2 (copy) ]]
			v2.Material = Enum.Material.Neon
		end)
	end
	p1._lastAttackSpring = v2
	p1.Model:GetAttributeChangedSignal("Attacking"):Once(function() --[[ Line: 833 | Upvalues: p1 (copy), v2 (copy), v22 (ref) ]]
		if p1._lastAttackSpring ~= v2 then
			return
		end
		v22.stop(v2)
		if not p1._lastHitbox then
			return
		end
		if p1._CurrentAttackTween then
			p1._CurrentAttackTween:Cancel()
			p1._CurrentAttackTween = nil
		end
		if p1._lastHitbox:FindFirstChild("SurfaceGui") then
			v22.target(p1._lastHitbox.SurfaceGui.Frame, 1, 10, {
				GroupTransparency = 1
			})
			v22.target(p1._lastHitbox.SurfaceGui.Frame.Fill, 1, 0.2, {
				Size = UDim2.fromScale(0, 0)
			})
			return
		end
		v22.target(p1._lastHitbox, 0.8, 0.5, {
			Transparency = 1
		})
	end)
end
function t._unvisualizeAttack(p1) --[[ _unvisualizeAttack | Line: 854 ]]
	if p1._lastAttackTween then
		p1._lastAttackTween:Cancel()
	end
	if not p1._lastHitbox then
		return
	end
	p1._lastHitbox.Transparency = 1
end
function t._isRequiredFood(p1) --[[ _isRequiredFood | Line: 863 | Upvalues: v5 (copy), v8 (copy) ]]
	if not v5.EquippedTool or v5.EquippedTool.ToolData.ItemType ~= "Food" then
		v8.Notify({
			Message = "You need to hold some food to tame!",
			Type = "FoodEquip"
		})
		return
	end
	if p1.Data.RequiredFood and not table.find(p1.Data.RequiredFood, v5.EquippedTool.ToolData.Name) then
		v8.Notify({
			Message = "This species doesn\'t want that type of food!",
			Type = "FoodRequirement",
			Preset = "Yellow"
		})
	else
		return true
	end
end
function t._checkCapacity(p1) --[[ _checkCapacity | Line: 888 | Upvalues: v5 (copy) ]]
	local v1 = p1.Model:GetAttribute("TamingId")
	if v1 == nil or v1 == v5.Player.UserId then
		return v5:CanGiveItem("Animals")
	else
		return true
	end
end
function t._checkQuestRequirement(p1) --[[ _checkQuestRequirement | Line: 897 | Upvalues: v5 (copy) ]]
	if v5:HasUnlockedSpecies(p1.MobType) then
		return true
	end
end
function t.SetActive(p1) --[[ SetActive | Line: 906 ]]
	p1.Active = true
end
function t.GetState(p1, p2) --[[ GetState | Line: 910 ]]
	return p1.Model:GetAttribute(p2)
end
function t.Tick(p1) --[[ Tick | Line: 914 ]]
	p1:_updateParent()
	if p1._isRendered then
		p1:_animate()
	end
end
function t._animate(p1) --[[ _animate | Line: 925 | Upvalues: v24 (copy) ]]
	if p1._attacking then
		return
	end
	if not p1.IsNearby then
		return
	end
	local CanFly = p1.CanFly
	local v1 = if CanFly then "FlyIdle" else "Idle"
	local Magnitude = p1.Model.Velocity.Magnitude
	local v2 = if Magnitude > 2 then true else false
	p1.IsMoving = v2
	if v2 then
		if Magnitude <= p1.Data.MoveSpeed / 1.5 then
			v1 = if CanFly then "FlyForward" else "Walk"
		elseif Magnitude <= p1.Data.MoveSpeed then
			v1 = if CanFly then "FlyForward" else "Run"
		elseif p1.Data.MoveSpeed < Magnitude then
			v1 = if CanFly then "FlyForward" else "Gallop"
		end
	elseif not p1.IsBoss and (tick() > (p1._nextIdle or 0) and next(p1.IdleAnimations)) then
		p1._nextIdle = tick() + math.random(v24.AFK_TIME * 0.85, v24.AFK_TIME * 1.15)
		v1 = p1.IdleAnimations[math.random(#p1.IdleAnimations)]
		p1._idleState = v1
		if math.random() <= 0.75 then
			local v6 = p1.IdleSounds[math.random(#p1.IdleSounds)]
			v6.SoundGroup = p1.SoundGroup
			v6.PlaybackSpeed = math.random(9, 11) / 10
			v6:Play()
		end
	end
	p1:UpdateState(v1)
end
function t.ShouldCancelTracks(p1, p2) --[[ ShouldCancelTracks | Line: 969 ]]
	return true
end
function t._getSpeed(p1) --[[ _getSpeed | Line: 973 ]]
	return p1.Model.Velocity.Magnitude
end
function t.UpdateState(p1, p2, p3) --[[ UpdateState | Line: 978 | Upvalues: v3 (copy) ]]
	if not p1._isRendered then
		return
	end
	p1.State = p2
	local v1 = p1.Animations[p2]
	p1:PlayTrack(p2)
	if p1.CanFly and p1.WingAnimationTracks[p2] then
		p1:PlayWingTrack(p2)
	end
	p1.ActiveTracks[p2]:AdjustSpeed(v3.map(if p1.IsNearby and v1.ScaleWithSpeed then p1:_getSpeed() / p1.Data.MoveSpeed * 1 else 1, 0, 1, 0, v1.Speed))
	if not p1:ShouldCancelTracks(p2) then
		return
	end
	for k, v in pairs(p1.ActiveTracks) do
		if v.IsPlaying then
			local v32 = v.Name
			if (v32 ~= p1._idleState or p1.IsMoving) and (v32 ~= "Blink" and (v32 ~= "Buck" and v32 ~= p2)) then
				v:Stop(if p3 then p3 else v1 and v1.FadeOut or 0.25)
			end
		end
	end
	if not p1.CanFly then
		return
	end
	for k, v in pairs(p1.WingAnimationTracks) do
		if v.IsPlaying and v.Name ~= p2 then
			v:Stop(if p3 then p3 else v1 and v1.FadeOut or 0.25)
		end
	end
end
function t.PlayTrack(p1, p2, p3, p4, p5) --[[ PlayTrack | Line: 1033 | Upvalues: AnimationTrackCache (copy), v5 (copy), v25 (ref) ]]
	local v1 = p1.Animations[p2]
	local v2 = p1.ActiveTracks[p2]
	local v3
	if v1 and not v2 then
		local v4 = AnimationTrackCache:FindFirstChild(v1.ID)
		if v4 then
			v3 = v4
		else
			local Animation = Instance.new("Animation", AnimationTrackCache)
			Animation.Name = v1.ID
			Animation.AnimationId = "rbxassetid://" .. v1.ID
			v3 = Animation
		end
	else
		v3 = nil
	end
	if v2 and v2.IsPlaying then
		return
	end
	if not v2 then
		local v52 = p1.Animator:LoadAnimation(v3)
		v52.Name = p2
		v52.Priority = v1.Priority
		v52:GetMarkerReachedSignal("OpenEye"):Connect(function() --[[ Line: 1058 | Upvalues: p1 (copy) ]]
			p1.CanBlink = false
			p1.ActiveTracks.Blink:AdjustSpeed(0.01)
			task.wait(math.random(7, 10))
			p1.ActiveTracks.Blink:AdjustSpeed(1)
		end)
		v52:GetMarkerReachedSignal("Projectile"):Connect(function(p12) --[[ Line: 1068 | Upvalues: p1 (copy) ]]
			p1:_makeProjectiles(p12)
		end)
		v52:GetMarkerReachedSignal("SpawnObject"):Connect(function(p12) --[[ Line: 1072 | Upvalues: p1 (copy) ]]
			p1:_spawnObject(p12)
		end)
		local v6
		if v1 then
			v6 = v1.CameraShakeKeyframes
			if v6 then
				v2 = v52
			elseif IsAttack then
				v6 = IsAttack.CameraShakeKeyframes
				v2 = v52
				if not v6 then
					v6 = {}
				end
			else
				v2 = v52
				v6 = {}
			end
		elseif IsAttack then
			v6 = IsAttack.CameraShakeKeyframes
			v2 = v52
			if not v6 then
				v6 = {}
			end
		else
			v2 = v52
			v6 = {}
		end
		for v7, v8 in v6 do
			v2:GetMarkerReachedSignal(v7):Connect(function() --[[ Line: 1078 | Upvalues: p1 (copy), v5 (ref), v25 (ref), v8 (copy) ]]
				if not p1.IsNearby then
					return
				end
				if p1.IsBoss and not (v5:IsInAction("BossFight") or v5:IsInAction("GlobalBossFight")) then
					return
				end
				v25:Shake(v25.Presets[v8])
			end)
		end
		p1.ActiveTracks[p2] = v2
	end
	v2:Play(v1 and v1.FadeIn or (if p4 then p4 else 0.25), nil, p5 or 1)
	if p3 then
		p3(v2)
	end
	if not (v1 and p1.IsNearby) then
		return
	end
	v2:AdjustSpeed(v1.Speed or 1)
end
function t.PlayWingTrack(p1, p2, p3, p4, p5) --[[ PlayWingTrack | Line: 1104 ]]
	local v1 = p1.WingAnimationTracks[p2]
	if v1 and v1.IsPlaying then
		return
	end
	v1:Play(p4 or 0.25, nil, p5 or 1)
	if not p3 then
		return
	end
	p3(v1)
end
function t._canSpawnSpinner(p1, p2) --[[ _canSpawnSpinner | Line: 1118 | Upvalues: t4 (copy) ]]
	if not p1.IsBoss then
		return true
	end
	local v1 = p1.AttackSequences[p2]
	if not (v1 and v1.MaxSpawn) then
		return true
	end
	local v2 = t4[p1.Model] or {}
	local count = 0
	for v3 in v2 do
		if v3 and v3.Parent then
			count = count + 1
			continue
		end
		v2[v3] = nil
	end
	return count < v1.MaxSpawn
end
function t._registerSpinner(p1, p2) --[[ _registerSpinner | Line: 1141 | Upvalues: t4 (copy) ]]
	if not p1.IsBoss then
		return
	end
	if not t4[p1.Model] then
		t4[p1.Model] = {}
	end
	t4[p1.Model][p2] = true
	p2.AncestryChanged:Connect(function() --[[ Line: 1152 | Upvalues: p2 (copy), t4 (ref), p1 (copy) ]]
		if p2.Parent or not t4[p1.Model] then
			return
		end
		t4[p1.Model][p2] = nil
	end)
end
function t._canSpawnSpinnerStatic(p1, p2) --[[ Line: 1161 | Upvalues: t (copy) ]]
	if not (p1 and p1:HasTag("Boss")) then
		return true
	end
	local v1 = t.GetAll()[p1]
	if v1 and v1.IsBoss then
		return v1:_canSpawnSpinner(p2)
	else
		return true
	end
end
function t._registerSpinnerStatic(p1, p2) --[[ Line: 1175 | Upvalues: t (copy) ]]
	if not (p1 and p1:HasTag("Boss")) then
		return
	end
	local v1 = t.GetAll()[p1]
	if not v1 then
		return
	end
	v1:_registerSpinner(p2)
end
function t._spawnObject(p1, p2) --[[ _spawnObject | Line: 1187 | Upvalues: v24 (copy), Assets (copy) ]]
	if not p1.IsNearby then
		return
	end
	local v1 = p1.Model:GetAttribute("Attacking")
	if not v1 then
		return
	end
	if not p1:_canSpawnSpinner(v1) then
		return
	end
	local v2 = v24.MobSpawnObjectData and v24.MobSpawnObjectData[p2]
	if not v2 then
		return
	end
	local v3 = Assets:FindFirstChild(v2.TemplateName)
	if not v3 then
		return
	end
	local v4 = v3:Clone()
	v4:PivotTo(p1.Model.CFrame * (v2.Offset or CFrame.new()))
	v4:SetAttribute("BossModel", p1.Model)
	v4.Parent = workspace
	if v2.SpinTag then
		game:GetService("CollectionService"):AddTag(v4, "Spin")
	end
	p1:_registerSpinner(v4)
end
function t._makeProjectiles(p1, p2) --[[ _makeProjectiles | Line: 1223 | Upvalues: v24 (copy), v3 (copy), v20 (copy), v19 (copy) ]]
	if not p1.IsNearby then
		return
	end
	local v1 = v24.MobProjectileData[p2]
	local v2 = v1.SpawnAmount or 1
	for i = 1, v2 * math.round((v3.map(p1.Model:GetAttribute("Tier"), 1, 3, 1, 2))) do
		local AimAt = v1.AimAt
		local GetSpawnCFrame = v1.GetSpawnCFrame
		local ProjectileOrigin = v1.ProjectileOrigin
		local GetDirection = v1.GetDirection
		local v5 = p1.Model.CFrame
		local v6 = nil
		local v7 = nil
		local v8 = true
		if ProjectileOrigin then
			p1._spawnRefs = p1._spawnRefs or {}
			local v10 = p1._spawnRefs[ProjectileOrigin] or p1.CosmeticModel:FindFirstChild(ProjectileOrigin, true)
			p1._spawnRefs[ProjectileOrigin] = v10
			v5 = v10.WorldCFrame
		elseif GetSpawnCFrame then
			v5 = GetSpawnCFrame(p1, i / v2)
		end
		if GetDirection then
			v7 = GetDirection(p1, v5.p)
		end
		if AimAt == "Target" and not v7 then
			local Character = game.Players.LocalPlayer.Character
			v6 = if Character then CFrame.new(v5.Position, Character.PrimaryPart.Position) else p1.Model.CFrame
		elseif AimAt == "Meteor" then
			local v16 = p1.Model.Position + Vector3.new(p1.ProjectileRNG:NextNumber(-v1.MaxSpread, v1.MaxSpread), 0, p1.ProjectileRNG:NextNumber(-v1.MaxSpread, v1.MaxSpread))
			v1.SourceModel = p1.Model
			v1.StartPosition = v16 + Vector3.new(0, 100, 0)
			v20.new(v1)
			v8 = false
		elseif v7 or GetSpawnCFrame then
			if GetSpawnCFrame then
				v6 = v5
			end
		else
			v6 = p1.Model.CFrame
		end
		if v7 then
			v6 = CFrame.new(v5.p, v7)
		end
		if v8 then
			local v18 = v19.new(p2, p1)
			v18.SourceModel = p1.Model
			v18.Model.CFrame = v6
		end
		if v1.SpawnDelay then
			task.wait(v1.SpawnDelay)
		end
	end
end
function t.playTamedEffect(p1) --[[ playTamedEffect | Line: 1304 | Upvalues: v16 (copy) ]]
	if not (p1._isRendered and (p1.Model:GetAttribute("TamingId") or (p1.Model:HasTag("Boss") or p1.Model:GetAttribute("Local")))) then
		return
	end
	v16.emitEffectAt(if p1.Model:HasTag("Boss") then "BossSpawn" else "MobSpawn", workspace.Terrain, p1.Model.CFrame)
end
function t.getMobFromModel(p1) --[[ getMobFromModel | Line: 1312 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t.getCurrentTamingTarget() --[[ getCurrentTamingTarget | Line: 1316 | Upvalues: v26 (ref) ]]
	return v26
end
function t.setCurrentTamingTarget(p1) --[[ setCurrentTamingTarget | Line: 1320 | Upvalues: v5 (copy), v26 (ref) ]]
	local v1 = p1.Model:GetAttribute("TamingId")
	local v2 = p1.Model:GetAttribute("TamingContributors")
	if if v1 == v5.Player.UserId then true elseif v2 then string.find(v2, v5.Player.UserId) else v2 then
		v26 = p1.Model
		return
	end
	if v26 ~= p1.Model then
		return
	end
	v26 = nil
end
function t.GetAll() --[[ GetAll | Line: 1332 | Upvalues: t3 (copy) ]]
	return t3
end
function t.Destroy(p1) --[[ Destroy | Line: 1336 | Upvalues: v5 (copy), v23 (copy), t4 (copy), t3 (copy), t2 (copy) ]]
	if p1.Model:HasTag("Boss") and p1.Model:GetAttribute("IsGlobalBoss") then
		if v5.PlayerData.Settings.States.VisualEffects.Value then
			v23.CreateParticleAtPosition({
				ParticleName = "GlobalBossDefeat",
				Duration = 15,
				Position = p1.Model.Position
			})
		end
	else
		p1:playTamedEffect()
	end
	p1._destroyed = true
	p1.Maid:Destroy()
	p1.CosmeticModel:Destroy()
	if p1.IsBoss then
		t4[p1.Model] = nil
	end
	t3[p1.Model] = nil
	t2[p1] = nil
	setmetatable(p1, nil)
end
function t.RenderMobs() --[[ RenderMobs | Line: 1362 | Upvalues: t (copy), t3 (copy), v27 (ref) ]]
	if t.RenderingMobs then
		return
	end
	t.RenderingMobs = true
	for v1, v2 in t3 do
		v2:SetActive()
	end
	v27 = tick()
	game:GetService("CollectionService"):GetInstanceAddedSignal("Mob"):Connect(function(p1) --[[ Line: 1369 | Upvalues: t (ref) ]]
		t.new(p1)
	end)
	game:GetService("CollectionService"):GetInstanceRemovedSignal("Mob"):Connect(function(p1) --[[ Line: 1372 | Upvalues: t3 (ref) ]]
		local v1 = t3[p1]
		if not v1 then
			return
		end
		v1:Destroy()
	end)
	for v3, v4 in game:GetService("CollectionService"):GetTagged("Mob") do
		t.new(v4)
	end
end
v24.GameStateChangedSignal:Connect(t.RenderMobs)
task.spawn(t.RenderMobs)
local v28 = nil
RunService.Heartbeat:Connect(function() --[[ Line: 1386 | Upvalues: TouchEnabled (copy), v28 (ref), t2 (copy) ]]
	if TouchEnabled then
		v28 = not v28
	end
	if v28 then
		return
	end
	for v1, v2 in t2 do
		if v1.Active and (v1.Tick and not v1._destroyed) then
			v1:Tick()
		end
	end
end)
local t5 = { "Great teamwork!", "Tame complete!" }
local function displaySlot(p1, p2, p3) --[[ displaySlot | Line: 1412 | Upvalues: SFX (copy), v17 (copy), t5 (copy), TweenService (copy), Sonar (copy), v5 (copy) ]]
	if not p2 then
		SFX.QuestComplete1:Play()
		SFX.QuestComplete2:Play()
		v17:AddNotification({
			Type = "TameAssist",
			Duration = 2,
			Text = t5[math.random(#t5)],
			RunBefore = function() --[[ RunBefore | Line: 1419 | Upvalues: TweenService (ref) ]]
				TweenService:Create(game.Lighting.ColorCorrection, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
					Brightness = 0.15
				}):Play()
			end
		})
	end
	if not p2 then
		return
	end
	task.wait()
	SFX.QuestComplete1:Play()
	SFX.QuestComplete2:Play()
	Sonar("DisplayAnimalClient"):DisplaySlot({
		AllowNaming = true,
		ShowMaxWarning = true,
		MobileClickBackgroundToClose = false,
		DoAnimatedIntro = false,
		Type = p1,
		Slot = v5:GetItemFolder("Animals"):WaitForChild(p2),
		ShowTameContestPoints = not p3
	})
end
function t.DisplaySlot(...) --[[ DisplaySlot | Line: 1442 | Upvalues: displaySlot (copy) ]]
	return displaySlot(...)
end
v8.AddNotificationCallback("TamingSuccess", function(p1, p2) --[[ Line: 1446 | Upvalues: displaySlot (copy) ]]
	displaySlot("Tamed", p1, p2)
end)
v8.AddNotificationCallback("AssistTamingSuccess", function(p1) --[[ Line: 1450 | Upvalues: displaySlot (copy) ]]
	displaySlot("AssistTamed", p1)
end)
v8.AddNotificationCallback("MaxHorses", function(p1) --[[ Line: 1454 | Upvalues: SFX (copy) ]]
	SFX.Error:Play()
	task.wait()
	return {
		Message = "\226\154\160\239\184\143 You cannot own anymore horses! \226\154\160\239\184\143",
		Preset = "Red"
	}
end)
v8.AddNotificationCallback("NoAssistContribution", function(p1) --[[ Line: 1463 | Upvalues: SFX (copy) ]]
	SFX.Error:Play()
	task.wait()
	return {
		Message = "You didn\'t help enough to get this tame!",
		Preset = "Red"
	}
end)
return t