-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnimalData")
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("Binder")
local v4 = Sonar("Maid")
local v5 = Sonar("MathUtils")
local v6 = Sonar("MutationUtils")
local v7 = Sonar("MutationStatUtils")
local v8 = Sonar("PlayerWrapper")
local v9 = Sonar("Table")
local v10 = if RunService:IsClient() then Sonar("InputTypeDetector") else nil
local v11 = if RunService:IsClient() then Sonar("SettingsService") else nil
local v12 = Sonar("Constants")
local Gaits = v12.Gaits
local PriorityTable = v12.PriorityTable
local IsServer = v12.IsServer
local t2 = {
	FlyForward = true,
	Glide = true,
	Dive = true
}
local LocalPlayer = Players.LocalPlayer
local v13 = if LocalPlayer then v8.GetClient() else nil
local SFX = ReplicatedStorage:WaitForChild("Storage").SFX
local v14 = nil
local v15 = false
local v16 = nil
local function updateMobileMovement() --[[ updateMobileMovement | Line: 54 | Upvalues: v14 (ref), v11 (copy), v13 (copy), v10 (copy), v15 (ref) ]]
	v14 = v11.GetSetting(v13, "MobileMovementControls")
	v15 = v14 == "Thumbstick" and v10.IsMobileInputType() and true or false
