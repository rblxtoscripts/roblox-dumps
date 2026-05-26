-- https://lua.expert/
local t = {}
game:GetService("ReplicatedStorage")
local v1 = shared.GBMod("GetRemote")
local v2 = shared.GBMod("Signal")
local v3 = shared.GBMod("SignalConnection")
local v4 = v1("Function", "Get")
local v5 = v1("Event", "ConfigChanged")
local v6 = v2.new()
local v7 = v2.new()
local t2 = {}
local v8 = false
local function v9(p1) --[[ DeepCopy | Line: 45 | Upvalues: v9 (copy) ]]
	local t = {}
	for k, v in pairs(p1) do
		if type(v) == "table" then
			t[k] = v9(v)
			continue
		end
		t[k] = v
	end
	return t
end
function t.WaitForConfigsReady(p1) --[[ WaitForConfigsReady | Line: 59 | Upvalues: v8 (ref), v7 (copy) ]]
	if v8 then
		return
	end
	v7:Wait()
end
function t.Get(p1, p2, p3) --[[ Get | Line: 65 | Upvalues: t2 (ref) ]]
	if typeof(p2) ~= "table" and typeof(p2) ~= "string" then
		error("Config path must be a string or list of strings.")
	end
	p1:WaitForConfigsReady()
	if typeof(p2) == "string" then
		p2 = { p2 }
	end
	local v1 = if p3 then p3 else t2
	for v2, v3 in p2 do
		v1 = v1[v3]
		if v1 == nil then
			return nil
		end
	end
	return v1
end
function t.OnChanged(p1, p2, p3) --[[ OnChanged | Line: 89 | Upvalues: v6 (copy) ]]
	if type(p2) == "string" then
		p2 = { p2 }
	end
	return v6:Connect(function(p12, p22) --[[ Line: 94 | Upvalues: p2 (ref), p3 (copy), p1 (copy) ]]
		for v1, v2 in p12 do
			local v3 = true
			for v4, v5 in p2 do
				if v2.path[v4] == nil then
					break
				end
				if v2.path[v4] ~= v5 then
					v3 = false
					break
				end
			end
			if v3 then
				p3(p1:Get(p2), p1:Get(p2, p22))
				return
			end
		end
	end)
end
function t.OnReady(p1, p2) --[[ OnReady | Line: 114 | Upvalues: v8 (ref), t2 (ref), v3 (copy), v7 (copy) ]]
	if v8 then
		task.spawn(p2, t2)
		return v3.new()
	else
		return v7:Once(function() --[[ Line: 120 | Upvalues: p2 (copy), t2 (ref) ]]
			p2(t2)
		end)
	end
end
function t.IsReady(p1) --[[ IsReady | Line: 125 | Upvalues: v8 (ref) ]]
	return v8
end
function t.Init(p1) --[[ Init | Line: 130 | Upvalues: v5 (copy), v8 (ref), v9 (copy), t2 (ref), v6 (copy), v4 (copy), v7 (copy) ]]
	v5.OnClientEvent:Connect(function(p1) --[[ Line: 131 | Upvalues: v8 (ref), v9 (ref), t2 (ref), v6 (ref) ]]
		if not v8 then
			return
		end
		local v1 = v9(t2)
		for v2, v3 in p1 do
			local v4 = t2
			for v5, v62 in v3.path do
				if v5 == #v3.path then
					v4[v62] = v3.newValue
					continue
				end
				v4 = v4[v62]
			end
		end
		v6:Fire(p1, v1)
	end)
	task.spawn(function() --[[ Line: 150 | Upvalues: t2 (ref), v4 (ref), v8 (ref), v7 (ref) ]]
		t2 = v4:InvokeServer()
		v8 = true
		v7:Fire(t2)
	end)
end
return t