-- https://lua.expert/
local v1 = Color3.new(255/255, 255/255, 255/255)
local v2 = NumberSequence.new(10)
local v3 = NumberRange.new(0.8)
local v4 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 5.33, 2.75), NumberSequenceKeypoint.new(1, 5.33, 2.75) })
local v5 = NumberRange.new(0.8)
local v6 = NumberRange.new(0, 360)
local v7 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.4, 3), NumberSequenceKeypoint.new(1, 0) })
local v8 = NumberRange.new(0.1, 0.15)
local v9 = NumberRange.new(0, 360)
local v10 = Vector2.new(10, 10)
local t = {
	None = 0,
	Whitelist = 1,
	Blacklist = 2,
	Function = 3
}
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local v11 = Instance.new("NumberValue")
v11.Value = 1
local None = t.None
local v12 = Vector3.new
local v13 = NumberSequenceKeypoint.new(0, 1, 0)
local v14 = NumberSequenceKeypoint.new(1, 1, 0)
local t2 = {}
local v15 = 0
local v16 = 1
local v17 = 1
local v18 = 0
local v19 = 0
local v20 = Vector3.new(0, -1, 0)
local v21 = nil
local v22 = true
local v23 = nil
local v24 = nil
local t3 = {}
for k, v in pairs({
	Vector3.new(0.14142136, 0, 0.14142136),
	Vector3.new(-0.14142136, 0, 0.14142136),
	Vector3.new(-0.14142136, 0, -0.14142136),
	Vector3.new(0.14142136, 0, -0.14142136),
	Vector3.new(0.4, 0, 0),
	Vector3.new(0.28284273, 0, 0.28284273),
	Vector3.new(0.000000000000000024492937, 0, 0.4),
	Vector3.new(-0.28284273, 0, 0.28284273),
	Vector3.new(-0.4, 0, 0.000000000000000048985874),
	Vector3.new(-0.28284273, 0, -0.28284273),
	Vector3.new(-0.000000000000000073478805, 0, -0.4),
	Vector3.new(0.28284273, 0, -0.28284273),
	Vector3.new(0.6, 0, 0),
	Vector3.new(0.4854102, 0, 0.35267115),
	Vector3.new(0.1854102, 0, 0.57063395),
	Vector3.new(-0.1854102, 0, 0.57063395),
	Vector3.new(-0.4854102, 0, 0.35267115),
	Vector3.new(-0.6, 0, 0.00000000000000007347881),
	Vector3.new(-0.4854102, 0, -0.35267115),
	Vector3.new(-0.1854102, 0, -0.57063395),
	Vector3.new(0.1854102, 0, -0.57063395),
	Vector3.new(0.4854102, 0, -0.35267115),
	Vector3.new(0.77274066, 0, 0.20705524),
	Vector3.new(0.56568545, 0, 0.56568545),
	Vector3.new(0.20705524, 0, 0.77274066),
	Vector3.new(-0.20705524, 0, 0.77274066),
	Vector3.new(-0.56568545, 0, 0.56568545),
	Vector3.new(-0.77274066, 0, 0.20705524),
	Vector3.new(-0.77274066, 0, -0.20705524),
	Vector3.new(-0.56568545, 0, -0.56568545),
	Vector3.new(-0.20705524, 0, -0.77274066),
	Vector3.new(0.20705524, 0, -0.77274066),
	Vector3.new(0.56568545, 0, -0.56568545),
	Vector3.new(0.77274066, 0, -0.20705524)
}) do
	table.insert(t2, v * 35)
end
table.sort(t2, function(p1, p2) --[[ Line: 269 ]]
	return p1.magnitude < p2.magnitude
end)
Sound = game.ReplicatedStorage.LibraryResources.SoundFXResources.SoundFXFolder.Rain
local __RainEmitter = Instance.new("Part")
__RainEmitter.Transparency = 1
__RainEmitter.Anchored = true
__RainEmitter.CanCollide = false
__RainEmitter.Locked = true
__RainEmitter.Archivable = false
__RainEmitter.TopSurface = Enum.SurfaceType.Smooth
__RainEmitter.BottomSurface = Enum.SurfaceType.Smooth
__RainEmitter.Name = "__RainEmitter"
__RainEmitter.CanTouch = false
__RainEmitter.CanQuery = false
__RainEmitter.Size = Vector3.new(0.05, 0.05, 0.05)
__RainEmitter.Archivable = false
local RainStraight = Instance.new("ParticleEmitter")
RainStraight.Name = "RainStraight"
RainStraight.LightEmission = 0.05
RainStraight.LightInfluence = 0.9
RainStraight.Size = v2
RainStraight.Texture = "rbxassetid://1822883048"
RainStraight.LockedToPart = true
RainStraight.Enabled = false
RainStraight.Lifetime = v3
RainStraight.Rate = 600
RainStraight.Speed = NumberRange.new(60)
RainStraight.EmissionDirection = Enum.NormalId.Bottom
RainStraight.Parent = __RainEmitter
RainStraight.Orientation = Enum.ParticleOrientation.FacingCameraWorldUp
local RainTopDown = Instance.new("ParticleEmitter")
RainTopDown.Name = "RainTopDown"
RainTopDown.LightEmission = 0.05
RainTopDown.LightInfluence = 0.9
RainTopDown.Size = v4
RainTopDown.Texture = "rbxassetid://1822856633"
RainTopDown.LockedToPart = true
RainTopDown.Enabled = false
RainTopDown.Rotation = v6
RainTopDown.Lifetime = v5
RainTopDown.Rate = 600
RainTopDown.Speed = NumberRange.new(60)
RainTopDown.EmissionDirection = Enum.NormalId.Bottom
RainTopDown.Parent = __RainEmitter
local t4 = {}
local t5 = {}
for i = 1, 20 do
	local __RainSplashAttachment = Instance.new("Attachment")
	__RainSplashAttachment.Name = "__RainSplashAttachment"
	local RainSplash = Instance.new("ParticleEmitter")
	RainSplash.LightEmission = 0.05
	RainSplash.LightInfluence = 0.9
	RainSplash.Size = v7
	RainSplash.Texture = "rbxassetid://1822856633"
	RainSplash.Rotation = v9
	RainSplash.Lifetime = v8
	RainSplash.Transparency = NumberSequence.new({
		v13,
		NumberSequenceKeypoint.new(0.25, 0.6, 0),
		NumberSequenceKeypoint.new(0.75, 0.6, 0),
		v14
	})
	RainSplash.Enabled = false
	RainSplash.Rate = 0
	RainSplash.Speed = NumberRange.new(0)
	RainSplash.Name = "RainSplash"
	RainSplash.Parent = __RainSplashAttachment
	__RainSplashAttachment.Archivable = false
	table.insert(t4, __RainSplashAttachment)
	local __RainOccludedAttachment = Instance.new("Attachment")
	__RainOccludedAttachment.Name = "__RainOccludedAttachment"
	local v25 = __RainEmitter.RainStraight:Clone()
	v25.Speed = NumberRange.new(70, 100)
	v25.SpreadAngle = v10
	v25.LockedToPart = false
	v25.Enabled = false
	v25.Parent = __RainOccludedAttachment
	local v26 = __RainEmitter.RainTopDown:Clone()
	v26.Speed = NumberRange.new(70, 100)
	v26.SpreadAngle = v10
	v26.LockedToPart = false
	v26.Enabled = false
	v26.Parent = __RainOccludedAttachment
	__RainOccludedAttachment.Archivable = false
	table.insert(t5, __RainOccludedAttachment)
