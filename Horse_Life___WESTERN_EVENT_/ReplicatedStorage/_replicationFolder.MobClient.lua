-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local MaterialService = game:GetService("MaterialService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("Binder")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("AnimationUtils")
local v6 = Sonar("ModelUtils")
local v7 = Sonar("CharacterData")
local v8 = Sonar("Octree")
local v9 = Sonar("SoundService")
local v10 = Sonar("Signal")
local v11 = Sonar("ParticleSet")
local v12 = v4.Get("Mobs")
local v13 = v4.Get("MobVariations")
local v14 = v4.GetConfig("Mob")()
local t2 = {}
local v15 = v8.new("Mobs", 4, 512)
local v16 = RaycastParams.new()
v16.IncludeInstances = { workspace.Terrain }
local FootprintFolder = workspace:FindFirstChild("FootprintFolder")
if not FootprintFolder then
	FootprintFolder = Instance.new("Folder", workspace)
	FootprintFolder.Name = "FootprintFolder"
end
local function isNeck(p1) --[[ isNeck | Line: 49 ]]
	local v1 = p1:lower()
	local v2 = v1 == "neck"
	local v3
	if v2 then
		v3 = v2
	else
		local v4
		if v1:sub(0, 1) == "n" then
			v3 = tonumber(v1:sub(2))
			if not v3 then
				v4 = v1
				v3 = v1 == "head"
			end
		else
			v4 = v1
			v3 = v1 == "head"
		end
	end
	return v3
end
function t._updateCFrame(p1, p2) --[[ _updateCFrame | Line: 63 | Upvalues: v16 (copy) ]]
	local LastCFrame = p1.LastCFrame
	if not LastCFrame then
		return
	end
	if p1.Data.Offset then
		if typeof(p1.Data.Offset) == "function" then
			LastCFrame = LastCFrame * CFrame.new(p1.Data.Offset(p1) or Vector3.new(0, 0, 0))
		elseif typeof(p1.Data.Offset) == "Vector3" then
			LastCFrame = LastCFrame * CFrame.new(p1.Data.Offset)
		end
	end
	local Position = LastCFrame.Position
	local v2 = -LastCFrame.LookVector
	local RightVector = LastCFrame.RightVector
	local v3 = p1.ModelSize.X * 0.4
	local v5 = Vector3.new(0, -p1.ModelSize.Y * 1.5, 0)
	local v6 = workspace:Raycast(Position + v2 * v3 + RightVector * v3, v5, v16)
	local v7 = workspace:Raycast(Position - v2 * v3 - RightVector * v3, v5, v16)
	if p1._footstepSound then
		if v6 then
			p1._cachedFrontRightHit = v6.Position
			p1._cachedFrontRightNormal = v6.Normal
			local Color = v6.Instance.Color
			if v6.Instance == workspace.Terrain then
				local v8, v9 = pcall(function() --[[ Line: 96 | Upvalues: v6 (copy) ]]
					return workspace.Terrain:GetMaterialColor(v6.Material)
				end)
				if v8 then
					Color = v9
				end
			end
			p1._cachedFrontRightColor = Color
		end
		if v7 then
			p1._cachedBackLeftHit = v7.Position
			p1._cachedBackLeftNormal = v7.Normal
			local Color = v7.Instance.Color
			if v7.Instance == workspace.Terrain then
				local v10, v11 = pcall(function() --[[ Line: 109 | Upvalues: v7 (copy) ]]
					return workspace.Terrain:GetMaterialColor(v7.Material)
				end)
				if v10 then
					Color = v11
				end
			end
			p1._cachedBackLeftColor = Color
		end
	end
	local v12 = Vector3.new(0, 1, 0)
	local sum
	if v6 and v7 then
		local Unit = (v6.Normal + v7.Normal).Unit
		local v13 = v6.Position - v7.Position
		local Unit_2 = (v13 - v13:Dot(Unit) * Unit).Unit
		local Unit_3 = (v2 - v2:Dot(Unit) * Unit).Unit.Unit
		local Unit_4 = Unit_2.Unit
		local Unit_5 = (Unit_4 - Unit_4:Dot(Unit_3) * Unit_3).Unit
		if Unit:Cross(Unit_3):Dot(Unit_5) < 0 then
			Unit_5 = -Unit_5
		end
		v12, sum = Unit, CFrame.fromMatrix(Position, Unit_5, Unit, Unit_3)
	else
		sum = LastCFrame
	end
	local v15 = p1.GroundOffset or 0
	if v15 ~= 0 then
		sum = sum + v12 * v15
	end
	local v162 = p1.Model:GetPivot()
	local v17 = not p1.LastModelCFrame
	if not p1.LastModelCFrame then
		p1.LastModelCFrame = v162
	end
	local v19 = v162:Lerp(sum, if v17 then 1 else p2 / (0.12 + p2))
	p1.Model:PivotTo(v19)
	p1.LastModelCFrame = v19
end
function t._initAnimations(p1) --[[ _initAnimations | Line: 162 | Upvalues: v5 (copy) ]]
	p1.AnimationController = p1.Model:FindFirstChild("AnimationController")
	p1.Animator = p1.AnimationController:FindFirstChild("Animator")
	p1.Animations = {}
	for v1, v2 in p1.Data.Animations do
		local v3 = v5.LoadAnimation(p1.Animator, v2.AnimationId, p1.Maid)
		if v2.Looped ~= nil then
			v3.Looped = v2.Looped
		end
		if v2.Priority then
			v3.Priority = v2.Priority
		end
		if v2.MarkerEvents then
			for v4, v52 in v2.MarkerEvents do
				p1.Maid:GiveTask(v3:GetMarkerReachedSignal(v52):Connect(function(p12) --[[ Line: 181 | Upvalues: p1 (copy), v1 (copy), v52 (copy) ]]
					p1.AnimationMarkerReached:Fire(v1, v52, p12)
				end))
			end
		end
		p1.Animations[v1] = v3
	end
end
function t._resolveFootstepSound(p1) --[[ _resolveFootstepSound | Line: 196 | Upvalues: v14 (copy) ]]
	local FootstepType = v14.FootstepType
	if not FootstepType then
		return nil
	end
	if type(FootstepType) == "function" then
		return FootstepType(p1)
	else
		return nil
	end
end
function t._initAudioEmitter(p1) --[[ _initAudioEmitter | Line: 215 ]]
	p1._audioEmitter = Instance.new("AudioEmitter")
	p1._audioEmitter.Parent = p1.Root
	p1.Maid:GiveTask(p1._audioEmitter)
	p1._audioEmitterCache = {}
end
function t._getEmitterForSound(p1, p2) --[[ _getEmitterForSound | Line: 232 ]]
	local v1 = p1._audioEmitterCache[p2]
	if v1 then
		return v1
	end
	local v2 = p2:FindFirstChildWhichIsA("AudioEmitter")
	if v2 then
		local v3 = v2:Clone()
		v3.Parent = p1.Root
		p1.Maid:GiveTask(v3)
		p1._audioEmitterCache[p2] = v3
		return v3
	else
		return p1._audioEmitter
	end
end
function t._initFootsteps(p1) --[[ _initFootsteps | Line: 258 ]]
	p1._footstepSound = p1:_resolveFootstepSound()
	if p1._footstepSound then
		p1._footstepAssetName = p1.Data.Footstep or "MobPaw"
		p1._footprintBuffer = {}
		local t = {}
		p1.Maid:GiveTask(p1.Animator.AnimationPlayed:Connect(function(p12) --[[ Line: 270 | Upvalues: t (copy), p1 (copy) ]]
			if not t[p12] then
				t[p12] = true
				p12:GetMarkerReachedSignal("Footstep"):Connect(function(p12) --[[ Line: 274 | Upvalues: p1 (ref) ]]
					p1:_placeFootstep(p12)
				end)
			end
		end))
	end
end
function t._placeFootstep(p1, p2) --[[ _placeFootstep | Line: 287 ]]
	local _cachedFrontRightHit = p1._cachedFrontRightHit
	local _cachedBackLeftHit = p1._cachedBackLeftHit
	if not (_cachedFrontRightHit or _cachedBackLeftHit) then
		return
	end
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local v4 = p1.Model:FindFirstChild(p2, true)
	if v4 and (_cachedFrontRightHit and _cachedBackLeftHit) then
		local v5 = nil
		if v4:IsA("Bone") then
			v5 = v4.WorldPosition
		elseif v4:IsA("Motor6D") and v4.Part1 then
			v5 = v4.Part1.Position
		end
		if v5 and (v5 - _cachedFrontRightHit).Magnitude <= (v5 - _cachedBackLeftHit).Magnitude then
			v2 = p1._cachedFrontRightNormal
			v3 = p1._cachedFrontRightColor
			v1 = _cachedFrontRightHit
		elseif v5 then
			v2 = p1._cachedBackLeftNormal
			v3 = p1._cachedBackLeftColor
			v1 = _cachedBackLeftHit
		end
	end
	if not v1 and _cachedFrontRightHit then
		v2 = p1._cachedFrontRightNormal
		v3 = p1._cachedFrontRightColor
		v1 = _cachedFrontRightHit
	elseif not v1 and _cachedBackLeftHit then
		v2 = p1._cachedBackLeftNormal
		v3 = p1._cachedBackLeftColor
		v1 = _cachedBackLeftHit
	end
	if not (v1 and v2) then
		return
	end
	p1:_placeFootprint(v1, v2, if v3 then v3 else Color3.new(0.5, 0.5, 0.5))
end
function t._placeFootprint(p1, p2, p3, p4) --[[ _placeFootprint | Line: 349 | Upvalues: v4 (copy), v14 (copy), FootprintFolder (ref), v9 (copy) ]]
	if #p1._footprintBuffer >= 10 then
		local v1 = table.remove(p1._footprintBuffer, 1)
		if v1 and v1.Parent then
			v1:Destroy()
		end
	end
	local v2 = v4.GetAsset(p1._footstepAssetName, "Footsteps")():Clone()
	if not v14.IgnoreFootstepColor then
		v2.Color = p4:lerp(Color3.new(0.45098, 0.254902, 0.164706), 0.25)
	end
	local v3 = p1.Model:GetPivot()
	v2.CFrame = CFrame.fromMatrix(p2, v3.RightVector, p3, -v3.LookVector)
	v2.Anchored = true
	v2.CanCollide = false
	v2.CanQuery = false
	v2.CanTouch = false
	v2.CastShadow = false
	local Particle = v2:FindFirstChild("Particle")
	if Particle then
		Particle:Emit(1)
	end
	v2.Parent = FootprintFolder
	if p1._footstepSound then
		local v42 = v14.FootstepProperties and v14.FootstepProperties(p1, p1._footstepSound) or {}
		v42.PlaybackSpeed = p1._footstepSound.PlaybackSpeed * Random.new():NextNumber(0.7, 1.3)
		v42.Emitter = p1:_getEmitterForSound(p1._footstepSound)
		v42.Parent = p1.Root
		v9.playSound3D(p1._footstepSound, v42)
	end
	table.insert(p1._footprintBuffer, v2)
end
function t._initHeadTracking(p1) --[[ _initHeadTracking | Line: 397 | Upvalues: v14 (copy), RunService (copy) ]]
	local HeadTracking = v14.HeadTracking
	if not HeadTracking then
		return
	end
	p1._headTrackingEnabled = true
	p1._headTrackingGetTarget = if type(HeadTracking) == "function" and HeadTracking then HeadTracking else nil
	p1._neckJoints = {}
	p1._lastHeadHorizontal = 0
	p1._lastHeadVertical = 0
	for v3, v4 in p1.Model:GetDescendants() do
		local v2
		if v4:IsA("Motor6D") or v4:IsA("Bone") then
			local v5 = v4.Name
			local v6 = v5:lower()
			local v7 = if v6 == "neck" then true else false
			if v7 then
				v2 = v7
			else
				local v8
				if v6:sub(0, 1) == "n" then
					local v9 = tonumber(v6:sub(2))
					if v9 then
						v2 = v9
					else
						v8 = v6
						v2 = if v6 == "head" then true else false
					end
				else
					v8 = v6
					v2 = if v6 == "head" then true else false
				end
			end
			if not v2 and (v5:sub(0, 2) == "LN" or v5:sub(0, 2) == "RN") then
				v2 = tonumber(v5:sub(3))
			end
			if v2 then
				table.insert(p1._neckJoints, { v4, v4.Transform })
			end
		end
	end
	if #p1._neckJoints == 0 then
		p1._headTrackingEnabled = false
	else
		p1.Maid:GiveTask(RunService.Stepped:Connect(function() --[[ Line: 433 | Upvalues: p1 (copy) ]]
			p1:_updateHeadTracking()
		end))
	end
end
function t._updateHeadTracking(p1) --[[ _updateHeadTracking | Line: 446 ]]
	if not p1._headTrackingEnabled then
		return
	end
	local v1 = if p1._headTrackingGetTarget then p1._headTrackingGetTarget(p1) else nil
	local v3 = #p1._neckJoints
	if v1 then
		local Unit = p1.Root.CFrame:PointToObjectSpace(v1).Unit
		local v6 = math.clamp(-math.atan2(Unit.X, -Unit.Z), -1.5707963267948966, 1.5707963267948966)
		local v8 = math.clamp(math.asin(Unit.Y), -1.5707963267948966, 1.5707963267948966)
		p1._lastHeadHorizontal = p1._lastHeadHorizontal + (v6 - p1._lastHeadHorizontal) * 0.075
		p1._lastHeadVertical = p1._lastHeadVertical + (v8 - p1._lastHeadVertical) * 0.075
	else
		p1._lastHeadHorizontal = p1._lastHeadHorizontal * 0.925
		p1._lastHeadVertical = p1._lastHeadVertical * 0.925
		if math.abs(p1._lastHeadHorizontal) < 0.001 and math.abs(p1._lastHeadVertical) < 0.001 then
			return
		end
	end
	local v11 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), p1._lastHeadHorizontal / v3)
	local v13 = CFrame.fromAxisAngle(v11:VectorToWorldSpace(p1.Root.CFrame.RightVector), p1._lastHeadVertical / v3) * v11
	for v14, v15 in p1._neckJoints do
		local v16 = v15[1]
		local v17 = v16.Parent
		if v17 then
			local v18 = v16:IsA("Bone") and v16.WorldCFrame or v17.WorldCFrame
			local v19 = v18 - v18.Position
			v16.Transform = v16.Transform * (v19:Inverse() * v13 * v19)
		end
	end
