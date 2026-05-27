-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local Storage = ReplicatedStorage:WaitForChild("Storage")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("MathUtils")
local v3 = Random.new()
local t = {}
t.__index = t
function t.new(p1, p2, p3, p4, p5, p6, p7) --[[ new | Line: 80 | Upvalues: t (copy), v1 (copy), Storage (copy) ]]
	local v2 = setmetatable({}, t)
	v2._maid = v1.new()
	v2._clonedSet = nil
	v2._baseScales = {}
	v2._particleEmitters = {}
	v2._pointLights = {}
	v2._trails = {}
	v2._sounds = {}
	v2._minParticleLifetime = (1 / 0)
	local v4 = (Storage:FindFirstChild("Particles") or Storage.Assets:FindFirstChild("Particles")):FindFirstChild(p1)
	if not v4 then
		warn("ParticleSet.new: Could not find particle template named \'" .. p1 .. "\' in ReplicatedStorage.Storage.Particles.")
		v2._maid:DoCleaning()
		return nil
	end
	v2._clonedSet = v4:Clone()
	local function processInstance(p1) --[[ processInstance | Line: 104 | Upvalues: v2 (copy) ]]
		if p1:IsA("ParticleEmitter") then
			v2._baseScales[p1] = p1.Size
			table.insert(v2._particleEmitters, p1)
			if typeof(p1.Lifetime) == "NumberRange" then
				v2._minParticleLifetime = math.min(v2._minParticleLifetime, p1.Lifetime.Min)
				return
			end
			if typeof(p1.Lifetime) == "number" then
				v2._minParticleLifetime = math.min(v2._minParticleLifetime, p1.Lifetime)
			end
		else
			if p1:IsA("PointLight") then
				table.insert(v2._pointLights, p1)
				return
			end
			if p1:IsA("Trail") then
				table.insert(v2._trails, p1)
				return
			end
			if not p1:IsA("Sound") then
				return
			end
			table.insert(v2._sounds, p1)
		end
	end
	processInstance(v2._clonedSet)
	for i, v in ipairs(v2._clonedSet:GetDescendants()) do
		processInstance(v)
	end
	if p7 ~= nil then
		for v5 in v2._baseScales do
			v5.LockedToPart = p7
		end
	end
	if p3 and p2:IsA("BasePart") then
		local Attachment = Instance.new("Attachment")
		Attachment.Position = Vector3.new(0, 0, 0)
		Attachment.Name = p1 .. "Attachment"
		v2.Attachment = Attachment
		if v2._clonedSet:IsA("ParticleEmitter") or (v2._clonedSet:IsA("PointLight") or v2._clonedSet:IsA("Sound")) then
			v2._clonedSet.Parent = Attachment
		else
			for i, v in ipairs(v2._clonedSet:GetChildren()) do
				v.Parent = Attachment
			end
			v2._clonedSet:Destroy()
		end
		v2._clonedSet = Attachment
		v2._clonedSet.Parent = p2
	elseif v2._clonedSet:IsA("Folder") then
		for i, v in ipairs(v2._clonedSet:GetChildren()) do
			v.Parent = p2
		end
		v2._clonedSet:Destroy()
		v2._clonedSet = p2
	else
		v2._clonedSet.Parent = p2
	end
	if not p6 then
		v2._maid:GiveTask(v2._clonedSet)
	end
	if typeof(p5) == "number" and p5 > 0 then
		local v6 = task.delay(p5, function() --[[ Line: 176 | Upvalues: v2 (copy) ]]
			if not v2 then
				return
			end
			v2:Destroy()
		end)
		v2._maid:GiveTask(function() --[[ Line: 183 | Upvalues: v6 (copy) ]]
			pcall(function() --[[ Line: 184 | Upvalues: v6 (ref) ]]
				task.cancel(v6)
			end)
		end)
	end
	if p4 then
		v2:Scale(p4)
	end
	return v2