end
local t6 = { __RainEmitter }
local t7 = {
	[t.None] = function(p1, p2) --[[ Line: 397 | Upvalues: __RainEmitter (ref), Players (copy), t6 (copy) ]]
		local v1 = workspace
		local v2
		if p2 then
			v2 = {}
			v2[1] = __RainEmitter
			v2[2] = Players.LocalPlayer and Players.LocalPlayer.Character
			if v2 then
			else
				v2 = t6
			end
		else
			v2 = t6
		end
		return v1:FindPartOnRayWithIgnoreList(p1, v2)
	end,
	[t.Blacklist] = function(p1) --[[ Line: 400 | Upvalues: v23 (ref) ]]
		return workspace:FindPartOnRayWithIgnoreList(p1, v23)
	end,
	[t.Whitelist] = function(p1) --[[ Line: 403 | Upvalues: v23 (ref) ]]
		return workspace:FindPartOnRayWithWhitelist(p1, v23)
	end,
	[t.Function] = function(p1) --[[ Line: 406 | Upvalues: t6 (copy), v24 (ref) ]]
		local v1 = p1.Origin + p1.Direction
		while p1.Direction.magnitude > 0.001 do
			local v2, v3, v4, v5 = workspace:FindPartOnRayWithIgnoreList(p1, t6)
			if not v2 or v24(v2) then
				return v2, v3, v4, v5
			end
			local v6 = v3 + p1.Direction.Unit * 0.001
			p1 = Ray.new(v6, v1 - v6)
		end
	end
}
local v27 = t7[None]
local function connectLoop() --[[ connectLoop | Line: 421 | Upvalues: t3 (ref), RunService (copy), v27 (ref), v20 (ref), v21 (ref), v15 (ref), v22 (ref), TweenService (copy), __RainEmitter (ref), v12 (copy), v13 (copy), v16 (ref), v14 (copy), v17 (ref), t5 (ref), t2 (copy), v18 (ref), t4 (ref), v19 (ref) ]]
	local v1 = Random.new()
	local v2 = true
	local v3 = 6
	local function f5() --[[ Line: 429 | Upvalues: v27 (ref), v20 (ref), v21 (ref), v15 (ref), v22 (ref), TweenService (ref), v3 (ref), __RainEmitter (ref), v12 (ref), v2 (ref) ]]
		local v1, _ = v27(Ray.new(workspace.CurrentCamera.CFrame.p, -v20 * 1000), true)
		if v21 and not (workspace.CurrentCamera.CFrame.p.y <= v21) or v1 then
			__RainEmitter.RainStraight.Enabled = false
			__RainEmitter.RainTopDown.Enabled = false
			v2 = true
			return
		end
		if v15 < 1 and not v22 then
			v15 = 0.7
			TweenService:Create(Sound, TweenInfo.new(0.5), {
				Volume = 0.7
			}):Play()
		end
		v3 = 6
		local v32 = math.abs((workspace.CurrentCamera.CFrame.lookVector:Dot(v20)))
		local p = workspace.CurrentCamera.CFrame.p
		local v4 = workspace.CurrentCamera.CFrame.lookVector:Cross(-v20)
		local v5 = v4.magnitude > 0.001 and v4.unit or -v20
		local unit = v20:Cross(v5).unit
		__RainEmitter.Size = v12(40, 40, (1 - v32) * 60 + 40)
		__RainEmitter.CFrame = CFrame.new(p.x, p.y, p.z, v5.x, -v20.x, unit.x, v5.y, -v20.y, unit.y, v5.z, -v20.z, unit.z) + (1 - v32) * workspace.CurrentCamera.CFrame.lookVector * __RainEmitter.Size.Z / 3 - v32 * v20 * 20
		__RainEmitter.RainStraight.Enabled = true
		__RainEmitter.RainTopDown.Enabled = true
		v2 = false
	end
	table.insert(t3, RunService.RenderStepped:connect(f5))
	local function f8() --[[ Line: 488 | Upvalues: v3 (ref), v20 (ref), v13 (ref), v16 (ref), v14 (ref), v17 (ref), v2 (ref), t5 (ref), v22 (ref), v21 (ref), t2 (ref), v27 (ref), v15 (ref), TweenService (ref), __RainEmitter (ref), v18 (ref), t4 (ref), v1 (copy), v12 (ref), v19 (ref) ]]
		v3 = v3 + 1
		if v3 >= 6 then
			local v23 = math.abs((workspace.CurrentCamera.CFrame.lookVector:Dot(v20)))
			local v32 = NumberSequence.new({
				v13,
				NumberSequenceKeypoint.new(0.25, (1 - v23) * v16 + v23, 0),
				NumberSequenceKeypoint.new(0.75, (1 - v23) * v16 + v23, 0),
				v14
			})
			local v4 = NumberSequence.new({
				v13,
				NumberSequenceKeypoint.new(0.25, v23 * v17 + (1 - v23), 0),
				NumberSequenceKeypoint.new(0.75, v23 * v17 + (1 - v23), 0),
				v14
			})
			local v5 = workspace.Camera.CFrame:inverse() * (workspace.Camera.CFrame.p - v20)
			local v9 = NumberRange.new((math.deg((math.atan2(-v5.x, v5.y)))))
			if v2 then
				for k, v in pairs(t5) do
					v.RainStraight.Transparency = v32
					v.RainStraight.Rotation = v9
					v.RainTopDown.Transparency = v4
				end
				if not v22 then
					local v10
					if v21 and not (workspace.CurrentCamera.CFrame.p.y <= v21) then
						v10 = 0
					else
						local v11 = -v20 * 1000
						local v122 = 35
						for i = 1, #t2 do
							if not v27(Ray.new(workspace.CurrentCamera.CFrame * t2[i], v11), true) then
								v122 = t2[i].magnitude
								break
							end
						end
						v10 = 1 - v122 / 35
					end
					if math.abs(v10 - v15) > 0.01 then
						v15 = v10
						TweenService:Create(Sound, TweenInfo.new(1), {
							Volume = v10
						}):Play()
					end
				end
			else
				__RainEmitter.RainStraight.Transparency = v32
				__RainEmitter.RainStraight.Rotation = v9
				__RainEmitter.RainTopDown.Transparency = v4
			end
			v3 = 0
		end
		local p = workspace.CurrentCamera.CFrame.p
		local v142 = workspace.CurrentCamera.CFrame.lookVector:Cross(-v20)
		local v152 = v142.magnitude > 0.001 and v142.unit or -v20
		local unit = v20:Cross(v152).unit
		local v162 = CFrame.new(p.x, p.y, p.z, v152.x, -v20.x, unit.x, v152.y, -v20.y, unit.y, v152.z, -v20.z, unit.z)
		local v172 = v20 * 550
		for j = 1, v18 do
			local v182 = t4[j]
			local v192 = t5[j]
			local v202 = v1:NextNumber(-100, 100)
			local v212 = v1:NextNumber(-100, 100)
			local v222, v23, v24 = v27(Ray.new(v162 * v12(v202, 500, v212), v172))
			if v222 then
				v182.Position = v23 + v24 * 0.5
				v182.RainSplash:Emit(1)
				if v2 then
					local sum = v23 - v20 * 50
					if v21 and (v21 < sum.Y and v20.Y < 0) then
						sum = sum + v20 * (v21 - sum.Y) / v20.Y
					end
					v192.CFrame = v162 - v162.p + sum
					v192.RainStraight:Emit(v19)
					v192.RainTopDown:Emit(v19)
				end
				continue
			end
			if v2 then
				local sum = v162 * v12(v202, v1:NextNumber(20, 100), v212)
				if v21 and (v21 < sum.Y and v20.Y < 0) then
					sum = sum + v20 * (v21 - sum.Y) / v20.Y
				end
				v192.CFrame = v162 - v162.p + sum
				v192.RainStraight:Emit(v19)
				v192.RainTopDown:Emit(v19)
			end
		end
	end
	table.insert(t3, (RunService:IsRunning() and RunService.Stepped or RunService.RenderStepped):connect(f8))