end
function t._resolveScaleMultiplier(p1) --[[ _resolveScaleMultiplier | Line: 497 ]]
	local v1 = p1.BaseScale or 1
	local v2 = p1.CharacterData:Get("ScaleIncrease") or 0
	if type(v2) ~= "number" then
		return v1
	end
	if v2 > 1 then
		return v1 * (1 + v2 / 100)
	end
	if v2 < 0 then
		return v1
	else
		return v1 * (1 + v2)
	end
end
function t._applyScale(p1) --[[ _applyScale | Line: 517 ]]
	if not p1.Model then
		return
	end
	p1.Model:ScaleTo(p1:_resolveScaleMultiplier())
	local _, v1 = p1.Model:GetBoundingBox()
	if not p1.BaseModelSize then
		p1.BaseModelSize = v1
	end
	p1.ModelSize = v1
	p1.GroundOffset = (p1.ModelSize.Y - p1.BaseModelSize.Y) * 1
end
function t._restoreVariationVisualAdjustments(p1) --[[ _restoreVariationVisualAdjustments | Line: 534 ]]
	if not p1._variationVisualOriginals then
		return
	end
	for v1, v2 in p1._variationVisualOriginals do
		if v1 and (v1.Parent and v2) then
			v1.Color = v2.Color
			v1.Material = v2.Material
			v1.MaterialVariant = v2.MaterialVariant
			v1.Reflectance = v2.Reflectance
			v1.Transparency = v2.Transparency
			if v1:IsA("MeshPart") and v2.TextureID ~= nil then
				v1.TextureID = v2.TextureID
			end
		end
	end
	p1._variationVisualOriginals = {}