end
function t.fromExistingInstance(p1) --[[ fromExistingInstance | Line: 204 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2._maid = v1.new()
	v2._clonedSet = p1
	v2._baseScales = {}
	v2._particleEmitters = {}
	v2._pointLights = {}
	v2._trails = {}
	v2._sounds = {}
	v2._minParticleLifetime = (1 / 0)
	if p1:IsA("Attachment") then
		v2.Attachment = p1
	end
	for i, v in ipairs(v2._clonedSet:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v2._baseScales[v] = v.Size
			table.insert(v2._particleEmitters, v)
			if typeof(v.Lifetime) == "NumberRange" then
				v2._minParticleLifetime = math.min(v2._minParticleLifetime, v.Lifetime.Min)
				continue
			end
			if typeof(v.Lifetime) == "number" then
				v2._minParticleLifetime = math.min(v2._minParticleLifetime, v.Lifetime)
			end
			continue
		end
		if v:IsA("PointLight") then
			table.insert(v2._pointLights, v)
			continue
		end
		if v:IsA("Trail") then
			table.insert(v2._trails, v)
			continue
		end
		if v:IsA("Sound") then
			v.SoundGroup = game.SoundService.Effects
			table.insert(v2._sounds, v)
		end
	end
	return v2
end
function t._IterateParticleEmitters(p1, p2) --[[ _IterateParticleEmitters | Line: 256 ]]
	if not p1._particleEmitters then
		return
	end
	for v1, v2 in p1._particleEmitters do
		if v2 and v2.Parent then
			p2(v2)
		end
	end
end
function t.Emit(p1, p2, p3) --[[ Emit | Line: 271 | Upvalues: v3 (copy) ]]
	p1:_IterateParticleEmitters(function(p1) --[[ Line: 272 | Upvalues: p2 (copy), p3 (copy) ]]
		local v1 = p2 or (p1:GetAttribute("EmitCount") or p1.Rate)
		local v2 = p1:GetAttribute("EmitDelay") or 0
		local v3 = p1:GetAttribute("EmitDuration") or 0
		local function emitParticles() --[[ emitParticles | Line: 277 | Upvalues: p3 (ref), v1 (copy), p1 (copy), v3 (copy) ]]
			if p3 and v1 == 0 then
				p1.Enabled = true
				if v3 > 0 then
					task.delay(v3, function() --[[ Line: 281 | Upvalues: p1 (ref) ]]
						p1.Enabled = false
					end)
				end
			end
			p1:Emit(v1)
		end
		if v2 > 0 then
			task.delay(v2, emitParticles)
			return
		end
		if p3 and v1 == 0 then
			p1.Enabled = true
			if v3 > 0 then
				task.delay(v3, function() --[[ Line: 281 | Upvalues: p1 (copy) ]]
					p1.Enabled = false
				end)
			end
		end
		p1:Emit(v1)
	end)
	local v1 = ipairs
	for v32, v4 in v1(p1._pointLights or {}) do
		if v4 and v4.Parent then
			v4.Enabled = true
			local v5 = "LightOff_" .. tostring(v4)
			if p1._minParticleLifetime > 0 then
				local v6 = task.delay(p1._minParticleLifetime, function() --[[ Line: 302 | Upvalues: v4 (copy) ]]
					if not (v4 and v4.Parent) then
						return
					end
					v4.Enabled = false
				end)
				p1._maid:GiveTask(function() --[[ Line: 307 | Upvalues: v6 (copy), v4 (copy) ]]
					task.cancel(v6)
					if not (v4 and v4.Parent) then
						return
					end
					v4.Enabled = false
				end, v5)
				continue
			end
			p1._maid:GiveTask(function() --[[ Line: 314 | Upvalues: v4 (copy) ]]
				if not (v4 and v4.Parent) then
					return
				end
				v4.Enabled = false
			end, v5)
		end
	end
	local v7 = ipairs
	for v9, v10 in v7(p1._sounds or {}) do
		if v10 and v10.Parent then
			local v11 = v10:Clone()
			v11.SoundGroup = game.SoundService.Effects
			v11.Parent = v10.Parent
			local v12 = nil
			v12 = v11.Ended:Connect(function() --[[ Line: 332 | Upvalues: v12 (ref), v11 (copy) ]]
				if v12 then
					v12:Disconnect()
					v12 = nil
				end
				if not (v11 and v11.Parent) then
					return
				end
				v11:Destroy()
			end)
			p1._maid:GiveTask(v11)
			p1._maid:GiveTask(v12)
			v11.PlaybackSpeed = v11.PlaybackSpeed * v3:NextNumber(0.9, 1.1)
			v11:Play()
		end
	end
end
function t.Enable(p1, p2) --[[ Enable | Line: 358 ]]
	p1:_IterateParticleEmitters(function(p1) --[[ Line: 371 | Upvalues: p2 (copy) ]]
		p1.Enabled = p2
	end)
	local v1 = ipairs
	for v3, v4 in v1(p1._pointLights or {}) do
		if v4 and v4.Parent then
			v4.Enabled = p2
		end
	end
	local v5 = ipairs
	for v7, v8 in v5(p1._trails or {}) do
		if v8 and v8.Parent then
			v8.Enabled = p2
		end
	end
	local v9 = ipairs
	for v11, v12 in v9(p1._sounds or {}) do
		if v12 and v12.Parent then
			if p2 then
				if not v12.IsPlaying then
					v12:Play()
				end
				continue
			end
			if v12.IsPlaying then
				v12:Stop()
			end
		end
	end
end
function t.Scale(p1, p2) --[[ Scale | Line: 413 | Upvalues: v2 (copy) ]]
	assert(if typeof(p2) == "number" then true else false, "ParticleSet:Scale expects a number argument for scale.")
	p1:_IterateParticleEmitters(function(p12) --[[ Line: 415 | Upvalues: p1 (copy), v2 (ref), p2 (copy) ]]
		local v1 = p1._baseScales[p12]
		if not v1 then
			return
		end
		p12.Size = v2.scaleNumberSequence(v1, p2)
	end)
end
function t.Destroy(p1) --[[ Destroy | Line: 427 ]]
	if p1._maid then
		p1._maid:DoCleaning()
		p1._maid = nil
	end
	p1._clonedSet = nil
	p1._baseScales = nil
	p1._particleEmitters = nil
	p1._pointLights = nil
	p1._trails = nil
	p1._sounds = nil
	p1._minParticleLifetime = 0
	table.clear(p1)
	setmetatable(p1, nil)
end
function t.SetPosition(p1, p2) --[[ SetPosition | Line: 452 ]]
	assert(if typeof(p2) == "Vector3" then true else false, "ParticleSet:SetPosition expects a Vector3 argument for worldPosition.")
	if p1.Attachment and p1.Attachment.Parent then
		local v2 = p1.Attachment.Parent
		if not (v2:IsA("BasePart") or v2:IsA("Bone")) then
			p1.Attachment.Position = p2
			return
		end
		p1.Attachment.Position = v2.CFrame:PointToObjectSpace(p2)
	elseif p1._clonedSet and p1._clonedSet.Parent then
		p1._clonedSet.Position = p2
	else
		warn("ParticleSet:SetPosition called, but this ParticleSet has no attachment to reposition.")
	end
end
return t