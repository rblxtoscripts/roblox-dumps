-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ContentProvider = game:GetService("ContentProvider")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Signal")
local v3 = Sonar("ParticleSet")
local v4 = Sonar("SoundService")
local v5 = Sonar("StorageUtils")
local v6 = Sonar("GuiFrameworkService")
local v7 = Sonar("ImmersiveEffectService", {
	Deferred = true
})
local v8 = Sonar("LightingService")
local v9 = Sonar("FoVService")
local v10 = Sonar("LensFlare")
local t2 = {
	ParticleEmitter = true,
	PointLight = true,
	Sound = true,
	Trail = true
}
local t3 = {
	DisableControls = true
}
local CurrentCamera = workspace.CurrentCamera
local v11 = v1.new()
local v12 = v2.new()
local v13 = nil
local v14 = nil
t.CompletedSignal = v12
t.CutsceneMaid = v11
local function _getConfig() --[[ _getConfig | Line: 117 | Upvalues: v14 (ref), v5 (copy) ]]
	if v14 then
		return v14
	end
	v14 = v5.GetConfig("CutsceneRunner")()
	return v14
end
local function _applyOverrides(p1, p2) --[[ _applyOverrides | Line: 131 | Upvalues: t3 (copy) ]]
	local t = {}
	for v1, v2 in t3 do
		t[v1] = v2
	end
	for v3, v4 in p1 do
		t[v3] = v4
	end
	if p2 then
		for v5, v6 in p2 do
			t[v5] = v6
		end
	end
	return t
end
local function _isParticleSetContainer(p1) --[[ _isParticleSetContainer | Line: 153 | Upvalues: t2 (copy) ]]
	if not (p1:IsA("Folder") or (p1:IsA("Attachment") or p1:IsA("Bone"))) then
		return false
	end
	for v1, v2 in p1:GetDescendants() do
		if t2[v2.ClassName] then
			return true
		end
	end
	return false
end
local function _scanParticleSets(p1, p2) --[[ _scanParticleSets | Line: 178 | Upvalues: _isParticleSetContainer (copy), v3 (copy) ]]
	local t = {}
	for v1, v2 in p1:GetDescendants() do
		if _isParticleSetContainer(v2) then
			local v32 = v3.fromExistingInstance(v2)
			v32:Enable(false)
			p2:GiveTask(v32)
			if not t[v2.Name] then
				t[v2.Name] = {}
			end
			table.insert(t[v2.Name], v32)
		end
	end
	return t
end
local function _scanSounds(p1, p2) --[[ _scanSounds | Line: 203 | Upvalues: _isParticleSetContainer (copy) ]]
	local t = {}
	for v1, v2 in p1:GetDescendants() do
		if v2:IsA("Sound") then
			local v3 = v2.Parent
			local v4 = false
			while true do
				if not v3 or v3 == p1 then
					break
				end
				if p2[v3.Name] and _isParticleSetContainer(v3) then
					v4 = true
					break
				end
				v3 = v3.Parent
			end
			if not v4 then
				t[v2.Name] = v2
			end
		end
	end
	return t
end
local function _scanLensFlares(p1, p2, p3) --[[ _scanLensFlares | Line: 237 | Upvalues: CurrentCamera (copy), v10 (copy) ]]
	local LensFlares = p2.LensFlares
	if not LensFlares then
		return {}
	end
	local v1 = p2.CameraToAttach or CurrentCamera
	local t = {}
	for v2, v3 in p1:GetDescendants() do
		local v4 = LensFlares[v3.Name]
		if v4 and (v3:IsA("BasePart") or (v3:IsA("Attachment") or v3:IsA("Bone"))) then
			if v4.Strength then
				v3:SetAttribute("LensFlareStrength", v4.Strength)
			end
			if v4.Distance then
				v3:SetAttribute("LensFlareDistance", v4.Distance)
			end
			local v6 = v10.new(v1, v4.Style or "Default", v3)
			p3:GiveTask(v6)
			table.insert(t, v6)
		end
	end
	return t
end
local function _resolveRig(p1, p2) --[[ _resolveRig | Line: 286 | Upvalues: v5 (copy), CollectionService (copy) ]]
	local v1 = if p1 or not p2.RigPath then p1 else v5.GetFromPath(p2.RigPath)()
	if not v1 and p2.RigTag then
		v1 = CollectionService:GetTagged(p2.RigTag)[1]
	end
	assert(v1, "CutsceneRunner: Could not resolve a rig. Pass a rig argument, or set RigPath/RigTag in config.")
	local v3
	if v1.Parent == workspace.Terrain then
		v3 = false
	else
		local v4 = v1:Clone()
		v4.Parent = workspace.Terrain
		v1 = v4
		v3 = true
	end
	return v1, v3