end
function t._init(p1) --[[ _init | Line: 64 | Upvalues: v1 (copy), v2 (copy), Gaits (copy), v5 (copy), v6 (copy), v7 (copy), PriorityTable (copy), v12 (copy), SFX (copy) ]]
	p1.Data = p1.Model:WaitForChild("Data")
	p1.SlotValue = p1.Model:WaitForChild("SlotInfo")
	p1.AnimalData = v1.GetOrCreateAnimalData(p1.Model, p1.Player, p1.SlotValue)
	p1.Species = p1.AnimalData:GetCached("Species")
	p1.SpeciesData = v2.GetByName(p1.Species)
	p1.BaseSpeed = p1.AnimalData:GetWithModifiers("Speed")
	p1.SprintSpeed = p1.AnimalData:GetWithModifiers("SprintSpeed")
	local BaseSpeed = p1.BaseSpeed
	local v13 = 1 / (p1.AnimalData:Get("Speed") / p1.SprintSpeed)
	p1.SpeedsByGaits = {}
	for v22, v3 in Gaits do
		if v3 == "Reverse" then
			p1.ReverseSpeed = 1 / (p1.BaseSpeed / -4.5)
			continue
		end
		p1.SpeedsByGaits[v3] = if v3 == "Idle" then 0 else v5.map(v22 - 1, 0, #Gaits - 1, BaseSpeed, v13)
	end
	p1.SpeedsByGaits.RaceSprint = v13
	p1.Root = p1.Model:WaitForChild("HumanoidRootPart")
	p1.PrimaryPart = p1.Model.PrimaryPart
	p1.Animations = {
		Idle = {
			Uncancellable = true
		},
		Reverse = {
			FadeIn = 0.25,
			FadeOut = 0.45,
			Speed = -0.7,
			Keyframes = {}
		},
		Walk = {
			FadeIn = 0.25,
			FadeOut = 0.45,
			Keyframes = {}
		},
		Trot = {
			FadeIn = 0.25,
			FadeOut = 0.45,
			Keyframes = {}
		},
		Canter = {
			FadeIn = 0.25,
			FadeOut = 0.45,
			Keyframes = {}
		},
		Gallop = {
			FadeIn = 0.25,
			FadeOut = 0.45,
			Keyframes = {}
		},
		RaceSprint = {
			FadeIn = 0.25,
			FadeOut = 0.35,
			Keyframes = {}
		},
		Jump = {
			FadeIn = 0.05,
			FadeOut = 0.25
		},
		Fall = {
			FadeIn = 0.15,
			FadeOut = 0.25
		},
		JumpBuck = {
			FadeIn = 0.25,
			FadeOut = 1,
			Uncancellable = true
		},
		Collapse = {
			FadeIn = 0.25,
			FadeOut = 1,
			Uncancellable = true
		},
		RearKick = {
			FadeIn = 0.25,
			FadeOut = 1,
			Uncancellable = true
		},
		ShortBuck = {
			FadeIn = 0.25,
			FadeOut = 1,
			Uncancellable = true
		},
		Rear = {
			FadeIn = 0.25,
			FadeOut = 1,
			Uncancellable = true
		},
		Lay = {
			Idle = true,
			FadeIn = 0.5,
			FadeOut = 0.5,
			Uncancellable = true
		},
		Stomp = {
			Idle = true,
			FadeIn = 0.25,
			FadeOut = 0.5,
			Uncancellable = true
		},
		HappyStomp = {
			Idle = true,
			FadeIn = 0.25,
			FadeOut = 0.5,
			Uncancellable = true
		},
		Piaffe = {
			Idle = true,
			FadeIn = 0.25,
			FadeOut = 0.5,
			Uncancellable = true
		},
		Sit = {
			Idle = true,
			FadeIn = 0.5,
			FadeOut = 0.5,
			Uncancellable = true
		},
		LegRest = {
			Idle = true,
			FadeIn = 0.5,
			FadeOut = 0.5,
			Uncancellable = true
		},
		LiftedSit = {
			Idle = true,
			FadeIn = 0.5,
			FadeOut = 0.5,
			Uncancellable = true
		},
		Blink = {
			FadeIn = 0,
			FadeOut = 0,
			Uncancellable = true
		},
		FlyIdle = {
			FadeIn = 0.4,
			FadeOut = 0.4,
			Keyframes = {}
		},
		FlyForward = {
			FadeIn = 0.2,
			FadeOut = 0.45,
			Keyframes = {}
		},
		Glide = {
			FadeIn = 0.4,
			FadeOut = 0.4,
			Keyframes = {}
		},
		Dive = {
			FadeIn = 0.55,
			FadeOut = 0.55
		}
	}
	p1.WingAnimations = {
		Idle = {
			Uncancellable = true
		},
		FlyIdle = {
			FadeIn = 0.4,
			FadeOut = 0.4,
			Keyframes = {}
		},
		FlyForward = {
			FadeIn = 0.2,
			FadeOut = 0.45,
			Keyframes = {}
		},
		Glide = {
			FadeIn = 0.4,
			FadeOut = 0.4,
			Keyframes = {}
		},
		Dive = {
			FadeIn = 0.55,
			FadeOut = 0.55
		},
		Stretch = {
			FadeIn = 0.2,
			FadeOut = 0.2,
			Idle = true
		},
		Shuffle = {
			FadeIn = 0.2,
			FadeOut = 0.2,
			Idle = true
		},
		Ruffle = {
			FadeIn = 0.2,
			FadeOut = 0.2,
			Idle = true
		},
		Reach = {
			FadeIn = 0.2,
			FadeOut = 0.2,
			Idle = true
		}
	}
	local v52, v62 = v6.GetMutationOfType(p1.SlotValue, "Wings")
	p1.WingData = v52
	p1.WingValue = v62
	p1.WingModel = if v52 then p1.Model:WaitForChild(v52.Name) else v52
	if v52 then
		p1.CanFly = if p1.WingValue.Level.Value > 1 then true else false
		p1.FlySpeed = v7.GetValue(v52.Stats.FlySpeed, v62)
	end
	p1.AnimationController = p1.Model:WaitForChild("AnimationController")
	p1.WingAnimationController = if v52 then p1.WingModel:WaitForChild("AnimationController") else v52
	p1.AnimationTracks = {}
	p1.WingAnimationTracks = {}
	p1.IdleAnimations = {}
	p1.WingIdleAnimations = {}
	task.defer(function() --[[ Line: 180 | Upvalues: p1 (copy), PriorityTable (ref), v52 (copy), v12 (ref) ]]
		for v1, v2 in p1.SpeciesData.Animations do
			local Animation = Instance.new("Animation")
			Animation.Name = v1
			Animation.AnimationId = v2
			p1.Maid:GiveTask(Animation)
			local v3 = p1.AnimationController:LoadAnimation(Animation)
			p1.AnimationTracks[v1] = v3
			if PriorityTable[v1] then
				v3.Priority = PriorityTable[v1] or Enum.AnimationPriority.Idle
			end
			if p1.Animations[v1] and p1.Animations[v1].Keyframes then
				for k, v in pairs(p1.Animations[v1].Keyframes) do
					p1.AnimationTracks[v1].KeyframeReached:Connect(function(p1) --[[ Line: 196 | Upvalues: v (copy) ]]
						if not p1 or (p1 == "" or p1:lower() ~= v.Name:lower()) then
							return
						end
						v.Callback()
					end)
				end
			elseif p1.Animations[v1] and p1.Animations[v1].Idle then
				table.insert(p1.IdleAnimations, v1)
			end
			task.wait()
		end
		if not v52 then
			return
		end
		for v6, v7 in v52.Animations do
			local v5
			if v6 == "Idle" and p1.SlotValue.UpliftedWings.Value or v6 == "Idle" and p1.SpeciesData.ToyHorse then
				v7, v5 = v52.Animations.UPLIFTED_WING_IDLE_ANIMATION or v12.UPLIFTED_WING_IDLE_ANIMATION, v7
			else
				v5 = v7
			end
			local Animation = Instance.new("Animation")
			Animation.Name = v6
			Animation.AnimationId = v7
			p1.Maid:GiveTask(Animation)
			local v10 = p1.WingAnimationController:LoadAnimation(Animation)
			if p1.WingAnimations[v6] and p1.WingAnimations[v6].Idle then
				p1.WingIdleAnimations[v6] = v10
			else
				p1.WingAnimationTracks[v6] = v10
			end
			if PriorityTable[v6] then
				v10.Priority = PriorityTable[v6] or Enum.AnimationPriority.Idle
			end
			if v6 == "Idle" and p1.SpeciesData.ToyHorse then
				local UpliftedIdle = Instance.new("Animation")
				UpliftedIdle.Name = "UpliftedIdle"
				UpliftedIdle.AnimationId = v5
				p1.Maid:GiveTask(UpliftedIdle)
				p1.WingAnimationTracks.UpliftedIdle = p1.WingAnimationController:LoadAnimation(UpliftedIdle)
			end
			task.wait()
		end
	end)
	p1.IdleSounds = {}
	for v11, v122 in { "Snort1", "Snort2", "Snort3", "Neigh1", "Neigh2", "Neigh3", "Whinny1" } do
		local v10
		local v132 = p1.SpeciesData.CallSounds and p1.SpeciesData.CallSounds[v122]
		if v132 then
			local Sound = Instance.new("Sound")
			Sound.SoundId = v132.Id
			Sound.PlaybackSpeed = 1
			Sound.Volume = 0.5
			Sound.RollOffMaxDistance = 300
			Sound.RollOffMinDistance = 10
			Sound.RollOffMode = Enum.RollOffMode.InverseTapered
			Sound:AddTag("EffectsSound")
			v10 = Sound
		else
			v10 = SFX[v122]:Clone()
		end
		table.insert(p1.IdleSounds, v10)
		p1.Maid:GiveTask(v10)
		v10.Parent = p1.Root
	end
	p1._lastWingIdle = tick()
end
function t.new(p1) --[[ new | Line: 275 | Upvalues: t (ref), v4 (copy), Players (copy), v8 (copy), LocalPlayer (copy) ]]
	local v2 = setmetatable({}, t)
	local v3 = p1:GetAttribute("UserId")
	v2.Maid = v4.new()
	v2.Model = p1
	v2.Seat = v2.Model:FindFirstChildOfClass("Seat")
	v2.Player = Players:GetPlayerByUserId(v3)
	v2.PlayerWrapper = v8.getWrapperFromPlayer(v2.Player)
	v2.IsLocal = v2.Player == LocalPlayer
	v2:_setup()
	return v2
end
function t._setup(p1) --[[ _setup | Line: 293 | Upvalues: IsServer (copy) ]]
	if IsServer then
		return
	end
	if not p1.IsLocal then
		for v1, v2 in p1.Model:GetDescendants() do
			if v2:IsA("BasePart") then
				v2.CanQuery = false
				v2.CanTouch = false
				v2.CanCollide = false
			end
		end
	end
	p1:_init()
	local t = { "MoveState", "Flying", "Gliding", "WingState", "Jumping", "Falling" }
	for v3, v4 in t do
		p1.Maid:GiveTask(p1.Model:GetAttributeChangedSignal(v4):Connect(function() --[[ Line: 338 | Upvalues: p1 (copy), t (copy) ]]
			p1.Maid._resolveState = task.defer(function() --[[ Line: 339 | Upvalues: t (ref), p1 (ref) ]]
				local t2 = {}
				for v1, v2 in t do
					t2[v2] = p1.Model:GetAttribute(v2)
				end
				local Flying = t2.Flying
				if if Flying then Flying else t2.Gliding then
					p1:StepFlight(t2)
				else
					p1:StepGround(t2)
				end
			end)
		end))
	end
end
function t._tryUpdateAnimSpeed(p1, p2, p3) --[[ _tryUpdateAnimSpeed | Line: 360 ]]
	if not (p2 and p3) then
		return
	end
	local v1 = p1.AnimationTracks[p2]
	if not v1 then
		return
	end
	if not v1.IsPlaying then
		return
	end
	if not v1 then
		return
	end
	v1:AdjustSpeed(p3)
end
function t.PlayTrack(p1, p2, p3) --[[ PlayTrack | Line: 375 ]]
	local v1 = p1.Animations[p2]
	local v2 = p1.AnimationTracks[p2]
	if not v2 then
		return
	end
	if v2.IsPlaying then
		return
	end
	if p1.IsLocal then
		if p1._lastTrack ~= p2 then
			p1._lastTrack = p2
		end
	else
		v2:Play((if p3 then p3 elseif v1 then v1.FadeIn else v1) or 0.25)
		if not v1 then
			return
		end
		v2:AdjustSpeed(v1.Speed or 1)
	end
end
function t.PlayWingTrack(p1, p2, p3) --[[ PlayWingTrack | Line: 406 ]]
	local v1 = p1.WingAnimations[p2]
	local v2 = p1.WingAnimationTracks[p2] or p1.WingIdleAnimations[p2]
	if not v2 then
		return
	end
	if v2.IsPlaying then
		return
	end
	if p1.IsLocal then
		if p1._lastWingTrack ~= p2 then
			p1._lastWingTrack = p2
		end
	else
		v2:Play(if p3 then p3 else v1 and v1.FadeIn or 0.25)
		if not v1 then
			return
		end
		v2:AdjustSpeed(v1.Speed or 1)
	end
end
function t.SetMoveState(p1, p2, p3) --[[ SetMoveState | Line: 434 ]]
	p1.MoveState = p2
	p1:SetState(p2)
end
function t.SetState(p1, p2, p3) --[[ SetState | Line: 439 ]]
	p1:PlayTrack(p2, p3)
	local v1 = p1.Animations[p2]
	for k, v in pairs(p1.AnimationController:GetPlayingAnimationTracks()) do
		if v.Name ~= p2 and not ((p1.Animations[v.Name] or {}).Uncancellable or p1.IsLocal) then
			v:Stop(if p3 then p3 else v1 and v1.FadeOut or 0.25)
		end
	end
end
function t.ShouldCancelFlyingTracks(p1, p2) --[[ ShouldCancelFlyingTracks | Line: 458 | Upvalues: t2 (copy) ]]
	return not (t2[p2] and p1.Flying)
end
function t.SetWingState(p1, p2, p3) --[[ SetWingState | Line: 466 | Upvalues: v9 (copy) ]]
	if not p1.WingData then
		return
	end
	if p2 == "Idle" then
		if tick() - p1._lastWingIdle > 18 and not p1._lockedWingIdle then
			p1._lastWingIdle = tick()
			p1._lockedWingIdle = v9.PickRandom(p1.WingIdleAnimations)
			task.delay(p1.WingIdleAnimations[p1._lockedWingIdle].Length, function() --[[ Line: 477 | Upvalues: p1 (copy) ]]
				p1._lastWingIdle = tick()
				p1._lockedWingIdle = nil
			end)
		end
		if p1._lockedWingIdle then
			p2 = p1._lockedWingIdle
		end
	elseif p1._lockedWingIdle then
		p1._lockedWingIdle = nil
		p1._lastWingIdle = tick() + 1
	end
	p1.WingState = p2
	local v1 = p1.WingAnimations[p2]
	if not (p1.WingAnimationTracks[p2] or p1.WingIdleAnimations[p2]) then
		return
	end
	p1:PlayWingTrack(p2, p3)
	if p1.IsLocal then
		return
	end
	if not p1:ShouldCancelFlyingTracks(p2) then
		return
	end
	for k, v in pairs(p1.WingAnimationController:GetPlayingAnimationTracks()) do
		if v.Name ~= p2 and not (p1.WingAnimations[v.Name] or {}).Uncancellable then
			v:Stop(if p3 then p3 else v1 and v1.FadeOut or 0.25)
		end
	end
end
function t.StepFlight(p1, p2) --[[ StepFlight | Line: 517 | Upvalues: v5 (copy) ]]
	local WingState = p2.WingState
	p1.AngleOfAttack = math.asin(p1.Root.CFrame.LookVector.Y)
	if WingState == "Dive" then
		for v1, v2 in {
			Dive = { v5.map(p1.AngleOfAttack, -1.2, -0.6, 1, 0.25, true) },
			Glide = { v5.map(p1.AngleOfAttack, -1.2, -0.6, 0, 0.75, true) },
			FlyForward = { 0 },
			FlyIdle = { 0 }
		} do
			local v3 = p1.WingAnimationTracks[v1]
			if v3 then
				v3:AdjustWeight(table.unpack(v2))
			end
		end
	else
		local v52 = math.sin(tick() * 6) * 0.6
		for v9, v10 in {
			Glide = { 1, 0.25 },
			FlyForward = { v5.map(p1.AngleOfAttack, -0.1, 0.65, 0, math.max(v52 * math.abs(math.sin(tick() * 0.8) * 0.85 + 1.65), 0.15), true), 0.25 },
			FlyIdle = { 0 },
			Dive = { 0 }
		} do
			local v11 = p1.WingAnimationTracks[v9]
			if v11 then
				v11:AdjustWeight(table.unpack(v10))
			end
		end
	end
	p1:SetWingState(WingState)
	p1:SetState(WingState)
	local v12 = if p1.WingData then p1.WingData.Stats.FlySprintMultiplier else 1.35
	local v13 = if p1.Sprinting and v12 then v12 else 1
	local Magnitude = (p1.PrimaryPart.AssemblyLinearVelocity * 1000 // 1 / 1000 // 1).Magnitude
	local v14 = Magnitude / p1.FlySpeed
	p1:_tryUpdateAnimSpeed("FlyForward", math.max(0.65, v14) * 0.75)
	p1:_tryUpdateAnimSpeed("Glide", math.max(0.65, v14) * 0.75)
	p1:_tryUpdateAnimSpeed("Dive", (math.max(1, Magnitude / (p1.FlySpeed * 4.25 * v13))))
end
function t.StepGround(p1, p2) --[[ StepGround | Line: 579 ]]
	p1:SetMoveState(p2.MoveState)
	p1:SetWingState(p2.WingState)
	if p2.Jumping then
		p1:SetState("Jump")
		return
	end
	if not p2.Falling then
		return
	end
	p1:SetState("Fall")
end
function t.Destroy(p1) --[[ Destroy | Line: 590 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 595 | Upvalues: v11 (copy), v13 (copy), updateMobileMovement (copy), v14 (ref), v10 (copy), v15 (ref), v16 (ref), v3 (copy), t (ref) ]]
	if not v11 then
		v16 = v3.new("Animal", t)
		v16:Init()
		return
	end
	v11.GetSettingChangedSignal(v13, "MobileMovementControls"):Connect(updateMobileMovement)
	v14 = v11.GetSetting(v13, "MobileMovementControls")
	v15 = if v14 == "Thumbstick" and v10.IsMobileInputType() then true else false
	v16 = v3.new("Animal", t)
	v16:Init()
end
t:Init()
t.Binder = v16
return t