end
function t._applyVariationColorAdjustments(p1, p2) --[[ _applyVariationColorAdjustments | Line: 557 | Upvalues: MaterialService (copy) ]]
	if type(p2) ~= "table" then
		return
	end
	local v1 = p1.Model:GetDescendants()
	p1._variationVisualOriginals = p1._variationVisualOriginals or {}
	for v3, v4 in p2 do
		if type(v4) == "table" then
			for v5, v6 in v1 do
				if v6:IsA("BasePart") and (not v3 or v6:HasTag(v3)) then
					if not p1._variationVisualOriginals[v6] then
						local t = {
							Color = v6.Color,
							Material = v6.Material,
							MaterialVariant = v6.MaterialVariant,
							Reflectance = v6.Reflectance,
							Transparency = v6.Transparency
						}
						t.TextureID = v6:IsA("MeshPart") and v6.TextureID or nil
						p1._variationVisualOriginals[v6] = t
					end
					if v4.Color then
						v6.Color = v4.Color
					end
					if v4.Material then
						if typeof(v4.Material) == "EnumItem" then
							v6.Material = v4.Material
						elseif type(v4.Material) == "string" and Enum.Material[v4.Material] then
							v6.Material = Enum.Material[v4.Material]
						end
					end
					if v4.MaterialVariant then
						local v8 = MaterialService:FindFirstChild(v4.MaterialVariant, true)
						if v8 then
							v6.Material = v8.BaseMaterial
							v6.MaterialVariant = v4.MaterialVariant
						end
					end
					if type(v4.Reflectance) == "number" then
						v6.Reflectance = v4.Reflectance
					end
					if type(v4.Transparency) == "number" then
						v6.Transparency = v4.Transparency
					end
					if (v4.Material or (v4.MaterialVariant or v4.Color)) and v6:IsA("MeshPart") then
						v6.TextureID = ""
					end
				end
			end
		end
	end
