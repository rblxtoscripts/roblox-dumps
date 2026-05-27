-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local Configs = Sonar("Gamebeast"):GetService("Configs")
local v1 = Sonar("TableUtils")
local v2 = Sonar("Signal")
local IS_STUDIO = Sonar("Constants").IS_STUDIO
t.OverrideChangedSignal = v2.new()
local t2 = {}
local t3 = {}
local function getOrCreateInitialisedSignal(p1) --[[ getOrCreateInitialisedSignal | Line: 20 | Upvalues: t3 (copy), v2 (copy) ]]
	local v1 = t3[p1]
	if v1 then
		return v1
	else
		local v22 = v2.new()
		t3[p1] = v22
		return v22
	end
end
local function markInitialised(p1) --[[ markInitialised | Line: 30 | Upvalues: t2 (copy), t3 (copy), v2 (copy) ]]
	if t2[p1] then
		return
	end
	t2[p1] = true
	local v1 = t3[p1]
	local v22
	if v1 then
		v22 = v1
	else
		local v3 = v2.new()
		t3[p1] = v3
		v22 = v3
	end
	v22:Fire()
end
local function v3(p1, p2, p3, p4) --[[ applyOverrides | Line: 38 | Upvalues: v3 (copy) ]]
	if not p1 then
		return
	end
	if not p4 then
		p4 = {}
	end
	if p4[p2] then
		return
	end
	p4[p2] = true
	for v1, v2 in p2 do
		if type(v2) == "table" and type(p1[v1]) == "table" then
			v3(p1[v1], v2, p3[v1], p4)
			continue
		end
		p1[v1] = v2
	end
end
local function v4(p1, p2, p3, p4, p5) --[[ revertRemovedKeys | Line: 53 | Upvalues: v4 (copy), v1 (copy) ]]
	if not p1 then
		return
	end
	if not p5 then
		p5 = {}
	end
	if p5[p2] then
		return
	end
	p5[p2] = true
	for v12, v2 in p2 do
		if type(v2) == "table" and type(p3[v12]) == "table" then
			v4(p1[v12], v2, p3[v12], p4[v12], p5)
			continue
		end
		if p3[v12] == nil then
			if type(v2) == "table" then
				p1[v12] = v1.Copy(p4[v12])
				continue
			end
			p1[v12] = p4[v12]
		end
	end
end
local function v5(p1, p2, p3) --[[ restoreFromCache | Line: 72 | Upvalues: v5 (copy) ]]
	if not p1 then
		return
	end
	if not p3 then
		p3 = {}
	end
	if p3[p2] then
		return
	end
	p3[p2] = true
	for v1, v2 in p2 do
		if type(v2) == "table" then
			v5(p1[v1], v2, p3)
			continue
		end
		p1[v1] = v2
	end
end
function t.ObserveOverride(p1, p2) --[[ ObserveOverride | Line: 87 | Upvalues: v1 (copy), Configs (copy), t2 (copy), t3 (copy), v2 (copy), v5 (copy), v4 (copy), v3 (copy), IS_STUDIO (copy), t (copy) ]]
	local v12 = v1.DeepCopy(p1)
	Configs:Observe(p2, function(p12, p22) --[[ Line: 90 | Upvalues: p2 (copy), t2 (ref), t3 (ref), v2 (ref), v5 (ref), p1 (copy), v12 (copy), v4 (ref), v3 (ref), IS_STUDIO (ref), t (ref) ]]
		local v1 = p2
		if not t2[v1] then
			t2[v1] = true
			local v22 = t3[v1]
			local v32
			if v22 then
				v32 = v22
			else
				local v42 = v2.new()
				t3[v1] = v42
				v32 = v42
			end
			v32:Fire()
		end
		if not p12 then
			v5(p1, v12)
			return
		end
		if p22 then
			v4(p1, p22, p12, v12)
		end
		v3(p1, p12, v12)
		t.OverrideChangedSignal:Fire(p2)
	end)
end
function t.IsInitialised(p1) --[[ IsInitialised | Line: 112 | Upvalues: t2 (copy) ]]
	return t2[p1] == true
end
function t.GetInitialisedSignal(p1) --[[ GetInitialisedSignal | Line: 116 | Upvalues: t3 (copy), v2 (copy) ]]
	local v1 = t3[p1]
	if v1 then
		return v1
	else
		local v22 = v2.new()
		t3[p1] = v22
		return v22
	end
end
function t.WaitForInitialised(p1) --[[ WaitForInitialised | Line: 120 | Upvalues: t2 (copy), t3 (copy), v2 (copy) ]]
	if t2[p1] then
		return
	end
	local v1 = t3[p1]
	local v22
	if v1 then
		v22 = v1
	else
		local v3 = v2.new()
		t3[p1] = v3
		v22 = v3
	end
	v22:Wait()
end
function t.GetOverrideChangedSignal(p1) --[[ GetOverrideChangedSignal | Line: 127 | Upvalues: v2 (copy), t (copy) ]]
	local v1 = v2.new()
	v1:GiveTask(t.OverrideChangedSignal:Connect(function(p12) --[[ Line: 130 | Upvalues: p1 (copy), v1 (copy) ]]
		if p12 ~= p1 then
			return
		end
		v1:Fire()
	end))
	return v1
end
return t