end
local function disconnectLoop() --[[ disconnectLoop | Line: 633 | Upvalues: t3 (ref) ]]
	if not (#t3 > 0) then
		return
	end
	for k, v in pairs(t3) do
		v:disconnect()
	end
	t3 = {}
end
local function disableSound(p1) --[[ disableSound | Line: 643 | Upvalues: v15 (ref), TweenService (copy) ]]
	v15 = 0
	local v1 = TweenService:Create(Sound, p1, {
		Volume = 0
	})
	v1.Completed:connect(function(p1) --[[ Line: 648 | Upvalues: v1 (copy) ]]
		if p1 ~= Enum.PlaybackState.Completed then
			v1:Destroy()
			return
		end
		Sound:Stop()
		v1:Destroy()
	end)
	v1:Play()
end
local function disable() --[[ disable | Line: 658 | Upvalues: disconnectLoop (copy), __RainEmitter (ref), v22 (ref), disableSound (copy) ]]
	disconnectLoop()
	__RainEmitter.RainStraight.Enabled = false
	__RainEmitter.RainTopDown.Enabled = false
	__RainEmitter.Size = Vector3.new(0.05, 0.05, 0.05)
	if v22 then
		return
	end
	disableSound(TweenInfo.new(1))
end
local function makeProperty(p1, p2, p3) --[[ makeProperty | Line: 675 ]]
	local v1 = Instance.new(p1)
	if p2 then
		v1.Value = p2
	end
	v1.Changed:connect(p3)
	p3(v1.Value)
	return v1
end
local function f28(p1) --[[ Line: 685 | Upvalues: __RainEmitter (ref), t4 (ref), t5 (ref) ]]
	local v1 = ColorSequence.new(p1)
	__RainEmitter.RainStraight.Color = v1
	__RainEmitter.RainTopDown.Color = v1
	for k, v in pairs(t4) do
		v.RainSplash.Color = v1
	end
	for k, v in pairs(t5) do
		v.RainStraight.Color = v1
		v.RainTopDown.Color = v1
	end
end
local Color3Value = Instance.new("Color3Value")
if v1 then
	Color3Value.Value = v1
end
Color3Value.Changed:connect(f28)
f28(Color3Value.Value)
local v29 = Color3Value
local function updateTransparency(p1) --[[ updateTransparency | Line: 702 | Upvalues: v11 (copy), v16 (ref), v17 (ref), v13 (copy), v14 (copy), t4 (ref) ]]
	local v1 = (1 - p1) * (1 - v11.Value)
	local v2 = 1 - v1
	v16 = 0.7 * v1 + v2
	v17 = 0.85 * v1 + v2
	local v3 = NumberSequence.new({
		v13,
		NumberSequenceKeypoint.new(0.25, v1 * 0.6 + v2, 0),
		NumberSequenceKeypoint.new(0.75, v1 * 0.6 + v2, 0),
		v14
	})
	for k, v in pairs(t4) do
		v.RainSplash.Transparency = v3
	end
end
local v30 = Instance.new("NumberValue")
v30.Value = 0
v30.Changed:connect(updateTransparency)
updateTransparency(v30.Value)
local v31 = v30
v11.Changed:connect(updateTransparency)
local v32 = Instance.new("NumberValue")
v32.Value = 1
v32.Changed:connect(function(p1) --[[ Line: 725 | Upvalues: __RainEmitter (ref) ]]
	__RainEmitter.RainStraight.Speed = NumberRange.new(p1 * 60)
	__RainEmitter.RainTopDown.Speed = NumberRange.new(p1 * 60)
end)
local v33 = v32.Value
__RainEmitter.RainStraight.Speed = NumberRange.new(v33 * 60)
__RainEmitter.RainTopDown.Speed = NumberRange.new(v33 * 60)
local v34 = v32
local v35 = Instance.new("NumberValue")
v35.Value = 1
v35.Changed:connect(function(p1) --[[ Line: 732 | Upvalues: __RainEmitter (ref), v19 (ref), v18 (ref) ]]
	__RainEmitter.RainStraight.Rate = 600 * p1
	__RainEmitter.RainTopDown.Rate = 600 * p1
	v19 = math.ceil(2 * p1)
	v18 = 20 * p1
end)
local v36 = v35.Value
__RainEmitter.RainStraight.Rate = 600 * v36
__RainEmitter.RainTopDown.Rate = 600 * v36
local _ = math.ceil(2 * v36)
local v37 = v35
local function f38(p1) --[[ Line: 742 | Upvalues: __RainEmitter (ref), t5 (ref), t4 (ref) ]]
	__RainEmitter.RainStraight.LightEmission = p1
	__RainEmitter.RainTopDown.LightEmission = p1
	for k, v in pairs(t5) do
		v.RainStraight.LightEmission = p1
		v.RainTopDown.LightEmission = p1
	end
	for k, v in pairs(t4) do
		v.RainSplash.LightEmission = p1
	end
end
local v39 = Instance.new("NumberValue")
v39.Value = 0.05
v39.Changed:connect(f38)
f38(v39.Value)
local v40 = v39
local function f41(p1) --[[ Line: 757 | Upvalues: __RainEmitter (ref), t5 (ref), t4 (ref) ]]
	__RainEmitter.RainStraight.LightInfluence = p1
	__RainEmitter.RainTopDown.LightInfluence = p1
	for k, v in pairs(t5) do
		v.RainStraight.LightInfluence = p1
		v.RainTopDown.LightInfluence = p1
	end
	for k, v in pairs(t4) do
		v.RainSplash.LightInfluence = p1
	end
end
local v42 = Instance.new("NumberValue")
v42.Value = 0.9
v42.Changed:connect(f41)
f41(v42.Value)
local v43 = v42
local Vector3Value = Instance.new("Vector3Value")
Vector3Value.Value = Vector3.new(0, -1, 0)
Vector3Value.Changed:connect(function(p1) --[[ Line: 772 | Upvalues: v20 (ref) ]]
	if not (p1.magnitude > 0.001) then
		return
	end
	v20 = p1.unit
end)
local v44 = Vector3Value.Value
local v45, v46, _3, v47, v48, v49, v50, v51
if not (v44.magnitude > 0.001) then
	v45 = Vector3Value
	v46 = {
		CollisionMode = t,
		Enable = function(p1_2, p2_2) --[[ Enable | Line: 785 | Upvalues: disconnectLoop (copy), __RainEmitter (ref), t4 (ref), t5 (ref), connectLoop (copy), TweenService (copy), v11 (copy), v22 (ref) ]]
			if p2_2 ~= nil and typeof(p2_2) ~= "TweenInfo" then
				error("bad argument #1 to \'Enable\' (TweenInfo expected, got " .. typeof(p2_2) .. ")", 2)
			end
			disconnectLoop()
			__RainEmitter.RainStraight.Enabled = true
			__RainEmitter.RainTopDown.Enabled = true
			for i = 1, 20 do
				t4[i].Parent = workspace.Terrain
				t5[i].Parent = workspace.Terrain
			end
			connectLoop()
			if p2_2 then
				TweenService:Create(v11, p2_2, {
					Value = 0
				}):Play()
			else
				v11.Value = 0
			end
			if Sound.Playing then
				v22 = false
				return
			end
			Sound:Play()
			Sound.TimePosition = math.random() * Sound.TimeLength
			v22 = false
		end,
		Disable = function(p1_2, p2_2) --[[ Disable | Line: 823 | Upvalues: TweenService (copy), v11 (copy), disconnectLoop (copy), __RainEmitter (ref), v22 (ref), disableSound (copy) ]]
			if p2_2 ~= nil and typeof(p2_2) ~= "TweenInfo" then
				error("bad argument #1 to \'Disable\' (TweenInfo expected, got " .. typeof(p2_2) .. ")", 2)
			end
			if p2_2 then
				local v1 = TweenService:Create(v11, p2_2, {
					Value = 1
				})
				v1.Completed:connect(function(p1_2) --[[ Line: 831 | Upvalues: disconnectLoop (ref), __RainEmitter (ref), v22 (ref), disableSound (ref), v1 (copy) ]]
					if p1_2 ~= Enum.PlaybackState.Completed then
						v1:Destroy()
						return
					end
					disconnectLoop()
					__RainEmitter.RainStraight.Enabled = false
					__RainEmitter.RainTopDown.Enabled = false
					__RainEmitter.Size = Vector3.new(0.05, 0.05, 0.05)
					if v22 then
						v1:Destroy()
						return
					end
					disableSound(TweenInfo.new(1))
					v1:Destroy()
				end)
				v1:Play()
				disableSound(p2_2)
			else
				v11.Value = 1
				disconnectLoop()
				__RainEmitter.RainStraight.Enabled = false
				__RainEmitter.RainTopDown.Enabled = false
				__RainEmitter.Size = Vector3.new(0.05, 0.05, 0.05)
				if v22 then
					v22 = true
					return
				end
				disableSound(TweenInfo.new(1))
			end
			v22 = true
		end,
		SetColor = function(p1_2, p2_2, p3_2) --[[ SetColor | Line: 850 | Upvalues: TweenService (copy), v29 (copy) ]]
			if typeof(p2_2) == "Color3" then
				if p3_2 ~= nil and typeof(p3_2) ~= "TweenInfo" then
					error("bad argument #2 to \'SetColor\' (TweenInfo expected, got " .. typeof(p3_2) .. ")", 2)
				end
			else
				error("bad argument #1 to \'SetColor\' (Color3 expected, got " .. typeof(p2_2) .. ")", 2)
			end
			if p3_2 then
				TweenService:Create(v29, p3_2, {
					Value = p2_2
				}):Play()
			else
				v29.Value = p2_2
			end
		end
	}
	_3 = function(p1_2, p2_2) --[[ makeRatioSetter | Line: 866 | Upvalues: TweenService (copy) ]]
		return function(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: p1_2 (copy), TweenService (ref), p2_2 (copy) ]]
			if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
				if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
					error("bad argument #2 to \'" .. p1_2 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
				end
			else
				error("bad argument #1 to \'" .. p1_2 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
			end
			local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
			if p3_2_2_2_2_2_2_2_2_2_2_2 then
				TweenService:Create(p2_2, p3_2_2_2_2_2_2_2_2_2_2_2, {
					Value = v1
				}):Play()
			else
				p2_2.Value = v1
			end
		end
	end
	v47 = "SetTransparency"
	function v46.SetTransparency(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: v47 (copy), TweenService (copy), v31 (copy) ]]
		if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
			if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
				error("bad argument #2 to \'" .. v47 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
			end
		else
			error("bad argument #1 to \'" .. v47 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
		end
		local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
		if p3_2_2_2_2_2_2_2_2_2_2_2 then
			TweenService:Create(v31, p3_2_2_2_2_2_2_2_2_2_2_2, {
				Value = v1
			}):Play()
		else
			v31.Value = v1
		end
	end
	v48 = "SetSpeedRatio"
	function v46.SetSpeedRatio(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: v48 (copy), TweenService (copy), v34 (copy) ]]
		if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
			if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
				error("bad argument #2 to \'" .. v48 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
			end
		else
			error("bad argument #1 to \'" .. v48 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
		end
		local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
		if p3_2_2_2_2_2_2_2_2_2_2_2 then
			TweenService:Create(v34, p3_2_2_2_2_2_2_2_2_2_2_2, {
				Value = v1
			}):Play()
		else
			v34.Value = v1
		end
	end
	v49 = "SetIntensityRatio"
	function v46.SetIntensityRatio(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: v49 (copy), TweenService (copy), v37 (copy) ]]
		if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
			if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
				error("bad argument #2 to \'" .. v49 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
			end
		else
			error("bad argument #1 to \'" .. v49 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
		end
		local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
		if p3_2_2_2_2_2_2_2_2_2_2_2 then
			TweenService:Create(v37, p3_2_2_2_2_2_2_2_2_2_2_2, {
				Value = v1
			}):Play()
		else
			v37.Value = v1
		end
	end
	v50 = "SetLightEmission"
	function v46.SetLightEmission(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: v50 (copy), TweenService (copy), v40 (copy) ]]
		if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
			if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
				error("bad argument #2 to \'" .. v50 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
			end
		else
			error("bad argument #1 to \'" .. v50 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
		end
		local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
		if p3_2_2_2_2_2_2_2_2_2_2_2 then
			TweenService:Create(v40, p3_2_2_2_2_2_2_2_2_2_2_2, {
				Value = v1
			}):Play()
		else
			v40.Value = v1
		end
	end
	v51 = "SetLightInfluence"
	function v46.SetLightInfluence(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: v51 (copy), TweenService (copy), v43 (copy) ]]
		if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
			if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
				error("bad argument #2 to \'" .. v51 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
			end
		else
			error("bad argument #1 to \'" .. v51 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
		end
		local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
		if p3_2_2_2_2_2_2_2_2_2_2_2 then
			TweenService:Create(v43, p3_2_2_2_2_2_2_2_2_2_2_2, {
				Value = v1
			}):Play()
		else
			v43.Value = v1
		end
	end
	function v46.SetVolume(p1_2, p2_2, p3_2) --[[ SetVolume | Line: 893 | Upvalues: TweenService (copy) ]]
		if typeof(p2_2) == "number" then
			if p3_2 ~= nil and typeof(p3_2) ~= "TweenInfo" then
				error("bad argument #2 to \'SetVolume\' (TweenInfo expected, got " .. typeof(p3_2) .. ")", 2)
			end
		else
			error("bad argument #1 to \'SetVolume\' (number expected, got " .. typeof(p2_2) .. ")", 2)
		end
		if p3_2 then
			TweenService:Create(Sound, p3_2, {
				Volume = p2_2
			}):Play()
		else
			Sound.Volume = p2_2
		end
	end
	function v46.SetDirection(p1_2, p2_2, p3_2) --[[ SetDirection | Line: 909 | Upvalues: TweenService (copy), v45 (copy) ]]
		if typeof(p2_2) == "Vector3" then
			if p3_2 ~= nil and typeof(p3_2) ~= "TweenInfo" then
				error("bad argument #2 to \'SetDirection\' (TweenInfo expected, got " .. typeof(p3_2) .. ")", 2)
			end
		else
			error("bad argument #1 to \'SetDirection\' (Vector3 expected, got " .. typeof(p2_2) .. ")", 2)
		end
		if not (p2_2.Unit.magnitude > 0) then
			warn("Attempt to set rain direction to a zero-length vector, falling back on default direction = (" .. tostring(Vector3.new(0, -1, 0)) .. ")")
			p2_2 = Vector3.new(0, -1, 0)
		end
		if p3_2 then
			TweenService:Create(v45, p3_2, {
				Value = p2_2
			}):Play()
		else
			v45.Value = p2_2
		end
	end
	function v46.SetCeiling(p1_2, p2_2) --[[ SetCeiling | Line: 930 | Upvalues: v21 (ref) ]]
		if p2_2 ~= nil and typeof(p2_2) ~= "number" then
			error("bad argument #1 to \'SetCeiling\' (number expected, got " .. typeof(p2_2) .. ")", 2)
		end
		v21 = p2_2
	end
	function v46.SetStraightTexture(p1_2, p2_2) --[[ SetStraightTexture | Line: 940 | Upvalues: __RainEmitter (ref), t5 (ref) ]]
		if typeof(p2_2) ~= "string" then
			error("bad argument #1 to \'SetStraightTexture\' (string expected, got " .. typeof(p2_2) .. ")", 2)
		end
		__RainEmitter.RainStraight.Texture = p2_2
		for k2, v in pairs(t5) do
			v.RainStraight.Texture = p2_2
		end
	end
	function v46.SetTopDownTexture(p1_2, p2_2) --[[ SetTopDownTexture | Line: 954 | Upvalues: __RainEmitter (ref), t5 (ref) ]]
		if typeof(p2_2) ~= "string" then
			error("bad argument #1 to \'SetStraightTexture\' (string expected, got " .. typeof(p2_2) .. ")", 2)
		end
		__RainEmitter.RainTopDown.Texture = p2_2
		for k2, v in pairs(t5) do
			v.RainTopDown.Texture = p2_2
		end
	end
	function v46.SetSplashTexture(p1_2, p2_2) --[[ SetSplashTexture | Line: 968 | Upvalues: t4 (ref) ]]
		if typeof(p2_2) ~= "string" then
			error("bad argument #1 to \'SetStraightTexture\' (string expected, got " .. typeof(p2_2) .. ")", 2)
		end
		for k2, v in pairs(t4) do
			v.RainSplash.Texture = p2_2
		end
	end
	function v46.SetSoundId(p1_2, p2_2) --[[ SetSoundId | Line: 980 ]]
		if typeof(p2_2) ~= "string" then
			error("bad argument #1 to \'SetSoundId\' (string expected, got " .. typeof(p2_2) .. ")", 2)
		end
		Sound.SoundId = p2_2
	end
	function v46.SetCollisionMode(p1_2, p2_2, p3_2) --[[ SetCollisionMode | Line: 990 | Upvalues: t (copy), v23 (ref), v24 (ref), __RainEmitter (ref), None (ref), v27 (ref), t7 (copy) ]]
		if p2_2 == t.None then
			v23 = nil
			v24 = nil
		elseif p2_2 == t.Blacklist then
			if typeof(p3_2) == "Instance" then
				v23 = { p3_2, __RainEmitter }
			elseif typeof(p3_2) == "table" then
				for i = 1, #p3_2 do
					if typeof(p3_2[i]) ~= "Instance" then
						error("bad argument #2 to \'SetCollisionMode\' (blacklist contained a " .. typeof(p3_2[i]) .. " on index " .. tostring(i) .. " which is not an Instance)", 2)
					end
				end
				v23 = { __RainEmitter }
				for j = 1, #p3_2 do
					table.insert(v23, p3_2[j])
				end
			else
				error("bad argument #2 to \'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(p3_2) .. ")\'", 2)
			end
			v24 = nil
		elseif p2_2 == t.Whitelist then
			if typeof(p3_2) == "Instance" then
				v23 = { p3_2 }
			elseif typeof(p3_2) == "table" then
				for k = 1, #p3_2 do
					if typeof(p3_2[k]) ~= "Instance" then
						error("bad argument #2 to \'SetCollisionMode\' (whitelist contained a " .. typeof(p3_2[k]) .. " on index " .. tostring(k) .. " which is not an Instance)", 2)
					end
				end
				v23 = {}
				for n = 1, #p3_2 do
					table.insert(v23, p3_2[n])
				end
			else
				error("bad argument #2 to \'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(p3_2) .. ")\'", 2)
			end
			v24 = nil
		elseif p2_2 == t.Function then
			if typeof(p3_2) ~= "function" then
				error("bad argument #2 to \'SetCollisionMode\' (function expected, got " .. typeof(p3_2) .. ")", 2)
			end
			v23 = nil
			v24 = p3_2
		else
			error("bad argument #1 to \'SetCollisionMode (Rain.CollisionMode expected, got " .. typeof(p3_2) .. ")\'", 2)
		end
		None = p2_2
		v27 = t7[p2_2]
	end
	return v46
end
local unit = v44.unit
v45 = Vector3Value
v46 = {
	CollisionMode = t,
	Enable = function(p1_2, p2_2) --[[ Enable | Line: 785 | Upvalues: disconnectLoop (copy), __RainEmitter (ref), t4 (ref), t5 (ref), connectLoop (copy), TweenService (copy), v11 (copy), v22 (ref) ]]
		if p2_2 ~= nil and typeof(p2_2) ~= "TweenInfo" then
			error("bad argument #1 to \'Enable\' (TweenInfo expected, got " .. typeof(p2_2) .. ")", 2)
		end
		disconnectLoop()
		__RainEmitter.RainStraight.Enabled = true
		__RainEmitter.RainTopDown.Enabled = true
		for i = 1, 20 do
			t4[i].Parent = workspace.Terrain
			t5[i].Parent = workspace.Terrain
		end
		connectLoop()
		if p2_2 then
			TweenService:Create(v11, p2_2, {
				Value = 0
			}):Play()
		else
			v11.Value = 0
		end
		if Sound.Playing then
			v22 = false
			return
		end
		Sound:Play()
		Sound.TimePosition = math.random() * Sound.TimeLength
		v22 = false
	end,
	Disable = function(p1_2, p2_2) --[[ Disable | Line: 823 | Upvalues: TweenService (copy), v11 (copy), disconnectLoop (copy), __RainEmitter (ref), v22 (ref), disableSound (copy) ]]
		if p2_2 ~= nil and typeof(p2_2) ~= "TweenInfo" then
			error("bad argument #1 to \'Disable\' (TweenInfo expected, got " .. typeof(p2_2) .. ")", 2)
		end
		if p2_2 then
			local v1 = TweenService:Create(v11, p2_2, {
				Value = 1
			})
			v1.Completed:connect(function(p1_2) --[[ Line: 831 | Upvalues: disconnectLoop (ref), __RainEmitter (ref), v22 (ref), disableSound (ref), v1 (copy) ]]
				if p1_2 ~= Enum.PlaybackState.Completed then
					v1:Destroy()
					return
				end
				disconnectLoop()
				__RainEmitter.RainStraight.Enabled = false
				__RainEmitter.RainTopDown.Enabled = false
				__RainEmitter.Size = Vector3.new(0.05, 0.05, 0.05)
				if v22 then
					v1:Destroy()
					return
				end
				disableSound(TweenInfo.new(1))
				v1:Destroy()
			end)
			v1:Play()
			disableSound(p2_2)
		else
			v11.Value = 1
			disconnectLoop()
			__RainEmitter.RainStraight.Enabled = false
			__RainEmitter.RainTopDown.Enabled = false
			__RainEmitter.Size = Vector3.new(0.05, 0.05, 0.05)
			if v22 then
				v22 = true
				return
			end
			disableSound(TweenInfo.new(1))
		end
		v22 = true
	end,
	SetColor = function(p1_2, p2_2, p3_2) --[[ SetColor | Line: 850 | Upvalues: TweenService (copy), v29 (copy) ]]
		if typeof(p2_2) == "Color3" then
			if p3_2 ~= nil and typeof(p3_2) ~= "TweenInfo" then
				error("bad argument #2 to \'SetColor\' (TweenInfo expected, got " .. typeof(p3_2) .. ")", 2)
			end
		else
			error("bad argument #1 to \'SetColor\' (Color3 expected, got " .. typeof(p2_2) .. ")", 2)
		end
		if p3_2 then
			TweenService:Create(v29, p3_2, {
				Value = p2_2
			}):Play()
		else
			v29.Value = p2_2
		end
	end
}
_3 = function(p1_2, p2_2) --[[ makeRatioSetter | Line: 866 | Upvalues: TweenService (copy) ]]
	return function(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: p1_2 (copy), TweenService (ref), p2_2 (copy) ]]
		if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
			if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
				error("bad argument #2 to \'" .. p1_2 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
			end
		else
			error("bad argument #1 to \'" .. p1_2 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
		end
		local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
		if p3_2_2_2_2_2_2_2_2_2_2_2 then
			TweenService:Create(p2_2, p3_2_2_2_2_2_2_2_2_2_2_2, {
				Value = v1
			}):Play()
		else
			p2_2.Value = v1
		end
	end
end
v47 = "SetTransparency"
function v46.SetTransparency(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: v47 (copy), TweenService (copy), v31 (copy) ]]
	if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
		if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
			error("bad argument #2 to \'" .. v47 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
		end
	else
		error("bad argument #1 to \'" .. v47 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
	end
	local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
	if p3_2_2_2_2_2_2_2_2_2_2_2 then
		TweenService:Create(v31, p3_2_2_2_2_2_2_2_2_2_2_2, {
			Value = v1
		}):Play()
	else
		v31.Value = v1
	end
end
v48 = "SetSpeedRatio"
function v46.SetSpeedRatio(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: v48 (copy), TweenService (copy), v34 (copy) ]]
	if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
		if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
			error("bad argument #2 to \'" .. v48 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
		end
	else
		error("bad argument #1 to \'" .. v48 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
	end
	local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
	if p3_2_2_2_2_2_2_2_2_2_2_2 then
		TweenService:Create(v34, p3_2_2_2_2_2_2_2_2_2_2_2, {
			Value = v1
		}):Play()
	else
		v34.Value = v1
	end
end
v49 = "SetIntensityRatio"
function v46.SetIntensityRatio(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: v49 (copy), TweenService (copy), v37 (copy) ]]
	if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
		if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
			error("bad argument #2 to \'" .. v49 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
		end
	else
		error("bad argument #1 to \'" .. v49 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
	end
	local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
	if p3_2_2_2_2_2_2_2_2_2_2_2 then
		TweenService:Create(v37, p3_2_2_2_2_2_2_2_2_2_2_2, {
			Value = v1
		}):Play()
	else
		v37.Value = v1
	end
end
v50 = "SetLightEmission"
function v46.SetLightEmission(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: v50 (copy), TweenService (copy), v40 (copy) ]]
	if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
		if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
			error("bad argument #2 to \'" .. v50 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
		end
	else
		error("bad argument #1 to \'" .. v50 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
	end
	local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
	if p3_2_2_2_2_2_2_2_2_2_2_2 then
		TweenService:Create(v40, p3_2_2_2_2_2_2_2_2_2_2_2, {
			Value = v1
		}):Play()
	else
		v40.Value = v1
	end
end
v51 = "SetLightInfluence"
function v46.SetLightInfluence(p12_2_2_2_2_2_2_2_2_2_2_2, p22_2_2_2_2_2_2_2_2_2_2_2, p3_2_2_2_2_2_2_2_2_2_2_2) --[[ Line: 868 | Upvalues: v51 (copy), TweenService (copy), v43 (copy) ]]
	if typeof(p22_2_2_2_2_2_2_2_2_2_2_2) == "number" then
		if p3_2_2_2_2_2_2_2_2_2_2_2 ~= nil and typeof(p3_2_2_2_2_2_2_2_2_2_2_2) ~= "TweenInfo" then
			error("bad argument #2 to \'" .. v51 .. "\' (TweenInfo expected, got " .. typeof(p3_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
		end
	else
		error("bad argument #1 to \'" .. v51 .. "\' (number expected, got " .. typeof(p22_2_2_2_2_2_2_2_2_2_2_2) .. ")", 2)
	end
	local v1 = math.clamp(p22_2_2_2_2_2_2_2_2_2_2_2, 0, 1)
	if p3_2_2_2_2_2_2_2_2_2_2_2 then
		TweenService:Create(v43, p3_2_2_2_2_2_2_2_2_2_2_2, {
			Value = v1
		}):Play()
	else
		v43.Value = v1
	end
end
function v46.SetVolume(p1_2, p2_2, p3_2) --[[ SetVolume | Line: 893 | Upvalues: TweenService (copy) ]]
	if typeof(p2_2) == "number" then
		if p3_2 ~= nil and typeof(p3_2) ~= "TweenInfo" then
			error("bad argument #2 to \'SetVolume\' (TweenInfo expected, got " .. typeof(p3_2) .. ")", 2)
		end
	else
		error("bad argument #1 to \'SetVolume\' (number expected, got " .. typeof(p2_2) .. ")", 2)
	end
	if p3_2 then
		TweenService:Create(Sound, p3_2, {
			Volume = p2_2
		}):Play()
	else
		Sound.Volume = p2_2
	end
end
function v46.SetDirection(p1_2, p2_2, p3_2) --[[ SetDirection | Line: 909 | Upvalues: TweenService (copy), v45 (copy) ]]
	if typeof(p2_2) == "Vector3" then
		if p3_2 ~= nil and typeof(p3_2) ~= "TweenInfo" then
			error("bad argument #2 to \'SetDirection\' (TweenInfo expected, got " .. typeof(p3_2) .. ")", 2)
		end
	else
		error("bad argument #1 to \'SetDirection\' (Vector3 expected, got " .. typeof(p2_2) .. ")", 2)
	end
	if not (p2_2.Unit.magnitude > 0) then
		warn("Attempt to set rain direction to a zero-length vector, falling back on default direction = (" .. tostring(Vector3.new(0, -1, 0)) .. ")")
		p2_2 = Vector3.new(0, -1, 0)
	end
	if p3_2 then
		TweenService:Create(v45, p3_2, {
			Value = p2_2
		}):Play()
	else
		v45.Value = p2_2
	end
end
function v46.SetCeiling(p1_2, p2_2) --[[ SetCeiling | Line: 930 | Upvalues: v21 (ref) ]]
	if p2_2 ~= nil and typeof(p2_2) ~= "number" then
		error("bad argument #1 to \'SetCeiling\' (number expected, got " .. typeof(p2_2) .. ")", 2)
	end
	v21 = p2_2
end
function v46.SetStraightTexture(p1_2, p2_2) --[[ SetStraightTexture | Line: 940 | Upvalues: __RainEmitter (ref), t5 (ref) ]]
	if typeof(p2_2) ~= "string" then
		error("bad argument #1 to \'SetStraightTexture\' (string expected, got " .. typeof(p2_2) .. ")", 2)
	end
	__RainEmitter.RainStraight.Texture = p2_2
	for k2, v in pairs(t5) do
		v.RainStraight.Texture = p2_2
	end
end
function v46.SetTopDownTexture(p1_2, p2_2) --[[ SetTopDownTexture | Line: 954 | Upvalues: __RainEmitter (ref), t5 (ref) ]]
	if typeof(p2_2) ~= "string" then
		error("bad argument #1 to \'SetStraightTexture\' (string expected, got " .. typeof(p2_2) .. ")", 2)
	end
	__RainEmitter.RainTopDown.Texture = p2_2
	for k2, v in pairs(t5) do
		v.RainTopDown.Texture = p2_2
	end
end
function v46.SetSplashTexture(p1_2, p2_2) --[[ SetSplashTexture | Line: 968 | Upvalues: t4 (ref) ]]
	if typeof(p2_2) ~= "string" then
		error("bad argument #1 to \'SetStraightTexture\' (string expected, got " .. typeof(p2_2) .. ")", 2)
	end
	for k2, v in pairs(t4) do
		v.RainSplash.Texture = p2_2
	end
end
function v46.SetSoundId(p1_2, p2_2) --[[ SetSoundId | Line: 980 ]]
	if typeof(p2_2) ~= "string" then
		error("bad argument #1 to \'SetSoundId\' (string expected, got " .. typeof(p2_2) .. ")", 2)
	end
	Sound.SoundId = p2_2
end
function v46.SetCollisionMode(p1_2, p2_2, p3_2) --[[ SetCollisionMode | Line: 990 | Upvalues: t (copy), v23 (ref), v24 (ref), __RainEmitter (ref), None (ref), v27 (ref), t7 (copy) ]]
	if p2_2 == t.None then
		v23 = nil
		v24 = nil
	elseif p2_2 == t.Blacklist then
		if typeof(p3_2) == "Instance" then
			v23 = { p3_2, __RainEmitter }
		elseif typeof(p3_2) == "table" then
			for i = 1, #p3_2 do
				if typeof(p3_2[i]) ~= "Instance" then
					error("bad argument #2 to \'SetCollisionMode\' (blacklist contained a " .. typeof(p3_2[i]) .. " on index " .. tostring(i) .. " which is not an Instance)", 2)
				end
			end
			v23 = { __RainEmitter }
			for j = 1, #p3_2 do
				table.insert(v23, p3_2[j])
			end
		else
			error("bad argument #2 to \'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(p3_2) .. ")\'", 2)
		end
		v24 = nil
	elseif p2_2 == t.Whitelist then
		if typeof(p3_2) == "Instance" then
			v23 = { p3_2 }
		elseif typeof(p3_2) == "table" then
			for k = 1, #p3_2 do
				if typeof(p3_2[k]) ~= "Instance" then
					error("bad argument #2 to \'SetCollisionMode\' (whitelist contained a " .. typeof(p3_2[k]) .. " on index " .. tostring(k) .. " which is not an Instance)", 2)
				end
			end
			v23 = {}
			for n = 1, #p3_2 do
				table.insert(v23, p3_2[n])
			end
		else
			error("bad argument #2 to \'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(p3_2) .. ")\'", 2)
		end
		v24 = nil
	elseif p2_2 == t.Function then
		if typeof(p3_2) ~= "function" then
			error("bad argument #2 to \'SetCollisionMode\' (function expected, got " .. typeof(p3_2) .. ")", 2)
		end
		v23 = nil
		v24 = p3_2
	else
		error("bad argument #1 to \'SetCollisionMode (Rain.CollisionMode expected, got " .. typeof(p3_2) .. ")\'", 2)
	end
	None = p2_2
	v27 = t7[p2_2]
end
return v46