end
function t._applyVariationVisualAdjustments(p1) --[[ _applyVariationVisualAdjustments | Line: 639 | Upvalues: v1 (copy), HttpService (copy), v13 (copy), v11 (copy) ]]
	if not p1.Model then
		return
	end
	if p1.VariationVisualMaid then
		p1.VariationVisualMaid:DoCleaning()
	else
		p1.VariationVisualMaid = v1.new()
		p1.Maid:GiveTask(p1.VariationVisualMaid)
	end
	p1:_restoreVariationVisualAdjustments()
	local v12 = p1.CharacterData:Get("MobVariationNames")
	if type(v12) ~= "string" or v12 == "" then
		return
	end
	local v2, v3 = pcall(function() --[[ Line: 658 | Upvalues: HttpService (ref), v12 (copy) ]]
		return HttpService:JSONDecode(v12)
	end)
	if not v2 or type(v3) ~= "table" then
		return
	end
	local v4 = v13 and v13()
	if type(v4) ~= "table" then
		return
	end
	for v5, v6 in v3 do
		local v7 = v4[v6]
		local v8 = if v7 then v7.VisualAdjustments else v7
		if type(v8) == "table" then
			local ParticleSet = v8.ParticleSet
			if type(ParticleSet) == "string" and ParticleSet ~= "" then
				local v9 = v11.new(ParticleSet, p1.Root)
				if v9 then
					p1.VariationVisualMaid:GiveTask(v9)
					v9:Enable(true)
				end
			end
			p1:_applyVariationColorAdjustments(v8.ColorAdjustments)
		end
	end
