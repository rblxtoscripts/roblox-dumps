-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local Effects = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):WaitForChild("Assets").Effects
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local EffectsData = Sonar("Constants").EffectsData
local t = {}
t.__index = t
local v2 = RunService:IsServer()
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
function t.makeEffectAt(p1, p2, p3) --[[ makeEffectAt | Line: 24 | Upvalues: Effects (copy), CollectionService (copy) ]]
	local v1 = Effects[p1]:Clone()
	v1.Parent = p2
	v1.WorldCFrame = p3
	v1:SetAttribute("E", false)
	CollectionService:AddTag(v1, "Effects")
	return v1
end
function t.emitEffectAt(p1, p2, p3) --[[ emitEffectAt | Line: 33 | Upvalues: Effects (copy), EffectsData (copy) ]]
	local v1 = Effects[p1]:Clone()
	v1.Parent = p2
	v1.WorldCFrame = p3
	local v2 = EffectsData[p1]
	local v3 = 0
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			local v4 = v2[v.Name]
			if v4.EmissionAmount then
				v:Emit(v4.EmissionAmount)
				local Max = v.Lifetime.Max
				if v3 < Max then
					v3 = Max
				end
			end
		end
	end
	task.delay(v3, function() --[[ Line: 54 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
function t.new(p1) --[[ new | Line: 60 | Upvalues: t (copy), EffectsData (copy), t4 (copy), t5 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Object = p1
	v2.Descendants = p1:GetDescendants()
	v2.EffectsData = EffectsData[p1.Name]
	v2._attributeConnection = p1:GetAttributeChangedSignal("E"):Connect(function() --[[ Line: 66 | Upvalues: p1 (copy), v2 (copy) ]]
		if not p1:GetAttribute("E") then
			return
		end
		v2:Play(true)
	end)
	if p1:GetAttribute("E") then
		v2:Play(true)
	end
	t4[v2] = p1.Parent
	t5[p1] = v2
	return v2
end
local function makeEffect(p1, p2) --[[ makeEffect | Line: 81 ]]
	if not p2 then
		warn("No effect data for", p1)
		return {}
	end
	local t = {}
	for k, v in pairs(p2) do
		t[k] = v
	end
	t.Object = p1
	t.IsParticle = p1:IsA("ParticleEmitter")
	t.IsTrail = p1:IsA("Trail")
	t.IsSound = p1:IsA("Sound")
	return t
end
local function emitEffect(p1) --[[ emitEffect | Line: 105 ]]
	local Object = p1.Object
	local IsTrail = p1.IsTrail
	local IsSound = p1.IsSound
	if p1.IsParticle then
		if p1.EmissionAmount then
			Object:Emit(p1.EmissionAmount)
		else
			Object.Enabled = true
		end
	else
		if IsTrail then
			Object.Enabled = true
			return
		end
		if IsSound then
			Object.TimePosition = 0
			Object:Play()
		else
			Object.Enabled = true
		end
	end
end
local function playEffect(p1, p2) --[[ playEffect | Line: 127 | Upvalues: t3 (copy), t2 (copy) ]]
	local v1
	if p2 or not p1.StartDelay then
		v1 = 0
	else
		v1 = p1.StartDelay
		t3[p1] = tick() + v1
	end
	if not p1.IsSound then
		if p1.Duration then
			t2[p1] = tick() + v1 + p1.Duration
		else
			t2[p1] = tick() + v1 + 9000000000
		end
	end
	local Object = p1.Object
	local IsTrail = p1.IsTrail
	local IsSound = p1.IsSound
	if p1.IsParticle then
		if p1.EmissionAmount then
			Object:Emit(p1.EmissionAmount)
		else
			Object.Enabled = true
		end
	else
		if IsTrail then
			Object.Enabled = true
			return
		end
		if IsSound then
			Object.TimePosition = 0
			Object:Play()
		else
			Object.Enabled = true
		end
	end
end
local function stopEffect(p1) --[[ stopEffect | Line: 145 ]]
	if p1.IsSound then
		p1.Object:Stop()
	else
		if not p1.Object then
			warn("Effect not defined, check the EffectsData table for the attachment names", p1)
		end
		if p1.Object.Parent then
			p1.Object.Enabled = false
		end
	end
end
function t.Play(p1, p2) --[[ Play | Line: 159 | Upvalues: makeEffect (copy), playEffect (copy) ]]
	if p2 then
		p1.Object:SetAttribute("E", false)
	end
	if p1._playing then
		return
	end
	p1._playing = true
	local EffectsData = p1.EffectsData
	if not p1.EffectCache then
		p1.EffectCache = {}
		for k, v in pairs(p1.Descendants) do
			p1.EffectCache[v] = makeEffect(v, EffectsData[v.Name])
		end
	end
	for k, v in pairs(p1.EffectCache) do
		playEffect(v)
	end
end
function t.PlayEffectServer(p1) --[[ PlayEffectServer | Line: 181 ]]
	p1:SetAttribute("E", true)
end
function t.Stop(p1) --[[ Stop | Line: 185 | Upvalues: t2 (copy), t3 (copy) ]]
	if not p1.EffectCache then
		return
	end
	if not p1.Object then
		return
	end
	p1._playing = false
	for k, v in pairs(p1.EffectCache) do
		if v.IsSound then
			v.Object:Stop()
		else
			if not v.Object then
				warn("Effect not defined, check the EffectsData table for the attachment names", v)
			end
			if v.Object.Parent then
				v.Object.Enabled = false
			end
		end
		t2[v] = nil
		t3[v] = nil
	end
	p1.Object:SetAttribute("E", false)
end
function t.GetEffectsForPart(p1) --[[ GetEffectsForPart | Line: 201 | Upvalues: t4 (copy) ]]
	local t = {}
	for k, v in pairs(t4) do
		if v == p1 then
			table.insert(t, k)
		end
	end
	return t
end
function t.GetEffectsForAttachment(p1) --[[ GetEffectsForAttachment | Line: 211 | Upvalues: t5 (copy) ]]
	return t5[p1]
end
function t.Destroy(p1) --[[ Destroy | Line: 215 | Upvalues: t2 (copy), t3 (copy), t5 (copy), t4 (copy) ]]
	p1:Stop()
	if p1._attributeConnection then
		p1._attributeConnection:Disconnect()
		p1._attributeConnection = nil
	end
	if p1.EffectCache then
		for v1, v2 in p1.EffectCache do
			t2[v2] = nil
			t3[v2] = nil
		end
	end
	t5[p1.Object] = nil
	t4[p1] = nil
	t3[p1] = nil
	setmetatable(p1, nil)
end
if not v2 then
	RunService.Heartbeat:Connect(function() --[[ Line: 234 | Upvalues: t2 (copy), t3 (copy) ]]
		for k, v in pairs(t2) do
			if v < tick() then
				if k.IsSound then
					k.Object:Stop()
				else
					if not k.Object then
						warn("Effect not defined, check the EffectsData table for the attachment names", k)
					end
					if k.Object.Parent then
						k.Object.Enabled = false
					end
				end
				t2[k] = nil
				continue
			end
			local Object = k.Object
			if k.IsParticle then
				if k.EmissionAmount then
					Object:Emit(k.EmissionAmount)
					continue
				end
				Object.Enabled = true
				continue
			end
			if k.IsTrail then
				Object.Enabled = true
				continue
			end
			if k.IsSound then
				Object.TimePosition = 0
				Object:Play()
				continue
			end
			Object.Enabled = true
		end
		for k, v in pairs(t3) do
			if v <= tick() then
				local v1 = 0
				if not k.IsSound then
					if k.Duration then
						t2[k] = tick() + v1 + k.Duration
					else
						t2[k] = tick() + v1 + 9000000000
					end
				end
				local Object = k.Object
				local IsTrail = k.IsTrail
				local IsSound = k.IsSound
				if k.IsParticle then
					if k.EmissionAmount then
						Object:Emit(k.EmissionAmount)
					else
						Object.Enabled = true
					end
				elseif IsTrail then
					Object.Enabled = true
				elseif IsSound then
					Object.TimePosition = 0
					Object:Play()
				else
					Object.Enabled = true
				end
				t3[k] = nil
			end
		end
	end)
	v1.new("Effects", t):Init()
end
return t