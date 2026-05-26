-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Sonar)
function t.Emit(p1) --[[ Emit | Line: 15 ]]
	assert(p1:IsA("ParticleEmitter"), "EffectUtils.Emit: particleEmitter must be a ParticleEmitter")
	local v2 = p1:GetAttribute("EmitCount") or p1:GetAttribute("Emit")
	local v3 = p1:GetAttribute("EmitDuration")
	if not (v2 or v3) then
		warn("Either EmitCount or EmitDuration must be specified for", p1:GetFullName())
		return
	end
	task.delay(p1:GetAttribute("EmitDelay") or 0, function() --[[ Line: 27 | Upvalues: v3 (copy), p1 (copy), v2 (copy) ]]
		if v3 then
			p1.Enabled = true
			task.delay(v3, function() --[[ Line: 30 | Upvalues: p1 (ref) ]]
				p1.Enabled = false
			end)
		end
		if not v2 then
			return
		end
		p1:Emit(v2)
	end)
end
function t.EmitInstance(p1) --[[ EmitInstance | Line: 41 | Upvalues: t (copy) ]]
	for v1, v2 in p1:GetChildren() do
		if v2:IsA("ParticleEmitter") then
			t.Emit(v2)
		end
	end
	if not p1:IsA("ParticleEmitter") then
		return
	end
	t.Emit(p1)
end
function t.GetEmitterDuration(p1) --[[ GetEmitterDuration | Line: 54 ]]
	if p1:IsA("ParticleEmitter") then
		return (p1:GetAttribute("EmitDelay") or 0) + (p1:GetAttribute("EmitDuration") or 0) + (p1.Lifetime.Max or 0)
	else
		return 0
	end
end
function t.GetTotalDuration(p1) --[[ GetTotalDuration | Line: 68 | Upvalues: t (copy) ]]
	local v1 = 0
	for v2, v3 in p1:GetDescendants() do
		local v4 = t.GetEmitterDuration(v3)
		if v1 < v4 then
			v1 = v4
		end
	end
	local v5 = t.GetEmitterDuration(p1)
	if v1 < v5 then
		v1 = v5
	end
	return v1
end
function t.ToggleParticles(p1, p2) --[[ ToggleParticles | Line: 87 ]]
	for v1, v2 in p1:GetChildren() do
		if v2:IsA("ParticleEmitter") then
			v2.Enabled = p2
		end
	end
end
function t.ToggleBeams(p1, p2) --[[ ToggleBeams | Line: 96 ]]
	for v1, v2 in p1:GetChildren() do
		if v2:IsA("Beam") then
			v2.Enabled = p2
		end
	end
end
function t.ToggleLights(p1, p2) --[[ ToggleLights | Line: 105 ]]
	for v1, v2 in p1:GetChildren() do
		if v2:IsA("Light") then
			v2.Enabled = p2
		end
	end
end
function t.ToggleEffects(p1, p2) --[[ ToggleEffects | Line: 114 | Upvalues: t (copy) ]]
	t.ToggleParticles(p1, p2)
	t.ToggleBeams(p1, p2)
	t.ToggleLights(p1, p2)
end
return t