end
function t.new(p1, p2, p3) --[[ new | Line: 324 | Upvalues: t (copy), v14 (ref), v5 (copy), _applyOverrides (copy), v1 (copy), CurrentCamera (copy), _resolveRig (copy), _scanParticleSets (copy), _scanSounds (copy), _scanLensFlares (copy), v4 (copy), v7 (copy), v8 (copy), v9 (copy), ContentProvider (copy) ]]
	local v2 = setmetatable({}, t)
	if not v14 then
		v14 = v5.GetConfig("CutsceneRunner")()
	end
	local v3 = v14.Cutscenes[p1]
	assert(v3, "CutsceneRunner: No config entry found for cutscene \'" .. p1 .. "\'")
	local v42 = _applyOverrides(v3, p3)
	v2._config = v42
	v2._stopped = false
	v2._started = false
	v2._maid = v1.new()
	v2._initCallback = v42.InitCallback
	v2._destroyCallback = v42.DestroyCallback
	v2._keyframes = v42.Keyframes
	v2._camera = v42.CameraToAttach or CurrentCamera
	local v6, v72 = _resolveRig(p2, v42)
	v2._rig = v6
	v2._rigIsCloned = v72
	v2._particleSets = _scanParticleSets(v6, v2._maid)
	v2._sounds = _scanSounds(v6, v2._particleSets)
	v2._activeMarkerSounds = {}
	v2._lensFlares = _scanLensFlares(v6, v42, v2._maid)
	local AnimationController = Instance.new("AnimationController")
	AnimationController.Parent = v6
	v2._maid:GiveTask(AnimationController)
	local Animator = Instance.new("Animator")
	Animator.Parent = AnimationController
	local Animation = Instance.new("Animation")
	Animation.AnimationId = v42.AnimationId
	v2._maid:GiveTask(Animation)
	local v82 = Animator:LoadAnimation(Animation)
	v82.Looped = false
	v2._track = v82
	v2._maid:GiveTask(v82)
	local Camera = v6:FindFirstChild("Camera", true)
	v2._cameraBone = Camera
	if not Camera then
		warn("CutsceneRunner: No \'Camera\' child found in rig. Camera will not move.")
	end
	v2._maid:GiveTask(v82:GetMarkerReachedSignal("ParticleSetEnable"):Connect(function(p1) --[[ Line: 386 | Upvalues: v2 (copy) ]]
		local v1 = v2._particleSets[p1]
		if not v1 then
			warn("CutsceneRunner: ParticleSetEnable marker references unknown set \'" .. tostring(p1) .. "\'")
			return
		end
		for v22, v3 in v1 do
			v3:Enable(true)
		end
	end))
	v2._maid:GiveTask(v82:GetMarkerReachedSignal("ParticleSetDisable"):Connect(function(p1) --[[ Line: 397 | Upvalues: v2 (copy) ]]
		local v1 = v2._particleSets[p1]
		if not v1 then
			warn("CutsceneRunner: ParticleSetDisable marker references unknown set \'" .. tostring(p1) .. "\'")
			return
		end
		for v22, v3 in v1 do
			v3:Enable(false)
		end
	end))
	v2._maid:GiveTask(v82:GetMarkerReachedSignal("ParticleSetEmit"):Connect(function(p1) --[[ Line: 408 | Upvalues: v2 (copy) ]]
		local v1 = v2._particleSets[p1]
		if not v1 then
			warn("CutsceneRunner: ParticleSetEmit marker references unknown set \'" .. tostring(p1) .. "\'")
			return
		end
		for v22, v3 in v1 do
			v3:Emit()
		end
	end))
	v2._maid:GiveTask(v82:GetMarkerReachedSignal("SoundEnable"):Connect(function(p1) --[[ Line: 419 | Upvalues: v2 (copy), v4 (ref) ]]
		local v1 = v2._sounds[p1]
		if v1 then
			if not v1.IsPlaying then
				v1:Play()
			end
		else
			local v22 = v4.makeSound(p1, {
				Looped = true
			})
			v22:Play()
			v2._activeMarkerSounds[p1] = v22
			v2._maid:GiveTask(v22)
		end
	end))
	v2._maid:GiveTask(v82:GetMarkerReachedSignal("SoundDisable"):Connect(function(p1) --[[ Line: 433 | Upvalues: v2 (copy) ]]
		local v1 = v2._sounds[p1]
		if v1 and v1.IsPlaying then
			v1:Stop()
			return
		end
		local v22 = v2._activeMarkerSounds[p1]
		if not (v22 and v22.Parent) then
			return
		end
		v22:Stop()
		v22:Destroy()
		v2._activeMarkerSounds[p1] = nil
	end))
	v2._activeMarkerEffects = {}
	v2._activeMarkerLighting = {}
	v2._activeMarkerFoV = {}
	v2._maid:GiveTask(v82:GetMarkerReachedSignal("ImmersiveEffect"):Connect(function(p1) --[[ Line: 453 | Upvalues: v7 (ref), v2 (copy) ]]
		v7.setEffect(p1, true)
		v2._activeMarkerEffects[p1] = true
	end))
	v2._maid:GiveTask(v82:GetMarkerReachedSignal("LightingMode"):Connect(function(p1) --[[ Line: 458 | Upvalues: v8 (ref), v2 (copy) ]]
		v8.setLightingMode(p1, true)
		v2._activeMarkerLighting[p1] = true
	end))
	v2._maid:GiveTask(v82:GetMarkerReachedSignal("FoVMode"):Connect(function(p1) --[[ Line: 463 | Upvalues: v9 (ref), v2 (copy) ]]
		v9.setModifier(p1, true)
		v2._activeMarkerFoV[p1] = true
	end))
	v2._maid:GiveTask(function() --[[ Line: 468 | Upvalues: v2 (copy), v7 (ref), v8 (ref), v9 (ref) ]]
		for v1 in v2._activeMarkerEffects do
			v7.setEffect(v1, false)
		end
		for v22 in v2._activeMarkerLighting do
			v8.setLightingMode(v22, false)
		end
		for v3 in v2._activeMarkerFoV do
			v9.setModifier(v3, false)
		end
	end)
	if v2._keyframes then
		for v92, v10 in v2._keyframes do
			v2._maid:GiveTask(v82:GetMarkerReachedSignal(v10.Name):Connect(function(p1) --[[ Line: 483 | Upvalues: v10 (copy), v2 (copy), v82 (copy) ]]
				v10.Callback(v2, v82, p1)
			end))
		end
	end
	v2._maid:GiveTask(v82.Ended:Connect(function() --[[ Line: 490 | Upvalues: v2 (copy) ]]
		if v2._stopped then
			return
		end
		v2:Stop()
	end))
	ContentProvider:PreloadAsync({ Animation })
	return v2
