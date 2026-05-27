-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("State")
local v3 = RunService:IsStudio() and true
local function f4() --[[ Line: 17 ]] end
function t.stateToProperty(p1) --[[ stateToProperty | Line: 20 | Upvalues: v3 (copy) ]]
	local v1 = debug.traceback()
	local Property = p1.Property
	local v32 = nil or p1.Instances or {}
	if p1.Instance and not table.find(v32, p1.Instance) then
		table.insert(v32, p1.Instance)
	end
	return p1.State:subscribe(function(p12) --[[ Line: 32 | Upvalues: p1 (copy), v3 (ref), v32 (ref), Property (copy), v1 (copy) ]]
		local v12 = p12
		if typeof(p1.Transform) == "function" then
			v12 = p1.Transform(v12)
		end
		if v3 then
			local v2 = select(-1, pcall(function() --[[ Line: 40 | Upvalues: v32 (ref), Property (ref), v12 (ref) ]]
				for v1, v2 in v32 do
					v2[Property] = v12
				end
			end))
			if typeof(v2) == "string" then
				warn((("%*:"):format(v2)))
				warn(("\t%* -> %*"):format(p12, v12), p1)
				warn(v1)
			end
		else
			for v33, v4 in v32 do
				v4[Property] = v12
			end
		end
	end)
end
function t.subscribeToSignals(p1) --[[ subscribeToSignals | Line: 62 | Upvalues: f4 (copy), v1 (copy), v2 (copy) ]]
	local v22 = p1 or {}
	v22.Callback = v22.Callback or f4
	v22.Signals = v22.Signals or {}
	v22._maid = v1.new()
	v22._state = v22._maid:GiveTask(v2.new(0))
	v22._thread = nil
	for v5, v6 in v22.Signals do
		v22._maid:GiveTask(v6:Connect(function() --[[ Line: 73 | Upvalues: v22 (ref) ]]
			if v22._thread then
				task.cancel(v22._thread)
			end
			v22._thread = task.defer(function() --[[ Line: 78 | Upvalues: v22 (ref) ]]
				v22._state:set(v22._state:get() + 1)
			end)
		end))
	end
	v22._maid:GiveTask(v22._state:subscribe(function() --[[ Line: 84 | Upvalues: v22 (ref) ]]
		v22.Callback()
	end))
	function v22.Destroy() --[[ Line: 88 | Upvalues: v22 (ref) ]]
		v22._maid:Destroy()
		table.clear(v22)
	end
	return v22
end
return t