end
function t._init(p1) --[[ _init | Line: 691 | Upvalues: v6 (copy), v10 (copy), Sonar (copy), v1 (copy), RunService (copy) ]]
	p1.Model = p1.Data.GetModelAsync():Clone()
	p1.BaseScale = p1.Data.Stats.Scale or 1
	p1:_applyScale()
	v6.SetModelProp(p1.Model, "CanCollide", false)
	p1.Model:PivotTo(CFrame.new(10000, 10000, 10000))
	p1.Model.Parent = workspace
	p1.Maid:GiveTask(p1.Model)
	p1.Root = p1.Model.PrimaryPart
	p1.RootPart = p1.Root
	local HumanoidRootPart = p1.Model:WaitForChild("HumanoidRootPart")
	if HumanoidRootPart then
		p1.HumanoidRootPart = HumanoidRootPart
		p1.HumanoidRootPart.Anchored = true
	end
	p1.AnimationPlaying = v10.new()
	p1.Maid:GiveTask(p1.AnimationPlaying)
	p1.AnimationMarkerReached = v10.new()
	p1.Maid:GiveTask(p1.AnimationMarkerReached)
	local v12 = Sonar(p1.Data.SubClass)
	p1.StateData = v12.States
	p1.SubClass = v12.new(p1)
	p1.Maid:GiveTask(p1.SubClass)
	p1.StateMaid = v1.new()
	p1.Maid:GiveTask(p1.StateMaid)
	p1:_initAudioEmitter()
	p1:_initAnimations()
	p1:_initFootsteps()
	p1:_initHeadTracking()
	p1.Maid:GiveTask(p1.Remote.OnClientEvent:Connect(function(p12) --[[ Line: 728 | Upvalues: p1 (copy) ]]
		p1.LastCFrame = p12
	end))
	if p1.SubClass._postInit then
		p1.SubClass:_postInit()
	end
	for v2, v3 in p1.StateData do
		if v3.OnClientInit then
			v3.OnClientInit(p1.SubClass)
		end
	end
	p1.Maid:GiveTask(p1.CharacterData:GetStatChangedSignal("State"):Connect(function() --[[ Line: 742 | Upvalues: p1 (copy) ]]
		p1:SetState(p1.CharacterData:Get("State"))
	end))
	p1.Maid:GiveTask(p1.CharacterData:GetStatChangedSignal("ScaleIncrease"):Connect(function() --[[ Line: 745 | Upvalues: p1 (copy) ]]
		p1:_applyScale()
	end))
	p1.Maid:GiveTask(p1.CharacterData:GetStatChangedSignal("MobVariationNames"):Connect(function() --[[ Line: 748 | Upvalues: p1 (copy) ]]
		p1:_applyVariationVisualAdjustments()
	end))
	p1:_applyVariationVisualAdjustments()
	p1:SetState(p1.CharacterData:Get("State"))
	p1.Maid:GiveTask(RunService.Heartbeat:Connect(function(p12) --[[ Line: 755 | Upvalues: p1 (copy) ]]
		p1:Tick(p12)
	end))