end
function t.Start(p1) --[[ Start | Line: 509 | Upvalues: v11 (copy), Lighting (copy), v6 (copy), TweenService (copy), v7 (copy), RunService (copy), v13 (ref) ]]
	if p1._started then
		return p1
	end
	p1._started = true
	v11:DoCleaning()
	local _config = p1._config
	local _camera = p1._camera
	Lighting:SetAttribute("CSR_CutscenePlaying", true)
	p1._savedCameraType = _camera.CameraType
	p1._savedCFrame = _camera.CFrame
	p1._savedCameraSubject = _camera.CameraSubject
	_camera.CameraType = Enum.CameraType.Scriptable
	p1._savedScreenGroups = v6.GetOpenScreenGroups()
	v6.OpenScreenGroup("Cutscenes", {
		ScreenLayer = 10,
		CloseAllScreens = true,
		FullScreen = _config.CloseUI,
		DisableControls = _config.DisableControls
	})
	for k, v in pairs({ p1.TopCinematicFrame, p1.BottomCinematicFrame }) do
		if v then
			local v1 = v6.FindElement(v, "CinematicBar")
			if v1 then
				v.Visible = _config.CinematicBars
				local v2 = _config.CinematicBars and UDim2.new(0.5, 0, 0, 0) or (v == p1.TopCinematicFrame and UDim2.new(0.5, 0, -1, 0) or UDim2.new(0.5, 0, 1, 0))
				TweenService:Create(v1, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					Position = v2
				}):Play()
			end
		end
	end
	if _config.ImmersiveEffectGroup then
		v7.setEffect(_config.ImmersiveEffectGroup, true)
	end
	local _cameraBone = p1._cameraBone
	if _cameraBone then
		p1._lastAnimCFrame = _camera.CFrame
		RunService:BindToRenderStep("CutsceneRunner_Camera", Enum.RenderPriority.Camera.Value + 1, function() --[[ Line: 570 | Upvalues: p1 (copy), _cameraBone (copy), _camera (copy) ]]
			if p1._stopped then
				return
			end
			if not p1._track.IsPlaying then
				p1:Stop()
				return
			end
			if not (_cameraBone and _cameraBone.Parent) then
				return
			end
			p1._lastAnimCFrame = _cameraBone.TransformedWorldCFrame
			_camera.CFrame = p1._lastAnimCFrame
		end)
		p1._maid:GiveTask(function() --[[ Line: 583 | Upvalues: RunService (ref) ]]
			RunService:UnbindFromRenderStep("CutsceneRunner_Camera")
		end)
	end
	p1._track:Play()
	if p1._initCallback then
		p1._initCallback(p1)
	end
	v13 = p1
	v11:GiveTask(p1)
	return p1
end
function t.GetActiveCutscene() --[[ GetActiveCutscene | Line: 611 | Upvalues: v13 (ref) ]]
	return v13
end
function t.IsPlaying() --[[ IsPlaying | Line: 619 | Upvalues: v13 (ref) ]]
	return v13 ~= nil
end
function t.Stop(p1) --[[ Stop | Line: 631 | Upvalues: RunService (copy), v7 (copy), v11 (copy), TweenService (copy), v6 (copy), Lighting (copy), v12 (copy), v13 (ref) ]]
	if p1._stopped then
		return
	end
	p1._stopped = true
	local _config = p1._config
	local _camera = p1._camera
	RunService:UnbindFromRenderStep("CutsceneRunner_Camera")
	local v1 = p1._lastAnimCFrame or _camera.CFrame
	_camera.CFrame = v1
	if p1._track and p1._track.IsPlaying then
		p1._track:Stop(0)
	end
	if _config.ImmersiveEffectGroup then
		v7.setEffect(_config.ImmersiveEffectGroup, false)
	end
	for v2, v3 in p1._particleSets do
		for v4, v5 in v3 do
			v5:Enable(false)
		end
	end
	for v62, v72 in p1._activeMarkerSounds do
		if v72 and v72.Parent then
			v72:Stop()
		end
	end
	for v8, v9 in p1._sounds do
		if v9 and (v9.Parent and v9.IsPlaying) then
			v9:Stop()
		end
	end
	local _rig = p1._rig
	if _rig and _config.DestroyRigOnEnd then
		if _config.RigCleanupDelay and _config.RigCleanupDelay > 0 then
			local v10 = task.delay(_config.RigCleanupDelay, function() --[[ Line: 683 | Upvalues: _rig (copy) ]]
				if not (_rig and _rig.Parent) then
					return
				end
				_rig:Destroy()
			end)
			v11:GiveTask(function() --[[ Line: 688 | Upvalues: v10 (copy) ]]
				pcall(function() --[[ Line: 689 | Upvalues: v10 (ref) ]]
					task.cancel(v10)
				end)
			end)
		else
			_rig:Destroy()
		end
	elseif _rig and p1._rigIsCloned then
		_rig:Destroy()
	end
	if _config.RestoreCamera and (_camera and v1) then
		_camera.CFrame = v1
		local v112 = TweenService:Create(_camera, TweenInfo.new(1.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			CFrame = p1._savedCFrame
		})
		v112:Play()
		v112.Completed:Wait()
		_camera.CameraType = p1._savedCameraType
		if p1._savedCameraSubject then
			_camera.CameraSubject = p1._savedCameraSubject
		end
	end
	v6.CloseScreenGroup("Cutscenes", {
		OpenDefaultGroup = false
	})
	if _config.RestoreUI and p1._savedScreenGroups then
		for v122, v132 in p1._savedScreenGroups do
			v6.OpenScreenGroup(v132)
		end
	end
	Lighting:SetAttribute("CSR_CutscenePlaying", nil)
	if p1._destroyCallback then
		p1._destroyCallback(p1)
	end
	v12:Fire()
	if v13 == p1 then
		v13 = nil
	end
	if p1._maid then
		p1._maid:DoCleaning()
		p1._maid = nil
	end
	table.clear(p1)
	setmetatable(p1, nil)
end
t.Destroy = t.Stop
function t.Init(p1) --[[ Init | Line: 759 | Upvalues: v6 (copy) ]]
	if not p1.Initialized then
		p1.Initialized = true
		v6.AddComponent("GuiScreen", {
			Name = "Cutscene",
			Tag = "GuiScreen_Cutscene",
			TweenStyle = false,
			Groups = { "Cutscenes" },
			Init = function(p12) --[[ Init | Line: 772 | Upvalues: p1 (copy), v6 (ref) ]]
				p1.TopCinematicFrame = v6.FindElement(p12.Instance, "TopCinematicFrame")
				p1.BottomCinematicFrame = v6.FindElement(p12.Instance, "BottomCinematicFrame")
			end
		})
	end
end
t:Init()
return t