end
function t.__index(p1, p2) --[[ __index | Line: 761 | Upvalues: t (copy) ]]
	local v1 = t[p2]
	if v1 ~= nil then
		return v1
	end
	local v2 = rawget(p1, "SubClass")
	if v2 then
		return v2[p2]
	else
		return nil
	end
end
function t.new(p1) --[[ new | Line: 776 | Upvalues: t (copy), v1 (copy), v7 (copy), v12 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Instance = p1
	v2.Remote = p1:WaitForChild("Remote")
	v2.CharacterData = v7.new({
		Model = v2.Instance,
		CurrentCharacter = v2
	})
	v2.Maid:GiveTask(v2.CharacterData)
	v2.Type = v2.CharacterData:Get("Type")
	v2.Data = v12()[v2.Type]
	v2:_init()
	t2[v2.Instance] = v2
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 800 | Upvalues: t2 (copy), v15 (copy), v2 (copy) ]]
	if p1._footprintBuffer then
		for v1, v22 in p1._footprintBuffer do
			if v22 and v22.Parent then
				v22:Destroy()
			end
		end
	end
	t2[p1.Instance] = nil
	v15:Remove(p1)
	v2(p1)
end
function t.GetDistanceTo(p1, p2) --[[ GetDistanceTo | Line: 816 ]]
	return (p1.Model:GetPivot().Position - p2).Magnitude
end
function t.SetState(p1, p2) --[[ SetState | Line: 821 | Upvalues: v14 (copy), v9 (copy) ]]
	local State = p1.State
	p1.State = p2
	if State == p2 then
		return
	end
	if State and p1.StateData[State].OnClientExit then
		p1.StateData[State].OnClientExit(p1.SubClass, p2)
	end
	p1.StateMaid:DoCleaning()
	if p1.State and p1.StateData[p1.State].OnClientEnter then
		p1.StateData[p1.State].OnClientEnter(p1.SubClass, State)
	end
	if v14.AggroSound then
		local v1 = v14.AggroSound(p1, State)
		if v1 then
			v9.playSound3D(v1, {
				Emitter = p1:_getEmitterForSound(v1),
				Parent = p1.Root
			})
		end
	end
	if not v14.OnStateChanged then
		return
	end
	v14.OnStateChanged(p1, State)
end
function t.Get(p1, ...) --[[ Get | Line: 855 ]]
	return p1.CharacterData:GetWithModifiers(...)
end
function t.GetStatChangedSignal(p1, p2) --[[ GetStatChangedSignal | Line: 860 ]]
	return p1.CharacterData:GetStatChangedSignal(p2)
end
function t.PlayAnimation(p1, p2, p3, p4) --[[ PlayAnimation | Line: 865 ]]
	local v1 = p1.Animations[p2]
	if not v1 then
		return
	end
	if v1.IsPlaying then
		return
	end
	v1:Play(p3 or 0.2, nil, if p4 then p4 else p1.Data.Animations[p2].Speed or 1)
	p1.AnimationPlaying:Fire(p2)
end
function t.GetAnimationLength(p1, p2) --[[ GetAnimationLength | Line: 883 ]]
	local v1 = p1.Animations[p2]
	if v1 then
		return v1.Length or 0
	else
		return 0
	end
end
function t.StopAnimation(p1, p2, p3) --[[ StopAnimation | Line: 892 ]]
	local v1 = p1.Animations[p2]
	if not v1 then
		return
	end
	if v1.IsPlaying then
		v1:Stop(p3 or 0.2)
	end
end
function t.StopAllAnimations(p1, p2, p3) --[[ StopAllAnimations | Line: 906 ]]
	for v1, v2 in p1.Animations do
		if v1 ~= p3 then
			v2:Stop(p2 or 0.2)
		end
	end
end
function t.Tick(p1, p2) --[[ Tick | Line: 917 | Upvalues: v15 (copy), v14 (copy) ]]
	p1:_updateCFrame(p2)
	local Position = p1.Model:GetPivot().Position
	if p1._lastTickPosition then
		local v1 = Position - p1._lastTickPosition
		local v2 = Vector3.new(v1.X, 0, v1.Z).Magnitude / p2
		p1.FlatSpeed = p1.FlatSpeed + (v2 - p1.FlatSpeed) * math.min(p2 * 10, 1)
	else
		p1.FlatSpeed = 0
	end
	p1._lastTickPosition = Position
	if tick() - (p1.LastOctreeUpdate or 0) > 1 then
		v15:UpdateFor(p1, p1.Model:GetPivot().Position)
		p1.LastOctreeUpdate = tick()
	end
	if v14.OnClientTick then
		v14.OnClientTick(p1, p2)
	end
	if p1.State and p1.StateData[p1.State].OnClientTick then
		p1.StateData[p1.State].OnClientTick(p1.SubClass, p2)
	end
	if p1.SubClass.OnClientTick then
		p1.SubClass:OnClientTick(p2)
	end
	if not v14.OnHeartbeat then
		return
	end
	v14.OnHeartbeat(p1, p2)
end
function t.GetClosestMob(p1, p2) --[[ GetClosestMob | Line: 957 | Upvalues: v15 (copy) ]]
	return v15:GetNearestWithMax(p1, 1, p2 or (1 / 0))[1]
end
function t.GetAll() --[[ GetAll | Line: 962 | Upvalues: t2 (copy) ]]
	return t2
end
function t.Init(p1) --[[ Init | Line: 967 | Upvalues: v3 (copy), t (copy) ]]
	v3.new("Mob", t):Init()
end
t:Init()
return t